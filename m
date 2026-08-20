Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363C47CC67;
	Thu, 20 Aug 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242200; cv=none; b=DyII2S7GnEb2hQZ9oNJgcusTvgop12nZFG/giPMtuFJiKZAYE6T5gR85ZlfvUcmn8X8nbn9K6K4FSNAbf/oe9XcjMvMz2I9/heRr87qlRMDFIUq2xZpLY2KJm5q6n+AQpsMmhpNXtZ+drBkS1n9qNDqA96/mDpf767ZA4Xj2INA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242200; c=relaxed/simple;
	bh=OLN8fmmi8WydTZVc6iPtsGxyJUNWY19kgYJoC5QbTUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdqCpAoxiQEqw3Gctzape/e62ps3B5g/G83OR1uqv+5gDQXHiPpriGbrfv8fShc4eoNMtB3me0rLjU6TjQ9cfMYye8D4rIjhYvi1KOX469f8tcNv7ZNt4tjcvRP11rTeb6ws9XHDmOrKR2SrKjTaZB1hCr+VqlAADpYLNLAVbdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiUcje47; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiUcje47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787242199; x=1818778199;
  h=date:from:to:cc:subject:message-id;
  bh=OLN8fmmi8WydTZVc6iPtsGxyJUNWY19kgYJoC5QbTUk=;
  b=JiUcje47Wq+aJs8f1izFbn/Ffiz++iKRrP4msjhkxggskZwc/PJDv34c
   uzgXERouTxNfejfIrBeScIdmpRnV/r1lr30oAkEKL/J6j7KlAzivOAjNx
   P3vWUW/K9k5M25GO1DoixdKrRpq65myiUav5q7gYquTL9Xy+xaY+57YL0
   qusu2/atWDin9QDiwwMtc/Qub3J0fiDeJ/l6LY2RYThE5OLkaE3mlAs0w
   KgiEqOz3etypn0qQtzXflRMetjBDO5D9fMacWxK+iJtEWn9k/TC1WX8oD
   yPliz0M5NfFJ19Kcl/QAqJPIxRJ0YcA24lTg9hxJEiMlvWkuSpx0I5gfy
   w==;
X-CSE-ConnectionGUID: 75v7pbjTR4uOe7l5BLvLPQ==
X-CSE-MsgGUID: 3z3PJ3uoQMOZnjbM7PNxHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105319626"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="105319626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:09:58 -0700
X-CSE-ConnectionGUID: ZpnO6P5LQfmLGrtgaJKQEw==
X-CSE-MsgGUID: QI8RbfWtTqqPhG2MsLGKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="270319669"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 09:09:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx5Kz-00000000mlh-2Z46;
	Thu, 20 Aug 2026 16:09:53 +0000
Date: Fri, 21 Aug 2026 00:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Xiang Liu <xiang.liu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 1/107]
 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mce.c:28:10: fatal
 error: 'asm/mce.h' file not found
Message-ID: <202608202308.OWeUNNWV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   232bf7d5453df6cc0d877a1003f9aa172e9750de
commit: 3a980c04ebdfd427c67cfac6315e24b11f1b1126 [1/107] drm/amd/ras: register mce notifier to obtain ras error info
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260820/202608202308.OWeUNNWV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608202308.OWeUNNWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608202308.OWeUNNWV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mce.c:28:10: fatal error: 'asm/mce.h' file not found
      28 | #include <asm/mce.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +28 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mce.c

  > 28	#include <asm/mce.h>
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
