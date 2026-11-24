Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517334;
	b=cEEHG6jAzDc7Nlm43qiy7Dw2z8q/fbB7hNWlMUI0YWJSRjUdcDNFh1s7uvekHoqHClIL
	 XFBDOuxuWMY8dBZqq7vVaSkMwKVQ5DuMhmtB/8zy53J1Xl3LxkExl+yS1JzCb0ODa5uhu
	 ZePO0hPEwEWn/UReiqEf99lJWkSMsfIxrJw08Tz2IcHhWRTdAD30zMl8B9c0FnQR9LdoQ
	 5CFuhn8Q8gQRc77A/zInycLx0+ahM+5Z3s/28MkxwdIdDrchwSJtK8jc3E3E/XatAeyG1
	 Ge0jiICVWdHphZzIhPp7rGAKTLrBoRFPwg4B4oLNtTIupD46p4rpUB16FUdv8d1v/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
	b=k/gDTDPLDHWvlP2SXBw3wRR9asHZdB/l4WezrBOPO1Og5TykdJqS+2C9eEhvaUgfc2CY
	 7tUkBxVHMuqTw4ndBAqUEGoN0/D2TTpBG4Ozx7n7/KdEoQBfWRnklJmHTWjbRHa9hI3Nh
	 seCuWb5OF9gGbyoz+1R4ow+HjS2TvTer9Cl0r6G44/rBDe5OfVt/SPlC52SKhi+TVWl98
	 38xdhTF41v4XC28agw0hicLpRE5BV9ZMsZYHbFAsMmHng+//2h20JWpG58Rv8w/cIsmDW
	 GbmCVrCtjRYkcCDG2tQtFdOeYH2nKjPAVxCAAkVUXg4mD2svWFGlWpb34ZDvKHbNFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbcdxtAW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AF606A322
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 10:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7AF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbcdxtAW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so34511715e9.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517332; x=1796122132; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=xbcdxtAW69iK/psAWXVzLMvOnF5APlI0AFCAsbNANleUbe42y0R6FF56MBpJnmZPba
         lHu/4zNTqro5EeMWVfsPT49I6oIIcMvyngB6D+t5VHIZSaJBPwThBdN3di4ZYckY/jrL
         rYlrUQ3pgKKvxEEgAJZjVmSXoO+W77fQ5XqcjiGaT0uz56pNPPHSEF7UCdNtNTmjl+9c
         R/p2gEacop2YWKJvXuh84f+OBlVbIWlJCtmElZsodOeuGgr7bmP5QVCPA2wtP6i2ty/M
         CrGa9+rqKRp6M81h2txsfxg4S36awWdLo+VCCbgc6GZR2YE941D5h/r/Cj7w4d3yUwey
         GMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517332; x=1796122132;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=zN0CuwpBck9RtSel6nAJtxfhkvybl0JqKob18xotkRaLLet7jcqMB2ZbzUbZMa6z70
         LyYdtF7EYdYsRUWSP2Cqa72E/W59snGkEjhoYwJuSaO4E8GF++yuTxa983A9b1POsol/
         5nqssMBb5fQXIT/jLaSYaB74Dyr/2Rka/1Ds21iHYP9eIrowUZ1JOWdQc/oW/t3onG90
         iJWae2c5N/mdVn8CY+VjkXZXEE5BmKUeZ8+WuPaNFLDNIKyeI5DbuhIe5giliy96OPaP
         9z+wqgulod484CPXTnEao9W4cIVWoH4DwSURSvejFcoN/sKlXtH758OHZIWDyg4yKmD7
         t9Ow==
X-Forwarded-Encrypted: i=1; AL+hErFzjxgq2beil48+/MFAxAcppok+biefAugEdZ2poxUGD1Le36jV6G8PJ55g7jo9hKiz2448@lists.linux.dev
X-Gm-Message-State: APuU4Z/cFV4VsROJvlMKeJMBk5gpU0ONIc1lJk4hd06JgwgOn6SgnKfy
	lC1h4QzlsvKaByGVzJ3y+Gk9frK8fqjd3ORO8sruzmNkYg0AiDDDi4Ck
