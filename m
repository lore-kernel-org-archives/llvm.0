Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230397A
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 00:10:34 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id n8so3330543yba.2
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 17:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jEuccm+13frSO13F4UbCDTaTKUna0j27ZhD3kYwCOE=;
        b=JG1XFgHmFM4OuFOHTn6dJ+pnT7DBjuTnLLajlNshh/FVuAMf/Vcgwwn8szGEZ8KruF
         vQpvV4fPl3wu0AFGuxR+056dIMgw+zWIjX+TffF1DhBaJaFOpdAzRIYDtTKCvoAKjdXj
         BzVxedIfh40R8VC6K5GWDkdtNRHXbf4k18N/yLNjoKQr4hzcCeJg2x+w1GqNya2gnj8o
         FfyymnsCfk/iOTTbIXvP24Vt9k2ZpvlqeM2z9LgEMTllqAJj6kzzaqUVsrhi57Yt/BRw
         x+1HgIa1RKXKE4fimavD8OUII7AuSQOc4PYz6QCzHTzBlw7Phkl4GzrXs0dMWoCEs+LM
         hZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jEuccm+13frSO13F4UbCDTaTKUna0j27ZhD3kYwCOE=;
        b=yx1+eOaJoaWmSLJuYWrsADKuFWaJ6PENepjfCtYno7wnApCX8uvv4KRJHJ8HPO0+ge
         86s5xnP1ssMkD5D59nS7+gzg7kwe8CtX9/e8UDrDSV3Yu2HO5b2tDWMp5iiTpA4jfstx
         fa10f74R31NvqFfNJ0jRpFzeQcquigQhbdHL5VfVp0A/+CaYmVzLeIx+Jxqo+pE1qyid
         FIdsiCGU408LgYymEAlfdhlru2FqcWmJeQAtCM7TMwornkd592Ru/onsogtYQChLxWe+
         RZL5mqy0levMyLNhkZshZAcgJCbjVY+rkA98OyWBxW4TGhWVCnYAOFK8uN7vSSgfceYc
         CqXA==
X-Gm-Message-State: AJIora9a243Y1YdBO26JR2jRZrsQDuecDPl2wNts+MkXZBcYM6GEyZvu
	BZFExcVYRmuiqUMxx6PWpUyvNJ1SXbJan8kkoCAE0g==
X-Google-Smtp-Source: AGRyM1vcor1AoZoF/hJYr87qRlJIfLAt0f7iGROesAM925P5MkdFlgqOJv1cHjTmmUDBGaoOCe+/7SUZgR29WPcH5Y0=
X-Received: by 2002:a5b:cc6:0:b0:66e:45c6:2a25 with SMTP id
 e6-20020a5b0cc6000000b0066e45c62a25mr11454535ybr.304.1658794233835; Mon, 25
 Jul 2022 17:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
 <20220610233513.1798771-21-samitolvanen@google.com> <YtvZvYHC1BKzEz1p@worktop.programming.kicks-ass.net>
In-Reply-To: <YtvZvYHC1BKzEz1p@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Jul 2022 17:09:57 -0700
Message-ID: <CABCJKucWbN15tH=zJ7HFeNnOPB3v7S=2=oL3pmp89OHOM2=oYw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 20/20] x86: Add support for CONFIG_CFI_CLANG
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 23, 2022 at 4:21 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 10, 2022 at 04:35:13PM -0700, Sami Tolvanen wrote:
>
> > +#ifdef CONFIG_CFI_CLANG
> > +#define __CFI_TYPE(name)                                     \
> > +     .fill 7, 1, 0xCC ASM_NL                                 \
> > +     SYM_START(__cfi_##name, SYM_L_LOCAL, SYM_A_NONE)        \
> > +     int3 ASM_NL                                             \
> > +     int3 ASM_NL                                             \
> > +     mov __kcfi_typeid_##name, %eax ASM_NL                   \
> > +     int3 ASM_NL                                             \
> > +     int3 ASM_NL                                             \
> > +     SYM_FUNC_END(__cfi_##name)
> > +#endif
>
> Like said on IRC yesterday, this doesn't generate the right mov
> encoding.
>
>         .byte 0xb8 ; .long __kcfi_typeid_##name ;               \
>
> works. Your LLVM tree already has the ZExt patch you gave me yesterday
> to fix up the linker fallout from this change.

Indeed, I updated my kernel tree and confirmed that this fixes the
issue. Thanks for pointing it out.

Sami
