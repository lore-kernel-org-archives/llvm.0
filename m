Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CA2D0C84
	for <llvm@lists.linux.dev>; Sun,  7 Dec 2025 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125672; cv=none; b=O2J8I0EffCm5F6QrBEaRuNQJ+52P/0RzrG4wS8mvdTasznWrnnMQ/9+PPI3kD5FYxiTQk8syrQvTKBmYV30sCJ6VaTIIdiwufEU9rNFXJsLK8Q2bBwbd0sLBm5V5l46fFLhh8wGE+XuELG5ZpSiuo0XKwOTzzENa1U27z1lGz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125672; c=relaxed/simple;
	bh=PpPAV95Hz35dkTAIqyT24tsT/63onM3eEAua4pxdi7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFbvZ4kw0knvdAZLG914GTr8y6pyjj0dm6prf90WkRo95tpEG15ZBdJTbhX/s0UeGKHRCIUe8hVmwS9tJn+v6CEJPMvHW9IZa4aZwHvmPnCxjz/tpfdkdocmd86sc1RHt4aAQuH6MLp5xqhWGplhRovyk9JPBm0jMy8IKTCHFWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBjbXWlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBjbXWlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A65C19422
	for <llvm@lists.linux.dev>; Sun,  7 Dec 2025 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765125672;
	bh=PpPAV95Hz35dkTAIqyT24tsT/63onM3eEAua4pxdi7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SBjbXWlLWPHTfpFBML3W5qAILPxJ/rgMzXxWCqGsNWGYV5htkgu+6PEC0as3kT7u/
	 4PyQgVZKRxGEMw5CS9UtboCvyv13n/uKHcA4rc9Q8L1715HDY9aw31OMg5acPL7lsM
	 zZTro/tzNVfrDc8l4cEch0UcbyNbHXlA83CXN0Q+5g/VeM7NxAsfrheW/WXdZbuqsB
	 ujvrThYUsKoItz2EUQ7oFFxBdZ37CGnJKyeizGW/iJ7ZZQe9Smf/Deva780oQMM8DD
	 3AUXAe/JEKV7zWgK34MD/nxdGg/LHs5CwgPMXx2QA0Q3PBgi+5EOkFWMlvT+016VNV
	 md1Ldxrlme7Zg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso4027265e87.3
        for <llvm@lists.linux.dev>; Sun, 07 Dec 2025 08:41:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBBig4b9J87Ef/CIuCCwGZzjmteedoUUdV/tFoAfoqdzN7Rzjkok7ZkphhqlObJK+vsxSn@lists.linux.dev
X-Gm-Message-State: AOJu0Yylwo/B2qfEZdEtuTODgtEs0NSiWBLSEuuIOISRoUvNlHDTadd6
	uwPu9VkQrsknqGOQje22P2kA+aDRs0iHK1l1uUsRE1TkWCCjlg4XlfbpRP8wHhPlxYDdVF5KIPI
	6Da+nFmBgN//+EUWIZh/7Ub7XYkIuYa4=
X-Google-Smtp-Source: AGHT+IERW5kozrhRzKdtKVZvlS+Xsgj6/JKxC5zsFMhdyCt1N+XKuwoO8mCsp5g7ImgH/flXQ/EzYexQY4SGIIIoD+U=
X-Received: by 2002:a05:6512:12c8:b0:595:90f9:b9c2 with SMTP id
 2adb3069b0e04-5987437987cmr1835532e87.4.1765125670672; Sun, 07 Dec 2025
 08:41:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
 <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
 <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
 <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com>
 <DEDHST3BOZVN.O39PP5JRRFTX@google.com> <CAMj1kXEsTrdEJRrv_+KVpOJpmEu7XbcpzXaz2e3d7QewbRnf5Q@mail.gmail.com>
 <DERNCQGNRITE.139O331ACPKZ9@google.com>
In-Reply-To: <DERNCQGNRITE.139O331ACPKZ9@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 7 Dec 2025 17:40:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGKe2KsLxaRKmQi75s54y0d9VC1QEFwGfB5zCY8tjjGVA@mail.gmail.com>
X-Gm-Features: AQt7F2p9rWYOfV-xWjd_Iwu2fOZ8F2VG8fxR8BtNzoxC3UGv29gWa36dqTOsrNw
Message-ID: <CAMj1kXGKe2KsLxaRKmQi75s54y0d9VC1QEFwGfB5zCY8tjjGVA@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Dec 2025 at 03:59, Brendan Jackman <jackmanb@google.com> wrote:
>
> On Thu Nov 20, 2025 at 3:47 PM UTC, Ard Biesheuvel wrote:
> > On Thu, 20 Nov 2025 at 12:41, Brendan Jackman <jackmanb@google.com> wro=
te:
> >>
> >> On Mon Nov 17, 2025 at 12:37 PM UTC, Brendan Jackman wrote:
> >> > On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wrote=
:
> >> >>
> >> >> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrot=
e:
> >> >> >
> >> >> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.co=
m> wrote:
> >> >> > >
> >> >> > > With Debian clang version 19.1.7 (3+build5) there are calls to
> >> >> > > kasan_check_write() from __sev_es_nmi_complete, which violates =
noinstr.
> >> >> > > Fix it by disabling GCOV for the noinstr object, as has been do=
ne for
> >> >> > > previous such instrumentation issues.
> >> >> > >
> >> >> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> >> >> > > ---
> >> >> > > Details:
> >> >> > >
> >> >> > >  - =E2=9D=AF=E2=9D=AF  clang --version
> >> >> > >    Debian clang version 19.1.7 (3+build5)
> >> >> > >    Target: x86_64-pc-linux-gnu
> >> >> > >    Thread model: posix
> >> >> > >    InstalledDir: /usr/lib/llvm-19/bin
> >> >> > >
> >> >> > >  - Compiling from tip/master at 6f85aad74a70d
> >> >> > >
> >> >> > >  - Kernel config:
> >> >> > >
> >> >> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e=
18657174f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
> >> >> > >
> >> >> > > Note I also get this error:
> >> >> > >
> >> >> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation=
 to !ENDBR: machine_kexec_prepare+0x810
