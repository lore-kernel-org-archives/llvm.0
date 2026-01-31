Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78D357A52;
	Sat, 31 Jan 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769870899; cv=none; b=PiCuuiSPAfIH/GsUM5hUOp8XBXNmZWv6klkIIPOJAYD2/3kVSaR32qa/YV+oajL7vVXaPeHSDdXbyrjIA0hVJ7J4TOrHHpyYuVx+h2HuZ6+q3p5pSWi9xk/Ns1TdBKQSV7HfgpGvj9b/Dh2STJml3LDX3m/seWXSp5L/dtJsWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769870899; c=relaxed/simple;
	bh=6i1tEqU4uVAxPFUb4xrShZANJPIlalJ3MB9atSDzCkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IacfWYNOTBgVYo5xpJTmucEukYLyqbOZ1XH/DpJov/APC/XHbEdVIaHHoYYG/6NDaL03PO/+1hQoAYqKg7/s7Ueu7Fe3hjoY+Z3vbs2q90VunR3Ja5lBWZjD8WkslJtoewmngsdfZqsp5w5onDGt8vEX4ZWCjOjPW0j5iXKjDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnwWsiKA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnwWsiKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769870896; x=1801406896;
  h=date:from:to:cc:subject:message-id;
  bh=6i1tEqU4uVAxPFUb4xrShZANJPIlalJ3MB9atSDzCkI=;
  b=RnwWsiKASQWaYRWq06O4iJG4BvtECjlZytufWMrZCJs2kP5o+JpVZngy
   NDTZ+jw0F/M1omfru1lkLHRqUo5d80OpP6i6YwUtBQcBWpzr+zo5Y8obH
   pyanaP/dOuGYYZbpK9JRxzvoiBOQaWhJSJyJNXzAX259etq89629lDz2r
   TkMWvdOdnEicvZB1FNMP8zpIHifkKPwKrK5JdWZGDpeo+SV0eqRzeWuwW
   E8JS57E7Dk0Rj/nNpVDiDI7QaHxrWFqvnUILoUFi+rXCMTgVrdDrynfI5
   ukpga2y1voUtt4NRtFx0TpnGvqTqUunD7Niys/bM7RXrM+uXROv+5nzXa
   g==;
X-CSE-ConnectionGUID: lbFKReTqTpKBLMKxZzsRPQ==
X-CSE-MsgGUID: QMIQMNWbQsCluwcsHO7m3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73700316"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="73700316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 06:48:13 -0800
X-CSE-ConnectionGUID: 43MuF1JtT5aTJO9Zjm4x+g==
X-CSE-MsgGUID: NKT5uNMJR0altIIcSwP2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214026337"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2026 06:48:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmCGg-00000000e60-3EME;
	Sat, 31 Jan 2026 14:48:10 +0000
Date: Sat, 31 Jan 2026 22:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error: 'linux/mfd/samsung/s2mu005.h'
 file not found
Message-ID: <202601312238.qnIgUJ18-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   67ceff534b7c9352aaa66c7e7d6345d13e5d763f
commit: 67ceff534b7c9352aaa66c7e7d6345d13e5d763f [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601312238.qnIgUJ18-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312238.qnIgUJ18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312238.qnIgUJ18-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
