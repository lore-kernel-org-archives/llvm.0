Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24492D7DD3
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737551; cv=pass; b=cwt2pDMDMl3Iwwe1rNo2dygNam2u1An6jAHB+oQqo/8au0KDAxcqe31g3nTJzrgyODDa6arXnzgawv6bwbiDh8TbuXz6HSZ9dZcTYEEBsyPpJyUJTDTeukAk07/BpNcuIB7hAnmymXeVWYNUrZ5nGKUiVszF2K1jTPft9Du0MYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737551; c=relaxed/simple;
	bh=OiEKC9dj80TLcUp3yk+ZVSKiJN0ebZG15+u03MmyUhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K54oxUZe0gHxsSMeXmFEHFteJdET5uqyNEe2hv74ALZu6imvQrBK8FgdeZu721dw+QanbhdZeRnKo5a/iJ6XNSmgZLE4l3Nu4WEa8JD95PQqfs1Lspfn6mGsdLUaAlGXiw9jMqZwsA89reG9+VjFFM7GcUOrwz1Q6OkmS5j7jms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl8FrDk+; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl8FrDk+"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79852e01cd1so3780277b3.0
        for <llvm@lists.linux.dev>; Thu, 05 Mar 2026 11:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772737549; cv=none;
        d=google.com; s=arc-20240605;
        b=Yclzy01RbKOhBKiZnDbsSLZvKzZWis4XLMJljAHyHlhLCzLG2izwGXRGn3i70yOhfO
         hvwVmrSNTZCwBRJtfYoAmaKIWUTScUCsIcvoP01Fh32cmAMq/gZoUVVVMYJZXDUUjtki
         3R+OQ48xF+reI7TAbVa9CVHk2K7AmIAMj97yzMSA/nOZPTQB6N0S/OtndOZhe6PdWrGz
         oYNYyXBK8HGPbZ6vq7cxWg4wPFGhAAuL7dtrOzcggTnkWhFxccbo28lxWknf7h3z7esg
         yRJx7LXWXKha+5nDTPoUdFHpz6sn8Ab4caSWOM4VBnl3YUjhBNQSu/P9yzRqResJZ5xY
         TAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        fh=10dzDL+TtHQalvP6Locf+UAkloRYcpLmD5gr1tSSVh8=;
        b=bVHGVxqZQY6jopzTAPtP4uFPvaaZhJs2dn9xPD+WDDb+6/swZew1kciikgdtqQGWxG
         FXsPGE1mJukzsLwM4h1Sq1jXCKeEHzN6w3VgCAKV3RRzdUYg69CGgk5LhCxpjJMzC2qw
         94AvBjC2450GMglgMjhAVX35zWVTl/TQ9tiRMZtPvfYeZdvrZvllgHXQ3a4Tabfwt9CB
         875R2anW1VGMTcVnaJKsSF96jQ7gWskue8LOZphEieHaZc3LbAxH+nW5mFfGgH0FWUdD
         TgHmFykuiahmOWmRoaNlPC3PjP4ePN08XIAq3tyiKqD+90oOUhbtnnZ0Zwz/3W2WktCC
         xjrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772737549; x=1773342349; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=nl8FrDk+F6FsKTiT0gUdjg1l6ZjOGx4a3nOpmgHWVgJE82Y/XxcrVec5XvwuoH0V8M
         ti95nC/XHAg67dLA/xqT9Yi5IjiDBFG6/hkcxyM/bMmpDQGj6xDc6ebdzG8Z/wuNL74s
         RHnXohHKxDSGpTonnTX2FCtc9xlugBR1MvrjCbJ7S/23hFtKtHgSayX7humumieXjFPj
         fKJ0x7wlpLyE9wbDhTHiEo5nBhsikFe/cBUUNwBfFgGZAOA6dE+WhbiaWn80bJPIEIIv
         5/FBLtNvbUkIephygKMevxfNW9Iz2RVZb3L6cOb9FiGCe0tT2F6mWv/Hiie3fbYDRmIW
         Y0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737549; x=1773342349;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=Lk0nkkMcQUHgQfzMyKjJ+m5KXw6NeI1UQtq5V3a0HSsqxau4x63GRhim9TlVLiM4Bf
         POfHZ1efqkjSnZ1qFUkTej2mJF9uyfHlYQmxT5DBzjxyue7WyLe2XJZ7HgDd3bKeWvoL
         bSGYjr6A+UuTXqJ1n4LLq++krME/jU6GrapLnE3+K7VteWKgGWYHxle1vec8/+luXe9C
         YVt2uwcuDjiRfcXrrie8+BF7HDM9VbSPQltOd03EOECSSiU191YarncV3txCFQ+oeUk3
         QxEmm/gKv8vuOziyMp/J+xVR6yRAbIZROKpbQDG50GQKbk+3/bpN6GxKn/l01rv7i7OF
         LiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4tIU3v1GbY3cX0jhrtt1RviXybo8PgPArvZ9RyWW2UUyiRsHn4KesqDQnAZ37ojPdViiO@lists.linux.dev