> >> >> > >
> >> >> > > That one's a total mystery to me. I guess it's better to "fix" =
the SEV
> >> >> > > one independently rather than waiting until I know how to fix t=
hem both.
> >> >> > > ---
> >> >> > >  arch/x86/coco/sev/Makefile | 3 +++
> >> >> > >  1 file changed, 3 insertions(+)
> >> >> > >
> >> >> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Mak=
efile
> >> >> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b=
2fb17209a7426e7893dea988c 100644
> >> >> > > --- a/arch/x86/coco/sev/Makefile
> >> >> > > +++ b/arch/x86/coco/sev/Makefile
> >> >> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
> >> >> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsan =
when inlining
> >> >> > >  KASAN_SANITIZE_noinstr.o       :=3D n
> >> >> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
> >> >> > > +
> >> >> > > +# Clang 19 and older may fail to respect __no_sanitize_address=
 when inlining
> >> >> > > +GCOV_PROFILE_noinstr.o         :=3D n
> >> >> > >
> >> >> >
> >> >> > After Thomas dug into this issue a while ago, I meant to follow u=
p
> >> >> > with a fix, or at least something to start the discussion.
> >> >> >
> >> >> > TL;DR there is nothing wrong with either compiler (as far as this
> >> >> > issue is concerned)
> >> >> >
> >> >> > The issue is that KASAN/KCSAN enabled builds use a version of
> >> >> > set_bit() that unconditionally inserts a call to
> >> >>
> >> >> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
> >> >> directly, and these are usually only called by compiler generated
> >> >> code.
> >> >>
> >> >> This completely defeats the noinstr per-function annotation, given
> >> >> that each compilation unit only incorporates a single version of
> >> >> set_bit(), which is the instrumented version unless instrumentation=
 is
> >> >> disabled for the entire file.
> >> >>
> >> >> For the short term, we could avoid this by using arch___set_bit()
> >> >> directly in the SEV code that triggers this issue today. But for th=
e
> >> >> longer term, we should get write of those explicit calls to
> >> >> instrumentation intrinsics, as this is fundamentally incompatible w=
ith
> >> >> per-function overrides.
> >> >>
> >> >> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
> >> >
> >> > Ah, yes thank you I think you are right. My GCOV "fix" seems to be
> >> > bogus, it probably just hides the issue with incidental changes.
> >>
> >> On the other hand, I guess the intermediate workaround of just disabli=
ng
> >> it at the compilation unit still makes sense here, right?
> >>
> >> i.e. my patch is still dumb but should we start by just doing
> >> K{A,C}ASAN_SANITIZE_noinstr.o :=3D n instead?
> >
> > Disabling per file results in the non-instrumented header to be
> > #include'd, and so we never call the instrument_read/write explicitly.
> > So yes, this is a reasonable short-term fix.
>
> Oh, and we've actually already got K{A,C}SAN_SANITIZE_noinstr.o :=3D n.
>
> Ah, I see what's going on here: gcov is injecting instrumentation
> into kasan_check_write(), which causes it to get out-of-lined even
> though it's just `return true`:
>
>
>         =E2=9D=AF=E2=9D=AF  objdump --disassemble=3Dkasan_check_write ./a=
rch/x86/coco/sev/noinstr.o
>
>         ./arch/x86/coco/sev/noinstr.o:     file format elf64-x86-64
>
>
>         Disassembly of section .text:
>
>         0000000000000010 <kasan_check_write>:
>           10:   48 ff 05 00 00 00 00    incq   0x0(%rip)        # 17 <kas=
an_check_write+0x7>
>           17:   2e e9 00 00 00 00       cs jmp 1d <kasan_check_write+0xd>
>
>         Disassembly of section .noinstr.text:
>
>
> It's the same thing going on with these ones:
>
>         vmlinux.o: warning: objtool: do_syscall_64+0x2c3: call to unwind_=
reset_info() leaves .noinstr.text section
>         vmlinux.o: warning: objtool: do_int80_emulation+0x311: call to un=
wind_reset_info() leaves .noinstr.text section
>         vmlinux.o: warning: objtool: fred_int80_emulation+0x2df: call to =
unwind_reset_info() leaves .noinstr.text section
>         vmlinux.o: warning: objtool: __do_fast_syscall_32+0x22a: call to =
unwind_reset_info() leaves .noinstr.text section
>         vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0xc4: cal=
l to unwind_reset_info() leaves .noinstr.text section
>
>
>
> Obvious fix is that we start writing __always_inline even for the stub
> functions. Seems a bit yucky but I guess it's technically the only
> correct thing to do?
>

Either that or a macro. But I think it is always reasonable to replace
inline with __always_inline if there are cases where the compiler
ignores it, and this results in build issues.
