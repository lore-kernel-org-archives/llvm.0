Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017E15A9
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 05:40:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so48660655e9.0
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689658802; x=1692250802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
        b=yAiQg4/G4RZgC98nQfxJHmKg1a07ypHkoXSBOBhHi1hQ4suNxn7ew76iCJ45pHI1A7
         w/+G2qEoTK7/GFWcwVSCi00Ns6k4G91AkX8NyBz0sElNy5kvRJ3Zy8PGGTBqAFrTNctm
         V0w74PGnD5+NCu5Lx9mviu8j0u18uwOm0EJ6nBenp1W6UODxunP89A9MPnulhHAU34Jq
         aay2smoz0ZSOgSCGP9/56o/qDvj3f/8U3cxzsG1NwQ/loDMc9pQXbT3qIlPPpSk7bJP8
         kYY9L28x3s3tgAWhEaqmedGoiuZKrYgnCJYswjcXnCu6/Iz4n3OWFVUb3E0DVBZWcz6g
         c7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689658802; x=1692250802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
        b=Vktru6UNpT4anF/+5ag8EQVI8QDlwDLsyqkwlPnyIaPE8XLqTsin/X+kQatsjR2NMd
         4cEbNrnwIXrbjj9wDHXXG3S5A6NtPByEmSxEaSmRsL7XRjc9l6jH0Crs3VT3YC5rtn2v
         B8cI/VU0JqrpC/J6FAjZLeFgmX0vrzJVsTIl0LVXwQRqbrnfcFZnNN/FWGFfX2IXt4E1
         06L1skvAl9ezcsM8qlGk2HJq3NWWLxz3kC+fzfyfshruq0M6KRA4BUj2O87pm8nMepkH
         BIK5we59ZrG5wGBN8PNjT3YTb9/cw0++/ufPmPlnsTEyiJxlmBRXafxC57u78abuPWGo
         mizA==
X-Gm-Message-State: ABy/qLbSsPjxyqCwBhEUGwuyWBjYoMH58S+86pv3+lxGjZrrZNAoQKj3
	e1+iTDuM2pBD7kjpbKrh0zPFEQ==
X-Google-Smtp-Source: APBJJlFBbKZc1gO7M8n+dJxiTS+4YHzjapaWo98VW7MNkFMR1mz0AnzM9LtEYi+Sck8117UetH7LZw==
X-Received: by 2002:a05:600c:a388:b0:3f8:f382:8e1f with SMTP id hn8-20020a05600ca38800b003f8f3828e1fmr1001451wmb.24.1689658802067;
        Mon, 17 Jul 2023 22:40:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b003fc0062f0f8sm1253235wmq.9.2023.07.17.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 22:39:59 -0700 (PDT)
Date: Tue, 18 Jul 2023 08:39:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Su Hui <suhui@nfschina.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	ville.syrjala@linux.intel.com, mripard@kernel.org,
	ankit.k.nautiyal@intel.com, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
Message-ID: <d763816b-07c9-4346-8f7c-f95e86cba488@kadam.mountain>
References: <20230717062209.124106-1-suhui@nfschina.com>
 <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>

On Mon, Jul 17, 2023 at 04:52:51PM +0200, Andrzej Hajda wrote:
> 
> 
> On 17.07.2023 08:22, Su Hui wrote:
> > Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
> > line 991, column 22 Division by zero.
> > Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
> > then division by zero will happen.
> > 
> > Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > index 36b479b46b60..82b54af51f23 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
> >   		      const struct tv_mode *tv_mode,
> >   		      int clock)
> >   {
> > -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
> > +	mode->clock = clock / (tv_mode->oversample != 1 ?
> > +			tv_mode->oversample >> !tv_mode->progressive : 1);
> 
> Seems too smart to me, why not just:
> mode->clock = clock / tv_mode->oversample;
> if (!tv_mode->progressive)
>     mode->clock <<= 1;

This is nice.

regards,
dan carpenter
