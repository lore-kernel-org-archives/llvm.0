Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D832A3FE
	for <llvm@lists.linux.dev>; Mon,  8 Dec 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186438; cv=none; b=pXJ5jh1FEkBbRDegYIYqdGKDY2Q+OfK2r7Jw0XkYG1u9aP1PpgsNWNdi7OAJXq5El9c79zm18jOq+NPfqGjbWFROHD7tYjTIhUppmNqoEY2YaoYT3Vz0dw9s/y/7kokkuOyt6IiY0567e7zALBOmA+eAyQcZ6ouqu3zlVhFRtSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186438; c=relaxed/simple;
	bh=6Fp9DHvfWFw1hVmA7HMT41W3dgUMqaNhGk0bkyyVug0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgyLtYyR5tU0dWEt3EzRSZIyz94Y573ATup3FfEuNyG2ryWR1zMGzt8xAS0pY/jf01vpfPH8Cpr8QRRqX30LSTGCXjmqeCg3qncvURNgV6/xjmrEjbEeFJleHlRmsubg0PWn4LdcKD9uUCvFYE700N0w4jm67isnILO8CX8stn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJq8XJAS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJq8XJAS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso4652946b3a.3
        for <llvm@lists.linux.dev>; Mon, 08 Dec 2025 01:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765186436; x=1765791236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoUkMcJt7XMmxGcr0no1z3uyG3yw+Icn5YBWukzt/qo=;
        b=gJq8XJAStZvAt5dOqldibigkUiG5j+TU3Y5dmmFf4fRBeE+RlWEWBX1BZp5yLE47QL
         5/UTxiEUQnNNBSGbdybO2ucDsL6FHM/Fj6P3AfpBzmtU+92Yc6RjwBk34MrC05tU0rwN
         2J1JEj0CWiu2bbgl2p5PeJPZvBama/hrsBzjDebpui2hoIPFKsC3CFUQoFjJnzQhMQSc
         gEYinF8JbsPfJeOs0R95YzRXgaBsMuFslB1HzjrziuZo0NehEI2DAcbsbSRckQZWY7k3
         B6HtMcVS/Y+y0Kh87wcMgYgugSWkoiC2M/p7CG7CB4AtI9tAY/ZtYCgV0TulNuw7623a
         UAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765186436; x=1765791236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoUkMcJt7XMmxGcr0no1z3uyG3yw+Icn5YBWukzt/qo=;
        b=MGIC5eIUMYqqoCtoy1kUye8cgTd78l86HPXMlDPBZL5laS1DYq8Ir0y2GwtGhikPa2
         k7fEYqOtiAueVj7r1RZusXIDbRG9E880KPw5sWFglIFHhZudCKW7/sSTx3wxTnR203Je
         I7zp6zIr64CF2nSaDwUskXR6AjkhpyYoP9neSvdgvFS71dGbo2j38J7kptBS8KDQ42Gg
         C0q4Nc1PSkprXSXuUI3VV3n7gXSPQpQgEZQjSRgZ5AuW4JzxBzc8Tzo2nynK4jZ6duiA
         yv4mSTlaWvqptjkS7LymFnKYmi0JMI5shop7u4uEvpQSwd7oWigMn7w/mSnu3Nns/AbJ
         KFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiYo7VtsDKmk73ncImzkdD9vP/keCxL0cvsG1PeCZZ4BtwjcuftBMStTkqZoNYKc+xVH4b@lists.linux.dev
X-Gm-Message-State: AOJu0YzhrRZjTzpw8pYY7kVNlULMYXsCnxbjvF99DeymMuz+wSHWM17m
	KfeXlMFJGxVmw5v1FFf7r2sc2A00WXWfdCch+BJgOIqm+YEwHsNRLVY9WkgYgrkvtsO9eWCCOun
	nlCjVz4n9YrmaoO51N4Bx1qW4X+Whu31zCgdEvC1x
X-Gm-Gg: ASbGncvSobalSeDccI+RkvrF2Y3YoDa7qSCK02aNvzZGl+0g9fHPbde2EtRyDxtTtX3
	tSmHdGFhnt3gEpp/kRL5WAEe1ZTzCtJWCjlo9ogXtoe0FjkT7JKRhKLH7+UZGQbFpScWinWhAq5
	ulfxgiitNuR8aBMJ4kLtoh0u1Vyy9g+5gUD9Sikq5K1+13Y5aWvOj7z5hKqJIiC7MKS412+kvxA
	31TxeqYD9Q1Pj/XapxGy5DAmNZ++e5JvM0UMI5W0GwFENreaFzPxoBVH49ueYrvrk+mayNkycvq
	ZuWbtLC6eq/IWGkGRsA3VbEdXQ==
