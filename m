Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440972;
	b=CijzS0ah9d3BRMgtUp61HAqRIRALLR7F+leYEilL0a0P6FeMSpS9FGxd9Bc7TFhtFfIS
	 JLGtpDAwlmwn7aU2FmgoTXZlpwnjisD+z30MF9Mb4Q1BHOquAYKlG11YP5OjAmzignCPk
	 Mk5AJ489e5fiJ+AxBapbu73hvqKPchF86+gXI5a5QC+b81+O1xyFNLhfM3X8QdsbfZRSB
	 1TfD54f2AWTBoxpGZVKV03UW3Vw2nMigXlM4leVRX9se7y9jNZ0YaYb/0GemO4hspKSX0
	 LzbFZAmcTry72Qo0mKpmstYPnboCBcoC1sgNvwd5Z5/nCRlCyT4Xa8Bqnoo1509D3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
	b=kRazynnjLmTwDxLik1coKtFBLetP4wG9M1tk0DU6rLckJohKstY1llGJMScn1I3J/8J0
	 mbeIZj8up09VIWPQuANgYle/YqjyTeMZppn8lblYIJpl61dgGGx3MBkwj6hsXum4qv643
	 VAkkHv6C9R5z3tm3nMKLY4euwjYdVM+imCaDs8L33TIlBWiffYJF6RQbi+VbA+BGnDlTz
	 5hM910o+b5evMPax+W4OOC90TPA16/gs1tYhgnrNsS4o9AlsSPXaDCzo1cp/r4fgMJjcc
	 GFilGSOGoCLeVxcbGcHldT2UPPlcGWPQFJwkb05/8PX90iUWsUQl0AJkKl2piiVun+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hir1H/2P";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795EC606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 13:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hir1H/2P
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5531688a12.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440969; x=1796045769; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
        b=Hir1H/2PXG/YQslz7LlXj5EHYT4C8E8hs7fim28Ua/HehLO3kHq7LuheFJg73utsaL
         SeSxt+NkQe2B23zjGNubXvqrXLUj2ZRc8Qbuf6CHXIvFtoi/wPQIwEAj/nAOOZBCSVY+
         b6pcZFxax8nomojkvlrEqUaptR7kLPosFxyYt+LIU3GEOmjNIcqSKYg3T/MbjOaMTFaX
         tXyJNtTKa3dDuLRluZzLFB7tM3yNh8sZQ4bT/JvNcQlmWjNucw06IThIFAGBcXf9mOBh
         aznOW2gJO5k+LTQDjpbxIzNywPVvfHOda7qjtbYYNiVOlzDKvmKte5uoXWGNVknnTPOl
         4aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440969; x=1796045769;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ndp8NPT5TSJ6UFCJr6F45UdWtUB0BU/WIyewS4Od3DQ=;
        b=wCAB//3HPIBx9vAp+L3wfDF43HqW4xWHrOZmr4xjq+nyawVexeIp6naBIDDMuwZF+p
         oeVtZvAKSMygW0797iIhWFARV82KaBOHEH+7u9/kA0dL1WARVOq25nr5v8Y0TXkDhN67
         nF2EW14LqpbOrvAYfqNtDD8fMzmyZV0kG2C9R8SKf2esScSwwsRlZ4x84LdgEODMa8RW
         JSx7F7dX1+U96g6zm30Jk1JqP3M5jIjslfcaXz4ECEDDEfUX5kUdsVuivJabew7/DaV/
         Vsq3gYLYIoYmqMb2+YvzQaVRwUBagVBqes8wn77K8LSvKEsFH+VKuLZVXh+SYcWiEqJ2
         Degw==
X-Forwarded-Encrypted: i=1; AL+hErE/vyATHtk+4qZKYXCTJKfJRgmFDisl1MZ8o5WcBq/rlSgSbrqI01+oZzxfwCtyf3YcoXq+@lists.linux.dev
X-Gm-Message-State: APuU4Z9gaSqGzCYcW7n7JJK3FXGVPUJLS97TgkFjtDbKXtKpAAMFJ4S3
	d2mHd7qLovLk2qtiXneAW7z03k2OiCiQ6JoPcL0ujnE+n7nXH/lznsrA
X-Gm-Gg: AZFdTZfVo9400/cqhEwD+S6WEijR86ltU7UHQ65y2FPwsvCodALYNtbV5YQOszvxDVa
	OKVxY6u8OTkz8J/Zt0MTfEQGh+olLluCC6hrenyfTWj9m49zmwg3Vwk8AAk10Gqp5NTW7hL428H
	gRPDSdaPE0pnuEdJMUJqpDo/WInRXK3kBLm/9LXbT1SPunXB7ggDzGFqhNjGz5cpEdZHNr0qxlH
	/ajzJqyK9t3LWnxUbEHbbdlL98BmYHusNWlDndc3+KzOQWPeUBypk3ucqYhoNDTicjHeLU4NiMh
	V8ChEkVvyYUXaymGVRR96m0fgEDqWc6JqJEcWXAiQSGXvLJKeJr0WQE2JHMiuhp8z2bjFlER5lm
	t2sSLJIKcDxxDleTXPvzchtVd6xoifrLc+I9BqeMBe0GDoOa6UVpKiDDgZcczyPTDwCLXlmpeST
	lfBzIdhlIr2Yw6+1DYSknlbo+uTi38M/43EB3sGDIG6yArbTxJqI2e7QgEzR/kvavIKjTNAgZw1
	JoXwsrSITk8mvDEacyXQpGOVcCwuZlqgYAoy0jCFQDfZIv7y4x28XgEQErarSKEgXxDC0YZiBOV
	pdif625lSKOsNgLLcgnEq6QvzYyuyoF8fA==
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id 4fb4d7f45d1cf-6ba37ec77e3mr8770739a12.42.1795440968562;
        Mon, 23 Nov 2026 05:36:08 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3275302a12.30.2026.11.23.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:08 -0800 (PST)
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
Subject: Re: [PATCH v6 16/43] drm/vkms: Explicitly display plane type
Date: Mon, 23 Nov 2026 14:35:48 +0100
Message-ID: <awRA6XtJ8O13Enq_@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-16-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-16-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:58PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 03f2d0f0e327..44ded8a86a6e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -391,8 +391,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  		seq_puts(m, "plane:\n");
> -		seq_printf(m, "\ttype=%d\n",
> -			   vkms_config_plane_get_type(plane_cfg));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.56.0
>

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
