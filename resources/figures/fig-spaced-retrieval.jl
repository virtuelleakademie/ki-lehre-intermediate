using CairoMakie, AlgebraOfGraphics, DataFrames

brand_accent = colorant"#9A4665"
brand_gold = colorant"#D4A03E"

abruf_wochen = Dict(
    "Thema A" => (1, [2, 4, 8, 12]),
    "Thema B" => (2, [3, 5, 9, 12]),
    "Thema C" => (3, [4, 6, 10, 12]),
)

schedule = vcat([
    DataFrame(
        thema = thema,
        woche = [start; wochen],
        typ   = ["Vermitteln"; fill("Abrufen", length(wochen))]
    )
    for (thema, (start, wochen)) in abruf_wochen
]...)

plt = data(schedule) *
    mapping(:woche, :thema; color = :typ, marker = :typ) *
    visual(Scatter; markersize = 18, strokewidth = 1)

s = scales(
    Color = (; palette = [brand_accent, brand_gold]),
    Marker = (; palette = [:rect, :circle])
)

draw(plt, s;
    axis = (
        xlabel = "Woche",
        xticks = 1:12,
        title = "Gestaffelter Abrufzeitplan",
    ),
    legend = (position = :bottom,),
    figure = (size = (800, 300),)
)
