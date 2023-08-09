Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D81AA83;
	Wed,  9 Aug 2023 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691603331; x=1723139331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FSDQVji1xABO9IEkRawkeJz7reVCHJK8vYRjGzlpN0=;
  b=Yx+/uWn8OrOLu/nGSEr+k23MbrObxOAdoWspeJAjNDjAbollti6qEhT2
   LHuEo6b80SEuCGleVZVpPD0xezuOdp83BYYpjiuIBO5LRY0fwucf8zemW
   ByGVJGZcQ3prygsNLInrd+GqdC4lnQYGYk/tL+cmZwRzyZFk5ztdLjWfC
   zYh5nkH2IrnVvI9knQnGcStrQ/qJp4fleJ0rXyTAtbEz9uKrEk8vl0k8n
   MpS61QPCdQv7wHtjnNHgUbncF2+KEQPAajSS9Fr3WDM2AGkIgLBNzc935
   alfUmUY98tByIuaahLspZ40uoYtKIycZx1GHnUj9+l1MiuD4yLwlwfYxy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361321228"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361321228"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 10:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="766923798"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="766923798"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2023 10:48:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTnIW-0006Ia-1H;
	Wed, 09 Aug 2023 17:48:40 +0000
Date: Thu, 10 Aug 2023 01:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs.tmpfs 17/19] mm/shmem.c:1262:36: warning: variable
 'freed' is used uninitialized whenever '?:' condition is false
Message-ID: <202308100156.k9Am1eAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.tmpfs
head:   0e83f68294d865ae63db70041879673aa3209cbb
commit: 0d0fe11e86e1a005db49d5c59cf9d1c83777f857 [17/19] tmpfs,xattr: enable limited user extended attributes
config: x86_64-randconfig-r015-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100156.k9Am1eAy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100156.k9Am1eAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100156.k9Am1eAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:1262:36: warning: variable 'freed' is used uninitialized whenever '?:' condition is false [-Wsometimes-uninitialized]
           simple_xattrs_free(&info->xattrs, sbinfo->max_inodes ? &freed : NULL);
                                             ^~~~~~~~~~~~~~~~~~
   mm/shmem.c:1263:32: note: uninitialized use occurs here
           shmem_free_inode(inode->i_sb, freed);
                                         ^~~~~
   mm/shmem.c:1262:36: note: remove the '?:' if its condition is always true
           simple_xattrs_free(&info->xattrs, sbinfo->max_inodes ? &freed : NULL);
                                             ^~~~~~~~~~~~~~~~~~~~~      ~~~~~~~
   mm/shmem.c:1235:14: note: initialize the variable 'freed' to silence this warning
           size_t freed;
                       ^
                        = 0
   1 warning generated.


vim +1262 mm/shmem.c

  1230	
  1231	static void shmem_evict_inode(struct inode *inode)
  1232	{
  1233		struct shmem_inode_info *info = SHMEM_I(inode);
  1234		struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
  1235		size_t freed;
  1236	
  1237		if (shmem_mapping(inode->i_mapping)) {
  1238			shmem_unacct_size(info->flags, inode->i_size);
  1239			inode->i_size = 0;
  1240			mapping_set_exiting(inode->i_mapping);
  1241			shmem_truncate_range(inode, 0, (loff_t)-1);
  1242			if (!list_empty(&info->shrinklist)) {
  1243				spin_lock(&sbinfo->shrinklist_lock);
  1244				if (!list_empty(&info->shrinklist)) {
  1245					list_del_init(&info->shrinklist);
  1246					sbinfo->shrinklist_len--;
  1247				}
  1248				spin_unlock(&sbinfo->shrinklist_lock);
  1249			}
  1250			while (!list_empty(&info->swaplist)) {
  1251				/* Wait while shmem_unuse() is scanning this inode... */
  1252				wait_var_event(&info->stop_eviction,
  1253					       !atomic_read(&info->stop_eviction));
  1254				mutex_lock(&shmem_swaplist_mutex);
  1255				/* ...but beware of the race if we peeked too early */
  1256				if (!atomic_read(&info->stop_eviction))
  1257					list_del_init(&info->swaplist);
  1258				mutex_unlock(&shmem_swaplist_mutex);
  1259			}
  1260		}
  1261	
> 1262		simple_xattrs_free(&info->xattrs, sbinfo->max_inodes ? &freed : NULL);
  1263		shmem_free_inode(inode->i_sb, freed);
  1264		WARN_ON(inode->i_blocks);
  1265		clear_inode(inode);
  1266	#ifdef CONFIG_TMPFS_QUOTA
  1267		dquot_free_inode(inode);
  1268		dquot_drop(inode);
  1269	#endif
  1270	}
  1271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
