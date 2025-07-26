Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864517D2;
	Sat, 26 Jul 2025 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753530941; cv=none; b=PgxzwIrI3lvjbeZFIe18DSvvILGU09Fmj5g0nIxB7KaVhVbbL6g7f0aKiGyCyDA7z3qP0ImZ2XsaUI+RBwu/2jCZ1vzxgmb0KYUfB5CbHx75DyMF5A+5rQeX5gmc475976lIodh06Lc8XW3H1xYnmHbGfiAdKlpw0iDZS9JFpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753530941; c=relaxed/simple;
	bh=jIVT9BQ8l1fo6QyWxs6hAG3xyOWIDtywAEqV21DFqEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZxAyJNuKHF9/N0MnTTdNNICoVN0TcMSanenGebY8dn7n4apc0E5HJh5bR26svwKb8W63Ee3zV9guqN/fBc4vW7zamo+L/pWbUKAMTf4bo3u5qKvLVgznfh5T1KTpCmtu0/s3EDugYaB+hWqtdvjaShx9aeLBNV7Yl6MdMZRqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmxqrXI9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmxqrXI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753530940; x=1785066940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIVT9BQ8l1fo6QyWxs6hAG3xyOWIDtywAEqV21DFqEY=;
  b=KmxqrXI9qCmxqswMw8dBasI41Tl9cVev6iBjfJ3UhP102AMjHtB5HwPv
   3Sbeo9L+4Q+WJiaEwcZblqSSrmZFEdk3fqXennkKILxdl6LEBwR2fWDDI
   6nqIrIV4cJCxc0u8VUe1/dFqH3ksr+oXqOWx08vIzptnj0QKz0vI8kkxg
   mkzuAiIT+0p/HAWPi8X5FEaRVDyTvErXkSbsRZLWdSRroSFPqgQcuoHzz
   0PYnil8htJT3+zYdOrw5qOtF0qcDJOPT5eWT2LPDAWtxDF5HDF+AYvnEF
   zKvv+rWMzCyIkJosz0NNDtHITvmsRvWHn5fzEhjOI5bqQy8b/2EyqjhRP
   Q==;
X-CSE-ConnectionGUID: iqO/9wBtSbimCa9hKN5E2g==
X-CSE-MsgGUID: EGWpvERGQc2xPg28p/mz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="81292955"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="81292955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:55:37 -0700
X-CSE-ConnectionGUID: wpmpsSXYSym1Z+waWjjQ3g==
X-CSE-MsgGUID: zhBdmgnGQbedOd0lloeYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="165679467"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jul 2025 04:55:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufdUz-000LxH-2g;
	Sat, 26 Jul 2025 11:55:33 +0000
Date: Sat, 26 Jul 2025 19:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [mcgrof:20250723-migrate-folio-stats 5/16] ERROR: modpost:
 "__umoddi3" [fs/xfs/xfs.ko] undefined!
Message-ID: <202507261901.Zqx9c7K1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250723-migrate-folio-stats
head:   e857aaf49afadc31be5f460664cd176bfd972ffe
commit: 4217f7b0545434b707e7fc908fb1b64fb709d797 [5/16] writeback: affine inode to a writeback ctx within a bdi
config: powerpc-randconfig-001-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261901.Zqx9c7K1-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261901.Zqx9c7K1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261901.Zqx9c7K1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