X-Google-Smtp-Source: AGHT+IFlCU7huTc4epnVP1xUlAzaOHC2uWnzbX5aN4OKp6SbLRv2gV1S0rsTwIuyh7oK9FWd6Q9kvDbrZALKcv7cv7Q=
X-Received: by 2002:a05:7022:24a4:b0:119:e569:fb9b with SMTP id
 a92af1059eb24-11e031662c8mr4593147c88.10.1765186435695; Mon, 08 Dec 2025
 01:33:55 -0800 (PST)
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
 <DERNCQGNRITE.139O331ACPKZ9@google.com> <CAMj1kXGKe2KsLxaRKmQi75s54y0d9VC1QEFwGfB5zCY8tjjGVA@mail.gmail.com>
In-Reply-To: <CAMj1kXGKe2KsLxaRKmQi75s54y0d9VC1QEFwGfB5zCY8tjjGVA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 8 Dec 2025 10:33:19 +0100
X-Gm-Features: AQt7F2qe4Mdu0eBw7jai-EhrVT5UGm82XKM4ODAjHrt8xn3V_pwgG9PVc-_V0gw
Message-ID: <CANpmjNNq1zQ2Lb+mUKHmiOdydE2VjhAVX_GE2G1MjMR_XqgCNQ@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Dec 2025 at 17:41, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sun, 7 Dec 2025 at 03:59, Brendan Jackman <jackmanb@google.com> wrote:
> >
> > On Thu Nov 20, 2025 at 3:47 PM UTC, Ard Biesheuvel wrote:
> > > On Thu, 20 Nov 2025 at 12:41, Brendan Jackman <jackmanb@google.com> w=
rote:
> > >>
> > >> On Mon Nov 17, 2025 at 12:37 PM UTC, Brendan Jackman wrote:
> > >> > On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wro=
te:
> > >> >>
> > >> >> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> > >> >> >
> > >> >> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.=
com> wrote:
> > >> >> > >
> > >> >> > > With Debian clang version 19.1.7 (3+build5) there are calls t=
o
> > >> >> > > kasan_check_write() from __sev_es_nmi_complete, which violate=
s noinstr.
> > >> >> > > Fix it by disabling GCOV for the noinstr object, as has been =
done for
> > >> >> > > previous such instrumentation issues.
> > >> >> > >
> > >> >> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > >> >> > > ---
> > >> >> > > Details:
> > >> >> > >
> > >> >> > >  - =E2=9D=AF=E2=9D=AF  clang --version
> > >> >> > >    Debian clang version 19.1.7 (3+build5)
> > >> >> > >    Target: x86_64-pc-linux-gnu
> > >> >> > >    Thread model: posix
> > >> >> > >    InstalledDir: /usr/lib/llvm-19/bin
> > >> >> > >
> > >> >> > >  - Compiling from tip/master at 6f85aad74a70d
> > >> >> > >
> > >> >> > >  - Kernel config:
> > >> >> > >
> > >> >> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd=
0e18657174f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.t=
xt
> > >> >> > >
> > >> >> > > Note I also get this error:
> > >> >> > >
> > >> >> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocati=
on to !ENDBR: machine_kexec_prepare+0x810
> > >> >> > >
> > >> >> > > That one's a total mystery to me. I guess it's better to "fix=
" the SEV
> > >> >> > > one independently rather than waiting until I know how to fix=
 them both.
> > >> >> > > ---
> > >> >> > >  arch/x86/coco/sev/Makefile | 3 +++
> > >> >> > >  1 file changed, 3 insertions(+)
> > >> >> > >
> > >> >> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/M=
akefile
> > >> >> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c3=
0b2fb17209a7426e7893dea988c 100644
> > >> >> > > --- a/arch/x86/coco/sev/Makefile
> > >> >> > > +++ b/arch/x86/coco/sev/Makefile
> > >> >> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
> > >> >> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsa=
n when inlining
> > >> >> > >  KASAN_SANITIZE_noinstr.o       :=3D n
> > >> >> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
> > >> >> > > +
> > >> >> > > +# Clang 19 and older may fail to respect __no_sanitize_addre=
ss when inlining
> > >> >> > > +GCOV_PROFILE_noinstr.o         :=3D n
> > >> >> > >
> > >> >> >
> > >> >> > After Thomas dug into this issue a while ago, I meant to follow=
 up
