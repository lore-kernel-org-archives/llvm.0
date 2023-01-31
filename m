Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BBD7E
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 00:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C0C433D2;
	Tue, 31 Jan 2023 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675124743;
	bh=Uvc+c3OecTe9ksO/MhCI2O+EfNbHeAK0lEoiR5lvV+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=km9C+wolruO6DDNeBsRE+4N7oUIFQougyN9tAKtQiR1n102NBS5KhbaVeuFZNimfY
	 jxTqktNNR3DIuK/ih38VLoNvGwtfYuZYaN19I2nhnPe1DmJU2a74EmxYE0aAnNC5Rx
	 R9MP2KUiq/G1sLMfGcilA2snN1qhBCey1ztw38iOWVgCNxB7ILeE+SESx9E3NNEJDJ
	 UvK+JTj+oqyalcpX5wrI5XTIbRFMX3zXXyxHo66kYuEkWnpOvMqhg9nz9K1VQ1ScN1
	 E6YHTzC4snreTCrdHUlyQFwWKfb238/F2uiGehcOymYnEkaRTARHiubjoD5YwmBCzU
	 DhTCKceizYNiA==
Date: Mon, 30 Jan 2023 16:25:41 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>,
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 0/3] objtool build improvements
Message-ID: <20230131002541.t32dgtfoovlmf23t@treble>
References: <20230126190606.40739-1-irogers@google.com>
 <20230126193426.gu5vc3awe4kdmx2p@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126193426.gu5vc3awe4kdmx2p@treble>

On Thu, Jan 26, 2023 at 11:34:28AM -0800, Josh Poimboeuf wrote:
> On Thu, Jan 26, 2023 at 11:06:03AM -0800, Ian Rogers wrote:
> > Install libsubcmd and then get headers from there, this avoids
> > inadvertent dependencies on things in tools/lib. Fix V=1
> > support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> > being set for say gcc, and then CC being overridden to clang.
> > 
> > v4. Rebase and look to address review comments from Josh Poimboeuf
> >     <jpoimboe@kernel.org>. Removes the reviewed-by/tested-by given
> >     the scope of changes.
> > v3. Is a rebase that removes the merged "tools lib subcmd: Add install
> >     target" patch. In:
> > https://lore.kernel.org/lkml/CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com/
> >     Nick rightly points out that:
> > WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> >     became:
> > WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> >     losing the EXTRA_WARNINGS which v3 now adds back in. Previous
> >     testing had added the warnings to the end rather than the
> >     beginning, thereby causing unexpected build issues that aren't present in v3.
> > v2. Include required "tools lib subcmd: Add install target" that is
> >     already in Arnaldo's tree:
> > https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
> >     When building libsubcmd.a from objtool's Makefile, clear the
> >     subdir to avoid it being appended onto OUTPUT and breaking the
> >     build.
> > 
> > Ian Rogers (3):
> >   objtool: Install libsubcmd in build
> >   objtool: Properly support make V=1
> >   objtool: Alter how HOSTCC is forced
> 
> Thanks, this looks pretty good.  I might tweak the patch subjects to
> describe what's being fixed from a user's perspective.
> 
> I'll wait a few days for any more reviews before merging.
> 
> Independently from this patch set, I discovered that HOSTCFLAGS (and
> KBUILD_HOSTCFLAGS which includes -O2 and some other flags) don't work
> when building objtool directly from tools/objtool.  But they do work
> (for me at least) when building from the top-level Makefile.  So I'm not
> sure what Nick's issue is.

The objtool build is failing intermittently with a clean output tree:

    HOSTCC  /home/jpoimboe/tmp/a/tools/objtool/fixdep.o
    HOSTLD  /home/jpoimboe/tmp/a/tools/objtool/fixdep-in.o
    LINK    /home/jpoimboe/tmp/a/tools/objtool/fixdep
    INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/exec-cmd.o
    MKDIR   /home/jpoimboe/tmp/a/tools/objtool/arch/x86/
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/help.o
    CC      /home/jpoimboe/tmp/a/tools/objtool/arch/x86/special.o
    HOSTLD  arch/x86/tools/relocs
  In file included from arch/x86/special.c:5:
  /home/jpoimboe/git/linux/tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
      8 | #include <subcmd/parse-options.h>
        |          ^~~~~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  make[5]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:97: /home/jpoimboe/tmp/a/tools/objtool/arch/x86/special.o] Error 1
  make[4]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:139: arch/x86] Error 2
  make[3]: *** [Makefile:66: /home/jpoimboe/tmp/a/tools/objtool/objtool-in.o] Error 2
  make[3]: *** Waiting for unfinished jobs....
    INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/help.h
    INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/pager.h
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/pager.o
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/parse-options.o
    INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/parse-options.h
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/run-command.o
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/sigchain.o
    CC      /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/subcmd-config.o
    INSTALL /home/jpoimboe/tmp/a/tools/objtool/libsubcmd/include/subcmd/run-command.h

The libsubcmd header files need to be installed before any of the
objtool files gets compiled, so objtool-in.o needs a dependency on
$(LIBSUBCMD).  I'll fold in the following fix:

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index bbf8ec440430..1e90dad0b23b 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -61,7 +61,7 @@ export BUILD_ORC
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
 
-$(OBJTOOL_IN): fixdep FORCE
+$(OBJTOOL_IN): fixdep $(LIBSUBCMD) FORCE
 	$(Q)$(CONFIG_SHELL) ./sync-check.sh
 	$(Q)$(MAKE) $(build)=objtool $(HOST_OVERRIDES) CFLAGS="$(OBJTOOL_CFLAGS)" \
 		LDFLAGS="$(OBJTOOL_LDFLAGS)"

