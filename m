Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08224107A1
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 18:19:29 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b12so12180349wrn.2
        for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 10:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+NeFEY2WVIgcrUr3NoTkWHcfGCIrIwhotT6Jrtod2Y=;
        b=ZK+M8yPUIZ4sIeWiZIA2M5vb5zFOBeL1KYdHkTuWnUgdYtnHcb166sVL3mkLSj9UHm
         yL3957vuJKQWfUDkretgiX5dPzyz/eiAdJKrI7f74tb99mUF/h9cman0/ZRYG5HoVDTn
         4fD1sJa8dyU82rg2eIKsJm6iWbChauBUm5t6zCG9eMjOJNWqBaIwz6eCxvj/3RN1rZ7e
         eiJJSw0GoIj0llVsXvy1hS79OOT/IlAkHSw+TV1OOnWsEuebAlnyr08xaOzjNuffmj9G
         F5Dh3hVtUUiE/CDIM66r0sWHmFDRfEzOLC0BHo1NqF/lFX7bfC+NzVcORYVg4pNlE3M3
         4+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+NeFEY2WVIgcrUr3NoTkWHcfGCIrIwhotT6Jrtod2Y=;
        b=ZQa9Ze5AWGdgK96RQiOqTpV4yCc17eXCbPLtjRQpglOEokrjITeW5/QTomeQXGJgbZ
         tfrED4Z3e7QxIW7lEAH1fr2f2jFxaqmyn0obopREG/zIgToee75om3r+/M8CCSC5+JAJ
         9UNQaJh6XpCzqcZBP79s3IidY2e44/abLGihJUYVollcjbGDqeepT8c4E4wADhhnBRUs
         ekm2QX4VQGa4RCX6txukn9PIv8lbhLWx7oPIUlNLcXwQb9woTd1GK2b3BzZ0YWLpzFeQ
         C+gYJ+dAJi37xab4cC4sRn9cx7KV3fgxi/U9SMkJdZPuQpTTEx+bdyaZjVJcGGY4dxi1
         p3wA==
X-Gm-Message-State: ANoB5plZDBi7xwXa0dm5SvRpIOUN4O3qBZ0LxYHuv9BZ8Y1S3TKY9ygv
	OM59p5CM4H83K+ojLHl7fdw0bMVDFb7ruO2baHLXTA==
X-Google-Smtp-Source: AA0mqf5Buf2m1gXIj5mIbebwZYnYcplPQWRX5FCIOG4mckd9Ybq3GvjfFybXcBY5m2KnEN/ft4mHRso6eZGq7/zNO3M=
X-Received: by 2002:a5d:4acd:0:b0:236:d8f8:b87d with SMTP id
 y13-20020a5d4acd000000b00236d8f8b87dmr7748966wrs.343.1669141167930; Tue, 22
 Nov 2022 10:19:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com> <20221122001125.765003-2-irogers@google.com>
 <Y3xwzWWhfEJb7NW4@bergen.fjasle.eu>
