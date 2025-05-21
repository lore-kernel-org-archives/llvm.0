Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15425CC54
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846428; cv=none; b=fUTDJV171er7ZgDnZCwWpBCCGRqWA41mWG6Tko0QTGZLOp3PQOlD9I/OtJdBvRDY6wX1Q+Cu55Oi/m1sfij8y2ASI4zGHkAriDe06fjATkCTgsNwT6Z1qfDdaUHPtnOYKmWpYHSvirzBCYxe5E/24s7LtRH9gARxkMQ22bJEYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846428; c=relaxed/simple;
	bh=qHopfEyt81fEf/y8iQKjmcmiqXO3gugN6MkVzAFAIFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAaDOxU3Gx0vJ5wlnkrZ0JgsO2P7fH9oNc8oBRuRsJmDnlnnSbyKk0QmufEq3nfsDsBvPYi1+iKH9FbjShwgkVAvBHliHD2NaXfjqoJbQNpAfmcE27CdfBF0P1iedKPr5tX3hN8R4CvOtR2/H7wIiKYuWcaQy/MUhbaqZ+zGdsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TRq8hpoQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TRq8hpoQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so35634a12.0
        for <llvm@lists.linux.dev>; Wed, 21 May 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846423; x=1748451223; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt2BJWIq8eUeGltZpFipvyHVPXsIRm7HCk10rPc4uGk=;
        b=TRq8hpoQZnxgNGeeXPGR3dHWddR3hbtfnELPLNOvHc577GadrwCU5XkwfHrlbfvzlO
         WV9GcI04cy1mRIozgLLsuGNEdbFa8o9JTk8W0YEwZR/AS1eajH79JKto2GzEN99K3f7q
         6mjAzoItT55GRV0RZI02X61sy5PPpOhYnfUHD2tHAiPvqfg+jyeRseBmj5AoBwmASpPm
         tJoBqPk1Wg/X1xwmVzRelvUhglf8FxWe7Qt5W7tMk+4NPnSBBNIC3ce98XZgu/maGrAw
         djYeM9xtvhXQUG9FIEMkjt3kQCCd1GXElS/RdPO9msaoHSA9RPMsTwqZWyggMSlJw4u9
         DG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846423; x=1748451223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt2BJWIq8eUeGltZpFipvyHVPXsIRm7HCk10rPc4uGk=;
        b=dCosCk3w9etPY1VYvf4OTDwwsYF74fi4LTPHl2pOib+Z22rvH65ujRsv7KMQ5vSojX
         s1iKvkWv4k02oCmrCXBHUSSY0IfFM2w8bNV44Pb858STOIYVdcLGOchkjV8Oo+wxe/+H
         e8vOrZMErz0PSzo4pEZXfWmpHCG9X6bkDjivpK+Bd2fMWJoKq3xKES3/d8Ri89gCTJeQ
         QCS4W64wptQdDTsINdKNKfl5dTgQE1up1MoV12ARvRVRSDQswJjzIEnlfbgPqEe4l12e
         jn+zlLeRVj0Tb1Q5VzIQEnIhyBCzuVqbnIhndqmJPu1JKqtYByYWpQbgFCw5NdS5zNz8
         CPTw==
X-Forwarded-Encrypted: i=1; AJvYcCVqZ+CeRd9tz8aaR0VafvmXI3OaOi0ZAyMe+oz6d/sRZuWMlE5kNGmGnR9sIdt//CcMbsY7@lists.linux.dev
X-Gm-Message-State: AOJu0YzdV8d7xOlkXpur1+mb2IVQF3InMAkHjfFGv/aynO/tJlZwREhS
	UqfkgczhiO96ts9Gwl/Rel5lZ0+zu88C9ZTnGtvRPFvPRfdl0bABa+I31Zwfc/gaGOahooTImKK
	+IEYPb6H4rXnnYPf6Vv23GfTrpzbEQ0PrK+OJrYUO
X-Gm-Gg: ASbGncuiZz1vYZwUwb/gvO/k8mKLfnu4RtRDvEXUo5iSGIpkjSjCz9bXFg8d35qdp6D
	eAOPyiPUCbzXO68DLXG549psSMJowi2Kj3vtfKUqToEFO/iz/aJO3k4fqBBGOycBj1FowwOwiVK
	FzyfTRH7KPOlzrCcy1DrxLL1MvX0p4ckkiiO1cSJjE1See3c0mmg8f1oDWL6afHGwEsWAX44w9s
	g==
X-Google-Smtp-Source: AGHT+IEk1qK5pfCS9TiWiAJqcWHO+q4BDVFceePf5Pmj4GkZsf/xtSVgoYl2UGzFjXqYDQsYvRGQjsnQ0SmoCtpQU/I=
X-Received: by 2002:aa7:cfc9:0:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-60203bfcf5fmr309381a12.1.1747846423421; Wed, 21 May 2025
 09:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507205504.2017028-1-xur@google.com> <a2db22a3-6d66-481d-9432-b38b83e17183@cachyos.org>
 <CAF1bQ=Sh+N1ifCHK-15zeqt1tyzFtr-+nEJmSjEJOgfXgK9ufg@mail.gmail.com>
