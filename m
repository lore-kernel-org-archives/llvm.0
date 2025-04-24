Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D32135D0
	for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480124; cv=none; b=Lksy/4xT566qqgc3rWXHCOP5gf5YdHg4ULtEQ8iSZsTs47jhM/2wUzRKHsrNU4fb1U40l7l796z6LQCdptSZvIqJ4ZUUDM/gsglYASI+cqdUG3lzzEgGHPr6un0ayrbZ1t0o7XUXV7mfciTFA9m5mJlbxT6tQXbeezgV/ysTOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480124; c=relaxed/simple;
	bh=w5CeZJEOONDHbrtkk/IdhPt6kfyEe8KT2zIeYourvzA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YKGdy1ifb1WaoTrQHNk39w3R1MVwuXDCufrUmexqpFP7B2cWU9Iu+3yLiexOxQkOJ/lExDb4O0zQM8ehlkBOsRQXuzuJlsSSucXhdCMGbPsCGZ+Fd5sBFA05EPPSKYVc/odJoxKcdk3J85EpqkhnPiRfkOowo34Vbz6oiSh1TWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGAiM7KU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGAiM7KU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so604316f8f.1
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745480121; x=1746084921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXlYjjVy/mEfKMv4LTdScgURSp3z8wVfLOByn6QRb6Y=;
        b=DGAiM7KUL2F4gpzp5GwWqDnCTZUxYXtompLS8VrplNoQPtsvakO6Fx3bDLUN9t72FO
         ge+m/6EefT5Qe+2hke8UIb8o4SEKYqV7thI2qstFDlimVE5bJcFfJLUUA1MBwSWrOXo4
         NcOAzXIM+Fc7bkLE92K6RanuhtXTvLOl8VNzy8Dtp+bJ0NbOwyrhUbW7HvM5XwG0dJmy
         LWl4p+wUM1NidES1kEmWnm4U5RM0wqz8Ytdw73qnu6Okag9hv38HHvbqE6JyAy7DoR0s
         gnLMHJGjx2cdXQzxHgxkiN+DeXd+/qgIE4TxP6nmWAFst2pfNhDJRpUDrxoEeN1OkD3W
         tgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480121; x=1746084921;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NXlYjjVy/mEfKMv4LTdScgURSp3z8wVfLOByn6QRb6Y=;
        b=Ci0ZCuumJtOCm1g2sih0yaZ60aYe5HukDHoCtfWtHQ2ThMUfhmDcxj3bg/sYgGFr2R
         ooVmI8ra7H/UXz7xYnL/uLRUYLUpllcU2G5rGKELfqRXnwLW0ohj4Yoh7kww3YGeKdnG
         gQNB1Dftqh8oHU3rC3rkVekHP4Ju9smiGRfjv0/+ASf+EokvHJ8aR90Nw7ynlE6bH4D9
         AgsSOoPJrlh2QSCElYqzDNhjRmMTVUxsC9/lmeUXOHSzMMp9hqK2VvxKREfj/TUKjUT/
         F3B52PYXp9LVbXqhQOOyvTmKqHxDZVej3q964unN+wWsYQ0YU8UpGoH0kKfqymDpJ7He
         e9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlALErPDQTtch5etrs3K9hQiZo07bnssd392KHNtlrvODomjAQeBwtrR9yCnx2LPe08WfE@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzg6WxVi+mq8Ru22nhJHbTcgv2CRd5xa8PSfNufJW4jkftuULN
	WgcQADFITd62YgPxH/cvlLywowdtXXg50ukIKPGlEmS7bLtfkCgthwnfsJH0dMo=
X-Gm-Gg: ASbGncvtm+o9p9VQGg6LEh44kxYd2PIGiPgbSXxHoW/sDlCPP00DksgXyIirtxbq+1K
	+odYJLcozHVwUeFI1GSlm1AumW3RfZhOb/S9fskWVpkVV8niOIHuIC8Ww5+t+SQE7kVrry3mMyP
	sxb6MGuZPSMECkUecbjLAJKhAbqQ8xnUad0lwiqxyJLno3I9DUrObhJ/zjnjGBcstr3vzsYZ6Aw
	n6gyryt439xnk5IVe6XCguRWaUgHh4I9q5qTEibawos04F/Ge+rKpUExloY9p/m3FDc4KFCgl3x
	dqmVpcX349v58N/8nZ/CCx9o5Wqk+mmS4sGKX3eXasHwcSzxcaEoy5zlT2yCi5IZ9SmJ5tO3V0n
	wYA1srBygZ5/kUkEBro76xe5ZVohp
X-Google-Smtp-Source: AGHT+IGcEWttEyWTq5B1l601OvcNgkQkRe4PgweFiFHW9TRCY66ESSb0W1W/0ogB3wW3F9wIzHy0ww==
X-Received: by 2002:a05:600c:1910:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-4409bd8fd96mr9970555e9.22.1745480121293;
        Thu, 24 Apr 2025 00:35:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e0414sm9350205e9.40.2025.04.24.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 00:35:20 -0700 (PDT)
Message-ID: <6be816bb-2163-4691-a728-fcb555e11b77@linaro.org>
Date: Thu, 24 Apr 2025 09:35:20 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: himax-hx8279: Always initialize
 goa_{even,odd}_valid in hx8279_check_goa_config()
To: Nathan Chancellor <nathan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 19:41, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>      842 |         if (goa_odd_valid != goa_even_valid)
>          |                              ^~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      839 |                 goa_even_valid = false;
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>      818 |         bool goa_odd_valid, goa_even_valid;
>          |                                           ^
>          |                                            = 0
> 
> Even though only the even valid variable gets flagged, both valid
> variables appear to have the same issue of possibly being used
> uninitialized if the if statement initializing them to false is not
> taken.
> 
> Turn the if statement then variable assignment into a single variable
> assignment, which states that the configuration is valid when there are
> not all zeros, clearing up the warning since the variable will always be
> initialized.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Initialize valid variables once using the inverse of the current
>    condition (Angelo).
> - Link to v1: https://lore.kernel.org/r/20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..fb302d1f91b9 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -825,8 +825,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_odd_timing))
> -		goa_odd_valid = false;
> +	goa_odd_valid = (num_zero != ARRAY_SIZE(desc->goa_odd_timing));
>   
>   	/* Up to 3 zeroes is a valid config. Check them all. */
>   	num_zero = 1;
> @@ -835,8 +834,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
> -		goa_even_valid = false;
> +	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
>   
>   	/* Programming one without the other would make no sense! */
>   	if (goa_odd_valid != goa_even_valid)
> 
> ---
> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
> change-id: 20250422-panel-himax-hx8279-fix-sometimes-uninitialized-207354fb930c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
