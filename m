Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1318D18FC70
	for <llvm@lists.linux.dev>; Thu,  5 Dec 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391747; cv=none; b=D52uMk6jJ5SstwOmusZxlgNBDCSHbY++7HY7NTwyaKK7R9P9gvyobJlSM5ANSP2wGmS04g83uTAJQlSgU5Yg9++mHoJbLMP3WakyUjBwSpf5lYOBtGCpQRBIyY/v7bz8UC2rXGcMYKjmPIUzk+ZSUeg+jJbN0WRqk8raL2HEWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391747; c=relaxed/simple;
	bh=uMfTwaW+z1uixy5zgQAaP5OlpK7VhcX7/nfcxPE3qYE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fn0/hhW50bKf6c5S+OCoSzinnuDpbiso63wABC9FuvZje4rABhQKuoMR+2LoZU5iiLcBaY45Elc2GAqJLu9kMP+kw/Sh5gvwHTFeVbkJTB3gjwS82zrdHCa9g1/dT3BomQJSsuBmOd/Bkt9W9tiHtgSS43gaYlG0vms2XSwnZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz+21IhA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz+21IhA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53dde5262fdso901385e87.2
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 01:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733391744; x=1733996544; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QUY0v5q5a5aeJy9BcvmDe3ZKrjse/FVqfzz1Ow9ERM=;
        b=Gz+21IhAJM7egRXDVKbUCFykuY5SFTnOYRxqUJKGByZXDTs8odUqA5rLhX9mGVYE/j
         /I+2oX4mA1JkKxZo05jmg7wduWGgqFYUz/hYb1Qm4hjF2m4OgAPFb/XYI3XUoW7b47um
         PPcK6S6XTDUktTRYShrieF12IAWTRzbtK40AJ0bMenTbP2uw4Ri5GQijKDAq5YWz0fNm
         HAdtUWzgJq8SBMhfWQDivvTutJPnwx+oknJD8tOxwPogvXp4e3V7reWUuwKDuT5yut5s
         3NC9Z1bxDqus9sKlZj+tazAHOxBKyyLC/KwN7GLh88eHkOT3DKr03pSP9requoXZb1Po
         YT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391744; x=1733996544;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QUY0v5q5a5aeJy9BcvmDe3ZKrjse/FVqfzz1Ow9ERM=;
        b=HuiNajNcCx6FuqKvPaLJnaCaLRYCSxXI+cucLt3Y3JvbZf2gFNNJFMapRURPVL3/By
         hCpFzg60ACg6r05kpo08RK4dgSwJaC1eLXYhuseg4XUroazZx423HtakpbqhQJD3HJiA
         kyTBVS9RRIjVa4XiidGiKw4fYW/KA1hhF19ZofUy4nilBYRg+VUbHAKrk2zcPlZuZBHj
         rwv+KFA0iku42CVHH48YnupLaOCY8d06rrrnc2t3L74BUXzeWw9yWB74uQpALSA2JBip
         3DazLemFG2QAJXoynrq3YL7fkya/noxB5t79cuBEMWyc2fgcZVhFGU/pCbGtuXDwtXl2
         C6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZvXxJd22q37ckx5l/SFOjEXIsFPXia315Ew7hQTiS24Ytum0AgXvITJIKJ/AwVyRZNO56@lists.linux.dev
X-Gm-Message-State: AOJu0YzIkevUQaJxrNw/aVESKnAnE+KDzI25ripHOASoI10s8lDmTGFQ
	6myfE8wCHr+0UPCH3AnEBLn+g6VXXo1sC/fTVdzEBnx9mKoAHqQ4
X-Gm-Gg: ASbGnctHqBqSE3BrpKbi9jXfoAcjy0a+DwCJnlwLUTzTMhdUXfdpzkd3ITfYVmytvK1
	KXs4ZyXfL45po0HDItJvEZ+FkpK1K0sMm0o3Ifa0lAnayOBcalTjqm4JQvjolhsrny8jBtYNrAT
	IBGQX/qGPM7SRjemw1rHQPcTSTjcbKmZGMXL+ZEh5vbJM4cGfWInXbME4P18cmdUhm+SdNtlI3Z
	lySGfR+HaIunV1MAu0Heq+CeakHWD3CZ1LVShr39Ovmgx+PlO3hAAiUAJ1S3/5ZnW5CSdx+uc2F
	YgRrLbgpZ87/uJSLp9i9bmlis3TG6q8=
