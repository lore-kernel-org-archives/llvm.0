Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467D8483
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 17:29:58 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id z14so2590692pgs.10
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfqqW8xswcE4pCjxXD8PyH0teUj7MSVef6Ler61pLDU=;
        b=aJBs2ADAoMx6JaXIn+YDuFOty94//q3+Y2zjaQ7nJj7RhfZBucnHFDFtakhHvaDolr
         O+90olsE/GiHEBbhjULTa2lb7VdmFxqayLHVEXacqIBhBpBw6J4pk6/5L45Kk3AvmFW/
         L3N4eA/EnqfrqO0+xbn39oR0nv1X6Hk9kO/L6bhexilp0nWDE8oDYmpUHFi32HD5BwEf
         Lz6ftiDPylrJxzQUYC+lDCBoHdLUvEHQEurvy6xnEZKvgRnDx9a9DpRXhbKfZOwMJClT
         AqLmpWFtZ91PIoGUj13NL3S/bp/n7gwjVBkF9r0JNJCK/7c1hf0wUfRmrKOhJ9AlVf5g
         xAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfqqW8xswcE4pCjxXD8PyH0teUj7MSVef6Ler61pLDU=;
        b=TTPhuRAA5EpYQ9vCcFu4cUF5G6ik5ny08iAbn3ACa9zxE2hfFjhBIkFvlLy4jMjJ5Z
         sUyUA5jmTXaKapc71PvzdUSYANjuuY1L7olEnP45QuELdB8THVscE6JIMW+arYo73XLp
         2cFtWTPu1fqGr22QGUr0rakCPg7SwG8BOWomj1YU40WMDAO9AR4T2c7XpiEIuJ8W5IgM
         xCYOer7JlBtBPCvLm2hWt7rLM4fTTYxXxOklT/cYZ+v7yPWSS+OQvblKcKPvnfv02c+c
         wVhnX6Kx97VDbY5nljxrXmfBhNFRhhhTEKqBhWh2jqEUr18V1ww5Ib4SqGtRLegBRckI
         L9fQ==
X-Gm-Message-State: AO0yUKUSPvwyCqhcjdslt7yxYBaQNxIlQa471XLjubh8n0Sb8xrz+gX7
	MLAhZKkFkQluf6vuBYKuDX+mIC+FvEHGke8u37mS5g==
X-Google-Smtp-Source: AK7set9vkRiv0cc/fw6dQATGiIp+75R5GPoTDDv/YcUNxz4gdVqcNUtaoRhHK1Y52n0Qy7Puo6f0stvJAbouaLDshcU=
X-Received: by 2002:a05:6a00:721:b0:593:bcc4:11ec with SMTP id
 1-20020a056a00072100b00593bcc411ecmr742504pfm.6.1675272597296; Wed, 01 Feb
 2023 09:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
 <20230201113155.18113-1-naresh.kamboju@linaro.org> <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
In-Reply-To: <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 1 Feb 2023 09:29:45 -0800
Message-ID: <CAKwvOdnc_ggT_2FQQwq71PiDE_D1xxXXnB5iSWvvoa3pu7kMdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"npiggin@gmail.com" <npiggin@gmail.com>, "pali@kernel.org" <pali@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"anders.roxell@linaro.org" <anders.roxell@linaro.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"nathan@kernel.org" <nathan@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>, qiongsiwu@gmail.com, 
	nemanja.i.ibm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2023 at 3:41 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 01/02/2023 =C3=A0 12:31, Naresh Kamboju a =C3=A9crit :
> > Following build regression started from next-20230131.
> >
> > Regressions found on powerpc:
> >
> >    build/clang-nightly-tqm8xx_defconfig
> >    build/clang-nightly-ppc64e_defconfig
> >
> >
> > make --silent --keep-going --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake=
/builds/1/build ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux-gnu- HOSTC=
C=3Dclang CC=3Dclang LLVM=3D1 LLVM_IAS=3D0 tqm8xx_defconfig
> > make --silent --keep-going --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake=
/builds/1/build ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux-gnu- HOSTC=
C=3Dclang CC=3Dclang LLVM=3D1 LLVM_IAS=3D0
> >
> > error: unknown target CPU '860'
> > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 60=
3e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5=
, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5=
x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9,=
 pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, =
ppc64le, future
> > make[2]: *** [/builds/linux/scripts/Makefile.build:114: scripts/mod/dev=
icetable-offsets.s] Error 1
> > error: unknown target CPU '860'
> > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 60=
3e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5=
, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5=
x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9,=
 pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, =
ppc64le, future
> > make[2]: *** [/builds/linux/scripts/Makefile.build:252: scripts/mod/emp=
ty.o] Error 1
>
>
> On GCC, the possible values are:
>
> ppc-linux-gcc: note : valid arguments to =E2=80=98-mcpu=3D=E2=80=99 are: =
401 403 405 405fp
> 440 440fp 464 464fp 476 476fp 505 601 602 603 603e 604 604e 620 630 740
> 7400 7450 750 801 821 823 8540 8548 860 970 G3 G4 G5 a2 cell e300c2
> e300c3 e500mc e500mc64 e5500 e6500 ec603e native power3 power4 power5
> power5+ power6 power6x power7 power8 powerpc powerpc64 powerpc64le rs64
> titan
>
> How do you tell CLANG that you are building for powerpc 8xx ?

+ Nemanjai, Qiongsi,


>
> >
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-2023020=
1/testrun/14479384/suite/build/test/clang-nightly-tqm8xx_defconfig/history/
> >
> > The bisection pointed to this commit,
> >    45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org



--=20
Thanks,
~Nick Desaulniers
