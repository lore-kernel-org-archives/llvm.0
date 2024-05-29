Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26E14534D
	for <llvm@lists.linux.dev>; Wed, 29 May 2024 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717015004; cv=none; b=NjCfgzlYMDPCOQVM8tbZezJwXcyda9nR33H8wetjQxTiOCtBdNmDiCB5x6HWZDjd5nmWIoC/O8d5UzmenbW7z6bqBIL/DMW21uY9xEkBGGDVKsl/p8C2QKQiE1PSIWgh1Mcp+y32xuGwtwyaHovfVBq2kD+QalVobnxE7x3bYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717015004; c=relaxed/simple;
	bh=KAuwmpAQlvgKVAuhQljiF3gBQKzQXSKUp3q7GZNgyAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDFrBKynUVmiodS5gS3DcCDqRjo1p5FRj/4n+2TXV6lzgPkKpq4QavYWGXU1znxQRfhCzlSkT+Uki2kDEc57ASZeIV5QWFsx37u3U3+R6g53Zzb+HAt8maEfvs1tKWOEiuQPeD9trFF/zD00xPhPpHMVpuyMSEfNHjCoYwoPIWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AD0Z+Or7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AD0Z+Or7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a52d2688so1496025ad.3
        for <llvm@lists.linux.dev>; Wed, 29 May 2024 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717015002; x=1717619802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsDD1NAPFioHO4gLv1AtQFDU2NR/QOFSQPXZbsUyXIQ=;
        b=AD0Z+Or7cgCmH764zOUurRX0vnc/Q5dAhOQ7qLj4XPTCIwF4N+3IPtQEc0iDe8feCM
         CQLFMTv7dbUwYTH0u07sMReryJvTUZCVVGBn7tuaZ0XWz1H1wUTeOGJywxoC91g26kbD
         DJa13sHyyOtXIpdhMeRpWbgjeShe/3bf7PTYdmMLZwPnnuHlEc9WdaAcCepO6GuJ68MZ
         N3l8Dg9bYFhyR7a1HCMnGEf/jAPUYqsK9GCaStrNGRkXbG4K2UZ6SEIVVTnziH6zULWJ
         P49QLzNdd38rrlEo+SAtFYvPHNQFuAR5q0tfnGSEm65TllgJPSSTQhtCT6qLpDV6Mram
         o2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717015002; x=1717619802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsDD1NAPFioHO4gLv1AtQFDU2NR/QOFSQPXZbsUyXIQ=;
        b=ew0zjB/vKDBBkkCipnKr7+yuth+hJ7d9r0FKE4SaSc3Iv8JN0Pgs5DD2O8dtlBjLCf
         +c43Ix/rThANaNEaStmhYFyuOk1wrOd4w51EVFMyOmOCdYX92nmOZKJwDoPcQ/odxMUy
         IsgnbhlLtElwbHvRL1ldNZqMA4gfKwWnrhYdDblljH1KBIBg4JiCPgWqkHms5pGnVImF
         rfUSSBWiSaGO+QiFHhtC+dxiiNQZGiPx30OPx8++95AnDCMPadteOPkkx1uxXxkFANjG
         fZaWElxn0wByGQw6C6ZAm0DTI9OSbGg42q7iRmcF0ajpItlyVSd7/WNiQhw9gIY9fr9c
         7Ytg==
X-Forwarded-Encrypted: i=1; AJvYcCUC7Bh027f0cj68c3Y6zUr5QCfTAyGPq84Gjec+NDnXxaXMRagZ6UecZXcoOD5MCWar+zcj8NG7oTPHsnZ3QenaOlxhWg==
X-Gm-Message-State: AOJu0YxrshfwSxhqz76l8/p0s4ru2C8bb9o13lXgF/4ymnSqxUSeNvs8
	T9BDEeHac/2rz5daxpo9zBuACsRmoeHH8RODFLTs1QbT2531h/kT
X-Google-Smtp-Source: AGHT+IFzfRiiqI8oIBnyBDHVNzQy3TKrU+G1kSritJ5B25V5oeLzSgd4JGxkvl7xiz1uHMCm0UlTbw==
X-Received: by 2002:a17:903:8c3:b0:1f2:f986:595d with SMTP id d9443c01a7336-1f61a4dd759mr1743215ad.66.1717015001980;
        Wed, 29 May 2024 13:36:41 -0700 (PDT)
