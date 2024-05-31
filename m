Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49797158A02;
	Fri, 31 May 2024 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161143; cv=none; b=YS4KWGmU07HUXNBeVieUo8qQhe4g1fjlX/GqyhnoHCvxK503bN5F7IFnmtb3oMTENWwP4JBBPEQ72J9YOMQQNPxm5b051rPjoKetviOrd85fhL25VBmMCoPDTUvyQMdiVhe3rYxqWJIF30HwlTTZw6pkB8BKgS9GlQbuXrhODHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161143; c=relaxed/simple;
	bh=D+jYgRW12mm1CrCJHdPwjI8xYOlI4+FrV4ANjLifTCw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpbHUDgoi4n2mnTpZ9viEPGO1mRmodniKnYrFGC558ueZkTGnInyyyRKif6WBtcF8puC503TitPyXk6tS3dtdJ4GX+ENzkbdJy/Geokq2ocli3jV5Ef9gvO1bQS9I43whyq+WjbC0+to+VAdjtXGV4JtR2rrukWOTWKiGf58zj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddVirbTT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddVirbTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717161142; x=1748697142;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D+jYgRW12mm1CrCJHdPwjI8xYOlI4+FrV4ANjLifTCw=;
  b=ddVirbTTPTOux4HLk4YedGltIVsApvcnk8W3EksMPkzJZ2dxGUZTFuiC
   iyZeB22I7JBGRfK6h66RhpB8g8lK1QGtJNDkeBHjMbB6KwZi4PoeyCw2n
   dDq+wCbcEkbjLf4CP3SA+2nk0+7WqkT3SIRWpdAYhRG3x7kHceTIym3xU
   0/6yWlYGuxtaN/AM7VkAajst4KYCXqqWqRbhmnvC0WoSdx3p55zf7K7io
   xyRSui8gOyLk5oNgO9sRRRn73oI1wHfRAG6UKRk2D+8b+YahbT7i2SwXF
   81oH5T4kiIfadgWXGorUsM6TT1Dai/1kYXDSU7jKzlu8vfmijuDYMI3dR
   Q==;
X-CSE-ConnectionGUID: RsnGDNOrSUyvpkAXgh9K0Q==
X-CSE-MsgGUID: dQ6aIbSfRzOVj341+QqdwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13824255"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13824255"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:12:20 -0700
X-CSE-ConnectionGUID: aQ7npH7lQ3S4qvQb7U93NA==
X-CSE-MsgGUID: je8XOlXlQ6W2ydUCwKQaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40714900"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 06:12:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD23F-000H7o-1T;
	Fri, 31 May 2024 13:12:10 +0000
Date: Fri, 31 May 2024 21:11:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jmondi:imx8mp/iob-gitlab/v6.9/extensible-format 1/7]
 include/uapi/linux/rkisp1-config.h:1033:57: warning: bitwise operation
 between different enumeration types ('enum rkisp1_ext_params_block_id' and
 'enum rkisp1_ext_params_block_group')
