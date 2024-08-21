Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB141AF4DB
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724248613; cv=none; b=tmh14qJzU3Lvcq+J7uPJMymbExTJCjcN7ImKv415tnSb01gPMPqg8Yscwp6CvcxvLjD4Rr9G+2uBt7U1cBwtI67Z8HCCgDy2qIlyYyxLRSq41NUM4gteVIm0B6tdTKBHDAYfuFRrgbv0GVyVakvb6orRXGwwN9OsDwtBO9AtkIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724248613; c=relaxed/simple;
	bh=GXPXKykwPABiuAnfK3d7eSUnxqwZCesoixLXier58IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=SF2qdFH6imiaJWFXp/ySQm1cBPomWSE6PR1zvHyQbpRsXGNTtfjh/0qTg8ub8xUd7A+/DqaIZ0ghd8Q7cKUcdkgSceto8u3/ZCph9J7GMHPf6UpLAms8gm2gCgLFfx6BKteXRacQlbUTu6oHGm//JJ9Wvh8j6WiZdofpKn9d3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewAQV5O/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewAQV5O/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5beccb39961so126314a12.3
        for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724248609; x=1724853409; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0SUgrAj1P9jl38Ec9SiZC4ikEI//LLt/sY7olQPFBs=;
        b=ewAQV5O/zxL0kOd8+lAEa1Nf0QFvxzRtV5nqT4uq9b+1BEv62VXScjcvvfsDm3yaMr
         3yTc78T823fFwTHFtfqEiop8s0YHLipF++D6S9tANOHO6pBLiXMCh721aaZfFAZ2O4e6
         b2YiKSeVeVlaoLcWiP69CpLV+N+aHfZE7QwCaeSa/uljIBtwGniRo7NQc7u+3SvWoR78
         VJzcZwkppZGUz6kKv4syEBRKulk2mY12AiaYJ3VLdN+D6I+9XOw9ur8tL/V4bJQAIRZ8
         LS6/Stu3YlF/gEHmRhre6yRIz39+cuvu+obIATpDGl9eUzPhZzn2Yy3dhwXDhJDMiL49
         4TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724248609; x=1724853409;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0SUgrAj1P9jl38Ec9SiZC4ikEI//LLt/sY7olQPFBs=;
        b=IS5rmEc9qJMKjmhP0ZDjqzKnAW9chtfo57jz0MWt3qCxrv8FV56nZ8Z3ZJ7AQxTZ5e
         FWFHqHNqgrqM/rCMo7OAlzJeNpau4gR19WSOFQ/QldybWGck/W1dI5Hwoo+ZUd0EOQ4X
         Pgn4rLzecSQQKSn1uhfimzsvaKBdDZkeN0DinZbMCEEmyCKTO1/MVdhIyK1mlePFu/r2
         gkiGoC4rsmH9AHF5m8kkiE6gQiZzBfOybPYum3p4k583kn4I3P/aDqgXBC+uRjXoOhnW
         F34hjo5NWCJNd6NnPrbF1YOKgjdt9BSGiSE0KnywKHT7E4I8VuORPAcX0rGBbThvQonK
         oDZQ==
X-Gm-Message-State: AOJu0Yy/Fbi7/lxlwN4v/Za02D486b1PpUfQTzk7IG9wqui+uWqCjccu
	4oDL1GQASOHCgUd+Xz7D7dR7Gb4zDvoGg3eN8u7PrdHrqDagop2ACYbwoKbAdLo=
X-Google-Smtp-Source: AGHT+IFGBS4+c0s+HJirz+NbgXK7PLtkffoszdufHpAU43Ooy1eYIgPyUOO5RS0mHJe4xoboOvWalA==
X-Received: by 2002:a17:906:c151:b0:a83:a86a:549a with SMTP id a640c23a62f3a-a866f11bfd3mr95655566b.1.1724248609274;
        Wed, 21 Aug 2024 06:56:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838eef05sm903593466b.96.2024.08.21.06.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 06:56:48 -0700 (PDT)
Message-ID: <7807531d-e35a-4973-810e-ca4c3f96250c@linaro.org>
Date: Wed, 21 Aug 2024 15:56:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] power: supply: core: simplify with cleanup.h
To: Sebastian Reichel <sre@kernel.org>
References: <20240705113113.42851-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-pm@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Justin Stitt <justinstitt@google.com>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240705113113.42851-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2024 13:31, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/power/supply/power_supply_core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Sebastian,

Any comments on these patches?

Best regards,
Krzysztof

