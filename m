Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3FD2F1FDB
	for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020281; cv=none; b=FjbY7HzFjREqkByH+phiYPDds+7t5vcVzjY+FyAqF2lwxk6apepND/MHmtwwoZXjntvhjTL8cUaRW+oQhUIIaFeFiZAI39s58QSkDJQ8U1lyN8XMNEifIa2Xr9yXFI5lCjNvI0b84KjYn9anxoMt9LyqVYvNyw0RlTf5ZR+Ovuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020281; c=relaxed/simple;
	bh=1uUWbAfjhQKGsekiHalIN3wkJj3mxEEBjAHougA6NbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePBLyHtbIb9/GeSMxLQWMGzYnRm/vFSw/DfhhnPCI8O+G5vXS09lmc6+Dbml3AnY4lsObXJsFQbszlSFI80gkOxKOanKTERKHwrDpApwRq4IQEdvEiNazHNclNJb1owiCUeKkTyCyyJXwBullipX3jAUiO7ZUm9D/YVpX4LS1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRkksmZY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRkksmZY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so15390055e9.1
        for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774020278; x=1774625078; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=uRkksmZYLCgS0359yzpE5hK9aU0CtbxHdD+Qzq9D92lFW28avwFQt8h1iKDLWHIKlU
         Tikry5my0vz/UQg3Q4wOWm0MVJjucY53dgbeWLxV6rdJ381CCrLkvp7bHQ5ASLWVJeh9
         nOjdih8wGFtzgFf+B6lPINv15KPBaHv+4BBaaAK26qeSNW6pQgk+YGHf8CFNZx8viJJH
         hQQfdtT3uuD6x4H0UKx3kP6rV+14FbyukWYt6XXVDr9zKki7tYu3+NN7xH8BWmygCPyp
         WAAxIb7ZXsNmzCpxd/ulZhjcHBi11lmVAHN23Pe5eL5LG+LTPyRtXNuem63o+q6oPwyK
         ZG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020278; x=1774625078;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=Fyj0nShHNY3ymMiOSkKYD847dxDcJg3tK6rYzv3epVVl1uVCetU7G2AHRhODNMrN6k
         btYzyfza9DaPopswWhqTCmUQNJIs8z5aI5zphKJXEoMZgFqpDRMiyK3Se5Hbmf9qEClW
         Lgpt77wmYrEODgS8ooYLFdV4LAzSBt/wo0Y1hZPFq/R+bdpoSmmfS4l8YOqKlYrsaz9C
         U4V70GbVn4kzkPXgsHHu+P+lFqXC7+xes0t5XHlTt519Ym3Euu6Fz/h4mXHl1FDsROyx
         b7m9u7C1qTt8fMzZq6K5WCRJSvP1Y91RE8BgXP0KdNmjC2v3GA/YUGB/ovJ9dW/Z0pdW
         RhyA==
X-Forwarded-Encrypted: i=1; AJvYcCWTTnglIP1IiK5QSGD34Xd8R06EVAkVzeGyVPS3G5LfhvIagH0f9eAn5cOVJ68VUB0YSnZN@lists.linux.dev
X-Gm-Message-State: AOJu0YyRbZRgEnKHSP5LpD+0SVm5ihhY8rbgr6wWkrmFAGJye5ZVDGtN
	p1qt/ZXfTrmjfEfRt3w/Gnwg42U4k/KXaP6ZUSEtkZVHvkjfaxBTI2Y/R7t9VyxVRak=
X-Gm-Gg: ATEYQzyFlt6scG/LuIqTQRmmTUxUekYYBuNN4rZ2VrFG0Rp1m3ynAshN7AjwvmQdN8n
	odLgvkXPCHCBtqUr/i+BAy9+zZbezDXVl+VRAQ/UFTEHWTWrTAjm2+Q5sesd2MmqJ/vNI+paFdN
	LtEoTzHjrLdHK9/I6I+wSAP9Z4oD90ejf8Jr5/GTDNvIrtb3/yKz9ouX/ppYrUHh9rFonoHvK+a
	GI1dlwn1UutwYgSoVxVd52E98uF7FNSEo/cilreQoZYBFLf2irGP1Ew3ooG7/U6N+sbXz2fG+RD
	4/6SUQaVt0JXVcAFsMISE885gw2mn1iGwavqSzJB6LTfA0ahNGIb2nr0SayZSCxYcvwaDqOpC6j
	KeiAE7aIrH2tMf3IflCRfNibaqOgZXgJcsloLT156g5Nl3ly349VvClzlpuIPpqsB7GkipwUuRa
	P66NVU9kxSZzSFynSQI0Ixm27HHuZ1heJYX6WULaXQnpNVBbE=
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr46366735e9.3.1774020277489;
        Fri, 20 Mar 2026 08:24:37 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1e6029sm33334055e9.9.2026.03.20.08.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:24:36 -0700 (PDT)
Message-ID: <e5e9cc38-9d8c-4a79-ab4f-8c5ed98f6eee@linaro.org>
Date: Fri, 20 Mar 2026 15:24:35 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: avoid format string warning
To: Arnd Bergmann <arnd@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260320151828.3456863-1-arnd@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260320151828.3456863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2026 15:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 warns about csiphy_match_clock_name() taking a variable format
> string that is not checked against the 'int index' argument:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:566:44: error: diagnostic behavior may be improved by
>        adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name'
>        [-Werror,-Wmissing-format-attribute]
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        | __attribute__((format(printf, 2, 3)))
>    562 |                                     int index)
>    563 | {
>    564 |         char name[16]; /* csiphyXXX_timer\0 */
>    565 |
>    566 |         snprintf(name, sizeof(name), format, index);
>        |                                                   ^
> drivers/media/platform/qcom/camss/camss-csiphy.c:561:13: note: 'csiphy_match_clock_name' declared here
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        |             ^
> 
> Change the function to use a snprintf() style format string that allows this
> to be checked at the call site.
> 
> Fixes: 0727615fb975 ("media: qcom: camss: Functionally decompose CSIPHY clock lookups")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f414..78a1b568dbae 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -558,12 +558,16 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
>   	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
>   }
>   
> -static bool csiphy_match_clock_name(const char *clock_name, const char *format,
> -				    int index)
> +static bool __printf(2, 3)
> +csiphy_match_clock_name(const char *clock_name, const char *format, ...)
>   {
>   	char name[16]; /* csiphyXXX_timer\0 */
> +	va_list args;
> +
> +	va_start(args, format);
> +	vsnprintf(name, sizeof(name), format, args);
> +	va_end(args);
>   
> -	snprintf(name, sizeof(name), format, index);
>   	return !strcmp(clock_name, name);
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
