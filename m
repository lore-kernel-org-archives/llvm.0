Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959C6510E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:26:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bu29so15485519lfb.0
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BEvIcItzwI7AbO5vcVLAT6Szyh3SVhaIHzst9Wi8ht0=;
        b=ChBd8tt/A1LasVJpzsSL146qUJoEGjcxAawxw2u0GKWIKHWEmrKnsfAT6X3iI9Myc+
         a1UwTQYljtKjwdAWgYXCQKfnysaVL/ryd0IxtNx6/LX4dexWZ4bAOHVyXWRhMiLvUerg
         RwUz1vPZUfL8zNO4Hy0IwizRwPzTa0roqq1DPe+ytfA3Fbtq5JXBRCWUYmriHeU9nFis
         ZmExuWdV0RsqzCPtnysBnHXZMJt0P2clx855Smm5PtYo8Atw/ka5wQMkWCYaHpaxbtOf
         I2kkjBH9htr2fZ4G7+3Gidk7Hw68O135HQA7L5zwL3ubg7An1fugHBVSbPW+5kbexZJE
         0nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BEvIcItzwI7AbO5vcVLAT6Szyh3SVhaIHzst9Wi8ht0=;
        b=4aqyg93d1C+5qDzpj+iQ29+l598XdoU7NfLi2gKbJKcRN5FTQaIW91pDI7le5KgxBy
         R0zVZDoirz5vUvqXm6lu+IJIAaWmuSiR82p+xhzP5nYy+ftHZ8kCJeUOtdAk1YsT2S/k
         W0i83Ea6Xo6jMZNNASNs8lTnbTTw3ut7mF3A38CO9TM9GhQLGPo+ENnU3mqdUNw15m5n
         yvHZQGc7QCFMJVCBYrOrtVqR6vYM1sTzx96GO85ZH8dBQm+E22+sP05wQ+F+xiDu4c9E
         2C3q6KPRHFklRtbG7TCwNDGaa+yXhDtyrsJZ4ltBMKmkiVNSQKnegypotUSlEtErEga7
         9C7A==
X-Gm-Message-State: AOAM531af/roig01Y0SyD1SFM3++nWEdYsjmJ3SEZ5nU2Yw8vHuKQoRu
	zvKWFwarzwUaI0IQXtewi5U8jnb2ppqnNOjTlrCQ+sAEDnP0pzu2
X-Google-Smtp-Source: ABdhPJyxHHom+Te5JPNVVmMmZgxUny013AKSlGj9fZudGfTq1qDb7BPPzRNtYCimG0xRyMqK4inYQimRbxIL4K2F2RM=
X-Received: by 2002:ac2:5feb:0:b0:448:2707:6bfd with SMTP id
 s11-20020ac25feb000000b0044827076bfdmr6951438lfg.380.1647628003319; Fri, 18
 Mar 2022 11:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203110903.3xDyTUVl-lkp@intel.com> <20220310210404.7c47aa47@gandalf.local.home>
In-Reply-To: <20220310210404.7c47aa47@gandalf.local.home>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Mar 2022 11:26:31 -0700
Message-ID: <CAKwvOdnpAO88j6Ww9BkDsTib6jBYOCBvd3bd9eQ3ZCj76ydsfQ@mail.gmail.com>
Subject: Re: [linux-next:master 4103/11953] arch/arm/kernel/ftrace.c:229:6:
 warning: no previous prototype for function 'prepare_ftrace_return'
To: Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

, , On Thu, Mar 10, 2022 at 6:04 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 11 Mar 2022 09:44:11 +0800
> kernel test robot <lkp@intel.com> wrote:
>
> > Hi Ard,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   71941773e143369a73c9c4a3b62fbb60736a1182
> > commit: 41918ec82eb6f80c8b401422f27ca76c85aa0cb7 [4103/11953] ARM: ftrace: enable the graph tracer with the EABI unwinder
> > config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20220311/202203110903.3xDyTUVl-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=41918ec82eb6f80c8b401422f27ca76c85aa0cb7
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 41918ec82eb6f80c8b401422f27ca76c85aa0cb7
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arch/arm/kernel/ftrace.c:229:6: warning: no previous prototype for function 'prepare_ftrace_return' [-Wmissing-prototypes]
> >    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
> >         ^
> >    arch/arm/kernel/ftrace.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
> >    ^
> >    static
> >    1 warning generated.
> >
>
> Hmm, this is only called from assembly code, which doesn't care about
> prototypes. Is there a way to quiet this warning to say "this is called
> only by assembly"?
>
> Or do we just add a useless prototype to shut it up?

So this has come up a few times before, particularly around the usage
in the kernel of `asmlinkage`. This 0day report also only comes up for
W=1 builds, which enable -Wmissing-prototypes (see
scripts/Makefile.extrawarn).

The problem is that `asmlinkage` is not a language keyword; it's a
preprocessor define (see include/linux/linkage.h,
arch/ia64/include/asm/linkage.h, arch/x86/include/asm/linkage.h), so
the compiler has no idea that this function is only called from
assembly only. The warning is meant to catch implicit defines
(-Wimplicit-function-declaration) where the signature the caller is
expecting doesn't match the callee's actual definition (because the
callee wasn't declared in a shared header).

I think IF we had a function attribute added to the compiler that
disabled -Wmissing-prototype warnings just for that definition, then
we could do something like:

#define asmlinkage CPP_ASMLINKAGE \
  __attribute__((no_wmissing_prototypes,error( \
  "Called an asmlinkage function from C; remove " \
  "asmlinkage or dont call this fn"))

or something.  We wouldn't be able to always enable
-Wmissing-prototypes until we had such an fn attr though, due to cases
like this. I think -Wmissing-prototypes is still worthwhile, and that
Arnd previously mentioned interest in this warning.

For now, I think it's worth forward declaring the function, in the .c
file (rather than a header) with a comment that this is expected to be
called from asm only. If that ever changes, then the declaration can
be moved to a header.
-- 
Thanks,
~Nick Desaulniers
