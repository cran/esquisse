
#' Generate code to create a `ggplot2`
#'
#' @param data Character. Name of the `data.frame`.
#' @param mapping List. Named list of aesthetics.
#' @param geom Character. Name of the geom to use (with or without "geom_").
#' @param geom_args List. Arguments to use in the geom.
#' @param scales Character vector. Scale(s) to use (with or without "scale_").
#' @param scales_args List. Arguments to use in scale(s),
#'  if `scales` is length > 1, must be a named list with `scales` names.
#' @param coord Character. Coordinates to use (with or without "coord_").
#' @param coord_args Arguments for coordinates function.
#' @param labs List. Named list of labels to use for title, subtitle, x & y axis, legends.
#' @param theme Character. Name of the theme to use (with or without "theme_").
#' @param theme_args Named list. Arguments for [ggplot2::theme()].
#' @param facet Character vector. Names of variables to use in [ggplot2::facet_wrap].
#' @param facet_row Character vector. Names of row variables to use in [ggplot2::facet_grid()].
#' @param facet_col Character vector. Names of col variables to use in [ggplot2::facet_grid()].
#' @param facet_args Named list. Arguments for [ggplot2::facet_wrap()].
#' @param xlim A vector of length 2 representing limits on x-axis.
#' @param ylim A vector of length 2 representing limits on y-axis.
#'
#' @return a `call` that can be evaluated with `eval`.
#' @export
#'
#' @importFrom stats setNames
#' @importFrom rlang sym syms expr as_name is_call call2 has_length
#' @importFrom ggplot2 ggplot aes theme facet_wrap vars coord_flip labs
#'
#' @example examples/ex-ggcall.R
ggcall <- function(data = NULL,
                   mapping = NULL,
                   geom = NULL,
                   geom_args = list(),
                   scales = NULL,
                   scales_args = list(),
                   coord = NULL,
                   coord_args = list(),
                   labs = list(),
                   theme = NULL,
                   theme_args = list(),
                   facet = NULL,
                   facet_row = NULL,
                   facet_col = NULL,
                   facet_args = list(),
                   xlim = NULL,
                   ylim = NULL) {
  if (is.null(data))
    return(expr(ggplot()))
  if (!is_call(data)) {
    data <- as.character(data)
    if (grepl("::", data)) {
      data <- str2lang(data)
    } else {
      data <- sym(data)
    }
  }
  if (rlang::is_call(mapping))
    mapping <- eval(mapping)
  mapping <- dropNulls(mapping)
  if (length(mapping) > 0) {
    aes <- expr(aes(!!!syms2(mapping)))
    ggcall <- expr(ggplot(!!data) + !!aes)
  } else {
    ggcall <- expr(ggplot(!!data))
  }
  if (length(geom) == 1)
    geom_args <- list(geom_args)
  for (ig in seq_along(geom)) {
    g_nm <- geom[ig]
    if (ig <= length(geom_args)) {
      g_args <- dropNulls(geom_args[[ig]])
    } else {
      g_args <- list()
    }
    if (!grepl("^geom_", g_nm))
      g_nm <- paste0("geom_", g_nm)
    geomcall <- call2(g_nm, !!!g_args)
    ggcall <- expr(!!ggcall + !!geomcall)
  }
  if (!is.null(scales)) {
    if (length(scales) == 1 && !isTRUE(grepl(scales, names(scales_args))))
      scales_args <- setNames(list(scales_args), scales)
    scales_dup <- duplicated(scales, fromLast = TRUE)
    scales_args <- scales_args[!scales_dup]
    scales <- scales[!scales_dup]
    for (s in scales) {
      s_args <- dropNulls(scales_args[[s]])
      if (grepl("::", x = s)) {
        scl <- strsplit(x = s, split = "::")[[1]]
        scl <- call2(scl[2], !!!s_args, .ns = scl[1])
      } else {
        if (!grepl("^scale_", s))
          s <- paste0("scale_", s)
        scl <- call2(s, !!!s_args)
      }
      ggcall <- expr(!!ggcall + !!scl)
    }
  }
  labs <- dropNullsOrEmpty(labs)
  if (length(labs) > 0) {
    labs <- expr(labs(!!!labs))
    ggcall <- expr(!!ggcall + !!labs)
  }
  if (!is.null(coord)) {
    if (!grepl("^coord_", coord))
      coord <- paste0("coord_", coord)
    coord <- call2(coord, !!!coord_args)
    ggcall <- expr(!!ggcall + !!coord)
  }
  if (!is.null(theme)) {
    if (grepl("::", x = theme)) {
      theme <- strsplit(x = theme, split = "::")[[1]]
      theme <- call2(theme[2], .ns = theme[1])
    } else {
      if (!grepl("^theme_", theme))
        theme <- paste0("theme_", theme)
      theme <- call2(theme)
    }
    ggcall <- expr(!!ggcall + !!theme)
  }
  if (!any(c("fill", "colour", "color", "size", "shape") %in% names(mapping))) {
    theme_args$legend.position <- NULL
  }
  theme_args <- dropNullsOrEmpty(theme_args)
  if (length(theme_args) > 0) {
    theme_args <- call2("theme", !!!theme_args)
    ggcall <- expr(!!ggcall + !!theme_args)
  }
  if (!is.null(facet)) {
    facet_args <- dropNullsOrEmpty(facet_args)
    if (length(facet_args) > 0) {
      facet <- expr(facet_wrap(vars(!!!syms(facet)), !!!facet_args))
      ggcall <- expr(!!ggcall + !!facet)
    } else {
      facet <- expr(facet_wrap(vars(!!!syms(facet))))
      ggcall <- expr(!!ggcall + !!facet)
    }
  } else if (!is.null(facet_row) | !is.null(facet_col)) {
    facet_args$ncol <- NULL
    facet_args$nrow <- NULL
    facet_args <- dropNullsOrEmpty(facet_args)
    if (length(facet_args) > 0) {
      facet <- expr(facet_grid(vars(!!!syms(facet_row)), vars(!!!syms(facet_col)), !!!facet_args))
      ggcall <- expr(!!ggcall + !!facet)
    } else {
      facet <- expr(facet_grid(vars(!!!syms(facet_row)), vars(!!!syms(facet_col))))
      ggcall <- expr(!!ggcall + !!facet)
    }
  }

  if (has_length(xlim, 2)) {
    xlim <- expr(xlim(!!!as.list(xlim)))
    ggcall <- expr(!!ggcall + !!xlim)
  }
  if (has_length(ylim, 2)) {
    ylim <- expr(ylim(!!!as.list(ylim)))
    ggcall <- expr(!!ggcall + !!ylim)
  }

  ggcall
}


syms2 <- function(x) {
  lapply(
    X = x,
    FUN = function(y) {
      if (inherits(y, "AsIs")) {
        as.character(y)
      } else {
        sym(as_name(y))
      }
    }
  )
}

