Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D262472AE
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177220; cv=none; b=NFUDQ6u1xVNW3aOE6AmuVglimHDOd1b8bOK6N3VD697GOB7CKFjBddfnhhYpyBkAyRVX0f5TSvJq/FNACrngJKWlYbKupwudndI5az5qjttuKRQnXAs3OXwbxEvaoS00b39HYsVSJoUnXApGDReSBlFpxQx7+w7Dy7+zWdQCnmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177220; c=relaxed/simple;
	bh=dXGJg55z319BaRh8eIcvDWHKkFigImfGEQ+PW6DNC2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcqYrPdkBNHYFSEJDGgoU8Z2kIRBPlfYfiNooh/zkNcnZB7RubM/FcfEIp0V1fWM4MhMtE7qj0LCvwXUDE9phd7HwKQ/9IYpvUd9zuAGYWau68PcZLN+1eUpwMDp6omgwBoF/iksCD/ONqLSEpu1VPV//evNegyGPZXUqNeb4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8/BIA8q; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8/BIA8q"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eeafd4882so73065ad.0
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177218; x=1761782018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Obj7jZG40UIPnvQc/KbD4aeaaOQUqRSXMKvdt/p0pk=;
        b=h8/BIA8q2/I1xu+CLJiNC3B7KHkLVp1MVAPJBnYfHUBYqGj8lJRyVTfOPAKPTuRVgu
         9GzBUf5IFnmVuKLpMK44RAINWqewxxji+gj61QXupfIc51YhPZncxtQJAT64OQgje2Pt
         jHKYkGE8kbMwi3FUxEocTRvrCF2gemeTw+5AlMDuI3xcypVGODHCOcKu7JOu9+GrzWFw
         DD9yVQ8MltBIfuV8gHdvFw0EhnH5AIKmnaJtXDc4oFkRP4rgMlVqPSZB80RpY+IzZIrU
         w3hKA+rUPis9euLsRDn14SH3cAXqYqBOdNiv2jwEve4BDoOL37PVmiDKP9iNQqzkUVUq
         RmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177218; x=1761782018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Obj7jZG40UIPnvQc/KbD4aeaaOQUqRSXMKvdt/p0pk=;
        b=OVed3gWVFTKH2+WRPu18nbZy5UBgMsTpZZIlnS1ZcEJTxLoHLOWsS6Q6v9V+7QCTFN
         p1ukz+FOa4dmy7/6hokConEGwEu9uTSGNrlrmLyAURU7fGKHuqv1bY9MLwQ+ObfU3rQu
         bc2oNedHtS2Pi6ndRLwP1r4zT4N0lYNTps5HhQWYT40as6jk7bce6okk5Iw9O0QEwjw0
         XpbDwQCq1MDnZVCBd+LUtBKGvgpLMfXCai3Qy5Ndbhx1RP5ye63U4BOsB19EALzpFpVM
         +2G1fQom7JtsIrifGYDnZIkc5z9hYxAERXWOmZf6S6ac3fqnMsgDwpdVuq8nys//vhvp
         vlZg==
X-Forwarded-Encrypted: i=1; AJvYcCWOUzw3FYU431RyF4HtQ5wrRkzRn6DFaHSHgGVy79T6o4hRi2Gfdvpt6wgb5E197xfn9v4p@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvh9pME1NumG6KRPfGL4xNXs6/poGYnNtefoAd5Ni79E8iV2R1
	v/nX+Lnm16czcrXAqs9nTVgVOE22Dbt2Nnxbhc/SOXkJuA3e+qQ4laj24L9i04sXSrHOfGeM8wE
	PJdgplfuiKUTIreiflTsWwHCgnF1XQm+Zwmyky44u
X-Gm-Gg: ASbGncuPhAYZPCdhhnQAoyXxcpUDewQCViVsQotyYsc+JzhIWWc6PKpEcrm9PmyHTQK
	a7T7AxMSSivxiZhNVZ+EDokXhjPGqyFMB5pg3uJLsJhSUg/8ddYssNcsv+6wvG/ZYQdbX5L9m4w
	9+dW3jhQwRzdfzZBrtRqRUFbgT1ooMhvAHN205K8E9mFp8srUwORRFqaWzcaLLDk1hDf329qnMM
	iLAkIdVKLIx1S34KfaKPg2ozrx9uwV0YuaEyM2Lj4wQzVroI8EX0mk4ChyHzqG/y/0Z
