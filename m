Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0D28F1
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 17:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B65C4339C
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674408509;
	bh=438H6CrDOy6nKh2mCbJ0pDw6OZbSMl0pGNH7LBwxmNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJTtdODuXnmQLAYqiZo1TuXUs9fFM7tmNrdN+zytLuzBKnwTN7vco6jsjk6GKGSH6
	 Ypa+p27bdjJWPsUPwGCQj7/oYQgcIsFTfKhR36J4SoaCy2eTXhiVviHvyawlkSFTzn
	 s/CHheNH4PayC6hLbA75FO4StMLRA3PY2ko4Oac/mV59PpcBEnOd5FEZfj1QAZp8bK
	 TkqzLJJ/nkduWYojnT5d9a0wmh3a+L6tOJtxUGni0cylpAIJKVV9cX38sSbR6QPQQ3
	 +lBBeffUPH7dEDmqNwnD3tycrAdGyhgdBcYDRNBwy1DcchDM2MOAlW0zQdrGtgaIUX
	 ho3VvP13Ad9+w==
Received: by mail-oi1-f182.google.com with SMTP id i5so8531431oih.11
        for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 09:28:29 -0800 (PST)
X-Gm-Message-State: AFqh2kpGYElMJgs5ddH7jRzGTqx8snJ4zUJwyifuMDP2m5Ra5l+tecyU
	d2MGSSPzIyhuLIkTplbRAk1uRWFRRKe3S1rBvlI=
X-Google-Smtp-Source: AMrXdXsSHIt9F5C7C393A5+0g/WZ7RA6Q4cJ0fjJFXejj/7jpOG4YOEF2bAx5Kn+Um+Ajm9siFac4fZK1s/pXPNfXUM=
X-Received: by 2002:aca:acd5:0:b0:364:5d10:7202 with SMTP id
 v204-20020acaacd5000000b003645d107202mr879673oie.194.1674408508135; Sun, 22
 Jan 2023 09:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com> <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
In-Reply-To: <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Jan 2023 02:27:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
Message-ID: <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, ndesaulniers@google.com, nicolas@fjasle.eu, 
	trix@redhat.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 13, 2023 at 3:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sedat,
>
> On Thu, Jan 12, 2023 at 07:02:30PM +0100, Sedat Dilek wrote:
> > On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > > are several warnings in the PowerPC vDSO:
> > >
> > >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > >
> > >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> > >
> > > The first group of warnings point out that linker flags were being added
> > > to all invocations of $(CC), even though they will only be used during
> > > the final vDSO link. Move those flags to ldflags-y.
> > >
> > > The second group of warnings are compiler or assembler flags that will
> > > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > > they are not used during linking.
> > >
> > > Additionally, '-z noexecstack' was added directly to the ld_and_check
> > > rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> > > but now that there is a common ldflags variable, it can be moved there.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Cc: mpe@ellerman.id.au
> > > Cc: npiggin@gmail.com
> > > Cc: christophe.leroy@csgroup.eu
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > ---
> > >  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > > index 45c0cc5d34b6..4337b3aa9171 100644
> > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
> > >  UBSAN_SANITIZE := n
> > >  KASAN_SANITIZE := n
> > >
> > > -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> > > -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > -
> > > -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > > +ccflags-y := -fno-common -fno-builtin
> > > +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> > > +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > +# Filter flags that clang will warn are unused for linking
> > > +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> > > +
> > > +CC32FLAGS := -m32
> > > +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> > >  AS32FLAGS := -D__VDSO32__
> > >
> > > -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> >
> > Set CC64FLAGS := -m64 ?
>
> I do not think it is necessary. ldflags-y is filtered from
> KBUILD_CFLAGS, which should already include '-m64' (search for
> 'HAS_BIARCH' in arch/powerpc/Makefile). We would have seen a problem
> with this already if a 32-bit target (powerpc-linux-gnu-) CROSS_COMPILE
> value since $(c_flags) uses the main kernel's CROSS_COMPILE value.
>
> > > +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > >  AS64FLAGS := -D__VDSO64__
> > >
> > >  targets += vdso32.lds
> > > @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
> > >
> > >  # actual build commands
> > >  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> > > -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> > >  quiet_cmd_vdso32as = VDSO32A $@
> > >        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
> > >  quiet_cmd_vdso32cc = VDSO32C $@
> > >        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> > >
> > >  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> > > -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> >
> > If no CC64FLAGS := xxx is set, this can go?
>
> Good catch! CC64FLAGS can be removed. Masahiro, I am happy to send a v3
> when I am back online next week but if you are able to fix it up during
> application, please feel free to do so (once the PowerPC folks give
> their Acks of course).




I removed CC64FLAGS locally.




Just two comments.

- Is 7f3d349065d0c643f7f7013fbf9bc9f2c90b675f
  applicable to powerpc too?

  Maybe, as a follow-up cleanup, use $(LD)
  and remove -Wl, prefixes.


- ldflags-y still pulls $(KBUILD_CFLAGS).
  Potentially, a new flag addition to KBUILD_CFLAGS
  may trigger a new -Wunused-command-line-argument warning.

  I hope somebody takes a closer look at which flags
  are really needed for the linker.







> > >  quiet_cmd_vdso64as = VDSO64A $@
> > >        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
> > >
> > >
> > > --
> > > 2.39.0
> > >
>
> Thanks for the review, cheers!
> Nathan



-- 
Best Regards
Masahiro Yamada
