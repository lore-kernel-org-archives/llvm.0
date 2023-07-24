Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11518F4F9
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690220136; x=1721756136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kwYTilEARt1N1V34eJr55Ya9rMistbgI1FoRnG+ZV2g=;
  b=fISFQokiIRjHyVG3+HAisX4Sn2BGOnAB6Vbu+sH+FfmwQ9RQjwpdJSgT
   fVRpeShfhKE/Ukd3hTUPHdEdW86L1OsrT5en0PtoxnyHkyGM/5sOt4wHt
   DWG6a1gs9S/iHxua8nA4sRO9Z+VpczhvD3eFw8lQ9e5WG84Di6KPy5zzy
   t5QViXAlHSROy3/lrse2M5ButOGH2QfiIgWAhafujzT5oEMnXhzu93ohI
   4m6qUxXgNEkvi9YTMM2joDDttCOdfx/DaGdFH4+JGu3jhqW9/SthcL1IS
   dQuXe5bO3iEIC09EZq7O9Pwy/I4z9jK0OsxdSZvnBP8Yw69yS/T8ls1xT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371107574"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="371107574"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791042033"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="791042033"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.34.175])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:35:31 -0700
Date: Mon, 24 Jul 2023 19:35:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Su Hui <suhui@nfschina.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, andrzej.hajda@intel.com,
	intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mripard@kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <ZL62X3/CnsJcWWU4@ashyti-mobl2.lan>
References: <20230718013216.495830-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718013216.495830-1-suhui@nfschina.com>

On Tue, Jul 18, 2023 at 09:32:17AM +0800, Su Hui wrote:
> Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
> line 991, column 22 Division by zero.
> Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
> then division by zero will happen.
> 
> Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/i915/display/intel_tv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> index 36b479b46b60..f59553f7c132 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -988,7 +988,7 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
>  		      const struct tv_mode *tv_mode,
>  		      int clock)
>  {
> -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
> +	mode->clock = clock / tv_mode->oversample << !tv_mode->progressive;

but this does not provide the same value. Try with:

	8 / (2 >> 1)

and

	8 / 2 << 1

They are definitely different.

The real check could be:

	if (!(tv_mode->oversample >> 1))
		return ...

But first I would check if that's actually possible.

Andi
