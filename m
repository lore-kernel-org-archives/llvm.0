Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB491369AB
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709028849; cv=none; b=JKQ75z2EcwgHhDIgcSGxIskBkg8aDdG9jgWNG+dLtQH8V91PH/LoxvmAPvq6lfCl/LbVTtQDanER/SHkKwTGRyuuG603bBAMYsJbeEz3cTORSIthu9XdbNd6LnyhNOZs1CtlKuXlHMi2do+zQqy6amz9w0EnnTyfgHaRgrwcBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709028849; c=relaxed/simple;
	bh=ybp7X2Yo/Up/skAf//xn0KFyXmDy92/4atlYjExbrX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYhU793mj82nh2mEOn2RtSU4c6HYBbm/ZZKV9py4y+B8vWd7nqaGDulFPe3VvpqKA2KTF2x309STjjDOHk7jxrPhUePaFx9QaMol2xbutEMAXYqgBpwpk9mRciQqWN7xNUgsvzgcRFN6hc5s/+7Ncp5vNdU0IGyZtf0eq9evC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EMezrpBz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EMezrpBz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33dcad9e3a2so1182687f8f.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709028845; x=1709633645; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZlz8agQ+YjAiyv3zJWLFDnAFeGnSfEt7c/xO61sPNU=;
        b=EMezrpBzzhRZWm31ipJ6pp3V0CjGanoed+X55JwPUJLCne7ESEAbBZPxyrkCU5hhnc
         3pGoHdPyU1TuoWm7Iv3Ky4yd2vuJ4/ilPuWr4rc8HI2EOKAG8fIvJDKyco2cY5e8o2z1
         sFhsSckzlQ3sER51HZ4ozlcpU9QBfB3Q9vG/KBuUzXVz9LVxFGfU547frKoeKqndwWFz
         T0+anudfQC/xIKvAZyXjYL2sUPjlK3Eg0rjTT/Tg580YbTI96FdsJ+96b2hK0cBFiOM9
         KFobMHW95P1m1BlZ7V3Muv2ySqs0pOW2XrVnmrajJ048ZL9D/xkK9Daz3791I5aEdYVj
         cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028845; x=1709633645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZlz8agQ+YjAiyv3zJWLFDnAFeGnSfEt7c/xO61sPNU=;
        b=N1GTVI3w1dJCjE3puaLhoen6ljelIfl6I7grc+nNH3lMla0tM77rZT4fkv7BJBWgz7
         RyNRDzNjxFev9H3kTQEkdcooqyXzIKrDu06uFPlByZvk8Vffy4H6oBM8vWxI4l7sgPUt
         jLidflmWsgs6bwHhsJ5hh87iyOkYnVPo8Uha8aCIjyd9kAoFuzbg9GVyb3KRdMT8b72s
         Dg8m7ITnrkjBoH2Ub9WaD33pKSPN9wD9x/yw1QeoRKACPitk4xndoa2k/3wtaJXEJ3+c
         j+j+iZIdR9N6DiSr+Xg2kpgWZaAzIAHl4aYuLwdNpftosEdy+g6FBS1GoVMu8Cas++XX
         svDA==
X-Forwarded-Encrypted: i=1; AJvYcCUHZGWdidKy5RHJ2VduLgHs5Ohyc/IcF8pxBf5RlTRXrmPYTXc88CoucJeRcJQFhp4fvxGEFc9x6NX70s/lfEoYMEuSwA==
X-Gm-Message-State: AOJu0YxciqVobIlVqYgmYr59NVz2R2vVobs8YBThr0l9IG8vwYP5NG3e
	iQFIMZGF7ysGgfRGZIRRGXWhCnix/DNDUi1SQ1WdqafDLc3KJRShx7R3n92hPBs=
X-Google-Smtp-Source: AGHT+IF6M/KvyQWZkBqnm+Q4tlZfBA93iXtO36HTDRvaS2rEQtKauW8pffUxFc+oqF3ND5gRvvw12w==
X-Received: by 2002:a05:6000:4012:b0:33d:d82f:cc72 with SMTP id cp18-20020a056000401200b0033dd82fcc72mr4290911wrb.51.1709028845239;
        Tue, 27 Feb 2024 02:14:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id c2-20020a5d4142000000b0033cf453f2bbsm10834019wrq.35.2024.02.27.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:14:04 -0800 (PST)
Message-ID: <6a6be01d-3453-4268-8b2e-0279cc20835d@linaro.org>
Date: Tue, 27 Feb 2024 11:14:04 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: core: Move initial num_trips assignment before
 memcpy()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, rafael@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, keescook@chromium.org,
 gustavoars@kernel.org, morbo@google.com, justinstitt@google.com,
 stanislaw.gruszka@linux.intel.com, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/02/2024 01:54, Nathan Chancellor wrote:
> When booting a CONFIG_FORTIFY_SOURCE=y kernel compiled with a toolchain
> that supports __counted_by() (such as clang-18 and newer), there is a
> panic on boot:
> 
>    [    2.913770] memcpy: detected buffer overflow: 72 byte write of buffer size 0
>    [    2.920834] WARNING: CPU: 2 PID: 1 at lib/string_helpers.c:1027 __fortify_report+0x5c/0x74
>    ...
>    [    3.039208] Call trace:
>    [    3.041643]  __fortify_report+0x5c/0x74
>    [    3.045469]  __fortify_panic+0x18/0x20
>    [    3.049209]  thermal_zone_device_register_with_trips+0x4c8/0x4f8
> 
> This panic occurs because trips is counted by num_trips but num_trips is
> assigned after the call to memcpy(), so the fortify checks think the
> buffer size is zero because tz was allocated with kzalloc().
> 
> Move the num_trips assignment before the memcpy() to resolve the panic
> and ensure that the fortify checks work properly.
> 
> Fixes: 9b0a62758665 ("thermal: core: Store zone trips table in struct thermal_zone_device")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/thermal/thermal_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index bb21f78b4bfa..1eabc8ebe27d 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1354,8 +1354,8 @@ thermal_zone_device_register_with_trips(const char *type,
>   
>   	tz->device.class = thermal_class;
>   	tz->devdata = devdata;
> -	memcpy(tz->trips, trips, num_trips * sizeof(*trips));
>   	tz->num_trips = num_trips;
> +	memcpy(tz->trips, trips, num_trips * sizeof(*trips));

IIUC, clang-18 is used and supports __counted_by().

Is it possible sizeof(*trips) returns already the real trips array size 
and we are multiplying it again by num_trips ?

While with an older compiler, __counted_by() does nothing and we have to 
multiply by num_trips ?

IOW, the array size arithmetic is different depending if we have 
_counted_by supported or not ?



>   	thermal_set_delay_jiffies(&tz->passive_delay_jiffies, passive_delay);
>   	thermal_set_delay_jiffies(&tz->polling_delay_jiffies, polling_delay);
> 
> ---
> base-commit: a85739c8c6894c3b9ff860e79e91db44cb59bd63
> change-id: 20240226-thermal-fix-fortify-panic-num_trips-5f94094fb963
> 
> Best regards,

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

