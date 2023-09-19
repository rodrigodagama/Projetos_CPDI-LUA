local retangulo = display.newRect (200, 250, 50, 70)
retangulo:setFillColor(1, 0, 1)
transition.to (retangulo, {time=3500, rotation=450, yScale=8, alpha=0.5} )

local circuloAzulBranco = display.newCircle (180, 50, 30)
circuloAzulBranco:setFillColor(1, 1, 1)
transition.to (circuloAzulBranco, {time=2500, y=400, transition=easing.linear})

local circuloAzul = display.newCircle (180, 50, 30)
circuloAzul:setFillColor(0, 0, 1)
transition.to (circuloAzul, {time=2000, y=400, transition=easing.inBounce})

local circuloBrancoVermelho = display.newCircle( 100, 100, 40 )
circuloBrancoVermelho:setFillColor( 1, 1, 1 )
transition.to( circuloBrancoVermelho, { time=400, y=400, transition=easing.inOutBounce } )

local circuloRed = display.newCircle( 100, 100, 40 )
circuloRed:setFillColor( 1, 0, 0 )
transition.to( circuloRed, { time=3500, y=400, transition=easing.linear } )

local circuloBrancoVerde = display.newCircle (240, 40, 20)
circuloBrancoVerde:setFillColor(1, 1, 1)
transition.to (circuloBrancoVerde, {time=3000, y=400, transition=easing.linear})

local circuloVerde = display.newCircle (240, 40, 20)
circuloVerde:setFillColor(0, 1, 0)
transition.to (circuloVerde, {time=3000, y=400, transition=easing.inBounce})