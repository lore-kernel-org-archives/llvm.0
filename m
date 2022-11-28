Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C2362
	for <llvm@lists.linux.dev>; Mon, 28 Nov 2022 05:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C737C433D7;
	Mon, 28 Nov 2022 05:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669614761;
	bh=g/RZ0UhEagBW/SLujAuSB8moyipptP+kazhRSA5O92w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaqVi0WCpcHqQW20yxVpj190d2mF0Bx2TQh7ApUO3RDT4RBc/TumLBFkhJDIbQc53
	 poUsRkAgy8YdLo0bO+6KrAp0DIg2UHWrwo1HJwWwwF2lLsQVmWPHEEQ80vih2+4+Pr
	 V8cuVibYhxPM/AZsuBTk71P6PLjFBlMEUJNx5hcqQ1NlfMKs5EFawWnyDGmOtpBd6j
	 vOJmoU+aH1I2So0Bfs7VXOWG4hnY+S1vud8gd0x5c0TYTm4NTIz82sLHWqXIxOBBQk
	 0RSZkEj2T1oWatsH0yiwpQuXdzYn+znbNiAzpZrjCxxt2QSmG6ydeFj59vF0yQSDZL
	 Zt+iW832vcWRg==
Date: Sun, 27 Nov 2022 22:52:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: arnd@arndb.de, akpm@linux-foundation.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ndesaulniers@google.com, trix@redhat.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Temporarily disable broken Clang
 builds due to blown stack-frame
Message-ID: <Y4RMphf6BUGLA5B6@dev-arch.thelio-3990X>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-2-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125120750.3537134-2-lee@kernel.org>

On Fri, Nov 25, 2022 at 12:07:49PM +0000, Lee Jones wrote:
> calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
> architectures built with Clang (all released versions), whereby the stack
> frame gets blown up to well over 5k.  This would cause an immediate kernel
> panic on most architectures.  We'll revert this when the following bug report
> has been resolved: https://github.com/llvm/llvm-project/issues/41896.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 6925e0280dbe6..f4f3d2665a6b2 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -5,6 +5,7 @@ menu "Display Engine Configuration"
>  config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
> +	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128)
>  	help
> @@ -12,6 +13,12 @@ config DRM_AMD_DC
>  	  support for AMDGPU. This adds required support for Vega and
>  	  Raven ASICs.
>  
> +	  calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
> +	  architectures built with Clang (all released versions), whereby the stack
> +	  frame gets blown up to well over 5k.  This would cause an immediate kernel
> +	  panic on most architectures.  We'll revert this when the following bug report
> +	  has been resolved: https://github.com/llvm/llvm-project/issues/41896.
> +
>  config DRM_AMD_DC_DCN
>  	def_bool n
>  	help
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
