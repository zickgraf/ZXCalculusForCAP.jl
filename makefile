.PHONY: test

gen:
	gap_to_julia ZXCalculusForCAP

test:
	julia -e 'using Pkg; Pkg.test("ZXCalculusForCAP");'
