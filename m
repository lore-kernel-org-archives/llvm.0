Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09BB5386
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 20:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F2AC3411C;
	Wed,  6 Jul 2022 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657139424;
	bh=+bxEZYRjwCtdjQxlGCPZhasZxgspOrKS4aucMwd9zXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7QXGv/2N8Smvz3C+Mf2o9JIBlzd9nokuL/p0cCAQbvYQORQ1Yx9gTMXyNnBEiYSb
	 Vm/2OCv1W1ptjpn49guZfhuR38fOb0onjFnYB5S0yZLfheZeWAfh92g5rrTByZYiqB
	 5ABeRnIgauO2rw19gf6UjL0J+a5v/hDRcshn2X2RkhOhmwhtWO1I8H6BBQ8cl3CoVV
	 ufSDq7kZzCqGfvYso0R/xhKNNvbhq2zWvjIyBIoJxEPNd3WDTkbv+U8O5o/V0Iis4t
	 w2hXm+CgvhJLy6q+r5DCLHkyHHUeTbl/ukFpXRorZPpruYh7zEf3Y1XFkz3rmgjPWn
	 +rraPHksubWGg==
Date: Wed, 6 Jul 2022 13:30:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Stylon Wang <stylon.wang@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
	"Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	Qingqing Zhuo <qingqing.zhuo@amd.com>, llvm@lists.linux.dev,
	Roman Li <roman.li@amd.com>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Solomon Chiu <solomon.chiu@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
	Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	"Kotarac, Pavle" <pavle.kotarac@amd.com>,
	Wayne Lin <wayne.lin@amd.com>, Jun Lei <Jun.Lei@amd.com>,
	"Wentland, Harry" <Harry.Wentland@amd.com>,
	"Gutierrez, Agustin" <agustin.gutierrez@amd.com>,
	"Mahfooz, Hamza" <hamza.mahfooz@amd.com>
Subject: Re: [PATCH 02/40] drm/amd/display: Add SubVP required code
Message-ID: <YsXw3a1LP++ESlw/@dev-arch.thelio-3990X>
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
 <20220630191322.909650-3-Rodrigo.Siqueira@amd.com>
 <YsXNPayfiUGS67i0@dev-arch.thelio-3990X>
 <CADnq5_OO0m2jP_2EpOfmULM+s-WeWt3ND_Xt+yAOku669rf6pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_OO0m2jP_2EpOfmULM+s-WeWt3ND_Xt+yAOku669rf6pA@mail.gmail.com>

On Wed, Jul 06, 2022 at 03:38:57PM -0400, Alex Deucher wrote:
> On Wed, Jul 6, 2022 at 1:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Jun 30, 2022 at 03:12:44PM -0400, Rodrigo Siqueira wrote:
> > > From: Alvin Lee <Alvin.Lee2@amd.com>
> > >
> > > This commit enables the SubVP feature. To achieve that, we need to:
> > >
> > > - Don't force p-state disallow on SubVP (can't block dummy p-state)
> > > - Send calculated watermark to DMCUB for SubVP
> > > - Adjust CAB mode message to PMFW
> > > - Add a proper locking sequence for SubVP
> > > - Various fixes to SubVP static analysis and determining SubVP config
> > > - Currently SubVP not supported with pipe split so merge all pipes
> > >   before setting up SubVp
> > >
> > > Reviewed-by: Jun Lei <Jun.Lei@amd.com>
> > > Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > Acked-by: Alan Liu <HaoPing.Liu@amd.com>
> > > Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
> >
> > This patch is now in linux-next as commit 85f4bc0c333c
> > ("drm/amd/display: Add SubVP required code"), where it causes build
> > failures when building for arm64 with both Clang and GCC (see bisect log
> > below).
> >
> > Clang shows errors during modpost:
> >
> > ERROR: modpost: "__floatunsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__divdf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "fma" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__adddf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__fixdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__muldf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__floatsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "__fixunsdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >
> 
> I think the attached patch may fix this.

Indeed, I tested both arm64 and riscv:

Tested-by: Nathan Chancellor <nathan@kernel.org>

