Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C23FDD
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 16:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB19FC004E1;
	Wed,  2 Mar 2022 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646239031;
	bh=fTcWHpOCu8RH+/HI9lSSjk0vIII7nNcazy/4c3rGrGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCH6dGs6eOpcHhbx9ETBTaXI08hkoMBQLrqcmi83FkP9n90nOq3JQs/8h48KDvjI6
	 IneZqLNkx65xeVmwnOrf2AeV8gQ2yz0A6T/THILV8MCo9AjDpe9b+fihPYaVAJ5/KT
	 zNiacZZMkxd6dqKJn3wmF8Rrk+7ntl/Brmyowa9fJ3Ndee84v8U4E082PFVKjhK+MD
	 A8ENds6Yk+ik1aGiromU+CMf9Z12qC1kyAcBflecFGf3KLKiZ6lZYHL10FXbzvUZwc
	 3DzWC181rbNtdQ6olMKZsKjTdtfB3qD5Od5RdRgy4h3LVXlCG9OuTgE7e6lK7WAOKs
	 ir8gzdl+AcHfA==
Date: Wed, 2 Mar 2022 09:37:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	keescook@chromium.org, samitolvanen@google.com,
	mark.rutland@arm.com, alyssa.milburn@intel.com, mbenes@suse.cz,
	rostedt@goodmis.org, mhiramat@kernel.org,
	alexei.starovoitov@gmail.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
Message-ID: <Yh+dMJsH+ZMPfqwD@thelio-3990X>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>

On Tue, Mar 01, 2022 at 01:16:04PM -0800, Nick Desaulniers wrote:
> On Thu, Feb 24, 2022 at 7:17 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Debian (and derived) distros ship their compilers as -$ver suffixed
> > binaries. For gcc it is sufficent to use:
> >
> >  $ make CC=gcc-12
> >
> > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > exactly right, leading to unweildy stuff like:
> >
> >  $ make CC=clang-13 LD=ld.lld-13 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> >
> > which is, quite franktly, totally insane and unusable. Instead make
> > the CC variable DTRT, enabling one such as myself to use:
> >
> >  $ make CC=clang-13
> >
> > This also lets one quickly test different clang versions.
> > Additionally, also support path based LLVM suites like:
> >
> >  $ make CC=/opt/llvm/bin/clang
> >
> > This changes the default to LLVM=1 when CC is clang, mixing toolchains
> 
> No, nack, we definitely do not want CC=clang to set LLVM=1. Those are
> distinctly two different things for testing JUST the compiler
> (CC=clang) vs the whole toolchain suite (LLVM=1). I do not wish to
> change the semantics of those, and only for LLVM.

I agree with this. CC is only changing the compiler, not any of the
other build utilities. CC=gcc-12 works for GCC because you are only
using a different compiler, not an entirely new toolchain (as binutils
will be the same as just CC=gcc).

> LLVM=1 means test clang, lld, llvm-objcopy, etc..
> CC=clang means test clang, bfd, GNU objcopy, etc..
> https://docs.kernel.org/kbuild/llvm.html#llvm-utilities
> 
> I don't wish to see the behavior of CC=clang change based on LLVM=0 being set.
> 
> > is still possible by explicitly adding LLVM=0.
> 
> Thanks for testing with LLVM, and even multiple versions of LLVM.
> 
> I'm still sympathetic, but only up to a point. A change like this MUST
> CC the kbuild AND LLVM maintainers AND respective lists though.  It
> also has little to do with the rest of the series.
> 
> As per our previous discussion
> https://lore.kernel.org/linux-kbuild/CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com/
> I'm still of the opionion that this should be solved by modifications
> (permanent or one off) to one's $PATH.

However, I think we could still address Peter's complaint of "there
should be an easier way for me to use the tools that are already in my
PATH" with his first iteration of this patch [1], which I feel is
totally reasonable:

$ make LLVM=-14

It is still easy to use (in fact, it is shorter than 'CC=clang-14') and
it does not change anything else about how we build with LLVM. We would
just have to add something along the lines of

"If your LLVM tools have a suffix like Debian's (clang-14, ld.lld-14,
etc.), use LLVM=<suffix>.

$ make LLVM=-14"

to Documentation/kbuild/llvm.rst.

I might change the patch not to be so clever though:

ifneq ($(LLVM),)
ifneq ($(LLVM),1)
LLVM_SFX := $(LLVM)
endif
endif

[1]: https://lore.kernel.org/r/YXqpFHeY26sEbort@hirez.programming.kicks-ass.net/

Cheers,
Nathan
