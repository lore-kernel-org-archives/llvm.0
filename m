Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC9AD25
	for <llvm@lists.linux.dev>; Wed, 14 Dec 2022 18:25:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bx10so730635wrb.0
        for <llvm@lists.linux.dev>; Wed, 14 Dec 2022 10:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcDDPBR7PVVq1gsDBQPjFYlUePtxzPfWYMI5nAMWQWM=;
        b=UUYrg/4p80IykoqsYXgQCS28VTR2q2S/KADm55UlrER9OdX92XZSA0/+AdHw3CYgzS
         M5pnPX3NTwZrf22T/MVlciVeCES8bLvFbPmoc07GyhcXkXq73kNINU3tUSdJLlfTM1Os
         euy1fjxVGyu04NptaaIHPNHZ7XtgmbgKJa7RRDo6EbGl2PF6FbIfBM3Et2zUbUo6Op4J
         RY6jI1D8pknvKA+ZCXnhRGF0/fI8wsvp0AgruDPKu7ckhhJTNrA6YnAvp13YwhPbJav+
         WkN1oKT/HaKaIVoFYXyU9gMf9j9zr5ntsLewExCqGyZ77DyWm81lmKsYdO6R2Y+0HxSz
         KtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcDDPBR7PVVq1gsDBQPjFYlUePtxzPfWYMI5nAMWQWM=;
        b=t29MVdqRYvJtAGpTUBrZWE9zyCjCK/18sjcpGCrUtIaHEvEpBNTWWhSPFk30mhSFZc
         J6O9jf3pBjEzzge7lG+yhWX33zGdXKWIniT3i0CfmVH1QzwiXVLLIoEdq3H4SvVncqUy
         xDVJV/M0tng4jgMYJ6DSBwJPPVQAvbq81+wR46lNQ7sKOgzyUJQrWVdLR6lWqhMMh7gy
         BiM0qX/goClaZenCKwzC49AXR4PwDKVfAUzZefthn15h1UOJVP1y/LDeR5IJnKIBybHN
         ZxwJW2F4QMaU6bRadipmcMxTyIXWsn47FA7n5975trinMfPVMtkaYsGz0BlnqwfPYyUL
         9f0g==
X-Gm-Message-State: AFqh2kpEQY3qsLwfsId+Md3PH70ABgo+w7WVWMLQUwcfCd5X7Xdp1C6o
	TF/KzZjFhYPIzunsPer0g8zdmQG4Q1HFbNX+wCZ/tQ==
X-Google-Smtp-Source: AMrXdXugna5UNKFzcPG1mNIEq0Mn1lT298lG6VDfsKgax1yR4ktKk239CdGwPW0+UierGbqeDkFR4TrXUKnMx+WjCRI=
X-Received: by 2002:a05:6000:69b:b0:256:c249:b819 with SMTP id
 bo27-20020a056000069b00b00256c249b819mr2890wrb.654.1671042346124; Wed, 14 Dec
 2022 10:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com> <20221122001125.765003-5-irogers@google.com>
 <CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com>
In-Reply-To: <CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Dec 2022 10:25:33 -0800
Message-ID: <CAP-5=fUX2jYgKVrnFLH2MjhUXb_Y1KGdoonkeLE7AcB5gdtaVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] objtool: Alter how HOSTCC is forced
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 9, 2022 at 10:26 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Nov 21, 2022 at 4:12 PM Ian Rogers <irogers@google.com> wrote:
> >
> > HOSTCC is always wanted when building objtool. Setting CC to HOSTCC
> > happens after tools/scripts/Makefile.include is included, meaning
> > flags are set assuming say CC is gcc, but then it can be later set to
> > HOSTCC which may be clang. tools/scripts/Makefile.include is needed
> > for host set up and common macros in objtool's Makefile. Rather than
> > override CC to HOSTCC, just pass CC as HOSTCC to Makefile.build, the
> > libsubcmd builds and the linkage step. This means the Makefiles don't
> > see things like CC changing and tool flag determination, and similar,
> > work properly. To avoid mixing CFLAGS from different compilers just
> > the objtool CFLAGS are determined. HOSTCFLAGS is added to these so
> > that command line flags can add to the CFLAGS.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/objtool/Makefile | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > index 61a00b7acae9..e550a98e2dd9 100644
> > --- a/tools/objtool/Makefile
> > +++ b/tools/objtool/Makefile
> > @@ -2,16 +2,12 @@
> >  include ../scripts/Makefile.include
> >  include ../scripts/Makefile.arch
> >
> > -# always use the host compiler
> > -AR      = $(HOSTAR)
> > -CC      = $(HOSTCC)
> > -LD      = $(HOSTLD)
> > -
> >  ifeq ($(srctree),)
> >  srctree := $(patsubst %/,%,$(dir $(CURDIR)))
> >  srctree := $(patsubst %/,%,$(dir $(srctree)))
> >  endif
> >
> > +MAKE = make -S
> >  LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
> >  ifneq ($(OUTPUT),)
> >    LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> > @@ -36,13 +32,20 @@ INCLUDES := -I$(srctree)/tools/include \
> >             -I$(srctree)/tools/objtool/include \
> >             -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
> >             -I$(LIBSUBCMD_OUTPUT)/include
> > -WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
>
> Looking closer at the V=1 diff in meld, I think this is dropping
> EXTRA_WARNINGS.  I think you want to add those back to OBJTOOL_CFLAGS.

