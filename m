Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A41386;
	Fri,  9 Jun 2023 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686278893; x=1717814893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zk4MeersJKvKaqXTrY2MhA1hQ8fr0CQ2nEZP55L+Ai0=;
  b=fhLSo6UQzKkkkMdMU7NF/haBVHywmwpSUiuCwbSi/JYwNRk8GbI4K3lp
   YCZTmKHk7TCmVBYxRdxbi1Y7Ahe6+qCMGtbMPJPimU2D6PAseDGlpuG3z
   Z0TvWV2wvNwHNwUgPNKp4SODD5TDORHRSU8+bdTEGyRVz9S4/gxoyqJQA
   DJKKFtxcR2HkVG21Ifvi1g5b7CGWYJE4R9M3+AW0BFRS7VMk/a7E44xS2
   V+BnHXOiNF9pcOiYRFxm7DzHXQme8i/4Mc3dXx11zh8e4NROTlnFfnSS8
   AuCpdkTsSZtDuc6B7E1dHZHsx5VKVAWb24p6keeWYcbvYUjTLTzCVdxtE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385848687"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="385848687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740003197"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="740003197"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2023 19:48:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SAZ-0008XX-0Q;
	Fri, 09 Jun 2023 02:48:07 +0000
Date: Fri, 9 Jun 2023 10:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma_v4 6/7] kernel/bpf/memalloc.c:340:26: warning: unused
 variable 'batch'
Message-ID: <202306091027.SSx9CKaB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git ma_v4
head:   86c9deee3b8263f7546b8bad1e1a8d9662503ded
commit: 45acfe8484365cc1aa89e3d676697ce69ff4169b [6/7] hack 3
config: x86_64-randconfig-r021-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091027.SSx9CKaB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=45acfe8484365cc1aa89e3d676697ce69ff4169b
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf ma_v4
        git checkout 45acfe8484365cc1aa89e3d676697ce69ff4169b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/bpf/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091027.SSx9CKaB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/memalloc.c:307:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
           int cnt;
               ^
   kernel/bpf/memalloc.c:327:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
           int cnt;
               ^
>> kernel/bpf/memalloc.c:340:26: warning: unused variable 'batch' [-Wunused-variable]
           struct bpf_reuse_batch *batch;
                                   ^
   kernel/bpf/memalloc.c:323:13: warning: unused function 'bpf_ma_reuse_tt_cb' [-Wunused-function]
   static void bpf_ma_reuse_tt_cb(struct rcu_head *rcu)
               ^
   4 warnings generated.


vim +/batch +340 kernel/bpf/memalloc.c

   334	
   335	
   336	static void bpf_ma_add_to_reuse_ready_or_free(struct bpf_mem_cache *c)
   337	{
   338		struct bpf_mem_shared_cache *sc = c->sc;
   339		struct llist_node *head, *tail;
 > 340		struct bpf_reuse_batch *batch;
   341		unsigned long flags;
   342	
   343		/* Draining could be running concurrently with reuse_rcu() */
   344		raw_spin_lock_irqsave(&c->lock, flags);
   345		head = __llist_del_all(&c->waiting_for_gp);
   346		tail = c->waiting_for_gp_tail;
   347		c->waiting_for_gp_tail = NULL;
   348		raw_spin_unlock_irqrestore(&c->lock, flags);
   349		/* Draining is in progress ? */
   350		if (!head)
   351			return;
   352	
   353		if (llist_empty(&c->reuse_ready_head))
   354			c->reuse_ready_tail = tail;
   355		__llist_add_batch(head, tail, &c->reuse_ready_head);
   356	
   357		/* Don't move these objects to reuse_ready list and free
   358		 * these objects directly.
   359		 */
   360	/*	if (sc->direct_free) {
   361			free_all(head, sc->percpu);
   362			return;
   363		}*/
   364	/*		local_irq_save(flags);
   365			rcu_momentary_dyntick_idle();
   366			local_irq_restore(flags);*/
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
