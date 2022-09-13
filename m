Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03933DA
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 14:05:31 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 28DE5PVa031176
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 23:05:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 28DE5PVa031176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1663077926;
	bh=YeFfqsD1cMM/56dIANPgCUVk9QsCcNwlQvvcGl88Bmo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VurfrffIXsKJXT+A/JCESLYaC4y9WFiO+2KX08ME9nBrFNhS85XRR/29gfjw+Fa0E
	 T/e34Jcm+NRe+MM9Bi0jawXBJtqstBy84T4HEuz09mwAuA34v75xBKl4f2FmmJOJFV
	 NH/waIUG3T//0JR3+xjgo9BOoEQzLgbN99Rh7MRNBom/Tl+C9aZfy/v5Nh4S1po4b/
	 AH6cIWMCr2Pb1mbNn/ZC14PaXGP3fHVDWbrM38UnoeH9yqMRFUDDlGdDLKxBTmXdK/
	 KT6p9dX9AluJTH+WBEU7g72rCgxw7FZb87Z0piw7TJ8EPxp8X7Medgw8AR7CtZq4EH
	 5zp3NvS+6iwFw==
X-Nifty-SrcIP: [209.85.160.54]
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1278a61bd57so32349122fac.7
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 07:05:25 -0700 (PDT)
X-Gm-Message-State: ACgBeo3T5NC1LgT6/cq4XDg80606y5KnSQ4ooYC1BQrGbtknZEfAEpoM
	i/9UdT//h3VnIKbQ7wmYs/Rg5KjqojvIQ68h/7Y=
X-Google-Smtp-Source: AA6agR7R++hgoWo7WThcQ9iOPJ7P8NZbGLYTq2wQTuFqtkVYuxGvVglcwUqDg2OyQ11iWrlgREEwz+LOorWIH3dklO8=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr1869267oab.287.1663077924765; Tue, 13
 Sep 2022 07:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220913040753.2198-1-xingwu.yang@gmail.com> <YyBSgNbJGRBNIL5I@dev-arch.thelio-3990X>
In-Reply-To: <YyBSgNbJGRBNIL5I@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 Sep 2022 23:04:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNTxtNCjjUEr+oDPLhPgqQet_iWzG0i2-dFBLo8nO+8g@mail.gmail.com>
Message-ID: <CAK7LNASNTxtNCjjUEr+oDPLhPgqQet_iWzG0i2-dFBLo8nO+8g@mail.gmail.com>
Subject: Re: [PATCH] scripts/clang-tools: remove unused module
To: Nathan Chancellor <nathan@kernel.org>
Cc: yangxingwu <xingwu.yang@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 13, 2022 at 6:50 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Sep 13, 2022 at 04:07:52AM +0000, yangxingwu wrote:
> > remove unused imported 'os' module
> >
> > Signed-off-by: yangxingwu <xingwu.yang@gmail.com>
>
> Sure.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Masahiro, are you able to pick this up? The original was not cc'd to
> linux-kbuild but it is on lore:
>
> https://lore.kernel.org/20220913040753.2198-1-xingwu.yang@gmail.com/


Sure, applied to linux-kbuild. Thanks.


> > ---
> >  scripts/clang-tools/run-clang-tools.py | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> > index 1337cedca..bb78c9bde 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -12,7 +12,6 @@ compile_commands.json.
> >  import argparse
> >  import json
> >  import multiprocessing
> > -import os
> >  import subprocess
> >  import sys
> >
> > --
> > 2.37.2
> >



-- 
Best Regards
Masahiro Yamada
