Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9607A362
	for <llvm@lists.linux.dev>; Mon, 28 Nov 2022 05:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51424C433C1;
	Mon, 28 Nov 2022 05:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669614795;
	bh=F1tZe3L8xlQngrBiywG/9x6CZyvGLosQ+052v73UiLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZXp6QUcDfbxUMSO99TLA5rvBfzDhBtTvqPEmLtJRDzX5BpsK1PByDxGELXhZD34l
	 Xkmp60eTC4kCxPnuAtnsYfNAjpyOYMntIW1TFynB3JYYDmrS3CvYHsRligVRbEz1x/
	 YXRimu6Okl+0xHfYiZg0HCyIdOF41Rz8Vqifr6LMjl2WpM3TZvUcQ1ARPdnwDmgMJV
	 lmuHDnWytBDKFV4LIX+4rs3yzI39R68ZgS5BRItHsrQOrtpYnfn5Ioid+aH1vrw6uP
	 PjCo2vkIhJySvNv8EVdbD7lHU+F/3dWlJ8IBQi7vZ+zthiNVfJpWAGhFy7FjQ52FoI
	 b5A/cW9yGGVYA==
Date: Sun, 27 Nov 2022 22:53:12 -0700
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
Subject: Re: [PATCH v2 2/2] Kconfig.debug: Provide a little extra FRAME_WARN
 leeway when KASAN is enabled
Message-ID: <Y4RMyAoa0+sJS9F3@dev-arch.thelio-3990X>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-3-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125120750.3537134-3-lee@kernel.org>

On Fri, Nov 25, 2022 at 12:07:50PM +0000, Lee Jones wrote:
> When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
> few over the current threshold.  This can mainly be seen on 32-bit
> architectures where the present limit (when !GCC) is a lowly
> 1024-Bytes.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

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
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
