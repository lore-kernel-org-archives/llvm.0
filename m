Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D12319CCEC
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902621; cv=none; b=aQG3hu2jRYrqvrLZkYO65tkfFfJO/FDno+GEnvXqiE1Oie8iK3UH9VO9JvUIWjPkMdHied7QB1boOQ4V3ZJIh+lQsO81j99kPX76xS54S1gpnIck/VUn3UMKylA14HWU0wtcMky0EDiYS/LTSFXaCt7fpGmb6FhZUkP7WCyXpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902621; c=relaxed/simple;
	bh=Cqg9rII/gsP90FW+z744Frr63XWLwQaWqwqr56GPE9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaVz06DeRMPU7pAuUd6akhFOPTbT0WqcQiFEMl53r55OrH6GM07LkEUOpnFaK6aejv5eqA0eagh49jKdTRg4xjgcSkmCERPljA5uKMu/l5Qjq44ExqUQXkEGR4HRvCnjU1IvNA8gOYQQYHljy0CJRhfQ7vOpAJWXfU86UaWs1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLRTi+tX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLRTi+tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C34C4CEEB;
	Mon,  2 Jun 2025 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902621;
	bh=Cqg9rII/gsP90FW+z744Frr63XWLwQaWqwqr56GPE9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLRTi+tXpqM7V4L3vxzuOCCNgeyJwH0Tn5aOpdmWDUyqsxiHl5kMRoQ80LS8wHC5y
	 KzluctgBwvmxyL3DuYnOz98oc7PpA5E2IIdvWHrkP+FAjaLSpvzuzGBnw2H+0RSUe/
	 m/+mE3yBY+agE9CJzWUljP6vGEx4s6pK1PQXW+hx7hc41joP9m/6WVbJQRF3R2Zyme
	 6aL/HfhH+k2rTXpcE0IAcFTdV3M9KnIQyAS2Zq62qUio0M0DwIc6HbC4WVvQGr5m0b
	 zteeqGdpnAR+NRDHlcRCnglB4c1+CqdEEZK4686A9ZAd1CByWZ3FWhyvtD+LKyGQHv
	 794PyAUVT+Zxg==
Date: Mon, 2 Jun 2025 15:16:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
	simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/i915/pmu: Fix build error with GCOV and AutoFDO
 enabled
Message-ID: <20250602221656.GC924363@ax162>
References: <20250529042910.2436330-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529042910.2436330-1-tzungbi@kernel.org>

On Thu, May 29, 2025 at 04:29:10AM +0000, Tzung-Bi Shih wrote:
> i915_pmu.c may fail to build with GCOV and AutoFDO enabled.
> 
> ../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
>   116 |                 BUILD_BUG_ON(bit >
>       |                 ^
> 
> Here is a way to reproduce the issue:
> $ git checkout v6.15
> $ mkdir build
> $ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
> CONFIG_DRM=y
> CONFIG_PCI=y
> CONFIG_DRM_I915=y
> 
> CONFIG_PERF_EVENTS=y
> 
> CONFIG_DEBUG_FS=y
> CONFIG_GCOV_KERNEL=y
> CONFIG_GCOV_PROFILE_ALL=y
> 
> CONFIG_AUTOFDO_CLANG=y
> EOF
> )
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>        olddefconfig
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>        CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
>        drivers/gpu/drm/i915/i915_pmu.o
> 
> Although not super sure what happened, by reviewing the code, it should
> depend on `__builtin_constant_p(bit)` directly instead of assuming
> `__builtin_constant_p(config)` makes `bit` a builtin constant.
> 
> Also fix a nit, to reuse the `bit` local variable.
> 
> Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

This seems like a reasonable fix, as it is likely that these
configurations cause config_bit() not to be inlined due to
instrumentation being added. If config_bit() is not inlined, bit will
not be known at compile time, triggering the compiletime error because
the condition cannot be proven false at that point.

Marking config_bit(), is_engine_config(), engine_config_sample(),
other_bit(), config_counter(), and config_gt_id() all as __always_inline
might resolve this as well but I cannot say if that is worth it. I guess
it depends on how often this check is likely to fire.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index e5a188ce3185..990bfaba3ce4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
>  {
>  	unsigned int bit = config_bit(config);
>  
> -	if (__builtin_constant_p(config))
> +	if (__builtin_constant_p(bit))
>  		BUILD_BUG_ON(bit >
>  			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>  							 enable)) - 1);
> @@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
>  			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>  							 enable)) - 1);
>  
> -	return BIT(config_bit(config));
> +	return BIT(bit);
>  }
>  
>  static bool is_engine_event(struct perf_event *event)
> -- 
> 2.49.0.1266.g31b7d2e469-goog
> 
> 
