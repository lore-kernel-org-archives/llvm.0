Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46D1C84C0
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496187; cv=none; b=Sosa7eTPXIm2jQrK9pOy8BgrhYD1Ge1P4C0EgLqVdMi6vCQTejPn6KtIZ6wMfmZKeH6ySQ5U3563b43FoeUSe7m+Je8LCHdMNDleX/LN0peZcnwJdXHhwTOuxgJ0a5xmBL0Rh1D6ETcimzAfPjOeFGf5Bx01r5FSbxdqAnK2qy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496187; c=relaxed/simple;
	bh=w0okaFhRI38jPOXfvOe7745j7gtMsdJt2nwM9DZt5TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLfm19a16bxtVFrtgAD4lZ6ByyNRLrQ8qebwhIqEopxZlLQGzdgihXrwgOsqbzcgkgpsExOOjkIjCSrbPvtO+LAXbg4jp6G68BdKClxHQ5kMzg6DbEzIxb1rjKimdzF0opPTHX4HwAHKQ5o4PjIOpKhcgLfLERuzxXXzHb/oDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ByLOWeHF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ByLOWeHF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43767807cf3so577489f8f.1
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496185; x=1772100985; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=ByLOWeHFzVK9cQz6luycF3M7a3EGUxthA8bRVyoBUkGL+QJ6iR2mMyZVoUZf+6iHhb
         1TRVbVzQhIrR/ehMaYHrHKWfCOPn+kMgIendpnAOf8BCd4j7v9E5MOX/h6kmyMrxquCv
         vYt6T65sNJBnB2uxT2p+VNelxkJZLvWCYCMdK3XtzbKmbejRfWzThYoGu0jiJ5gsnFJr
         gA79nsmYg/Kdi8he2S8qi5pS47jzMsguKgDc+XdT1qT4fOLfh/J8dm/8cCKW2a0SoIMS
         U/CcD/hNg4jGyOxj9cJHhDJdF4xyMxHBgz3swMFI92Dr0wNAqCJNdGyKyFbCqmqQjjhn
         vkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496185; x=1772100985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=IIjnjhwa36qWQ7xW3I/3OE0SV2dqa4MIYGMnxt2FDAqtjYSMlw1xqV23BB058UAHgp
         a6TP10YjDAa8n48gVF9PXE/LtvfzjnGTU72kwppc4oSdZMJz4RZS5XD0pv8dYh35hI1Y
         HC1BLp0pDnSdCXbXI1vGCdlg7X6A9wUUJV9o8kJzthW/7OY9NY9qATgt165DGu66n/M+
         XlUawMtd/cyLNiBKQGYwIZ48h8qXDdsb7ijO2tYuKW/0VgvXqvJ1rurNdu2e58+TerHn
         snbksOdejY0kUCUlWS8PHlHuJfD5OIOVhzCMu/wAXZJfLV2wPdUHh+m/+pT2mB8tQ5V8
         57DA==
X-Forwarded-Encrypted: i=1; AJvYcCWRa7aOiFgBXNpOVvg0kr73NW3L2UoZJcQh/oP+g9lqpurVUEQXeNewRbhfLBNXhDab9Kld@lists.linux.dev
X-Gm-Message-State: AOJu0YwrpzZRRAfW6/ji/j1h0idUykF2mW3c0jZ1TPl1urAheld6ZqSP
	fMpZsK5lz99kpREHgt4qWT4mwfGSIzawWsbIMM1bQibkcQ2XDf1iSxfIxEtKKvzrz6A=
X-Gm-Gg: AZuq6aIXNDYP9H51OxusWjjSqC2LSYutY8rr/3btcDbD1t5kQZZch+I0C1WkaLMk8eU
	DaQIWNe74B4Z+JJFAh6EPuRPCo6F8K+IHVHtCJ0LZFSGPAWjdMVwFehGc2j9Pxt4X6/clz1pwkh
	PP9s0kVmUp4nJqlpDgHtsrXePzwlRUVaOfVVEFOI2iW2b5I4rftnHuDFUMV2C6jasvOB8VcpD9e
	V4PmFLFPtBCIvACiyVF4WEfBVoKICr/KK+bCCzLZiY61S7eTioT3HOVNTapIOaJzkGyU0DuCLj8
	syXuCtawWXgGUp5uAfEXV1tI7P1kQXsAIvM8fEYVo46lEXKSa6FdBRhGxdIrLr7VM5rdTpt9kxK
	rPxyjrGoPi4nWs/MeqY/yGx6Yzon7wIMWH7hnZgyjLSxgmzRmap0ARAMlmxcKPxyyFTt6cktvYD
	qj8extxolqsNSFUX2BGwdKjc/BzuuaRTAL
X-Received: by 2002:a05:6000:4305:b0:437:68d5:f167 with SMTP id ffacd0b85a97d-4379db9859fmr33226037f8f.44.1771496184734;
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm14050703f8f.36.2026.02.19.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Message-ID: <17020b22-6e80-49a2-8890-b16917586b49@linaro.org>
Date: Thu, 19 Feb 2026 12:16:22 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
> as index of array to map them to error codes.  Array index cannot be
> negative, so make that explicit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 961d7599e422..44265db34ae6 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
>  	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
>  };
>  
> -static int acpm_pmic_to_linux_err(int err)
> +static int acpm_pmic_to_linux_err(unsigned int err)
>  {
>  	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
>  		return acpm_pmic_linux_errmap[err];
> 

