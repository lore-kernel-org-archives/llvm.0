Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61247A53;
	Wed, 13 Mar 2024 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344696; cv=none; b=ZMzSAiw+uFF+1BS56ZdQt8t3BF8lCEwqMod7C4FajZLUuq3Er4EvvyZ7rhe6tJw53kQ+X40XpiyaFaKjhirh+t2E6XJYXm4c11zhHP2TZlnJmAXLnlN8ZxgXTXD6PYx0DgYruQoJfq8h/DAw9tCIx5GPZuZ7XV0ocOopvvhPtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344696; c=relaxed/simple;
	bh=DDEGfSzPRatadIYoLAbfc/cA7wvmzHFBjvPqfqNmlL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jI1fm6dQfM/e0MWnpZNMlXsAfkq7Tz4SAdkXzsRlNPNVtrIWpNfRB+IXBVE3bj53JluYm6KJgxkfGVJWuQF/KnMSMhQ6vERQVJhyLPnHTRSck0xC/3R0BLnSvSk1alMzmgT/Qf3EN2Cvt75cuujNyPqa/I5KGcgDeoG9HUkWFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMBlWqxy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMBlWqxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710344695; x=1741880695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDEGfSzPRatadIYoLAbfc/cA7wvmzHFBjvPqfqNmlL8=;
  b=FMBlWqxyKUeInvmLDM9dDIA6xOLBihoRAuZp7OqAj3Yq9dSBHbblwVJC
   hSPHgymh/NUkBNgIOhfooSfP/zpey/gsrUWY+lJ3rbLWIDABlCxNPZNpP
   uiKJQMEEvAGeYnnQ9lC92wcYohjuLKCreKTWtDZr9Kvn+V6A0PGFaBeVu
   opx3u6OK+eve/7gLLTvgUL4p+r82jquIRh97WnahOpu0OvRkndXPBHMow
   v53zHwU5a05JJjeBhg2NB3/tu8XT/wdtv50nSNALFPxicDD20wnhIvEPR
   QGQP52RWIKxkGb4F0VX27EkXFZP3pir7hoJsniHEcGI/3wCpog/ILG+A6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8937530"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8937530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 08:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11863385"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2024 08:44:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkQmg-000CU5-1a;
	Wed, 13 Mar 2024 15:44:50 +0000
Date: Wed, 13 Mar 2024 23:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 32/32] fs/nfs/dir.c:3016:55: warning: format
 specifies type 'unsigned int' but the argument has type 'unsigned long'
Message-ID: <202403132338.CWHUYS6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   4ec306101c72fc8541ddf40bd996f0cd289db377
commit: 244db11a7d6835249946adae4255d53cb0edf7f6 [32/32] DEBUG: more printks
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240313/202403132338.CWHUYS6y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132338.CWHUYS6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132338.CWHUYS6y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/dir.c:30:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/nfs/dir.c:3016:55: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
    3016 |                 trace_printk("%s: cache_validity=0x%x\n", __func__, nfsi->cache_validity);
         |                                                    ~~               ^~~~~~~~~~~~~~~~~~~~
         |                                                    %lx
   2 warnings generated.


vim +3016 fs/nfs/dir.c

  2996	
  2997	static int nfs_access_get_cached_locked(struct inode *inode, const struct cred *cred, u32 *mask, bool may_block)
  2998	{
  2999		struct nfs_inode *nfsi = NFS_I(inode);
  3000		u64 login_time = nfs_access_login_time(current, cred);
  3001		struct nfs_access_entry *cache;
  3002		bool retry = true;
  3003		int err;
  3004	
  3005		spin_lock(&inode->i_lock);
  3006		for(;;) {
  3007			if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
  3008				goto out_zap;
  3009			cache = nfs_access_search_rbtree(inode, cred);
  3010			err = -ENOENT;
  3011			if (cache == NULL)
  3012				goto out;
  3013			/* Found an entry, is our attribute cache valid? */
  3014			if (!nfs_check_cache_invalid(inode, NFS_INO_INVALID_ACCESS))
  3015				break;
> 3016			trace_printk("%s: cache_validity=0x%x\n", __func__, nfsi->cache_validity);
  3017			if (!retry)
  3018				break;
  3019			err = -ECHILD;
  3020			if (!may_block)
  3021				goto out;
  3022			spin_unlock(&inode->i_lock);
  3023			err = __nfs_revalidate_inode(NFS_SERVER(inode), inode);
  3024			if (err)
  3025				return err;
  3026			spin_lock(&inode->i_lock);
  3027			retry = false;
  3028		}
  3029		err = -ENOENT;
  3030		if ((s64)(login_time - cache->timestamp) > 0)
  3031			goto out;
  3032		*mask = cache->mask;
  3033		list_move_tail(&cache->lru, &nfsi->access_cache_entry_lru);
  3034		err = 0;
  3035	out:
  3036		spin_unlock(&inode->i_lock);
  3037		return err;
  3038	out_zap:
  3039		spin_unlock(&inode->i_lock);
  3040		nfs_access_zap_cache(inode);
  3041		return -ENOENT;
  3042	}
  3043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