X-Gm-Message-State: AOJu0YwLboX7hXWzYRMB4YZgAhrAh1j+WYCg/AdQq7rBJJEYGb1LUmuo
	kpXB25LyVTjww0z0dQSeiKREE+7aMomF1twBJg/hMZr3AxUxr+DXX2d6cUDjpPMFfdD0a+AlUuJ
	LQzxucNjf5iEJ3reZmK9xwVsFvt6zt6Y=
X-Gm-Gg: ATEYQzzCHYE8a7KaTAdLfUnmuNndgEhGn/kAk2Ec0v8vJVQzyLFW52OB3kUp4vr7pCL
	CmTE5FHlci7ptuay1W54mpHaFU/bufRg1DTg15oj+C0lCeUbnki1palqW7HmwiKEQcv48l1bcoa
	7bo7EHKRuA+n7NlCEiR+Un+qjtGGMMdFOqH8rS6k3TUugIdIbaNLQkYPdk3jlfRmFEEmOKLaeEb
	/5AafMSc2I4eJMljMtdL7JyFET4APHsF3tICJs67yQWglbbr+3iPQogBUqObAMcXFTfXGvSzzG2
	/8nV9w==
X-Received: by 2002:a05:690c:e3ca:b0:798:1de:f894 with SMTP id
 00721157ae682-798c6c843e6mr49794737b3.4.1772737548885; Thu, 05 Mar 2026
 11:05:48 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 5 Mar 2026 13:05:48 -0600
X-Gm-Features: AaiRm51wLGHSZ9SaMaT4E-JYzg2vW23YHvcBblsyf-Lc9uQK9qhJFdTRUjtyx2g
Message-ID: <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -558,6 +558,13 @@ static inline bool kasan_arch_is_ready(void)	{ return true; }
>  #error kasan_arch_is_ready only works in KASAN generic outline mode!
>  #endif
>
> +#ifndef arch_kasan_non_canonical_hook
> +static inline bool arch_kasan_non_canonical_hook(unsigned long addr)
> +{
> +	return false;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>
>  void kasan_kunit_test_suite_start(void);
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..53152d148deb 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,10 +642,19 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values. Thus,
> +	 * the possible shadow addresses (even for bogus pointers) belong to a
> +	 * single contiguous region that is the result of kasan_mem_to_shadow()
> +	 * applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	if (arch_kasan_non_canonical_hook(addr))
>  		return;
>

I've noticed that we currently classify bugs incorrectly in SW_TAGS
mode. I've sent the fix for it [1] :
 [1] https://lkml.kernel.org/r/20260305185659.20807-1-ryabinin.a.a@gmail.com

While at it, I was thinking whether we can make the logic above more
arch/mode agnotstic and without per-arch hooks, so I've ended up with
the following patch (it is on top of [1] fix).
I think it should work with any arch or mode and both with signed or
unsigned shifting.

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e804b1e1f886..1e4521b5ef14 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -640,12 +640,20 @@ void kasan_non_canonical_hook(unsigned long addr)
 {
 	unsigned long orig_addr, user_orig_addr;
 	const char *bug_type;
+	void *tagged_null = set_tag(NULL, KASAN_TAG_KERNEL);
+	void *tagged_addr = set_tag((void *)addr, KASAN_TAG_KERNEL);

 	/*
-	 * All addresses that came as a result of the memory-to-shadow mapping
-	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
+	 * Filter out addresses that cannot be shadow memory accesses generated
+	 * by the compiler.
+	 *
+	 * In SW_TAGS mode, when computing a shadow address, the compiler always
+	 * sets the kernel tag (some top bits) on the pointer *before* computing
+	 * the memory-to-shadow mapping. As a result, valid shadow addresses
+	 * are derived from tagged kernel pointers.
 	 */
-	if (addr < KASAN_SHADOW_OFFSET)
+	if (tagged_addr < kasan_mem_to_shadow(tagged_null) ||
+	    tagged_addr > kasan_mem_to_shadow((void *)(~0ULL)))
 		return;

 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
@@ -670,7 +678,7 @@ void kasan_non_canonical_hook(unsigned long addr)
 	} else if (user_orig_addr < TASK_SIZE) {
 		bug_type = "probably user-memory-access";
 		orig_addr = user_orig_addr;
-	} else if (addr_in_shadow((void *)addr))
+	} else if (addr_in_shadow(tagged_addr))
 		bug_type = "probably wild-memory-access";
 	else
 		bug_type = "maybe wild-memory-access";
-- 
2.52.0
