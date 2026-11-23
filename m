Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445788;
	b=XgpRt6H0PnSLOxPTNblPdMuf95cZ/wYouupUTMUjiFDGgoyISVxsv983oyMHlJL54+Ql
	 5ffbWUCt4j+pb7g/zvCRWffdwn8OeDngvCFRblnjUuqWLgcCjO5O6rNP3WYLSugj1ezG0
	 E8V3JP3DgScg15659BspAKpeQrjstOG0iEF5WjE/coZEm5GxUx9+DTr6ZewAv+GZXst9u
	 M+2x7yaGHyLrWcg9Cyzm5eWpZJF5HGK7B8L9DY9L9D/niiFIKIf7AOEt/9tvXFh/krXED
	 WORGF0S7sGWsgDfGOebwxjwU9449CUZmGCrFHlA0D6svcdqM+/R8VJOugKpMRHZpq7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
	b=FMu6cMAOdY6xC21bAtW06YmX3NsG8em6kw6hxhYnpTuW39Q8WYLiy0S0wpbYGMLiyfb3
	 rlNMbaxT9v2XjSpRG6Hxfh0hxMrtzvuxKiUo0GHeXqc1c1tzyvkXLNeXD/CZihgGng2D+
	 0IbJbOHMZ3wTMmrB+bMGI7Af+P3bWqvvk3DTc85/3zCBq0LeRNfaGXGmu9Brx8ZM+DdED
	 tPn8LXv7esemrEYmVHHLF2kPKpgFB6cC6SHSnOxtjzYSltDFsDX7vBmw+DhoDnJxZZ45L
	 WJKqFiuTXVUwI84HWH2cmsAFjhcQbggyauhI+v7DBVR/ow/aQ6V0oIpRwKiA3bJzBrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADJeTLac;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C46606B08D
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 14:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C46606B08D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADJeTLac
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2800257f8f.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 06:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445787; x=1796050587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=ADJeTLacG3BeVoZPn4pNX1lLT36sUJGRF1ZRYPh991Xdot0GHvyenhpYeHLJCZJ2E7
         hD8ZUIIxZVbUMAmrKNsOJ63AEhucgNRcDFI1FMDNHsk47hz53chHaDSdvuA7aBf4yaSD
         MIZV0qq14/H+x8Vb5iJ61yquZavpQDEgTmL4qo2QP1aSLLiiLvKtyclI+SECwqjyFjgk
         fWDg944NkpkQL3HYKGkocSFFmN4TIFDulDoZM3LDf0REkTG79AKLfXu24MD7esbYlFmc
         5ETufDSmh1a+xVizE44lnCgte4hw/QNp7bmcTJl/O3IfR3SPcSw0CRwJLFt0J2/nUWxG
         ujQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445787; x=1796050587;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=N5SPaYly4ecqtUjzpUUrQbp7KwaXqHUVj8DZiBKBF0lTMEyedlwD7RHt7HTDEB5SOj
         XOsfzyF7XCquYamK8UDpA4O1y7S3oYFQpPgz75v7eticBAVGbhUYOmhn56dhk5wsjQ39
         53CDfU+geDeNABEbADe0fXV2i2km5TCCBPFBduGdnj4g9LOwi2UGA+Kjtj10JdUd/eKf
         kdsT23PwxHgDtNKoTXJwjMyDJ1yEI8CTLviTgsWUq64RWggJR0Yh2AE8MI46cB8EagA8
         4KidfPKSl4PiQouRE9uuHz2u2WU2UYoqmKZS02JOohS69/15MoB0Ar+ywiLlFB57pFe8
         WU5A==
X-Forwarded-Encrypted: i=1; AL+hErEDZX/mDj0R72xLA39GIEw4i/oQDeckAzqezVpcWqgwqenrZGFdcwcmrMt4u996KthMyfI8@lists.linux.dev
X-Gm-Message-State: APuU4Z8pewIbOV/RVR4wTwgsJ9V4hh6nmrgPJwJ5QpmW4MlduI6Ep2RF
	4wQzcVnTuQDg+bxLNgUU5ctA8OUpruyCpdZwCPYeM0Eq+QrKgFo5KGaa
X-Gm-Gg: AZFdTZcbmjpP9CzMnub6P5JWyHxbQBqgfbP6kV5P1ZGOJFnTq27CYNsoLlIcW9UVxQ2
	IHHXKUuwV7wJsw9VPLtj11VixlFE7lMwc9qwPxP3chchRuHyBGjSdJaSe71RFKklYZwtAt57Sss
	Wb7sxiHRsQ0zlkQYUk4TyrhGhCd7u9WGLr3zmk3KTT2gtv1noxpwf3Tzv6DhU7arfxKlHv4pzrf
	taKitQCBxxS5JNCQc4xYgDjXam7I8boptWGp35ZcNuHM1HfyJ3WjSZHiqnHdFRRzY7Wo/mzYmvj
	kgGYhvW+MWC6ueeWEn1CBg1J8EbgNq3Xi5pNVQLYl370REiXtC8vi/IY0sYJ/tWV+YeZIrcTGMG
	913ZFBrRrjXT5MhV8TAytcxEUka8HhEQ03Cpp5+5fM0wrqDy4CDZVH4U/SiGG2jrWiDoPfOr3ub
	9TwOunDel85yhPT54DgSpEAjYflpU/SIQvLQIJPI/5DSua1ctNYslG2XyulqlpnIfwRfVGjwUX9
	+kbG2Km/R5OjBI+DCs5Oy5eFkIb1mxCdXbarJuGdzlYNn731BLgvBhYkj3cIh/xL4lsIdYT3/GJ
	uDMwQen/ln7ilTFX1zmDjWQkHWzcw94FBPKofigTjkBRC6ZjwCgR6T0=
X-Received: by 2002:adf:e744:0:b0:4aa:2afc:e63c with SMTP id ffacd0b85a97d-4abb400a6bbmr18514149f8f.38.1795445786516;
        Mon, 23 Nov 2026 06:56:26 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm22988840f8f.58.2026.11.23.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:56:25 -0800 (PST)
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
Date: Mon, 23 Nov 2026 15:56:06 +0100
Message-ID: <awRQxKxzVyw10pFr@ArchOarora>
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

> @@ -265,7 +266,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, vkms_config_plane_get_type(plane_cfg),
> -					   NULL);
> +					   "%s", vkms_config_plane_get_name(plane_cfg));
>  	if (IS_ERR(plane))
>  		return plane;
>

Small one: with no name configured,every plane ends up as "null",so they all look the same in the debugfs listing. Before this patch, the core named: "plane-d", which was pretty handy.

Could we keep that fallback when the name is missing, as it can improve readability? :)



Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Thanks,
Oarora Etimis
