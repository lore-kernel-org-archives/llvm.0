Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259102;
	b=xh3bGdZonWEOVKUIJGsvp43fXfqIqRHZw0FwchynsG4gsFKCf//90oK8dQ2zuVEzjbhE
	 yKx+6om7BWSOx9KeOBpo8NoQcXMo1MGZ7jzywi8H2nZTEuh5f7Pu2VXEWD1RwPKuTkT69
	 88b2O934Ye/wPj7K2tldR+alwvjLUdBv5b4AWXHhv6PBaTwMzGvf9nkckWu+hLnEkuhnq
	 p7qdWGDsA8MyFIAjNxt9KSSP2kR4Uv5hDQ8gB6Pc0tZ+CGNIPnVQ21YVFIA6m/TN8EuH2
	 l2qxudcIJlBCSdzFlTulGWf6/aOqWtJ+JzcingPvfMghIo8YZWTPNdlQc3x8x+BtzdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
	b=AgWtWzzw3G+f4XKCSZNxviatCbCfD5ZvqoHs7e7hbXArIHSmgT/YM9JdbJgNBYRD0zi/
	 kRVdlK6s+ENW9lxpyEpwhZSQ1LdoNvjqG5Jom9ihhiME/S+RdsH3nsjh8DALSvdTTaeUh
	 QRrVFJWkGpoqEWO1rh8Da6AnZ1B2BFO4Dl8oKh1z16lf2A4eeQcAh0TckQBUJvDk2VS7r
	 vLKNpA2ZSQb9ZOcQseEJzwgZi8Pjai3iW8WfcNbUVYLd8YfKRyJtLDNeLj6rxdh5UtUTt
	 MvF3yw+OHH03nJbb+DL544a4vr27yLd9FFXBQC+3dFdSGq5Dzese8VwW196VO0ER0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRiVbBZS;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E449606A320
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 11:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E449606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRiVbBZS
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d581da0aaso228884666b.2
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795259100; x=1795863900; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=VRiVbBZSnjwRqoEUhqFHqhK+FC3Iclhi23Rv/NckEb92OhzpNxIT3mjWx42jORQX2b
         CweLfjZhTUINNHTw7x7zwVoiVJ9inKCeiwjnq9JkgpXMBTIpI1ULSXtEdiHy2yU4D68t
         U+r0uW1JNHstzQxx15T5xbbWwyezykAkHNXgxk02uMYliO90bTb7aA/sdULdWZ57R3Sn
         4ZGcl61Ko6QT5OSpXnIMfuVQunnbqkJgw34ozrh/L7Lm/b8qFZOhwqeG2OGW8DrNnONv
         3xVGgdGX0Tzmx78uwkI6Xkbc0qZVRF16U3EmRmD7JtNJXNpDiLRHg45mpEWOGZ6eAcsk
         09dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795259100; x=1795863900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=2uu1VRn8V1MwdErLCwimO7gewlfWDEB/BNZXnX7dqCmrUvO5VZnSTjitWvWvkIvlbR
         C5Q5KiOBpTCH7KJzrHR1Gd4ga1op/eaPi/HMHAhNW2HKNWmvEN5+xuNRX3YBF9hydLcp
         wetMacf7Orlk+j2aaho6BV7XTHbwaJo19WXsq0I+btHT6qNPmBjVLw+URj1E1VKd/9K+
         Ov3JEkWTkTXLXgcpcPrAhvGm9wzkvj8mgnKZ+SoaMWItn2VhnbIn/EK6p+SufHoGQcpR
         Fv3f7y1RsuZJJciUK4LxaWP3hTJsvTV6k8QxrjJfNM1daeqPcGFGyqJPDkGMLGsTJnEY
         u1tQ==
X-Forwarded-Encrypted: i=1; AL+hErHXn8yqZ7lTxf7K4Mm62P7tcB/vqGCyl173DXw6fZWrThXeo8TNhhReYhbLmKgvNSOpit6t@lists.linux.dev
X-Gm-Message-State: APuU4Z+lNRAgDGKCmtdUoPEmaIax1bqGLhe+zvHo5Uaj2Aqrw3rxNRlr
	04iOlsGi3JydNMUdcw6Lt3hwo9XtDYNXlYVcjJpkmhj9m/P/jBQ2NRhf
X-Gm-Gg: AZFdTZfSJjvDd4sZZnxMB3R4TVu6lGk9p42ogUdI0fwQVNXzuxylzvYn4Ype1lwKmpB
	+ubW5m0Or++eY2MRZjCjcTfOuNN2UGt1GP52+u86kXUbcb1KZ3VHcKcAfLArsMTEInr4BuWtHd3
	W9M4ZxA8LTPTugNVwTLB2lH6o5vXSXpgt+JX33gbR3XeIlgjK1d3tj1GdB+8PXArDbmp6M+RzCZ
	9deb4u8ejgS4fkOHSsEUo4e22sayV0YrTv4GOvgfjv6hRtkug1FTdEsO8MzjYqUy7Sn2oYTIV4y
	1NrBDapsACS++mWDbDQj+s2CJWQb6DchHrP9hKyMyW40Qiiof73hWGivxuYXAYKcWoEJUofqMiE
	PgHHGLiIknBom+jz9toAr0DQcpDkcVYU2HSX7seQ1VU2+TBPvrn2PERWAxk/2awct+y3SOg4RQn
	WkzgG1/tiAdOxvhB4xt/HmjHieNYETMJjSztoDLka36ZerltiTNC1L5NcOcYVKiXoKgMqXHkz8r
	wFy2f5D2R3HOqGBceugv0WK8kXc0/K/YxEUY5vPSpITeNhMhiBPPGgQeneClChGqgw8YKyYeIDQ
	5f5wvlWXS9Mh1u49Hv0aPh//M7xGXHlzTF1vQ2oWG1QRDqcAymBFug/XeoNpkadRbvoeSPnNG2f
	L6aI=
X-Received: by 2002:a17:907:3cc7:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c513ab4cd0dmr513379466b.36.1795259100428;
        Sat, 21 Nov 2026 03:05:00 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm182991366b.8.2026.11.21.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:04:59 -0800 (PST)
Message-ID: <ed689e5e-95e0-42b8-b1c8-afcc968bba1a@gmail.com>
Date: Sat, 21 Nov 2026 12:04:46 +0100
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
Subject: Re: [PATCH v6 03/43] drm/vkms: Add new lines for configfs attributes
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
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> To uniformize the configfs attributes, add a trailing new line to the
> plane type and connector status values.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_configfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 707cf3578e2d..5f5aa0a1812b 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -294,7 +294,7 @@ static ssize_t plane_type_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &plane->dev->config->lock)
>   		type = vkms_config_plane_get_type(plane->config);
>   
> -	return sprintf(page, "%u", type);
> +	return sprintf(page, "%u\n", type);
>   }
>   
>   static ssize_t plane_type_store(struct config_item *item, const char *page,
> @@ -527,7 +527,7 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &connector->dev->config->lock)
>   		status = vkms_config_connector_get_status(connector->config);
>   
> -	return sprintf(page, "%u", status);
> +	return sprintf(page, "%u\n", status);
>   }
>   
>   static ssize_t connector_status_store(struct config_item *item,
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
