Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026F1465A1
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566321; cv=none; b=au8cwh9Esbxqk0Xmc/e2c0Q8648lG225H0TaMuNQDtshdr7GgWaxwJ9BSlB0IegbqIhNCIOKkDZ2xGN/HQyovkIac7VR5rkUwZDtnoyICRAGfrGzbSJbVY9bdT2noVTwCDUVtWYbzof3P3qRsZrPm0GKV7hw9R4wfo76+AVrX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566321; c=relaxed/simple;
	bh=JwGvK0qeOLrELKDXtXg20v+0XzyrOv8zOjOREGV38bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIamxcwVlSzHCNz5L3AK2/hFG/O29ruLYqXseSEW63ffBN+8X0aaviM+Zy4vptff2K4LVQg3kthqaY2wWftddb8ObCoG6xjCsaQ8LumLnQqaH0cvxOd3cTWfrqrfwlEzEOeIaeeHJ/8Lzk/NKZp10Il1R8orK5rLr3HlkxFDrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vFTGnhcz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vFTGnhcz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so418562a12.2
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719566317; x=1720171117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4nRdrD3NJ1hYJ32BRxvgX77ACcWSuo5vSiMAPd1QEo=;
        b=vFTGnhczNbWOeEGqah5sikF6EKTjvxvr9qkh+ZNSoah0uuJ/PlLzJIDGfPOlhnJr6L
         X2kPUO6fJWPU2iegKIQeXkbt1HIma0Xx16gc3xysvHqIh5uoCbo4Pi4/Evk7XW+hFL4t
         LfWpdOqd3uVEe3fq1p+PFRB9M1WXXZXUno8eO3yi5uXjDjxuiHZmVmc05GmBKHkjURkJ
         e2JhwnHcOaflui7vSWQP9Fo8WaxWC5n+ILMreGiSMyDjk/cPoQmKkmcQUYsd2lwAIHug
         81pa0LyhmgH/7LNpShcNAS79raVlzW1JApm18udr5Z9idqvWHxmlHspwf4dVcPXC7VyB
         UfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566317; x=1720171117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4nRdrD3NJ1hYJ32BRxvgX77ACcWSuo5vSiMAPd1QEo=;
        b=sq3OTxG3W9Jj2jBNyy6jbJkkgS9q+kvH+3MLqzwzlTxVAvNIkp+8dAPCj2ngUtZoWk
         u8ZRUO3azSZKgjIq9q4g8+k6hF5mfssVlrNW6QqFu68ZAOVSDq+NLahamNO1D8XuNjOH
         8yLuKUuM3Nh4Lt+r6nGnEX+TOri8+LS+UOtTLCkOFfx+JrlUM/Digyo3bRNjYWkh39DA
         ggQIzoyf3QNsSk84Xqk/jtaUoC3h8PEfE/X+GkuqoMi9Bb4zmLS644CazVqOFPWZV5Ek
         4OUyA9cQfHZHuEBro4ITmwy1IiHcVd84mjWn6V+hRQot+shJjBv6DhJLTmgK0kzfRoO1
         BJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZwkmFBRoZaxTCDovSwT9ou2dJRjek5mAjNVKcvJF2g10W/QUPgRLMd1DxsMmRM4dLQA2MxRW8/4nlidyWhnqVwgl1UA==
X-Gm-Message-State: AOJu0Yw7HE+6NmaKwhcO6OQBdAdiHvUprr7LCiHIv9Y0NYg2xGh07spM
	2UEVNIeJco+bHV1lcA+XB99W99jTFASNN8iMOWuTRYLwl7+KHlG49h8G1rBk23FpWAiZWez3TA5
	lP5j89W9uOE+gCGY4rR5+8hI5gPgfC1dB7ffUww==
X-Google-Smtp-Source: AGHT+IHQJz049InCepkhc9kI7uFveWNYHnmaFhmkq0HnaP5qPMrwHzUEhWfGz6Royoe7qcT6s2kIKsKqsb8mkKgqVpA=
X-Received: by 2002:a17:906:9c87:b0:a72:7a71:7f59 with SMTP id
 a640c23a62f3a-a727a7180b9mr787751266b.57.1719566317015; Fri, 28 Jun 2024
 02:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626171652.366415-1-jesse@rivosinc.com> <20240626171652.366415-2-jesse@rivosinc.com>
In-Reply-To: <20240626171652.366415-2-jesse@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Jun 2024 11:18:25 +0200
Message-ID: <CAHVXubgUnHOQ4QF_sSYVD88W6Zuj32W3U9NSJ0Xzf9N36cqh6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] RISC-V: pi: Add kernel/pi/pi.h
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Wende Tan <twd2.me@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Wed, Jun 26, 2024 at 7:17=E2=80=AFPM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
> Add pi.h header for declarations of the kernel/pi prefixed functions
> and any other related declarations.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/kernel/pi/cmdline_early.c | 10 ++--------
>  arch/riscv/kernel/pi/fdt_early.c     |  7 +------
>  arch/riscv/kernel/pi/pi.h            | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+), 14 deletions(-)
>  create mode 100644 arch/riscv/kernel/pi/pi.h
>
> diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/=
cmdline_early.c
> index f6d4dedffb84..fbcdc9e4e143 100644
> --- a/arch/riscv/kernel/pi/cmdline_early.c
> +++ b/arch/riscv/kernel/pi/cmdline_early.c
> @@ -6,15 +6,9 @@
>  #include <asm/pgtable.h>
>  #include <asm/setup.h>
>
> -static char early_cmdline[COMMAND_LINE_SIZE];
> +#include "pi.h"
>
> -/*
> - * Declare the functions that are exported (but prefixed) here so that L=
LVM
> - * does not complain it lacks the 'static' keyword (which, if added, mak=
es
> - * LLVM complain because the function is actually unused in this file).
> - */
> -u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
> -bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
> +static char early_cmdline[COMMAND_LINE_SIZE];
>
>  static char *get_early_cmdline(uintptr_t dtb_pa)
>  {
> diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_=
early.c
> index 899610e042ab..40ee299702bf 100644
> --- a/arch/riscv/kernel/pi/fdt_early.c
> +++ b/arch/riscv/kernel/pi/fdt_early.c
> @@ -3,12 +3,7 @@
>  #include <linux/init.h>
>  #include <linux/libfdt.h>
>
> -/*
> - * Declare the functions that are exported (but prefixed) here so that L=
LVM
> - * does not complain it lacks the 'static' keyword (which, if added, mak=
es
> - * LLVM complain because the function is actually unused in this file).
> - */
> -u64 get_kaslr_seed(uintptr_t dtb_pa);
> +#include "pi.h"
>
>  u64 get_kaslr_seed(uintptr_t dtb_pa)
>  {
> diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
> new file mode 100644
> index 000000000000..65da99466baf
> --- /dev/null
> +++ b/arch/riscv/kernel/pi/pi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _RISCV_PI_H_
> +#define _RISCV_PI_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * The folowing functions are exported (but prefixed) declare them here =
so

s/folowing/following

And it lacks something between "(but prefixed)" and "declare": what
was wrong with the initial comment?

> + * that LLVM does not complain it lacks the 'static' keyword (which, if
> + * added, makes LLVM complain because the function is unused).
> + */
> +
> +u64 get_kaslr_seed(uintptr_t dtb_pa);
> +bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
> +u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
> +
> +#endif /* _RISCV_PI_H_ */
> --
> 2.45.2
>

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex
