Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A59DDA1
	for <llvm@lists.linux.dev>; Wed, 29 May 2024 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006619; cv=none; b=SiQgEZ/tPqHzEkuI3/fmUCnOletjasrgHBIEYNfYMJvNBfmLC/4yf051dBZ8ldvNI5PwDmibwIO5nETZKn7z/LiwsQr+aQrVne3JTs/uEkzpiWfXA9zzAo5IW9iCMRsCc17u8/ry41+XW1lCHusWad1O5Ug8ugbU4IO7zRyZy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006619; c=relaxed/simple;
	bh=bBxK7oGH7Qc+v5OVBzgZ/gYfy8r6SkX1r3Lg7bTGGck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcAsA6WF1ivQcbBRbb6uT/hVjgnQsAghApk/J8Q/DsTLTzpQJxeg2zDj3dozzc9NcOQBCp+sP5L+Co3hcSi7Oftlgg9/mcdj29Q2nXLiYZ4blUDzTddKicV1ihuMiDxQOREm3SbQp0q1QpCCh3020f7DZJxwP+rBhft6hoqpMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf/4RuG/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf/4RuG/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f44b5d0c50so308255ad.2
        for <llvm@lists.linux.dev>; Wed, 29 May 2024 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717006617; x=1717611417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXEkR867jEs+moBzGXY8ULu3YeFsr12ik86Lu88hpJM=;
        b=Yf/4RuG/9DFD8ZFQbNf4gjxtZtxvNY7SnGxPA1aBsdfp9fO+C1jyjNUOnwkYTA+HDW
         k2l5+N2oFfvKAURwTVkgGXC2SINxxuIjNdwSAC4Op6EQGiNlBNMRoIvTn8r3Y4M7Fz2r
         mkidxgKjiGle0Wo9GWAjCtfirKW5pN53yR6MCtO0dUjVeffeGTK1WwDIw+Dlub2IkUUd
         w4NwTLHRIMAGFsR8yTS4p4cnryBEPT5ok/7E/Zx716B0YLllwUVii0ndAbRcEgo6nunM
         TGy0Q4c6UG1ePRz9LqpRbV92Kv6LBs0KWoLpQUXCwEYbXDJxWguHxpskW0MQIQwYJfAW
         zAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717006617; x=1717611417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXEkR867jEs+moBzGXY8ULu3YeFsr12ik86Lu88hpJM=;
        b=XZjyKqZRMUylQ6nQkPRulf4vgUo7MWAQ/6kA6z1ZEQZn/8cwpkqbJ1wAO5Bh2fF0ij
         0QTn+iRNLPCoguXzkFl5x0PlJj9kg80UDz0wS3mO8IkYOxccoidGwsCKM4j2BLB235BX
         gxBoLMGod2LeI/ZdevXG0qpX5al9gr+XRHXFaWfehNbFdW6JLRrsbCDfDuVGg0dh895G
         LNonxaNrFKMK/n+ZJUSqHOTZ4c40IRw+xBkWk4OhPMpz3hMLU/xUCXKAiqAGru2br4/a
         zApzeLzoZg9MHn63Gfi4qqJJWrmE4KEsy8d9phjMKXj+bM8Yoqoy/v9OeSq19+pA1tsN
         EhNw==
X-Forwarded-Encrypted: i=1; AJvYcCUhn+hFx3uUJmWHFkEgOpY/PleOnHAG+VpbmUYFthVbulI4m5iLBsBuEvVrLFfCIdRvaZXW3OMOur7NHE+7bJxm+RlXuA==
X-Gm-Message-State: AOJu0YxcUon8v6Xlj2JOLt9SDOtxHRimNVt5Buyni8XF5AJgGVF3Pt0I
	SRIrAmIA/tRmSsjjuiRwsFSAbui2fitSudSH+Lhedhgf7Kstyyms
