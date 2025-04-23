Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385F1E4A4
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416234; cv=none; b=KksccT/++xez7usAXO4KmO8NF5s0kz4baVokkttLfJBzHczE5IkeekZvT3tpfQ+GwfBQFFIWENtvjusZ7JynheMR4ZM0uo2Q2I3sZUX4XrzEsf1p65tG5B3siswXwKS1l0dmQKe5bCxgcUbI7wzUCCAAWJ//xPLOhSInOUwZYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416234; c=relaxed/simple;
	bh=O/wU7u0kHukyv+rP3LMiv3pfgu7kTYDVACxKkl17SOQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g0lhkYKgiWYjLJIlTaTx4rW22q5I/HXymwJd/iTRfrG8LmQFUpyGercl7hELe0raax3+vCTo93GiCBdyGC00gWRpLMEYfCAERcJyFJniEOfQ+jDJY7xJzgUZYeDKMpM7Euke4UxPWyni3TKugI7I6pleXmvUTwf5mC+TUSYcJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbTuKlxQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbTuKlxQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso42479725e9.2
        for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745416231; x=1746021031; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGyt2WO/nhpVYsYgbyvZLTSR7m3c3nMPYmbMH96yEAo=;
        b=IbTuKlxQ10+rjjh1ASna56izp6grogw24Zk1H3J3kR3pnYXA+lFtgOCXq/19oEnw3G
         hHV/2cSvOIZsDSMy2xUN+AQrk+qBa88MUwIu0E/5oWLBNwRX6fAxMggiu+ptCWWbtydN
         4jnMXqYbqSzPuggcoWqDi1ib+yX3RMqumyJtPQeN2yec3sxeMmpugLp27lQX+1Yie/+w
         2mpsVTz9ydt7SzsWM30VEktxVOQfR0gbrbqhYNx4avfIaXO6uO121JMypkBPDtrS0aMn
         fRtLfVq7XoE0zBlgqhwJRkq9jiknGkr+3oXpYfxvlFznoxlg9DvxhV+phrt515Aqs8oR
         D5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416231; x=1746021031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WGyt2WO/nhpVYsYgbyvZLTSR7m3c3nMPYmbMH96yEAo=;
        b=jqLG39XcNRtLjC3UZSONoVqCNZziLa7kg79NALZevDlCVM5NtmSqkdZHWvzeFGXDnA
         b3+544O3SR6TUtQrydZG2RG0xPo6CiU/r90NFJv1YFJxWL4Iy7bTIeap8z/DOt2xvS9Q
         qJe1n8y5m4HLPCTs0SXzdsoUoYcaemRKCwuFa/l9DNdemMXA1Q8FcSWucrurZPqeUzoM
         DHJ5PQWBpGmmgQQTq70rqxQcgbZ4GOXaBoaGDXOdutd1HEfvvHzm+qsnUgxxzVYY/jAB
         7NJwT2ZYhWO5T/Y/muYeNPflGjI7t+ryOx2DJa25T37pU4NY1WwIH53qg7469CuPHjkf
         SaGA==
X-Forwarded-Encrypted: i=1; AJvYcCVmvJfGrJwUqDx08OU65YNZx9T7RUebfBWYohbNFceRRkSYw1K7BsUeEzkDgqWScGOd86Zq@lists.linux.dev
X-Gm-Message-State: AOJu0YzyWuY6PQyxLeXWFKiwMPM8dxCIzKcZtcEg1RpZZ+QF6oa8aocG
	gFwUl4itlu87VyVki2x5DaZPFPC0B5V4uj+0BSxRVZ2UMYRE2RNWgaZudcesmrE=
X-Gm-Gg: ASbGncsse6ScgZg1kYWK8eS4fTkSidsGEeVQWNoMHxyIlHBykaj2DMbussdCuLSOHIq
	yfsL1V64HDiRCTy2umpDO2wyo+drYEExBLVJUWVvKTMDYmzxn9zohfy37OOKlz3IxjPFmaH2HK3
	iJHj9zoVgrr9Cqg+p+7umJkSWlJpHKzC1ZtKSgRxEG/sKGqq12G8vEa1LsIaxmbTGQiO1IIekOi
	qB7dsvV4cEZlslCOdu8wIwyNPniy5mFV4183X9yma+kFFAsf/O3TQUJIidrCE630N+wBoNarLAq
	EnqbQVfTaP/N1Ka4f9Hy+bYY1cpHhsFdE2JKyw6quCYQM7N+OpgsdBtKgtrwXetLfo33H1m8K8Z
	Ld4kDv1LiFTOVJLfsRA==
X-Google-Smtp-Source: AGHT+IF9wZ55LanTIIbI52wCH2cF8QheJlF74eWrveehR1AOJn21YY4EpLHMzNbE+nVYCGi6lRL//g==
X-Received: by 2002:a5d:5f8a:0:b0:39e:cc10:3945 with SMTP id ffacd0b85a97d-39efba2da58mr13968361f8f.2.1745416230480;
        Wed, 23 Apr 2025 06:50:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d006sm19124430f8f.56.2025.04.23.06.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:50:30 -0700 (PDT)
Message-ID: <b8d21e46-c50a-4212-ae7a-d292c2ec6ce4@linaro.org>
Date: Wed, 23 Apr 2025 15:50:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: himax-hx8279: Initialize goa_{even,odd}_valid
 in hx8279_check_goa_config()
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org>
 <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
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
In-Reply-To: <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/04/2025 15:45, Neil Armstrong wrote:
> On 22/04/2025 23:20, Nathan Chancellor wrote:
>> Clang warns (or errors with CONFIG_WERROR=y):
>>
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>>      842 |         if (goa_odd_valid != goa_even_valid)
>>          |                              ^~~~~~~~~~~~~~
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>      839 |                 goa_even_valid = false;
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>>      818 |         bool goa_odd_valid, goa_even_valid;
>>          |                                           ^
>>          |                                            = 0
>>
>> Even though only the even valid variable gets flagged, both valid
>> variables appear to have the same issue of possibly being used
>> uninitialized if the if statement initializing them to false is not
>> taken.
>>
>> Initialize both values to true to clear up the warning and remove any
>> possibility of encountering undefined behavior.
>>
>> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> index b48b350b62da..92f351e66c25 100644
>> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> @@ -815,7 +815,7 @@ static int hx8279_check_gmux_config(struct hx8279 *hx, struct device *dev)
>>   static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>>   {
>>       const struct hx8279_panel_desc *desc = hx->desc;
>> -    bool goa_odd_valid, goa_even_valid;
>> +    bool goa_odd_valid = true, goa_even_valid = true;
>>       int i, num_zero, num_clr = 0;
>>       /* Up to 4 zero values is a valid configuration. Check them all. */
>>
>> ---
>> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
>> change-id: 20250422-panel-himax-hx8279-fix-sometimes-uninitialized-207354fb930c
>>
>> Best regards,
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll wait a few days until AngeloGioacchino Del Regno reviews it to be sure
it's the right fix.

Thanks,
Neil
