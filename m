Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8A38DF2;
	Sat,  6 Apr 2024 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712431431; cv=none; b=d5IALgwvFw0yabSSf/8pvuPxG7bZovmDPgTcF/7qRPc5aELJ/SecGtC6kTwY85ldpJrvDWjPi4ny41f73lwkS8C+9TKwSrCq4BkzOiLctmQYFnK0P2sAgEZwsYRXkBsUvhEyjoFZklZb6Ket6Zpr/FhfsqaaWtAizgEIc+JPv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712431431; c=relaxed/simple;
	bh=YCaWIPOM92dAfCLRQ84iiSieXZG4QEHgGa5od2iFsXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkIfj7GWeH9nX4pY1Fo9gXeqvy3YCqkuvA1/N3fKht/4fv/d6fbKtoPtr730/gwMUf7t1IuJ2qpjexIKZ5blyIdY7Q/I9fK8eDrvHC1mgXmVYhGyjJLsjsIpS3PAAZYz5rhYaUM4nRGGbFMMXVpExrCDtIdzwPRUQt8G/DuW0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mbf/rY3Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mbf/rY3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712431428; x=1743967428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCaWIPOM92dAfCLRQ84iiSieXZG4QEHgGa5od2iFsXo=;
  b=Mbf/rY3ZXnfg2LonVvDI2rxF0/eOUmuFR9UZgAhpJn6PKtzpCaUCt+c3
   fZCe5e4gIqJGUjEkm8noqdMaKeYDljuS7tOA+kMreCa9ug59WEJlMOtan
   +o3C0KIKi4mErK5Qh+31wrHhosk+xmlHyf/dYY7XAksCcgJb7BXA19wGz
   BASzc4nGFgngGK+j2acTvigo+4oDWGYyEJFdbuLthkkUWwBZ/xe/epUyq
   pXapE3fCpHlxzXky7E8uHARwcPqVVp6p9m3SEvge+PCECck2s2W4z1x+U
   52fxLF76x5Ko5Sc1lRBUsMsJBVlfBaLXl8GQ6WCSQdkSqI8M6LO1EvQKR
   A==;
X-CSE-ConnectionGUID: si+Lzi7tTvCxWUDOv8rcLA==
X-CSE-MsgGUID: TPhK6a/4QLam2DT6ilYUFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7912139"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7912139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 12:23:48 -0700
X-CSE-ConnectionGUID: k2yJeMtkRsmLE+tMjsVLXg==
X-CSE-MsgGUID: i1EuU4n7R6GnrLyQu3tWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="42649172"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2024 12:23:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtBdg-0003n2-2r;
	Sat, 06 Apr 2024 19:23:44 +0000
Date: Sun, 7 Apr 2024 03:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:rw_iter 112/120]
 drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:393:15: warning: variable
 'value' set but not used
Message-ID: <202404070316.d8eNIHI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: dd988e82f94c0ea4e91d77876ef0b90d4294afeb [112/120] drivers/net/ethernet/amd-xgbe: convert to read/write iterators
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240407/202404070316.d8eNIHI0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070316.d8eNIHI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070316.d8eNIHI0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:393:15: warning: variable 'value' set but not used [-Wunused-but-set-variable]
     393 |         unsigned int value;
         |                      ^
   1 warning generated.


vim +/value +393 drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c

5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  388  
dd988e82f94c0e Bui Quang Minh   2024-04-06  389  static ssize_t xi2c_reg_value_read_iter(struct kiocb *iocb,
dd988e82f94c0e Bui Quang Minh   2024-04-06  390  					struct iov_iter *to)
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  391  {
dd988e82f94c0e Bui Quang Minh   2024-04-06  392  	struct xgbe_prv_data *pdata = iocb->ki_filp->private_data;
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10 @393  	unsigned int value;
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  394  
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  395  	value = XI2C_IOREAD(pdata, pdata->debugfs_xi2c_reg);
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  396  
dd988e82f94c0e Bui Quang Minh   2024-04-06  397  	return xgbe_common_read_iter(to, &iocb->ki_pos,
dd988e82f94c0e Bui Quang Minh   2024-04-06  398  				     pdata->debugfs_xi2c_reg);
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  399  }
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  400  

:::::: The code at line 393 was first introduced by commit
:::::: 5ab1dcd58597c04f6d50980c3d5f3c2518301b31 amd-xgbe: Add I2C support for sideband communication

:::::: TO: Lendacky, Thomas <Thomas.Lendacky@amd.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
