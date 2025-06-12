Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC322E3E3
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725647; cv=none; b=LLQZIc634KjXLq4JDfIKbzSJFK7m/UgDw7Tz/WDU2aUfztR8qpFI7VRqd9aVwvQ9BWudhzCjtDGHZLuQWP/I9sEb66iqbNu8r3zuF5yiC5fGStajpDU5lTOc12XaQlVLhEqX3yTthmfapHGLwRIgau1wZxDpZWWCcSaUUmDLbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725647; c=relaxed/simple;
	bh=+ZKq6kYKGEDqf9llRklf/t474d48ZEQE4GwU/OUBlGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGqFgokHxfHBSeayRiFyXOLefMS1RU2hUhnYNxabzgMmAnDiw4AywqRFYwEdNCyWQTPFOOd7d97S45on6pcIGyIWM1gJ1LW6GWK31sa0LGFSTPv0WIa/1ZOc6gBuJWK+dyU5DRhOrHS2qPgUls/GNPbtxXNgU4u8TXOTsWfasYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=qDHelQeI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="qDHelQeI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so6359135e9.2
        for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1749725644; x=1750330444; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxQFgQ/4qwTPb8prTWvxvzUBOvzju4RMhJyaNcL4t/8=;
        b=qDHelQeIaZmjWhE09JmcIlmlZAfD3QcbrSumcRNcTux8wQ2wVmwLx+6iWTvhz8dD3y
         He8b4b4CAF2qDu8RfwbZk0V7msSfuAj432DYRobHR7a4QgW8aXrah0wFOQgk7a3NU9c0
         rmKa4Pps1c9QCjEPISVhNRZSvfVsazz5D0JN43F4hIMlcJ+WAyzlxuJyTV7RstkZF2Yl
         NVuxuR9Q9gZgYYXW0EPEQPo+iKRRvGD1DRPFRHW3VAwOl6x5w9QVjIsfhq1T6weUkvb4
         SizBlmJm1QsAuPakmVObWdGoSa+W6mYNHP6BhgL9jtxhxuYX7Y5XeSGVn0uwlIoiVKIj
         8B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725644; x=1750330444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxQFgQ/4qwTPb8prTWvxvzUBOvzju4RMhJyaNcL4t/8=;
        b=sWLsrCajNfMzHOR/t0O9Jbtu/oC1/RFYQX87cVswvSPBZxRdBYyCBOfmfVpXokwdT8
         2mJOFuql69BxGggvB4ht8MKRiV5RmrLVOaSDmbT0gQe8iiJE7kT3jy7uaIaN4I7/m8+L
         KtOiZIUXma50nC5xK+/PngrSxvMNSjMhjuLJYgty2wAqkcYN/D6DTybRUufyaHDWbAA5
         7uZM6Y3ywtYE6lCs5ULjmZCj70leK4CeKDjs2vox+68rODHAWOiXJwwlsEVZ/MOp0nqh
         exb1Diha55BOMrET3AgXq75QvUMeU+KKreHaNftcmJ/meLv5EBI9eJk+Fic50a6E3tOF
         ALsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5QcW2nMPmXEL0iF2wWCLR0nJ2f7GzGfBKgxovDZXVeQTohZiGlX/9fw2UdGrbvctSdPGV@lists.linux.dev
X-Gm-Message-State: AOJu0YxYbxHozc3GibqN7oLfFMsiie394Ug3Xop8U6yy0M/9Rrx1JVCH
	2dxFvkuY9JH3pfj3IT30ZSkH+9un0kwYoaWU71r8a8/r4H99WauD/a0WjDNQDBxwJeM=
X-Gm-Gg: ASbGncsDhDk2Cm7c3psehin+40SBTrspCNVnuyqrn9IxRHt8knF/9o1kVe6UgG1XcCU
	arFpGYjdj0t6YafYEBg96CgaTJ/NV5Nmev4FXQRuQE++X8t7KQBYMePYyuJxeABW4eP/4qKCiWy
	L26PatLEr33RJ0Kbel1ccy1aZPgLj4Zx2xI1Pf/XXgc6dMoUlaBL7AqsYC/LusKDSPfkYlDVGbw
	1kXaQ3fEHBEY8RvG70zv9U1PzSPxToA4Fn54uc9/8bZ3/H7QvrwMJdxaRxG809Gyogd0zAXUAyh
	vGXjQrW0YGVjGCc8/MnUgJfOQe+Ii73xeSi/F6guC8iCKQtuBGc6jQAcZmJeoPIW3PRQ0Y+KEKR
	u
X-Google-Smtp-Source: AGHT+IHML/xG07WWPTOnuT8iOLag9iTtPlS9ekWXeBJoVCXzsh04s+uwSY/h6y2MkQRrFsmZOTZpUg==
X-Received: by 2002:a05:6000:2887:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3a5606b5920mr2289812f8f.18.1749725643997;
        Thu, 12 Jun 2025 03:54:03 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199f2aesm1615096f8f.40.2025.06.12.03.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:54:03 -0700 (PDT)
Message-ID: <8b8c6170-9e36-4090-a49e-b1de41ff0c5c@ursulin.net>
Date: Thu, 12 Jun 2025 11:54:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/pmu: Fix build error with GCOV and AutoFDO
 enabled
To: Tzung-Bi Shih <tzungbi@kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
References: <20250612083023.562585-1-tzungbi@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250612083023.562585-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/06/2025 09:30, Tzung-Bi Shih wrote:
> i915_pmu.c may fail to build with GCOV and AutoFDO enabled.
> 
> ../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
>    116 |                 BUILD_BUG_ON(bit >
>        |                 ^
> 
> Here is a way to reproduce the issue:
> $ git checkout v6.15
> $ mkdir build
> $ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
> CONFIG_DRM=y
> CONFIG_PCI=y
> CONFIG_DRM_I915=y
> 
> CONFIG_PERF_EVENTS=y
> 
> CONFIG_DEBUG_FS=y
> CONFIG_GCOV_KERNEL=y
> CONFIG_GCOV_PROFILE_ALL=y
> 
> CONFIG_AUTOFDO_CLANG=y
> EOF
> )
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>         olddefconfig
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>         CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
>         drivers/gpu/drm/i915/i915_pmu.o
> 
> Although not super sure what happened, by reviewing the code, it should
> depend on `__builtin_constant_p(bit)` directly instead of assuming
> `__builtin_constant_p(config)` makes `bit` a builtin constant.
> 
> Also fix a nit, to reuse the `bit` local variable.
> 
> Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> (https://patchwork.freedesktop.org/patch/656115/?series=149617&rev=1)
> - Collect R-b tag from Nathan.
> - Rebase to v6.16-rc1.

LGTM. Pushed to drm-intel-gt-next, thank you!

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index e5a188ce3185..990bfaba3ce4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
>   {
>   	unsigned int bit = config_bit(config);
>   
> -	if (__builtin_constant_p(config))
> +	if (__builtin_constant_p(bit))
>   		BUILD_BUG_ON(bit >
>   			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>   							 enable)) - 1);
> @@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
>   			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>   							 enable)) - 1);
>   
> -	return BIT(config_bit(config));
> +	return BIT(bit);
>   }
>   
>   static bool is_engine_event(struct perf_event *event)

