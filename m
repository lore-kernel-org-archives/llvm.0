Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F951F606
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltwurKU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C8FC433C7;
	Tue, 17 Oct 2023 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697563353;
	bh=ldcTy7nmaNgK6Z75DboPq9fYVJTPVI4Cmp0eph9Rp08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltwurKU7VtuKw9asHVe1cFLIbWL5uWaoltF9Hn09WHcOvCrBFcKXxc8uQ5R6zTGIy
	 8bux/E6i/m5QvrG6mbkCCUaOBl8jPcuXd0mOHvWjcJjN6rU0AcWTbpnetHu5Y4L3vr
	 ZvufaP7LkkZ7dD+p23bLx/CSQEt8DYqtu9AceZW5szaITwmIp7tVoACbDv47mqlqut
	 z9JE5G0MKBhDyp+5+N/OF48hX7xriawRXy3YnOQ4q5eELeY/fBDY/PlB66/exh9upU
	 sjD7SlHCn5zZ5CvZV2e+xrssMb0cwaXr/VtPiPml26WYCoGCMDqzVl/PYgi6JeRi/3
	 KWEP7DFE8gV1Q==
Date: Tue, 17 Oct 2023 10:22:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alex Deucher <alexander.deucher@amd.com>,
	Chaitanya Dhere <chaitanya.dhere@amd.com>,
	Roman Li <roman.li@amd.com>, linux-next@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] Reduce stack size for DML2
Message-ID: <20231017172231.GA2348194@dev-arch.thelio-3990X>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>

Hi Rodrigo,

On Mon, Oct 16, 2023 at 08:19:16AM -0600, Rodrigo Siqueira wrote:
> Stephen discovers a stack size issue when compiling the latest amdgpu
> code with allmodconfig. This patchset addresses that issue by splitting
> a large function into two smaller parts.
> 
> Thanks
> Siqueira
> 
> Rodrigo Siqueira (2):
>   drm/amd/display: Reduce stack size by splitting function
>   drm/amd/display: Fix stack size issue on DML2
> 
>  .../amd/display/dc/dml2/display_mode_core.c   | 3289 +++++++++--------
>  1 file changed, 1653 insertions(+), 1636 deletions(-)
> 
> -- 
> 2.42.0
> 

This series appears in -next as commit c587ee30f376 ("drm/amd/display:
Reduce stack size by splitting function"); while it may help stack usage
for GCC, clang still suffers. All clang versions that the kernel
supports show a warning for dml_prefetch_check(), the following is with
LLVM 17.0.2 from kernel.org [1].

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6263:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
   6263 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
        |             ^

With clang 18.0.0 (tip of tree) and 15.0.7, I see:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8277:6: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
   8277 | void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struct dml_clk_cfg_st *clk_cfg)
        |      ^

For what it's worth, building with GCC 13.2.0 with a slighly lower
-Wframe-larger-than value reveals that dml_prefetch_check() is right at
the current limit and the stack usage of dml_core_mode_programming()
when built with GCC is not too far of clang's, so it seems like there
should be a more robust set of fixes, such as the ones that I have
already done for older generations of this code.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
   6705 | }
        | ^

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_core_mode_programming':
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:9893:1: error: the frame size of 1880 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
   9893 | } // dml_core_mode_programming
        | ^

41012d715d5d drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
21485d3da659 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
37934d4118e2 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
a3fef74b1d48 drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()
c4be0ac987f2 drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
25ea501ed85d drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule()
ca07f4f5a98b drm/amd/display: Reduce number of arguments of dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()

It would be really nice if these would somehow make it back to the
original sources so that we stop going through this every time a new
version of this code shows up. I thought that AMD has started testing
with clang, how were these warnings not caught before the code was
merged? If you are unable to look into these warnings, I can try to
double back to this once I look into the other fires in -next...

[1]: https://mirrors.edge.kernel.org/pub/tools/llvm/

Cheers,
Nathan
