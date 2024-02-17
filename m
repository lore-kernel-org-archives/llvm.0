Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04A323D;
	Sat, 17 Feb 2024 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708138812; cv=none; b=GMDsGO1UTdu5MdPq+abOV0tMp6pah0NVjyjZoOxJpMcFmxGfqP1Af8evOchDEEOiV/SSiQb8qFIi/Vn6K5FWrVQq8r20Pxr4SorJc/xlf6mRwoeM4n8zYOciFSE/ACYOeD6nVsHOWGBl1oB3qY6JRQ+Ii1agshpY+JSdHN8mtZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708138812; c=relaxed/simple;
	bh=84csLGvqqmXqt6H3TZzIxxlRdyYsJCHQCvgVH6+LUms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEouhWN6E8rm3C6KCqD/EYQ6Aikp1iBiAWBe/P6tY4c/jzfeBSPvBXu6YCodiBqwx+mfZb70eK4HedVZHbmp7clne9gL7wgX6q7karyX6YlVu82IYfk2Jx0Hy+5fEiHsQf7xXDmxeFmWrFglK6+rcvhH1WGJxlioFHzKHKGd9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld7fi9RO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld7fi9RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708138810; x=1739674810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84csLGvqqmXqt6H3TZzIxxlRdyYsJCHQCvgVH6+LUms=;
  b=ld7fi9ROEbjcAovTX82q3bKp+1ranEcTtAYcCnsQB4/OofYUvdCL0Bwc
   qURNlTILxqu0U2rVFn4Ylww3U1hOyOz79XOpLXg7uZNZB5CdCwufgqBrJ
   zmEb3tJVrSjArt2n1Hu3gNnGe4FPtgt3bFm6kGXD3ChITojYDLK+Rru3h
   LjuZ55yXG4SXg9JGe+ByuKYsG2ayOQQyrh626pM5yvOUMXGOMseQScGyq
   oR7AN8HkOzO9OS0NUfnYl/d+yEMp6zGBbcI9wvmSdDu5YUw85rmESh7o5
   Qd4Ebien9f/FRf8Qtx2Il0L4wb7O+yxQ5eGH/QJRCILgpLLw9DK5VFLrw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2412656"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2412656"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 19:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4054085"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 19:00:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbAvs-0001ma-2V;
	Sat, 17 Feb 2024 03:00:04 +0000
Date: Sat, 17 Feb 2024 10:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 16/19] fs/nfsd/nfs4proc.c:3684:14: error: invalid
 application of 'sizeof' to an incomplete type 'const struct
 nfsd4_operation[]'
Message-ID: <202402171015.IYhf84Cn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   05763530d2b11348b74009c4f2206c1a556669aa
commit: 2613ba513429796e9c167eee3362484647a44811 [16/19] nfsd: wire up GET_DIR_DELEGATION handling
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240217/202402171015.IYhf84Cn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171015.IYhf84Cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171015.IYhf84Cn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c:3513:14: error: use of undeclared identifier 'nfsd4_get_dir_delegation'
    3513 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^
>> fs/nfsd/nfs4proc.c:3684:14: error: invalid application of 'sizeof' to an incomplete type 'const struct nfsd4_operation[]'
    3684 |         if (opnum < ARRAY_SIZE(nfsd4_ops))
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> fs/nfsd/nfs4proc.c:3205:37: warning: tentative array definition assumed to have one element
    3205 | static const struct nfsd4_operation nfsd4_ops[] = {
         |                                     ^
   1 warning and 2 errors generated.


vim +3684 fs/nfsd/nfs4proc.c

07d1f8020738ba J. Bruce Fields 2014-03-06  3681  
f1c7f79b6ab4f7 Adrian Bunk     2008-08-08  3682  static const char *nfsd4_op_name(unsigned opnum)
b001a1b6aa9609 Benny Halevy    2008-07-02  3683  {
b001a1b6aa9609 Benny Halevy    2008-07-02 @3684  	if (opnum < ARRAY_SIZE(nfsd4_ops))
b001a1b6aa9609 Benny Halevy    2008-07-02  3685  		return nfsd4_ops[opnum].op_name;
b001a1b6aa9609 Benny Halevy    2008-07-02  3686  	return "unknown_operation";
b001a1b6aa9609 Benny Halevy    2008-07-02  3687  }
b001a1b6aa9609 Benny Halevy    2008-07-02  3688  

:::::: The code at line 3684 was first introduced by commit
:::::: b001a1b6aa960949a24c2cdc28257dfcc9428d74 nfsd: dprint operation names

:::::: TO: Benny Halevy <bhalevy@panasas.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