Received: from Gatlins-MacBook-Pro.local ([131.252.143.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75e579sm103603725ad.35.2024.05.29.13.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:36:41 -0700 (PDT)
Date: Wed, 29 May 2024 13:36:39 -0700
From: Gatlin Newhouse <gatlin.newhouse@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Changbin Du <changbin.du@huawei.com>, 
	Pengfei Xu <pengfei.xu@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Xin Li <xin3.li@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] x86/traps: Enable UBSAN traps on x86
Message-ID: <57vgoje4bmrckwqtwnletukcnlvjpj2yp3cjlkym4bfw66a57a@w35yjzcurcis>
References: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
 <CANpmjNM2S2whk31nfNGSBO5MFPPUHX7FPuHBJn1nN9zdP63xTw@mail.gmail.com>
 <2j6nkzn2tfdwdqhoal5o56ds2hqg2sqk5diolv23l5nzteypzh@fi53ovwjjl3w>
 <CANpmjNM4pFHYRqmBLi0qUm8K2SroYWg7NFjreHffHvk0WW95kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNM4pFHYRqmBLi0qUm8K2SroYWg7NFjreHffHvk0WW95kA@mail.gmail.com>

On Wed, May 29, 2024 at 08:30:20PM UTC, Marco Elver wrote:
> On Wed, 29 May 2024 at 20:17, Gatlin Newhouse <gatlin.newhouse@gmail.com> wrote:
> >
> > On Wed, May 29, 2024 at 09:25:21AM UTC, Marco Elver wrote:
> > > On Wed, 29 May 2024 at 04:20, Gatlin Newhouse <gatlin.newhouse@gmail.com> wrote:
> > > [...]
> > > >         if (regs->flags & X86_EFLAGS_IF)
> > > >                 raw_local_irq_enable();
> > > > -       if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> > > > -           handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> > > > -               regs->ip += LEN_UD2;
> > > > -               handled = true;
> > > > +
> > > > +       if (insn == INSN_UD2) {
> > > > +               if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> > > > +               handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> > > > +                       regs->ip += LEN_UD2;
> > > > +                       handled = true;
> > > > +               }
> > > > +       } else {
> > > > +               if (handle_ubsan_failure(regs, insn) == BUG_TRAP_TYPE_WARN) {
> > >
> > > handle_ubsan_failure currently only returns BUG_TRAP_TYPE_NONE?
> > >
> > > > +                       if (insn == INSN_REX)
> > > > +                               regs->ip += LEN_REX;
> > > > +                       regs->ip += LEN_UD1;
> > > > +                       handled = true;
> > > > +               }
> > > >         }
> > > >         if (regs->flags & X86_EFLAGS_IF)
> > > >                 raw_local_irq_disable();
> > > > diff --git a/arch/x86/kernel/ubsan.c b/arch/x86/kernel/ubsan.c
> > > > new file mode 100644
> > > > index 000000000000..6cae11f4fe23
> > > > --- /dev/null
> > > > +++ b/arch/x86/kernel/ubsan.c
> > > > @@ -0,0 +1,32 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Clang Undefined Behavior Sanitizer trap mode support.
> > > > + */
> > > > +#include <linux/bug.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/printk.h>
> > > > +#include <linux/ubsan.h>
> > > > +#include <asm/ptrace.h>
> > > > +#include <asm/ubsan.h>
> > > > +
> > > > +/*
> > > > + * Checks for the information embedded in the UD1 trap instruction
> > > > + * for the UB Sanitizer in order to pass along debugging output.
> > > > + */
> > > > +enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn)
> > > > +{
> > > > +       u32 type = 0;
> > > > +
> > > > +       if (insn == INSN_REX) {
> > > > +               type = (*(u16 *)(regs->ip + LEN_REX + LEN_UD1));
> > > > +               if ((type & 0xFF) == 0x40)
> > > > +                       type = (type >> 8) & 0xFF;
> > > > +       } else {
> > > > +               type = (*(u16 *)(regs->ip + LEN_UD1));
> > > > +               if ((type & 0xFF) == 0x40)
> > > > +                       type = (type >> 8) & 0xFF;
> > > > +       }
> > > > +       pr_crit("%s at %pS\n", report_ubsan_failure(regs, type), (void *)regs->ip);
> > > > +
> > > > +       return BUG_TRAP_TYPE_NONE;
> > > > +}
> > >
> > > Shouldn't this return BUG_TRAP_TYPE_WARN?
> >
> > So as far as I understand, UBSAN trap mode never warns. Perhaps it does on
> > arm64, although it calls die() so I am unsure. Maybe the condition in
> > handle_bug() should be rewritten in the case of UBSAN ud1s? Do you have any
> > suggestions?
> 
> AFAIK on arm64 it's basically a kernel OOPS.
> 
> The main thing I just wanted to point out though is that your newly added branch
> 
> > if (handle_ubsan_failure(regs, insn) == BUG_TRAP_TYPE_WARN) {
> 
> will never be taken, because I don't see where handle_ubsan_failure()
> returns BUG_TRAP_TYPE_WARN.
>

Initially I wrote this with some symmetry to the KCFI checks nearby, but I
was unsure if this would be considered handled or not.

> 
> That means 'handled' will be false, and the code in exc_invalid_op
> will proceed to call handle_invalid_op() which is probably not what
> you intended - i.e. it's definitely not BUG_TRAP_TYPE_NONE, but one of
> TYPE_WARN of TYPE_BUG.
>

This remains a question to me as to whether it should be considered handled
or not. Which is why I'm happy to change this branch which is never taken to
something else that still outputs the UBSAN type information before calling
handle_invalid_op().

> 
> Did you test it and you got the behaviour you expected?
>

Testing with LKDTM provided the output I expected. The UBSAN type information
along with file and offsets are output before an illegal op and trace.
