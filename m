Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3EC7C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 20:06:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id v22so23376967ljh.7
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sHMn2RqXC5Hd7kUwZr9sLrL+V6bEqVwF/cBS2ad8D58=;
        b=bSj+ymRWKXC0proVMtMKQtPUCs9bItV87V1hIxFgY2KO6dUegXqpJsi7CHZcHcNaxN
         S3Fe+kMOK9hP8mGLRfwsYOaA625AEX4SO2BlDkWboNVqi2jFUhINB/Nmpp9MLniCokBR
         E65frGi7sDbWfpf98c850AVmcuBYt6LtCdCptJ6q7LTQAWLlQ2I1OU9dRlXLcuY8dATk
         NbBLRSkxEvC+HgjqOELHzaAWvY0rijjIx7+UxPAC3nFfX7E42PblTSSCtvfn4w6RR6Rl
         0jMC5JmDZsOGm70mVS78pMAcQQk5VjgMI/EpLS5T4t3uocg3+CYxQ+pOsWHk+qnRH1Dz
         TwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sHMn2RqXC5Hd7kUwZr9sLrL+V6bEqVwF/cBS2ad8D58=;
        b=siwpRTvlrPIDznQStW0pamdSG/tY/C2YUkIbmx/ymheJfR2e++lX+ZNJ2+BbA1RWBQ
         z5r9NBmIJeQlRZmMlohDlQskiPje6M6BF7gDuZh3Rq6FvNIoKv89MoneJM77aLYDBqUy
         kHtL18zFzVYpnurPC6IiXx/ZRnJ5IMeZ9rRAvvkwX1V9cpgqLe2V2Pf+JRRXK+isfrJm
         ZkDRd0sUrW15bR/Gx4xAwLZYYDdn8grQgVCWNFwX50NZkMDS4/iMZRSAjuvMq5aiSsVH
         MMbg8C3qWGjkCySr367UvhdD2LCq5mIjwTmLng5F8e3eKoGf6XcjDYDj8peJZHo0PyMc
         5Qhg==
X-Gm-Message-State: AOAM532S0yZMpTNs/mJG9FLMWclNNpeME88xmHFeIOp1ZNq/RLph/Ppw
	VARc+1EAZ7SK6nT37X4VlBlqZOhMjZ3PyQE+kEUV9w==
X-Google-Smtp-Source: ABdhPJy9/aH7E4w4W8YBDS3B3vQbYMivIKhC7EiVLhwpc0rN31PPndliHV9fMriG3KV3aFlw8GNkfdYRoHhDqXt+fjM=
X-Received: by 2002:a2e:3004:0:b0:223:c126:5d1a with SMTP id
 w4-20020a2e3004000000b00223c1265d1amr18926345ljw.408.1646165174644; Tue, 01
 Mar 2022 12:06:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
