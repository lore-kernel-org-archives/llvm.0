Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947D1FB35
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 23:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7841C433C9
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 23:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692831741;
	bh=Eq7J7zawcpdDDWIh2HuQQrvdc7mxsgSRB7s5vjCYY/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rzpHKKoUfsJW9dAsnH253UJTV+EkFBv+HGLyv94XnAfome/C17AiPZAFUk1hZqtOL
	 Y10fDsjrD119D5n+2k7Cajccrxwveqkaerldwu0uqOyCZo65ti6X6OD9pzzJPBYu68
	 Hod8IQ1XOs1mzxsUXpOIDCJkigFWPpcdWxrm/CRzNEYO31Myuc2iQb36PvJj9cjpni
	 1c9NLc4u9bRcPBkVP/jFGqNOVgCqzNntfdhUxtUMUm2XdRISc6Y3m2bxTWpzVUvc+X
	 A6wkEtuzwj1uNRWm/69VOiuspfr2GfNF/JXPQyD41TkV1075Qd6G3WkthjrtAxbYxx
	 iNtqR2qkOXZMg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-571110eb31bso694755eaf.2
        for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 16:02:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YwUVMLnr6Lg8NtWkuBV4r2MraS+AItTL3DkoDfu2WEDhDL+n29X
	3YeGN2Gyn/Tw+WDNaOxW+7s/QMfsYDGgR7bgqHo=
X-Google-Smtp-Source: AGHT+IFabyqBSNQby8SEE/dKMmTyRozKNYOI8clIq/JdRWoaOur8mY+Nsl9m0Aswfj2bpIVbosNwGqWoDrSqxCkN7Ek=
X-Received: by 2002:a4a:6c1d:0:b0:571:1fad:ebdd with SMTP id
 q29-20020a4a6c1d000000b005711fadebddmr786364ooc.1.1692831740017; Wed, 23 Aug
 2023 16:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
 <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
In-Reply-To: <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Aug 2023 08:01:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
Message-ID: <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To: Fangrui Song <maskray@google.com>
Cc: Denis Nikitin <denik@chromium.org>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 3:00=E2=80=AFAM Fangrui Song <maskray@google.com> w=
rote:
>
> On Tue, Aug 22, 2023 at 10:49=E2=80=AFAM Denis Nikitin <denik@chromium.or=
g> wrote:
> >
> > .llvm.call-graph-profile section is added by clang when the kernel is
> > built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-use=3D).
> >
> > The section contains edge information derived from text sections,
> > so .llvm.call-graph-profile itself doesn't need more analysis as
> > the text sections have been analyzed.
> >
> > This change fixes the kernel build with clang and a sample profile
> > which currently fails with:
> >
> > "FATAL: modpost: Please add code to calculate addend for this architect=
ure"


Curious.

This message is only displayed for REL.

(Please not it is located in section_rel() function)


I think modern architectures use RELA instead of REL.
Which architecture are we talking about?


What does the output of this command look like?

$ llvm-readelf -S vmlinux.o | grep  .llvm.call-graph-profile


Is it REL?









> >
> > Signed-off-by: Denis Nikitin <denik@chromium.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks. The new commit message looks good to me.
>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> > ---
> >  scripts/mod/modpost.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index b29b29707f10..64bd13f7199c 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -761,6 +761,7 @@ static const char *const section_white_list[] =3D
> >         ".fmt_slot*",                   /* EZchip */
> >         ".gnu.lto*",
> >         ".discard.*",
> > +       ".llvm.call-graph-profile",     /* call graph */
> >         NULL
> >  };
> >
> > --
> > 2.42.0.rc1.204.g551eb34607-goog
> >
>
>
> --
> =E5=AE=8B=E6=96=B9=E7=9D=BF



--=20
Best Regards
Masahiro Yamada