Message-ID: <202405312102.wicgBDe2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/iob-gitlab/v6.9/extensible-format
head:   179f4f4afe27e4c851a5e7d3f24961a895d7aa60
commit: 58734661b41fc775ca877b2364ecaa09542bea30 [1/7] uapi: rkisp1-config: Add extensible parameters format
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240531/202405312102.wicgBDe2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405312102.wicgBDe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312102.wicgBDe2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:13:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:13:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:13:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:13:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:21:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:17:
>> include/uapi/linux/rkisp1-config.h:1033:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1033 |         RKISP1_EXT_PARAMS_BLS = RKISP1_EXT_PARAMS_BLOCK_ID_BLS |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1034 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1035:59: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1035 |         RKISP1_EXT_PARAMS_DPCC = RKISP1_EXT_PARAMS_BLOCK_ID_DPCC |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1036 |                                  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1037:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1037 |         RKISP1_EXT_PARAMS_SDG = RKISP1_EXT_PARAMS_BLOCK_ID_SDG |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1038 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1039:69: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1039 |         RKISP1_EXT_PARAMS_AWB_GAINS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_GAINS |
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1040 |                                       RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1041:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1041 |         RKISP1_EXT_PARAMS_FLT = RKISP1_EXT_PARAMS_BLOCK_ID_FLT |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1042 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1043:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1043 |         RKISP1_EXT_PARAMS_BDM = RKISP1_EXT_PARAMS_BLOCK_ID_BDM |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1044 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1045:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1045 |         RKISP1_EXT_PARAMS_CTK = RKISP1_EXT_PARAMS_BLOCK_ID_CTK |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1046 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1047:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1047 |         RKISP1_EXT_PARAMS_GOC = RKISP1_EXT_PARAMS_BLOCK_ID_GOC |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1048 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1049:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1049 |         RKISP1_EXT_PARAMS_DPF = RKISP1_EXT_PARAMS_BLOCK_ID_DPF |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1050 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1051:75: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1051 |         RKISP1_EXT_PARAMS_DPF_STRENGHT = RKISP1_EXT_PARAMS_BLOCK_ID_DPF_STRENGHT |
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1052 |                                          RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1053:61: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1053 |         RKISP1_EXT_PARAMS_CPROC = RKISP1_EXT_PARAMS_BLOCK_ID_CPROC |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1054 |                                   RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1055:55: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1055 |         RKISP1_EXT_PARAMS_IE = RKISP1_EXT_PARAMS_BLOCK_ID_IE |
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1056 |                                RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1059:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1059 |         RKISP1_EXT_PARAMS_LSC = RKISP1_EXT_PARAMS_BLOCK_ID_LSC |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1060 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1063:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1063 |         RKISP1_EXT_PARAMS_AWB_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1064 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1065:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1065 |         RKISP1_EXT_PARAMS_HST_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_HST_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1066 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1067:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1067 |         RKISP1_EXT_PARAMS_AEC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AEC_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1068 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1069:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1069 |         RKISP1_EXT_PARAMS_AFC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AFC_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1070 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   24 warnings generated.
--
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:11:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:11:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:11:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:11:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:17:
>> include/uapi/linux/rkisp1-config.h:1033:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1033 |         RKISP1_EXT_PARAMS_BLS = RKISP1_EXT_PARAMS_BLOCK_ID_BLS |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1034 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1035:59: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1035 |         RKISP1_EXT_PARAMS_DPCC = RKISP1_EXT_PARAMS_BLOCK_ID_DPCC |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1036 |                                  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1037:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1037 |         RKISP1_EXT_PARAMS_SDG = RKISP1_EXT_PARAMS_BLOCK_ID_SDG |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1038 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1039:69: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1039 |         RKISP1_EXT_PARAMS_AWB_GAINS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_GAINS |
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1040 |                                       RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1041:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1041 |         RKISP1_EXT_PARAMS_FLT = RKISP1_EXT_PARAMS_BLOCK_ID_FLT |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1042 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1043:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1043 |         RKISP1_EXT_PARAMS_BDM = RKISP1_EXT_PARAMS_BLOCK_ID_BDM |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1044 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1045:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1045 |         RKISP1_EXT_PARAMS_CTK = RKISP1_EXT_PARAMS_BLOCK_ID_CTK |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1046 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1047:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1047 |         RKISP1_EXT_PARAMS_GOC = RKISP1_EXT_PARAMS_BLOCK_ID_GOC |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1048 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1049:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1049 |         RKISP1_EXT_PARAMS_DPF = RKISP1_EXT_PARAMS_BLOCK_ID_DPF |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1050 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1051:75: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1051 |         RKISP1_EXT_PARAMS_DPF_STRENGHT = RKISP1_EXT_PARAMS_BLOCK_ID_DPF_STRENGHT |
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1052 |                                          RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1053:61: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1053 |         RKISP1_EXT_PARAMS_CPROC = RKISP1_EXT_PARAMS_BLOCK_ID_CPROC |
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1054 |                                   RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1055:55: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1055 |         RKISP1_EXT_PARAMS_IE = RKISP1_EXT_PARAMS_BLOCK_ID_IE |
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1056 |                                RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1059:57: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1059 |         RKISP1_EXT_PARAMS_LSC = RKISP1_EXT_PARAMS_BLOCK_ID_LSC |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1060 |                                 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1063:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1063 |         RKISP1_EXT_PARAMS_AWB_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1064 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1065:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1065 |         RKISP1_EXT_PARAMS_HST_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_HST_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1066 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1067:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1067 |         RKISP1_EXT_PARAMS_AEC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AEC_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1068 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/rkisp1-config.h:1069:67: warning: bitwise operation between different enumeration types ('enum rkisp1_ext_params_block_id' and 'enum rkisp1_ext_params_block_group') [-Wenum-enum-conversion]
    1069 |         RKISP1_EXT_PARAMS_AFC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AFC_MEAS |
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    1070 |                                      RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:11:
   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.h:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2693:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   24 warnings generated.


