Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207612E0C5;
	Thu, 15 Jun 2023 16:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1FC433CB;
	Thu, 15 Jun 2023 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686847568;
	bh=GsUBoRqU350gNkBM8pRmDRyyiYGNzjwJNQV3gsgh/2M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hL8L2VVQLM+vsiAn9bGdQlq/G5DlYK7zvQgKpKin9FPhHmTE+jX9Gat70BOEBp96m
	 httE99Z9HxVujucmJKczI7WP7B6uQKD22NbR6EvnRLyZxCSD7RuGjZsoAAYRm4/vwH
	 KOCxdCqzKbusGJv9MwFlfnqrUmQBvRti36T6o+gFrwxtCpP6Ka04razeyYlpgTM+KF
	 v+co/PT1z9RSuWzR12TJpGzX0Yqk7KdbXlIBLbdLmR+VjoEbuIxhpBmZlUGzM2U0rD
	 mtxgheemdmlOZ7K3J3LLRULxjHFPXclyZakNSc/fOX32HXFABSIzSP5B2cjjjDG+rA
	 /zIHoRlYGbvjg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 129D8CE09E0; Thu, 15 Jun 2023 09:46:08 -0700 (PDT)
Date: Thu, 15 Jun 2023 09:46:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7890/9793] kernel/rcu/rcuscale.c:301:20:
 error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean
 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <42d315e3-b01f-41f7-aff9-2e5763a3d489@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202306141920.TTvpsXwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306141920.TTvpsXwJ-lkp@intel.com>

On Wed, Jun 14, 2023 at 07:39:01PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b16049b21162bb649cdd8519642a35972b7910fe
> commit: df8fa2f1fc4c20cd300855a11b31ba5565f45ac6 [7890/9793] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
> config: arm-randconfig-r046-20230614 (https://download.01.org/0day-ci/archive/20230614/202306141920.TTvpsXwJ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=df8fa2f1fc4c20cd300855a11b31ba5565f45ac6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout df8fa2f1fc4c20cd300855a11b31ba5565f45ac6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306141920.TTvpsXwJ-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> kernel/rcu/rcuscale.c:301:20: error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean 'get_rcu_tasks_trace_gp_kthread'?
>      301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                           get_rcu_tasks_trace_gp_kthread
>    include/linux/rcupdate_trace.h:90:21: note: 'get_rcu_tasks_trace_gp_kthread' declared here
>       90 | struct task_struct *get_rcu_tasks_trace_gp_kthread(void);
>          |                     ^
>    1 error generated.
> --
>    In file included from kernel/rcu/update.c:649:
> >> kernel/rcu/tasks.h:1113:21: warning: no previous prototype for function 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
>     1113 | struct task_struct *get_rcu_tasks_gp_kthread(void)
>          |                     ^
>    kernel/rcu/tasks.h:1113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     1113 | struct task_struct *get_rcu_tasks_gp_kthread(void)
>          | ^
>          | static 
>    1 warning generated.

This should be fixed by these two commits in -rcu's "dev" branch:

df8fa2f1fc4c ("rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time")
	(Which replaced the commit tested.)
a88fd06db226 ("rcuscale: fix building with RCU_TINY")

Please let me know if there are still problems after these commits are
in place.

							Thanx, Paul

> vim +301 kernel/rcu/rcuscale.c
> 
>    289	
>    290	static struct rcu_scale_ops tasks_ops = {
>    291		.ptype		= RCU_TASKS_FLAVOR,
>    292		.init		= rcu_sync_scale_init,
>    293		.readlock	= tasks_scale_read_lock,
>    294		.readunlock	= tasks_scale_read_unlock,
>    295		.get_gp_seq	= rcu_no_completed,
>    296		.gp_diff	= rcu_seq_diff,
>    297		.async		= call_rcu_tasks,
>    298		.gp_barrier	= rcu_barrier_tasks,
>    299		.sync		= synchronize_rcu_tasks,
>    300		.exp_sync	= synchronize_rcu_tasks,
>  > 301		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
>    302		.name		= "tasks"
>    303	};
>    304	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
