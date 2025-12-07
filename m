Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE223EA81
	for <llvm@lists.linux.dev>; Sun,  7 Dec 2025 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765076376; cv=none; b=Lsml3UcZAdzS3xfaHo0ZJhOahAERf7qOD+hx4fNmCefL1dpTi9oWrcooM7tOsuCKUbR6Tn1VZ1STS9F19AeT32mxc62mE4B+xh3vnObrq4vOdRbkNCGVhCkVXYFXkuUba0Nt/cxJyiA15CYwv6nq7OWS9qRxQuFcQh+8cbUMDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765076376; c=relaxed/simple;
	bh=WKSbxzvyOJ0Vrhv9aviMc9oJ3OAFxq4oT1z11kAxJPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rxy0jKjX/opQf6s8Q/zWv7k+R9RjV+RCwsUDJ7OwnuXKU0GKALBQBjsF45bfPkTpieTxEhFSNZAjT/zXIqrfisQXC9h4d3ii7sQnHmlBzbqii3O349SXZnScWA7T9kurk3bjgBvc1rn7EhBnsndGQuGKRatniHa+6UQ3z6ksBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Fg5lyjp; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Fg5lyjp"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7178ad1a7dso320588266b.1
        for <llvm@lists.linux.dev>; Sat, 06 Dec 2025 18:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765076371; x=1765681171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj77kvtlysu8PUSmNWBOwt4U/mPATRraEcFltUxGztc=;
        b=1Fg5lyjpBEjJfuDLF3/h6R3hMG1qjAOV8d2nFgNY3r3UXYDA/keejwT73BaclAb9JK
         ZYQw6qrDJJZTn8qRqSi3+PDIXFiiBK34CeCs3G9kbs0hnTdyUtpJsUG84z4YGVw4ctXt
         DNK3A7GbJh7kOwLwkm6/Jtlwvs3Jb6g/niZgAFfcjkQLOJ+cEWVgZYvTS0/Kur60IVQT
         4TD8zSnPdF+ylpaS4bjjTF28vg1ubRThPsQXr2HOiDMjFuKyUiiPQKORs0auzebLUKlO
         qvJXvS+U5v2aBKITayLDjb9kPPJHW5W70xDh6Sx5fP6rieYpj5MWFbWANnn7pUa02VTD
         opZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765076371; x=1765681171;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kj77kvtlysu8PUSmNWBOwt4U/mPATRraEcFltUxGztc=;
        b=bCVonxiIDwmykS5swHo517DWo7sFDnuI+NM3G0YcGcqHjPZ/zRKw9HM14/G79S4izC
         ukBrbMVsu4KyrLendItAEjfCgLojbjZ11sNhy1c2ThLoq3CPioLNRNFwm+u0cMytGgiw
         hvgvfaadnygvm65zwwLxTU83Pl62XbqySyPHtZ/H7fHLVLhyf0bhJHcu/jOpuh2JHt3r
         Yqlv0+ewMJkYzIR59cY6kU1B7AnF/k4JRIXb8mu4GsvpiNw8gYmBLMU1j6v8jwWbnOCh
         82BI5i1knJ+lgi3XKSdlL2Gyk2lWfLQOkDrm/PwajdoScISv4XKmNf5d3b2a3E0eqBVm
         xfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy1UFvXW2dAd2+TTLBXIVuXzW6LMsv/TauyzMIDfQLSWS7Dmt3Dbk6Sng7sES0fLHbRsK0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5mm8lVqegWdOaYEfLDlqhcYWgwNh6zlAmLNLqqfExKxh6VExy
	4hxkgRI3CqtiAtZaTfZGjR09I2AN0pyX6VGBZwFDp0IV3IPQC1V97AibvjHNLXaY8+KK5/VE8XZ
	8HuwKodDzqsOYJA==
X-Google-Smtp-Source: AGHT+IGCUxZLiRh7XJ403y2oTPdiFcA7xrYcGx+P53TWpJVKcwoyemVBpmUHHQ3i1ubIvj3dsZG+OPn7XkstrQ==
X-Received: from edh25.prod.google.com ([2002:a05:6402:5059:b0:647:9c15:ab41])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ea8:b0:b76:379c:c3f2 with SMTP id a640c23a62f3a-b7a242cfbbamr348350266b.1.1765076371090;
 Sat, 06 Dec 2025 18:59:31 -0800 (PST)
Date: Sun, 07 Dec 2025 02:59:30 +0000
In-Reply-To: <CAMj1kXEsTrdEJRrv_+KVpOJpmEu7XbcpzXaz2e3d7QewbRnf5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
 <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
 <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
 <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com>
 <DEDHST3BOZVN.O39PP5JRRFTX@google.com> <CAMj1kXEsTrdEJRrv_+KVpOJpmEu7XbcpzXaz2e3d7QewbRnf5Q@mail.gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DERNCQGNRITE.139O331ACPKZ9@google.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
From: Brendan Jackman <jackmanb@google.com>
To: Ard Biesheuvel <ardb@kernel.org>, Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, <linux-kernel@vger.kernel.org>, 
	<llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu Nov 20, 2025 at 3:47 PM UTC, Ard Biesheuvel wrote:
> On Thu, 20 Nov 2025 at 12:41, Brendan Jackman <jackmanb@google.com> wrote=
:
>>
>> On Mon Nov 17, 2025 at 12:37 PM UTC, Brendan Jackman wrote:
>> > On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >>
>> >> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >> >
>> >> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com>=
 wrote:
