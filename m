Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258647;
	b=esjH6z+ginWoKcw07U5ZN8+6e6GP2siPg+jKbZ4VpKjJRgdUoAGY8QU7FnQy/JF1rSIL
	 9NG1I1/1IXZ0JluE3EFjctWfbH63U8i79qA3Iybnww/IavJXeeeinksqRvv/fSfMKe+PK
	 3WdagohW84nfvRtxECz40ZD6zyuvUjEC9OJmzbB9GKPIrnDVcWfVtFFZnINvDziz1UxDc
	 04rvvJ7AkUAJ0PJdZZd9oRgkj9OPL/Tat2+7y3MUfkoNwQmZV2Wv1/f4qJRA12tAr5GC8
	 9FzlIBsfos0bBIL++WxKU5NsduwSY1D09GKq+2gmyEyaGigJ/+5gOuQKnaL0nzIrOyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
	b=IobZTFPGlR3cTmSNhBr6k84v85p5sox8N2n2EZU84RqdRyzSxn/x/1qTBEk2NfSwf+dn
	 LANYr6Wm5L26sdxN6K4j+lbplBjO3kYogdj2vKWFSt2zSyJheL2HYt1PaWJv14qMOtnsb
	 TsLGTALFRqaYB27RrxUdpicFTdDQyXxq/oFXaKyqNLjmW5atx5rhpAJKV41pimKeFKP9G
	 /rHtgeVNYh6dqdeo7sHwHWWjsecaMgPxgaQvsoRM3fD1xQKuEiJk3O2vCOPOOcooDDWc4
	 Z4io432mzYPjMr6e/NnjwB2DjnMR6d3gPRP03iv+CudG+2Qgsxzu1s/5bND7vAs3FKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLrPJH73;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC43606A32A
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLrPJH73
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16171775e9.3
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795258645; x=1795863445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=eLrPJH73NBV1h2VcQuTE2gBHjdB7+sej1Zas9YmTTvzzdCvhGSJsyHFmXY6SRSXEFj
         U8e9obaNMIEyJ1+bCaINYtgl3kX3QTUJRwZRoz7Kr9as6eRnzkH+w4ws2pzisZRJwwho
         lN9wBUKAK9iibnzNxIL4ZGYlPyh4gIumvI0nnFtMoEJSCKyaZ6PNhs6SHO1TAevycs05
         Iq46/GBX8nuDcgwOMpJxslzYUGx7NEqeUNnNUlz5ltEkUBRxFHDxmgQwoHRIBzBc5q+0
         IR63yQxSrp1oA1VNJbxF7gCyXatNq68jd3oY1Hf1Wu/MyN5x5Ypl2mT0YBVF//Mj6WVS
         qSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795258645; x=1795863445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6L/5zARcCLel44kQYhmt6hmNx9yE54W+X6j7p6+kLI=;
        b=quFWgQ9NRZxYsoh8MbTcemQLrzBkQHWkQeQb0en5jmwLwSSWg5TXE2ckIRKlvjGSTp
         P5aqwHvQFT3p/Yodr/zaGpJysZ5FND1kt4/MxSpF7m6zW8BUrTg+rRw6EfafeKH9RhMR
         mss59x2GyW9+EsoZLrhbuChHtNGmZ8CQ1Uw7rwjj0EYpvvnPdw20BH21n2BDtVisxEDF
         YqffMJZknJF7Ddnscy29qGxYvj1fIKVjMou4WUCXl5HX5KDKK0usW+dTnqwZbmEjEhcw
         OraPwzernbLwB4eRrt0WDHCJWZfU60t4ezuAQy1QoeLBB1HbGdY4+HWDxAOjE0ZhthYq
         73NQ==
X-Forwarded-Encrypted: i=1; AL+hErHVF37xwpE6kNbqJPrn2gKmsTO++5r+JalRulodAStg096Cp2yqufL15ZZcOdw1FhMDQtzb@lists.linux.dev
X-Gm-Message-State: APuU4Z87cUKjFwep8WmxQlLMXm04yUmUNbsgD0oeMh/WbfD5t+WxJkIF
	Rd652jWGl6i/atw/2J9tX1Wp8NTbTsc9jIA8PeUCL8L3ZiGNw41IP+be
X-Gm-Gg: AZFdTZfjYG3/tqaIkGtkRAR9nJKtj7az2DGtKNz88XvmCrcDqz59TCBIoeRtcrBRzzZ
	dcLRy1l/q8bRqjtiVffY0t7quqJ51DZw0HA5a7rZYZXTvXCxy1g7LwsPIrIXrHxyabAtWR/HOVC
	jiu6kLYsxedGuRTXabZ3VM8KkBIHB1IGe3iCPdjq2Oy0wyFGnC1cCMUJwmSBFvQdDoeVdauzRn6
	c2bvVs6KKHEztSt+UQ76C5y19W3L4NcMGhIwEGrir7XL3PQ5/DXJ2hPtov0CjJZneInsxjkd50k
	iSGKdXHbbjZXerjpyjOPA17yr1yZX5Ob00cuQ8JkKyW9BkBBzUz9JY+10DWFlgN/sjiAo1RJK7O
	o9v8QX+2B5XsgjS2OJu1kgBtaf+xKoKeU5Shkm43GHqTznhaBB/mwqvOMpQBtCDr8cGClEq+4fl
	SNOOYimPxNybxM6Gk6p+BMBpHi10R/xcDU0Rh+A9oMCmy9B/NwiX0Q1wRCf5fmEA53uYLbuG3lv
	sACBJrck5lx/3ufCvMOX2Pbdn/kcGapU8tolwuAW2AXRToHCiU1F02BXzdCJsU0pC8isFwysgcH
	GvVvByOlV/HJiSJROOfyQvjjv8BoBCEMjYv3CJu9eUi+wr/Ys5jt1pJtZkkFLs4fFP8Wt+qCVXk
	p0JY=
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr133199515e9.16.1795258645328;
        Sat, 21 Nov 2026 02:57:25 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm163775135e9.7.2026.11.21.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 02:57:24 -0800 (PST)
Message-ID: <9b43c3b6-02aa-498a-9287-b1c9d9027460@gmail.com>
Date: Sat, 21 Nov 2026 11:57:09 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/43] drm/vkms: Explicitly display connector status
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito@redhat.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of raw values for connector status.
>
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_config.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5a654d6dead8..48c60930302f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -2,6 +2,7 @@
>   
>   #include <linux/slab.h>
>   
> +#include <drm/drm_connector.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_debugfs.h>
>   #include <kunit/visibility.h>
> @@ -367,8 +368,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   
>   	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
>   		seq_puts(m, "connector:\n");
> -		seq_printf(m, "\tstatus=%d\n",
> -			   vkms_config_connector_get_status(connector_cfg));
> +		seq_printf(m, "\tstatus=%s\n",
> +			   drm_get_connector_status_name(
> +				   vkms_config_connector_get_status(connector_cfg)));
>   	}
>   
>   	return 0;
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
