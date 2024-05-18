Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4EBA29;
	Sat, 18 May 2024 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716064013; cv=none; b=P2XDDhPSt1n/UeBhjY8vUWnkNJISQWwIeOjqtbZ8MM7yrDt+qdVwPWAvcpDnOxwpRfnM0xj7h1cwFwThdBC8kFHmb149vsQz5RKWsxKe5nVdWllY5LkGc0YayP+dYFBVqahNFedci1uXNPiCT7dXbUhYI3H/igzgE89Ka1sh/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716064013; c=relaxed/simple;
	bh=637GpZAZ4L4Uim9whePJQ7NS7Kzeb076o75zbDczwzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qa/YODzEAu3TU49MwHu9Fnr1P7cEPUe3E2rD5GXPEdSjyitNuD2fhSShwECSvIhe++XuXYBelARqBiGMhdZ8hxWEFOby1aGe9+9Syqr5CFBMnLLWcbkfOx3y7GrP4yboCuG4/BSMhPK1CBaEjGVpr+fC8BvRzbWx8nI4HGM0dZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbotZ6cA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbotZ6cA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716064012; x=1747600012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=637GpZAZ4L4Uim9whePJQ7NS7Kzeb076o75zbDczwzU=;
  b=RbotZ6cAW76YCoq9GebvkuPinT3Zq1W0WMTX8MQYZkWSuzvKSbI08Sqo
   rxbTEGEzWRUL2Hu8u/NJyq5I/2a+Ska6H6LBMskX8ulszhYABqwpxlUE1
   0DO1Whbu5Mkac45PqY5TvZ0DZHr2rlGuLfdZKlNB39fCnWvrWCIgKIVqb
   BQCnBgHsYjDDS7TrJUiXZxIWN9jHK94/3swFpkxzZu/LF0ttXSkmUQwg4
   gv5JMi5tFerY0FI3Ioenm+AYhakRvJGb7OwS+UNzrpqM76hR3zs6ZioaA
   BKIPgR9ZcNTnsLBBH9ShukOE0VSXMLxegZFzKHe+kuSK6QYT7eFYfoGti
   Q==;
X-CSE-ConnectionGUID: Z7dT5bsOSAe+Nh4znoviLg==
X-CSE-MsgGUID: /jz6PORmRLmAB4D8bmUFkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12352304"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12352304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 13:26:51 -0700
X-CSE-ConnectionGUID: II8eXLegQRugpFRGYvbi8w==
X-CSE-MsgGUID: HZy1t4wEQlmLOjWsO3u5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="31969261"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2024 13:26:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Qdj-0002bE-1g;
	Sat, 18 May 2024 20:26:47 +0000
Date: Sun, 19 May 2024 04:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:inode-shrink 2/4] include/linux/fs.h:731:3: error: expected
 ';' after union
Message-ID: <202405190402.C2K6riIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git inode-shrink
head:   bef03a2e1b6b8265d0bda6eeed1bc5dfce1f1915
commit: 72a8424bf1c99226d40dda7fe7c8f3b542a53365 [2/4] fs: move i_generation into new hole created after timestamp conversion
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240519/202405190402.C2K6riIg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190402.C2K6riIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190402.C2K6riIg-lkp@intel.com/

Note: the jlayton/inode-shrink HEAD bef03a2e1b6b8265d0bda6eeed1bc5dfce1f1915 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1114:
   In file included from include/linux/huge_mm.h:8:
>> include/linux/fs.h:731:3: error: expected ';' after union
     731 |         }
         |          ^
         |          ;
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +731 include/linux/fs.h

   679	
   680		/* Misc */
   681		unsigned long		i_state;
   682		struct rw_semaphore	i_rwsem;
   683	
   684		unsigned long		dirtied_when;	/* jiffies of first dirtying */
   685		unsigned long		dirtied_time_when;
   686	
   687		struct hlist_node	i_hash;
   688		struct list_head	i_io_list;	/* backing dev IO list */
   689	#ifdef CONFIG_CGROUP_WRITEBACK
   690		struct bdi_writeback	*i_wb;		/* the associated cgroup wb */
   691	
   692		/* foreign inode detection, see wbc_detach_inode() */
   693		int			i_wb_frn_winner;
   694		u16			i_wb_frn_avg_time;
   695		u16			i_wb_frn_history;
   696	#endif
   697		struct list_head	i_lru;		/* inode LRU list */
   698		struct list_head	i_sb_list;
   699		struct list_head	i_wb_list;	/* backing dev writeback list */
   700		union {
   701			struct hlist_head	i_dentry;
   702			struct rcu_head		i_rcu;
   703		};
   704		atomic64_t		i_version;
   705		atomic64_t		i_sequence; /* see futex */
   706		atomic_t		i_count;
   707		atomic_t		i_dio_count;
   708		atomic_t		i_writecount;
   709	#if defined(CONFIG_IMA) || defined(CONFIG_FILE_LOCKING)
   710		atomic_t		i_readcount; /* struct files open RO */
   711	#endif
   712		union {
   713			const struct file_operations	*i_fop;	/* former ->i_op->default_file_ops */
   714			void (*free_inode)(struct inode *);
   715		};
   716		struct file_lock_context	*i_flctx;
   717		struct address_space	i_data;
   718		struct list_head	i_devices;
   719		union {
   720			struct pipe_inode_info	*i_pipe;
   721			struct cdev		*i_cdev;
   722			char			*i_link;
   723			unsigned		i_dir_seq;
   724		};
   725	
   726	
   727	#ifdef CONFIG_FSNOTIFY
   728		union {
   729			__u32			i_fsnotify_mask; /* all events this inode cares about */
   730			__u64			__i_fsnotify_mask_ext; /* for future expansion */
 > 731		}
   732		struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
   733	#endif
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
