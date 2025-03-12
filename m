Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50630231A51
	for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777796; cv=none; b=k+XCK0cMIzfytuO9Veo93NSBXHIaNfcoerdyt/muJyrcHozQgDpCnAu6PZ3vlWJGeHjtMRLeo4ePoXyVVsciKFNgIEyE5b+x2v/JJQLKn6OVh04jXu6Y6ylSkpCoqZKE11eC8rqZhy0YylFguhoxfx+73HzTtjmdcRNvuM6X1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777796; c=relaxed/simple;
	bh=avHSsu0dTxyxGfD4w6A9gBso6NQOQgotxKLGKrBr0+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlFwEBRYVmAmzGxddve95gwm2x/FkNdlMGLcIphsj5I2D89xroi8fKnFLxz41iQIXii8kzI/AMVLq8QOKOfuWPVnDi7DtYCfnfXjZUqbl/NYGmYxWTdlP7Ikakck6/MXdS8e4nDJInXsnTAdh7QPoqc5ZizyY4KPggSNpvv7XHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS3gsIbl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS3gsIbl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso1093343e87.3
        for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741777792; x=1742382592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jk+YaftNqssF7ZIVjayr/313NS1f8s7aGP9u3vwaLw=;
        b=gS3gsIblVddewmQbQ6pgDA5vN6ZCMt3Xwvm5CMoEue00E4r3siLJRCC91dzXzqOACD
         Zzis1MBL+Lj6MlmdHqGhfHm9NnW+WDXhKgfL0gR7/q/yAZ451dKguRJmi225iWx+1RkZ
         bTtP33dEZ6k3UROM5B7cC0PeYy6Nqf+dWhq9wogNFY6ByNj63YCnPZfUoAYw7P/E2i4Z
         Q1itg13IRhgLlI/k7PnVzezXfeaQF3h0aLHOGsdCPb6ja2PQkpneV1aCfqNMoJ/8ybrN
         7aY4+2MHTFo535GX6iZI7/jPIux/NdJybjSUioQqJ5VbybAqEJEN6fgI7TGRjQ1rzg2R
         XNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741777792; x=1742382592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Jk+YaftNqssF7ZIVjayr/313NS1f8s7aGP9u3vwaLw=;
        b=oJZgSTYuNTDBfzQ5GUzzA6XuF/7luZzfEANQtyOAl8oyxzGh5dUWy0jr4bjmuBqkCk
         K0LK0/zn5a9PGX01q5fMNfpg6JOqYgxbjtdL67kkiVcKTBx7Pue00fhh8cyMhIUOAEBI
         lqlW/Fb+7Sk47wewvvWBZ64ojAkh7HKDmW0iBqFjtaMbcO1uvbF/xjuykfWTBA66Ti/V
         oaEHccDmXkjSbQUL1kT1cNhzYeR2imo8S5dhQoyGGroGxnt6f+Z1hHuc/M88fLrpIKV/
         v8PrxSN5aHP9KITDlatKA/eCGoZ+bH0I9BpXwN3oKALv/IIFp4GyoKjQt1y3iDtMbIal
         GVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXNXY/ZAVGcZ43WNdti8bGOQPOD8XdzXwkRN5nf3qO6S1QdxZ+qcBgUe1Pe2Uu4qK5ygm3Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwAMbsBJT6pT4l+ArbmnaR3KUrr7TynoNcHSiLdbyqV+u5/AMF4
	nlnllVlDR+DGA2re94mkxrlB1cxFE0hcbCKSPmvQneY4iGdqleFJ3K6ryS2CsUBoZ87lVs8Hp+/
	s8iYNEGq+lr3nGvVPWcG6X/W2JA==
X-Gm-Gg: ASbGncvoKcd70lmASmEWIpwA4bQT9PFa+QbrkUPYEsz9kwTOCwXl5OhYtjXVsaCZRDs
	nmvqESiU/PguvjmV+407cGjxG1voN02Xwoylb86ahPpAJv9Hp8/KQK5ii1+3/egDK4Zi3zubPKQ
	BDU8Uqq9ZcPxVHAdfkGRpC8DjlCVumQJc4XK1UnAtLG41N5Gy6ljI=
X-Google-Smtp-Source: AGHT+IHSK/CJqbIVxJoJuzcbjfrLMsCa5m5XscqpP70OCU4FnT5T9Wjz4ZFbZ2HCsj1p45eWUsAYDSpB06pDC0/n3Ug=
X-Received: by 2002:a05:6512:3d0b:b0:549:8963:eb05 with SMTP id
 2adb3069b0e04-54990ea9476mr7501602e87.37.1741777791985; Wed, 12 Mar 2025
 04:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312102740.602870-2-ardb+git@google.com>
In-Reply-To: <20250312102740.602870-2-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 12 Mar 2025 07:09:40 -0400
X-Gm-Features: AQ5f1Jq8vYUarSIDLdLKNlf4grfNNYgdX79_ZMRTSc7YyZDa6Ctwx-tT7jIm814
Message-ID: <CAMzpN2ig2wKf89Gx51MK=K96p4nHYPrqKQbpthB7d9bzNi_UDQ@mail.gmail.com>
Subject: Re: [PATCH] x86/head/64: Avoid Clang < 17 stack protector in startup code
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 6:27=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Clang versions before 17 will not honour -fdirect-access-external-data
> for the load of the stack cookie emitted into each function's prologue
> and epilogue, and will emit a GOT based reference instead, e.g.,
>
>   4c 8b 2d 00 00 00 00    mov    0x0(%rip),%r13
>           18a: R_X86_64_REX_GOTPCRELX     __ref_stack_chk_guard-0x4
>   65 49 8b 45 00          mov    %gs:0x0(%r13),%rax
>
> This is inefficient, but at least, the linker will usually follow the
> rules of the x86 psABI, and relax the GOT load into a RIP-relative LEA
> instruction.  This is still suboptimal, as the per-CPU load could use a
> RIP-relative reference directly, but at least it gets rid of the first
> load from memory.
>
> However, Boris reports that in some cases, when using distro builds of
> Clang/LLD 15, the first load gets relaxed into
>
>   49 c7 c6 20 c0 55 86  mov    $0xffffffff8655c020,%r14
>   ffffffff8373bf0f: R_X86_64_32S        __ref_stack_chk_guard
>   65 49 8b 06           mov    %gs:(%r14),%rax
>
> instead, which is fine in principle, as MOV may be cheaper than LEA on
> some micro-architectures. However, such absolute references assume that
> the variable in question can be accessed via the kernel virtual mapping,
> and this is not guaranteed for the startup code residing in .head.text.
>
> This is therefore a true positive, that was caught using the recently
> introduced relocs check for absolute references in the startup code:
>
>   Absolute reference to symbol '__ref_stack_chk_guard' not permitted in .=
head.text
>
> Work around the issue by disabling the stack protector in the startup
> code for Clang versions older than 17.
>
> Fixes: 80d47defddc0 ("x86/stackprotector/64: Convert to normal per-CPU va=
riable")
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Brian Gerst <brgerst@gmail.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/include/asm/init.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 0e82ebc5d1e1..8b1b1abcef15 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -2,7 +2,11 @@
>  #ifndef _ASM_X86_INIT_H
>  #define _ASM_X86_INIT_H
>
> +#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
> +#define __head __section(".head.text") __no_sanitize_undefined __no_stac=
k_protector
> +#else
>  #define __head __section(".head.text") __no_sanitize_undefined
> +#endif

Just disable it for all __head code.  This runs long before userspace
can mount a stack smashing attack.


Brian Gerst
