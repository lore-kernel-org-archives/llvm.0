Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EE205143;
	Tue, 29 Oct 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209206; cv=none; b=DqtRWUDA4D4uazJniOZZN1zIV0KcaPAN8giK4p3tie3NG01vl/HIIu+7z7GDqXfGLpNeIzlV67ypicZuRCbr5C1O/rdP72oQO5vhFvW98JuHqfnAV06/KrJgqylch7GQnsmvfAFteqPuL6odvK5k/ta8wcfpXO60lnDVVhFHjJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209206; c=relaxed/simple;
	bh=RLccjtGN6LQZ2jfU2IbKJ1CDWSv+GSrEh8oSn1igHtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eC/Er2pzyMijrFWZEuocsyVRhsbsZ4n+/6mk2vKBe49seLepQVLp8YBNY50cADiojUBtTFPo6Z/Jo8EbS2ij2QqbCLyMb2G1zQhJ7/A0c7J90mr1azIoYDgIdAWUMvdsN+O+EaoGQrLYHqGvpNAqAxZf4NakIxxSIQVfub5rMZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgcg8p29; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgcg8p29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730209203; x=1761745203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RLccjtGN6LQZ2jfU2IbKJ1CDWSv+GSrEh8oSn1igHtA=;
  b=Sgcg8p29Cj0DlnsCQZQ4t/u0tEG5HYRLgYeDXQSJj9S9ndHUI/Vps24r
   9DUEmavGd++JMG5mf9U8C/t9G+BEvdEfgRqJfpXc4h3PpDH8XU/LMO7A2
   /zbFUSVUwJLOm5ZZRgdciXAtvcMpe0VlIPm3i0Ft8+OAQEtuzXm6w2oaP
   llPiA0WE+fdzlMmN0VHTX53Q+p+Dj9CsmVFZghwlPMRagl9eUuCkee1A/
   1iKDk9V4LEnyDkyJuy9wL4GijFnHmOzCvp/lKcI+PoPqs9cWYZyKqsWFy
   8E1CXqkruB5zt8bfX0dOoQjTjcftJF2yIvkympbujNAtAuMSC98b0KEtr
   A==;
X-CSE-ConnectionGUID: uMR2xikZSx6nSOexlVV9Xg==
X-CSE-MsgGUID: itaqFQIjT4eZ3Yi7V1mCkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30058406"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="30058406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 06:40:02 -0700
X-CSE-ConnectionGUID: 4fjVn0pnRjWCyQDNU3q9lw==
X-CSE-MsgGUID: aP17PQGYSp+s4wzmIg7r1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86577909"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2024 06:40:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5mRz-000di8-0H;
	Tue, 29 Oct 2024 13:39:59 +0000
Date: Tue, 29 Oct 2024 21:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.10.27b 30/35]
 include/linux/rcupdate_wait.h:73:31: error: no member named 'rcu_node_entry'
 in 'struct task_struct'
Message-ID: <202410292150.GUBegikc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.10.27b
head:   452a4107123b99087cd0bed226f61436ca9fdd24
commit: 0074845ef7cfbfe41a72bf5561edc18b90b67504 [30/35] rcutorture: Check preemption for failing reader
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241029/202410292150.GUBegikc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292150.GUBegikc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292150.GUBegikc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:41:
>> include/linux/rcupdate_wait.h:73:31: error: no member named 'rcu_node_entry' in 'struct task_struct'
      73 |                 return list_empty(&current->rcu_node_entry);
         |                                    ~~~~~~~  ^
   In file included from kernel/rcu/update.c:42:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.
--
   In file included from kernel/rcu/srcutiny.c:14:
>> include/linux/rcupdate_wait.h:73:31: error: no member named 'rcu_node_entry' in 'struct task_struct'
      73 |                 return list_empty(&current->rcu_node_entry);
         |                                    ~~~~~~~  ^
   1 error generated.
--
   In file included from kernel/rcu/tiny.c:15:
>> include/linux/rcupdate_wait.h:73:31: error: no member named 'rcu_node_entry' in 'struct task_struct'
      73 |                 return list_empty(&current->rcu_node_entry);
         |                                    ~~~~~~~  ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/rcu/tiny.c:26:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:


vim +73 include/linux/rcupdate_wait.h

    67	
    68	// Has the current task blocked within its current RCU read-side
    69	// critical section?
    70	static inline bool has_rcu_reader_blocked(void)
    71	{
    72		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
  > 73			return list_empty(&current->rcu_node_entry);
    74		else
    75			return false;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
