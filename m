Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D913CF045
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021918; cv=none; b=TPRNpQKcybMpOzAcJNRLA7MzdKTn8vgUDCqezFWrdOcAIH+gxp/MxogdHdRDhYnTxckCmtx7KxIHdIzVWkFiNn4WV5Cxj4HH/l23EOT9h6DGpvBiNm2SzAFwf1VO6atTfLqkIAfLpf2AotbZrCg0VgeS3UQwtNQ9AI/G1N6H1OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021918; c=relaxed/simple;
	bh=4Tvd6TLKSh4VlsuaCKI+5gByiR6tEcXdxBcXIv/rcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbO5kwPgSEs9TMZ3VfyLmAzCGiH0hm15okjRad8HxXqCh9lEhwRoqMHa8SZFhEL3gPO/qPfmWeZLn47r1Iut6mbG5rj10M4VLbGIbmKN+fZOa/9r2ysHkNN9Ln7AXNTqqtP0uH8nAhoAPvR2qV0b+FKDAw8MBYEYgKthxsPzKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxSY3Vfk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxSY3Vfk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso2645628a91.3
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 23:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021910; x=1789626710; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=cxSY3Vfk0vUkYvQ1DMfCUJ8ltY8t+fxnkUBmz/61U6bhqFtz4zARzb+Cl5e577OhMa
         HLaxQOKZGqRTnLA9bjEuyQiCQS5MfVTrrDXYKphxfF8oUINTU0hn4a3PXxJJyfQTvTwn
         VePMpjmznxGFjLyTCsU2GLRUVBK4t1BQa5B3f9yl+cMo8weT2ighT8GblFBHSp4uiU4T
         yA4Yyb1Q6Pz1Jzy5WzpEw2moAlYWuR44tF8M/aj5EvlP9g2tWIl00o8NUoGb6vowFHFf
         lL618/uEi2QqYeYhoCuOUe905G8Ie97l7ygG8rKxvVKTGCmsMpkhxquxsvxCK5ZCZgw4
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021910; x=1789626710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=nJqOiBc48rboIj/VsNwhboxQwWFPN1AUchguy4kI14E6I+Iqs3XU9rSfmMXeYx2i9D
         7JR2vfusQ7SQjfIxM6QzZPU5HJF/wanERm1kvbMaF9VnQPKyGERAxdcDoF1jgSeNb6Nc
         k0Rdm72FPv1XOc25HAchv2C7tQZCVWkq/c0URuKK2LQ1iHcB6NqFJXL9QGcEucblm8M7
         /CS2z08e6jnjFkRBJPmMmfuenkms/gQJOYTD+Q2vfE2kRWq9Sz1eDph0LAXeoLXjU7uG
         3blKwXMSyWpxb9W2Avpt3gfFn10j4UGJ8CIN++nM5oGxHX/C6aMC6Rk5Xue9vbun/PqA
         Q4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuHKz2/r0LKtGYFBGUgzo6PZkAyGjU59eG2jES2YtN6d1FdaLzrUJbUqTIs+C6iFkFlpjr@lists.linux.dev
X-Gm-Message-State: AFuF++kmxMf3Z0783IQtaN51ShfAGHU0lzxsfod87AkRdKRKw0o2T0yX
	R+ymrfB9vG3GrpKIAdHKkDKeZKJ4kvuazBJx4hxEusXa+7iDAsupuAGW
X-Gm-Gg: AYBFou33bplJfaPxBmH5liCHbrbQMzxYJUkT7mao6CBz4HkIaYsmbqYljJVQ0AsFmPU
	/jQc8tiRCLzpkYYYboXQzai/xkK7dCXM3tRD5oiGUWbHbBMg0giMhZVe70R2m/fY9x+fFVKlQcc
	gKMKrwB2mWVmdemuKj8BQFkZ/LQ2GYLtlPS2mGKQxv+WC9MgrZ39zkH5+XldwCaFtoOR4fsHnMg
	ToTndLFc3yB+v2wigNEcf6AjXlkPEskli/kPJr/GTgK/Kv/suN+cPhQMSVjo1sLR7qwG4HLVSFQ
	y8rFUcVgYsxNmu1xz9brgZh5VkiEmFrWcRBnYcSBrnpGjhDjdUyHxTYStwWIyETVKoUOeF4pvOR
	9Ke62Zld4MuOfjGBsHJoSq81OkC3Q/NS1gHyBDlEzUxWLF/fP015NFfa3xQFLl2PnWqbjDV8uMh
	SBZuvaTZYu+3MYEmUb3lmCwv8AsQVJwEz3UkE6WbqMnVaBBFdF+ZXlUXZD05vi8euLERwwbtAgK
	+3vRDe3JFEP1Ga0f3UapGABeT5mEG8Phm6hLG7N/MY=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr64061526a91.11.1789021909725;
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e834319sm2507639a91.10.2026.09.09.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:01:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
Message-ID: <aqJOscgnnevybiKO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>

On Tue, Sep 08, 2026 at 08:33:35AM +0200, Thomas Weiﬂschuh wrote:
> While the numeric constants for relocations are architecture specific,
> it is still useful to get access to them from other architectures.
> Also the definitions are useful for userspace in general.
> For example tools processing elf files during a kernel cross-compilation
> can make use of them.
> 
> Introduce a dedicated header for them, similar to the elf-em.h header.
> For now the header is empty but it will be filled step by step in
> upcomming commits.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  include/uapi/linux/elf-r.h | 5 +++++
>  include/uapi/linux/elf.h   | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
> new file mode 100644
> index 000000000000..2c382c8a4807
> --- /dev/null
> +++ b/include/uapi/linux/elf-r.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_ELF_R_H
> +#define _UAPI_LINUX_ELF_R_H
> +
> +#endif /* _UAPI_LINUX_ELF_R_H */
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..b3e312255552 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/elf-em.h>
> +#include <linux/elf-r.h>
>  
>  /* 32-bit ELF base types. */
>  typedef __u32	Elf32_Addr;
> 
> -- 
> 2.55.0
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
