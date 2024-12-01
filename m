Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A8B1D6DA5;
	Sun,  1 Dec 2024 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068912; cv=none; b=QSpTVMJdaroIwV+4e+jldf4RH3dmldiA6PHIWcRPCNhNE7fYJ4XPC0+gD8KeqHOFAgJUSYIrCRv/rbLCzy9aCnpu0murtrmJuzPxVUC/xOYx4tCc5PhKOeVZ/h/+nXC6NVRuHeBnQvzqAxkD1uhn+xEUb0ASAYCy2rRI0Nzv9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068912; c=relaxed/simple;
	bh=oKomqqd+Q4QsQoBjK0KD3q788ZBN0QcZzq1UmbkXpFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkHMFekk8Bp17oN1JcnWdkaWIMjtvTYAoat0T2hAZ2g+yN+uFv/nSNBsxUs3k7cgRZKnQeTx8iZkrPhqbHXKPOoknQuaIq/v/3wl52z9gk0fipJPa1UDAcRs1JAFazQYgom/EOVN4jh3QdHSmGULfCa8qEM1aoADa1WJfesmTx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbBdmnIx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbBdmnIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733068910; x=1764604910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oKomqqd+Q4QsQoBjK0KD3q788ZBN0QcZzq1UmbkXpFY=;
  b=ZbBdmnIxVNGvklCLD+tiqgkGbAPNDQ9ORgCEUCJcdZHaa+MBOdTNr3H9
   BUa6GZNmLiWNE86NP9iAyATksMX0yBMC4a7a0oLRqmGsRYM/UzOuS2CNp
   YpKCwJB7r3+zFn8vNytvyJulh00G4/4l7NPC5rMsfPOmgUYHvEntGovfv
   B4cVAsAgYdKuw4Nhj2cHQ9IzBMqBQzBq4mxP3p/rteVQPumbOyO0n+LVG
   zYOkzA5I07yJFPkZCkGmihCUwiNHtssYYSUogC3zuAeqxfwK9OrgL/y1m
   OtqgpkskXuJ0Lgw66hgbtCHkbgKjOgXFMx0nMDUHfZH73TJF3WOnlLIir
   g==;
X-CSE-ConnectionGUID: iwrSZ1EATKaBEBlpKDEC1w==
X-CSE-MsgGUID: mj4WUuMlSP2xTKKrnU6U8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58630336"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58630336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:01:49 -0800
X-CSE-ConnectionGUID: 9mqckK8VQhu+zN+xRZ0F8A==
X-CSE-MsgGUID: Y+o1+Z/mSbqO1IDlA2Tisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="98011465"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 08:01:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmOH-0001eD-1x;
	Sun, 01 Dec 2024 16:01:45 +0000
Date: Mon, 2 Dec 2024 00:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] exportfs: add flag to indicate local file handles
Message-ID: <202412012337.HpTm35G5-lkp@intel.com>
References: <20241201-work-exportfs-v1-1-b850dda4502a@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241201-work-exportfs-v1-1-b850dda4502a@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 74e20c5946ab3f8ad959ea34f63f21e157d3ebae]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/exportfs-add-flag-to-indicate-local-file-handles/20241201-211528
base:   74e20c5946ab3f8ad959ea34f63f21e157d3ebae
patch link:    https://lore.kernel.org/r/20241201-work-exportfs-v1-1-b850dda4502a%40kernel.org
patch subject: [PATCH 1/4] exportfs: add flag to indicate local file handles
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20241201/202412012337.HpTm35G5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012337.HpTm35G5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012337.HpTm35G5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/export.c:19:
   In file included from include/linux/sunrpc/svc_xprt.h:11:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/nfsd/export.c:458:6: warning: variable 'nop' is uninitialized when used here [-Wuninitialized]
     458 |         if (nop && nop->flags & EXPORT_OP_LOCAL_FILE_HANDLE) {
         |             ^~~
   fs/nfsd/export.c:420:37: note: initialize the variable 'nop' to silence this warning
     420 |         const struct export_operations *nop;
         |                                            ^
         |                                             = NULL
   fs/nfsd/export.c:1045:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    1045 |         struct inode            *inode;
         |                                  ^
   3 warnings generated.


vim +/nop +458 fs/nfsd/export.c

   416	
   417	static int check_export(struct path *path, int *flags, unsigned char *uuid)
   418	{
   419		struct inode *inode = d_inode(path->dentry);
   420		const struct export_operations *nop;
   421	
   422		/*
   423		 * We currently export only dirs, regular files, and (for v4
   424		 * pseudoroot) symlinks.
   425		 */
   426		if (!S_ISDIR(inode->i_mode) &&
   427		    !S_ISLNK(inode->i_mode) &&
   428		    !S_ISREG(inode->i_mode))
   429			return -ENOTDIR;
   430	
   431		/*
   432		 * Mountd should never pass down a writeable V4ROOT export, but,
   433		 * just to make sure:
   434		 */
   435		if (*flags & NFSEXP_V4ROOT)
   436			*flags |= NFSEXP_READONLY;
   437	
   438		/* There are two requirements on a filesystem to be exportable.
   439		 * 1:  We must be able to identify the filesystem from a number.
   440		 *       either a device number (so FS_REQUIRES_DEV needed)
   441		 *       or an FSID number (so NFSEXP_FSID or ->uuid is needed).
   442		 * 2:  We must be able to find an inode from a filehandle.
   443		 *       This means that s_export_op must be set.
   444		 * 3: We must not currently be on an idmapped mount.
   445		 */
   446		if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
   447		    !(*flags & NFSEXP_FSID) &&
   448		    uuid == NULL) {
   449			dprintk("exp_export: export of non-dev fs without fsid\n");
   450			return -EINVAL;
   451		}
   452	
   453		if (!exportfs_can_decode_fh(nop)) {
   454			dprintk("exp_export: export of invalid fs type.\n");
   455			return -EINVAL;
   456		}
   457	
 > 458		if (nop && nop->flags & EXPORT_OP_LOCAL_FILE_HANDLE) {
   459			dprintk("exp_export: filesystem only supports non-exportable file handles.\n");
   460			return -EINVAL;
   461		}
   462	
   463		if (is_idmapped_mnt(path->mnt)) {
   464			dprintk("exp_export: export of idmapped mounts not yet supported.\n");
   465			return -EINVAL;
   466		}
   467	
   468		if (inode->i_sb->s_export_op->flags & EXPORT_OP_NOSUBTREECHK &&
   469		    !(*flags & NFSEXP_NOSUBTREECHECK)) {
   470			dprintk("%s: %s does not support subtree checking!\n",
   471				__func__, inode->i_sb->s_type->name);
   472			return -EINVAL;
   473		}
   474		return 0;
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
