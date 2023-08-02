Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748C10973
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 22:53:05 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4865e927e1cso110161e0c.2
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691016784; x=1691621584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBVXuTo/8ehjYkvlx2DaLR/kSdWzLoO8wG7T6rpe/Qs=;
        b=F7S7MWxO/JdXWZiQ4M3wtX17sdcHm93BDLUWhYfvfW8gMDo2iTBP7drdmgPdAjphcv
         Hu8L2IgGXRzyLq5OE1Zk7KL9FjFVOpy3dej4E6xqDWm7BWA9ele+P/wtG/YwBB+0YjZ7
         hsJx1pvn7b2vC3DlGijA9ENUyPlWNeEKl7+3DiSzlMbgOsuoVOlteNrLt8CnrH8r0Js2
         thDEZX6/VOhWkNPuUlNPQk5hG1/jdJyOW5/rlav1zawY8uP9RcWtAQBJryvJ1rlXgsrx
         kUPJKArqZapID7d56d+V+OXUxUDFONu0tPu/zYblgrGJPGVYSMNTndrD98CP4G6qw1mc
         LxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691016784; x=1691621584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBVXuTo/8ehjYkvlx2DaLR/kSdWzLoO8wG7T6rpe/Qs=;
        b=HcKhWqnI/KWjqS39sCRYHqO39LPODwN2r/y1yKOuMf4mO1ew8cNhT8ZPGaz0FuZoTk
         xXQjFfVgakA1YStKk8Fw6HHo0NEmsL8T3Mr5MTnqT985veZMVEsqBgriUH3AY5W5iiAP
         dAqJfmOdiY1dXrthqczgCZAZhHvf8rqsEU79VoVUNmTN8nu0c3lMtP/qcUJ99zarf8lj
         oOR8wlyry/wEcbAQ4UEPWI5o3OUl90RraL7bbw0nxizU+EH9JVScbknEzZvqEbC7h1dZ
         S8yHzrDQQCNQf3dPxmGOad8q4d1ae7bDISJ6Ti3NcPDx4d8fFBMhMxdZ/TQaVsZjne7A
         WScw==
X-Gm-Message-State: ABy/qLYyj/IQgQSvPHmKlXixfOJi1W/tvFlsUp/Cv5XH4FnjgKRF2dvK
	ecyYaIi6otOWgrdaAjRvpoJQvzShvLphvnxLTC99SQ==
X-Google-Smtp-Source: APBJJlH04fl+pFertjoJkva8RcoeBVyLWmr942AX4GnstkvBLzOQNIiLlNwY336ycpjDQV8nkIigb2lAdQK1IDcr9EE=
X-Received: by 2002:a1f:e603:0:b0:486:556c:a0bb with SMTP id
 d3-20020a1fe603000000b00486556ca0bbmr6152826vkh.9.1691016783127; Wed, 02 Aug
 2023 15:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717050736.10075-1-okan.sahin@analog.com> <20230717050736.10075-3-okan.sahin@analog.com>
 <20230718155502.GA3542993@dev-arch.thelio-3990X> <20230726161033.GA1102409@dev-arch.thelio-3990X>
 <PH7PR03MB739122A373964651D995EA5AE701A@PH7PR03MB7391.namprd03.prod.outlook.com>
 <20230727145143.GB2013261@dev-arch.thelio-3990X>
In-Reply-To: <20230727145143.GB2013261@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Aug 2023 15:52:52 -0700
Message-ID: <CAKwvOdnPQEdbTGBO0hBn7CC4d0xtRV2zmfrYDfAhH0stfDYeJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: max77857: Add ADI MAX77857/59/MAX77831
 Regulator Support
To: Nathan Chancellor <nathan@kernel.org>, "Sahin, Okan" <okan.sahin@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"zzzzTilki, zzzzIbrahim" <Ibrahim.Tilki@analog.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, linux@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Okan,
Have you sent a follow up fix? The build should not remain broken for
so long.  Otherwise I think Broonie should drop your patch.

