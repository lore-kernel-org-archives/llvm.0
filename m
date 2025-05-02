Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9061EEE6
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204106; cv=none; b=KdRCPVdpS+enlEnCT/DO3XdT9BuKV1v84YEloIK97VuRLtCSJ+55SfDw6SKqrw/FUhxRKr0sUYX7cE0TEfQUa5AUhwHFon9x401sElgIwHTNJ01TgsEyh+Wr3eZUk3qwxH5Eg8utHaXCsgdCcGSVYRWOCRTpKpP06n4MBqgmmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204106; c=relaxed/simple;
	bh=GRGIrDCYRtPVvuRezChYCJbmtuoMfRngrDbwIPoiUbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsCIoExVQ7J9VhLMbE5RsAizfbkq75ChAo7Xg9aL5I3RN6xaQKXXwZnnFlTC7QMcTIoBXxMICrDoe5eDxtWIoMiVvIuk6T00Yp3qkD8PQkANoHhtseNENS1DiWZ3AMcoSv+WNhM4tBmeGbPMDJifB76Z25o7XHqCT4P6eEeqv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJsNGK3+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJsNGK3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D41C4CEE9
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746204105;
	bh=GRGIrDCYRtPVvuRezChYCJbmtuoMfRngrDbwIPoiUbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VJsNGK3+3ahTbjLxx9qXPVSXOV7j1m9KUnGNXuIIIW/NDp4PvqHRlT6n+AI+S6NjZ
	 gwD2f6xPY05gtrjietMKyEjpheULq9zPEbqe8KMgKB5qI0pGGhBlGITylGrLZwoZIv
	 iFGFGEt/HPiDRMlO1E9V22loD/pIzhalPeb1HF/hTXUqYvxkcMlIHlUpfwXKZ1W7fF
	 5VyrWzTGw9h6UZpbJmumuEQZ+OStlZmuQG1v/BkI3mScanRxIQtDLkERsneRkQGeEz
	 SvpXgyRLqdqf2F0reNf9kRm4xfP0Z4FqmiTEGkxaDc0WcW7ETT2d51qNV77rTtAFVl
	 8dy104x2qYArQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d6f93316dso463081e87.2
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 09:41:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyXPdo95DyZ6Xpgzsx9j+uPy8zYuxnvyxhU2LUIMuHmAijf4oAfQdJ/ZbTsaZFQow2gocx@lists.linux.dev
X-Gm-Message-State: AOJu0YyF4Oc9hOO0a6Km3TlCELkTaZt61cF08xLflDsqM3hxbM4xmgEl
	00BHhZoCcAXEmdAQUyLP5W1QqsY0CUsaTJF6kCFdJW4X4ntrzZKIWrem2HjLT/QatYL2t4JrtvF
	44UAomf5M9cOrMcZqGo6mZOlt7m4=
X-Google-Smtp-Source: AGHT+IFql8yiS+S8ZvEUyN4XOnu/NgmX60V6UudNT1ej0ML8QEtJBeWJXqUe5OoWWbtDF9MfrdbaX6qUkozE4M6i4mk=
X-Received: by 2002:a05:6512:39c9:b0:54d:662b:c8a9 with SMTP id
 2adb3069b0e04-54eac20eac2mr903287e87.25.1746204104257; Fri, 02 May 2025
 09:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502145755.3751405-1-yeoreum.yun@arm.com>
In-Reply-To: <20250502145755.3751405-1-yeoreum.yun@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 May 2025 18:41:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
X-Gm-Features: ATxdqUGIUjt8rIT2Bx4U_ZCoipBsFGEQnmCAwz2P1XMTEvimmTj5hJidZsBb6ok
Message-ID: <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	broonie@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	frederic@kernel.org, joey.gouly@arm.com, james.morse@arm.com, 
	hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com, 
	ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 16:58, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> create_init_idmap() could be called before .bss section initialization
> which is done in early_map_kernel() since data/test_prot could be set
> wrong for PTE_MAYBE_NG macro.
>
> PTE_MAYBE_NG macro is set according to value of "arm64_use_ng_mappings".
> and this variable is located in .bss section.
>
>    # llvm-objdump-21 --syms vmlinux-gcc | grep arm64_use_ng_mappings
>      ffff800082f242a8 g O .bss    0000000000000001 arm64_use_ng_mappings
>
> If .bss section doesn't initialized, "arm64_use_ng_mappings" would be set
> with garbage value ant then the text_prot or data_prot could be set
> with garbgae value.
>
> Here is what i saw with kernel compiled via llvm-21
>
>   // create_init_idmap()
>   ffff80008255c058: d10103ff            sub     sp, sp, #0x40
>   ffff80008255c05c: a9017bfd            stp     x29, x30, [sp, #0x10]
>   ffff80008255c060: a90257f6            stp     x22, x21, [sp, #0x20]
>   ffff80008255c064: a9034ff4            stp     x20, x19, [sp, #0x30]
>   ffff80008255c068: 910043fd            add     x29, sp, #0x10
>   ffff80008255c06c: 90003fc8            adrp    x8, 0xffff800082d54000
>   ffff80008255c070: d280e06a            mov     x10, #0x703     // =1795
>   ffff80008255c074: 91400409            add     x9, x0, #0x1, lsl #12 // =0x1000
>   ffff80008255c078: 394a4108            ldrb    w8, [x8, #0x290] ------------- (1)
>   ffff80008255c07c: f2e00d0a            movk    x10, #0x68, lsl #48
>   ffff80008255c080: f90007e9            str     x9, [sp, #0x8]
>   ffff80008255c084: aa0103f3            mov     x19, x1
>   ffff80008255c088: aa0003f4            mov     x20, x0
>   ffff80008255c08c: 14000000            b       0xffff80008255c08c <__pi_create_init_idmap+0x34>
>   ffff80008255c090: aa082d56            orr     x22, x10, x8, lsl #11 -------- (2)
>

Interesting. So Clang just shifts the value of "arm64_use_ng_mappings"
into bit #11, on the basis that 'bool' is a u8 that can only hold
values 0 or 1.

It is actually kind of nice that this happened, or we would likely
have never found out - setting nG inadvertently on the initial ID map
is not something one would ever notice in practice.
...
>
> In case of gcc, according to value of arm64_use_ng_mappings (annoated as(3)),
> it branches to each prot settup code.
> However this is also problem since it branches according to garbage
> value too -- idmapping with wrong pgprot.
>

I think the only way to deal with this in a robust manner is to never
call C code before clearing BSS. But this would mean clearing BSS
before setting up the ID map, which means it will run with the caches
disabled, making it slower and also making it necessary to perform
cache invalidation afterwards.

Making arm64_use_ng_mappings __ro_after_init seems like a useful
change by itself, so I am not objecting to that. But we don't solve it
more fundamentally, please at least add a big fat comment why it is
important that the variable remains there.
