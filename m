Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E4B14F12D
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937814; cv=none; b=WfS+IuzmX/ydoyXm6oXuDrcjqnYWa1FR5jXQ6SXyGBnjzQ9/grkKDa1GU6ucS7NFwDcltcN8htoMrfOpnpD577Db4jpnOn2J/k0ADhU27yNV+5MQtZngbEllb76YGYU8wnXmipu3TXxs0Zkbkdzpt5EtKB5EiCsJhG4FVt6zsig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937814; c=relaxed/simple;
	bh=ucoo6f54KwSD5SeHMZYpmPjZO4xNne7BCWHjR3gCdxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYQ7wv+6syKAsgBD1IX45QcuE/lXcdw4SDQFyLmnVggPTCaLFNUZejW2L0PBOEQtQuh4eNNdACbLwDNqJ31jx0dOfnHLe38pAd2u4FkEHXFewforBgsfPwhnAg0T8klV51x4vmBsOrH3PbJ0pE0R7H1WRql6pzpXJqt14msgIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKW1L90T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKW1L90T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A092FC4AF0F
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722937813;
	bh=ucoo6f54KwSD5SeHMZYpmPjZO4xNne7BCWHjR3gCdxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKW1L90TT5GCzFpxh34akZfkqpNPIUTKVhOQq0b8YnrBM7RoQsK76KzSl1zavr1px
	 fe24f91L8gDRrTGd38mM70jhqWKvfozVirArbgNZe8BrfMWoU6nKw5eWEj1Ch2Ikxu
	 Soi2xQgd441iCtHJiz6kZY9usmuGsE2OogE078LSZzbwm+t+KGO5Ivr4qxMQHjIvH+
	 mUk+SVxmYrlcZDuoRJCZEVLS4j/POjjjzFx+9IFC6wxFqKvl66WudqBmnpp/gvTgSE
	 kzWQ7x7RiJObZFICWyJ6AonUDaAveEAqIzHw7CjoTCXssRoW2aFEIsVXH2BA9xlRTg
	 hjbdFi64YG4eA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so686342e87.2
        for <llvm@lists.linux.dev>; Tue, 06 Aug 2024 02:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSYFBeBVvCSNX0sZYBWcoxgRbFmp+5HSwanAehb85zyHY8imTyu8JhJURjHSqBlNGTn1nR12JXNaEl/Rt8HcU4ao2+Tg==
X-Gm-Message-State: AOJu0Yyjqlfvj5LcAActYeEs2aLlZ0HAmeGZQ5LBhHrxGbdkViLxB+hK
	vV94ayVoovRz5rVEljUOqp8IUwvsWqhNFlIQ7P2RPd6I3TE4UNHDfr0GbyM9MTL5Pg4cJyNuCeZ
	xrt0XTKRkvKcLlCN/CAiFJNtZ9Ns=
X-Google-Smtp-Source: AGHT+IHDmfEeaoMHn9wSEgbMyVwhE3oUE5/IxWnyUsHffsPs2/DlCmJRrk40n4zbU0A1zN9iMt7Y1obwj4hOYJAxV3A=
X-Received: by 2002:a05:6512:1310:b0:52c:d943:300f with SMTP id
 2adb3069b0e04-530bb3bd90cmr10650159e87.38.1722937812334; Tue, 06 Aug 2024
 02:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
 <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com> <D37UCSKCEVI5.100JF8WJR9DNY@bootlin.com>
In-Reply-To: <D37UCSKCEVI5.100JF8WJR9DNY@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 18:49:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQEXB2bnH1+yj8Xg-Xyb7x4Fi4KJrkowA8dyccyfvfPQ@mail.gmail.com>
Message-ID: <CAK7LNASQEXB2bnH1+yj8Xg-Xyb7x4Fi4KJrkowA8dyccyfvfPQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:39=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:
>
> Hello Masahiro,
>
> On Sat Aug 3, 2024 at 10:42 AM CEST, Masahiro Yamada wrote:
> > On Thu, Jul 4, 2024 at 6:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bo=
otlin.com> wrote:
> > > +def filter_entries(datastore, filters):
> > > +    for entry in datastore:
> > > +        if filters =3D=3D []:
> > > +            yield entry
> > > +            continue
> >
> > Maybe, this can be checked on the caller side.
> > (Note, I did not test this at all)
> >
> > if args.file_filter:
> >         datastore =3D filter_entries(datastore, args.file_filter)
>
> Agreed.
>
> > > +
> > > +        assert entry['file'].startswith(entry['directory'])
> > > +        # filepath is relative to the directory, to avoid matching o=
n the absolute path
> >
> > Does this assertion work with the separate output directory
> > (O=3D option)?
> >
> > Just try this command:
> >
> >  $ make LLVM=3D1 O=3D/tmp/foo clang-tidy
>
> Indeed this does not work. It requires some changes to Makefiles to see
> that it does not work, as this assertion is only used when a filter is
> passed (which current cmd_clang_tools cannot do).
>
> What would you recommend to fix that? If we take the first entry:
>
>   {
>     "command": "clang ...",
>     "directory": "/tmp/foo",
>     "file": "/ABSOLUTE/PATH/linux-clang-tidy/arch/mips/crypto/crc32-mips.=
c"
>   },
>
> I don't see an easy way to know that "/ABSOLUTE/PATH/linux-clang-tidy/"
> should be removed. We could probably compute it from the command value
> but that isn't a great way forward.
>
> There are some entries that look like this. Those are easy to deal with.
>
>   {
>     "command": "clang ...",
>     "directory": "/tmp/foo",
>     "file": "/tmp/foo/drivers/tty/vt/defkeymap.c"
>   }


The top of the source tree is derived from __file__

  srctree =3D str(pathlib.Path(__file__).parents[2].resolve())








--
Best Regards
Masahiro Yamada
