Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056462C81
	for <llvm@lists.linux.dev>; Sun, 10 Oct 2021 09:37:02 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6702A60F8F;
	Sun, 10 Oct 2021 09:37:02 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <maz@kernel.org>)
	id 1mZVGO-00FpS2-7l; Sun, 10 Oct 2021 10:37:00 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 10 Oct 2021 10:37:00 +0100
From: Marc Zyngier <maz@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-arm-kernel@lists.infradead.org, Oliver Upton <oupton@google.com>, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [arm-platforms:timers/tval-ectomy 2/17]
 drivers/clocksource/arm_arch_timer.c:156:3: warning: variable 'val' is used
 uninitialized whenever switch default is taken
In-Reply-To: <202110100514.3h9CI4s0-lkp@intel.com>
References: <202110100514.3h9CI4s0-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d6e8064803598970b463da0e9bab116b@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lkp@intel.com, llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org, oupton@google.com, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-10-09 22:12, kernel test robot wrote:
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> timers/tval-ectomy
> head:   c815d60a6292c90ea228c635b4150f022322908b
> commit: 9c6e4aa680ebd5ad816fc8f97858ec6057362c9e [2/17]
> clocksource/arm_arch_timer: Drop CNT*_TVAL read accessors
> config: arm64-randconfig-r026-20211010 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project
> 30caca39f401ae17927439c0a0bd6d1b1916dd6a)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=9c6e4aa680ebd5ad816fc8f97858ec6057362c9e
>         git remote add arm-platforms
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>         git fetch --no-tags arm-platforms timers/tval-ectomy
>         git checkout 9c6e4aa680ebd5ad816fc8f97858ec6057362c9e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> ARCH=arm64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

This is *not* an issue, see below.

> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/clocksource/arm_arch_timer.c:156:3: warning: variable 'val' 
>>> is used uninitialized whenever switch default is taken 
>>> [-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    drivers/clocksource/arm_arch_timer.c:163:9: note: uninitialized use
> occurs here
>            return val;
>                   ^~~
>    drivers/clocksource/arm_arch_timer.c:147:3: warning: variable 'val'
> is used uninitialized whenever switch default is taken
> [-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    drivers/clocksource/arm_arch_timer.c:163:9: note: uninitialized use
> occurs here
>            return val;
>                   ^~~
>    drivers/clocksource/arm_arch_timer.c:139:9: note: initialize the
> variable 'val' to silence this warning
>            u32 val;
>                   ^
>                    = 0
>    2 warnings generated.
> 
> 
> vim +/val +156 drivers/clocksource/arm_arch_timer.c
> 
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  134
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  135  static __always_inline
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  136  u32
> arch_timer_reg_read(int access, enum arch_timer_reg reg,
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  137  			struct 
> clock_event_device *clk)
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  138  {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  139  	u32 val;
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  140
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  141  	if (access ==
> ARCH_TIMER_MEM_PHYS_ACCESS) {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  142  		struct arch_timer
> *timer = to_arch_timer(clk);
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  143  		switch (reg) {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  144  		case 
> ARCH_TIMER_REG_CTRL:
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  145  			val =
> readl_relaxed(timer->base + CNTP_CTL);
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  146  			break;
> 0bc2c9327c236c Marc Zyngier 2021-09-20  147  		default:
> 0bc2c9327c236c Marc Zyngier 2021-09-20  148  			BUILD_BUG();
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  149  		}
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  150  	} else if (access ==
> ARCH_TIMER_MEM_VIRT_ACCESS) {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  151  		struct arch_timer
> *timer = to_arch_timer(clk);
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  152  		switch (reg) {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  153  		case 
> ARCH_TIMER_REG_CTRL:
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  154  			val =
> readl_relaxed(timer->base + CNTV_CTL);
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  155  			break;
> 0bc2c9327c236c Marc Zyngier 2021-09-20 @156  		default:
> 0bc2c9327c236c Marc Zyngier 2021-09-20  157  			BUILD_BUG();

If you hit this case, which results in a compilation failure...

> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  158  		}
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  159  	} else {
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  160  		val =
> arch_timer_reg_read_cp15(access, reg);
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  161  	}
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  162
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  163  	return val;

... how can you return anything the first place?

> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  164  }
> f4e00a1a55c7f9 Marc Zyngier 2017-01-20  165

I think the problem squarely lies with the compiler (or the
way it interprets the BUILD_BUG helper). If it cannot see that
BUILD_BUG() trumps the control flow analysis, then this warning
is totally useless.

         M.
-- 
Jazz is not dead. It just smells funny...
