Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D664373
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 00:32:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id q8so9229169wmo.5
        for <llvm@lists.linux.dev>; Mon, 30 Jan 2023 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5r53/nqnCevQO8Fu82M6NVW13xUqfDzUYmKWml/MJs=;
        b=auXrK6SQrh5EGeows5fVXPerDl9g6T8vSnQnYLK88bxZ0evnvWjj+X6CMI4C+6vbmx
         3Gox2+jZ9EA+wW38lUsWGMv6CnFkIseuzKJFinX+Nlaup/ZPoGfrsTRlvUxgXtK3+Zvv
         kLt+To1HWGma5zQzpjIREvPCGk5epE/J1QLcSCF20rbgoC87dlQaGuSbyGmorbCNyDyg
         MEIgZg/iiF1GposmLYD6qzLSNNURdpNtUKCi4b/ZwhNhwtz+W11rFzl1+Hn64La5VAnB
         2cuvN7QgrFxwOgLxJI5kuOV/wxS3b6oCxU3WHkLkFUUz9wRGN/2YE/qACymQ1B+af6jI
         qegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5r53/nqnCevQO8Fu82M6NVW13xUqfDzUYmKWml/MJs=;
        b=ZyfXH4E8ryyKbpTvwfgj0R7sObSfw0dEKOIrcrvqeTuRzOIYJewvCUDQZkE+Y7p0Tg
         LQlzQx7A1xTkflaOH61PmZHBRvrxQdNSeCmhQg+kvmJYMA9eafwzNm/S8X1aUQkH5s+G
         2uvTzHkjtPW6B+FPGsl7QK8tjOEs3D3jWvOfsojReeJRWk7Cmds78gwR8+rymvjHF18s
         cBmR+0ZUNW6+HBVfAXlHZL7Xq/2Z5yzV4NXWl5+Jx/bJ66wMve9B9mDvc2p4Bc5kmfbA
         3vRIC4LV5gcGYq3c/JsTm94qXbZFVl12zhLPr72ynx4pbM463cV4+EQw0f9zgeVo4ivE
         pN1Q==
X-Gm-Message-State: AO0yUKXQwp8CXDxO4D8ctnIKW65wYMCEsWHGGn9xQ7kNjv9K7R3iAlOY
	hVFJppRhFX4qVkzCu8IOPecZTruBasxvcpFVgc9p8Q==
X-Google-Smtp-Source: AK7set/dC1uWGgfjf9oz5QbLX48NdIZ/QB4W5+XTt5Q/Xt2GSFZTOCok6LnkxYjtmMfIlqPVlZnSoxBsHvCehGtO+qY=
X-Received: by 2002:a05:600c:554c:b0:3dc:599b:795e with SMTP id
 iz12-20020a05600c554c00b003dc599b795emr325230wmb.203.1675125124402; Mon, 30
 Jan 2023 16:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230126190606.40739-1-irogers@google.com> <20230126193426.gu5vc3awe4kdmx2p@treble>
 <20230131002541.t32dgtfoovlmf23t@treble>
