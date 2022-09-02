Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C79186F
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 15:40:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r4so3197583edi.8
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZZViECBQIPeE26/U6PwpBaWGPbv4WEHDCGVI4qLmJb4=;
        b=Hng+Qdrwf6aoRL5qjOrDdX9dneBrnXK9dEZGpGEBFIBlyH39qCfY8ZchTBiQ96Q0QZ
         mo1ow8E2D91zJz9YHExUeoBbqrfgZfUkW/zpThocnMs6/uZURRu3lnitylvOlee0a2YS
         lKyPusHcdynwJfmX3iErtGSVR6WZ0pz0wERuQ+gOVoitU+TXKIMwyvIXxJ6kk3/xB1YN
         jVYY2LL5WiN4duAlJTouZHUSOGLWZAnS3r024F5fHcDu6W/sH2j8IaYiIBvia+Jl5ABU
         AzAcOSRqtsQoQZ3ygVlgucKeGyZsGK/jQqOSKFjZ+4s4BXtjIAoDokHMGxn5B73siZhJ
         rs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZZViECBQIPeE26/U6PwpBaWGPbv4WEHDCGVI4qLmJb4=;
        b=Kme9k/SEKI/i+oGMHRW0mHjjcBwJROO8CmXzEPRPUuDTTroYKcRsLjVoDrgQXedTmb
         mO3Lfd9+3VysrqXMtmCDzqeL+8ye54+5OwgfRt17X6gD6DYvJts7mfFjSfHRkMhqEA+b
         Ge+CP02mkApiX6fsob+Mws75UnNiDSCzSsr6wvlpLg33B2t98e/nGa8POaUGVWeNrfUX
         JETmlULfTZR6/gsABJIJ+10FchmwCK7rJ0yoNJkuWSL0kWEtMbN6jRpUpivN8f9cbyXX
         1sx+a584uPRJV6isguw7QXHQK50EOLZwsVjbGAuWS/IyYB+2rLOfgq/s+Ngya5+AzoHb
         OFjg==
X-Gm-Message-State: ACgBeo2iFU9erFLXIAcS+PF7OOfInCYn4tuRYNPsbLktlgt9WdsquWeN
	pAFpiMVhsloIV9rFQux0Dh/IpfLj8s46mP1HfcO0yg==
X-Google-Smtp-Source: AA6agR4xxlZQqkE3iOmxpnuJDnHFAJqpyc3JD/HdUdWEisfmE3Z6rtHXdERjcLrMLI5v9gj6USv11x2Cp3VoRzACFOg=
X-Received: by 2002:a05:6402:3227:b0:448:706c:185d with SMTP id
 g39-20020a056402322700b00448706c185dmr20812932eda.357.1662133205628; Fri, 02
 Sep 2022 08:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
 <YxEh+pLyOyPalW1u@dev-arch.thelio-3990X> <CABCJKucP5nXGiCTTCEPUGYo5Z9A9qaQkJ6_kXTOfw-o-=TYH0g@mail.gmail.com>
 <YxG2DUEBnIpAMKF2@hirez.programming.kicks-ass.net>
In-Reply-To: <YxG2DUEBnIpAMKF2@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 2 Sep 2022 08:39:29 -0700
Message-ID: <CABCJKudRywi7FgNOb8V7vmS39k59fbO1D3dwfmMZmBpApRX5eQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] KCFI support
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 12:51 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Sep 01, 2022 at 05:33:29PM -0700, Sami Tolvanen wrote:
>
> > > I do see a few new objtool warnings as well:
> > >
> > > vmlinux.o: warning: objtool: apply_relocate_add+0x34: relocation to !ENDBR: memcpy+0x0
> > > vmlinux.o: warning: objtool: ___ksymtab+__memcpy+0x0: data relocation to !ENDBR: memcpy+0x0
> > > vmlinux.o: warning: objtool: ___ksymtab+memcpy+0x0: data relocation to !ENDBR: memcpy+0x0
> >
> > That's interesting. I can only reproduce this warning with
> > allmodconfig+LTO, even though the relocation exists in all builds (the
> > code makes an indirect call to memcpy) and memcpy (aliased to
> > __memcpy) doesn't start with endbr. I'll have to take a closer look at
> > why this warning only appears with LTO.
>
> From just looking at the patches I'd say patch #19 breaks it. IIRC you
> forgot to make the SYM_TYPED_FUNC things emit ENDBR.
>
> Look at how x86/asm/linkage.h is overriding SYM_FUNC_START*().

Yes, that's the reason, I'll fix this next week. I was mostly
wondering why I'm not getting this warning with my other test configs,
but it looks like IBT isn't enabled by default.

Sami
