Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EBAAFD1
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 20:07:37 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id bt19so27047546pfb.3
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680898057; x=1683490057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkOEhQNrIBFDHu7KAVwRblXldBrOwOumrazSx2PHct0=;
        b=mJE8l6pA+2PT6E5N5sbq9oZWU6MFGh4WrHvDXlxWedKbAYSpCmaQscbYlmnvGF8lXB
         nhvqJmlRNTThO0BlZysjCSmIzK0wH0URUyIMIbEYqL9mIW9i06SBWe/5D39t7X+02w3F
         lx/C9e3beaemoSIpaWak5PdZtdzQAEWmirLoDeKgOiC2EEoDCOKycNQHZWM4V62PWECi
         /uVHNUfr6gkaeoeKVFEckRq1iwsVxASE3y+N8cKrpjD4Jzh8P3a41eTGxa9dNpX3iu2y
         ICXq3yLhX+IFRWRPWCZjWy7pN62ht+k8bqrLvnhahCS61wmP9eFrvug0ZK0/pFyBetiX
         RIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898057; x=1683490057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkOEhQNrIBFDHu7KAVwRblXldBrOwOumrazSx2PHct0=;
        b=00oFSgNZ4a8WIK14z9XuJ1elFzUxNgjyoyd/yduRfAvN9WxBi794qDVQvl0XT+H+bn
         2+hArTbqRGYJ3Fl+ao0XE/iTp+JRhhAQRQ2HNBoudUsn8+jxXF0lHjrFOrAI9fAZgU1e
         VVZBKc9CJ/CMB/z9knLXWG+GafZmG8lwF8+A00NvHTPg1hxo/3i1PfLmATzuNwl0MEIY
         RKkfCq0F20sjvgeSzv17JUhCXV7ehnEuH7gnLF5+PdVc+oaF5+7tDBK1pmlUXocmExQF
         riS8d1bDWl9MnOrzyI4iLjLTr8VPM4yLF+dknGOYQqeX67gTIIhTSqMzPG5R0IWsGJOe
         bMWQ==
X-Gm-Message-State: AAQBX9cRzLEdrbNd91ERLDOda+nL3svOuWUGb08CWyUmSVsy/jia2Heb
	g55Ue3fyb2zI6CrgtNMTMeUNg1ijhEAUztt8VrkAiA==
X-Google-Smtp-Source: AKy350ZodAE1kFxaDIP59bG96aIVjkJ5nBYb13hi5XnQQ0LKgyr6AqX0Jjr5lrWDDS0eoVNk6zG3x7nSzNx62dkuwrg=
X-Received: by 2002:a63:d65:0:b0:513:6b94:8907 with SMTP id
 37-20020a630d65000000b005136b948907mr703540pgn.1.1680898056858; Fri, 07 Apr
 2023 13:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
 <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
 <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com> <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com>
In-Reply-To: <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 13:07:25 -0700
Message-ID: <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To: Bill Wendling <morbo@google.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: tr4v3ler <0xtr4v3ler@gmail.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 1:02=E2=80=AFPM Bill Wendling <morbo@google.com> wro=
te:
>
> On Fri, Apr 7, 2023 at 1:00=E2=80=AFPM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.com>=
 wrote:
> > >
> > > I would like to compile all C files into. ll or. bc to facilitate ana=
lyzing the entire kernel.
> >
> > So there's a make target compile_commands.json. That will give you a
> > json list of triples that contain the exact command used to compile
> > the kernel. It's probably 10 lines of python to parse that, then rerun
> > the exact command used the build each translation unit with -emit-llvm
> > and -S (or not depending on if you want .ll or .bc).  That will give
> > you a .ll/.bc for everything that's built as part of your config for
> > that configuration.
> >
> > Otherwise, kbuild has rules to do:
> >
> > $ make LLVM=3D1 lib/string.ll
> >
> > There's no support for .bc (would be trivial to add) because you
> > typically end up running llvm-dis on .bc files to get .ll files
> > anyways.  I almost never use .bc files.
> >
> If LTO is enabled, then the .o files are LLVM bitcode files by default.

Ah right!

(I wonder what would break if we changed this to use the expected file
extension of .bc rather than .o.)

>
> -bw
>
> > > Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.c=
om> wrote:
> > >> >
> > >> > Hi=EF=BC=8CI found the following compilation targets in the makefi=
le(https://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L13=
6) of the Linux kernel. However, I don't know how to make this goal effecti=
ve, compile the Linux kernel, and generate llvm bitcodes. Do I need to spec=
ify specific parameters for the make command? Or through environment variab=
les?
> > >>
> > >> What precisely are you looking for? A single .ll file? A single .bc
> > >> file? .ll or .bc files for every translation unit?
> > >> --
> > >> Thanks,
> > >> ~Nick Desaulniers
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >



--=20
Thanks,
~Nick Desaulniers
