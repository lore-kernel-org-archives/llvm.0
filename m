Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454323C2
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 07:06:48 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-01.nifty.com with ESMTP id 24A6vJX5014660
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 15:57:19 +0900
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 24A6v5G8019017
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 15:57:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24A6v5G8019017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652165826;
	bh=PV2VZBmSw1vDAIYTzEMhuv3Dcr29T/TFTi8FpUXKvKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TUwfcbJvXyEvqS8U11pqWqNmRgJzRZaBOGmPCphF+IP2bpDlMx0L9NSHPo3LizD+b
	 ELmgfisgYc9Dkdfvq4jo1FzJ1HT3wtSW1w2WlGbqLoHqey20jM14N6UUlxyj/mqBYA
	 AX/7/fcgrEQKWf4o2Zv+TXLqUdtc6CF5huKQGAPLIQ13xqP42a7sMHmvWBHcUd/52y
	 JT8vHBu7Mujdb7nuqsZriXtv80/x/2pyM6DL4/oZWrEoTN/1Q96Wh7GOpeZL/rATQL
	 5wBCqpzWAUMi+noWjumXUHN2+1tdLCI8yrM0t16SPITEcCss048Fs238DeWc/mEgKv
	 dRLJIW9zg0/lQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id n8so15967489plh.1
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 23:57:05 -0700 (PDT)
X-Gm-Message-State: AOAM531SuftsOMctwPxNn4ZIEi1qohWc7ON9JmYm5HEAZljLq2MaVtiI
	aS9bc0TrbvXiW8SmUAcfih/QFJQCHlKEBKuNGAI=
X-Google-Smtp-Source: ABdhPJyUsO6qgOPcuwMWkhoVbg96fdtrT2KcjbMF4Q1DKsxKckAJcwFdS+O5hh4okyU+VxKrQY62LHgpgdtJmiFstPc=
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr21441512pjy.77.1652165824961; Mon, 09
 May 2022 23:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org> <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
In-Reply-To: <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 May 2022 15:55:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
Message-ID: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into section-check.c
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 10, 2022 at 2:20 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > modpost.c is too big, and the half of the code is for section checks.
> > Split it.
> >
> > I fixed some style issues in the moved code.
>
> It would be helpful for review if the split and restyle were distinct
> patches.  Otherwise I can't tell what has changed.
>
> This does lose the ability to use git blame to get more context on
> some of the oddities in modpost (which I have found useful in the
> past).  I don't feel strongly though.


OK, I will just move the code in v5.





> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index a78b75f0eeb0..e7e2c70a98f5 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -31,7 +31,7 @@ static bool external_module;
> >  /* Only warn about unresolved symbols */
> >  static bool warn_unresolved;
> >
> > -static int sec_mismatch_count;
> > +int sec_mismatch_count;
>
> ^ this should go in modpost.h if it is to be used in two translation
> units, rather than forward declaring it in section-check.c.  You did
> this for the functions.


Sorry, I do not understand.


In modpost.h, I put the declaration:

  extern int sec_mismatch_count;

If I moved it to the header without 'extern'
I would get multiple definitions.







--
Best Regards
Masahiro Yamada
