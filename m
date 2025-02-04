Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146E20C00D;
	Tue,  4 Feb 2025 23:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712475; cv=none; b=VOd2WuEvy/V5rLVgosGQwEI+OgR1+UkJ215wAIkTI35toJC/0J858uTzX7A20TCXi2luKbMgi2UeL1VMD3J4cXl3JaKkbQzOgaGRRSC1l7f5Re1vI3tGvwVL3DqQtelho3tIC9QlXdHOqww6a8WKk3aSLxCKK1426ew5J3GUmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712475; c=relaxed/simple;
	bh=ADQp0MY9sA4VDVGmVbws8HZt0USEAEfxm29pm3wCoxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0ct7irtRMdVYKQGEOxpEJpZyF7r9mRv5OcleQ17rh/KqLdZlDTQT6ZZUJEWxQHj8b0STd5ArLSlG2riwIJIwwGwAwSzfekg0KVY+1xd4TAZUN0XKcxiGujlBUBe9Bq16S7TVJfIUB1wWRmJ96yKKmgQYplFOnWKk5N1AgrQqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRpQZW3e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRpQZW3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738712473; x=1770248473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADQp0MY9sA4VDVGmVbws8HZt0USEAEfxm29pm3wCoxU=;
  b=bRpQZW3eTnuCSb83DIw1AwWyDEZ/q/0fq7YsHzv0fpq9PZRb7RM+q2L5
   hy+aDj1DbtxCKkXeX5SowPtpREuSyV4XQj6iSCKtMl15GZ6TDfJ4D0TVx
   0mIaFyk0YPAl/9y6ez10zjyQtgm7YLJFhPDm+RCL3kVQvlEeDVJEuKwyA
   OB6+6FM8yos0Q3LKkj66loGFDfVvKt8JKcorhrkOlNiJTrdaWeqGea7C5
   CBqaPC1V2XvjjkN6YSneyspLhlWlB5NKE/6jxMlTXY+m9KWlaZnVgIfYp
   Ro1zTMKsGdcySD7ysAht9gW7iiLxZTrV7jy5cTL3o/tWeCkgf+O5d7suH
   A==;
X-CSE-ConnectionGUID: MQiG2SWjQ5me2wfDqHuRzA==
X-CSE-MsgGUID: +VY+DN3VQr63DF5yC6ny0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38472071"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38472071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 15:41:12 -0800
X-CSE-ConnectionGUID: 0wUBdvKqQZqQPlTEmu9EJA==
X-CSE-MsgGUID: 0Dy1c3CVTjWjpSfNa+f7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="115731251"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 15:41:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfSXV-000tBD-0l;
	Tue, 04 Feb 2025 23:41:09 +0000
Date: Wed, 5 Feb 2025 07:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 21/23]
 lib/kunit/uapi-preinit.c:44:1: warning: non-void function does not return a
 value
Message-ID: <202502050735.7LA0CNx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c5dc664800bcb374e0ea3bcb152167b8dc1715c0
commit: 843542230b45c042286f208e66c0c473f03abd99 [21/23] kunit: uapi: Introduce preinit executable
config: x86_64-buildonly-randconfig-006-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050735.7LA0CNx0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050735.7LA0CNx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050735.7LA0CNx0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/uapi-preinit.c:44:1: warning: non-void function does not return a value [-Wreturn-type]
      44 | }
         | ^
   1 warning generated.


vim +44 lib/kunit/uapi-preinit.c

    26	
    27	int main(int argc, char **argv, char **envp)
    28	{
    29		int ret;
    30	
    31		ret = setup_api_mount("/proc", "proc");
    32		if (ret)
    33			exit_failure("mount /proc", ret);
    34		ret = setup_api_mount("/sys", "sysfs");
    35		if (ret)
    36			exit_failure("mount /sys", ret);
    37		ret = setup_api_mount("/dev", "devtmpfs");
    38		if (ret && ((ret == -ENODEV) == IS_ENABLED(CONFIG_DEVTMPFS)))
    39			exit_failure("mount /dev", ret);
    40	
    41		ret = execve(argv[0], argv, envp);
    42		if (ret)
    43			exit_failure("execve", ret);
  > 44	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
