Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776085;
	b=rt8HrcNm4VXYFqRRmXDMUDkWTFfLm79YxRPY6pHdcFF6xVrcZFLyDvE7pegj4LKYuqB/
	 qdhxxDrBXny3WPq/nFwU2FFq4Tk04Chf882n9J2bnNK0Ci74tBJRQBo8luvm2AoWYuoiR
	 OrFzai39OPO6rTIapZm8PjicEcFYXnTfSe5rQCjkqqi3/bhJ7qYBgTlg+IKCDq0sTPgB8
	 /2vQf1cFlyBQqzAoXenB2ILZnKXIvh/z7wiw1vZawGqZAZyI0B1f5oHZMnp9FgBoOcWCw
	 DFT5D5vYIGyA2bbrSzg6tMJYdDrhLrEK+4+dOzdolyQuLkBFzk3BhXvSDq0LBXiHIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
	b=BIQgZrL69X/H1Yt61alMbTN7wmksRhHLw7VbUAdbp1Bm8D7veEKISoa9+4Pl8roCCJA5
	 +oSBoghyRZwd3QsOiF1bWmg0m3dnMNtuTXQTZnz2qJb1dqOkwA+dxlmsvjYX95/wf9mVi
	 WK7+4QDGT6SZAMKmOTOco0VhNnRpVbYIhpdMkQkQNgjfS2W+EcEoN2qsUCCLVDse+HtWp
	 GyPr0tS34Y2+wWQ5zZ/u+JHjfZnc5R6OFsHd4HX1I9eFE4bjPRFxStJftczXVSf5mklEr
	 odH0+x+jI7Td8TiI/Iu4zsQLLSK8j7hnT38CeF12iAiUfjANPN4MfLOgLGO+c3+AYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHGgkF9O;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A5A606A321
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A5A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHGgkF9O
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso80042485e9.1
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776083; x=1796380883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=VHGgkF9OdyrmgPvoqbtLrA10ZFEX+TTS2hNN8kxGiz0ld7LVEwwMy5+jxkJpSD9r2R
         TX0xog9MTBiX+Q+r1P3YuQ//YVTvGMwPsfOXC+sIlSSX1/HbKwSeaqxpwf6HaaLMkbm9
         HHqfA9UCRHMUy5rEFEWbcNSYkajSV9wLLtYy36Pj73n28SK7lQOqO2jsaJQj0svCX/91
         Wp0vMo68eHZvNwfWZ+QncCIsPiKu353SgLd6VzQ8cmjcQTp70c70D2Z53DGTP/H2utfm
         b6GBdirUD0aEHNWpniVtx4DYFVwBqxJKNNL70x6XixKEboe3uS3Dq8e+gc2J0YY2M4cO
         XANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776083; x=1796380883;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=du4hmG12NqGMB9kD5OMRYq61PjTt+DUz4YvfRQssbXige1Kz6erDnmNy2XsDiD/FMP
         oBXUKivyuccrkTXYpDZEdEaIhii9+G4wYk30wxpHK0ssqldu5djzWyqD/NrqMootI7OA
         EeVmS5Mx9Pnxas9puYBzl4/w9BoW2Roj61qNaLkK8rF8XxJ2Orrrm/CkFCgq+36rQ5oQ
         NlRYU5Rez4o7yE8nkvgLjQsJvoIlPmeUDW21cRBOJVX1iUkTNB1FoX58VRMYNPLNqvMZ
         zlvEBckc7SaMKk7ntt3mZCEEVx9qZi+urqNlpb+UtZVbJHHXeGBjFYWKkdIhELo8n4hG
         PATw==
X-Forwarded-Encrypted: i=1; AL+hErHriwNH8Nw+6xKB/YMefmhvYqJwfEqv0Az+bvNe18Ltpg/yJYXt7iuMiAhb5oG3qkLc5Q1j@lists.linux.dev
X-Gm-Message-State: APuU4Z+PblhasTrgbVaf359GEbQKkP7QoQQGh3PB2axxt5oaNidXdPGD
	kbyttrf9jIEosm624W4J6pjVbcBTXfHbNhHQfo1UdmXy2ta3v2meyO9T
X-Gm-Gg: AZFdTZc/vHASxSNPRUTFEYADC8njW3PkGX9zOf9nEyKDShKNEWnYz/X+zGHTpmVpo8N
	1qFVFX5KjFC+xhEimHE19u6UAymatZM6qI56H7CnM7ytQmIffxwjszkuWcXvMMxKmFf1gB8/MDt
	oEtvzpQ9+hw3U1gZQWi4W0YtlXQrDtYLd4uhfObclHY399+5pAj5RpeFTuRR1opDaOqINnQl0PO
	Pqf+RLw44Eey0F3+JNtLZCpt2OwJwi+MFhlDjI7HSNbhIlN34N2Jecnncw0gn6lWlxs3wUB7CMF
	zjdp/lVkgjHpKzT11HDOvEbHuMm1R/UdjYLqjaEIz37LQzU1MW59nOHGNYK091NbD58tbYN5Mwh
	YsUPMJoywjOEfQDMr+EsYdCgfh26mNecSDH3t2KRXO5s3qjroXYdoCiyEIyJhw9NgiheOv9Gh8g
	+wl9YvWv9YU4H6A3rE9t5+8S3y4m2pOuQboXx75T/XqApwAoZS42jvfoynJ+RLdKhoURpLeT31+
	APm0nJMs5Xdrgy3etpX5nwmcyukSulSFIXr+Z8aRq6Do3uriSkpq6SfUBMEpk8O31TXeQPk8cEY
	OONXbNEdQNYdtnDQ1fngikidAA6Yet4=
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr501158075e9.13.1795776082653;
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm797348905e9.11.2026.11.27.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v7 16/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Fri, 27 Nov 2026 11:41:08 +0100
Message-ID: <awleOdfY9e_UnwVF@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:59PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index e933d61cb526..e2b656723898 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
> @@ -394,8 +395,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  			seq_puts(m, "crtc:\n");
> -			seq_printf(m, "\twriteback=%d\n",
> -				   vkms_config_crtc_get_writeback(crtc_cfg));
> +			seq_printf(m, "\twriteback=%s\n",
> +				   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  		}
>  
>  		vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
