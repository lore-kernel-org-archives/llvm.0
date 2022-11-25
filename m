Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549733E4
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 13:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DFAC433C1;
	Fri, 25 Nov 2022 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669383631;
	bh=1Vi9cYPQdsFlwN2CupqS3SDHphAahEkfEFQ47zI6WhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDp9FDBQ2WGmmAcEkiW2GHNzyxAljeKVhmaOAfdahPkFsZNnZiasCvP1PntCi4W3e
	 GdEz0mFYBRPy29WZVxfhOBAawsChZgsLOoIHfTYwMmbtZgGsChvUcST6MfaW/s71Vo
	 KPJQ3//yg32O0vdIclPMxYCXM+ljCguSNfdSwUXYNjOmf+qT6NHGo5PyWc3UREuH0i
	 yrNz5x8nhfPJBgCw34SrK4K9MvyJBb1fzwr60V9x2oKu7nn4A13dTR9IDNT0yE8v2c
	 JKWdqpz1CGd8tfrzaFv9GQFw9/2u6iBVY2eFAHDM3ewlUT63r2qYYtKupXIZC0FjC9
	 WeArEEzwpq4eA==
Date: Fri, 25 Nov 2022 13:40:23 +0000
From: Lee Jones <lee@kernel.org>
To: arnd@arndb.de, akpm@linux-foundation.org, nathan@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ndesaulniers@google.com, trix@redhat.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] Kconfig.debug: Provide a little extra FRAME_WARN
 leeway when KASAN is enabled
Message-ID: <Y4DFx20YXDLcuVJm@google.com>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-3-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125120750.3537134-3-lee@kernel.org>

On Fri, 25 Nov 2022, Lee Jones wrote:

> When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
> few over the current threshold.  This can mainly be seen on 32-bit
> architectures where the present limit (when !GCC) is a lowly
> 1024-Bytes.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  lib/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index c3c0b077ade33..82d475168db95 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -399,6 +399,7 @@ config FRAME_WARN
>  	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>  	default 2048 if PARISC
>  	default 1536 if (!64BIT && XTENSA)
> +	default 1280 if KASAN && !64BIT
>  	default 1024 if !64BIT
>  	default 2048 if 64BIT
>  	help

Note this also fixes 61 warnings when

  (GCC && !GCC_PLUGIN_LATENT_ENTROPY)

... which as Arnd says should not be enabled by default.  We'll
address that issue once this set has been applied.

-- 
Lee Jones [李琼斯]
