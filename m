Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4C5246
	for <llvm@lists.linux.dev>; Mon, 10 Apr 2023 19:29:09 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id qa44so14514376ejc.4
        for <llvm@lists.linux.dev>; Mon, 10 Apr 2023 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681154947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqqVTxdThIrWJ0JnBtkrcoFoLSU42l+GTy1305Yz8uM=;
        b=g2etEoKdIOFTKbIK6gpYGFTfzWM/kv9LdNiiK8+njpxR2og7aIiYCMMg7l0osP8heR
         GZv4CIxbc8+Kd0BdcLmhneBak6Ukfm4f05OfMFBgCF1slEKg1wfziGl1MhWdJq8F8oMI
         1A+c0US8+R0u+Z4YiQHLdHGtremmTD2ZbbdQYavrGqBJ8GhLAC5qa1z2+8ygSfsy/unZ
         sLV0+tc8KD0aWEu6DQF8o+N36EXWK4mv3DWprUANkTfdhJhAFne3l7cZAKzlcXtKrdZN
         hhtaPOnEY578DMRlzRiwrDEhDhaq+hcQd4kEg3ADQG5pQi9yO3vhJc4DOTNbPNqqq9Q7
         8OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqqVTxdThIrWJ0JnBtkrcoFoLSU42l+GTy1305Yz8uM=;
        b=Re54KB2mDIpEFqFnbIdltxMvauCwJkt9nG0qH6F9Xf5eO+Im5z5HTkZ3H0Y08T0GXf
         QHCpWCelhIurWw1Afwk5JnkxnXwCgxTucjks2W36ri0oTb5j1qoEiqCP20jTyvxgrpet
         Qbw8ZwsQWv2Cd7nFPzItOx1JxAixINHdr8dnptrMAnwmwGrYQzCFIzk4pXKdSgyfJqRs
         dLrAhoSu8eVq2bxhWRn9vZzFtz+NS8M3bSOoHer21R9xQGMEpp5MzzfCwvvtJnCdM6Cq
         u3S/M8iYdWkNG5mfCVxl3aQI1cPhpnsHpZ6b8nHhPZLTHHRe17OhLeNGP9f7z388YLvI
         rpQA==
X-Gm-Message-State: AAQBX9e6oxmx99oHa6tWT1eL8/cny9virAEB8KVVP611q4vS4m4NJQDO
	F1XW0iNpaboj/jkbSBoF/873bFlJKqKLBWu1wXoT
X-Google-Smtp-Source: AKy350b5qAlU+or/fvC+RW59KSyuKPqrgNrieAxHEHOqUCpU0Qn6yLx9pL2WngytH8wfpYSYLvhvUbiFl5ilIgGZjfg=
X-Received: by 2002:a17:907:d502:b0:94a:3ce:722 with SMTP id
 wb2-20020a170907d50200b0094a03ce0722mr3240164ejc.4.1681154947311; Mon, 10 Apr
 2023 12:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
 <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
 <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
 <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com> <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
In-Reply-To: <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 10 Apr 2023 12:28:49 -0700
Message-ID: <CAGG=3QWo1FrTa9PSWq_b5Gfzsp-6wNwJgT7u9yR-Q767DKwU=Q@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, tr4v3ler <0xtr4v3ler@gmail.com>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 1:07=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Apr 7, 2023 at 1:02=E2=80=AFPM Bill Wendling <morbo@google.com> w=
rote:
> >
> > On Fri, Apr 7, 2023 at 1:00=E2=80=AFPM Nick Desaulniers <ndesaulniers@g=
oogle.com> wrote:
> > >
> > > On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.co=
m> wrote:
> > > >
> > > > I would like to compile all C files into. ll or. bc to facilitate a=
nalyzing the entire kernel.
> > >
> > > So there's a make target compile_commands.json. That will give you a
> > > json list of triples that contain the exact command used to compile
> > > the kernel. It's probably 10 lines of python to parse that, then reru=
n
> > > the exact command used the build each translation unit with -emit-llv=
m
> > > and -S (or not depending on if you want .ll or .bc).  That will give
> > > you a .ll/.bc for everything that's built as part of your config for
> > > that configuration.
> > >
> > > Otherwise, kbuild has rules to do:
> > >
> > > $ make LLVM=3D1 lib/string.ll
> > >
> > > There's no support for .bc (would be trivial to add) because you
> > > typically end up running llvm-dis on .bc files to get .ll files
> > > anyways.  I almost never use .bc files.
> > >
> > If LTO is enabled, then the .o files are LLVM bitcode files by default.
>
> Ah right!
>
> (I wonder what would break if we changed this to use the expected file
> extension of .bc rather than .o.)
>
I'm sure it can be done, but it would require poking into a lot of
Makefiles. Ultimately, it might not be worth it...

The only situation where it might be beneficial is to compare ELF
files generated during ThinLTO to their bitcode counterparts---e.g. if
one wants to verify a livepatch and have a "paper trail" back to the
changed files (we do something similar to this internally, but I don't
think it's a widespread workflow).

-bw

> > > > Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail=
.com> wrote:
> > > >> >
> > > >> > Hi=EF=BC=8CI found the following compilation targets in the make=
file(https://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L=
136) of the Linux kernel. However, I don't know how to make this goal effec=
tive, compile the Linux kernel, and generate llvm bitcodes. Do I need to sp=
ecify specific parameters for the make command? Or through environment vari=
ables?
> > > >>
> > > >> What precisely are you looking for? A single .ll file? A single .b=
c
> > > >> file? .ll or .bc files for every translation unit?
> > > >> --
> > > >> Thanks,
> > > >> ~Nick Desaulniers
> > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
