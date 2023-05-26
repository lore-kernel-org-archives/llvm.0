Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6F11C84;
	Fri, 26 May 2023 09:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1BCC4339B;
	Fri, 26 May 2023 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685094491;
	bh=cLxbSg+XqqVsWSq9nyUiacTmkj48Tj2ek03PRtbVxJM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pTlbvAFp15IpQc78BsTJsGCaOjcHUabJpdVvssTs3xS5BEhJreUTeS85HdEIoXZPJ
	 r8FapS4wAEssFHCDr5LRQzyj/2yDdW+Z47JKMpjowp0LLm+inWq6Zlq9o/OV8VISnv
	 yWEniSLOdqChDVJND54Dhf4PY573qYqNALcHKdBAYXURikCdMaooN6N6vR/KFXsrE8
	 0JoVWTx1OenrwTllyuc+3aTdNKmK95sAWXZfuNpErGMTYrQno265rGEkZvVS2o6/6m
	 PDx7OGBFyMR8YujMI+tO6uDEk1muaWHqOAoWKU8mwCaazHP0wtU38ZAw0kuRrUxw35
	 8eA/lCHGa03nQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A9085CE0CCF; Fri, 26 May 2023 02:48:06 -0700 (PDT)
Date: Fri, 26 May 2023 02:48:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:rcu/next 19/19] kernel/rcu/rcuscale.c:340:20:
 error: use of undeclared identifier 'get_rcu_tasks_trace_gp_kthread'; did
 you mean 'show_rcu_tasks_trace_gp_kthread'?
Message-ID: <17429c26-d279-43ec-a297-232bc6301bec@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202305190259.Rm6JC6Nz-lkp@intel.com>
 <e51237d6-5b10-424d-a0d3-afe8ee24f530@paulmck-laptop>
 <ZHBeg7SyMQnWJ5Gd@yujie-X299>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHBeg7SyMQnWJ5Gd@yujie-X299>

On Fri, May 26, 2023 at 03:23:47PM +0800, Yujie Liu wrote:
> Hi Paul,
> 
> On Thu, May 18, 2023 at 07:11:33PM -0700, Paul E. McKenney wrote:
> > On Fri, May 19, 2023 at 02:30:11AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/next
> > > head:   9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
> > > commit: 9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7 [19/19] rcuscale: Measure grace-period kthread CPU time
> > > config: x86_64-randconfig-a001
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
> > >         git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> > >         git fetch --no-tags paulmck-rcu rcu/next
> > >         git checkout 9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/rcu/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305190259.Rm6JC6Nz-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> kernel/rcu/rcuscale.c:340:20: error: use of undeclared identifier 'get_rcu_tasks_trace_gp_kthread'; did you mean 'show_rcu_tasks_trace_gp_kthread'?
> > >            .rso_gp_kthread = get_rcu_tasks_trace_gp_kthread,
> > >                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >                              show_rcu_tasks_trace_gp_kthread
> > >    kernel/rcu/rcu.h:642:20: note: 'show_rcu_tasks_trace_gp_kthread' declared here
> > >    static inline void show_rcu_tasks_trace_gp_kthread(void) {}
> > >                       ^
> > > >> kernel/rcu/rcuscale.c:340:20: error: incompatible function pointer types initializing 'struct task_struct *(*)(void)' with an expression of type 'void (void)' [-Werror,-Wincompatible-function-pointer-types]
> > >            .rso_gp_kthread = get_rcu_tasks_trace_gp_kthread,
> > >                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    2 errors generated.
> > 
> > Apologies for the hassle!  Does the diff below help at your end?
> 
> Sorry for the late reply. We noticed that rcu/next branch was respined
> and the diff below has been applied. We tested the new head commit
> 60901dadfadc ("rcuscale: Measure grace-period kthread CPU time")
> and the build error is gone. Thanks.
> 
> Tested-by: Yujie Liu <yujie.liu@intel.com>

Very good, thank you!  I will apply on my next rebase.


						Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
> > index 3a5a322939b6..eda493200663 100644
> > --- a/include/linux/rcupdate_trace.h
> > +++ b/include/linux/rcupdate_trace.h
> > @@ -87,9 +87,7 @@ static inline void rcu_read_unlock_trace(void)
> >  void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func);
> >  void synchronize_rcu_tasks_trace(void);
> >  void rcu_barrier_tasks_trace(void);
> > -# ifdef CONFIG_RCU_SCALE_TEST
> >  struct task_struct *get_rcu_tasks_trace_gp_kthread(void);
> > -# endif
> >  #else
> >  /*
> >   * The BPF JIT forms these addresses even when it doesn't call these
> > 
