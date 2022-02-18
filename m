Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F1F4C6F
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 19:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A3BC340F1
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645211336;
	bh=0ANPVcYiGjV9CbXYsCpHaQ5gI/JNFJsxlUk9bhKhnGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZYhp7l+uzUYGgxUYINN4dWQOgJfqGL749UJgp5kHXX/jz2RPpN2G9MqeWYikpA4p2
	 cCvl/BEQTq0PTRMvorm7QOAARZena/HDYDpFVd2Rp1y2O2IeMu8u2Pc3Cv/es/vEt4
	 krYGcjmijgBSgQF0sG/aTZ2K8Yb0/uRtIYxKycDCvYNEZZiWr9s+fQKCEPUPIUabWX
	 kkH1w8/xwdJiwgCYFF5loDnDCRDljmcdpB/h74Q8LZKpqxdHwZ1ywleHB58c7aweCT
	 4AdhzsDTgv8qSHJsL3zSF/nvgrRWHkGdYkIbN4iP1TkO0zR2czvumN4wVjPfKExDl3
	 vGJVLI2HSEWmA==
Received: by mail-wm1-f54.google.com with SMTP id bg21-20020a05600c3c9500b0035283e7a012so7116323wmb.0
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 11:08:56 -0800 (PST)
X-Gm-Message-State: AOAM533vVIiPZ4vt34o+tfvkmptat83vSKJeKC3vjlzU6tbwLT+GINP6
	FR27tBCI/Q3biR1kqa7ihPEEZMBdDWQ+hA13h0U=
X-Google-Smtp-Source: ABdhPJzKg9qhWEhyz1nvDZz+sCoU7KQ6y6fKhkLMhReQq7NUX2utYbD3eBjOhzBjnL/eImO6Ut4c+1iZeUMTM0+Y1eM=
X-Received: by 2002:a1c:f205:0:b0:37b:ec48:72a with SMTP id
 s5-20020a1cf205000000b0037bec48072amr8292384wmc.190.1645211334959; Fri, 18
 Feb 2022 11:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220218081209.354383-1-maskray@google.com> <CAMj1kXGZuOWOPEHv0YSM4GseG2PnTgS8mSLXQ+imo-TN7MmvaQ@mail.gmail.com>
 <20220218085016.jv4qcfaxav5fxhrs@google.com> <Yg/KjpHOZ7HwZq9f@dev-arch.archlinux-ax161>
In-Reply-To: <Yg/KjpHOZ7HwZq9f@dev-arch.archlinux-ax161>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Feb 2022 20:08:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHjAxf9gxcAXGpDwR2DUc5jYVdJFzWbwJxcMLg5-y=kxA@mail.gmail.com>
Message-ID: <CAMj1kXHjAxf9gxcAXGpDwR2DUc5jYVdJFzWbwJxcMLg5-y=kxA@mail.gmail.com>
Subject: Re: [PATCH] arm64 module: remove (NOLOAD)
To: Nathan Chancellor <nathan@kernel.org>
Cc: Fangrui Song <maskray@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Feb 2022 at 17:34, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Feb 18, 2022 at 12:50:16AM -0800, Fangrui Song wrote:
> > On 2022-02-18, Ard Biesheuvel wrote:
> > > On Fri, 18 Feb 2022 at 09:12, Fangrui Song <maskray@google.com> wrote:
> > > >
> > > > On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> > > > inappropriate for .plt and .text.* sections which are always
> > > > SHT_PROGBITS.
> > > >
> > > > In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> > > > and (NOLOAD) will be essentially ignored. In ld.lld, since
> > > > https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> > > > customize the output section type"), ld.lld will report a `section type
> > > > mismatch` error. Just remove (NOLOAD) to fix the error.
> > > >
> > > > [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> > > > section should be marked as not loadable" on
> > > > https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> > > > outdated for ELF.
> > >
> > > This patch lacks a SOB line.
> > >
> > > With one added,
> > >
> > > Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Ah, yes. Sorry, I haven't sent a kernel patch for a while...
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
>
> I am assuming this patch is the solution we want, as opposed to Ard's
> suggestion of renaming these sections at
> https://reviews.llvm.org/D118840 (unless that was a tangential
> suggestion).
>

Renaming will not make the problem go away. It will only clear up the
confusion regarding the contents of these sections, which are not in
fact linker emitted PLT entries, but branching veneers emitted by the
kernel's module loader.

> I have verified that modules still load. Additionally, this needs to go
> to stable so that groups who upgrade their toolchain to a revision that
> include the LLD patch don't get broken as well.
>
> Cc: stable@vger.kernel.org
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
>
> > > > ---
> > > >  arch/arm64/include/asm/module.lds.h | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
> > > > index a11ccadd47d2..094701ec5500 100644
> > > > --- a/arch/arm64/include/asm/module.lds.h
> > > > +++ b/arch/arm64/include/asm/module.lds.h
> > > > @@ -1,8 +1,8 @@
> > > >  SECTIONS {
> > > >  #ifdef CONFIG_ARM64_MODULE_PLTS
> > > > -       .plt 0 (NOLOAD) : { BYTE(0) }
> > > > -       .init.plt 0 (NOLOAD) : { BYTE(0) }
> > > > -       .text.ftrace_trampoline 0 (NOLOAD) : { BYTE(0) }
> > > > +       .plt 0 : { BYTE(0) }
> > > > +       .init.plt 0 : { BYTE(0) }
> > > > +       .text.ftrace_trampoline 0 : { BYTE(0) }
> > > >  #endif
> > > >
> > > >  #ifdef CONFIG_KASAN_SW_TAGS
> > > > --
> > > > 2.35.1.265.g69c8d7142f-goog
> > > >
> >