> > >> >> > with a fix, or at least something to start the discussion.
> > >> >> >
> > >> >> > TL;DR there is nothing wrong with either compiler (as far as th=
is
> > >> >> > issue is concerned)
> > >> >> >
> > >> >> > The issue is that KASAN/KCSAN enabled builds use a version of
> > >> >> > set_bit() that unconditionally inserts a call to
> > >> >>
> > >> >> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
> > >> >> directly, and these are usually only called by compiler generated
> > >> >> code.
> > >> >>
> > >> >> This completely defeats the noinstr per-function annotation, give=
n
> > >> >> that each compilation unit only incorporates a single version of
> > >> >> set_bit(), which is the instrumented version unless instrumentati=
on is
> > >> >> disabled for the entire file.
> > >> >>
> > >> >> For the short term, we could avoid this by using arch___set_bit()
> > >> >> directly in the SEV code that triggers this issue today. But for =
the
> > >> >> longer term, we should get write of those explicit calls to
> > >> >> instrumentation intrinsics, as this is fundamentally incompatible=
 with
> > >> >> per-function overrides.
> > >> >>
> > >> >> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
> > >> >
> > >> > Ah, yes thank you I think you are right. My GCOV "fix" seems to be
> > >> > bogus, it probably just hides the issue with incidental changes.
> > >>
> > >> On the other hand, I guess the intermediate workaround of just disab=
ling
> > >> it at the compilation unit still makes sense here, right?
> > >>
> > >> i.e. my patch is still dumb but should we start by just doing
> > >> K{A,C}ASAN_SANITIZE_noinstr.o :=3D n instead?
> > >
> > > Disabling per file results in the non-instrumented header to be
> > > #include'd, and so we never call the instrument_read/write explicitly=
.
> > > So yes, this is a reasonable short-term fix.
> >
> > Oh, and we've actually already got K{A,C}SAN_SANITIZE_noinstr.o :=3D n.
> >
> > Ah, I see what's going on here: gcov is injecting instrumentation
> > into kasan_check_write(), which causes it to get out-of-lined even
> > though it's just `return true`:
> >
> >
> >         =E2=9D=AF=E2=9D=AF  objdump --disassemble=3Dkasan_check_write .=
/arch/x86/coco/sev/noinstr.o
> >
> >         ./arch/x86/coco/sev/noinstr.o:     file format elf64-x86-64
> >
> >
> >         Disassembly of section .text:
> >
> >         0000000000000010 <kasan_check_write>:
> >           10:   48 ff 05 00 00 00 00    incq   0x0(%rip)        # 17 <k=
asan_check_write+0x7>
> >           17:   2e e9 00 00 00 00       cs jmp 1d <kasan_check_write+0x=
d>
> >
> >         Disassembly of section .noinstr.text:
> >
> >
> > It's the same thing going on with these ones:
> >
> >         vmlinux.o: warning: objtool: do_syscall_64+0x2c3: call to unwin=
d_reset_info() leaves .noinstr.text section
> >         vmlinux.o: warning: objtool: do_int80_emulation+0x311: call to =
unwind_reset_info() leaves .noinstr.text section
> >         vmlinux.o: warning: objtool: fred_int80_emulation+0x2df: call t=
o unwind_reset_info() leaves .noinstr.text section
> >         vmlinux.o: warning: objtool: __do_fast_syscall_32+0x22a: call t=
o unwind_reset_info() leaves .noinstr.text section
> >         vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0xc4: c=
all to unwind_reset_info() leaves .noinstr.text section
> >
> >
> >
> > Obvious fix is that we start writing __always_inline even for the stub
> > functions. Seems a bit yucky but I guess it's technically the only
> > correct thing to do?
> >
>
> Either that or a macro. But I think it is always reasonable to replace
> inline with __always_inline if there are cases where the compiler
> ignores it, and this results in build issues.

Why do we need GCOV instrumentation for noinstr.c? Why not just:

GCOV_PROFILE_noinstr.o :=3D n

?
