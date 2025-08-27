Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FD21A8F6D
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756255583; cv=none; b=pHn/1Ve9YYbMGCQwsjm61ZaY7NLWWipluKyT1Shap4WjdBUhuCMlNuLvouTunuiFcJ7liSqSNK5wF6WrDYlveVV2Le8pJlQ05Nz1DVQPMtvirEZzkXG759nXp5sCxtk11cmUXxssmQjex1IeHiVBRtPiawPHeDoRtL2kX2fBV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756255583; c=relaxed/simple;
	bh=H+kkfzVW4fOfE6BunEcIw/4uno8zsE2Jauu4d0HhpAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1t4obXXkNBvXJMMIfUVPxuwHO8/aptLqtaBUGZtHF0zQ1x+nWo4egjkt8RsW60ZytX43x5FupBMP0s7LMA4RCdnU6gushY1GFR1TdkKwXFvcJpW7xjIqkkUkfPeiSsr8pP5vmOYficluRL4VtzXQOWf65+7QOlZ0Df53b2wZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=E9V9JE8y; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E9V9JE8y"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-88432daa973so158350839f.1
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756255581; x=1756860381; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=E9V9JE8yDtfHyg8M8p5edfQhaqqHaN7x5Wo2dly1oC+aLIn3iJe+Pu83SKZ3d93lKv
         B2tGI183kKc5mXc8522Qb45FJZym8cj1rMPOcWFqFi7PY8Mmw/yOz3yqcQMrIxwPEqPk
         wbrCqOJDj0DrTJwrcusSwn6NEZYWB0qFBodP9LYW5cgPSq44UxA1cbSvc2e9hA4HSAuJ
         yWS3CRtqJ2NCSUxlO2ooB8CGKSDXqHawYNdUjXCikZzs65W9LbH7Gu7cJ16qPwEB0seq
         PcFE1n9rmQDnv7S9L5g+v0zjBVkw37IE3mLw6ZKb6GuXk9v14sRw4zFRTNhwMkyf+KdE
         cBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756255581; x=1756860381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=R5MUIlrCMlvEJPnoAHqfvdxNxWOay5QJKTSkMuAd9Aeq55tMEp9aVPcR/lW39VD83Q
         4hmrSnzza6NV2j4vw/qckfETfwsD/6Hcwzt3/tIYKwsev5k0C7WB8/SEyvOp+iQORCVH
         Orzb6qDUuqN187A67ZGyyBFYK1OrnPGxFlfM14++cQ6b2xh84ppzKbK0S/yf9mOXO1nF
         5iFVzltzlpgTfWi+NkSyAKhjEE+drN95mqmYwYXDpkPK3V6VMMNisY2iBFi7rb5FnSv/
         M2pRMviLqyqRUpiKKoa9cE/ZT79u1FTlEDeyTCd2yILuKRPDN9E7q3jsUKz1pWcwBGeq
         YHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs7Jm1uyk5UboSqNfE0R4U0vmh6G76bp08KfsCxFJJ2ln4y9kSxWA43j7C4z2juCfpmUCw@lists.linux.dev
X-Gm-Message-State: AOJu0YzdsR7Wx96CXoyTIzIcwNZgi4EIIvOcUq2VgJEqOd+LsfOgiuEt
	p+FnOug3DXovyMf71Y2pGO/nngvHUHF4DdAs4FHRDbgfrF2AxenDtEeKqX9KXGA5Jbg=
X-Gm-Gg: ASbGnct36kGS4eMJMfiQNt+aKfPhN/ITGGMj1YZwbIzpMoK7FnU3DRlqYcNtn6hQgat
	TPYT5tgQ888YChlMe5p+5RuL49nafVgd0OgSXXlldJJ9zcfx+Qr6stxzWjknL+GUXBhTqdSgBjF
	NxMJZe7yl42KZynW4egrRzxPuI7B/dS5l71t3j2ClJkpvjgrSmXkcPYFMvUARyGzJrW5omIX8gr
	LPBLFTCDfVSQbS+UTqefGWg3NCumIOh9eyynbD9r/6kYZD0wa0rQrXiC7BxgMjU4lrwFFoPpCHu
	rcBqgVLXhKLonHGj3/uCC16op5bCngotOYBJ+9P/fGy8FBAPpq8HiU+6mN57G12TPeI10xSd4eH
	3Dt/74s78b7cESNaDTAt93C/vJwbUF44mzt680A==
X-Google-Smtp-Source: AGHT+IGfh2W97xdVpFCgiQyq3Pb9/ifBsTlwqyh1OAHr3R34PnfYQnj+aQ8bMShNsAl8EpMrNrhaMQ==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr43866025ab.11.1756255580619;
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ef2ff2dd60sm14606295ab.9.2025.08.26.17.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Message-ID: <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
Date: Tue, 26 Aug 2025 19:46:19 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
 <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 2025-08-26 3:08 AM, Maciej Wieczor-Retman wrote:
> On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>> On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>>> +/*
>>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>>> + */
>>> +#ifdef CONFIG_KASAN_SW_TAGS
>>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>> +{
>>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>>> +}
>>> +#else
>>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>  {
>>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>>  }
>>> +#endif
>>
>> This is the kind of thing that's bound to break. Could we distill it
>> down to something simpler, perhaps?
>>
>> In the end, the canonical enforcement mask is the thing that's changing.
>> So perhaps it should be all common code except for the mask definition:
>>
>> #ifdef CONFIG_KASAN_SW_TAGS
>> #define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>> #else
>> #define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>> #endif
>>
>> (modulo off-by-one bugs ;)
>>
>> Then the canonical check itself becomes something like:
>>
>> 	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>> 	return (vaddr & mask) == mask;
>>
>> That, to me, is the most straightforward way to do it.
> 
> Thanks, I'll try something like this. I will also have to investigate what
> Samuel brought up that KVM possibly wants to pass user addresses to this
> function as well.
> 
>>
>> I don't see it addressed in the cover letter, but what happens when a
>> CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?
> 
> That's a good point, I need to add it to the cover letter. On non-LAM hardware
> the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
> isn't that difficult in outline mode, but I'm not sure it can work in inline
> mode (where checks into shadow memory are just pasted into code by the
> compiler).

On RISC-V at least, I was able to run inline mode with missing hardware support.
The shadow memory is still allocated, so the inline tag checks do not fault. And
with a patch to make kasan_enabled() return false[1], all pointers remain
canonical (they match the MatchAllTag), so the inline tag checks all succeed.

[1]:
https://lore.kernel.org/linux-riscv/20241022015913.3524425-3-samuel.holland@sifive.com/

Regards,
Samuel

> Since for now there is no compiler support for the inline mode anyway, I'll try to
> disable KASAN on non-LAM hardware in runtime.
> 

