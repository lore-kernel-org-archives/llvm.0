Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903D362;
	Fri, 19 May 2023 02:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1AAC433D2;
	Fri, 19 May 2023 02:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684462295;
	bh=rmHKqH8zxYo4eJ1ktNK0fLKbM+QLDQELMHv0JI70ggs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=M9Hb/wNDB1sy5CEJgylLQz3lLVIVULdi8EsR4lVxsACj46ZjbG5GrR6P+0qqeO9r2
	 VnGAz4BXy8MRBUsnm8l5NxcV7fE5Q5uJWCT/5mTLRehoshP26gpD98M4OKsKDQWrTd
	 iMbE6QbNWzTy5R7u9PpdSNdmJ8kblQsShCecAeDksUz/IbvgR3Bz6xV5U+5o6jTe26
	 K5gYAg8utNvyCtV7ImvgBSqVCBSRYc3xzOHci07e0WokfwdYD5qcX7Fd75H8o/TUGO
	 Xuqq3WOTr4x/O3taVPb71ibzkLacaHp3JZ65xBnBXPR5hX26VW6gf9mhM3w+uQG3lf
	 tXTpoCA2L5xIw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 064AFCE0CC0; Thu, 18 May 2023 19:11:33 -0700 (PDT)
Date: Thu, 18 May 2023 19:11:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:rcu/next 19/19] kernel/rcu/rcuscale.c:340:20:
 error: use of undeclared identifier 'get_rcu_tasks_trace_gp_kthread'; did
 you mean 'show_rcu_tasks_trace_gp_kthread'?
Message-ID: <e51237d6-5b10-424d-a0d3-afe8ee24f530@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202305190259.Rm6JC6Nz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305190259.Rm6JC6Nz-lkp@intel.com>

On Fri, May 19, 2023 at 02:30:11AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/next
> head:   9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
> commit: 9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7 [19/19] rcuscale: Measure grace-period kthread CPU time
> config: x86_64-randconfig-a001
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
>         git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
>         git fetch --no-tags paulmck-rcu rcu/next
>         git checkout 9bb839a83e1bbbfd4f7f20827aafd0a39fad00c7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/rcu/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305190259.Rm6JC6Nz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/rcu/rcuscale.c:340:20: error: use of undeclared identifier 'get_rcu_tasks_trace_gp_kthread'; did you mean 'show_rcu_tasks_trace_gp_kthread'?
>            .rso_gp_kthread = get_rcu_tasks_trace_gp_kthread,
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                              show_rcu_tasks_trace_gp_kthread
>    kernel/rcu/rcu.h:642:20: note: 'show_rcu_tasks_trace_gp_kthread' declared here
>    static inline void show_rcu_tasks_trace_gp_kthread(void) {}
>                       ^
> >> kernel/rcu/rcuscale.c:340:20: error: incompatible function pointer types initializing 'struct task_struct *(*)(void)' with an expression of type 'void (void)' [-Werror,-Wincompatible-function-pointer-types]
>            .rso_gp_kthread = get_rcu_tasks_trace_gp_kthread,
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 errors generated.

Apologies for the hassle!  Does the diff below help at your end?

						Thaxn, Paul

------------------------------------------------------------------------

diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index 3a5a322939b6..eda493200663 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -87,9 +87,7 @@ static inline void rcu_read_unlock_trace(void)
 void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func);
 void synchronize_rcu_tasks_trace(void);
 void rcu_barrier_tasks_trace(void);
-# ifdef CONFIG_RCU_SCALE_TEST
 struct task_struct *get_rcu_tasks_trace_gp_kthread(void);
-# endif
 #else
 /*
  * The BPF JIT forms these addresses even when it doesn't call these