vim +1033 include/uapi/linux/rkisp1-config.h

  1027	
  1028	/**
  1029	 * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
  1030	 */
  1031	enum rkisp1_ext_params_block_type {
  1032		/* "Other" block group types. */
> 1033		RKISP1_EXT_PARAMS_BLS = RKISP1_EXT_PARAMS_BLOCK_ID_BLS |
  1034				        RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1035		RKISP1_EXT_PARAMS_DPCC = RKISP1_EXT_PARAMS_BLOCK_ID_DPCC |
  1036				         RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1037		RKISP1_EXT_PARAMS_SDG = RKISP1_EXT_PARAMS_BLOCK_ID_SDG |
  1038				        RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1039		RKISP1_EXT_PARAMS_AWB_GAINS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_GAINS |
  1040					      RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1041		RKISP1_EXT_PARAMS_FLT = RKISP1_EXT_PARAMS_BLOCK_ID_FLT |
  1042					RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1043		RKISP1_EXT_PARAMS_BDM = RKISP1_EXT_PARAMS_BLOCK_ID_BDM |
  1044					RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1045		RKISP1_EXT_PARAMS_CTK = RKISP1_EXT_PARAMS_BLOCK_ID_CTK |
  1046					RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1047		RKISP1_EXT_PARAMS_GOC = RKISP1_EXT_PARAMS_BLOCK_ID_GOC |
  1048					RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1049		RKISP1_EXT_PARAMS_DPF = RKISP1_EXT_PARAMS_BLOCK_ID_DPF |
  1050					RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1051		RKISP1_EXT_PARAMS_DPF_STRENGHT = RKISP1_EXT_PARAMS_BLOCK_ID_DPF_STRENGHT |
  1052						 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1053		RKISP1_EXT_PARAMS_CPROC = RKISP1_EXT_PARAMS_BLOCK_ID_CPROC |
  1054					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1055		RKISP1_EXT_PARAMS_IE = RKISP1_EXT_PARAMS_BLOCK_ID_IE |
  1056				       RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
  1057	
  1058		/* "LSC" block group types. */
  1059		RKISP1_EXT_PARAMS_LSC = RKISP1_EXT_PARAMS_BLOCK_ID_LSC |
  1060					RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
  1061	
  1062		/* "Meas" block group types. */
  1063		RKISP1_EXT_PARAMS_AWB_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AWB_MEAS |
  1064					     RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
  1065		RKISP1_EXT_PARAMS_HST_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_HST_MEAS |
  1066					     RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
  1067		RKISP1_EXT_PARAMS_AEC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AEC_MEAS |
  1068					     RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
  1069		RKISP1_EXT_PARAMS_AFC_MEAS = RKISP1_EXT_PARAMS_BLOCK_ID_AFC_MEAS |
  1070					     RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS,
  1071	};
  1072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
