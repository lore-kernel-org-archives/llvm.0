Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E763E;
	Tue, 11 Jul 2023 06:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689056274; x=1720592274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UXh/vlGSMd70kbcBcJcWp5a4BF1Qp243Ed1WK+j7Ehk=;
  b=OqSqr9c0vftN8b4Ant0OwhTAomgg1EcEUZnvQOgCHWPyYb3+Om3nwld/
   ceEiGvvj1F8yz025M+rJtf2i6qFl5k8XQRBLRIb4+wEEHrR7F+VGnPYKM
   dVzepNS9slxOLlQc1sm6YVkpoCRKta1dyO8itK+AaL0FQv0z/YEto2sZt
   HRYEpdQI7XBn+eJah3OK+D6aTwiqLnUJKc+R8zhqBQISwMu1iSTclwhqf
   Ggwda9foS2/DI70J+1neBAkdecekgYnf+v8E4dMo6hKzWW2iQZf9AMTnR
   Fd0Mj9+hMSHNELhhBbOR1UDo8JRYvJWXL1TMKRaqkmVtfIkLRZR5kBH0l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344134408"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344134408"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720959094"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="720959094"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 23:17:45 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6gy-0004O9-1U;
	Tue, 11 Jul 2023 06:17:44 +0000
Date: Tue, 11 Jul 2023 14:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/rfc/eventfs 28/28] fs/tracefs/event_inode.c:236:6:
 warning: unused variable 'idx'
Message-ID: <202307111443.bdoaMUxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/rfc/eventfs
head:   1dc48374bb8ad8aec6d7244267f9b36e0512d3bb
commit: 1dc48374bb8ad8aec6d7244267f9b36e0512d3bb [28/28] tracefs: Add RCU and global mutex for eventfs
config: i386-randconfig-i012-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111443.bdoaMUxJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111443.bdoaMUxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111443.bdoaMUxJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:236:6: warning: unused variable 'idx' [-Wunused-variable]
           int idx;
               ^
   fs/tracefs/event_inode.c:108:23: warning: unused function 'eventfs_create_file' [-Wunused-function]
   static struct dentry *eventfs_create_file(const char *name, umode_t mode,
                         ^
   fs/tracefs/event_inode.c:184:23: warning: unused function 'eventfs_create_dir' [-Wunused-function]
   static struct dentry *eventfs_create_dir(const char *name, umode_t mode,
                         ^
   3 warnings generated.


vim +/idx +236 fs/tracefs/event_inode.c

   225	
   226	/**
   227	 * eventfs_post_create_dir - post create dir routine
   228	 * @ef: eventfs_file of recently created dir
   229	 *
   230	 * Files with-in eventfs dir should know dentry of parent dir
   231	 */
   232	static void eventfs_post_create_dir(struct eventfs_file *ef)
   233	{
   234		struct eventfs_file *ef_child;
   235		struct tracefs_inode *ti;
 > 236		int idx;
   237	
   238		/* srcu lock already held */
   239		/* fill parent-child relation */
   240		list_for_each_entry_srcu(ef_child, &ef->ei->e_top_files, list,
   241					 srcu_read_lock_held(&eventfs_srcu)) {
   242			ef_child->d_parent = ef->dentry;
   243		}
   244	
   245		ti = get_tracefs(ef->dentry->d_inode);
   246		ti->private = ef->ei;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
