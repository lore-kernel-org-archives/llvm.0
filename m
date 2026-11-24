Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512520;
	b=WHIsfgWHByF03FtrF04x4OWHmih02iia+3rZZ47WYhLKFX0TKScrS3C69JrnSlkXwSYJ
	 UuN4cnPtbczSvf3m9TUZMvqKSPdJfJZJ+5lFWlD0d9sVkRpWdpmNHNKqosMltA3VStHDg
	 xGjMJ77CuMkvatFb6XFHgshgTb7Lq0C3WaHUuMTX3id7VZkqFGfNVIQ4Xd7LWRb2s++mT
	 XzkDLDZqvMTD6w6t37uaBoi/NJqKhezcIYbER2RZRhy0c1UwnOyBqUfeOfRpA4OaAdaDx
	 lixmHHYmgvLpw5yC1dwkuGwHNNMJISBtF+NScqmN0xxkp5ndkN69f2yBczm1aD81ogg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
	b=WRpyOizVvvMr7CeTRp3zAepLHn5tk/xhRSVhLPB8e8w0B+ZohoE3d3+3yB2O+6nbvUd1
	 i13euox4gGuskcwiG+zJJnxnAI0rB/OcrOJ9oTsc8rQl6uuUI7gpnk/5j0/83yXh3bN/z
	 aw4pn9kzUrblqapJfozps01/Halrt/oqDruAYuWErTI86Jstkf98z20GQ6vsr7GzYxSWL
	 RpdPiNHhPCZi3YUaYkCeuyOQkzo+n393QsBEjn3Pf1lbXPSFledKRCPoqrjM3iGOQ/dRm
	 htVZqwDmo+sevSmSK6U/K2iEQ0BGKZ0DBBHrH8BGx4aX6gZ5scygoLX5Wn335ZCh1+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LY8+lIPk;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7D606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 09:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LY8+lIPk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso46760825e9.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512518; x=1796117318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=LY8+lIPk5JJjpULr6q4BV8nYEPrxLMVKbyy0FzafS6pfleKvH/Z01IJ4MqKfwGNWox
         PTDY78BcBtOHog54DVHdCDM/cY+Ub4EtLqlRUvG7peLMZj2cPoXPmlLygSot4JQVgks0
         FoO+kGOd1Ij+tjfF7jzgMLRUHQ1KbRduw98IUZ82BgFhjRuGzhb6MJOwLc2ZckPa5QwD
         sa1Y+CNNx3aFF1UL/JWMyaTB7hka4qzpNfM43g9Kjgya0PS/cVfczIcW/84jNPJmpe5d
         yVqSNZCdaJp2OlmkfySZoCddhk9RL/tbLVdC51+FwkTmRYyQgRhkRCYQmJ0y4VM4yNwC
         x2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512518; x=1796117318;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=nOs7TAGs8NzdAXEyS0D4mCz76TfeA5kV9PMzmJU7cYOsZAUjZ8osMJyf7VCSz11k1R
         FsYSan9wPCU3v7kBnNRlM2l3BlYk26zQpqlVi7DNfO97AA9Vbt0sSV4S4fnre5wkymae
         gVCCTdDtrfhqHZhGQg95jgiFutKfTzY9vymiFK8LMUlc45OZWlLlD11u0neeth18CBkT
         rZ9YNJYrsKATFBlhgzUW512+WyZCBhce1+d/lfg/g0vz+GSfDrutrUYc9vuYUisbRqYr
         2qwsb+Kctvwlgr2d/aSP/Hq7rnETItq/QY3J/jfyiyveIiClDyrsmzPf9XDHMII+b+5h
         a3jQ==
X-Forwarded-Encrypted: i=1; AL+hErFocHPQbttlRpSzFx3YGU8Ck5vlmPNFtahMDJ7LWfjEEag0K9iRGVNs1EP5pn8IvobaUuvf@lists.linux.dev
X-Gm-Message-State: APuU4Z+7Uk80eB/qucNfJIYFnUUBaiJJd8EksUXVZkWdxujHjLZ08FBj
	JXVWS/+L1ZE7ltUBFrKG/5zXb/r7by2dWFpumL4eDgllb2SHQzGTaFGc
X-Gm-Gg: AZFdTZfhZSlqlPW0cgy5QDIUJkjtlEMKeOtf7aHr69ty9F77KaP3F7EFqL/VanJ2j3p
	/VIKpp9cIvXQhWPYpiLmYQ56+xoaA+m7fVLsYgshvtWQ+21J31l5gvRZlfQpmOLHBwkltbxVCjS
	UQnCN5AfU9wXhw3nhm9WG2Alfm17rhkGoklbt4aldJGGu6CvuVlxGyDfSKeAIr2q3A3GuCoNnCd
	Pa8nnmGRCn/vb/pF+jcgyhUogH39Kf3XaMO3gSSlqUphkZ95THZqX4xvfkby30cIdHg1fl2tx+a
	qrXH4Ot7Io2GJLmtppv0syTzsey1yTZe9i/AVd5GEW0xvvGl63ePhcywHJtjqJ44mbew7UD2JCE
	D5X2LbVBK6kEHfen1z+6JEzIWKEtVyb9Q6pjFdZ/4UThDk2XhkcsEofRSLu0iCp6Dq4zojd00ko
	4L7NFK0GHPrtvnZpheTpmk4q6PWhcv/YEcDQkqt8M+CwVzFGmdKuvOQa+M16AkYm3uIZ6jXuOND
	nyb9TlJ7Imq8Ul6WEsWFP8gVLUcOj1k1A2fNFeJ1VbEbxyAb9l/Smh4lhXrCnMcM7xiX8aCQiQt
	X91d41CLtm1XHWjcNzl6V6Tfp+lKqHkp6w==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr275531005e9.12.1795512517667;
        Tue, 24 Nov 2026 01:28:37 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm28275775f8f.11.2026.11.24.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:28:36 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 04/43] drm/drm_mode_config: Add helper to get plane type name
Date: Tue, 24 Nov 2026 10:28:20 +0100
Message-ID: <awVWbUPDh_7UHoay@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:46PM +0100, Louis Chauvet wrote:
> Create and export a helper to display plane type using the property
> string. This could be used to display debug information in VKMS.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index c1e993a78702..0d814424c698 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -419,6 +419,22 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  
> +/**
> + * drm_get_plane_type_name - return a string for plane type name
> + * @type: plane type to compute name of
> + *
> + * Returns: The name of the plane type. "(unknown)" if type is not a known
> + * plane type.
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type >= 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
> +		return drm_plane_type_enum_list[type].name;
> +	else
> +		return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_plane_type_name);
> +
>  static int drm_mode_create_standard_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 084517beb924..545a5b684acc 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -30,6 +30,7 @@
>  #include <linux/llist.h>
>  
>  #include <drm/drm_modeset_lock.h>
> +#include <drm/drm_plane.h>
>  
>  struct drm_file;
>  struct drm_device;
> @@ -1011,4 +1012,6 @@ int drm_mode_config_create_initial_state(struct drm_device *dev);
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  
> +const char *drm_get_plane_type_name(enum drm_plane_type type);
> +
>  #endif
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
