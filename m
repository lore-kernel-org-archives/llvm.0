Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528367;
	b=fUNeYEiC600b/14/SaJvYNDYpR7XGTkhgJQkfISLtMuK+4Y7C3TGzdeg8u/ViR0RLlS7
	 D0SC6yPIIuBdnBjLWMMX7jN9STpsicYJtAMrYbVBCam1O6rcTqgVGO24VPonXNsFam8uq
	 p6Md0yYTi+loryDO4c2CkUGTmT8mBLf232xIqePNNNGfHCo4QLA2mHB6SG4ldWmnBG6JI
	 HP3J7ga/dZCXYyELfCfo/xSEcWz/8lkaHbtpO0hHYOAxamhgUMqdnE+CRZe1b8Ec4d71i
	 DWVTnxXappDPlwAnrZjdQDI1xTNO0UaMKg2WBN5nCBhNUbiwIBstMf4xc5SFvo3pRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
	b=PxIyt8JkJvH9npXLinLhnhkzZlktAQ0izMw5QOMooakVGh1xMJ6H46dOF3jgMeWFZYYe
	 3p0k4GvTHuSbFooOu0nrQJiuvLJqMI5rv9SvEzzXQ9QOnNGQRKVpOXJE/6qYsFOvgIZT7
	 YmuG5piRHOUSTx5+YWyuqYrHyV9ku5nG2jZACzXqEhnHrfvFouYrl5Dzbu5YyXtou3+M1
	 aZqqaCU5WaLUpfxYwVud4bKeo9jrGDWP3l5KTDNbtOZ+6x9PhJQl0r6MT9ep5akmrwvrh
	 Yn36CMtWdndaX3BsyuJ4ha7WV4uQLKmwg8/mmneexsSMGjltl4FioNd9CTDelpZk+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sq1apKla;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DC3606A322
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DC3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sq1apKla
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so6186715a12.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 05:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528364; x=1796133164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
        b=sq1apKlaD9iCluujiAZWFM890aqRhGkbsdWjOBCJHg51e+wsxjSHnbQWugHEVGl9/n
         UQOB0PAY5OUt4K4D9w1t5U7OaOR4BLDn3xk7fZr96CGnRYIDGV7qeoNI4GfWa/04m1OM
         YOVjIhYTi7Tg8MGpakO77+pZqyg+biZQeqX+03u54UhmFP0DKp66pJy4w3vGWcsBIbBS
         4rbn1HQRpR3tfg6CQcGBK+H0gRCE9jaaStPvhyqk+Y87/4Ol/+W8NGv3SvKUS+gtNgP8
         wFlv6QpI73HszVuRyJpKwWlC5GY742jLm57TILdf6XiIUYuFDEm3lS58klTz085cudHq
         ZrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528364; x=1796133164;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZKKQf4VXfezngqUfgj7MhmoCUm8tU6EzL5wE2W3U7c=;
        b=v20K7CFJZKQQ7RaOclHg2QouG7bx86HJsYYeb46VbB6hHXqfRiXWB+JJ51Fsr6KN2v
         LdhXVvSmD7fKFP/Ot8Zlk7fMN4V7GQkDycGmJbfgCLNoypNnvTVA68tLGJraUMT0HYoI
         iZF3WgBPnFQErgXx/WFlxswZTPnA6ogBBHlXhabAthO1mm42CR1HnR6y0hdeu3b8apvH
         1TZ6JKbLQN584XlCrkPfWbDFbH3VYzLru9hWzzPEa6JcVtSZonSaZ8rL+LBCAJlk3Bie
         NkC4ABAE8SlJixs3w7QJqmqJFIr6ac/5M9YnRfalEKRaJ+IWu5e+8teqkDY15xc3h12O
         oMAA==
