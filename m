Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7E333729
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500014; cv=none; b=QXHJSdIaSuA+LpUzPhVRSV1eCSLua07MSsdUtS+m9KreHZZTG+Xg5VISse0Opmz6puxzaNzGe61g+eXZteqFmzrXMrWc8s7DR2KaE907PEoZjqucGTqfJnzgr5wAABhQWw387EZJOT7h3BvAvkB5TrWy8AkksSoQ5dTM2UKTmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500014; c=relaxed/simple;
	bh=7SI3pNlFJcJxczuftGfGka9em3SqZ3kPpBvA2zpQvVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3bPFbZemoFRJm1wWKPN6iuB9EgOdfOjyGH1glQKNuvzpBm1Qrlz/cExsp8ohQbwdiJ6T6o/oO6xwc/pCikTJ9phPo1OUeD3GdGzk1FZacvI+CVa28RjoDgupcv0CKcm0Lvbng4L4KlNrsQ3bnIINUf6VANG3EA/8rqxtXQsqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mytJm3X7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mytJm3X7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e8758b91so637668f8f.0
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771500011; x=1772104811; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=mytJm3X7K7C0sspVVDc0NtmcMFmIoKRfsyFBeftyfQNjtQahekrPbhJwacW/OSC6iM
         VEtHvUXR63p0C+2GWFOu+CVYNSU5J09KfaIAim0jF33t4r5b+F057ej9ZJwbroDpvhs+
         68NWX3xBJvyWDPUAy6/9E+50TuI10ihROTNwHftc+tqNF9tdUfGxQhjiNGJrpC8pasNc
         1t25V5SsJJHfv4klwP4QYif3E1g9TiD0+WB1PzCfT2z1Sk3Lsh9q4zUrEFkeOxScB7gT
         JMcSa1iP5igfMs9YYhvEGs1wZ5lOCVBYT4pUaVi+kZlBZG4y12JJ7y+CQCu5hk3BcFhw
         66qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500011; x=1772104811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb+ajUpfigq+RIG2NV/9p+NS7XUIm6gYBjHjGxo/4ws=;
        b=Rvb5MbfPemPGJejvY1x9vtBptAjahLHse1ywfjA2hB/6fQAYSZksEasqWmCYcNYZvy
         RbAcr6cbkvc9MHJWPb92PkrGZdQu/v2nCQpNP95q6dPqQdZwdiEhUNEp5UAhhIegZG9Q
         2Qmzy7FLYMb+dwdiiXIf/m7eP2NDNay2BX7JL4YMFS1L99vM5owlGYSKSOkp3qHF7BT2
         IOScMl+2k+jKardQWeDiBFIgkuTkN2ikh/X5RkNixPSb3Z2dVcCyWMj1rTK+p7TVrt1x
         z6q364xXwPf9VdFSL0hkOkTOqbVDP0K06JddL6p/t8v+b56omXbD+Ue9MbWyvwyZ2VFd
         jAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo+BqwBKdThBGubiXgjYr+V+0J/RQAX3wqgNMJ6G614U/AaWOzgbzK3fFGljymo+LjHyn8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8kmYHJAddzTnbxaQ3+jlppU2HL6Otd1OR8APLlzTE2m1yvpGv
	rQkLlbRswsmtB7tAELpw4XOM6s4M1A55gkrotHXA2/hbRh0WUTIQVR4QYv1m39NFmE4=
X-Gm-Gg: AZuq6aJ2B7zPKQZo3282JvYwAquFTFzECQ1GhMIeAYs6KWQ0umm9+eGbJBrwHSQB4wA
	wb1nzTJ0keH1Wl6fyb+k9+viu5dzPNqqNhpzvEZMmUJgj/HZKd8Xi8tOPXiVxicCMcXRLIIK/PP
	rrHbiOpQuKRI1af5xMy2dZ02wA7k42Zfk9oTRKBRCOw4b8dn8i8QKKSdML+xfz/EEGxoGgQlNPl
	XNfSJRNKazSEq4yUZZKhDK0O7t0kMYnazLu1tWU+luhVPY1j6Vsl5miL4P/7tLcZyJLthx0Kawh
	ACGVpWt24F/Hfd9HXtn3o7AJD/W5cMzqJYodLks33D7mfBrgB+rJLG65A/7CeWiwaw7Iekv4NSq
	NrOtvCm+T/XyejZ8NGugb3Vu4ruyqBjSXH4rnqZMbI0Y29j0cybdkf86TbV7ULYWhkyPT8HJXmO
	mFiTUloXZjKirPEf+EL6XD91Poi5/bkbWt
X-Received: by 2002:a05:6000:144b:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4379db98611mr32771301f8f.51.1771500011417;
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm51473650f8f.27.2026.02.19.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:20:11 -0800 (PST)
Message-ID: <47bbcacc-32be-4a64-9ce6-9b441622e84e@linaro.org>
Date: Thu, 19 Feb 2026 13:20:09 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/3] firmware: exynos-acpm: Count acpm_xfer buffers
 with __counted_by_ptr
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
 <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
> validate runtime that we do not pass over the buffer size, thus making
> code safer.
> 
> Usage of __counted_by_ptr() (or actually __counted_by()) requires that
> counter is initialized before counted array.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> __counted_by_ptr() actually maps to __counted_by() for clang v20.
> Alternatively we could introduce new __sized_by(), already supported by
> clang v20, but it is not available for GCC, AFAIU.
> 
> RFT, testing would need clang=20+ with COMNFIG_UBSAN and
> CONFIG_UBSAN_BOUNDS enabled.

Tested cpufreq (ACPM DVFS) with:
CONFIG_CLANG_VERSION=220100
CONFIG_UBSAN=y
CONFIG_UBSAN_BOUNDS=y

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
>  drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 55ec6ad9d87e..a4864973f65d 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -24,12 +24,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  			       unsigned int acpm_chan_id, bool response)
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
> -	xfer->txd = cmd;
>  	xfer->txcnt = cmdlen;
> +	xfer->txd = cmd;
>  
>  	if (response) {
> -		xfer->rxd = cmd;
>  		xfer->rxcnt = cmdlen;
> +		xfer->rxd = cmd;
>  	}
>  }
>  
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 422fbcac7284..8392fcb91f45 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -8,8 +8,8 @@
>  #define __EXYNOS_ACPM_H__
>  
>  struct acpm_xfer {
> -	const u32 *txd;
> -	u32 *rxd;
> +	const u32 *txd __counted_by_ptr(txcnt);
> +	u32 *rxd __counted_by_ptr(rxcnt);
>  	size_t txcnt;
>  	size_t rxcnt;
>  	unsigned int acpm_chan_id;
> 