Thanks Nick! When I try this it causes new build failures.
Specifically EXTRA_WARNINGS includes things like -Wswitch-enum that
trigger:

```
check.c:1312:10: error: 14 enumeration values not explicitly handled
in switch: 'INSN_JUMP_DYNAMIC',
'INSN_JUMP_DYNAMIC_CONDITIONAL', 'INSN_CALL_DYNAMIC'... [-Werror,-Wswitch-enum]
       switch (insn->type) {
               ^~~~~~~~~~
check.c:2620:11: error: enumeration value 'OP_SRC_CONST' not
explicitly handled in switch [-Werror,-
Wswitch-enum]
               switch (op->src.type) {
                       ^~~~~~~~~~~~
check.c:3447:11: error: 5 enumeration values not explicitly handled in
switch: 'INSN_BUG', 'INSN_NOP
', 'INSN_TRAP'... [-Werror,-Wswitch-enum]
               switch (insn->type) {
                       ^~~~~~~~~~
check.c:3647:11: error: 9 enumeration values not explicitly handled in
switch: 'INSN_CONTEXT_SWITCH'
, 'INSN_BUG', 'INSN_STAC'... [-Werror,-Wswitch-enum]
               switch (insn->type) {
                       ^~~~~~~~~~
check.c:4008:10: error: 9 enumeration values not explicitly handled in
switch: 'INSN_CONTEXT_SWITCH'
, 'INSN_BUG', 'INSN_STAC'... [-Werror,-Wswitch-enum]
       switch (insn->type) {
               ^~~~~~~~~~
check.c:4173:11: error: 15 enumeration values not explicitly handled
in switch: 'INSN_JUMP_CONDITION
AL', 'INSN_JUMP_UNCONDITIONAL', 'INSN_JUMP_DYNAMIC_CONDITIONAL'...
[-Werror,-Wswitch-enum]
               switch (insn->type) {
                       ^~~~~~~~~~
6 errors generated.
```

What should the next step be? Land this or add EXTRA_WARNINGS and fix
all the issues?

Thanks,
Ian

> > -CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
> > -LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
> > +WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> > +OBJTOOL_CFLAGS := -Werror $(WARNINGS) -g $(INCLUDES) $(LIBELF_FLAGS) $(HOSTCFLAGS)
> > +OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD)
> >
> >  # Allow old libelf to be used:
> >  elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
> > -CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
> > +OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
> > +
> > +# Always want host compilation.
> > +HOST_OVERRIDES := CC="$(HOSTCC)" EXTRA_CFLAGS="$(OBJTOOL_CFLAGS)" \
> > +                 LD="$(HOSTLD)" AR="$(HOSTAR)"
> > +BUILD_HOST_OVERRIDES := CC="$(HOSTCC)" CFLAGS="$(OBJTOOL_CFLAGS)" \
> > +                       LD="$(HOSTLD)" LDFLAGS="$(OBJTOOL_LDFLAGS)" \
> > +                       AR="$(HOSTAR)"
> >
> >  AWK = awk
> >  MKDIR = mkdir
> > @@ -65,10 +68,11 @@ include $(srctree)/tools/build/Makefile.include
> >
> >  $(OBJTOOL_IN): fixdep FORCE
> >         $(Q)$(CONFIG_SHELL) ./sync-check.sh
> > -       $(Q)$(MAKE) $(build)=objtool
> > +       $(Q)$(MAKE) $(build)=objtool $(BUILD_HOST_OVERRIDES)
> > +
> >
> >  $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
> > -       $(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
> > +       $(QUIET_LINK)$(HOSTCC) $(OBJTOOL_IN) $(KBUILD_HOSTLDFLAGS) $(OBJTOOL_LDFLAGS) -o $@
> >
> >
> >  $(LIBSUBCMD_OUTPUT):
> > @@ -77,6 +81,7 @@ $(LIBSUBCMD_OUTPUT):
> >  $(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
> >         $(Q)$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
> >                 DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= subdir= \
> > +               $(HOST_OVERRIDES) \
> >                 $@ install_headers
> >
> >  $(LIBSUBCMD)-clean:
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
