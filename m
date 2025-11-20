Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68020274670
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653640; cv=none; b=JX6KWaa5tDBrBE5mfVh47wAtJ4Q7tJQiHIYVbX0tYx/5G6I9VVcvXlVn52ye7vwhSQkWvn9aDdEVJ1Y4Kyu7DctRkeSq7dPrALp0DZiYR7IKx8pe/3lxhRFEptD4ZJGErbS2HTtTJJ47j3FoGbzjPjRLBGC6JFYVe9DfV31sMxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653640; c=relaxed/simple;
	bh=fye3AZuoM3MY1Tz4HAOVHOUHFM3gKLLTxRseoQbW+N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1cvYwZNQtdWCwDb39rwwNaUmejTN2M9Vj9eJw2APPPEyxfU8yKIebWmILkiWQoEK7aje5QfKTtbNF9h1iA62ZfaNymOGkqtcs8U1r0plx3eUYmP6trcWP6Eo5hyHdnHIbghhS5p1JatMKl4cIEmZxJb7/scgdmpO3IJGczrsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YottEY93; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YottEY93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EC0C19423
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653640;
	bh=fye3AZuoM3MY1Tz4HAOVHOUHFM3gKLLTxRseoQbW+N0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YottEY93Je4nZAgnNlo0w9GKUwDIPTailYenlS+H7PYphbe5I28PpmhSvKxeRR3LL
	 SM25kuRroSMx2BoKZyJ76Nlxnt+/+hEBlGbwtRzbtMoV5Oxiqp2hGU4U+GWtog2Ayl
	 iCqDd6kccZWSh5QihkyJZdCNWlJ7gVnd4oIMrpGrlk9tCTCEhaYvSXvwKepzQJShCr
	 qV8y0iCyXWfyzuh5nS2lDVz5iYNGYsqRkRBy6uIp1Hy2ocFkzQ5Hf96GHhJ8G7EdAd
	 d7xmIz7pNEZ29gD7Xci0H6aiQ4hKoctsb/LU2bz97rWV2KuqdMDMcNp/FvgfgoKY54
	 h2uMh5Krdk/7A==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a3d86b773so9063601fa.0
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:47:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzj+SVR7+9hy+z/GgbGzaNVPxvwzH00RFSWhAC2WVpulaeyG7V6xnFyShzQlW3azQaV9Jg@lists.linux.dev
X-Gm-Message-State: AOJu0YzsdYa0fadVJ/LgYepnZblmWWKduY7m/ApYNAWh4SCf4nPbAP1S
	DWx0bDrmNYE5RuWOhvekdN7HHiVyRMIj2ckeBPE8wpbrXDeC06xxGAEQQdbcJoLpx3z7IjsMSH2
	kFp/6ocZLN8h+dt82ucG1Xcf/9vEZAIg=
X-Google-Smtp-Source: AGHT+IFLwwadZwuu2sPQ3ZiG1Mo0cAQBZuxvMu/HZu78XoA8ljwI7xU83U207bJ6EewOofYSGLspUI7OdFJXxN9iTxI=
X-Received: by 2002:a2e:b742:0:b0:37a:4736:83b6 with SMTP id
 38308e7fff4ca-37cc67bd5dfmr8940411fa.44.1763653638309; Thu, 20 Nov 2025
 07:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
 <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
 <CAMj1kXHiA91hH80tHFCO9QjkkfzEGZ2GJgpHnuKrusKhOULMXA@mail.gmail.com>
 <CA+i-1C2-DtH326ppTx6V_yJ3HX-H0b5i9GNnXb0Q5mUF-Kexdg@mail.gmail.com> <DEDHST3BOZVN.O39PP5JRRFTX@google.com>