X-Gm-Gg: AZFdTZd0nCYvjcKLWdJIIuYMXNDentw/XQMl++xeaeqc359VCcx0ydSwp0PDf7yNCWY
	sRcuKLUdGE5+Fekk2EZI5JFJ8o9UJWMJAR5JhyqF/8zKnAM9GNwEm3CmbIDUnLKb0n2s7B+Zlt7
	n+CYQKRkSQfswKInuIqthGAZ3v9txrJPF1aDAVSR0c6VtVgBaJ8PEX/ShgfJAhzPXZXUUy/vrfk
	8VI1+81uve1IC6bnjSq+75yuY5XMJ2OSIvSxUyRax9vTgqpiBhTkI6b61t3Gtp2ZKz0N+Y+Yebs
	GQ/D9kms8eK8puEprQDGpmBPc3NkSA4zm95APnLMXjox8T6DZC7AqNfN8cnOJAEABdZa+OUwbzh
	fGNK34+9CyUxhr2oZ2Bw9IwUzOgcz1ikt2Qob7m4oaCHBXxjkG6E5wp0jpG2Z/EciU9c1Iq1iRZ
	dtd6Nv4IPi+BCm+oVuyUFYcYpdCCzV2OD9sO3u8zVmZFQLKz9iNTlJpULlHI92wSvgc2ULGeWXW
	tXzEgVq+4IFxqW8gpnUj+WP4szfkwZ2Vnk8KHWFTORQ4XwZQ54tfiGaxa/MIPclLE7L+TP2+cIR
	ZTlkx5vPfSDNaV2Ikuw820TKJnedlEmPzg==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr303322955e9.6.1795517331573;
        Tue, 24 Nov 2026 02:48:51 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm585521185e9.13.2026.11.24.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:48:49 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 05/43] drm/blend: Get a rotation name from its bitfield
Date: Tue, 24 Nov 2026 11:48:33 +0100
Message-ID: <awVrWZkluWav6Jg9@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:47PM +0100, Louis Chauvet wrote:
> Extract the rotation/reflection name table and expose the
> DRM_ROTATION_FMT()/DRM_ROTATION_FMT_ARGS() helpers to print a
> human-readable rotation mask.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 19 ++++++++++---------
>  include/drm/drm_blend.h     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d17ae964fb21..b62f1db9c311 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -256,6 +256,15 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_plane_create_alpha_property);
>  
> +static const struct drm_prop_enum_list rotation_props[] = {
> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> +};
> +
>  /**
>   * drm_plane_create_rotation_property - create a new rotation property
>   * @plane: drm plane
> @@ -294,14 +303,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
>  				       unsigned int supported_rotations)
>  {
> -	static const struct drm_prop_enum_list props[] = {
> -		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> -	};
>  	struct drm_property *prop;
>  
>  	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
> @@ -309,7 +310,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> -					   props, ARRAY_SIZE(props),
> +					   rotation_props, ARRAY_SIZE(rotation_props),
>  					   supported_rotations);
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index bebbb77a8f21..f000b10a16e7 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -43,6 +43,40 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  
>  #define DRM_BLEND_ALPHA_OPAQUE		0xffff
>  
> +/**
> + * DRM_ROTATION_FMT - printf format string describing a rotation bitmask
> + *
> + * To be used together with DRM_ROTATION_FMT_ARGS(), e.g.:
> + *
> + *	seq_printf(m, "rotation=" DRM_ROTATION_FMT "\n",
> + *		   DRM_ROTATION_FMT_ARGS(state->rotation));
> + *
> + * The result names every set bit, separated by single spaces, and ends
> + * with the raw value in parentheses, e.g.:
> + *
> + *	rotate-90 reflect-x (0x00000012)
> + *
> + * The trailing raw value ensures the output is never empty and never
> + * ends with a space, even when no bit is set.
> + */
> +#define DRM_ROTATION_FMT "%s%s%s%s%s%s(0x%08x)"
> +
> +/**
> + * DRM_ROTATION_FMT_ARGS - printf arguments for DRM_ROTATION_FMT
> + * @rot: rotation bitmask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Evaluates @rot several times: only pass a variable or an expression
> + * without side effects.
> + */
> +#define DRM_ROTATION_FMT_ARGS(rot) \
> +	((rot) & DRM_MODE_ROTATE_0)   ? "rotate-0 "   : "", \
> +	((rot) & DRM_MODE_ROTATE_90)  ? "rotate-90 "  : "", \
> +	((rot) & DRM_MODE_ROTATE_180) ? "rotate-180 " : "", \
> +	((rot) & DRM_MODE_ROTATE_270) ? "rotate-270 " : "", \
> +	((rot) & DRM_MODE_REFLECT_X)  ? "reflect-x "  : "", \
> +	((rot) & DRM_MODE_REFLECT_Y)  ? "reflect-y "  : "", \
> +	(rot)
> +
>  int drm_plane_create_alpha_property(struct drm_plane *plane);
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
