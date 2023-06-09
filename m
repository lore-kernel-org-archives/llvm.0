Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589215AC;
	Fri,  9 Jun 2023 05:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686287241; x=1717823241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MWbmVXhS4i/ZAWUz76C3ONgq5sfwuVXpO67rAsd2X7g=;
  b=aKASDDLevYAy/Eevv6zQGcp2hbpd4vLRwR0DET6itwXR1oXf+ORHe2Un
   c+BsiwtOtsjmjEHTY1FkyatVta3yMSHa/A1DQqteGF5LuRPcQvKN73M4P
   men9g5qx2zVVWwOjo9YfwljKP9ilKvqG+L0qJBlYRbTP/5p+glMrkseF3
   skVsB/5xEh96P63NT6CxbO2CUZrLvcdAlZdu/6dnoEA9+b8mU9LMtpzlY
   bfn88qDLQVEQ85z1q6xn6YCv2EP7O5PIa8GTY1svNaKLBVAmTLoTdX2jD
   bAarwWnUIFmehAH9u8q+BwhzPu+KXaI4zsUIo389SHt1cY/HM/2FBJAbH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="355008097"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="355008097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 22:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="687622533"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="687622533"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 22:07:18 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ULG-0008fJ-0s;
	Fri, 09 Jun 2023 05:07:18 +0000
Date: Fri, 9 Jun 2023 13:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma_v4 6/7] kernel/bpf/memalloc.c:452:3: error: call to
 undeclared function 'rcu_momentary_dyntick_idle2'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202306091327.L3WtXkPd-lkp@intel.com>
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
config: x86_64-randconfig-x064-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091327.L3WtXkPd-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091327.L3WtXkPd-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/memalloc.c:307:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
           int cnt;
               ^
   kernel/bpf/memalloc.c:327:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
           int cnt;
               ^
   kernel/bpf/memalloc.c:340:26: warning: unused variable 'batch' [-Wunused-variable]
           struct bpf_reuse_batch *batch;
                                   ^
>> kernel/bpf/memalloc.c:452:3: error: call to undeclared function 'rcu_momentary_dyntick_idle2'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   rcu_momentary_dyntick_idle2();
                   ^
   kernel/bpf/memalloc.c:452:3: note: did you mean 'rcu_momentary_dyntick_idle'?
   include/linux/rcutiny.h:159:20: note: 'rcu_momentary_dyntick_idle' declared here
   static inline void rcu_momentary_dyntick_idle(void) { }
                      ^
   3 warnings and 1 error generated.


vim +/rcu_momentary_dyntick_idle2 +452 kernel/bpf/memalloc.c

   417	
   418	static void reuse_bulk(struct bpf_mem_cache *c)
   419	{
   420		struct llist_node *head, *tail, *llnode, *tmp;
   421		unsigned long flags;
   422		struct bpf_reuse_batch *batch;
   423	
   424		if (IS_ENABLED(CONFIG_PREEMPT_RT))
   425			local_irq_save(flags);
   426		WARN_ON_ONCE(local_inc_return(&c->active) != 1);
   427		head = __llist_del_all(&c->prepare_reuse_head);
   428		tail = c->prepare_reuse_tail;
   429		c->prepare_reuse_tail = NULL;
   430		c->prepare_reuse_cnt = 0;
   431		local_dec(&c->active);
   432		if (IS_ENABLED(CONFIG_PREEMPT_RT))
   433			local_irq_restore(flags);
   434	
   435		llist_for_each_safe(llnode, tmp, llist_del_all(&c->free_llist_extra)) {
   436			if (!head)
   437				tail = llnode;
   438			llnode->next = head;
   439			head = llnode->next;
   440		}
   441		WARN_ON_ONCE(!head);
   442	
   443		/* bpf_mem_cache is a per-cpu object. Freeing happens in irq_work.
   444		 * Nothing races to add to free_by_rcu list.
   445		 */
   446		if (llist_empty(&c->free_by_rcu))
   447			c->free_by_rcu_tail = tail;
   448		__llist_add_batch(head, tail, &c->free_by_rcu);
   449	
   450		if (c->reuse_cb_in_progress >= 100 || 1) {
   451	//		local_irq_save(flags);
 > 452			rcu_momentary_dyntick_idle2();
   453	//		local_irq_restore(flags);
   454		}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
