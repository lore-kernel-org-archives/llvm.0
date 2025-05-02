Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0BF25D20C;
	Fri,  2 May 2025 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202714; cv=none; b=pqkL5EW9LHESSWIUPp0HrDXHlXcRbXbGewGdFUSwE/6BAuhPB1sQrij1t2Lc6gL8Gew/bNfCfhnija8pzUpLZWpl3xrGz1dDx9H3dOS1k+fEdNwcEYOVxs+10fm6q/P+8xiHtSX8tQWupBkaLbjHmI33deA/or387LgxNt+hQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202714; c=relaxed/simple;
	bh=wKed2HEAAjpuypB5+YOAKBXs7whMew/LNAhyMdJvcFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfLH58rp7aVnePLop+wo+0D3jd59jToIzzQz7+RyKqpNTmxWi66Jjx6cgIJ7hdVlXQC3y8MdgvbJtVdJ6/qkhEbUVddWT/wO/sud9dxiXMj+wtZx/WFhciyT0Pw7ujjnXzT2O0aY01OX0jNUNUm4IoBemUrXJIrM0Ps2YPCtots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLh9Xpc7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLh9Xpc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746202713; x=1777738713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKed2HEAAjpuypB5+YOAKBXs7whMew/LNAhyMdJvcFs=;
  b=XLh9Xpc7+STg9/DOr+MKSsuVpH14/8eSyV2+SEAeAIXZyF7T2Fmn7TFZ
   CW8LHwmHG6CtaaEbngHX4cvQ8Xa7/0Yq7AJFncLwatBIvCND/Y0HFviQu
   MjrQu0l0wnnZzv5QwR27AhjJ1Vnv2eXfKYNfGNjjIWSaGKAcmfaaHpF4S
   mdEIipRj8006x8NC+zPvLi78OMdNXMW1RHBZpT+DYb2d1SxHV96/YnJa9
   2krWLN+QKxwhlDETcduFz0H0diLeVj4IRfq/im+TV2NxtCLc62ncFnJJX
   Frvxlw19IsGY4Z2rgnSlXGN/+iC1FFi1eQI7Dhff1cpTmsDeuDLNvfd9E
   A==;
X-CSE-ConnectionGUID: 9eAwUi4+SvW+5tSWr6jHEA==
X-CSE-MsgGUID: WYXEIS+ASBynAZlGygYqfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50544617"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50544617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:18:31 -0700
X-CSE-ConnectionGUID: zC6GMzWhQXictq70mrtGgw==
X-CSE-MsgGUID: ZbWOpGvmQ9mwbCEQ7fL82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135660257"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2025 09:18:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAt5n-0004t7-0A;
	Fri, 02 May 2025 16:18:27 +0000
Date: Sat, 3 May 2025 00:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 12/14] fs/pidfs.c:597:24:
 error: incomplete definition of type 'const struct coredump_params'
Message-ID: <202505030032.TDuMOCCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   fed163064146d254b65f674b2072bf51bc26bbfa
commit: 745300388cabf3ae30ad74c7d35f563adab09d30 [12/14] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: hexagon-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030032.TDuMOCCn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030032.TDuMOCCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030032.TDuMOCCn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:597:24: error: incomplete definition of type 'const struct coredump_params'
     597 |         struct pid *pid = cprm->pid;
         |                           ~~~~^
   include/linux/pidfs.h:5:8: note: forward declaration of 'struct coredump_params'
       5 | struct coredump_params;
         |        ^
   fs/pidfs.c:610:42: error: incomplete definition of type 'const struct coredump_params'
     610 |         coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
         |                                             ~~~~^
   include/linux/pidfs.h:5:8: note: forward declaration of 'struct coredump_params'
       5 | struct coredump_params;
         |        ^
   2 errors generated.


vim +597 fs/pidfs.c

   594	
   595	void pidfs_coredump(const struct coredump_params *cprm)
   596	{
 > 597		struct pid *pid = cprm->pid;
   598		struct pidfs_exit_info *exit_info;
   599		struct dentry *dentry;
   600		struct inode *inode;
   601		__u32 coredump_mask = 0;
   602	
   603		dentry = stashed_dentry_get(&pid->stashed);
   604		if (WARN_ON_ONCE(!dentry))
   605			return;
   606	
   607		inode = d_inode(dentry);
   608		exit_info = &pidfs_i(inode)->__pei;
   609		/* Note how we were coredumped. */
   610		coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
   611		/* Note that we actually did coredump. */
   612		coredump_mask |= PIDFD_COREDUMPED;
   613		/* If coredumping is set to skip we should never end up here. */
   614		VFS_WARN_ON_ONCE(coredump_mask & PIDFD_COREDUMP_SKIP);
   615		smp_store_release(&exit_info->coredump_mask, coredump_mask);
   616		/* Fwiw, this cannot be the last reference. */
   617		dput(dentry);
   618	}
   619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
