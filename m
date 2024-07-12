Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777D179650
	for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720803781; cv=none; b=q2NGGm9VUIObghXwPUAlvFvPLhHGBoks7JsPXXRlCcPMIsmuGKzazGPg+y4sBw6d/isB3IlGI3my29KJqI/Gem7CqF2hC/rRjykxB5CIeX+4u1TARDDvxdElZIV/XgFRPjnfxXneg379N7aKMYDziq0HtY8X9L8SrpIySFz7kg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720803781; c=relaxed/simple;
	bh=gNabTLThOc2f6ozdrdD/9quDBaHTdCEFYGdZRW78KIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/VQK1eEM5MemykLQwYJdn1+LJCmA6tFCrQXeaDTrFr5aIXCPpcQ9UbqROIkkDie9WWV6WHH7eorVV8OoAmrMrF32qVGNgtBROa57FLbFC/Ov+gHsaSo7zP5kG9wC8TWU5QSoEQv+H/BYqVgv9prPBU8Vm4enV+fV0xwQ7zBfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKMou7TB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKMou7TB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso1872603b3a.0
        for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720803779; x=1721408579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrHfge3cImJHlYA6NM3anxaSPcz1+CBkdutsXVaHFjs=;
        b=WKMou7TBCTZ89+hwLJ/VdWh8r/UGCmiBsrAf3pLO1J7ptmdhP8CvZsTcH9YvCSWwPm
         WluxzvWqbMMcLadetPHFiZXlq/uaaqzAQglR6pBeLV0QrURfHzjdwFel2jHXENPF/s3w
         dDeU6gQAgt5O+bCS8I6CVa4KUVd4rLN5MCBwC/3havvyfrFDBW5wnwiDDC8j0moMOvcX
         GGUHOxGkmv/igyrKmDilxA8ej9OQM3To/ojV7x4JBpcVaaYWLkfBjDgEpRMp9QWVIywc
         6kw2peCjqtxkbOORtsLU94S+xluUirMaeK3oSiYI9lt1mcPfbHhr2uXngbciLwVf5emC
         QohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720803779; x=1721408579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrHfge3cImJHlYA6NM3anxaSPcz1+CBkdutsXVaHFjs=;
        b=IakZksuWTI8b0wVD4jAawusUeLscWQPzB0Gy186K6KsGtQza9+8Lgkwas2hW75+PvO
         xYgIEtysbhSRHjA1TML72Moo3IHR1KxfCdKpW6oTtTzROMfWWlgBrudovZ7XvTJbVf5K
         K9qjofNG6qbtwY19eSgAGg9x8U4tLLNhypcWuQJt/O2O1bpW9ZVWUZz7RzhrSuJYGY9n
         JC/wbeKg2L3C3fMB9KHV36Qv8sH8PBRTrLOSoX0CFNcQ3BQfa9x/A1hZDANHn0W4PJzs
         +KjGr+QdqEHXXFSypGES6mNKGNCtcMWNynR0nHKxrjDsm09otEjVECc6xv9Ue88NiJWK
         M2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXvBbBZlOdNIpFSj202mI58Jgvknkq7yHF3yh64fV+ygqYa+QJZMAOzr5ZAPjoTwyUuEX6j5qLaZaT5R3AoAKNcmp/7eQ==
X-Gm-Message-State: AOJu0YzfHczlki2it5fanwnd3PhP8vPLtAhrjBSjxNJcik7RYvAR5P9N
	BzyxxsrYatf9wPdx/6NLutEOKM9wJBSGgjhEvwCAX8HJ4FCJh6o3
X-Google-Smtp-Source: AGHT+IFpuEEhUyUhjkwwZj5q7H2H8x6VfJ2ZhC6k9UrPS0354tkbHk7R8jYxM0ZgRCG6X2iAnQALbg==
X-Received: by 2002:a05:6a20:918d:b0:1bd:2710:de5c with SMTP id adf61e73a8af0-1c29821d0b3mr15445685637.22.1720803779146;
        Fri, 12 Jul 2024 10:02:59 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438cd96esm7744368b3a.81.2024.07.12.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 10:02:58 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:02:55 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] bitmap: Switch from inline to __always_inline
Message-ID: <ZpFhv5VSYZ6jnsd4@yury-ThinkPad>
References: <20240711163732.1837271-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711163732.1837271-1-briannorris@chromium.org>

Hi Brian,

Thanks for taking over this!

+ Kees Cook for GCC

