Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237152F38
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 20:43:38 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7659db6339eso61661985a.1
        for <llvm@lists.linux.dev>; Wed, 05 Jul 2023 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688589818; x=1691181818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLtlZez9GAkHzasHFvmV0dDR+vDOeVbGvtxiizQEwv4=;
        b=qoJ/WcInnMvxpe/7GYFg2GXpLKxlltJ2gqvaiqY44B6DdIWAU+YP7JMLutJNgP2G0p
         PS8eidSRJn3Fl9ZhTpgMUdMGP9jXV/2myeCTFXsR1jOrQlsxSti0P/bFqLgGGAnLNjnm
         Y851GXtefxphylLWbgQlxgBzgZhgWRyCqfiSDetpCtO/Xi0C543Cw6dwegH6QRbcXoUK
         RcSYsRYqN8niT0QAh6V7Uc6lLPp1u39bDKH1+LKlV2xKlfXmkeXr8NFZY+UGFtYvuWAR
         xHsfrwwatncC14sspoLrcoiGsd+1VNKlXU7OakZirS5BPjzbW4TH/OzYlR1bQONPJgx1
         IimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589818; x=1691181818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLtlZez9GAkHzasHFvmV0dDR+vDOeVbGvtxiizQEwv4=;
        b=MbFG1aGLArTHg3l/CkAES18X+qzI2/dC+UwCFz0EyzKd8VRHRE413vPKkbXtR27g5V
         Z5wu1igozvIZzuuxh72fGIgupEu9rTKl4/yv1cgJGlolO51rCQx2rQgKXE4wQ5X+6Am6
         qGHbOkT6xa5wA/pZjiEW8zTvwWVsDs84jRTb7J9pzyy9uLsvZQKiQx1Fg6P0rukJr3yu
         rLP7f6FLDMNIm4OwE57KB7JJpHh4MJ3j178sk4r/VWvzAZ+0MXFxgac5NjbzDhaonL7v
         ys7+v/3JTp8fqGbURsmY4NusxOE0hSRPdsAqZpvSvySwQ7/PEP5wF7W8+p35hjp+oxnt
         Z6AA==
X-Gm-Message-State: ABy/qLYnO7IYmlcqb1MkOvhqjlX9tSYqF8dc/2rwj3IP1ugS22NOCY42
	rYO5EhuVNWE8ftQ7DCf/J4OpQi+TZHH9SQ+4oMRLWw==
X-Google-Smtp-Source: APBJJlHbB9as3fe+0u2+Ip6pMscKC0JFWdREHMoggTYXzbM688weDbz0++Qq4UE/yyF05PLEILCR1aFPSluIC8MNkps=
X-Received: by 2002:a05:620a:29d2:b0:763:bac8:39c4 with SMTP id
 s18-20020a05620a29d200b00763bac839c4mr4044453qkp.18.1688589817815; Wed, 05
 Jul 2023 13:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-14-samitolvanen@google.com> <20230630-rake-clubbed-bba8a9c27219@spud>
In-Reply-To: <20230630-rake-clubbed-bba8a9c27219@spud>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 5 Jul 2023 13:43:01 -0700
Message-ID: <CABCJKufa=TpydWsCY5QotC9a+hUHUwkpfMsC07BMwv6-VuzdCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 12:08=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Jun 29, 2023 at 11:42:51PM +0000, Sami Tolvanen wrote:
> > Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
> > on riscv.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 20a40927175e..2699e1f8fe33 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -44,6 +44,7 @@ config RISCV
> >       select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> >       select ARCH_SUPPORTS_HUGETLBFS if MMU
> >       select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> > +     select ARCH_SUPPORTS_CFI_CLANG
>
> Please add new entries in alphanumerical order, thanks.

Sure, I'll fix the order in v2. Thanks for taking a look!

Sami