X-Google-Smtp-Source: AGHT+IFNPTwEDxtRk5uZyv09/FDmi3+zRyMJQdocUYvH7ZYfTsZM6sefaV9+uPsqQ0QJzkWD3cR3a5k6W1Em95CqZm0=
X-Received: by 2002:a17:903:18e:b0:292:b6a0:80df with SMTP id
 d9443c01a7336-29469cc35dbmr2247785ad.10.1761177217352; Wed, 22 Oct 2025
 16:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-x86-fix-clear_page-cfi-full-lto-errors-v1-1-d69534c0be61@kernel.org>
In-Reply-To: <20251013-x86-fix-clear_page-cfi-full-lto-errors-v1-1-d69534c0be61@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Oct 2025 16:53:00 -0700
X-Gm-Features: AS18NWAtS6OPxJw_IdyJfidxnXUpDl59IPZyOYj6RjHP9Gf5hzvEO4B2w_JxTT0
Message-ID: <CABCJKucLzfs99ssROzj4pt_1jy860vkJutqS-CCo=LW-PwnmqA@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: Ensure clear_page() variants always have
 __kcfi_typeid_ symbols
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Mon, Oct 13, 2025 at 2:27=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building with CONFIG_CFI=3Dy and CONFIG_LTO_CLANG_FULL=3Dy, there is=
 a
> series of errors from the various versions of clear_page() not having
> __kcfi_typeid_ symbols.
>
>   $ cat kernel/configs/repro.config
>   CONFIG_CFI=3Dy
>   # CONFIG_LTO_NONE is not set
>   CONFIG_LTO_CLANG_FULL=3Dy
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 clean defconfig repro.conf=
ig bzImage
>   ld.lld: error: undefined symbol: __kcfi_typeid_clear_page_rep
>   >>> referenced by ld-temp.o
>   >>>               vmlinux.o:(__cfi_clear_page_rep)
>
>   ld.lld: error: undefined symbol: __kcfi_typeid_clear_page_orig
>   >>> referenced by ld-temp.o
>   >>>               vmlinux.o:(__cfi_clear_page_orig)
>
>   ld.lld: error: undefined symbol: __kcfi_typeid_clear_page_erms
>   >>> referenced by ld-temp.o
>   >>>               vmlinux.o:(__cfi_clear_page_erms)
>
> With full LTO, it is possible for LLVM to realize that these functions
> never have their address taken (as they are only used within an
> alternative, which will make them a direct call) across the whole kernel
> and either drop or skip generating their kCFI type identification
> symbols.
>
> clear_page_{rep,orig,erms}() are defined in clear_page_64.S with
> SYM_TYPED_FUNC_START as a result of commit 2981557cb040 ("x86,kcfi: Fix
> EXPORT_SYMBOL vs kCFI"), as exported functions are free to be called
> indirectly thus need kCFI type identifiers.
>
> Use KCFI_REFERENCE with these clear_page() functions to force LLVM to
> see these functions as address-taken and generate then keep the kCFI
> type identifiers.
>
> Fixes: 2981557cb040 ("x86,kcfi: Fix EXPORT_SYMBOL vs kCFI")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2128
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Alternatively, these functions could move back to SYM_FUNC_START with a
> comment that they need to be exported to be called via the alternative
> in clear_page() but they are never expected to be called indirectly.

Right, this might be a cleaner solution if we don't actually expect
these to be indirectly called.

> ---
>  arch/x86/include/asm/page_64.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_6=
4.h
> index 015d23f3e01f..53f4089333f2 100644
> --- a/arch/x86/include/asm/page_64.h
> +++ b/arch/x86/include/asm/page_64.h
> @@ -43,6 +43,9 @@ extern unsigned long __phys_addr_symbol(unsigned long);
>  void clear_page_orig(void *page);
>  void clear_page_rep(void *page);
>  void clear_page_erms(void *page);
> +KCFI_REFERENCE(clear_page_orig);
> +KCFI_REFERENCE(clear_page_rep);
> +KCFI_REFERENCE(clear_page_erms);

In any case,

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
