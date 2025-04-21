Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700FE262D38;
	Mon, 21 Apr 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745234061; cv=none; b=Ono8XbIEX3mNxjGiNv1TnxqJh5ZXUfYcb8iIygsxuk74LvvR6bi/t1OOrJU6QS6/pVbAGbLBw0gKAVk6ktNwtDj6g9cAF+2JlUn7Z38vfBa9fKzUpMcgcpKlqcjcXP07+wfPG/uHy+nXSipgBlYrKw65sw8Q1806d29rwvA/jI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745234061; c=relaxed/simple;
	bh=LJLnovln/wgZtwBc6c1R6izawkYFxALqns4kDbIbMYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnduwFqGOvcJFEe4ubZt6zEF76ZbX5vHNSEDtD+bYNCK2OFLGfC1qts1UGHRLCfK3fZDNIvfb8Z8CWJtOFkVy4vBWS2fDCzHK3wHtXkfTZEzJO7XRS9P/zPH7cE5zf7n7L1eXbQuh/DNsqamjlJzAbuEbD1F/cIgVHLE6IY5Xtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anLaNYdC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anLaNYdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745234059; x=1776770059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJLnovln/wgZtwBc6c1R6izawkYFxALqns4kDbIbMYg=;
  b=anLaNYdCSkWdk841j+3dDg0UTsGRAAOFmEBs5ga4k/Bro7B6JaIiV3ug
   7YouJF7LRxRvfqbqj8Z4PkKTIdcfuUfPV9wvxPKKSl22Gk/PgZNfo5QcO
   AI9eks7mHQnbMcuWxRtF7trds50X9wml4uQ74gdSzmLFi357hajKyFsZY
   D7l+oNDuYOfaq6M6IG/7vVlZ+npL2akAH6ICrbkb9kWyS4zE+FeR1gBt7
   xoiXWD08FEAUOW2MOrfHw/gHcNC892gRx+7lWWye0CgqT1q8Lk0Hl8dVj
   9nyqABD4og8NunJMGlo2TIAdrUB/0acstF8Gur91Ihv0VK4ly6mGhYKk2
   w==;
X-CSE-ConnectionGUID: uf4rJbggT3KEBdkglAWh8g==
X-CSE-MsgGUID: hFOFLsNYQVSn5Z7QAmkSNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46865048"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="46865048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 04:14:18 -0700
X-CSE-ConnectionGUID: anH4DjtIR/CTMwHEaB5gTA==
X-CSE-MsgGUID: +hRlbTBOTNmeeI5YQ7LyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="131704977"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Apr 2025 04:14:17 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6p6N-00004f-2A;
	Mon, 21 Apr 2025 11:14:15 +0000
Date: Mon, 21 Apr 2025 19:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs-6.16.misc 18/18] mm/readahead.c:703:30: error:
 use of undeclared identifier 'fd_file'; did you mean 'get_file'?
Message-ID: <202504211930.SWe5ODLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.16.misc
head:   ac6355451deea7f96f5ca40a226fb0685b0475af
commit: ac6355451deea7f96f5ca40a226fb0685b0475af [18/18] fs: add S_ANON_INODE
config: arm-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211930.SWe5ODLS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211930.SWe5ODLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211930.SWe5ODLS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/readahead.c:703:30: error: use of undeclared identifier 'fd_file'; did you mean 'get_file'?
     703 |         if (IS_ANON_FILE(file_inode(fd_file)))
         |                                     ^~~~~~~
         |                                     get_file
   include/linux/fs.h:2404:31: note: expanded from macro 'IS_ANON_FILE'
    2404 | #define IS_ANON_FILE(inode)     ((inode)->i_flags & S_ANON_INODE)
         |                                   ^
   include/linux/fs.h:1131:28: note: 'get_file' declared here
    1131 | static inline struct file *get_file(struct file *f)
         |                            ^
   1 error generated.


vim +703 mm/readahead.c

   690	
   691	ssize_t ksys_readahead(int fd, loff_t offset, size_t count)
   692	{
   693		CLASS(fd, f)(fd);
   694	
   695		if (fd_empty(f) || !(fd_file(f)->f_mode & FMODE_READ))
   696			return -EBADF;
   697	
   698		/*
   699		 * The readahead() syscall is intended to run only on files
   700		 * that can execute readahead. If readahead is not possible
   701		 * on this file, then we must return -EINVAL.
   702		 */
 > 703		if (IS_ANON_FILE(file_inode(fd_file)))
   704			return -EINVAL;
   705		if (!fd_file(f)->f_mapping || !fd_file(f)->f_mapping->a_ops ||
   706		    (!S_ISREG(file_inode(fd_file(f))->i_mode) &&
   707		    !S_ISBLK(file_inode(fd_file(f))->i_mode)))
   708			return -EINVAL;
   709	
   710		return vfs_fadvise(fd_file(f), offset, count, POSIX_FADV_WILLNEED);
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