>> >> > >
>> >> > > With Debian clang version 19.1.7 (3+build5) there are calls to
>> >> > > kasan_check_write() from __sev_es_nmi_complete, which violates no=
instr.
>> >> > > Fix it by disabling GCOV for the noinstr object, as has been done=
 for
>> >> > > previous such instrumentation issues.
>> >> > >
>> >> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
>> >> > > ---
>> >> > > Details:
>> >> > >
>> >> > >  - =E2=9D=AF=E2=9D=AF  clang --version
>> >> > >    Debian clang version 19.1.7 (3+build5)
>> >> > >    Target: x86_64-pc-linux-gnu
>> >> > >    Thread model: posix
>> >> > >    InstalledDir: /usr/lib/llvm-19/bin
>> >> > >
>> >> > >  - Compiling from tip/master at 6f85aad74a70d
>> >> > >
>> >> > >  - Kernel config:
>> >> > >
>> >> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18=
657174f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
>> >> > >
>> >> > > Note I also get this error:
>> >> > >
>> >> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation t=
o !ENDBR: machine_kexec_prepare+0x810
>> >> > >
>> >> > > That one's a total mystery to me. I guess it's better to "fix" th=
e SEV
>> >> > > one independently rather than waiting until I know how to fix the=
m both.
>> >> > > ---
>> >> > >  arch/x86/coco/sev/Makefile | 3 +++
>> >> > >  1 file changed, 3 insertions(+)
>> >> > >
>> >> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makef=
ile
>> >> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2f=
b17209a7426e7893dea988c 100644
>> >> > > --- a/arch/x86/coco/sev/Makefile
>> >> > > +++ b/arch/x86/coco/sev/Makefile
>> >> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
>> >> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsan wh=
en inlining
>> >> > >  KASAN_SANITIZE_noinstr.o       :=3D n
>> >> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
>> >> > > +
>> >> > > +# Clang 19 and older may fail to respect __no_sanitize_address w=
hen inlining
>> >> > > +GCOV_PROFILE_noinstr.o         :=3D n
>> >> > >
>> >> >
>> >> > After Thomas dug into this issue a while ago, I meant to follow up
>> >> > with a fix, or at least something to start the discussion.
>> >> >
>> >> > TL;DR there is nothing wrong with either compiler (as far as this
>> >> > issue is concerned)
>> >> >
>> >> > The issue is that KASAN/KCSAN enabled builds use a version of
>> >> > set_bit() that unconditionally inserts a call to
>> >>
>> >> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
>> >> directly, and these are usually only called by compiler generated
>> >> code.
>> >>
>> >> This completely defeats the noinstr per-function annotation, given
>> >> that each compilation unit only incorporates a single version of
>> >> set_bit(), which is the instrumented version unless instrumentation i=
s
>> >> disabled for the entire file.
>> >>
>> >> For the short term, we could avoid this by using arch___set_bit()
>> >> directly in the SEV code that triggers this issue today. But for the
>> >> longer term, we should get write of those explicit calls to
>> >> instrumentation intrinsics, as this is fundamentally incompatible wit=
h
>> >> per-function overrides.
>> >>
>> >> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
>> >
>> > Ah, yes thank you I think you are right. My GCOV "fix" seems to be
>> > bogus, it probably just hides the issue with incidental changes.
>>
>> On the other hand, I guess the intermediate workaround of just disabling
>> it at the compilation unit still makes sense here, right?
>>
>> i.e. my patch is still dumb but should we start by just doing
>> K{A,C}ASAN_SANITIZE_noinstr.o :=3D n instead?
>
> Disabling per file results in the non-instrumented header to be
> #include'd, and so we never call the instrument_read/write explicitly.
> So yes, this is a reasonable short-term fix.

Oh, and we've actually already got K{A,C}SAN_SANITIZE_noinstr.o :=3D n.

Ah, I see what's going on here: gcov is injecting instrumentation
into kasan_check_write(), which causes it to get out-of-lined even
though it's just `return true`:


	=E2=9D=AF=E2=9D=AF  objdump --disassemble=3Dkasan_check_write ./arch/x86/c=
oco/sev/noinstr.o

	./arch/x86/coco/sev/noinstr.o:     file format elf64-x86-64


	Disassembly of section .text:

	0000000000000010 <kasan_check_write>:
	  10:   48 ff 05 00 00 00 00    incq   0x0(%rip)        # 17 <kasan_check_=
write+0x7>
	  17:   2e e9 00 00 00 00       cs jmp 1d <kasan_check_write+0xd>

	Disassembly of section .noinstr.text:


It's the same thing going on with these ones:

	vmlinux.o: warning: objtool: do_syscall_64+0x2c3: call to unwind_reset_inf=
o() leaves .noinstr.text section
	vmlinux.o: warning: objtool: do_int80_emulation+0x311: call to unwind_rese=
t_info() leaves .noinstr.text section
	vmlinux.o: warning: objtool: fred_int80_emulation+0x2df: call to unwind_re=
set_info() leaves .noinstr.text section
	vmlinux.o: warning: objtool: __do_fast_syscall_32+0x22a: call to unwind_re=
set_info() leaves .noinstr.text section
	vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0xc4: call to unwi=
nd_reset_info() leaves .noinstr.text section



Obvious fix is that we start writing __always_inline even for the stub
functions. Seems a bit yucky but I guess it's technically the only
correct thing to do?

Maybe there's a way to tell the compiler not to instrument empty
functions? I can't see one though.

