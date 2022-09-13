Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA2320D
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=74pJwgmlDg40/n5O1R1uLdF9aU0lb+NeGuF0ySj2foE=; b=OHJXK2ZqfjAkD3Z1/gScQjId4E
	2kWIGN27UK64UhkjUE6kh1gG4njMoMAU/reaYKvum8Dab19mLDcu3CYybAXHzfnyVw1XLM/7rtQkl
	REOtaavhgvn8DiuIg2N5MW8iVB3vHx8v6ZiVxrCxThiUqK5jIY7nR99OZPZLIZhp75uMxPIXo17aH
	xfHq89xVInWoQqeu3Wn+hvL1pj987OxU8jQXEXgOzPw7CgM0gwwnQBeXo/iozxMioQjZNNaIrQO4S
	C4jlTHEcoC1UI/NBJLOgqfOwwbO1IwAqwn0VgTHFzPPCqsZ9ySvFhX2zwGEfIDzRkuvqxeWKXaNA1
	VUhqHJzQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4G6-00C42B-Li; Tue, 13 Sep 2022 11:39:18 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F394C30030F;
	Tue, 13 Sep 2022 13:39:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D4BB3202CF467; Tue, 13 Sep 2022 13:39:17 +0200 (CEST)
Date: Tue, 13 Sep 2022 13:39:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tglx@linutronix.de, kbuild-all@lists.01.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [peterz-queue:call-depth-tracking 11/59] ld.lld: error:
 arch/x86/built-in.a(kvm.o at 12382) <inline asm>:48:149: expected newline
Message-ID: <YyBr5cjW4w4iDYgX@hirez.programming.kicks-ass.net>
References: <202209130503.22IT78Lt-lkp@intel.com>
 <YyBKngJE6M11bzrn@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyBKngJE6M11bzrn@dev-arch.thelio-3990X>

On Tue, Sep 13, 2022 at 02:17:18AM -0700, Nathan Chancellor wrote:
> + PeterZ, tglx
> 
> On Tue, Sep 13, 2022 at 05:26:43AM +0800, kernel test robot wrote:
> > CC: linux-kernel@vger.kernel.org
> > TO: Thomas Gleixner <tglx@linutronix.de>
> > CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git call-depth-tracking
> > head:   3a02739baf0302d9ba295686fc7a48fdd235ad15
> > commit: df1de0e0220ea824baf5ff3ef0993bb85fce0c7f [11/59] x86/paravirt: Properly align PV functions
> > config: i386-randconfig-a012-20220912
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=df1de0e0220ea824baf5ff3ef0993bb85fce0c7f
> >         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
> >         git fetch --no-tags peterz-queue call-depth-tracking
> >         git checkout df1de0e0220ea824baf5ff3ef0993bb85fce0c7f
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    error: expected newline
> >    .balign 4, 0x90_paravirt_nop:
> >    ^
> >    error: invalid hexadecimal floating-point constant: expected at least one exponent digit
> >    .balign 4, 0x90paravirt_ret0:
> >    ^
> >    error: expected newline
> >    .balign 4, 0x90_paravirt_nop:
> >    ^
> >    error: invalid hexadecimal floating-point constant: expected at least one exponent digit
> >    .balign 4, 0x90paravirt_ret0:
> >    ^
> > >> ld.lld: error: arch/x86/built-in.a(kvm.o at 12382) <inline asm>:48:149: expected newline
> >    .pushsection .text, "ax";.globl __raw_callee_save___kvm_vcpu_is_preempted;.type __raw_callee_save___kvm_vcpu_is_preempted, @function;.balign 4, 0x90__raw_callee_save___kvm_vcpu_is_preempted:push %ebp
> >    ^
> > --
> > >> LLVM ERROR: Size expression must be absolute.
> >    PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
> 
> I guess this would be the fix for all cases?

> -	    ASM_FUNC_ALIGN						\
> +	    ASM_FUNC_ALIGN ";"						\

I just pushed out a version that includes ';' in ASM_FUNC_ALIGN itself.

