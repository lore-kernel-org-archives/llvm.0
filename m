Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCAA309F0E
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502375; cv=none; b=N1msqWwYn38a5vs6oqSQkt7MDAJprQd6QBELFmXmiQCWtHd2JJ9mrXIMzYwjT/c3gp6bMrvG2C5BzH8VRsInbn3tiu5upB9ZyszAx2Mk6TGl3tknIQiqZIxApAwip2E6D2k89QPTaqcYzYSjPkaljqtaVPcIK9qbtHzun93EjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502375; c=relaxed/simple;
	bh=jNG6NKM2obIk5OUBsjkkY3but/QE8iHDzB1+6teyTKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOUA3+hwlKLTAXxT3u+FKFePdKWw8L6i9LoCLfxNF9HTNB8JCn2pVAIOPE7qVHCBYmcS9yJh9zfJoslKAMgv0YZxNdcksSBCP9cM+pAAL5fA55ptl5JCKUpX4wEwSyeX9aAULwLIEcP5TPUmXFop00uy//ltl7Z5UbeTEmtWlv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsJBEm3/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsJBEm3/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso10058495e9.0
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771502372; x=1772107172; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=qsJBEm3/2SIov5UzhbqDpbQJcpbZ9KGD8SR5+sXS+0akmPgl05h/c+n/1LHzsJTAKm
         9rOjEpl36IFnjC09wUtfzr1PB0Du4QfQKFE7NK54pxd93WGP+OcWqJy2D42hDxGqAxMB
         T19Enapk6Pnl15zMhytWjcPx3SFr4qXyOMhz3ZAdx3368cBtD/zlL9d+NLDk1Jr/mUjz
         lOw43336OTMFwDCdkguNEyAO1NbB6sRWjRST5QC+iA/dsQJNps3geG7qclL223aM+5PX
         48CPXsN/Wv/4OA056arJLjXQ8Jzu7lFd/bRt2o0FDt2YXQjbajLIRAaLsrFyM5C+Lzv6
         b0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771502372; x=1772107172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=LLUPt6vbAeUQSEn2rGqdijcED+LXYehOCMinkIIU+WcNjUPZes+VNDBbFh5YrlOBaL
         U4QZ4TOHBqGTT4wFcEjn0BhHHP5HHL/TmlTbdmUvk2n289LTuUVw3Gw0qv5AL5y5FsZx
         kKeOR5+0uJ9POs+2+J2u5d0GrYTToUF76tg/e/+6MJ7AfvxCpN0i4Olqk2UD6BCyW7pH
         LNRUjrfOD9sz3tV++4+qugbhImIvAxXhMXlF0j7Ml8lg3OZH8RTLPjyut4MogpKB87i9
         HvmSXuKTlPTYW6CkOBx6reFPHVqhfNp0L0AOHfgVKuD40mi+pN2z2Fcvrc1VP5M/Wg23
         rsJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQx7xTs/l1s6M3cp+qJYp6Mbj9topEVGmLR78BMJbwAT7HEz5nqZ0zGG3WXqWBPHAiNkLM@lists.linux.dev
X-Gm-Message-State: AOJu0YxZTJde1MQyWDtl/8BdteSyio0VcdhZUaHDc9JYgHSf6qoEYjvi
	MLWQLQ8J0HZy51AjaD58ws5rKhv6AgwK4T69OE8doafqRF9QadBajWMPL77mQ5NyzV4=
X-Gm-Gg: AZuq6aIRqKewmUZ8Ck4pARUKFGUaCuG2GOfmnyU4HA2ATBPoTI5i42QTr/LwfVYMY/B
	s7jcfFGKjNgZoriESdGK8zNww8eBYSNAVy2LE+WfHczsXJKXRf7cTkqVit7DKaWE0NkXLsnpHqL
	R5vcfPLTkgZW2TUWWfG1WDmsAFDNxShCMUNpxBONjy+lMJkh/TGQsqGc2MPrWlsMWOdiNF+j2kX
	jh81tk6fscJ+hpoZd3t7wYW+8IAVeIwj3IxgTTXsHl0hf04kHb65yxdt390J3E96LcngG2O7Yc0
	+RopAx+yI9EtiAUAci1EKNGHbR7Q+nfq201rEp5ri5rYSdLg+uNzI/i9ULuzsZahC/lx3n8Aq7N
	BcdmbBIT0ybs+WNRuA4evggXWqwLLoDtsiUHaNiNhp1IgbehirO2hwARW5KAc6GMLQ5qC0B1ddk
	ISwoEI3jd/lT16bkfgqNoL46eMhaCtFNrD
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr338907725e9.20.1771502371842;
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bac27sm267185e9.5.2026.02.19.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Message-ID: <cdfa7ca0-2c7b-42ef-ab79-4c63d4c10c35@linaro.org>
Date: Thu, 19 Feb 2026 13:59:30 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
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
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
 <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/19/26 1:27 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benefit of allowing to use __counted_by_ptr later.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thank you!
