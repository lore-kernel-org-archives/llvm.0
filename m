Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5D34888F;
	Tue, 20 Jan 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909384; cv=none; b=n3cycZhshy+nvNLopzy49of/4DfKSD3Huwr6msVzgk1kCHJN7QEDTGkLuzNK+u7a+Eh8IhLZz4O3hGBn+plBEr2TzsC3WbwhbQdgCR//kfMRgJpB7QnEwBu9Bx9jTZB3T+dhgwjGwJIUJ7AtMd47IwHG0YRAUtjjCtJQb+HGGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909384; c=relaxed/simple;
	bh=8oQZfy5tdtGMqmuPFhnyDBwrZILD/fXu1zfsgDZm1AM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Px4lAK4wOo8jVCcXiqYE34OUYoEpcCOAuHgX3MYeEf+upnV0D/i8wZ+tZfQStcENWTB1DW/Y/JoGo/RKIFdq3uz1peTNRVJyZ1Ol3hGKTpo/3QpG9LvUi9ivww53JAHZgxR99Sd3I4KZb4UgCrNyACjDnkpKZG0G2G8zdkGjkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dv2P8Gfe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv2P8Gfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768909382; x=1800445382;
  h=date:from:to:cc:subject:message-id;
  bh=8oQZfy5tdtGMqmuPFhnyDBwrZILD/fXu1zfsgDZm1AM=;
  b=dv2P8GfeeIvjn6oN++1vKyHOoyDuJ9wt1Y4r1UH3+TcMT3CO2Cf55qvr
   0Z/LTQUXQj95TKsD5kjzVJqluasUU3FoOpvziRy/jwq3raN8Jj8q+tTVU
   bHVL7x8Lgu+kSLQEE+jnbfuRRmTizfNJTKXRiUOenRT8RNcHWjL4rDBj2
   0a/TeuotWNoUopo/0vgO/LPg542M+r3u+z8CaepGaR4Yj97w/ypueM0lS
   213WHg4S/12zsy6foAbx1pXzKFTsBJjT5EYbv3Sf2DSKSK0QhCDgwmhJZ
   6Pq9xHiEztTxOT3uTxJ7NhK2BZfTceJgJJEPv/HgmeUaDULntVSpnh682
   w==;
X-CSE-ConnectionGUID: CqW16zCaR8O2pcsz9H7Cvw==
X-CSE-MsgGUID: SBr5QQlVQOGvtC2U/t6ntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69315711"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69315711"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:43:01 -0800
X-CSE-ConnectionGUID: zU+4P4VsSv+MFF6ZNJgp1A==
X-CSE-MsgGUID: BofyWPTvQ3aX5nzp5va8+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205256700"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jan 2026 03:43:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viA8P-00000000OuJ-0gWZ;
	Tue, 20 Jan 2026 11:42:57 +0000
Date: Tue, 20 Jan 2026 19:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-debug 231/231]
 fs/bcachefs/btree/locking.c:957:6: warning: no previous prototype for
 function 'bch2_account_sched_blocked'
Message-ID: <202601201947.e4D9wKcJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-debug
head:   7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062
commit: 7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062 [231/231] BCH_SB_COUNTER_blocked_with_btree_locks_held
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201947.e4D9wKcJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201947.e4D9wKcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201947.e4D9wKcJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree/locking.c:957:6: warning: no previous prototype for function 'bch2_account_sched_blocked' [-Wmissing-prototypes]
     957 | void bch2_account_sched_blocked(u64 start_time)
         |      ^
   fs/bcachefs/btree/locking.c:957:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     957 | void bch2_account_sched_blocked(u64 start_time)
         | ^
         | static 
   1 warning generated.


vim +/bch2_account_sched_blocked +957 fs/bcachefs/btree/locking.c

   956	
 > 957	void bch2_account_sched_blocked(u64 start_time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