In-Reply-To: <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 12:06:02 -0800
Message-ID: <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 11:57 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 1, 2022 at 6:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Mark Rutland <mark.rutland@arm.com>
> >
> > In a subsequent patch we'll move the kernel from using `-std=3Dgnu89` t=
o
> > `-std=3Dgnu11`, permitting the use of additional C11 features such as
> > for-loop initial declarations.
> >
> > One contentious aspect of C99 is that it permits mixed declarations and
> > code, and for now at least, it seems preferable to enforce that
> > declarations must come first.
> >
> > These warnings were already disabled in the kernel itself, but not
> > for KBUILD_USERCFLAGS or the compat VDSO on arch/arm64, which uses
> > a separate set of CFLAGS.
> >
> > This patch fixes an existing violation in modpost.c, which is not
> > reported because of the missing flag in KBUILD_USERCFLAGS:
> >
> > | scripts/mod/modpost.c: In function =E2=80=98match=E2=80=99:
> > | scripts/mod/modpost.c:837:3: warning: ISO C90 forbids mixed declarati=
ons and code [-Wdeclaration-after-statement]
> > |   837 |   const char *endp =3D p + strlen(p) - 1;
> > |       |   ^~~~~
> >
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > [arnd: don't add a duplicate flag to the default set, update changelog]
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the patches!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

That said, there's a few additional places that reset KBUILD_CFLAGS.
$ git grep -rn "KBUILD_CFLAGS :=3D" | grep -v filter-out | grep -v subst
arch/mips/boot/compressed/Makefile:30:KBUILD_CFLAGS :=3D
$(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
arch/mips/vdso/Makefile:115:$(obj-vdso): KBUILD_CFLAGS :=3D
$(cflags-vdso) $(native-abi)
arch/mips/vdso/Makefile:144:$(obj-vdso-o32): KBUILD_CFLAGS :=3D
$(cflags-vdso) -mabi=3D32
arch/mips/vdso/Makefile:184:$(obj-vdso-n32): KBUILD_CFLAGS :=3D
$(cflags-vdso) -mabi=3Dn32
arch/parisc/boot/compressed/Makefile:17:KBUILD_CFLAGS :=3D -D__KERNEL__
-O2 -DBOOTLOADER
arch/s390/boot/Makefile:13:KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS_DECOMPRESSOR)
arch/s390/boot/compressed/Makefile:23:KBUILD_CFLAGS :=3D
$(KBUILD_CFLAGS_DECOMPRESSOR)
arch/s390/purgatory/Makefile:24:KBUILD_CFLAGS :=3D -fno-strict-aliasing
-Wall -Wstrict-prototypes
arch/x86/boot/compressed/Makefile:35:KBUILD_CFLAGS :=3D -m$(BITS) -O2
$(CLANG_FLAGS)

The parisc, s390, and x86 cases look like true positives to me (mips
looks fine FWICT).  I didn't want to nack the patch for being
incomplete, but it's not necessarily treewide.


>
> > ---
> >  Makefile                          | 3 ++-
> >  arch/arm64/kernel/vdso32/Makefile | 1 +
> >  scripts/mod/modpost.c             | 4 +++-
> >  3 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 94fa9a849a7a..37ef6a555dcd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -432,7 +432,8 @@ HOSTCXX     =3D g++
> >  endif
> >
> >  export KBUILD_USERCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prot=
otypes \
> > -                             -O2 -fomit-frame-pointer -std=3Dgnu89
> > +                           -O2 -fomit-frame-pointer -std=3Dgnu89 \
> > +                           -Wdeclaration-after-statement
> >  export KBUILD_USERLDFLAGS :=3D
> >
> >  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOS=
TCFLAGS)
> > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso=
32/Makefile
> > index 9378ea055bf2..ed181bedbffc 100644
> > --- a/arch/arm64/kernel/vdso32/Makefile
> > +++ b/arch/arm64/kernel/vdso32/Makefile
> > @@ -68,6 +68,7 @@ VDSO_CFLAGS +=3D -Wall -Wundef -Wstrict-prototypes -W=
no-trigraphs \
> >                 -fno-strict-aliasing -fno-common \
> >                 -Werror-implicit-function-declaration \
> >                 -Wno-format-security \
> > +               -Wdeclaration-after-statement \
> >                 -std=3Dgnu11
> >  VDSO_CFLAGS  +=3D -O2
> >  # Some useful compiler-dependent flags from top-level Makefile
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 6bfa33217914..fe693304b120 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -833,8 +833,10 @@ static int match(const char *sym, const char * con=
st pat[])
> >  {
> >         const char *p;
> >         while (*pat) {
> > +               const char *endp;
> > +
> >                 p =3D *pat++;
> > -               const char *endp =3D p + strlen(p) - 1;
> > +               endp =3D p + strlen(p) - 1;
> >
> >                 /* "*foo*" */
> >                 if (*p =3D=3D '*' && *endp =3D=3D '*') {
> > --
> > 2.29.2
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
