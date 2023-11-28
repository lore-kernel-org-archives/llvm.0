Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F846440;
	Tue, 28 Nov 2023 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G79monsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701163456; x=1732699456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/hLr0DrgfOFtKkz6bfUDw1QUykSx63HtwMc6buMtsE=;
  b=G79monszzFeaWLg9B7Uy4mi7VrrpkS9bvTMW3PSWqOw1TK4snZMNdLOu
   EI3PGMMX9BPTMm36sMTH5TQx8lkyeCyFRKdsvLP9Wmly9bMzadQYwUBWt
   gT9518Sgq+PmAXsxYsOpO43DcTodAebq539LCRuj6YN80t+zBOV0q/UKA
   u7Y31tt723lRc5iwnMZx0Yy5I1A+eVUDwGDqKCt+1GVnn1sCwMm8u19Th
   NyHs1M103wGj+ZD1eNUmJAoJbpWdltA9jKQXBvGeAzVluh7dIDavy9yBq
   Xc7fYN+29VXq16m9LPDpwBnB/mGlH9wMtwKM3wipA4UwPg8zMcWu/waOl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="395702075"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="395702075"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="912367425"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="912367425"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2023 01:24:11 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7uK9-0007Mt-1J;
	Tue, 28 Nov 2023 09:24:09 +0000
Date: Tue, 28 Nov 2023 17:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc1-esp32 18/45]
 drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:108:42: warning:
 unused variable 'esp_wowlan_support'
Message-ID: <202311281516.tX2nhfK3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc1-esp32
head:   0df16343cf22476e301de2e7c7305fa1b172cffc
commit: 4ec7aaad4e82b17d2faa76d468344969bb1ef9e4 [18/45] esp_wifi: fix build for linux-6.7
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231128/202311281516.tX2nhfK3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281516.tX2nhfK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281516.tX2nhfK3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:9:
   In file included from drivers/net/wireless/espressif/esp32-ng/esp.h:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:9:
   In file included from drivers/net/wireless/espressif/esp32-ng/esp.h:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:9:
   In file included from drivers/net/wireless/espressif/esp32-ng/esp.h:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:108:42: warning: unused variable 'esp_wowlan_support' [-Wunused-const-variable]
     108 | static const struct wiphy_wowlan_support esp_wowlan_support = {
         |                                          ^
   7 warnings generated.


vim +/esp_wowlan_support +108 drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c

68443b38720d12 Max Filippov 2023-06-27  107  
68443b38720d12 Max Filippov 2023-06-27 @108  static const struct wiphy_wowlan_support esp_wowlan_support = {
68443b38720d12 Max Filippov 2023-06-27  109  	.flags = WIPHY_WOWLAN_ANY | WIPHY_WOWLAN_MAGIC_PKT,
68443b38720d12 Max Filippov 2023-06-27  110  	.n_patterns = 0,
68443b38720d12 Max Filippov 2023-06-27  111  	.pattern_max_len = 0,
68443b38720d12 Max Filippov 2023-06-27  112  	.pattern_min_len = 0,
68443b38720d12 Max Filippov 2023-06-27  113  	.max_pkt_offset = 0,
68443b38720d12 Max Filippov 2023-06-27  114  };
68443b38720d12 Max Filippov 2023-06-27  115  

:::::: The code at line 108 was first introduced by commit
:::::: 68443b38720d1296140f260511f3281d5d5cccb5 drivers/net/wireless/espressif/esp32-ng: initial import

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