> > GCC shows errors along the lines of:
> >
> > In function 'populate_subvp_cmd_pipe_info',
> >     inlined from 'dc_dmub_setup_subvp_dmub_command' at /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:675:5:
> > /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:91: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
> >   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
> >       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
> >   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:604:63: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
> >   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
> >       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> > /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:602:72: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
> >   602 |         pipe_data->pipe_config.subvp_data.prefetch_to_mall_start_lines =
> >       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
> >   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   605 |                         (double)phantom_timing->h_total;
> >       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > I initially reproduced this with Fedora's configuration [1] but it
> > appears that allmodconfig should show it as well. Our CI also shows
> > problems for ARCH=riscv allmodconfig [2].
> >
> > I am happy to test patches as necessary.
> >
> > [1]: https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-aarch64-fedora.config
> > [2]: https://builds.tuxbuild.com/2BZS5HPSuDdoMFw6mxjG2ZmT441/build.log
> >
> > Cheers,
> > Nathan
> >
> > # bad: [088b9c375534d905a4d337c78db3b3bfbb52c4a0] Add linux-next specific files for 20220706
> > # good: [e35e5b6f695d241ffb1d223207da58a1fbcdff4b] Merge tag 'xsa-5.19-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
> > git bisect start '088b9c375534d905a4d337c78db3b3bfbb52c4a0' 'e35e5b6f695d241ffb1d223207da58a1fbcdff4b'
> > # good: [1a4255ede07a967e57115b54da5bd4b571d22a8c] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm/drm-misc
> > git bisect good 1a4255ede07a967e57115b54da5bd4b571d22a8c
> > # bad: [756b44529e2ab179e4dd6f6358b5c351e1bbe5d3] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> > git bisect bad 756b44529e2ab179e4dd6f6358b5c351e1bbe5d3
> > # bad: [f26873a2fc786251765db3e0ced8e1424b862059] next-20220705/sound-asoc
> > git bisect bad f26873a2fc786251765db3e0ced8e1424b862059
> > # good: [fc34ece41f7183d522d15dc4189d8df6e8e23737] ASoC: Refactor non_legacy_dai_naming flag
> > git bisect good fc34ece41f7183d522d15dc4189d8df6e8e23737
> > # good: [3d313f09f31490cec9d5251b59adeb6542c944cc] drm/fourcc: fix integer type usage in uapi header
> > git bisect good 3d313f09f31490cec9d5251b59adeb6542c944cc
> > # bad: [a41afb357f09cde0714db9d590458c7bb6d90ca2] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm-intel
> > git bisect bad a41afb357f09cde0714db9d590458c7bb6d90ca2
> > # bad: [88ef4c5bb36bf60b317b74d8652c7766c9272a7e] drm/amd/display: Apply ODM 2:1 policy for single display configuration
> > git bisect bad 88ef4c5bb36bf60b317b74d8652c7766c9272a7e
> > # good: [ff15cea338d2c78e0086d55c8a9dd637a5dd3ccc] drm/amd/display: expose additional modifier for DCN32/321
> > git bisect good ff15cea338d2c78e0086d55c8a9dd637a5dd3ccc
> > # good: [414e9f520e897818302a6b1729aa2dad8cc928ca] drm/amdkfd: Asynchronously free smi_client
> > git bisect good 414e9f520e897818302a6b1729aa2dad8cc928ca
> > # good: [4bdb9d6501763e83bacbf26846754c567773a1fb] drm/amdkfd: simplify vm_validate_pt_pd_bos
> > git bisect good 4bdb9d6501763e83bacbf26846754c567773a1fb
> > # good: [e72f03f4bdc4f3a251343cf343bce28c28cbac2a] drm/amd/display: Add missing registers for ACP
> > git bisect good e72f03f4bdc4f3a251343cf343bce28c28cbac2a
> > # bad: [90f33674a0756a6f0907b8f6350cec3f7be4032c] drm/amd/display: Prepare for new interfaces
> > git bisect bad 90f33674a0756a6f0907b8f6350cec3f7be4032c
> > # bad: [85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1] drm/amd/display: Add SubVP required code
> > git bisect bad 85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1
> > # first bad commit: [85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1] drm/amd/display: Add SubVP required code

> From 78730be1522677752ab26f57d6f8c68b96d3966e Mon Sep 17 00:00:00 2001
> From: Alex Deucher <alexander.deucher@amd.com>
> Date: Wed, 6 Jul 2022 15:33:01 -0400
> Subject: [PATCH] drm/amd/display: fix non-x86/PPC64 compilation
> 
> Need to protect FP DMCUB code with CONFIG_DRM_AMD_DC_DCN.
> Fixes build failures like the following on arm64:
> ERROR: modpost: "__floatunsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__divdf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "fma" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__adddf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__fixdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__muldf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__floatsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__fixunsdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> 
> Fixes: 85f4bc0c333c ("drm/amd/display: Add SubVP required code")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 2 ++
>  drivers/gpu/drm/amd/display/dc/dcn32/Makefile | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index 6a25d64dd15c..6b446ae9e91f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -370,6 +370,7 @@ void dc_dmub_srv_query_caps_cmd(struct dmub_srv *dmub)
>  	}
>  }
>  
> +#ifdef CONFIG_DRM_AMD_DC_DCN
>  /**
>   * ***********************************************************************************************
>   * populate_subvp_cmd_drr_info: Helper to populate DRR pipe info for the DMCUB subvp command
> @@ -698,6 +699,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
>  	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
>  	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
>  }
> +#endif
>  
>  bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmub_diagnostic_data *diag_data)
>  {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/Makefile b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
> index fe29725b4c06..932d85fa4262 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
> @@ -27,7 +27,6 @@ ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
>  endif
> -dcn32_ccflags += -mhard-float
>  endif
>  
>  ifdef CONFIG_X86
> -- 
> 2.35.3
> 

