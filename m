Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505921;
	b=fiRc/BzS3w+i5WIh76xJNaSovIPuyj1uvH8+9QEHQ3zuJXSPKhncdMKkD3YZgdNxToJu
	 w6bAH343DzvquE2+6lK+qrWG/32b4+MnMP2X1HsmHviaZ3iCStwFxk54mQJUn38rpFep8
	 bwWmO7sBpp13LQ+w5YpGxI3BbmQin58vBtPLMoLno1uDxgzTLkJcksNERNCVXdkaKvVRL
	 RsJf9LtYGgQQhiLqDyDczCJ0f2VB7Lm7ZGoMHgMJlIhtuErEyIYnEM/zP5jeSob2MR56P
	 3abZ6NCQl/r0B3q3OQ+gQ0OejcyjXF7h19A+mY2N9fMsbie+W01DI4QxFAK0zjAYOXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
	b=NR5vcQJxmxMeW0AHGnRb1X/u358o9fVRLfUktf/cmqkj6hbWBMdryYiUP5KRQHzWxn9T
	 8W8Ia1cN7tC6EWK7520MAKGkaJB8XYneaSjZrOpjDOeYWiDAYMbZIXQEnNpAJN46ho8WQ
	 Hrgp7HgWz4sKB/ZIvTc++11ppESUVpdgKcxmn2hZf98cD2KFqNVCPHd8mxmjvxsnwPcqV
	 9sQmD613tkv81G2OHEXqK1S/Qkodm/ssssBQ5oAz1qiptKt4NuXYkfsWh1OaEF4POqjV5
	 JeOLJ8fu2e/0NHMntZNDPNtdVyKipgjf0ROF71Cm1Kyt1j5zbYsPgMLy5eC3ADIg5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ir4wbsIS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924E606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 07:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B924E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ir4wbsIS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so40380615e9.2
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 23:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505919; x=1796110719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=ir4wbsISWLuKC4bX7Kem9/AkCt0lGtcwkFSoPIRp6Se5WgB2Fs8CQeVr1Bf/XRKxrD
         tr+ELPBbQaO2Oed5rxJQmGezNA9v9wP7rvl1Qr9hdAafBOIBYI6DcXdGl+yIAYc8Kflb
         OLOywxTaOgqABKDBSWSJlQ8f6AnQOkL7rCJv/Hh1q8wS7/swd1fbmjdFF95Nrk6IjMT9
         bxVj3/EWsZ1zcKWprilcTlbAnkOqedI4E6eoKk3fWMDZgX6auELQTZBvG+amG6kBtlt0
         6eR0TjqvgHmDFmGFUerUT8qMlts//dP8kydf4BKP/MK1KdSylYJCSWzPsYl0hxdrZZeN
         K7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505919; x=1796110719;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=NtAsb12JaoGGJ5tF7krwWZIxQ6GZl9k1r4ukW29AbnagcS91l23i0auQw3qcnB6MLM
         hQWKB36gi+zDkrkoBx+9aRd3+qFLHPL7jhlgTB7+vDj94QfVfE+O+T5VHJsPiruEo8e9
         zG9brg1piMVJ67z6zCa46v0+LqYk7jEQJOYsxzl7g0hBETm4Fd5DPqyvRqE0MuFy51yi
         yE5j2u6YQMMu576Nh8+ZYinKDT7SE/TdByYanSpinnaD9nX82J7kba1K8WU4v83KglwQ
         O9x5K943rif6R2sovQm7sR2mB6bp58V8dysrFKAcu89G1rhdzMeH+ySzesWsP0Zaqnxl
         ReNA==
X-Forwarded-Encrypted: i=1; AL+hErH1giwiUYD3Me62kNqBvT2S8eWEQIkd34QVtwtl+tziApy38wNr/9oeLOHh//wUWeqRsGLt@lists.linux.dev
X-Gm-Message-State: APuU4Z85Km7uWrF7jS7ASXUTjy1Hgw23VSVKsy/s1VhiQbkIfQm+OxXv
	PzL1xKzut7I4x5q4vx7WMssLyR05MPRHrcD2ecqEi4R1HdQo2xwRImiF
X-Gm-Gg: AZFdTZfigCJA6Nf9XZAs/teu1a2tx2fmfQabT+2lr29l4ppbf+3xon2c/J9dInQfyZs
	fqJxJ6evyjguVKzfeE77oC5NluK8VQL2bRuaqXvxuq+82F5bC6JYxOwMdyG1zGI+CIeEC6vcLk1
	8NQFENAOvGOGYgh5qvqCSOb/4Va3PuqG2rOtrDfsSF+piYnlKHhyYzuruY6omCYzUDo+x1oPrmq
	7dpXioNnE9jWiXOOgXggS+mRMGxvZ1U92eOeBK9qRVr7BqTXYzUcbusafNSBpa+6GkMA4VbMNna
	RuRmP0HqaWmzxa5EAp3TRUisVXK0o9MtBZowxjp7hvqqP1UFSoacsu8+aDS1zJ7G7WU6YN7cJsA
	uTaKrN+I4iQ+sdpmgOUX/rA9jB2Q8aSwmLn7FiRbRNDHAaHeA0nsy9WyJRd0m4tjHMbZv80ahIW
	LjDUL08XlTYauaZoIUb5Z0I7L4bft9yyEDXzU9amfIi8Kzwds0myYAfB01xiIn5LLqKa6VEQIwL
	BSEq3C5vqYAbGMjs0FuQzINh+axnQCuqEVYeD8sb5P3Iq9k5LKmIdGrle1AQV1QtDpYhvZwmn3K
	x2BA7H+a23Ec+Bs9uBb/4G/iubyR9TL4Eg==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr276593835e9.10.1795505919009;
        Mon, 23 Nov 2026 23:38:39 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm25975635f8f.10.2026.11.23.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:38:38 -0800 (PST)
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
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Tue, 24 Nov 2026 08:38:23 +0100
Message-ID: <awU9pNtc2l0JXLzs@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
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

 index 49510a0957c7..8704b6f71000 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -44,6 +44,7 @@ struct vkms_config {
>   *
>   * @link: Link to the others planes in vkms_config
>   * @config: The vkms_config this plane belongs to
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> @@ -56,6 +57,7 @@ struct vkms_config_plane {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	const char *name;
>  	enum drm_plane_type type;
>  	struct xarray possible_crtcs;
>  	bool default_pipeline;
> @@ -342,6 +344,39 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->default_pipeline = default_pipeline;
>  }
>  
> +/**
> + * vkms_config_plane_set_name() - Set the plane name
> + * @plane_cfg: Plane to set the name to
> + * @name: New plane name. The name is copied.
> + *
> + * Returns: -ENOMEM if the memory allocation failed, 0 in case of success
> + */
> +static inline int __must_check
> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
> +			   const char *name, size_t name_len)
> +{
> +	char *new_name;
> +
> +	new_name = kmemdup_nul(name, name_len, GFP_KERNEL);
> +	if (name && !new_name)
> +		return -ENOMEM;
> +
> +	kfree(plane_cfg->name);
> +	plane_cfg->name = new_name;
> +
> +	return 0;
> +}
> +
> +/**
> + * vkms_config_plane_get_name - Get the plane name
> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->name;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
 
Sorry, only noticed this now --one tiny things: this helper is ten lines with an allocation, sitting in a header. coding-style keeps inline under~3 lines, so maybe vkms_config.c is a better home for it? :)
