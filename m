Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449509;
	b=StMrlqEmt+3zyYdYXrx8IJW6cj21CQLkZkenw9NuW7Wpox/L1ZeUqshUNdu9SH6zftHt
	 lJYEqL3Kp7eufGZYXcxvic1fkEJGbi4Zaw7WyLQSzwQxeEXrgwB6lhObXqBx2vxBjUgC+
	 y463TIOHWc5Y9O53ooL4lTxg+iJNBCOS0H5Za+RU21Z2iy13ohoG5um7Yfuing/ikOJc9
	 w7nFSi9Tdxjy+e+ISINLxN7ZqoTfr+OJ5ZI1H6//NXbPBinZ/H16ryj+pJ1p6ryUeSfU3
	 ZwadM8aeEwvYGci7ngU+d5quWowwTWM0ffSD8RqB6dn3TCrAdEUaqnxc94C18Wjr9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
	b=3JBFfLC5SYK5aysw3INBPnvnNWEAHESmaTnFnHSi+h5/Pf0fd1GMvy1YO2J20bOJwP9B
	 Eii6HAOovnOZfdbOqJ3i9B2basqF0GDx06KlUw5IfdgT3ZrU4G0iNG8zSqNaig1ZcG3S1
	 2ZU+l8xHkjwBscxIMrW9u1VmPuvpLc8gXj4X9gH9MZv1ag75mS7jVOVdEnFcmw7vBjObh
	 wNgtTGNiNBZn3njfHlIOjqTqjZi0AUdhVFJejn3/eWCOn3Ye1LsgW/IyJPGCPszHb0TQm
	 +hempTf43jHG0A9IreK7uUFuwl+mV1tXV+Wkg5TispBC5PVP6zdVJfRkQ3qnv2Q8s2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pviktESu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99D606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D99D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pviktESu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so36748045e9.1
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449507; x=1796054307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=pviktESuRM1OYLH30LB5kE5twoj2FhZ3YBqPLMe+FuJ7iu01kjbhcpd6VxI3cfUWoA
         IPT1qv2/XloH8GdOdlA4rCNlvXBFQaYr1JgNnmSnH9evUP/heXb5Sseqqhe+lP8T2XyF
         nV4SipDY6+jO+W1MCgGG8oyXJ2Hn+fnhEvghmsVO0rSq96DyG5vLvgLh+tSKSl5L8yYs
         Y8qF5xwOK3/GAG3XuC1/Uupb+mjp14BcRssvONBIDlhuOkVVrmGhFa40dChtvQjeTtLL
         bX7SEQ5oAeqVSGzktjtoKR5btXoZmDYM0QFj74LdDbCgBQ8x2RJA4WhfjbQrtEgfvzWY
         L49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449507; x=1796054307;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=ChTitI8Xjv+MSbiR26GHiuJ6JzNSk3wxPPsh3ooq62X5ZGLmiaS23uaH3fdAnpH4jY
         eEa/MrhFn23e+gc3AnJKLLayi8zvIa8VVkaTb2Eftpxub6wV6OzhjGkJ2Wd6woP68Y5Y
         V/ZfknIV7Y9iGqy/R56dzc9DsVUuqsbeVyxNZ62miNul+dEGJoPvBGfOUl9oEV8NvhzC
         3EkJJOi/l48knRXCHngv8rh5SNhhwiV4Oc0hBfg7Oeilj4wk6BMKQlR5c7QLH9S9RL2w
         2fDFhXiSLWKLFb7gYeMZ7vcpOV70HvbsozI1x4+8uXYNf8d8Opz1uAtUSri/5csQvnEK
         mXbA==
X-Forwarded-Encrypted: i=1; AL+hErFsVpnNcGs3HEBd8wNXLXvirhwZ7hHeJ/Wav5XjgpuyqICKnDNzRCbInr1kpoH51YPHiiE/@lists.linux.dev
X-Gm-Message-State: APuU4Z/sV+J4RT4aEh1CsFZ3WopJJJhUOCC5HOCPWpcvDlOV18ixJ14E
	YX1rEkzJ0Y+n9ksE+0yxyfi507YNRR9frB7A/llnX1f7iD1SlzgwKMH5
X-Gm-Gg: AZFdTZfzkugrmPRjAsMG9rvsVCLtyOKsPN7pkNLzV4X38NrK5sjYrtSXJN4P8n5nRhJ
	x4ahD+A1dWAuGiqtcr488EJ5QnC50L2oq4lm4dgVOapsGV/9hh+exfhM3S+ZhOoOxfPvtUFY+V3
	FN1OTXZzCojUSQ+W6bSFST6RE01TxGAcSK4SdWIBzSl/silnRIcjxq+Fer6zxvNZ7inxMlrJMz2
	37Goxo3lojzrK3MPXE+6wjfNZEupMKLyzcruXrPDxkVTc5sansa4iY1Y9WbyjcV3E95a9aD5slq
	GWmTPOCqlgXIj18i9X20QjARJM/7+HWHBOMvFnRcR2kGhjxSX9LkxqtLtei61AMZscxlGKngrvt
	Pi7/kFf2NgtPprA4Si0nqd4yTbws30Sx3smMb+EV9Th5XMGlqcON4llDwpTSxMDMiAN05VXJLtC
	k/RDRNbxi3yX+e/lKaaWjdRM1icUv+A/iIjVo6qZHMh+N3nWT3AccQLK0Oz5K5HHdOscmulaIl/
	o/CO2uGPxoPw7nf/l0mKG06LxCrgf3DnaQfFbQNqS4dHyuanWqfljVG7rI/+7aDyXNAHZ3mrdI3
	jY1DCFMoEJ7mb1A4Bmp01ObVS8fnsgzHmk46/iKXBqgsqeAQWuevYiA=
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr232622925e9.17.1795449507258;
        Mon, 23 Nov 2026 07:58:27 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm175808205e9.2.2026.11.23.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:58:26 -0800 (PST)
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
Subject: Re: [PATCH v6 34/43] drm/vkms: Rename vkms_connector_init to vkms_connector_init_static
Date: Mon, 23 Nov 2026 16:58:05 +0100
Message-ID: <awRiOQv8H-nI8bpq@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:16PM +0100, Louis Chauvet wrote:
> With the introduction of dynamic connectors we will have two way of
> initializing a VKMS connector. Rename the current function to clarify
> the case.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 5 ++---
>  drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
>  drivers/gpu/drm/vkms/vkms_output.c    | 2 +-
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index f5e99e77e84f..64d79b778551 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -75,9 +75,8 @@ static void vkms_connector_static_cfg_release(struct drm_device *dev, void *res)
>  	vkms_config_connector_put(connector->cfg);
>  }
>  
> -
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg)
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 89d7f3a15d6e..61a8dd55d7f7 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -23,15 +23,15 @@ struct vkms_connector {
>  };
>  
>  /**
> - * vkms_connector_init() - Initialize a connector
> + * vkms_connector_init_static() - Initialize a connector
>   * @vkmsdev: VKMS device containing the connector
>   * @connector_cfg: Connector's configuration
>   *
>   * Returns:
>   * The connector or an error on failure.
>   */
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg);
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg);
>  
>  /**
>   * vkms_trigger_connector_hotplug() - Update the device's connectors status
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 7783a2f6d343..2b0f7a8a80b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> -		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
> +		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
>  		if (IS_ERR(connector_cfg->connector)) {
>  			DRM_ERROR("Failed to init connector\n");
>  			return PTR_ERR(connector_cfg->connector);
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
