Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB3E4E1BC;
	Sat,  9 Mar 2024 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710017086; cv=none; b=sgRJmRtptZbmC6yJg2zW8wvLZ1GIcedNQEGNwYm26eXrfea5TIr/s3RmQazfKV9DEdqXB5IHVaZvqGUrvCzUci+pa8ONby/wCw6Yh+OFt6u1J7gN4j+rg4d6zNmMj8e6ANdoBJyngLuxIYFcxLf08GzDZq5Uuq0Bmv69bgy2sK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710017086; c=relaxed/simple;
	bh=QW1qvjL4lmCQ6vvmfs+cHdHxUhhWwGvjlAKYfEz9j84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCC4OZt2JBxumV+27YJqiCO4m+3Eu4M3uKKksi/gu8OTzOdKzGoijAwROrKwQxVCbky/gBRraPxgW9O1iP0DoaTVEPfoLXiwcTQSvLoPpH8EVOSyJsA91LmnD8q6k1CVrmLlLLGyHN8CN2XJNPD4mkDd6V5aH4aFdOYPWoVMzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr0Koh0S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr0Koh0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710017085; x=1741553085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QW1qvjL4lmCQ6vvmfs+cHdHxUhhWwGvjlAKYfEz9j84=;
  b=Hr0Koh0S+6LnuvgbrceCSKyM3fdKLRg2hWhDukAMktFVIavcEU0pzlrY
   0BYZZO3iDU5TJHG8O/rTOHNNKanhFTaozSeDnZyGY8X7LWYUyK5KHx3oS
   8GmMLjpLi5Vnzwc0ZGqmzp2UHmH+H52q8ewECRfCxADc1B1bTfO/Su46W
   2mS+QnowzIlQNsQT1zyoPehf88gaoPFqwFs3oBc1K9xqhTPq5gC4HAn4J
   0sjwKjYKJj/Xpc7Px6xubTsi4SMeJmlrpu6xPUix0b41zMIgeSM0fyUya
   9EW6ROWrnSiWW0TFYxljWpXCO3MP+zgzZd4x+0jmwJSu9Uu1/bobgSjct
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8536921"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8536921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 12:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15436536"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2024 12:44:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj3Yb-0007e7-2V;
	Sat, 09 Mar 2024 20:44:37 +0000
Date: Sun, 10 Mar 2024 04:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4606/14349] ERROR: modpost:
 "phys_mem_access_prot" [drivers/char/aml-gpiomem.ko] undefined!
Message-ID: <202403100458.Kgsf6BcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   d4f8b0ad1d52d7116444c0c5775d75f65b479c78
commit: 7ff99842a2f49291177856844102f1aa00687214 [4606/14349] ODROID-N2/C4: char: Add /dev/gpiomem device
config: i386-buildonly-randconfig-002-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100458.Kgsf6BcF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100458.Kgsf6BcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100458.Kgsf6BcF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phys_mem_access_prot" [drivers/char/aml-gpiomem.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
