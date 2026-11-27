Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775782;
	b=2LFtsiPo7tjwNj5Bu1oluxQQEG945gk8c68062tuo3Zf4Hfd8xOkaNbNU6f+o7K3K1FC
	 shlC15zszv8TxS2smxPqXOtqEQm7BWA0MwJpPfpXzlDbY5gElkgqQPvtg+Qq0PcIc0qR2
	 keqCp05uxbxwnhxSWy9N84N4DLBaJLUMKoqbLnTkIaFe9x8kbQgobqIqJLEVuqszX79Iq
	 CMkfYz0oRa8Zh36mjURXpLIas6he+jOKL1SjvOM3vai+GC9CMMviNJuS4VfoQ5ol+PHCA
	 ieZJwZhD/70DND6+dsCmhQv1yk36Hk5zBO1rQLIDdYJ+h25WrjsbChglVeJme37KsHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
	b=F0GrJ5i3nUMkZb/ptyJ2Xnd9UAhFoYTsCVkLGPNBkGVbjMrc5b5kLH0yVqKVYJ1CH6b2
	 O0vF5AT2XHdssD1mW84rtsg2mDL/NIxw0BIvMJfMjwUwdYyroUOTE3mJIMZyo3oguJeRG
	 ArchpM7UkEjVtXvnB9taqVD12J71DMGu5zdM9paWYWhIjwHrsAy4AzxJ+j5RVOZMJGPiF
	 KQYLYqdwsRnHRhu4l+sb6M/NoPKi++NX0NhF45Qun+jvItemUfXWiJjGlq4mj9ti6t8RR
	 7RDWqo1mwanNx2PQNAOFVbB1UgTNM49612tn2LspXAUeHcHy7f1hwLjw5DGd01oo+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGF70Dc5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E448E606A321
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E448E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGF70Dc5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so69042545e9.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795775780; x=1796380580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=rGF70Dc5JwUOb5tBVTEnN79W86O3Piv6AN3SZA4J6I9lEnrhEBnGX1psP9lcHrrQGw
         JFRzffpSAyhJSXV6wMpn9+RbzsnJ7OyHcQJK9GfG88ERUXp+fih2xWCIkWtJF00RbXbu
         iNawCYrKnku8OBZtMHk7oUsNxtugVJ8O+Dqfui9xvXGq3tVPg/qNbLziAXoQ+ZdLEumY
         x6bCXTUfGs+j23XwZ9QIBs7lZeaA2i4p41J6KvBJoDkSki9pndQ0bSQmOnfM4jBfqYby
         XfT0CX/n6C9BJZXzNHbW4xhF3m92lvpi44kcOXaOyRwvVgmY8Tgx1J2TFcP3PpRz3MHI
         AjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775780; x=1796380580;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=VPs/La0LjAx3xfhCnXhYXqmXxSLnvV7JR8oME0pfy5aQ3ZA84Na+O3zEgtfGAIaQFH
         66A0QCOQROyr33ICRA0YTLQP04zhEALz0OkR3GQ7kvO9k1JWPnBbmC57TSyv409mrKDs
         T1N9zUih6BiIoUQwtxTmIcIPic+Kcj21iU+qfuCRLsFsSlbTCUL9it7qiCo6H/Ay2Z4A
         ZzQLkY/BeidoW0LorShxN6QqJKrnCi2qyJPO4yIwu9Gsd3iwcBFIvBka+0zwjxGhnt4s
         wiC4fR3s9MZRhgnwbJoc0jBWioUxou2HSHVqABkKsrUteT0FvHzYL8tplcfvj8GfYLYs
         RlpQ==
X-Forwarded-Encrypted: i=1; AL+hErH6MfWFThlsieytUmJuwD1CzH67ivhJK/O1BDzlLpanw9vBmw8yyMnI+ecaBQRZkplhVQLn@lists.linux.dev
X-Gm-Message-State: APuU4Z802hfZJdEG38l3ZnugoBA324jKOM5mNmvCMxxlVG4xzhO+22Dq
	6BpRKemF0hpYzghO/rPEg2x7wPE6v2fsFkmOU02oDPs5G5OiX8RTa/EH
X-Gm-Gg: AZFdTZfLCirtCY4YaZ6FoQKmhBrgiyJ59zHtL6Jg0eFkMlA8SpgWXeAcAKhrzNjXX41
	EjxrP131wf6qPLuaKY4A018JRg3DS6l9MtzLUKrS7kvJCvTC+9ON2ejsh+bPvbnzGRX8Xnnnl8T
	MmhGOJJWwV997IqkeWMsCbq+wgPWUF1tL1bFvaoKTjxxfUdKuOPnqRr61ZC/Wvcrpyrz/JpcBAn
	2SIUFm1wTs8N07rJCRcZAL6iI5MJ2otUDr6x2sGUMJUhBXPSdk/WPF3TYd/EQYV7picRf4/AAHW
	TpthIsiizBmkprsVyWzSPv0Rgdg9khG/Iy6ZE1YvRf7ChqYcTLQ6rghDs1PWsQmnSMEP04PEUgv
	ttMA0Lt/Qtokmh1zavm/blvu0iIS/OAZfrXN6Podz4b0nFZL8cvw95hQi8MHD3DgAjbVD3+eplp
	6Uw93CPslE+eE/F/L/nwxAK45jS2k9x4ZH90iVhjI568aBwXgw23UMECXv6NVz4M8j05xlTXi6+
	gQ6UH1zvEodLMTnR2Y8Hv2tWRYAQ5Q5vsydxT3sVY/6jrtEB7775+BoER6kqN4xxmoHhjlmAA3n
	1S/F6SKjXvSh9wqJbRs3BrkulilwAdA=
X-Received: by 2002:a05:600c:8b76:b0:4bb:b796:66f8 with SMTP id 5b1f17b1804b1-4bbb7966874mr14558915e9.21.1795775780152;
        Fri, 27 Nov 2026 02:36:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm670160975e9.10.2026.11.27.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:36:19 -0800 (PST)
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 13/43] drm/vkms: Add error handling in plane config creation
Date: Fri, 27 Nov 2026 11:36:00 +0100
Message-ID: <awldBcp6Ci4FoQX5@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:56PM +0100, Louis Chauvet wrote:
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
> index 8cd4fe6551fb..c5d90f7e934a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -421,13 +421,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
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
> @@ -437,6 +440,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail_rcu(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 95e5c3694742..8f038562afd4 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -314,7 +314,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
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
