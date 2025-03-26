Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D51F3B9C;
	Wed, 26 Mar 2025 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743008875; cv=none; b=jPjsxfxUFHgO+2hMQkhObPds2bdpDO5Mjm6PuZQTBp0idc9WEKptcZ/m4n9mrWzBZZrsG0m6gDcz/NJgGYLk6MVmVfjiBKxvWam/Z7RCLrHvnueVbUvaXfeqe5hg8pQ6fktQ0DcHG9h+aYZHdXdTwehVUllROtTT9QB4ELYpiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743008875; c=relaxed/simple;
	bh=ScM9Tu7B3RUWqTHYxV6sXTtuyDIzrk10U+OhEj6Jr7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHbz8/SiITbcTh7mRouovNlPaY4VDCsx46u9TSMlDD9e/YLqGAQy3DWsREY1ag/4k3yNiIcfc9r6jctoktG0sjU3WpYCkVl96Mzp2hyZwkCJTUyJbEFozrqBBXMHVxdhw7rVhhsWmEBOSYyetnrG1e6/ei3+d6Uu8kIcEB08gbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US6jfn8e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US6jfn8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743008870; x=1774544870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScM9Tu7B3RUWqTHYxV6sXTtuyDIzrk10U+OhEj6Jr7Y=;
  b=US6jfn8eXCCWQNlUPQ63UwgfDQBCqWigGYMx2B2dv4Xiwy9LG+fEXN1k
   HPrTHE6QL0fojIO5RAy8XOyJ/i22/nZNe8idLZ8Ey94pMcVxjJQ/VoxUb
   SgCQTmyFkIl4bCzjICK+cw8wqVY9JtICIRM4eiYz96ah2VsCavk2uHESU
   8TIfP/MR1eVklwEyc927/MztsC1f3s9MMSxR+EzR29Gfn2cVJ9oqP7yeI
   39fFIzmv2FaOEfvGZVACQ/5BZDGZfRi5665jTSiL49nIZjnD91zEQ0BtP
   obeE1CLCTLT/JaOVomAwi9lqcHrInutt9UTHWoCuwrQwAMm0wOFP9SwdJ
   Q==;
X-CSE-ConnectionGUID: y6wCRyu1TdeKmzPgsHS0lw==
X-CSE-MsgGUID: lzVEAqsKT/ebxLPKFVPxTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44430959"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44430959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 10:07:49 -0700
X-CSE-ConnectionGUID: +wfmBtukSBSiSRKYURdOEA==
X-CSE-MsgGUID: ppqWQlPoQUyZJTSO7bEM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125351417"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2025 10:07:48 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txUED-0005vN-2O;
	Wed, 26 Mar 2025 17:07:45 +0000
Date: Thu, 27 Mar 2025 01:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/19] ld.lld: error:
 undefined symbol: kunit_log_append
Message-ID: <202503270036.cmDgUd6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   d10563e28bf421b3991f2c36e20b2e14e03c8c41
commit: 0387b99af182a8e49e0873834ebe0e226726dcf2 [15/19] kunit: Introduce UAPI testing framework
config: i386-buildonly-randconfig-002-20250326 (https://download.01.org/0day-ci/archive/20250327/202503270036.cmDgUd6x-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270036.cmDgUd6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270036.cmDgUd6x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_log_append
   >>> referenced by uapi.c
   >>>               lib/kunit/uapi.o:(kunit_uapi_run_kselftest) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_fail_assert_format
   >>> referenced by uapi.c
   >>>               lib/kunit/uapi.o:(kunit_uapi_run_kselftest) in archive vmlinux.a
   >>> referenced by uapi.c
   >>>               lib/kunit/uapi.o:(kunit_uapi_run_kselftest) in archive vmlinux.a
   >>> referenced by uapi.c
   >>>               lib/kunit/uapi.o:(kunit_uapi_run_kselftest) in archive vmlinux.a
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