X-Google-Smtp-Source: AGHT+IEfSRZ7J9WsY8VKTHBNKbsM71xhiPnLOEwNnwRYWWpfDNYDHMn8qsh4P9CGnvF0ibeS8Nxx0g==
X-Received: by 2002:a05:6512:118e:b0:53d:e544:3fda with SMTP id 2adb3069b0e04-53e12a31939mr5282564e87.55.1733391743946;
        Thu, 05 Dec 2024 01:42:23 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294792csm181423e87.1.2024.12.05.01.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:42:23 -0800 (PST)
Message-ID: <7194cce7-5082-4df5-8599-186c2e39c599@gmail.com>
Date: Thu, 5 Dec 2024 11:42:21 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: light: Add APDS9160 ALS & Proximity sensor
 driver
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
Cc: Mikael Gonella-Bolduc via B4 Relay
 <devnull+mgonellabolduc.dimonoff.com@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Mikael Gonella-Bolduc <m.gonella.bolduc@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
References: <20241119-apds9160-driver-v1-0-fa00675b4ea4@dimonoff.com>
 <20241119-apds9160-driver-v1-2-fa00675b4ea4@dimonoff.com>
 <20241124211545.194a9f87@jic23-huawei> <Z0eY+1X1ZSkNui9U@uva.nl>
 <20241201132054.0c063a11@jic23-huawei>
 <9d810e5c-c7a5-41e5-8073-b703717faf3d@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <9d810e5c-c7a5-41e5-8073-b703717faf3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/2024 10:22, Matti Vaittinen wrote:
> Hi Jonathan & Mikael,
> 
> On 01/12/2024 15:20, Jonathan Cameron wrote:
>>
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, apds9160_of_match);
>>>>> +
>>>>> +static struct i2c_driver apds9160_driver = {
>>>>> +    .driver      = {
>>>>> +        .name    = APDS9160_DRIVER_NAME,
>>>>> +        .owner = THIS_MODULE,
>>>>> +        .of_match_table = apds9160_of_match,
>>>>> +    },
>>>>> +    .probe    = apds9160_probe,
>>>>> +    .remove      = apds9160_remove,
>>>>> +    .id_table = apds9160_id,
>>>>> +};
>>> First, regarding the integration time/gain/scale parameters. I took a 
>>> look at the datasheet again as there is a table
>>> provided to get lux/count (scale?) for the ALS sensor depending on 
>>> gain and integration time.
>>>
>>> It looks like the correlation in the table is almost linear but it's 
>>> not as there is a loss of precision.
>>> For example, at 1x gain with integration time 100ms the lux/count is 
>>> 0.819 but at 3x the table is stating 0.269 instead of exepected 0.273.
>>>
>>> Is it still possible to use the gts helpers in that case?
>>
>> Ah. Probably not if it goes non linear.  Matti? (+CC)
> 
> Disclaimer - I didn't go through the patch and I just respond from the 
> top of my head :) So, please take my words with a pinch of salt.
> 
> AFAIR, it is not required that the impact of integration time is 
> _linear_ through the range. The "multiplication factor" can be set for 
> each integration time separately. So, it is perfectly Ok to say:
> 
> time 1 => multiply by 1
> time 2 => multiply by 2
> time 10 => multiply by 9 <= not linear, as linear would be 10.
> time 15 => multiply by 15
> 
> ...
> 
> The notable limitation of _current_ implementation is that the 
> "multiplication factor" needs to be integer. So, this may result loss of 
> accuracy.

// Snip.

I ended up re-reading this mail as a result of running some of my 
public-inbox scripts...

...and I noticed that the non linear correlation was not about 
integration time, but about gain. Eg, if I now read you right, the 
integration time is kept constant 100mS, and gain is changed from 1x => 
3x, which actually did not bring 3x gain to the lux/count values.

If this is the case, then the GTS helpers aren't likely to help you 
much. Sorry.


Yours,
	-- Matti
