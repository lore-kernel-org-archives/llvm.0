Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009911367
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 08:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8D0C433CA
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687596245;
	bh=ihxks+scKC1i2YhsRQdM12a0Piaf0uWSJk4+096CVCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QK9soT9zj3KgxF3awi6GX6hKzk6+xu8UdcVpKTZ2TyT0mDrZt/CLyuV0nonDBF/Yv
	 MUAqRDanKvaR5AEGsNEEy9Vk2atCyXPkiQBBF/GFm3lllgsTCpBALc79zvEUxSJXvi
	 WuaCo6SdIqswSNF2H7l1HO371kMrBq70FY956KSECE5OqYgCdIvRCEV5JJbeqQ4LBv
	 FfHw76weLo3Wcdl6di4ZsOY3G0AIQMoBPSLi+UZ3LCPoNiRG3OVmbEypmQIKhfMjLZ
	 VSSp4vqeyOnFlf1v+o+Xicg/O95hNr3gCs8+sYf/Ci91P3V+pbVEdEM5kilIxXFdLA
	 ahaxPOCx+TaTw==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-55e04a83465so1099694eaf.3
        for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 01:44:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDxB1AEJQg//5sUTrTI4yWTebl7rC9qkqdRJTn7gAqlIAS304Dtu
	z4O5Ylr0WQWPvskVOjVHR3kPbTTTAXkoum0cPzU=
X-Google-Smtp-Source: ACHHUZ7R9os95T2sTExvHh1CgAU0Gz8vTFQrGw5KklR4TI2FUhxaKw1sKZqykCjrgxzbxtbCD4H4ICfSl0K5o9tIuhc=
X-Received: by 2002:a4a:dc19:0:b0:560:c7dd:e19e with SMTP id
 p25-20020a4adc19000000b00560c7dde19emr7070257oov.3.1687596244708; Sat, 24 Jun
 2023 01:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com>
 <202306230932.539C9DC0@keescook> <CABCJKufmB+MwjEu=wjina1-F0q9vT--ig=SyLAGuXQViLV_1Uw@mail.gmail.com>
In-Reply-To: <CABCJKufmB+MwjEu=wjina1-F0q9vT--ig=SyLAGuXQViLV_1Uw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Jun 2023 17:43:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwOtsGPf7mcHAyKiw65kjBBK-wrqi4YrvAHTrDDcrHUg@mail.gmail.com>
Message-ID: <CAK7LNATwOtsGPf7mcHAyKiw65kjBBK-wrqi4YrvAHTrDDcrHUg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 24, 2023 at 5:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Fri, Jun 23, 2023 at 9:32=E2=80=AFAM Kees Cook <keescook@chromium.org>=
 wrote:
> >
> > On Fri, Jun 23, 2023 at 12:11:41AM +0000, Sami Tolvanen wrote:
> > > Hi folks,
> > >
> > > The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> > > where the compiler injects indirectly called functions to object
> > > files that otherwise contain no executable code, and are not
> > > processed by objtool or don't have CFI enabled. This results in
> > > missing or incorrect type hashes during boot and when modules are
> > > loaded.
> > >
> > > Sami Tolvanen (2):
> > >   kbuild: Fix CFI failures with GCOV
> > >   kbuild: Disable GCOV for *.mod.o
> > >
> > >  init/Makefile             | 1 +
> > >  scripts/Makefile.modfinal | 2 +-
> > >  scripts/Makefile.vmlinux  | 1 +
> > >  3 files changed, 3 insertions(+), 1 deletion(-)
> >
> > Nice hunting!
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > Should these get Cc: stable tags maybe?
>
> I was under the impression that Fixes: tags would be sufficient these
> days, but agreed, explicit Cc: probably wouldn't hurt.
>
> Sami


Both applied to linux-kbuild.

I also think Fixes: tags would be enough
to make them back-ported.


--=20
Best Regards
Masahiro Yamada
