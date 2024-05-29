Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFE167D95
	for <llvm@lists.linux.dev>; Wed, 29 May 2024 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716967562; cv=none; b=AbUadDWZRq5l38Jr6z61jORhIvoPJ3e2n1PiuYUTaUbMYtsx+fXsc3MzhMJ4w1w2Ucq2hckONRQohMfc1+cGs/nSvCb25Q7W3cQdAIeWx7hzodAWhr7anaRd2tDahVZp2WcFCehRThFQBekcm0g/o07r4DcMa/iYVb+kgTL/Tk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716967562; c=relaxed/simple;
	bh=ZEVr1l/zLyARsxNs4P1butY5hWf3rmFo/maylE+sV1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgugjIHpaqCKDzO65MEcIBcfdhCGeM/lC1wDvWWya5myTIPlYw8Rqj1uJ+FauSnDjjIOqpbjUUbySXQ5ffXtroys3aZpxx6KiQVmZAsHfrEtYABnNkSvu3Q3X+GkE3UKWouD4sZ1yA2YeArEKZuvcSFwYnlHbPeLFg5zf6MUZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=osXNNnZV; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="osXNNnZV"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-804e3292412so517163241.0
        for <llvm@lists.linux.dev>; Wed, 29 May 2024 00:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716967560; x=1717572360; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nWzvmzN7ijIbCBaVTu7XEGtPfeKO3l3ACHDt/WVaHXI=;
        b=osXNNnZVK/xBpSqQsAxpimgukOxX479RbcO5wZXc7Z3mvGJhedRMUhY5Ty2Y2aHUvb
         75IaY+X6psJ8rTT62dpCH0WKEHdq0cKfKk55AzAVjc/ETIrP+XgkXpb99TKfAP/SzKZq
         s+tCoUlZKmlPx2oPJoyUYdU4KkdF0Lyw4hmdzylUlRq9WIAHwyPoYthAFWKytwbLeZVG
         5X6Q1K58LRyoRsep/3ilwbfBBpJ62OFFnJZxsKUMzFt5r26fXBHh26B73FUK7yUG9RPW
         YPW4wiQSv7+lGPhtmxVyYF12OxhTkhlhOoPuODRkGg+BYP4OfAaQaMbPSWn2Klsl6N92
         7EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967560; x=1717572360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWzvmzN7ijIbCBaVTu7XEGtPfeKO3l3ACHDt/WVaHXI=;
        b=iokSUpTueVp0ThFPAleeo6avQRfO6jqrk95YCbd21O3B/iQcFKq+hKeWaocyDMfvUa
         Jcy60z4sxvzlGn0ypEDU3k6/7n23fgjuVNhxlxJyyOs9bGSW8HLpZZ7IelDuTXwEuNOC
         QudGP2hECw0IoMcLRSJiC/XXDlXIkbFHtIJDAtdg9UlXIcbxctrRPIsbyNwIOMvvAOrN
         Yu6eHVN0wh+YXNrlsoF00XMjYjS5orRNPeE1G/2AyVu81ZxzeiQbBcE+jFi+YAKtISg5
         asPpfBqqWEdb9VJkU7aoO23cDm8X+Q1vg87Wdcb2IjLIXcmbftz3B1vCea8LmYMbGf88
         D4wA==
X-Forwarded-Encrypted: i=1; AJvYcCXPrLknb+AiKH0F7d41CsissepXVFE/A873uwMw3JjK2ZfoX4A7lNiaY7aMDDuYzErOI6H6eI1VAP4T8VP+1EScP7+J7A==
X-Gm-Message-State: AOJu0YzO4N0jibx1eNSW5pzFREZ7gWndbWinc3gQEW0e5NIYt1Q0iHCB
	kV8ZLxOoGJcGD3/utUG87ntVj45kxJHkbU5HgBq27lseSnHQvzUHoqVwiEioFHAzy4XjhvI/+zG
	cblZGkNcBbVzmSPEj1AEd73SHpgA1p+0CEL5u
X-Google-Smtp-Source: AGHT+IFkhX+U8E/UmnrduSNww5O5l+Jhyabcq43rO3oLokyOCkCQOrAis9BA94QiL3EC3pI8usLyYmJe1k/GKdnaMP4=
X-Received: by 2002:a67:f4c7:0:b0:47c:2c84:4321 with SMTP id
 ada2fe7eead31-48a38575d3cmr13715697137.16.1716967560033; Wed, 29 May 2024
 00:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
In-Reply-To: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 29 May 2024 09:25:21 +0200
Message-ID: <CANpmjNM2S2whk31nfNGSBO5MFPPUHX7FPuHBJn1nN9zdP63xTw@mail.gmail.com>
Subject: Re: [PATCH] x86/traps: Enable UBSAN traps on x86
To: Gatlin Newhouse <gatlin.newhouse@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Changbin Du <changbin.du@huawei.com>, 
	Pengfei Xu <pengfei.xu@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Xin Li <xin3.li@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 May 2024 at 04:20, Gatlin Newhouse <gatlin.newhouse@gmail.com> wrote:
[...]
>         if (regs->flags & X86_EFLAGS_IF)
>                 raw_local_irq_enable();
> -       if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> -           handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> -               regs->ip += LEN_UD2;
> -               handled = true;
> +
> +       if (insn == INSN_UD2) {
> +               if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> +               handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> +                       regs->ip += LEN_UD2;
> +                       handled = true;
> +               }
> +       } else {
> +               if (handle_ubsan_failure(regs, insn) == BUG_TRAP_TYPE_WARN) {

handle_ubsan_failure currently only returns BUG_TRAP_TYPE_NONE?

> +                       if (insn == INSN_REX)
> +                               regs->ip += LEN_REX;
> +                       regs->ip += LEN_UD1;
> +                       handled = true;
> +               }
>         }
>         if (regs->flags & X86_EFLAGS_IF)
>                 raw_local_irq_disable();
> diff --git a/arch/x86/kernel/ubsan.c b/arch/x86/kernel/ubsan.c
> new file mode 100644
> index 000000000000..6cae11f4fe23
> --- /dev/null
> +++ b/arch/x86/kernel/ubsan.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Clang Undefined Behavior Sanitizer trap mode support.
> + */
> +#include <linux/bug.h>
> +#include <linux/string.h>
> +#include <linux/printk.h>
> +#include <linux/ubsan.h>
> +#include <asm/ptrace.h>
> +#include <asm/ubsan.h>
> +
> +/*
> + * Checks for the information embedded in the UD1 trap instruction
> + * for the UB Sanitizer in order to pass along debugging output.
> + */
> +enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn)
> +{
> +       u32 type = 0;
> +
> +       if (insn == INSN_REX) {
> +               type = (*(u16 *)(regs->ip + LEN_REX + LEN_UD1));
> +               if ((type & 0xFF) == 0x40)
> +                       type = (type >> 8) & 0xFF;
> +       } else {
> +               type = (*(u16 *)(regs->ip + LEN_UD1));
> +               if ((type & 0xFF) == 0x40)
> +                       type = (type >> 8) & 0xFF;
> +       }
> +       pr_crit("%s at %pS\n", report_ubsan_failure(regs, type), (void *)regs->ip);
> +
> +       return BUG_TRAP_TYPE_NONE;
> +}

Shouldn't this return BUG_TRAP_TYPE_WARN?
