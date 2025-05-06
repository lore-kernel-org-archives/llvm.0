Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284E26F449;
	Tue,  6 May 2025 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522904; cv=none; b=ZumBPkC2EsFy696yXqtdcL0Q3JKVa+3Ka/oW2ZRIJGg4Yjv2M/ZmE7O0RmeSKtpqVtJr6Bk/T2iD1Ax3KMX/MI9Cenvc8RprB8zVr49g8H0ClieVBqb7zFixsg5ijrgZ9QGteR0SCHeNP+e6hu2AxppyNVcgHvDK+OEG9TXaPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522904; c=relaxed/simple;
	bh=Pa66WXXKuyExX+fR+h04rN3ko29oOlVcjprfUhW8+X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q//FeIh1lHskUbYSLx+l3tep6hDjaaYTV0oD5whmXZB4VRF4jT9Wo36o1HZ/qUD7SbqLwHMBD2yEbIsiea+lREypwEvItF8LuR5VQqoXlYYXEeCWWaE/tZcn3KlTF5WEP3GW03vnc3iWWYYw1eIO5MRDirlSxiKD+vggEfpUX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv5imxZs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv5imxZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746522903; x=1778058903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pa66WXXKuyExX+fR+h04rN3ko29oOlVcjprfUhW8+X4=;
  b=Kv5imxZszFgnr7p3wCuQ6HGhJs0rjFVtCq6+5MJ6CRZS6ynk24A5NcMj
   WRFrXJJKoh/13ooVDtTfwS6s2DUOciRo1fZf4yLbM8GoLtRr/uCsFMtQV
   yUYZZZpec7OSp14F2ES6ERGvhsp32tdmCH9nSbqZflNzpNkBXVG3PTyCj
   aI+QbJegJ+Kwl9+xYSQbDhRToJrTtAR4YyQrSVSF5KIh2tHo2IPQ+eMrz
   Vjm6Xtw1tAQJukec9L6EjXvxiXPzTklR1UIFAIvZg4oIgAypIqeF97eEq
   dZTSsWfmhEvrrZBgJXgiMbhu/d2oMzDpdkZZPt+15sRWdBhFwln4tHW0/
   g==;
X-CSE-ConnectionGUID: X7FLn9TsSlKWly84LlsUxw==
X-CSE-MsgGUID: pD2wgWWWS0Op1Jeej1dhog==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47888327"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="47888327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 02:15:03 -0700
X-CSE-ConnectionGUID: CyQQzRZUS12WCadkqo9mKA==
X-CSE-MsgGUID: qtaJFS3tRI21OUc6e2sKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135938717"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 02:15:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCEOB-0006QT-04;
	Tue, 06 May 2025 09:14:59 +0000
Date: Tue, 6 May 2025 17:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 14/18] fs/pidfs.c:594:24:
 error: incomplete definition of type 'struct coredump_params'
Message-ID: <202505061732.sTCLwl1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   d8527ff7eedddbd9827f61df7c80d9870cdc1241
commit: 9f07dff1a3e95ae64112dc44a70939320ba18ceb [14/18] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: powerpc64-randconfig-003-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061732.sTCLwl1W-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061732.sTCLwl1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061732.sTCLwl1W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:594:24: error: incomplete definition of type 'struct coredump_params'
     594 |         struct pid *pid = cprm->pid;
         |                           ~~~~^
   include/linux/elf.h:66:8: note: forward declaration of 'struct coredump_params'
      66 | struct coredump_params;
         |        ^
   fs/pidfs.c:607:42: error: incomplete definition of type 'struct coredump_params'
     607 |         coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
         |                                             ~~~~^
   include/linux/elf.h:66:8: note: forward declaration of 'struct coredump_params'
      66 | struct coredump_params;
         |        ^
   2 errors generated.


vim +594 fs/pidfs.c

   591	
   592	void pidfs_coredump(const struct coredump_params *cprm)
   593	{
 > 594		struct pid *pid = cprm->pid;
   595		struct pidfs_exit_info *exit_info;
   596		struct dentry *dentry;
   597		struct inode *inode;
   598		__u32 coredump_mask = 0;
   599	
   600		dentry = stashed_dentry_get(&pid->stashed);
   601		if (WARN_ON_ONCE(!dentry))
   602			return;
   603	
   604		inode = d_inode(dentry);
   605		exit_info = &pidfs_i(inode)->__pei;
   606		/* Note how we were coredumped. */
   607		coredump_mask = pidfs_coredump_mask(cprm->mm_flags);
   608		/* Note that we actually did coredump. */
   609		coredump_mask |= PIDFD_COREDUMPED;
   610		/* If coredumping is set to skip we should never end up here. */
   611		VFS_WARN_ON_ONCE(coredump_mask & PIDFD_COREDUMP_SKIP);
   612		smp_store_release(&exit_info->coredump_mask, coredump_mask);
   613		/* Fwiw, this cannot be the last reference. */
   614		dput(dentry);
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
