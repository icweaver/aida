### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ bed00d4e-9fb8-11ed-0656-47d6e925a240
begin
	import Pkg
	Pkg.activate(Base.current_project())
	
	using AstroImages, PlutoUI, PythonCall
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
# FFTW Test
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
	Seems to be a known bug: <https://github.com/pyFFTW/pyFFTW/issues/294>
"""

# ╔═╡ cb066498-91c0-41c5-b760-35243d10577c
TableOfContents()

# ╔═╡ Cell order:
# ╟─0900210a-1c2b-43b3-93f1-1b466d850db2
# ╠═96cf69f9-6820-4789-94bc-994a371da371
# ╠═8d670e8a-eaee-4b09-ad32-733a94ba04e3
# ╟─7ea294e9-b434-4eae-b41b-cd6b9ec8426f
# ╟─648532d9-bc2c-4046-ba57-2026770342d8
# ╠═bed00d4e-9fb8-11ed-0656-47d6e925a240
# ╟─cb066498-91c0-41c5-b760-35243d10577c
