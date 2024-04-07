Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10B368;
	Sun,  7 Apr 2024 00:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712448777; cv=none; b=D6fUuahuWB1yfmu3VZ2ib0bsqPkd9XhuJvnPtkVkm9a6gmNB3mA9kKaa1nkaWQ3nY9k1pHauhNjHube/4BJRLSZCYcu+kvX45O3EHXk4DE+hJJa6MCVxmOJusEoMBWKJzQkIxpEzdtuaHwg312OBU0vGy7mIvRqI8bQuzvOQv6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712448777; c=relaxed/simple;
	bh=bcbX+DbV7ndz8ge2jx2iLH1A/WAEmN4CfE9dCPI/rfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+W+P+u7SZ4YugZy7HmH33RfWYE7LBCq6wkMGylXIYr86w6yg1ecyR7kbt2346xEuEkd0zGL0gKINtdRlz87mI+0Mp+GIZlAeGaJ4qlr/mSEy7csLPK258lWPPYH4ryBKPYiEHDbzKIrwCrKWEpuS+kwL9eIAcTQUj2bdLO/S70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR+DLuqh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR+DLuqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712448776; x=1743984776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcbX+DbV7ndz8ge2jx2iLH1A/WAEmN4CfE9dCPI/rfw=;
  b=CR+DLuqhLNpRR2bsMiSsgmAkOe8voOfFPvP0WchLlVqaNkpC5Cw30Mhi
   oA/8bVF8i/oPwPLnAHY5lASET3Xe63bO1EpP72Pgcwoo4Rjkr6HevssCZ
   rF2hRNXlEw3b5P/6LeU9AQTP/pNsAV22+tKclfBm2ySUbrphEwAwi1/sl
   rvTdBBqy1s+kL6Xf/MCoRDsqPf64KFuIieHDEv/l62g3/q2atOZOzkJDz
   jmCGDHuTBNOU5s12nnDG+fJRgHdPsPr8Qv6ZNWIoC2BO/6MwdQjSxeU4G
   4uH27wIKKIq6rL1C67IXdqmcPE3mbbH9EZIKH/SnUNWpbYvovK5jp8ZKt
   A==;
X-CSE-ConnectionGUID: WgaPdeomSpesUEoPXbZmOg==
X-CSE-MsgGUID: ejUdVB0CTR29kJwtdy4VEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7610758"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7610758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 17:12:55 -0700
X-CSE-ConnectionGUID: CCyF3PB/TcaIA5fFGGGH5g==
X-CSE-MsgGUID: Uqkw8fcYR1KXtvmiJmCvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="24008151"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2024 17:12:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtG9T-00040c-2H;
	Sun, 07 Apr 2024 00:12:51 +0000
Date: Sun, 7 Apr 2024 08:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 21/126] security/selinux/selinuxfs.c:195:16:
 error: use of undeclared identifier 'sel_write_enforce_iter'
Message-ID: <202404070822.mkGtCHiv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: a3cebaa61aa177b5ea281434988373478216fea9 [21/126] security: convert to read/write iterators
config: i386-randconfig-015-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070822.mkGtCHiv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070822.mkGtCHiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070822.mkGtCHiv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/selinux/selinuxfs.c:195:16: error: use of undeclared identifier 'sel_write_enforce_iter'
     195 |         .write_iter     = sel_write_enforce_iter,
         |                           ^
   1 error generated.


vim +/sel_write_enforce_iter +195 security/selinux/selinuxfs.c

   192	
   193	static const struct file_operations sel_enforce_ops = {
   194		.read_iter	= sel_read_enforce,
 > 195		.write_iter	= sel_write_enforce_iter,
   196		.llseek		= generic_file_llseek,
   197	};
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