X-Forwarded-Encrypted: i=1; AL+hErHUakiJzFMLRH0W/tquUEwkKEreO4K4XAEUYXwH+QErhpyyhJ05HC7cisdO40rkSTQ9aEwQ@lists.linux.dev
X-Gm-Message-State: APuU4Z91t3gEQangNRuP3ltYqSVjhu8LMg/vAi4w5cnHD9CTmacTo1c4
	uV5c4r/qr5kGkoDDx1QguyEA1q1rikijFLKIwFY24p0ILNF3WjcNJUvw
X-Gm-Gg: AZFdTZdKHc4X9vRbWzY5BmpmXAf6u+2sOY5kIKUiCEDdoLrFS+eAHPFIgxFiBFQmf4u
	HTSmdnT70YQBOsCSueMqAI1dEac55FTzzV833RB8s/C/dxPFoFyd1uiX+Hxg7KUBLsUkpT5MeL9
	ZsSC1nZoJBGPaCE97s/ftj7OWsULxtdS5e26UWj9dwDgNTLfar2cvstfnF3Q6eaOVDSMNR5Av8L
	KqpPEpCm03/MQavizLv6GUwDIjDuOAVH7jWZzP4aZ4axb3Ee6VRU1eQPvP0IaIFzkdKSi3bsgOi
	e4/+GGVv/gskW/gR+8f4DvH3ARdWB7Bkm3wyJ4VSgt9FpU09Vw9AAAxxlJn1YIrOA5KVA16UiuG
	gDp5vL+CoOqDy3OhCEnisj2upRl9ZAWxsmxlEtN0AbEgrBhwdUpdO2B6wsXwhy0ZhJlD/x59231
	cH4qmMwb9pi+PBOeRBn3cAtBtufYeKvxyfmVFczlgGeiGcDiqERjLvZ3quXOzwdkD4U7Z8I/JGg
	nXpnd+o6L8BUv5brWhJxpBZ3J8z3OZTyHenl/iUi7I1Ho8vFO7/JOXfNNqSkJ2zCZ/WTn0rvuEB
	91ju+xjK//qMu1xV2nwDinFwC52GzQvHq4oT7sHgCaY6P9cKJPc8
X-Received: by 2002:a05:6402:3222:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6ba654bcff6mr8479709a12.38.1795528364057;
        Tue, 24 Nov 2026 05:52:44 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm6582079a12.32.2026.11.24.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:52:43 -0800 (PST)
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
Subject: Re: [PATCH v6 07/43] drm/drm_color_mgmt: Expose drm_get_color_encoding_name
Date: Tue, 24 Nov 2026 14:52:28 +0100
Message-ID: <awWVztVSyL8uOIzt@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-7-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-7-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:49PM +0100, Louis Chauvet wrote:
> drm_get_color_encoding_name can be useful to display debug information
> outside drm core. Export it so it could be used for VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
>  drivers/gpu/drm/drm_crtc_internal.h | 2 --
>  include/drm/drm_color_mgmt.h        | 2 ++
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index e4e31bc0153e..de219c23322f 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -496,7 +496,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
>  
>  	return color_encoding_name[encoding];
>  }
> -EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
> +EXPORT_SYMBOL(drm_get_color_encoding_name);
>  
>  /**
>   * drm_get_color_range_name - return a string for color range
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 3492787c3697..f3a3ffd358dc 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -38,7 +38,6 @@
>  #include <linux/err.h>
>  #include <linux/types.h>
>  
> -enum drm_color_encoding;
>  enum drm_color_range;
>  enum drm_connector_force;
>  enum drm_mode_status;
> @@ -121,7 +120,6 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *file_priv);
>  
>  /* drm_color_mgmt.c */
> -const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
>  const char *drm_get_color_range_name(enum drm_color_range range);
>  
>  /* IOCTLs */
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 5140691f476a..133ca77d91c7 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -113,6 +113,8 @@ enum drm_color_range {
>  	DRM_COLOR_RANGE_MAX,
>  };
>  
> +const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
> +
>  int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      u32 supported_encodings,
>  				      u32 supported_ranges,
> 
> -- 
> 2.56.0

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