In-Reply-To: <20230131002541.t32dgtfoovlmf23t@treble>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jan 2023 16:31:52 -0800
Message-ID: <CAP-5=fUfWdLTEC64aXU6SNbCfVxjQAtEOsQWM3qBS4XOR5k97A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] objtool build improvements
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 30, 2023 at 4:25 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 11:34:28AM -0800, Josh Poimboeuf wrote:
> > On Thu, Jan 26, 2023 at 11:06:03AM -0800, Ian Rogers wrote:
> > > Install libsubcmd and then get headers from there, this avoids
> > > inadvertent dependencies on things in tools/lib. Fix V=1
> > > support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> > > being set for say gcc, and then CC being overridden to clang.
> > >
> > > v4. Rebase and look to address review comments from Josh Poimboeuf
> > >     <jpoimboe@kernel.org>. Removes the reviewed-by/tested-by given
> > >     the scope of changes.
> > > v3. Is a rebase that removes the merged "tools lib subcmd: Add install
> > >     target" patch. In:
> > > https://lore.kernel.org/lkml/CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com/
> > >     Nick rightly points out that:
> > > WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> > >     became:
> > > WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> > >     losing the EXTRA_WARNINGS which v3 now adds back in. Previous
> > >     testing had added the warnings to the end rather than the
> > >     beginning, thereby causing unexpected build issues that aren't present in v3.
> > > v2. Include required "tools lib subcmd: Add install target" that is
> > >     already in Arnaldo's tree:
> > > https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> > > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
> > >     When building libsubcmd.a from objtool's Makefile, clear the
> > >     subdir to avoid it being appended onto OUTPUT and breaking the
> > >     build.
> > >
> > > Ian Rogers (3):
> > >   objtool: Install libsubcmd in build
> > >   objtool: Properly support make V=1
> > >   objtool: Alter how HOSTCC is forced
> >
> > Thanks, this looks pretty good.  I might tweak the patch subjects to
> > describe what's being fixed from a user's perspective.
> >
> > I'll wait a few days for any more reviews before merging.
> >
> > Independently from this patch set, I discovered that HOSTCFLAGS (and
> > KBUILD_HOSTCFLAGS which includes -O2 and some other flags) don't work
> > when building objtool directly from tools/objtool.  But they do work
> > (for me at least) when building from the top-level Makefile.  So I'm not
> > sure what Nick's issue is.
>
> The objtool build is failing intermittently with a clean output tree:
>
>     HOSTCC  /home/jpoimboe/tmp/a/tools/objtool/fixdep.o
>     HOSTLD  /home/jpoimboe/tmp/a/tools/objtool/fixdep-in.o
>     LINK    /home/jpoimboe/tmp/a/tools/objtool/fixdep
>     INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/exec-cmd.o
>     MKDIR   /home/jpoimboe/tmp/a/tools/objtool/arch/x86/
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/help.o
>     CC      /home/jpoimboe/tmp/a/tools/objtool/arch/x86/special.o
>     HOSTLD  arch/x86/tools/relocs
>   In file included from arch/x86/special.c:5:
>   /home/jpoimboe/git/linux/tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
>       8 | #include <subcmd/parse-options.h>
>         |          ^~~~~~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
>   make[5]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:97: /home/jpoimboe/tmp/a/tools/objtool/arch/x86/special.o] Error 1
>   make[4]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:139: arch/x86] Error 2
>   make[3]: *** [Makefile:66: /home/jpoimboe/tmp/a/tools/objtool/objtool-in.o] Error 2
>   make[3]: *** Waiting for unfinished jobs....
>     INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/help.h
>     INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/pager.h
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/pager.o
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/parse-options.o
>     INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/parse-options.h
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/run-command.o
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/sigchain.o
>     CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/subcmd-config.o
>     INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/run-command.h
>
> The libsubcmd header files need to be installed before any of the
> objtool files gets compiled, so objtool-in.o needs a dependency on
> $(LIBSUBCMD).  I'll fold in the following fix:

Right, sorry for that. We fix this elsewhere (not just in perf) with a
phony target called "prepare":
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/perf/Makefile.perf?h=perf/core#n672
The prepare target has a list of dependencies that must be built
first, such as installing header files.

Thanks and apologies again,
Ian

> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index bbf8ec440430..1e90dad0b23b 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -61,7 +61,7 @@ export BUILD_ORC
>  export srctree OUTPUT CFLAGS SRCARCH AWK
>  include $(srctree)/tools/build/Makefile.include
>
> -$(OBJTOOL_IN): fixdep FORCE
> +$(OBJTOOL_IN): fixdep $(LIBSUBCMD) FORCE
>         $(Q)$(CONFIG_SHELL) ./sync-check.sh
>         $(Q)$(MAKE) $(build)=objtool $(HOST_OVERRIDES) CFLAGS="$(OBJTOOL_CFLAGS)" \
>                 LDFLAGS="$(OBJTOOL_LDFLAGS)"
>
