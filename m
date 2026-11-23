Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437671;
	b=MAPxaNbfc5v9JfAAh/LmEMyc0rQ9kfigxdSPKgACp/svUYGcdlmFcIc4G0T+dngmv2+r
	 lfXsc0kt+Al4cJMA92yNG6yK0Nkc6MovPDz4gdn51wzBo3NwbJd9B2dTbdMYRzVGyGU6m
	 cyhjwhZODTffSNgZLeamkEOVbSNVZhvHIxDZ1HkddDyAGorkSTDqzW6NxwwqnRLEl+n6c
	 1TaLdqKoR8RUY4/wSMyjj/2lDpeUe+rWyq7DVwvUu6u8HZL66U4C2Bjm4uR793U3NrwjW
	 qrt4OzySetauHAQi7MiL48edov+5F0LgD6d1hYwBMFerOGLSpxsG1ypb5WIHbR89LsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
	b=O7xEwgS7moXN8LXqQ5AsnCG9zQVEG5X32sx7sSOc6/kov80xACttxW6edSKs8S2/HROK
	 X9BZ1bcgyWU6Ym8ArYcV2n/blFtRbjRTur6u43liQ7Pfo0dtYnBbmp+DIhnSZIy4LdXD+
	 W4s3f3pW/5mi0EmWIiso689Pki8+ZfFshr+8hz7eXf4a4QzWHmTmqLosisx/IOXK9JE1C
	 UaTFBRI9HfJ5qCyZ3CbwrH+wpkLY4dtpVfT6Zu+lGC7po2BlARo++FkoiQRnqN9EhL70S
	 aLIunRAoBMYpVDutUI3SUPfR1g+xr0+vcP93nQN/crhue9FKAXwyrFResayrpiMc5nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7BbNUDI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87A606A31F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 12:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C87A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7BbNUDI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso31416365e9.3
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 04:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437669; x=1796042469; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=B7BbNUDICsmtNWVciwN6+Yw4f0TxT0Sg925sIXJvSa0UB/52wmtmkdS499WRVrjV6z
         UAJoRf9jn6+r5flK2U0vFE1k4bOTY8ERb5Kh/vLNESTgaVerSNH0suTxisenuKJj0WFw
         g7Q8cIGbKQ9Fbp1EW6MR6Vb2MvjJfw6ewY1JkrniLiQZbCiIDJvAHlQbquKoXPemy0MZ
         ShnghzRsY9hFe2gfmkfOoMfvDnQdzCO7VEg1Y6MWZg44CkvsX7ycIPn2+vEuDq9DlIXE
         C0ohYSzFTufSy9CDxFfLKwuPz91gqNVQRbPbfpCCBFfcL0dhIqsa/l9WlTNY1NqEeS04
         1bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437669; x=1796042469;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=Ctx41DIw3RX3yHQt7pN6jJXf/DQLGlqGfAD5eSMBABlKCajwio8aZ70djsT3Ra1NHl
         3iDsdGupO1RpV1NQJOjCBgSLsgp101io00VpyYCvgEwaf939h64/Q3FIwOLSvCSTA0mu
         HSHFFSRsicm2KqhjBh3n+LjkZIJ3h9PwGxHDpCeLPb5Xw2vH+WU4ORlVOXUlAucI0wRv
         R7w7NBWdF091NU9LptE7PZ7ESoBrtleUSXCk+JPZYGe3UvGYi/NoeGoFhRLD6QQnEAiH
         hcAe+vZNqm9U6xZ03G0ehInnQreVpsWqcevtO8lt3P9Ege/kjYptcsC9RFMViOTw/Q4b
         DN+w==
X-Forwarded-Encrypted: i=1; AL+hErH9bEb6NfUeTtP8hxG/PMny8HIaMVmsCQj6ooT5YdNiD8+uzbXMxjBfVcjfzdFpNBr0uY/n@lists.linux.dev
X-Gm-Message-State: APuU4Z+UQZewBDVxC0sRZjd9iEicSLwvAlLykoPbZIfyCycjaAeha1eB
	Bnv4dwDBbgn2InVdgdT0exNxY+o5veLbUVhMBPpKyBqptMf2E4G0ySqx
X-Gm-Gg: AZFdTZcfX7872PzfcklciHdcn0oE1Em2/tPpHc/AVTAPjR+JwM6vc9qkumxBIn6wQvB
	tqQ1vFzgpxsJdZmGBoBllokavF+AgdMhCTfjQIPoC5UNjnzLP5v9fx5UvrXAsewKmuGOpV7I9al
	skNVQKZA5nsZB32raRnvTfgHr0UWzrLHmx1lwd+6J76um2l4ur2oAN/lPbvUScAPhHHgxhYhhmj
	qMbk3hzdoqG0Ug71S0BQV3o14GuSIEfISHoMMI1EytPOS0JpJDbo/AkQiETAlgh/41c+ZiD71Iw
	qSir6gPdVhh2rqNPbgdGIhwUp7H2GxRq5KbC7dvzKHsbPXBCN4eYnjP5fPB0Jyl0IQwTVfg2ZAe
	1pgruGbkU+DJmKwxQNHYS4Ror0AOsapprNwvlZEttFuQ2xlcQudbeHfOyvG4FbuZYD5vE8PSvgD
	RkJVazOp9CmXCenpEbDKQdRSMPLqjsUaOcGyc+43MWTB/vASaoWOBzS00HUJvDB0gXcV/mbo0tq
	RyjBQtccjakND0OofIsW+U8F8QVCxYlnBJQnCFshL+xY93wgI8BMR6JaIJoQHMXT1kWbeIv532c
	rPLfP7KaGqf3LVVvFqYvICkPq+d3GQjF5w==
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr277880715e9.12.1795437669058;
        Mon, 23 Nov 2026 04:41:09 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm269127865e9.2.2026.11.23.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:41:08 -0800 (PST)
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
Subject: Re: [PATCH v6 14/43] drm/vkms: Add error handling in plane config creation
Date: Mon, 23 Nov 2026 12:40:53 +0000
Message-ID: <awQzMoSQfHO47QgQ@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:56PM +0100, Louis Chauvet wrote:
> Properly route the error path of vkms_config_create_plane() through a
> fail label to simplify future work.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
>  drivers/gpu/drm/vkms/vkms_config.h |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 50cde689f482..03f2d0f0e327 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -424,13 +424,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
>  
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg;
> +	int ret;
>  
>  	plane_cfg = kzalloc_obj(*plane_cfg);
> -	if (!plane_cfg)
> -		return ERR_PTR(-ENOMEM);
> +	if (!plane_cfg) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
>  
>  	plane_cfg->config = config;
>  	plane_cfg->default_pipeline = false;
> @@ -440,6 +443,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index de6a89819daf..49510a0957c7 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -288,7 +288,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
>   * The new plane configuration or an error. Call vkms_config_destroy_plane() to
>   * free the returned plane configuration.
>   */
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config);
>  
>  /**
>   * vkms_config_destroy_plane() - Remove and free a plane configuration
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
