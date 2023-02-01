### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ bed00d4e-9fb8-11ed-0656-47d6e925a240
begin
	import Pkg
	Pkg.activate(Base.current_project())
	
	using AstroImages, PlutoUI, PythonCall, Statistics
end

# ╔═╡ 0900210a-1c2b-43b3-93f1-1b466d850db2
md"""
AIDA: <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3166524/pdf/nihms314800.pdf>

MISTRAL: <https://www.semanticscholar.org/paper/MISTRAL%3A-a-myopic-edge-preserving-image-restoration-Mugnier-Fusco/303742fa8c43d6c70d6c9686fc0ddc6b6686e886>

Deconvolution library: <https://juliadsp.org/Deconvolution.jl/stable/>

Conjugate gradient solver <https://iterativesolvers.julialinearalgebra.org/dev/linear_systems/cg/>
"""

# ╔═╡ 96cf69f9-6820-4789-94bc-994a371da371
md"""
## FFTW Test
"""

# ╔═╡ 8d670e8a-eaee-4b09-ad32-733a94ba04e3
@py begin
	import numpy as np
	import pyfftw
end

# ╔═╡ 7ea294e9-b434-4eae-b41b-cd6b9ec8426f
let
	# AIDA_Functions.py +108
	a_ = np.zeros(dtype=np.float64, 8)
	a_[0] = 1
	
	# Should all be ones
	pyfftw.interfaces.numpy_fft.rfftn(a_).real
end

# ╔═╡ 648532d9-bc2c-4046-ba57-2026770342d8
md"""
!!! note
	There seems to be a [known bug](https://github.com/pyFFTW/pyFFTW/issues/294) in `pyfftw=0.13` which throws the following runtime error:

	```
	RuntimeError: Undefined plan with nthreads. This is a bug
	Exception ignored in: 'pyfftw.pyfftw._fftw_plan_with_nthreads_null'
	Traceback (most recent call last):
	  File "/home/mango/Projects/aida/.CondaPkg/env/lib/python3.11/site-packages/pyfftw/builders/_utils.py", line 285, in _Xfftn
	RuntimeError: Undefined plan with nthreads. This is a bug
	```

	so just using `pyfftw=0.12` for now until this is resolved upstream.
"""

# ╔═╡ edfe800f-f156-4dbc-9825-dfb87e4c26a2
md"""
## `AGF.LoadFile`
"""

# ╔═╡ d5335431-afa0-4fb9-aa84-0048a974c4f7
img = load("TitanImages/titanhe_153_IF_scaled.fits")

# ╔═╡ f907742a-260a-41c6-94a0-36a980e9f760
size(img)

# ╔═╡ 49354d4c-9089-4ccc-9dd7-32054e9b69ac
img.header

# ╔═╡ 88226602-93fb-492f-922b-816901c3476c
img.data

# ╔═╡ 8fdfe6a8-3bad-4bad-bfd7-b712d08ef772
mean(img.data)

# ╔═╡ 19e8eb28-a0ff-4e51-a2f7-7077d8266c45
md"""
## `AGF.ImageNoiseWeights`
"""

# ╔═╡ 6d5defe6-2cb6-4c7f-b68c-c9216ab1abb0
let
	baseline = 0.0

	neg_pixels = @views(img[img .≤ baseline]) .- baseline

	mean_neg_pixels = mean(neg_pixels)

	sigma_det2 = 0.5 * π * (mean_neg_pixels * mean_neg_pixels)

	sigma_photon = max.(img .- baseline, 0)

	w = sigma_det2 .+ sigma_photon

	1.0 ./ w.data, sqrt(sigma_det2)
end

# ╔═╡ d9956838-cacf-4cbd-beae-7783023d6121
md"""
## Packages 📦
"""

# ╔═╡ cb066498-91c0-41c5-b760-35243d10577c
TableOfContents()

# ╔═╡ Cell order:
# ╟─0900210a-1c2b-43b3-93f1-1b466d850db2
# ╟─96cf69f9-6820-4789-94bc-994a371da371
# ╠═8d670e8a-eaee-4b09-ad32-733a94ba04e3
# ╠═7ea294e9-b434-4eae-b41b-cd6b9ec8426f
# ╟─648532d9-bc2c-4046-ba57-2026770342d8
# ╟─edfe800f-f156-4dbc-9825-dfb87e4c26a2
# ╠═d5335431-afa0-4fb9-aa84-0048a974c4f7
# ╠═f907742a-260a-41c6-94a0-36a980e9f760
# ╠═49354d4c-9089-4ccc-9dd7-32054e9b69ac
# ╠═88226602-93fb-492f-922b-816901c3476c
# ╠═8fdfe6a8-3bad-4bad-bfd7-b712d08ef772
# ╟─19e8eb28-a0ff-4e51-a2f7-7077d8266c45
# ╠═6d5defe6-2cb6-4c7f-b68c-c9216ab1abb0
# ╟─d9956838-cacf-4cbd-beae-7783023d6121
# ╠═bed00d4e-9fb8-11ed-0656-47d6e925a240
# ╟─cb066498-91c0-41c5-b760-35243d10577c
