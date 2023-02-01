### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ bed00d4e-9fb8-11ed-0656-47d6e925a240
begin
	import Pkg
	Pkg.activate(Base.current_project())
	
	using AstroImages
end

# ╔═╡ 0900210a-1c2b-43b3-93f1-1b466d850db2
md"""
AIDA: <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3166524/pdf/nihms314800.pdf>

MISTRAL: <https://www.semanticscholar.org/paper/MISTRAL%3A-a-myopic-edge-preserving-image-restoration-Mugnier-Fusco/303742fa8c43d6c70d6c9686fc0ddc6b6686e886>

Deconvolution library: <https://juliadsp.org/Deconvolution.jl/stable/>

Conjugate gradient solver <https://iterativesolvers.julialinearalgebra.org/dev/linear_systems/cg/>
"""

# ╔═╡ 1b7d071a-2682-4e1f-bf5b-1ef260c72270
img = load("./TitanImages/Results/myopic_Python2.5_230201_064429-myopic/Rpsf_myopic_Python2.5_064429_titanhe_153_IF_scaled.fits")

# ╔═╡ 040be4a8-023b-4ab1-97df-e4fe38d61171
img2 = load("TitanImages/Results/myopic_Python2.5_230201_064429-myopic/Robj_myopic_Python2.5_064429_titanhe_153_IF_scaled_La0p11528.fits")

# ╔═╡ Cell order:
# ╠═0900210a-1c2b-43b3-93f1-1b466d850db2
# ╠═bed00d4e-9fb8-11ed-0656-47d6e925a240
# ╠═1b7d071a-2682-4e1f-bf5b-1ef260c72270
# ╠═040be4a8-023b-4ab1-97df-e4fe38d61171