On Thu, Jul 27, 2023 at 7:51=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Jul 27, 2023 at 08:34:44AM +0000, Sahin, Okan wrote:
> > >On Tue, Jul 18, 2023 at 08:55:02AM -0700, Nathan Chancellor wrote:
> > >
> > ><snip>
> > >
> > >> > +static struct regulator_desc max77857_regulator_desc =3D {
> > >> > +        .ops =3D &max77857_regulator_ops,
> > >> > +        .name =3D "max77857",
> > >> > +        .linear_ranges =3D max77857_lin_ranges,
> > >> > +        .n_linear_ranges =3D ARRAY_SIZE(max77857_lin_ranges),
> > >> > +        .vsel_mask =3D 0xFF,
> > >> > +        .vsel_reg =3D MAX77857_REG_CONT2,
> > >> > +        .ramp_delay_table =3D max77857_ramp_table[0],
> > >> > +        .n_ramp_values =3D ARRAY_SIZE(max77857_ramp_table[0]),
> > >> > +        .ramp_reg =3D MAX77857_REG_CONT3,
> > >> > +        .ramp_mask =3D GENMASK(1, 0),
> > >> > +        .ramp_delay =3D max77857_ramp_table[0][0],
> > >>
> > >> This breaks the build with GCC 5.x through 7.x:
> > >>
> > >>   drivers/regulator/max77857-regulator.c:312:16: error: initializer =
element is not
> > >constant
> > >>     .ramp_delay =3D max77857_ramp_table[0][0],
> > >>                   ^~~~~~~~~~~~~~~~~~~
> > >>   drivers/regulator/max77857-regulator.c:312:16: note: (near initial=
ization for
> > >'max77857_regulator_desc.ramp_delay')
> > >>
> > >> and clang:
> > >>
> > >>   drivers/regulator/max77857-regulator.c:312:16: error: initializer =
element is not a
> > >compile-time constant
> > >>     312 |         .ramp_delay =3D max77857_ramp_table[0][0],
> > >>         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >>   1 error generated.
> > >>
> > >> This relies on a GCC 8.x+ change that accepts more things as
> > >> compile-time constants, which is being worked on in clang
> > >>
> > >(https://urldefense.com/v3/__https://reviews.llvm.org/D76096__;!!A3Ni8=
CS0y2Y!7B
> > >eWxuzHgLzOprQA_madbvdR7hd0ZgmS73lUlDbgoxWUFWdDSIRXLnhyqLeRhu3uTaqpS
> > >kzZKwc5pHA$ ). Since the kernel supports older
> > >> compilers, this will have to be worked around somehow. Perhaps a def=
ine
> > >> that can be used in both places?
> > >
> > >Was there any update on this? I do not mind sending a patch for this
> > >myself if I have some sort of guidance on how you would prefer for thi=
s
> > >to be fixed, should you be too busy to look into it.
> > >
> > >Cheers,
> > >Nathan
> >
> > Hi Nathan,
> >
> > I thought that I should fix this issue after merging main branch that's=
 why I did not send patch.
>
> That is an understandable position but no, this issue should be fixed
> before this change makes its way to Linus, not after.
>
> > I sent patch v3 so should I send new patch as v4?
>
> No, you should checkout Mark's branch that contains your patch and send
> a new patch on top of it just fixing this issue, like the other two
> patches that have already touched this driver:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/log=
/?h=3Dfor-6.6
>
> https://git.kernel.org/broonie/regulator/c/2920e08bef609c8b59f9996fd6852a=
7b97119d75
> https://git.kernel.org/broonie/regulator/c/541e75954cadde0355ce7bebed5675=
625b2943a8
>
> There are GCC 7.x and earlier toolchains at
> https://kernel.org/pub/tools/crosstool/ and LLVM toolchains at
> https://kernel.org/pub/tools/llvm/ should need to reproduce and verify
> the fix.
>
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
