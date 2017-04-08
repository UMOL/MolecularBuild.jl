macro debug(expression)
    return :(@assert $expression)
    # return nothing
end
