Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F42F33
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 18:48:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id p10so5087010lfa.12
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 11:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
        b=cA8UQtFoVUliUtfWSv912J6B0ub0HcxW8gmIXite+joZhlMbpeCS+bUAZWYfMzZ8Xa
         G/fJOfLTcngtIL8G90CQr+73lLbCL1AHxsh2R+qmJrgmJRTCuyNKXj7cliEo28pPuXQj
         6w3VaEUFPmnSDKtF91NPiV/sgjc8ZRv71y4uYb9hxeHwZUr5je/pDiqFgm2aSZ7bIISf
         /1UJjBBsIPYSlsXi1kwAQ99jbSUPR+9P2r7SaKBX1wGFQEJXaWfpYonbpRKCQDD6CxUK
         Dp+b87CVNCLP2zVCceaShTI1HSRNKEIjVASMSKh/ElRg8CR6aP+J3pZQ1S3J5UZUSIaH
         1EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
        b=Q1UrkQhT9FPnpoSm59tSBeRt1HvA386zgHfeGKORQgbf3qGX7bzaxvdju4jue2bgm5
         eFzv1YhtvPBWpARjOu9J5Ujphvwpx+OmWpz0fivCqz19vZ8ZTMFSA01R+m6kGpwdcJLw
         z2BRqTLssCvq7VHHrMAcLxMdoY2hSFk02le0HMJ7wYCEaAfSiJTnbBAEYPqQ/BsS0CBv
         DoZ0+JE/1rssxzam0wIn5LVHy+P+npk4ahKv4GHLhvkJuQRd5ly3yb0cl10yHrhT+iXw
         2C2/TTg2tloxKTzwgbALs45B78AI3Dp4T40jTVDVfHve6JgIXkWxzD83okWikJuWd+nc
         gdmQ==
X-Gm-Message-State: AOAM533X+EU1utuf6/jaUGdCraiPoqzxuemw9n9yPhLmREGfqOaPLbET
	udJfeiNrIAeS8D4t96BtDGsTOlMxhm5CPtdIivB4Fg==
X-Google-Smtp-Source: ABdhPJwORYNYs+f4SpR17x+QtOIu9Uo6dxlRowGZd30bvV7AXP2VnNh+RNLxsgttKR9yFrJ+aoveRa6JaxEnp5h+sgs=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr20624164lfp.392.1652294887500; Wed, 11
 May 2022 11:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org> <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
In-Reply-To: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 11:47:56 -0700
Message-ID: <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>, 
	linux-modules <linux-modules@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index a78b75f0eeb0..e7e2c70a98f5 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -31,7 +31,7 @@ static bool external_module;
> > >  /* Only warn about unresolved symbols */
> > >  static bool warn_unresolved;
> > >
> > > -static int sec_mismatch_count;
> > > +int sec_mismatch_count;
> >
> > ^ this should go in modpost.h if it is to be used in two translation
> > units, rather than forward declaring it in section-check.c.  You did
> > this for the functions.
>
>
> Sorry, I do not understand.
>
>
> In modpost.h, I put the declaration:
>
>   extern int sec_mismatch_count;
>
> If I moved it to the header without 'extern'
> I would get multiple definitions.

Yeah, you need to _declare_ it w/ extern in the header, then _define_
it in one source file.

That way, if the type ever changes, the sources will agree on type in
all source files. You will get a redefinition error if the definition
changes the type of the variable since the last declaration.

What you're doing is forward declaring, which works, and is a common
pattern for (bloated) C++, but is less type safe than sharing a single
common declaration between multiple source files via a single common
shared header. (Sorry I didn't respond before you sent v5)
-- 
Thanks,
~Nick Desaulniers
