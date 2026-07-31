Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266B1799F;
	Fri, 31 Jul 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536715; cv=none; b=pCRYWReQu/HBOyV3HTBJtBFWmFGWOBkyrDcTBQpcNC1QIPiASSwAlQM6WktG4bvSfzuEZIeO4JENLH17ttr8ay8xMV/CuMhMd4n6fhpiND4OKC8cmD2831NDXvKFO9p7QHTPmYy6d3kkNGodz+kD/hcphpgk/+Xyp25AJ7Z19vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536715; c=relaxed/simple;
	bh=8uLa+aBy84lQ8Ar85C22DzL1eNjKio6ZGnagqriymYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jEMujU70TS9gHQIM/MBOWoqXJ41pRBVb97saN0eyI2EtaFjwKLXhGzh8qPGJNjU5gTTgmgu+Nl2EcwRiQAF6pvYK0wLGJRKhx3D1RAqlXWdW1fOkOnBZId6GWhbUuZD/T4yodbnkT6SDi3VnX620z6lEViuQ/A2VxApykWy8JGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th2t3B19; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th2t3B19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785536712; x=1817072712;
  h=date:from:to:cc:subject:message-id;
  bh=8uLa+aBy84lQ8Ar85C22DzL1eNjKio6ZGnagqriymYo=;
  b=Th2t3B196VIA5JXLv/SYzNlKgdKbJEhdbJlEcEhXMAp9l+kteAWQcAnj
   Kcn6+2gtDvH5tHvfHzhu+RPRm5mA0A1+VFvA08c3qROMu+PsanUo/+IxZ
   cnD41/iGnvPQajfzU6B3xrlIXNoo70gYEotukpMf/AEUoSbpKxKK9ST14
   CawK3/0q2ciHpe9tS0k3TYzqkdZ4ZLYZnoBSuStKuEk9Z/qR1y8r42tmz
   ckYD2G95JbOPw4+yIfoB/i0sVOK01+/hiAeo1SZWdaCtbCJZsO0M76niC
   vR+waxHVOksmcSeRlyVAeHTEamzOQ9UITWJzquKFgBexPbOCapr++weWh
   w==;
X-CSE-ConnectionGUID: dJFinNZbRLmqXDAQ4zytAg==
X-CSE-MsgGUID: 6vzbA6qxTpOLx21P9lbPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86038804"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86038804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 15:25:11 -0700
X-CSE-ConnectionGUID: TA3q+lBJQnC5h8rhE3z6FQ==
X-CSE-MsgGUID: Jh3k+NhbT4C9uLqsXfAecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="262642815"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2026 15:25:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpvf9-000000002K9-1lSJ;
	Fri, 31 Jul 2026 22:25:07 +0000
Date: Sat, 01 Aug 2026 06:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: YoungSoo Shin <shinys000114@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 1/58]
 drivers/video/fbdev/sh1106fb.c:20:10: fatal error: 'linux/of_gpio.h' file not
 found
Message-ID: <202608010536.efb85MQE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: a7f14d616999ff734886c89b75b3f701b77ffd2d [1/58] ODROID-COMMON: fbdev: add support for Sino Wealth SH1106 OLED controller
config: i386-randconfig-006-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010536.efb85MQE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010536.efb85MQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010536.efb85MQE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/sh1106fb.c:20:10: fatal error: 'linux/of_gpio.h' file not found
      20 | #include <linux/of_gpio.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +20 drivers/video/fbdev/sh1106fb.c

  > 20	#include <linux/of_gpio.h>
    21	#include <linux/uaccess.h>
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
