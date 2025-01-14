Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EB22DC3C;
	Tue, 14 Jan 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850113; cv=none; b=EzpX/X97nFUsmJkusb4QZxe6OZ1z5q8NDw5F+rytLmtOoP/PysQ644NN9QOv9jqLpUy0SYTC2ffIelZsLnkdPvpv50mFfjyMQmfzM41Tt/yTd4ekCIMoNkc/N899N7WxxPGNz9Z1RIYYouyqAly2l8LECGoqltC3/0O5WkyL0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850113; c=relaxed/simple;
	bh=GObF6p19pdU3AzyKmBdvI9K0nX8C9K8IjMBMZ8ppzSQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARb/WZfHP+tw4j7xaO7njpceKoQ3EkZiUQN1xZZEt5UD4Ukl6vkA9eu0CbSQ7fsZLdYM7ei6UzCxsXm89S2aQqBImt8qIieqeto24uSpef8vqf3GWGiqH7JNTyVars34rUOfulN3QxupzeI8C66AAYtykshSeYbqkKF5UBHHieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMEWet31; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMEWet31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736850111; x=1768386111;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GObF6p19pdU3AzyKmBdvI9K0nX8C9K8IjMBMZ8ppzSQ=;
  b=iMEWet31w+WbgtfFh2kLsVW5+bt6t43RoxthUL3xv3oxZMjl254rvcEm
   fPODmY1HcKJvVHk2ZNlxUgP145DGDBcwKAH5wpltz9TgenYM0fBliQgzI
   0Lvn43gktAr4ipnLVgrHREDEcRIZbmP/kk13eLq/L01N5SF85Lt/vaGSk
   h8I6aZl46i2DgIXL2Wj/tKqMNGkaJ4BBlB2haMhde28ixBkJBtjr/qdQR
   Uu08JSGl4x4SVPK7UPwpyuzcdjvx6C+3BtNX0F9kFIVKcYg2tts3sWdTQ
   D5eGcprKmvGSZZfcT+BpdA4SLFjus0p5Sfd4ECwLT1Z0NePl5nNV7Zg6e
   g==;
X-CSE-ConnectionGUID: lMAFij/zSNeOM1SAa8tXEw==
X-CSE-MsgGUID: KMpSP2rCQd+JkIus6WgWkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48546092"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48546092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 02:21:50 -0800
X-CSE-ConnectionGUID: 49gj2gTAQeCFo9vwpVlSaw==
X-CSE-MsgGUID: id8R3q4NTxqNxRkMdoTXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108824554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jan 2025 02:21:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXe3P-000OOJ-2F;
	Tue, 14 Jan 2025 10:21:47 +0000
Date: Tue, 14 Jan 2025 18:21:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/iio/adc/xilinx-ams.c:1158:2: warning: arithmetic between
 different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq')
Message-ID: <202501141851.emYtMGL6-lkp@intel.com>
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
head:   c45323b7560ec87c37c729b703c86ee65f136d75
commit: d5c70627a79455154f5f636096abe6fe57510605 iio: adc: Add Xilinx AMS driver
date:   3 years, 1 month ago
config: arm-randconfig-004-20241229 (https://download.01.org/0day-ci/archive/20250114/202501141851.emYtMGL6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141851.emYtMGL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141851.emYtMGL6-lkp@intel.com/

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