In-Reply-To: <CAF1bQ=Sh+N1ifCHK-15zeqt1tyzFtr-+nEJmSjEJOgfXgK9ufg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 21 May 2025 09:53:30 -0700
X-Gm-Features: AX0GCFseOE_jhX8D3KglAvvruKoN_xZx_2C0u0wtd6LAGK11cpGwHfJ0lJ57Nkg
Message-ID: <CAF1bQ=TQSQ75qCyQYegW7kq8WdyB-SNViraOuBvgGgAyUPS54Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: distributed build support for Clang ThinLTO
To: Eric Naim <dnaim@cachyos.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:40=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> On Mon, May 19, 2025 at 10:22=E2=80=AFPM Eric Naim <dnaim@cachyos.org> wr=
ote:
> >
> > Hi Rong Xu,
> >
> > On 5/8/25 04:55, xur@google.com wrote:
> > > From: Rong Xu <xur@google.com>
> > >
> > > Add distributed ThinLTO build support for the Linux kernel.
> > > This new mode offers several advantages: (1) Increased
> > > flexibility in handling user-specified build options.
> > > (2) Improved user-friendliness for developers. (3) Greater
> > > convenience for integrating with objtool and livepatch.
> > >
> > > Note that "distributed" in this context refers to a term
> > > that differentiates in-process ThinLTO builds by invoking
> > > backend compilation through the linker, not necessarily
> > > building in distributed environments.
> > >
> > > Distributed ThinLTO is enabled via the
> > > `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
> > >  > make LLVM=3D1 defconfig
> > >  > scripts/config -e LTO_CLANG_THIN_DIST
> > >  > make LLVM=3D1 oldconfig
> > >  > make LLVM=3D1 vmlinux -j <..>
> > >
> > > The implementation changes the top-level Makefile with a
> > > macro for generating `vmlinux.o` for distributed ThinLTO
> > > builds. It uses the existing Kbuild infrastructure to
> > > perform two recursive passes through the subdirectories.
> > > The first pass generates LLVM IR object files, similar to
> > > in-process ThinLTO. Following the thin-link stage, a second
> > > pass compiles these IR files into the final native object
> > > files. The build rules and actions for this two-pass process
> > > are primarily implemented in `scripts/Makefile.build`.
> > >
> > > Currently, this patch focuses on building the main kernel
> > > image (`vmlinux`) only. Support for building kernel modules
> > > using this method is planned for a subsequent patch.
> > >
> > > Tested on the following arch: x86, arm64, loongarch, and
> > > riscv.
> > >
> > > Some implementation details can be found here:
> > > https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel=
/85934
> > >
> > > Signed-off-by: Rong Xu <xur@google.com>
> > > ---
> > > Changelog since v1:
> > > - Updated the description in arch/Kconfig based on feedback
> > >   from Nathan Chancellor
> > > - Revised file suffixes: .final_o -> .o.thinlto.native, and
> > >   .final_a -> .a.thinlto.native
> > > - Updated list of ignored files in .gitignore
> > > ---
> > >  .gitignore                        |  2 ++
> > >  MAINTAINERS                       |  5 +++
> > >  Makefile                          | 40 ++++++++++++++++++++---
> > >  arch/Kconfig                      | 19 +++++++++++
> > >  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++--=
-
> > >  scripts/Makefile.lib              |  7 +++-
> > >  scripts/Makefile.vmlinux_o        | 16 +++++++---
> > >  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++=
++
> > >  scripts/head-object-list.txt      |  1 +
> > >  9 files changed, 180 insertions(+), 15 deletions(-)
> > >  create mode 100644 scripts/Makefile.vmlinux_thinlink
> > >
> >
> > I noticed that both Makefile.autofdo and Makefile.propeller add extra l=
inker flags when building with ThinLTO. Did you miss updating that or is th=
e omission there intentional?
>
> Thanks for catching this! One good aspect of distributed build mode is
> that we no longer need the extra linker flags -- most of them are just
> to pass the options to the BE compilation.
> So this patch does not need these linker options.  But for the
> Propeller build, we still need to pass one of the two profiles to the
> final link, and I'll be sure to incorporate that into the patch.

One clarification: We don't need to change scripts/Makefile.propeller
as the link
ordering profile is already passed to the final link under
CLANG_PROPELLER_PROFILE_PREFIX.

All the --lto-* options are only for in-process thinlto builds.

>
> However, I do need to make a change regarding file suffixes. The
> is_kernel_obj macro in the Makefile.build uses the basename command.
> The issue is that basename extracts everything before the last period
> in a filename. So, for a file named "foo.o.thinlto.native", basename
> returns "foo.o.thinlto", but kbuild expects it to return "foo".
>
> To fix this, I'll adjust the suffixes to ".a_thinlto_native" and
> ".o_thinlto_native". I'll send the patch v3 shortly.
>
> Thanks,
>
> -Rong
> >
> > --
> > Regards,
> >   Eric
