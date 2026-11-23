Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448202;
	b=xXTasEhSB04J2c+0FRpvjJbSW7yMafPpRRVfkbUGvyg75EWRtCkMwWY/yxute0fhFPhz
	 3W8nZit5AZDkKwv1QeX/+NKmVdauqcboxAbxka3OZnZPDfViBTgnkjcNS5oCe9ZkROUyq
	 fzo4U34HZ9AfyD164LSpazI3YMi/1Wv1YYnWFVqv9eFk+YAVnImGlp6v4WXbNl5HALqE4
	 r+QQXiGi7S81WaJ+NEdi+OTiBL/6CpbAHn1MGgioY2uKnbeaNGHQeQ8BVI9EddkfXv5Ak
	 cr8S8BaBZtytD4zpwRdH5c2/4rSkubA+sryVkXUuMkrqyodE4knVGpLPYbywkmSKaUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
	b=mApAGMDI4Qu4x8J3T4+E2i6yjv3De3hyqdgxuLBcyEVAfhMTmc5hN/zHXaTwsU55EEa1
	 WYrGJxXQWp0afe7x5OYBas61QrZlBUzEE3C1K6zsQohQONcUDw5DbpKhBPWDslbU+JgQB
	 ST4D8EzlMJKok54TlSxT4o35jFJj6CNqmkJF6tp+v4gEof5NOH8lpXc1QQdifPj5FoIo8
	 NDVGgIRqfc3B4VdgSDtMV9MqVYozoBdt+lKjpdtQd6w6Cs1nPQV8W3CszKH8gAkE4vK2j
	 ySfOMXGGrqHbxf0Reu0MRPGyxt2OZHUHP/fmD8D+m17zmZoIpJ8t3Oadpjj7wzC5/5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R60aEJi0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB79606A327
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB79606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R60aEJi0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so15316285e9.3
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 07:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448200; x=1796053000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=R60aEJi0T1BOxW71OrdsybXMXSEH/Pw+zQozyjGO/XMpCbinmtRqCUzHwEzKFVHnFs
         MpioEC/5hvu4h50iJJAZEEA+nbl5mYzQApN+1f2Zh40CY72byfzUUrT58h4dlJo2phOk
         uHSjHLmpNL0KIX/zFGGP/9R22wBiRXtKtxA3b8arEkpmEbCWj/cxvFTZhyaMeAqrD62F
         kzrUonCNPyG1I7wnw+tKAn0JervG1mwuCDBtOvvNdneYwNmOo0ISMW8MO5dfzZVrlYVu
         KrxnW7p5yI0bim71xSh6zd13PwdMmuY2fN1O6pVxc4zxI3VckoJvwQzJOJaIn0XE12cS
         KGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448200; x=1796053000;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iMj2t4hUan0LrC5voc+bXHqikDQMoVSMga8MiF5GiH8=;
        b=sunXPSB9HEqt8kvYjF+Na3+/vHW10Xts4y6yOK4ZpOJOn7zGJJEJZ21gnFHxTCFkhc
         fuBFdxsciBXsDsQUE8nnohmnX2mtsazjDxtXAG3kJAkuc35gkiVfI73DmmNh49kkoIwz
         livGaL2RzRHLt7shyMxRQWcTtbbQvavGUczJHI0skaFWQWz2NPzhIyqts+kI4LyHivHn
         YDmKrrERQJhnXuV0Z+3Kw+D95gKIi+9I0y2uFI2JI3LLf3oTAeTyhXpM3FbvQ2kvRvXm
         ORkqt7/7k2JspB+CvFlB+Gn2/lPy3VS9qYYsL1/J70NShOXLUudz3dTnF+NJbi+D4LOp
         OGow==
X-Forwarded-Encrypted: i=1; AL+hErHrdjdhQYTxcnuIhZdnsyrIPB5e204rctbbngLLgc8TSmZYgSgAQijSHz5hHUr2G7xE1cJh@lists.linux.dev
X-Gm-Message-State: APuU4Z+ET65DSLG2wYq0wuBVau0LSS6yDwWOnJ/bxUdJkttpwJ1jDttu
	MUcxOCGJ6RJSljOHWLOuj0F5r4ERhw0URYDpFVagHqhLuNaKNKiQmT6g
X-Gm-Gg: AZFdTZeiiBlKkCQ+u7HPS43HIbOS14O6zq1LomxquTHBgug1fqlhGWqX6Vm9CRzzNp8
	GnylhAWy2cWy2BJt0Fk/qsb0v6Yf//+c2dCrDItQI68oPOYsZC383ULT47TDLckLiHdAij73R4l
	W+j/xG0K61957GysrAYi/qnA2VgLuJqbxUfvmFXKfzW/WG0GXqcBLCjjETK6Avwo8BrR4FEwcj9
	Hl/igayRHewfZcq/k+IF/3QQYetkVmN8VDkJ4M9SahXjXAScpunXkQ3NRFx2vKEKKL+buZk/p6k
	+BkGGMEISh7yixtu+tEh0m82rfDsEuG2lipAPzj5gowqySuWcy9tmreW+NtrZhT5plVmzJRu18H
	DfwwPlMiN3FPB2ddFYcxqBUeRcBuBQD/NzMotbQQ6y/OQKq2YIh5iLL5F/GuFWclzJEtvlgKLTo
	sY8I67dSEutGCn4Q2VZW3p+tPFbAwHRRa1YX0mvu9MEx3QMy8XFZhNhyVpuDoE+cHoGhdY1kA0c
	kh9Mg+bVo4EnUlDA+p0iGh59bzphUMPmqONbcFbPcnYT+39C9cCMsf/8n6++vvA/ujpcuh5wkUG
	tHFVIxTZiN4xOndlbYPMpQbA42MO/04Chg==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr280286605e9.11.1795448200216;
        Mon, 23 Nov 2026 07:36:40 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm193318255e9.1.2026.11.23.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:36:39 -0800 (PST)
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
Subject: Re: [PATCH v6 19/43] drm/vkms: Use plane folder name as plane name
Date: Mon, 23 Nov 2026 16:36:17 +0100
Message-ID: <awRbCaRRole752Pk@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-19-78ace90f4fc1@bootlin.com>
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

 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index a7ddcfd4e86e..3a1a34643cce 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,12 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
>

Oops, looks like this leaks the plane allocated by kzalloc_obj() above :)
