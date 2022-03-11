Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C47E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 02:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA5BC340E8;
	Fri, 11 Mar 2022 02:04:05 +0000 (UTC)
Date: Thu, 10 Mar 2022 21:04:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 4103/11953] arch/arm/kernel/ftrace.c:229:6:
 warning: no previous prototype for function 'prepare_ftrace_return'
Message-ID: <20220310210404.7c47aa47@gandalf.local.home>
In-Reply-To: <202203110903.3xDyTUVl-lkp@intel.com>
References: <202203110903.3xDyTUVl-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Mar 2022 09:44:11 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ard,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   71941773e143369a73c9c4a3b62fbb60736a1182
> commit: 41918ec82eb6f80c8b401422f27ca76c85aa0cb7 [4103/11953] ARM: ftrace: enable the graph tracer with the EABI unwinder
> config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20220311/202203110903.3xDyTUVl-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/arm/kernel/ftrace.c:229:6: warning: no previous prototype for function 'prepare_ftrace_return' [-Wmissing-prototypes]  
>    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>         ^
>    arch/arm/kernel/ftrace.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>    ^
>    static 
>    1 warning generated.
> 

Hmm, this is only called from assembly code, which doesn't care about
prototypes. Is there a way to quiet this warning to say "this is called
only by assembly"?

Or do we just add a useless prototype to shut it up?

-- Steve


> 
> vim +/prepare_ftrace_return +229 arch/arm/kernel/ftrace.c
> 
> 376cfa8730c08c Tim Bird                2010-10-09  226  
> 376cfa8730c08c Tim Bird                2010-10-09  227  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  228  asmlinkage
> 376cfa8730c08c Tim Bird                2010-10-09 @229  void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  230  			   unsigned long frame_pointer,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  231  			   unsigned long stack_pointer)
> 376cfa8730c08c Tim Bird                2010-10-09  232  {
> 376cfa8730c08c Tim Bird                2010-10-09  233  	unsigned long return_hooker = (unsigned long) &return_to_handler;
> 376cfa8730c08c Tim Bird                2010-10-09  234  	unsigned long old;
> 376cfa8730c08c Tim Bird                2010-10-09  235  
> 376cfa8730c08c Tim Bird                2010-10-09  236  	if (unlikely(atomic_read(&current->tracing_graph_pause)))
> 376cfa8730c08c Tim Bird                2010-10-09  237  		return;
> 376cfa8730c08c Tim Bird                2010-10-09  238  
> 953f534a7ed6b7 Ard Biesheuvel          2022-01-25  239  	if (IS_ENABLED(CONFIG_UNWINDER_FRAME_POINTER)) {
> 953f534a7ed6b7 Ard Biesheuvel          2022-01-25  240  		/* FP points one word below parent's top of stack */
> 953f534a7ed6b7 Ard Biesheuvel          2022-01-25  241  		frame_pointer += 4;
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  242  	} else {
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  243  		struct stackframe frame = {
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  244  			.fp = frame_pointer,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  245  			.sp = stack_pointer,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  246  			.lr = self_addr,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  247  			.pc = self_addr,
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  248  		};
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  249  		if (unwind_frame(&frame) < 0)
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  250  			return;
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  251  		if (frame.lr != self_addr)
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  252  			parent = frame.lr_addr;
> 41918ec82eb6f8 Ard Biesheuvel          2022-01-25  253  		frame_pointer = frame.sp;
> 953f534a7ed6b7 Ard Biesheuvel          2022-01-25  254  	}
> 953f534a7ed6b7 Ard Biesheuvel          2022-01-25  255  
> 376cfa8730c08c Tim Bird                2010-10-09  256  	old = *parent;
> 376cfa8730c08c Tim Bird                2010-10-09  257  	*parent = return_hooker;
> 376cfa8730c08c Tim Bird                2010-10-09  258  
> f1f5b14afd7cce Steven Rostedt (VMware  2018-11-18  259) 	if (function_graph_enter(old, self_addr, frame_pointer, NULL))
> 376cfa8730c08c Tim Bird                2010-10-09  260  		*parent = old;
> 376cfa8730c08c Tim Bird                2010-10-09  261  }
> dd686eb13959e4 Rabin Vincent           2010-11-06  262  
> 
> :::::: The code at line 229 was first introduced by commit
> :::::: 376cfa8730c08c0394d0aa1d4a80fd8c9971f323 ARM: ftrace: function graph tracer support
> 
> :::::: TO: Tim Bird <tim.bird@am.sony.com>
> :::::: CC: Rabin Vincent <rabin@rab.in>
> 
> ---
> 0-DAY CI Kernel Test Service
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

