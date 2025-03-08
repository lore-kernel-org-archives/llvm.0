Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677C1494CF;
	Sat,  8 Mar 2025 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741432254; cv=none; b=FNCoT523mWzH7IVvwISpMpn8n9TStRDsmm1sh/sS3hIZT+nFed/Aso/ZxkMH0Cd9SAmR1QOXWYagWifqhHm4Tc5R23LmpYVnyYu9YU1jpF4AsK6GX92SaPbsLGI7kLZ2lq4UV8F06URAyYw7S/jdSd+Y7LnVWe/6cZUWp+xw3zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741432254; c=relaxed/simple;
	bh=vyXXg3/nm2+NAIbR/9TzehfEZUW023728ZmtWYeFQVo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADv7P4dONctu4GRsHfRW3PcU3SZDt3zHR9aCtSeegDqZY9PWGjes5+gXBnBTeb1xRn+p25rlvnRFmxq0g1qgBk0qsoZgixWqViUfGr9BrQ3XJfKMq1s3SWRZqVXmWjVtoPAcdliTI59844ypVcwMh1anqFuN3ngV33KXWpDBy+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSDEFH3a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSDEFH3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741432252; x=1772968252;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vyXXg3/nm2+NAIbR/9TzehfEZUW023728ZmtWYeFQVo=;
  b=KSDEFH3aOxRGTpnrZplom8Zdj26GnxzKSTeE3tRciMjbj2PFGkmeBZfC
   Xex1L8nQyi8l1/Foii7+9o40Nu/vhNfiumkXdqoPeOkBGaNsSEFVA+smK
   sBfRAz7BOqP8XJnRPGOAX2QcYJ7zCyIoD0i5sLQYuN6C6iDwHkuLSg/rS
   1ekcFcF7PbHFmBI2E01bKzgnJdmhwyh3j3fh+hr41LUOtptPWMkI0L6xO
   Py4E48s7GzstN4KFo9LWpPDm4rzCxuCE2N7ymMSjydSoWJz9sJx2Mi3OF
   Lm6gpnHMMovjHVqfR96LV4CZZ8TcfLYTNs5N3jaNXwg0R99EoEVoyIGhn
   Q==;
X-CSE-ConnectionGUID: id1BsYJ9QaeN+ImKDv8fqA==
X-CSE-MsgGUID: N2egCCprTne+huxcH2BA+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30059650"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="30059650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 03:10:51 -0800
X-CSE-ConnectionGUID: 9/sOZ+mjSemfR0n5/g25Cg==
X-CSE-MsgGUID: w8xnwOGeTtisx8PsNSxTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="124554333"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2025 03:10:50 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqs4q-0001pg-0i;
	Sat, 08 Mar 2025 11:10:45 +0000
Date: Sat, 8 Mar 2025 19:10:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/iio/adc/xilinx-ams.c:1158:2: warning: arithmetic between
 different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq')
Message-ID: <202503081901.8P1kbdE3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Manish Narani <manish.narani@xilinx.com>

Hi Anand,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a520073e74fbb956b5564818fc5529dcc7e9f0e
commit: d5c70627a79455154f5f636096abe6fe57510605 iio: adc: Add Xilinx AMS driver
date:   3 years, 3 months ago
config: x86_64-buildonly-randconfig-006-20250127 (https://download.01.org/0day-ci/archive/20250308/202503081901.8P1kbdE3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081901.8P1kbdE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081901.8P1kbdE3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/xilinx-ams.c:1158:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1158 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSPLL, AMS_VCC_PSPLL0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                                 ^
   drivers/iio/adc/xilinx-ams.c:221:39: note: expanded from macro 'PL_SEQ'
     221 | #define PL_SEQ(x)               (AMS_PS_SEQ_MAX + (x))
         |                                                    ^
   drivers/iio/adc/xilinx-ams.c:243:16: note: expanded from macro 'AMS_CHAN_VOLTAGE'
     243 |         .scan_index = _scan_index, \
         |                       ^~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1159:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1159 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSBATT, AMS_VCC_PSPLL3),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                                 ^
   drivers/iio/adc/xilinx-ams.c:221:39: note: expanded from macro 'PL_SEQ'
     221 | #define PL_SEQ(x)               (AMS_PS_SEQ_MAX + (x))
         |                                                    ^
   drivers/iio/adc/xilinx-ams.c:243:16: note: expanded from macro 'AMS_CHAN_VOLTAGE'
     243 |         .scan_index = _scan_index, \
         |                       ^~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1160:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1160 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCINT, AMS_VCCINT),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                                 ^
   drivers/iio/adc/xilinx-ams.c:221:39: note: expanded from macro 'PL_SEQ'
     221 | #define PL_SEQ(x)               (AMS_PS_SEQ_MAX + (x))
         |                                                    ^
   drivers/iio/adc/xilinx-ams.c:243:16: note: expanded from macro 'AMS_CHAN_VOLTAGE'
     243 |         .scan_index = _scan_index, \
         |                       ^~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1161:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1161 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCBRAM, AMS_VCCBRAM),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                                 ^
   drivers/iio/adc/xilinx-ams.c:221:39: note: expanded from macro 'PL_SEQ'
     221 | #define PL_SEQ(x)               (AMS_PS_SEQ_MAX + (x))
         |                                                    ^
   drivers/iio/adc/xilinx-ams.c:243:16: note: expanded from macro 'AMS_CHAN_VOLTAGE'
     243 |         .scan_index = _scan_index, \
         |                       ^~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1162:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1162 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCAUX, AMS_VCCAUX),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                                 ^
   drivers/iio/adc/xilinx-ams.c:221:39: note: expanded from macro 'PL_SEQ'
     221 | #define PL_SEQ(x)               (AMS_PS_SEQ_MAX + (x))
         |                                                    ^
   drivers/iio/adc/xilinx-ams.c:243:16: note: expanded from macro 'AMS_CHAN_VOLTAGE'
     243 |         .scan_index = _scan_index, \
         |                       ^~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1163:2: warning: arithmetic between different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq') [-Wenum-enum-conversion]
    1163 |         AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_PSDDRPLL, AMS_PSDDRPLL),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:259:34: note: expanded from macro 'AMS_CTRL_CHAN_VOLTAGE'
     259 |         AMS_CHAN_VOLTAGE(PL_SEQ(AMS_SEQ(AMS_SEQ(_scan_index))), _addr, false)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:219:34: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))
         |                                  ~~~~~~~~~~~ ^
   drivers/iio/adc/xilinx-ams.c:219:37: note: expanded from macro 'AMS_SEQ'
     219 | #define AMS_SEQ(x)              (AMS_SEQ_MAX + (x))


vim +1158 drivers/iio/adc/xilinx-ams.c

  1156	
  1157	static const struct iio_chan_spec ams_ctrl_channels[] = {
> 1158		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSPLL, AMS_VCC_PSPLL0),
  1159		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSBATT, AMS_VCC_PSPLL3),
  1160		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCINT, AMS_VCCINT),
  1161		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCBRAM, AMS_VCCBRAM),
  1162		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCCAUX, AMS_VCCAUX),
  1163		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_PSDDRPLL, AMS_PSDDRPLL),
  1164		AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_INTDDR, AMS_PSINTFPDDR),
  1165	};
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
