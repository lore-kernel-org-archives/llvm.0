Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441190;
	b=QybVMpUhEleEOuu1VFJgOAeiAWBHqRoNPSNdY66kvUY99nC7SRWPTqF0bj0l7UHMBaUQ
	 BwTaGW/1DOTMiFHtSy3j1T3PhCjM+DVh77cRDD9KkFnMHHqsV2MdzsvXqziOfyTmBBl/t
	 1uDvuBFQ+Sm4xnVsgJXL/0bssn+SAvE9pzU9t9sl8Ah9d+cZe+jk2IjU6ZmLloJlBiOnh
	 vNiuVHzr84i8NCL/twQK7HN+bAzs1cKO3cBklEgu+svl1E4ugPLQT0Yq1CRKtziWKGqHb
	 9Tsb28ClxZvkLHadYpi98WlrrBzz/JAC0uygNkkNFWA/4OBUxo0Gg/qmb0UKhVZHzeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
	b=S4RdSZJf9VsV4PH7JllfREHVP8qXQb8izT09lcvMofzM5FhHpg2bzV8mRqxMfuTXMZsn
	 wYHwV8euJxIzAvBGyHmpgtQfVJHuNWgmsL8QN8a9m5FOtvYN3o3o9dPaO9PAUz5T+I0gZ
	 9t7tWnnWlBVnvGtxFnL1agfoscRsvSDAzwFiuwErkHjkel9/QjLzKXuqInMDey3SDyvmh
	 4M19Hktz4ACWA3GTPLz1fYxBXfFGU3rUO3O3hCf1jt8V6ats+4v5GeXteruWuj1eC/84F
	 1bqnfkNxAPCiojyTthGMfv9koynWRucs8BQxkiHOctmp9UCmcWt4goEaqCT8Zj3NT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnuSP5tg;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3D606A338
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 13:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E3D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnuSP5tg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3588904a12.1
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441186; x=1796045986; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=VnuSP5tg/05PI9Pe/CP/sl8iaq9435oa31GkobQPD7CkXwvfBcsWxI+yvk7WxX2Yat
         xiNlrSESaxdwAe1H/367/iXJ+wwadsvk6vJNc4QRolnmzPdAss/92/lOObI0nPzB7Flb
         UGQj6aRbMMCF4o5WGro8EzbQYXShgWBS/pZpXjvwxqcnqX9pH2ot6T3HCKbbneYLhBlL
         xYBLwEaF1x7MDwZGXAqTqSkaAutdqfN7hbHTO0uIiX4E7EnMB4P6x4s2G/Hd+TeDcqMS
         cuNOSt0o4ROFbm6aZa4HQRUbO3YujANruXeCScOCCh1gkyeTrAmY+4ImT18+8cDBxiEF
         CMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441187; x=1796045987;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bAL0t2TGrbFIeMgy/8ZLqGke+0HtmGCWss+5lXHsJKU=;
        b=TZY1ytXsLWRMGlXo0z6qiOExTtzeMaLHKlXcZ/kAanadZJu8O3ZaFG8GY7h5p/VsBt
         eDNmWDDuykCYkdtWVJc41w85Zzcq1TBXsxRdQAmJ7kI4C5gbJy0k5/Pk0ZCvlBZpW6NW
         tRJVW1hcTFns89jzpNyMTb0Hf41u2mS/bw+Rwu5lyb4GZPXyw0Peczy82kTWIqM6tmWC
         6UCTyoWC9o55ANP1hWao/y36lvkwDJvkbc8Bl8qxiyswFCpHON4ksGwLru7tpIG/1eXb
         /6pyW+L7GGdJE/4Fp4mYhkvAb+sk5/VrST5von6BKE6iNbHc82l+jDChX3Iq3x/GUgJN
         LFMQ==
X-Forwarded-Encrypted: i=1; AL+hErGbGmHJW7lzf/J9DGN1wb8DuCFqNW5F4ZjttOJFWknpPaM+9fQSPwJouHapLVLFKYbdb2lD@lists.linux.dev
X-Gm-Message-State: APuU4Z8HamPzJdJUpfmdVDbou7mjQk8OuaztnzNV0YoVRXcPVFmS1Qvg
	dHbrwI6UKyt2JQ3Yla5miWdGGr+YW+g2N96xUimiiKJ9O3VxUDb8oWzO
X-Gm-Gg: AZFdTZegpF5SdMcJt9409a0iA182ywIbEicyi887yBiRNI7UzhWJebACVxUlnxjyRrQ
	iLMW7VFjX+6MqJNmoF1bFsuC4vBjNyxpOhKaQE3Wy3QUixYjqKyn8rKAqyDwt1t+aUEIajjzYhO
	i7Z3LLHPAEQ7q0qgTKms9ENKyVAfEulG4AzBBSrp8+Hojp7uoFedBVdc83w0RZISVDZETv2JW0l
	CSYoOvX1uR21sEXv+SHOeMnNSvIGCi/vy0jK/ar9dyNKdg57iOFw/PCnx0+yPP8euInrcfNkWFP
	KFeaZBtF/bqzMoJ1a+iyiMYWIYTVVuDPpHmszgpN8oFLrY/+TRw1JnSt1wvH4SNLV69MTz1/pTw
	Vva9+xn2J/C0s4M/BB14/hfw0kSAQ1PXZbI+C3ov/07LbylneGq9YMbKQk6S/znM5CHPT6HGGrK
	ZEgP5cpvNaYl57x+AgnvKGF4fVzRK4y9NLbXiFNToUMDhHRxBMtzrbRf92kTEl0Z/+jXVlhcuT9
	JHz3mU+fzuqLZxvIASc/aCmoYXJjuJbNBQ704naJ6BYOTnt/58nOONCqaVk3Y85Y+G1zMVymWS2
	0J321H0UtJltgQWog2mSos4wLfC+HIUGDcU+mygA0ptF0Hr1g9yJ7mU=
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr5687764a12.27.1795441186526;
        Mon, 23 Nov 2026 05:39:46 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm5212663a12.3.2026.11.23.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:39:45 -0800 (PST)
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
Subject: Re: [PATCH v6 17/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Mon, 23 Nov 2026 14:39:25 +0100
Message-ID: <awRBxApeQdS0tPZn@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-17-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:59PM +0100, Louis Chauvet wrote:
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
> index 44ded8a86a6e..4127fb176a87 100644
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
> @@ -397,8 +398,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  		seq_puts(m, "crtc:\n");
> -		seq_printf(m, "\twriteback=%d\n",
> -			   vkms_config_crtc_get_writeback(crtc_cfg));
> +		seq_printf(m, "\twriteback=%s\n",
> +			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  	}
>  
>  	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
>

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
