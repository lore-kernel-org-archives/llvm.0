Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4F17C1
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 03:33:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 24C3XR4s032166
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 12:33:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 24C3XR4s032166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652326407;
	bh=dbNwEvZYw1fjRFSQZy5q9B2R8hJHj2WYVFlICWwM6Oc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s1HuTe8UfZdDhcbAtMfhGnh602XNDnJrWAZjDq1eXSgH83LURXTiO+twVc9QSx/Sk
	 6VC+f2jUae4aZTd5Ssw0HIHfFYomAWAdDYb0P1TIvZqe+Nkp+ieO+zaJq3+Hh5l82/
	 XqlADjjruNJJBtQhiCmE2jElPQev1GDHCYgUNOMNQ78JS5grR/X4V+VLdMYcl7DZ4X
	 DVOJQZEoNeeez1uIXAcPdwRw5gvhiM8NxtxXxv6V/KC/q42s1bJt3/9HpJ76S/9KmJ
	 IO/8y+SV3i5TilxIWRrqUeNKgfXXSN7AQu7PVVMuAExvDGZBRUBWVTLhaA2OHnqXQd
	 MAp0P7x0pjbvg==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id x12so3447383pgj.7
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 20:33:27 -0700 (PDT)
X-Gm-Message-State: AOAM531hnfhlUQdg36X8yoSN3AKGnjcnbtR/ys+KKZjqznOFQ3LfTL/4
	6wQwoopdWdyQSe0FSG64+vesKWCGQKdP/Jysji0=
X-Google-Smtp-Source: ABdhPJwG0xbZVE9S3odmeddiK5smlXhc5MfRFuwXPi0gSLw2Nm0SAMreZzrCHdbMunbY06F+fLSoK5TjQygOQdUrI6I=
X-Received: by 2002:a63:6989:0:b0:3c2:3c19:d661 with SMTP id
 e131-20020a636989000000b003c23c19d661mr23412597pgc.352.1652326406909; Wed, 11
 May 2022 20:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511164514.2741934-1-masahiroy@kernel.org>
 <20220511164514.2741934-2-masahiroy@kernel.org> <CAKwvOd=SZYO0344rrJWP+JvmuZmQ9N6VM9UgMwrb9fH3MaNLMQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=SZYO0344rrJWP+JvmuZmQ9N6VM9UgMwrb9fH3MaNLMQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 May 2022 12:32:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASsnrxu1BvtR9aq6oeOvmTX8jr4Wum=+7qemKzcLpSRWQ@mail.gmail.com>
Message-ID: <CAK7LNASsnrxu1BvtR9aq6oeOvmTX8jr4Wum=+7qemKzcLpSRWQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] modpost: split the section mismatch checks into section-check.c
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 7:28 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, May 11, 2022 at 9:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > modpost.c is too big, and the half of the code is for section checks.
> > Split it.
> >
> > Also, move some related typedefs and macros from modpost.h to
> > section-check.c
> >
> > Copy Sam's Copyright there. Commit b39927cf4cc5 ("kbuild: check for
> > section mismatch during modpost stage") is the initial work for the
> > section checks.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Sorry again for my "brain fart" in reviewing the global var in v4. :(
> I think my blood sugar was getting low or something...

Never mind.
Thanks for the close review all the time!

>
> > ---
> >
> > Changes in v5:
> >    - Fix the build error  (spotted by Nathan)
> >    - Do not do codying style changes  (Suggested by Nick)
>
> I'm surprised the style changes didn't show up in v5 as a later patch
> in the series. I wasn't against them in general, just thought it would
> be easier to review if they were distinct commits.


I just postponed the coding style fixes
because they are not essential for my main goal
in this patch set.

A lot of old code exists in modpost.
We can improve it later.


-- 
Best Regards
Masahiro Yamada
