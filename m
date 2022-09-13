Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3776AA5
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 23:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD805C433C1;
	Tue, 13 Sep 2022 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663111151;
	bh=6khS5XPU33uH8kkng189ibUp6LbN758Z6u5O1YtiFGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkBVk6Oj0bb1wf0nvQXq3/tf9PvLhEyyK6fPNyUDl2itwvz1JtSpSvWCdE+T03FbG
	 ivmD9Hf/JFIp4Ek9eSUvcendL7CvbrBidPmGhUlsQUMP/9U3o6KWXGNLed/XewuQE1
	 PEnYfLS77abuxruBI5fi3T7/ylzY7NxK+qxch/NRHuoubzOrFALyA7FF1JpgdNIsWd
	 HMQGT79k4SsA0Ail2gUjxdLi83kTmzkhhupBtQZoGblQrcEM0lti9KkB8K93wLWFwh
	 e18zCvBnSrBlxNl8l8rAyUSB4AiBnr1z2nMdCdSv9wJxalnPTti55tXmvnz8gyEcMu
	 EEK5rQrIag/5Q==
Date: Tue, 13 Sep 2022 16:19:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Matt Roper <matthew.d.roper@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix return type of mode_valid function hook
Message-ID: <YyEP7W/yZAyhNtTX@dev-arch.thelio-3990X>
References: <20220913205531.155046-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913205531.155046-1-nhuck@google.com>

On Tue, Sep 13, 2022 at 01:55:27PM -0700, Nathan Huckleberry wrote:
> All of the functions used for intel_dvo_dev_ops.mode_valid have a return
> type of enum drm_mode_status, but the mode_valid field in the struct
> definition has a return type of int.
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definitions do not match the function hook definition.
> 
> The return type of the mode_valid field should be changed from int to
> enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> index d96c3cc46e50..50205f064d93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> @@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
>  	 *
>  	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
>  	 */
> -	int (*mode_valid)(struct intel_dvo_device *dvo,
> -			  struct drm_display_mode *mode);
> +	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
> +					   struct drm_display_mode *mode);
>  
>  	/*
>  	 * Callback for preparing mode changes on an output
> -- 
> 2.37.2.789.g6183377224-goog
> 
