Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F323D7;
	Wed,  1 Jan 2025 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735691955; cv=none; b=UXCWb30l6NdPyaG0Cla45ZK0nyi2JZGYpZWQMi7m4ruDphoCqdVdX7glWzd8JoXVzozGGOXtNTnE64lfJ4ocBBY5+a6dEqiw/QMGiNgnIsQp+xyz9pn6TSb1WSMN2/+gdsBjU9gAtEgI+++xCZ/pOOJ+hXvyHF7UxTOO1VYPP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735691955; c=relaxed/simple;
	bh=WMLBXErcDCE2zkvs0tkMsz1EUPSWjS66I15q7JY5c8U=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkDvEdkmNt2ZFMNUgl1MI+YLax3uvuVo18s/wMTWnmx7osxhA/6ZqKGQNk+vl6AxamVDWA7I6BGYV2bKSmpOg6pLLWvXJ2PYlfGDHqQfKYBMEDjPlgW4GoxyDwDMCmmtwqJmB1b/3L7+COIvFw0ex7YzZf5nmzIr7x3t3oxGWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FROXFFsl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FROXFFsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735691953; x=1767227953;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WMLBXErcDCE2zkvs0tkMsz1EUPSWjS66I15q7JY5c8U=;
  b=FROXFFslbBsup3kDTzyX4c1xplI8b0Qhl2YJkeHXEPTfxxEoXclf/Jbk
   YcFAASrDhtkEKPHrAAuzSiF5N6INSLdQtX65Esrq7p9lT4Ly1AMHPmP3D
   +9yzukXXpRhp3mRx6Un6t7r9XZdNT7mrmYx5DtudGCrafBYEKhzc8hWmK
   xgY+NcK+htI7NAKOX2MYrVzq+4laF0mMhf3HO5tZFhwI0/sC7cp64vCEE
   dp2L9xfLdIsTQ4tHG0zxFMn+blikpGckM+M8F3u8WGzecyXUjLXitE7FU
   A2K2/L4y9ymf00DPQvJiWbXVYhSJhMGRUSuiVqtNrP+ez5XYgxR6lvrYq
   Q==;
X-CSE-ConnectionGUID: NlfWBobtQWiSCH1T/stWhA==
X-CSE-MsgGUID: sa/jSPioT3GLbPn/uM8zkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35670186"
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="35670186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 16:39:12 -0800
X-CSE-ConnectionGUID: QchI8PDIRJ2536eyuX+olg==
X-CSE-MsgGUID: f53wbYM6TDS0O62t8+6FfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="101010826"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 16:39:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSmlR-0007X2-0A;
	Wed, 01 Jan 2025 00:39:09 +0000
Date: Wed, 1 Jan 2025 08:38:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/iio/adc/xilinx-ams.c:1158:2: warning: arithmetic between
 different enumeration types ('enum ams_ps_pl_seq' and 'enum ams_seq')
Message-ID: <202501010840.Xl2zoaXm-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: d5c70627a79455154f5f636096abe6fe57510605 iio: adc: Add Xilinx AMS driver
date:   3 years ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501010840.Xl2zoaXm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010840.Xl2zoaXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010840.Xl2zoaXm-lkp@intel.com/

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