In-Reply-To: <Y3xwzWWhfEJb7NW4@bergen.fjasle.eu>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Nov 2022 10:19:15 -0800
Message-ID: <CAP-5=fXfwSMCXcRXDS_m5LVsf9h2wBeK8mMvbovbh5nGmFLr3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] tools lib subcmd: Add install target
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 10:48 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Mon 21 Nov 2022 16:11:22 GMT, Ian Rogers wrote:
> > This allows libsubcmd to be installed as a dependency.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/lib/subcmd/Makefile | 49 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
> > index 8f1a09cdfd17..e96566f8991c 100644
> > --- a/tools/lib/subcmd/Makefile
> > +++ b/tools/lib/subcmd/Makefile
> > @@ -17,6 +17,15 @@ RM =3D rm -f
> >
> >  MAKEFLAGS +=3D --no-print-directory
> >
> > +INSTALL =3D install
> > +
> > +# Use DESTDIR for installing into a different root directory.
> > +# This is useful for building a package. The program will be
> > +# installed in this directory as if it was the root directory.
> > +# Then the build tool can move it later.
> > +DESTDIR ?=3D
> > +DESTDIR_SQ =3D '$(subst ','\'',$(DESTDIR))'
> > +
> >  LIBFILE =3D $(OUTPUT)libsubcmd.a
> >
> >  CFLAGS :=3D -ggdb3 -Wall -Wextra -std=3Dgnu99 -fPIC
> > @@ -48,6 +57,18 @@ CFLAGS +=3D $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
> >
> >  SUBCMD_IN :=3D $(OUTPUT)libsubcmd-in.o
> >
> > +ifeq ($(LP64), 1)
> > +  libdir_relative =3D lib64
> > +else
> > +  libdir_relative =3D lib
> > +endif
> > +
> > +prefix ?=3D
> > +libdir =3D $(prefix)/$(libdir_relative)
> > +
> > +# Shell quotes
> > +libdir_SQ =3D $(subst ','\'',$(libdir))
> > +
> >  all:
> >
> >  export srctree OUTPUT CC LD CFLAGS V
> > @@ -61,6 +82,34 @@ $(SUBCMD_IN): FORCE
> >  $(LIBFILE): $(SUBCMD_IN)
> >       $(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $(SUBCMD_IN)
> >
> > +define do_install_mkdir
> > +     if [ ! -d '$(DESTDIR_SQ)$1' ]; then             \
> > +             $(INSTALL) -d -m 755 '$(DESTDIR_SQ)$1'; \
> > +     fi
> > +endef
> > +
> > +define do_install
> > +     if [ ! -d '$(DESTDIR_SQ)$2' ]; then             \
> > +             $(INSTALL) -d -m 755 '$(DESTDIR_SQ)$2'; \
> > +     fi;                                             \
> > +     $(INSTALL) $1 $(if $3,-m $3,) '$(DESTDIR_SQ)$2'
> > +endef
> > +
> > +install_lib: $(LIBFILE)
> > +     $(call QUIET_INSTALL, $(LIBFILE)) \
> > +             $(call do_install_mkdir,$(libdir_SQ)); \
> > +             cp -fpR $(LIBFILE) $(DESTDIR)$(libdir_SQ)
> > +
>
> Sorry for being late.
>
> Is there a specific reason why you do not use 'mkdir -p
> $(DESTDIR)/$(2); cp $(1) $(2)' or 'install $(addprefix -m,$(3)) -D $(1)
> $(2)' for the install rules (cp.  scripts/Makefile.{dtb,mod}inst)?
>
> I think you could get rid of mkdir calls and the ..._SQ handling when
> using one of them.

Thanks for the feedback! Perhaps we can merge this as being consistent
with existing approaches:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/lib/perf/Makefile#n185
and then refactor as you say.

> > +install_headers:
> > +     $(call QUIET_INSTALL, headers) \
>
> Unlikely, but if one of the install commands fails, you probably want
> make to exit with an error.  Might you want to add 'set -e; \' here?

Possibly. Again, I think we should aim for consistency and do this as
a follow up.

Thanks,
Ian

> Kind regards,
> Nicolas
>
>
> > +             $(call do_install,exec-cmd.h,$(prefix)/include/subcmd,644=
); \
> > +             $(call do_install,help.h,$(prefix)/include/subcmd,644); \
> > +             $(call do_install,pager.h,$(prefix)/include/subcmd,644); =
\
> > +             $(call do_install,parse-options.h,$(prefix)/include/subcm=
d,644); \
> > +             $(call do_install,run-command.h,$(prefix)/include/subcmd,=
644);
> > +
> > +install: install_lib install_headers
> > +
> >  clean:
> >       $(call QUIET_CLEAN, libsubcmd) $(RM) $(LIBFILE); \
> >       find $(or $(OUTPUT),.) -name \*.o -or -name \*.o.cmd -or -name \*=
.o.d | xargs $(RM)
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
>
> --
> epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
> =E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
>      -- frykten for herren er opphav til kunnskap --
