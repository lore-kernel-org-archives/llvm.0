Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952511E521A
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902858; cv=none; b=Ff4E+m1uhd2ZUz27BJJLx/6BvWfZJ1vRlbov/KLJk1LggXCDDuj0Gvt5Qno6DeKHnnqgVfpGtLsEvXBf/ZNbdSFgO5ZJdsch9ZgGlhNvqvuCR+dUNMKavxUDoSPFlBnpVDDyl3e8Gv9wuGrU4WV03RCmTsWvbt1pXK0QG8IChco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902858; c=relaxed/simple;
	bh=buK+1F3NaFpvUqF1f/dexBsXuVQl3hByz1baHK1TnX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx5RKV8e3jjXQpy9+0+4b8EkQPpd9Q3XUWH8AIUuwP42rNlcJtsUxKQ9FWz11LDkCW1ODJYeYbQvoyLDLJV5WCGxCOnrpYYRv1yURTkfbdQUqyO/ByiId02ym6g0HffZ1crTvNsighVMal3H5W/1+9T6dE+QGV4oHIBgBkKdf4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ZVoIlBr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ZVoIlBr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1928a12.1
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902855; x=1749507655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1xJTVZ+8VUHzYi2jE7W4PW0S8Hr18XnGfWfY1LLxTU=;
        b=0ZVoIlBrOE5fvSTRminQIb3yFNy5SjmTgdpzlvrLeJWEHj3CWj+O7CI0MrZJXu7RBT
         57IxOw5uSsXWZUBqTNkxTHj2gBksgApG1S6py1m0KecYSbi9Z6hXrP8UWxCkR7Gb2V0v
         sWsRWdtL2zctNwoAPVsvEyzWjtq3p5A8BYmaH7ivDnHni73Co9GJkXNnSsH1c0w0wShs
         cJ+TZk0+bMzE+jtAPm1ZSzsyM1vIZMrU47W6hCzt7XYhyVKV4xFP5QoErw7X/Pa1FwVB
         armFr+jP+ZU4td/5CYubZdzeBM0EXIbALZyksDG3wN2SoiqBsaFSeYtxB/lWsiJRQD/E
         gKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902855; x=1749507655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1xJTVZ+8VUHzYi2jE7W4PW0S8Hr18XnGfWfY1LLxTU=;
        b=eNDPUXWJSg5eSbCYLzqTw4okMNDRdmUYm50XaQOrRCvqV3OVxQeqjPDEm4BjoQmj50
         22c7T6fZLekpwpeaXMYp108wru7ZKaRagPPrpaER0mfAs+Be2BnWh6TFlEiEqdZcw29+
         KRMInTzVLgskXQ9o9xp9yu0IHSD1LJTkjqxjeClA9Eyi/R0nUkZSZgrT9bwp7v31/EeR
         lcyn56DmN/hM9d980OrtMR+b/Ov2yCKrJ6p4m6Xzl+n7bQZv/7TUt3bdVRsM9A/oRXxk
         VwagU6Z1RRvBk/DlT5AJnoJkxJmKEKC0hbfZMWdZsyR26JDCBuIizJKEK3u9+2uHwhaT
         D0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5EJmF94RUf4fTVAuIPNVdSe9mmPz7MVJoYbhE67H1VyA5nyytaPzdmoCPh0tIGkHB5ej@lists.linux.dev
X-Gm-Message-State: AOJu0YywwPhMTihAgWxhIVOVPtFUHz3jt617Q5mvDR91l0cPouP9kgdO
	qnypWptUlwpdIzC+gh9Gb0EMBGOOGykojs4mGo1f0IwmPNx68z3NSXvgdVwge7xoC4Y0Y03STkO
	rm6YAENz9t2XKD0WORUPIRks2pK7mSA1mAaeFnKLR
X-Gm-Gg: ASbGncv/xoUmnJwbO1tfkkdQxZVJtK3R95LT+FtFSXj6eBBZyirZucWnkYEnngiyB09
	Xxp6KV7GP3xvlLtklK2TnMVMgujomF+r02VmPw3TzMStGRcDy5RkI5dj5NinoMbLH046BuALNsv
	Cd5B3IJi5/nEmhHv1RzB4cfC7WPLDq2eGC8bmoxvkBJmBX4vWo85qeeo+HkrrcIxpbJo369xDI4
	A==
X-Google-Smtp-Source: AGHT+IH/yk/xxbcx7hiUJfIuDl7hBIatmBZMmWU0cKeVYadUWiet4CoRFpyYhJCer92dBzh0suixw0aQHaSXmbnMaAM=
X-Received: by 2002:aa7:c558:0:b0:602:3bf:ce71 with SMTP id
 4fb4d7f45d1cf-606afa10584mr12099a12.3.1748902854672; Mon, 02 Jun 2025
 15:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com> <CAK7LNAS4Ys-ekzjrRdfwKh5tEU=FKe1tE2-orj6LTs7EknZCZg@mail.gmail.com>
 <CAF1bQ=QSBOdvqqBPPv70z1hLX4echmfzBDCu5o4LtKrZEaAJUw@mail.gmail.com> <CAK7LNAThpMaDDfBD6jQzPZ==X-EngwoirFy9AAML9se-36L3ig@mail.gmail.com>
