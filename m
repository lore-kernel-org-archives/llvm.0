Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B7A15BF
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 16:36:01 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a37909a64eso2924374b6e.1
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689611761; x=1692203761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA/iWGM5jVgrQTgVAP1T1MYlEj/+DU3uJ2eHPJePb2Y=;
        b=NzeOCLYrZJ1CPIeDNJPnTwQul1uiwgBoWc5uHedLi3ZzTY+tKjXEdHRxmPfdYGw4Yt
         rpu00HY7+EsiFSloYywPdV1Py/E2Yrsz0+6tP+gOmvRBmtXba/UEcInUfJDHUUt2OAV4
         Zmxd+cx0bLNrEXyhV2D5z9nP5B0ny0sKKTSVuB5yE0QBcarnNSYBeqUY1BY1v3wNNj2z
         tQ9XSklQHVI+OyBBrR+D3vYhfiU0sGJwlyHI3ynnqyIwyGuPxG7EtpYc6YTKB4eMOEmt
         kY6A9nJisyR8QWOJdvwq1r8taOhb3TG90AGVxUPYQ0ZEhtrr1kspvML2xxvKPQAyHIrp
         W8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611761; x=1692203761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA/iWGM5jVgrQTgVAP1T1MYlEj/+DU3uJ2eHPJePb2Y=;
        b=QYv+v+bizQipEpT3sL3ucG06mEkW7UvwBNTiRnBOf9Md430LhNezqQTtdAmFvh8Ad1
         Uf1bgaaBDd9+teEqyAo+DbAEWzizpWzV4syKN+GRVhm4oOuak4I6EsxmPlYB8SabFIDy
         IV75gwo/IrYXFElkImlxaQiJkpWTwXNX/TDNUMJzlsWHR7omRUz3FbKGqW2e4tuM1/2L
         6gzoZnKcpa0ZBbVSE2vKurF2ShOtd9sd++4RgEeTPFHSjTg2XVxfiQz0yZZIUh2aRQ9z
         /DT1RicMINrnJ9e9vvhlA9fm7c8b46mXm1KwyZEBiPie6gzMW5/QOtT1WKELR6XNvOG2
         U+KQ==
X-Gm-Message-State: ABy/qLZuKPXf4sTJO1dOUxKC0W6FaUNPdN4rl+OEX4ccB+Ps8f4scE3x
	sD38VTRj2FKQsUT/AkykplXyIkgLJHj2RyOK6GLSKg==
X-Google-Smtp-Source: APBJJlFXgoM5JYiyURfjrpy48hpLApao0t2u3cPzHUDUmrorV/Pnf5w8IT0o72AR8WmiICLf0mld20wdlPtVBx8J+T8=
X-Received: by 2002:a05:6808:1513:b0:3a1:b6de:ed54 with SMTP id
 u19-20020a056808151300b003a1b6deed54mr14212741oiw.32.1689611760823; Mon, 17
 Jul 2023 09:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307171254.yFcH97ej-lkp@intel.com> <ZLUSG8bNnSqT0LO+@smile.fi.intel.com>
In-Reply-To: <ZLUSG8bNnSqT0LO+@smile.fi.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Jul 2023 09:35:49 -0700
Message-ID: <CAKwvOdnUjAXg4VRbCBKUOZDCKs-=5aA2-ef1tFRj-P=-1bBjaQ@mail.gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to __compiletime_assert_348
 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 3:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jul 17, 2023 at 12:42:57PM +0800, kernel test robot wrote:
> > Hi Alexander,
> >
> > FYI, the error/warning still remains.
>
> Alexander, either you can escalate this or just propose something to disc=
uss.

https://github.com/ClangBuiltLinux/linux/issues/1874
Sorry, a few more fires have popped up in the meantime.  Regardless of
changes to the compiler, we still support many versions of clang for
the kernel, so we'd need some workaround in the tests regardless.  I
saw there was already one for s390 + clang, but from this report we
will need another. Feel free to use that link above in comments in the
tests; we will clean those up once I have a better grasp on what's
going on with the compiler here.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>


--=20
Thanks,
~Nick Desaulniers
