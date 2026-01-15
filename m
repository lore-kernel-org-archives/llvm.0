Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDCF32692F
	for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768516975; cv=none; b=POBAj4nyppFH2LMG2urE8kweeYs4ggjieDMl+xjzrdtfzamA8Lmp1l9AzCRbF8CYjpDO7MVqop4VoMDRe/NjVRT0c2vNnO7EyObErvcSkn+7PBx0CS7aOCPUn9bF05vjGHDTB8W1VPuuVE9XSDgtip6go7Yzd/K7rgzUeohOM3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768516975; c=relaxed/simple;
	bh=/urejZHkiW/JLzSovkhbPvkfJag0mLFQ0r8u0h3A/30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmZ5VZeInSOpVENR4n58hGjlMwwrRTlJ7pgBeeI20NbtEJvZKWmHFNijdIWotne/B5JsAB/EvfOdF9lceIEbG8qaHjcWUP+dKk2aLehJSD5awxAUabsmpiDowbTIoUz+ZLLhbVeXGv1A7Zl2y25SPFavZCazxTBsKH6NXBKfckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhYMyF0x; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhYMyF0x"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b77ff32feso200876e87.0
        for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768516971; x=1769121771; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=YhYMyF0xzMqPIXqNip8Hh9sMmOm/Noksfect2VbXA6mOUPD9V3dD8ZgPLlF29asf6S
         Rd8g8aRYTPK+4++YkKrwiQzJeZUzhrvGjzXhUNU7z949NHBWNH8q580rPweOP1j2PDx9
         WF5tkDWQISa736Qp78R13onKfGHts//5jzsYlAJ1cy19YqbnTzGmOmZ7vsmu14IMn0ls
         nsvRHvcpvnNIaKRWIWZB2rVrb7X7HJQvo8yOvFRcg3EWNf1iOZxSgIh12eVyGJg7vNEi
         RprcWhZdtZFyfPvakjr68JRao/C1yDyOxB6BimLt7N5N5v2xyI+MOMv1zs1v+j9CjqEX
         xwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768516971; x=1769121771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=TLCvUYmxZlq1vB3XiCi+0yizWUdPXnKf7Z4VV4m3Eq99q+q66MuraLArDKKOYWvGy3
         uCNpA94YbZTq/qf7nGcjrCh9/L7MCOtK8tmUbDNK90ra7VP5m6Mujj16gvlqgGrV3MTt
         +N6JcGN9GK8gMlQhPxGtmrYDjON9Hw7kCBZJwa8dHkZquTwpNf1KqHInwHBn06CuEfVH
         d/HTZdZXE4MTs5nlX+2EbFUKpQpxohfv2jAKE5gQrdIc4hJiL+pGAeZKH1jweiP8Wnzj
         LlvtcHf6dbrppEOWq02Lr4Met7FPHCK6sWwDRoFX1fHJZ1nQG2b0Qh5nhj9byESteYEO
         utGg==
X-Forwarded-Encrypted: i=1; AJvYcCU1SJ06IgCzeVPQSLnG6CnHbsBMrx/5jiNAoZzYmpOIJsYGGJEJ5G8m5tQdhsocr/Xvf0Ng@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo4rxesVV/5k+bBDUkasxvGd8odtOVQm+7puc7fRdv/Tj2cf7V
	1jv9j7Fn8BeqJy/7SxMBvZJw+sR9i9OttQpTxriBO9T6q4rgjz7CDtXQ
X-Gm-Gg: AY/fxX6RN1vxr8i2+aBt2h7HGHdKfV2HvhSmEVTHFSrWwARIirJeOY/r9HfAo6rR74f
	/W4pBJtHKrKOJCO7ioEX7ngfmM+LhPdmoadnNzMc7KN8uyWhRUfj6ixJTKDDEx0prS0KX5cozpx
	//J1pYAZhUKH5s6HmD26e4nYU+aX+N1IuBJ/n6H/RAz+2KWXZ0vc4hWc3xM6ovDrf0Gx6y/vRGH
	FWbaIB+vum2RzWkdf9KkTqnZR5RNVhboE5ZwHk1vQD5sTcyOsX9/7QEG4YPT48oUl7BnbVbmYoV
	rue8TF6GJPlLZOLxzg/n8ms4NLbORZr5rh9rfVZJl4qsltAAbjJ1HjPbNZXvDPWtsaE9SyKhDz8
	Rg0G/BKqK9St/IWSDdd2/YHqNn537VSYsKA81XTuO/qXkHlKCVVfnmoO7h3Jzn9mv+rq3XaZjyM
	lI8q9keajA5JB+cMAjaNg=
X-Received: by 2002:a05:6512:63d1:20b0:59b:7be4:8c40 with SMTP id 2adb3069b0e04-59baef130e4mr131958e87.8.1768516970797;
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Received: from [192.168.0.18] ([87.116.178.235])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf35434bsm209044e87.45.2026.01.15.14.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Message-ID: <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
Date: Thu, 15 Jan 2026 23:42:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow
 computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, llvm@lists.linux.dev
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
  
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..b5beb1b10bd2 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>  
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
> +	 * both x86 and arm64). Thus, the possible shadow addresses (even for
> +	 * bogus pointers) belong to a single contiguous region that is the
> +	 * result of kasan_mem_to_shadow() applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> -		return;
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	/*
> +	 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
> +	 * arithmetic shift. Normally, this would make checking for a possible
> +	 * shadow address complicated, as the shadow address computation
> +	 * operation would overflow only for some memory addresses. However, due
> +	 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
> +	 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
> +	 * the overflow always happens.
> +	 *
> +	 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
> +	 * possible shadow addresses belong to a region that is the result of
> +	 * kasan_mem_to_shadow() applied to the memory range
> +	 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
                  ^ Missing couple 00 here

> +	 * resulting possible shadow region is contiguous, as the overflow
> +	 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
                                  ^ same as above

> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL << 56)) ||

This will not work for inline mode because compiler uses logical shift.
Consider NULL-ptr derefernce. Compiler will calculate shadow address for 0 as:
      (((0x0 | 0xffULL) << 56) >> 4)+0xffff800000000000ULL = 0x0fef8000....0
Which is less than ((0xFF00...00LL) >> 4) +  0xffff800000000000ULL = 0xffff800...0
So we will bail out here.
Perhaps we could do addr |= 0xFFLL to fix this

> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
>  
>  	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
>  