On Thu, Jul 11, 2024 at 09:37:11AM -0700, Brian Norris wrote:
> On recent (v6.6+) builds with Clang (based on Clang 18.0.0) and certain
> configurations [0], I'm finding that (lack of) inlining decisions may
> lead to section mismatch warnings like the following:
> 
>   WARNING: modpost: vmlinux.o: section mismatch in reference:
>   cpumask_andnot (section: .text) ->
>   cpuhp_bringup_cpus_parallel.tmp_mask (section: .init.data) ERROR:
>   modpost: Section mismatches detected.
> 
> or more confusingly:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference:
>   cpumask_andnot+0x5f (section: .text) -> efi_systab_phys (section:
>   .init.data)
> 
> The first warning makes a little sense, because
> cpuhp_bringup_cpus_parallel() (an __init function) calls
> cpumask_andnot() on tmp_mask (an __initdata symbol). If the compiler
> doesn't inline cpumask_andnot(), this may appear like a mismatch.
> 
> The second warning makes less sense, but might be because efi_systab_phys
> and cpuhp_bringup_cpus_parallel.tmp_mask are laid out near each other,
> and the latter isn't a proper C symbol definition.
> 
> In any case, it seems a reasonable solution to suggest more strongly to
> the compiler that these cpumask macros *must* be inlined, as 'inline' is
> just a recommendation.
> 
> Based on recent discussions, it seems like a good idea to inline the
> bitmap functions which make up cpumask*() implementations, as well as a
> few other bitmap users, to ensure the inlining doesn't break in the
> future and produce the same problems, as well as to give the best chance
> that the intended small_const_nbits() optimizations carry through.

small_const_nbits() optimization always carries through. As far as I
understand this things, the problem is that inliner may make a (wrong)
no-go decision before unwinding the small_const_nbits() part.

small_const_nbits() always leads to eliminating either inline or outline
code, but inliner seemingly doesn't understand it. This leads to having
those tiny functions uninlined.

But I'm not sure about that and don't know how to check what happens
under the compilers' hood. Can compiler gurus please clarify?

> This change has been previously proposed in the past as:
> 
>   Subject: [PATCH 1/3] bitmap: switch from inline to __always_inline
>   https://lore.kernel.org/all/20221027043810.350460-2-yury.norov@gmail.com/
> 
> In the end, this looks like a rebase of Yury's work, although
> technically it's a rewrite.

I like it more, when it's split onto several patches. We already have
my bitmap.h rework and your cpumask.h one with their own reasonable
motivations. Can you keep that patch structure please? Then, we can add
separate patches for find.h and nodemask.h. If rebasing the old bitmap.h
patch isn't clean and takes some effort, feel free to add your
co-developed-by.
 
> According to bloat-o-meter, my vmlinux decreased in size by a total of
> 1538 bytes (-0.01%) with this change.
> 
> [0] CONFIG_HOTPLUG_PARALLEL=y ('select'ed for x86 as of [1]) and
>     CONFIG_GCOV_PROFILE_ALL.
> 
> [1] commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement
>     arch_cpuhp_init_parallel_bringup() and enable it")
> 
> Cc: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

So... This whole optimization is only worth the reviewer's time if we
can prove it's sustainable across different compilers and configurations.

Just saying that under some particular config it works, brings little
value for those who are not interested in that config. Moreover, if
one enables GCOV, he likely doesn't care much about the .text size.
And for those using release configs, it only brings uncertainty.

Let's test it broader? We've got 2 main compilers - gcc and llvm, and
at least two configurations that may be relevant: defconfig and your
HOTPLUG_PARALLEL + GCOV_PROFILE_ALL. And it would be nice to prove
that the optimization is sustainable across compiler versions.

I have the following table in mind:

           defconfig   your conf  
GCC    9 |  -1900    |           |
CLANG 13 |           |           |
GCC   13 |           |           |
CLANG 18 |  -100     |  -1538    |

The defconfig nubmers above are from my past experiments. And you can
add more configs/compilers, of course.

> ---
> 
> Changes in v2:
>  - rebase, update cpumask.h based on recent additions and removals
>  - also convert bitmap.h, find.h, nodemask.h
> 
>  include/linux/bitmap.h   | 122 ++++++++++++----------
>  include/linux/cpumask.h  | 216 +++++++++++++++++++++------------------
>  include/linux/find.h     |  50 ++++-----
>  include/linux/nodemask.h |  86 ++++++++--------
>  4 files changed, 249 insertions(+), 225 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 8c4768c44a01..7f44b4428d77 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -203,7 +203,7 @@ unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
>   * the bit offset of all zero areas this function finds is multiples of that
>   * power of 2. A @align_mask of 0 means no alignment is required.
>   */
> -static inline unsigned long
> +static __always_inline unsigned long
>  bitmap_find_next_zero_area(unsigned long *map,
>  			   unsigned long size,
>  			   unsigned long start,

Let's split them such that return type would be at the same line as
the function name. It would help to distinguish function declaration
from invocations in grep output:

   static __always_inline
   unsigned long bitmap_find_next_zero_area(unsigned long *map,
   			   unsigned long size,
   			   unsigned long start,

Thanks,
Yury
