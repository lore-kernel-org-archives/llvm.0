Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6621361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 16:39:39 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ff1ed64f82so8822967b3.1
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJ1mj/6AEbnCZ4HPughZpfwPoxjL4U+12a8eW3KN+cU=;
        b=BrUCwqzxN2mNfk/ExieimQ9XkZd769u40ZXKgP3WMEJSnoidxk7l4mgPgX8TQLEUf+
         mHoGRcO4qbZrF3SZvjLddv1SFfTTPb/Qdm7F/4Iww+SxqXQBztROLAuEfJN/v/B1VpYQ
         Ow8ybjFEWj00m3V7QA+mRR5vUigRQPZszrSAj3T8lfAbC2/FCRo96LSLXzVjjdgvWDsV
         Yfs6cGR6w4Xbfm8W5Mf6h60V4gzbxVxbjBnQXmEnogjmm/VFkWUOQpgtI8/qriceckOr
         RaOqb/nWuFQtgqtCf0NnQumcR5ga8ZlkjY+sc2wBUohWGR5PrpBBo67IOdsHmRMHYVWj
         3kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJ1mj/6AEbnCZ4HPughZpfwPoxjL4U+12a8eW3KN+cU=;
        b=vugfS374NVX+wtBIH0KYZmcgiBXX6ObVJD2SwlhaJTLuEKF9zwvnEetKx4+fdto1A4
         CY4kN6aZp0gBwRMByoxG5vULEqErzuZnnaekWP+NswYyVZXhIw+Jwt05fpZtv6q0OY/1
         VsSTeEbIgregLvKS2vI4ba9ODlFEsEl9NzTPoOHPeWsy5IoJ/ISRDJ7fEI1qiAMyXOGg
         5gsfraSfdDQMQB8JKIrQ/UxSIvjpnpj5s+1xAQLm0PqBkvEahs+GrFgCaEQ7O1sJY7DD
         f2aaxk9GBJ5/qWQ1bS4LowB4NX0k+jOC8UeBxoiJ4iwrDUfmqsKw430NKlRGS5y/brxc
         Z+LQ==
X-Gm-Message-State: AOAM533cVz+uYbfqwJRMQSjx8KbOHyZ1Q9qBZjApcAK5DyQlhxDSgsZq
	Fhu7naiNnghltCKTGt0IAtDKX+bJmZtXre3ZP0afbA==
X-Google-Smtp-Source: ABdhPJzQJa1N5l2z5xfrd+zcTG6blvNDsfHVm9LuNqqXVzDY9SqhLJ1LbDtJEHO1K6Zz6VnIidKyyWBgtD0CkopkxGA=
X-Received: by 2002:a81:4ecf:0:b0:2fe:d9f2:15b3 with SMTP id
 c198-20020a814ecf000000b002fed9f215b3mr11033942ywb.305.1652719177966; Mon, 16
 May 2022 09:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com> <f65c01979b884174965802a13cf6b077@AcuMS.aculab.com>
In-Reply-To: <f65c01979b884174965802a13cf6b077@AcuMS.aculab.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 09:39:02 -0700
Message-ID: <CABCJKueo+cw1DHH6N2dUjD-U7OKqmkJUyimm0ychv1drt5U9Rg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
To: David Laight <David.Laight@aculab.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	"x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 1:32 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Sami Tolvanen
> > Sent: 13 May 2022 21:22
> >
> > With CONFIG_CFI_CLANG, the compiler injects a type preamble
> > immediately before each function and a check to validate the target
> > function type before indirect calls:
> >
> >   ; type preamble
> >   __cfi_function:
> >     int3
> >     int3
> >     mov <id>, %eax
>
> Interesting - since this code can't be executed there is no
> point adding an instruction 'prefix' to the 32bit constant.

The reason to embed the type into an instruction is to avoid the need
to special case objtool's instruction decoder.

> >     int3
> >     int3
> >   function:
> >     ...
> >   ; indirect call check
> >     cmpl    <id>, -6(%r11)
> >     je      .Ltmp1
> >     ud2
> >   .Ltmp1:
> >     call    __x86_indirect_thunk_r11
> >
> > Define the __CFI_TYPE helper macro for manual type annotations in
> > assembly code, add error handling for the CFI ud2 traps, and allow
> > CONFIG_CFI_CLANG to be selected on x86_64.
> >
> ...
> > +
> > +     /*
> > +      * The compiler generates the following instruction sequence
> > +      * for indirect call checks:
> > +      *
> > +      *   cmpl    <id>, -6(%reg)     ; 7 bytes
>
> If the <id> is between -128 and 127 then an 8bit constant
> (sign extended) might be used.
> Possibly the compiler forces the assembler to generate the
> long form.
>
> There could also be a REX prefix.
> That will break any code that tries to use %reg.

The compiler always generates this specific instruction sequence.

> > +      *   je      .Ltmp1             ; 2 bytes
> > +      *   ud2                        ; <- addr
> > +      *   .Ltmp1:
> > +      *
> > +      * Both the type and the target address can be decoded from the
> > +      * cmpl instruction.
> > +      */
> > +     if (copy_from_kernel_nofault(buffer, (void *)regs->ip - 9, MAX_INSN_SIZE))
> > +             return;
> > +     if (insn_decode_kernel(&insn, buffer))
> > +             return;
> > +     if (insn.opcode.value != 0x81 || X86_MODRM_REG(insn.modrm.value) != 7)
> > +             return;
>
> Since you are looking for a very specific opcode why bother
> calling insn_decode_kernel() - just check for the required (masked)
> byte values.

Because I need to decode both the immediate value and the register
from that instruction.

> > +
> > +     *type = insn.immediate.value;
> > +
> > +     offset = insn_get_modrm_rm_off(&insn, regs);
>
> Given the expected instruction, isn't that -6 ??

No, this is the register offset.

> > +     if (offset < 0)
> > +             return;
> > +
> > +     *target = *(unsigned long *)((void *)regs + offset);
>
> WTF is that calculating??

It's reading the register value from pt_regs.

Sami