In-Reply-To: <DEDHST3BOZVN.O39PP5JRRFTX@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Nov 2025 16:47:07 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEsTrdEJRrv_+KVpOJpmEu7XbcpzXaz2e3d7QewbRnf5Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnsXV7h-FlZPTiKx7cfTLo3Txj-MtHaniNIQCfOpylZtSs3x9sbpoza13Q
Message-ID: <CAMj1kXEsTrdEJRrv_+KVpOJpmEu7XbcpzXaz2e3d7QewbRnf5Q@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2025 at 12:41, Brendan Jackman <jackmanb@google.com> wrote:
>
> On Mon Nov 17, 2025 at 12:37 PM UTC, Brendan Jackman wrote:
> > On Mon, 17 Nov 2025 at 12:52, Ard Biesheuvel <ardb@kernel.org> wrote:
> >>
> >> On Mon, 17 Nov 2025 at 12:40, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >
> >> > On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com> =
wrote:
> >> > >
> >> > > With Debian clang version 19.1.7 (3+build5) there are calls to
> >> > > kasan_check_write() from __sev_es_nmi_complete, which violates noi=
nstr.
> >> > > Fix it by disabling GCOV for the noinstr object, as has been done =
for
> >> > > previous such instrumentation issues.
> >> > >
> >> > > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> >> > > ---
> >> > > Details:
> >> > >
> >> > >  - =E2=9D=AF=E2=9D=AF  clang --version
> >> > >    Debian clang version 19.1.7 (3+build5)
> >> > >    Target: x86_64-pc-linux-gnu
> >> > >    Thread model: posix
> >> > >    InstalledDir: /usr/lib/llvm-19/bin
> >> > >
> >> > >  - Compiling from tip/master at 6f85aad74a70d
> >> > >
> >> > >  - Kernel config:
> >> > >
> >> > >    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e186=
57174f0537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
> >> > >
> >> > > Note I also get this error:
> >> > >
> >> > > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to=
 !ENDBR: machine_kexec_prepare+0x810
> >> > >
> >> > > That one's a total mystery to me. I guess it's better to "fix" the=
 SEV
> >> > > one independently rather than waiting until I know how to fix them=
 both.
> >> > > ---
> >> > >  arch/x86/coco/sev/Makefile | 3 +++
> >> > >  1 file changed, 3 insertions(+)
> >> > >
> >> > > diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefi=
le
> >> > > index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb=
17209a7426e7893dea988c 100644
> >> > > --- a/arch/x86/coco/sev/Makefile
> >> > > +++ b/arch/x86/coco/sev/Makefile
> >> > > @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
> >> > >  # GCC may fail to respect __no_sanitize_address or __no_kcsan whe=
n inlining
> >> > >  KASAN_SANITIZE_noinstr.o       :=3D n
> >> > >  KCSAN_SANITIZE_noinstr.o       :=3D n
> >> > > +
> >> > > +# Clang 19 and older may fail to respect __no_sanitize_address wh=
en inlining
> >> > > +GCOV_PROFILE_noinstr.o         :=3D n
> >> > >
> >> >
> >> > After Thomas dug into this issue a while ago, I meant to follow up
> >> > with a fix, or at least something to start the discussion.
> >> >
> >> > TL;DR there is nothing wrong with either compiler (as far as this
> >> > issue is concerned)
> >> >
> >> > The issue is that KASAN/KCSAN enabled builds use a version of
> >> > set_bit() that unconditionally inserts a call to
> >>
> >> instrument_atomic_write(), which calls the KASAN/KCSAN intrinsics
> >> directly, and these are usually only called by compiler generated
> >> code.
> >>
> >> This completely defeats the noinstr per-function annotation, given
> >> that each compilation unit only incorporates a single version of
> >> set_bit(), which is the instrumented version unless instrumentation is
> >> disabled for the entire file.
> >>
> >> For the short term, we could avoid this by using arch___set_bit()
> >> directly in the SEV code that triggers this issue today. But for the
> >> longer term, we should get write of those explicit calls to
> >> instrumentation intrinsics, as this is fundamentally incompatible with
> >> per-function overrides.
> >>
> >> https://lore.kernel.org/all/8734aqulch.ffs@tglx/T/#u
> >
> > Ah, yes thank you I think you are right. My GCOV "fix" seems to be
> > bogus, it probably just hides the issue with incidental changes.
>
> On the other hand, I guess the intermediate workaround of just disabling
> it at the compilation unit still makes sense here, right?
>
> i.e. my patch is still dumb but should we start by just doing
> K{A,C}ASAN_SANITIZE_noinstr.o :=3D n instead?

Disabling per file results in the non-instrumented header to be
#include'd, and so we never call the instrument_read/write explicitly.
So yes, this is a reasonable short-term fix.