X-Google-Smtp-Source: AGHT+IEX452clUdy+2NK2IX+qUe8wBeDObu8s6wfNc0sKgoaVuLMAuhtbZnjhqa4qhDIJRoL4CRqTA==
X-Received: by 2002:a17:902:dacc:b0:1f4:be9b:d306 with SMTP id d9443c01a7336-1f4be9bd71dmr75508835ad.31.1717006616911;
        Wed, 29 May 2024 11:16:56 -0700 (PDT)
Received: from Gatlins-MacBook-Pro.local ([131.252.142.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7592e6sm102718815ad.45.2024.05.29.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:16:56 -0700 (PDT)
Date: Wed, 29 May 2024 11:16:55 -0700
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
Message-ID: <2j6nkzn2tfdwdqhoal5o56ds2hqg2sqk5diolv23l5nzteypzh@fi53ovwjjl3w>
References: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
 <CANpmjNM2S2whk31nfNGSBO5MFPPUHX7FPuHBJn1nN9zdP63xTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNM2S2whk31nfNGSBO5MFPPUHX7FPuHBJn1nN9zdP63xTw@mail.gmail.com>

On Wed, May 29, 2024 at 09:25:21AM UTC, Marco Elver wrote:
> On Wed, 29 May 2024 at 04:20, Gatlin Newhouse <gatlin.newhouse@gmail.com> wrote:
> [...]
> >         if (regs->flags & X86_EFLAGS_IF)
> >                 raw_local_irq_enable();
> > -       if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> > -           handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> > -               regs->ip += LEN_UD2;
> > -               handled = true;
> > +
> > +       if (insn == INSN_UD2) {
> > +               if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> > +               handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
> > +                       regs->ip += LEN_UD2;
> > +                       handled = true;
> > +               }
> > +       } else {
> > +               if (handle_ubsan_failure(regs, insn) == BUG_TRAP_TYPE_WARN) {
> 
> handle_ubsan_failure currently only returns BUG_TRAP_TYPE_NONE?
> 
> > +                       if (insn == INSN_REX)
> > +                               regs->ip += LEN_REX;
> > +                       regs->ip += LEN_UD1;
> > +                       handled = true;
> > +               }
> >         }
> >         if (regs->flags & X86_EFLAGS_IF)
> >                 raw_local_irq_disable();
> > diff --git a/arch/x86/kernel/ubsan.c b/arch/x86/kernel/ubsan.c
> > new file mode 100644
> > index 000000000000..6cae11f4fe23
> > --- /dev/null
> > +++ b/arch/x86/kernel/ubsan.c
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Clang Undefined Behavior Sanitizer trap mode support.
> > + */
> > +#include <linux/bug.h>
> > +#include <linux/string.h>
> > +#include <linux/printk.h>
> > +#include <linux/ubsan.h>
> > +#include <asm/ptrace.h>
> > +#include <asm/ubsan.h>
> > +
> > +/*
> > + * Checks for the information embedded in the UD1 trap instruction
> > + * for the UB Sanitizer in order to pass along debugging output.
> > + */
> > +enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn)
> > +{
> > +       u32 type = 0;
> > +
> > +       if (insn == INSN_REX) {
> > +               type = (*(u16 *)(regs->ip + LEN_REX + LEN_UD1));
> > +               if ((type & 0xFF) == 0x40)
> > +                       type = (type >> 8) & 0xFF;
> > +       } else {
> > +               type = (*(u16 *)(regs->ip + LEN_UD1));
> > +               if ((type & 0xFF) == 0x40)
> > +                       type = (type >> 8) & 0xFF;
> > +       }
> > +       pr_crit("%s at %pS\n", report_ubsan_failure(regs, type), (void *)regs->ip);
> > +
> > +       return BUG_TRAP_TYPE_NONE;
> > +}
> 
> Shouldn't this return BUG_TRAP_TYPE_WARN?

So as far as I understand, UBSAN trap mode never warns. Perhaps it does on
arm64, although it calls die() so I am unsure. Maybe the condition in
handle_bug() should be rewritten in the case of UBSAN ud1s? Do you have any
suggestions?