In-Reply-To: <CAK7LNAThpMaDDfBD6jQzPZ==X-EngwoirFy9AAML9se-36L3ig@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 2 Jun 2025 15:20:42 -0700
X-Gm-Features: AX0GCFuuBOfRY_aGdJBgegCkRithTC4t0CA1KQhT2h01WgJiTD2lJJwDngovyHU
Message-ID: <CAF1bQ=Rb=0Etk2GLaWR+dXtMG00NhVYcHwx-E0=2FYu4mE1B_A@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Eric Naim <dnaim@cachyos.org>, 
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

On Fri, May 30, 2025 at 11:48=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Wed, May 28, 2025 at 6:05=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > On Mon, May 26, 2025 at 6:12=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:
> > > >
> > > > From: Rong Xu <xur@google.com>
> > > >
> > > > Add distributed ThinLTO build support for the Linux kernel.
> > > > This new mode offers several advantages: (1) Increased
> > > > flexibility in handling user-specified build options.
> > > > (2) Improved user-friendliness for developers. (3) Greater
> > > > convenience for integrating with objtool and livepatch.
> > > >
> > > > Note that "distributed" in this context refers to a term
> > > > that differentiates in-process ThinLTO builds by invoking
> > > > backend compilation through the linker, not necessarily
> > > > building in distributed environments.
> > > >
> > > > Distributed ThinLTO is enabled via the
> > > > `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
> > > >  > make LLVM=3D1 defconfig
> > > >  > scripts/config -e LTO_CLANG_THIN_DIST
> > > >  > make LLVM=3D1 oldconfig
> > > >  > make LLVM=3D1 vmlinux -j <..>
> > > >
> > > > The implementation changes the top-level Makefile with a
> > > > macro for generating `vmlinux.o` for distributed ThinLTO
> > > > builds. It uses the existing Kbuild infrastructure to
> > > > perform two recursive passes through the subdirectories.
> > > > The first pass generates LLVM IR object files, similar to
> > > > in-process ThinLTO. Following the thin-link stage, a second
> > > > pass compiles these IR files into the final native object
> > > > files. The build rules and actions for this two-pass process
> > > > are primarily implemented in `scripts/Makefile.build`.
> > > >
> > > > Currently, this patch focuses on building the main kernel
> > > > image (`vmlinux`) only. Support for building kernel modules
> > > > using this method is planned for a subsequent patch.
> > > >
> > > > Tested on the following arch: x86, arm64, loongarch, and
> > > > riscv.
> > > >
> > > > Some implementation details can be found here:
> > > > https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kern=
el/85934
> > > >
> > > > Signed-off-by: Rong Xu <xur@google.com>
> > > > ---
> > > > Changelog since v1:
> > > > - Updated the description in arch/Kconfig based on feedback
> > > >   from Nathan Chancellor
> > > > - Revised file suffixes: .final_o -> .o.thinlto.native, and
> > > >   .final_a -> .a.thinlto.native
> > > > - Updated list of ignored files in .gitignore
> > > >
> > > > Changelog since v2:
> > > > - Changed file suffixes: .o.thinlto.native -> .o_thinlto_native,
> > > >   and .a.thinlto.native -> .a_thinlto_native so that basename
> > > >   works as intended.
> > > > - Tested the patch with AutoFDO and Propeller.
> > > > ---
> > > >  .gitignore                        |  3 ++
> > > >  MAINTAINERS                       |  5 +++
> > > >  Makefile                          | 40 ++++++++++++++++++++---
> > > >  arch/Kconfig                      | 19 +++++++++++
> > > >  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++=
---
> > > >  scripts/Makefile.lib              |  7 +++-
> > > >  scripts/Makefile.vmlinux_o        | 16 +++++++---
> > > >  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++=
++++
> > > >  scripts/head-object-list.txt      |  1 +
> > > >  9 files changed, 181 insertions(+), 15 deletions(-)
> > > >  create mode 100644 scripts/Makefile.vmlinux_thinlink
> > >
> > > I re-implemented the Makefiles to avoid
> > > the second recursion and hacky ifdefs.
> > > Attached.
> > >
> > > The topic branch is available in
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git
> > > thinlto-dist-refactor
> > >
> > > I only compile and boot tested on x86 QEMU.
> > This implementation does look cleaner. But with one issue: it has a
> > unified cflags for
> > all the BE compilations. This means per-file flags, such as
> > CFLAGS_fork.o =3D -fabc,
> > are lost during the BE compilation for fork.thinlto_native.o.
> >
> > This exact issue was what I aimed to prevent with the two-recursion app=
roach.
> > If we must avoid two recursions, perhaps we could leverage the saved pe=
r-file
> > pre-link commands (i.e., .*.o.cmd)?
>
> How important is this?
It is one of the main reasons for using distributed mode. For example,
for some source, the user chooses to use -O1 (or disable some loop
transformations), there is no way to do this with one-unified options.

>
> I do not know which compiler flags are consumed in the
> distributed thin lto stage.
>
> Are only compiler flags starting "-f" relevant?
All the flags that have impact on BE compilation need to pass to BE.
Yes, usually most -f flags are relevant, all the internal options,
like -mllvm -foo need
to be passed to BE. -D, -i, -include are OK to filter.

>
> In your implementation, you filter-out many compiler flags.
These are flags for the compiler front-end (clang). They don't have impact =
on
BE compilation.

>
>
> --
> Best Regards
> Masahiro Yamada
