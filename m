Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60F1465BD;
	Mon, 13 May 2024 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715583129; cv=none; b=CKDn89TjIC/F+yiK8M9SjHKmjnl19+d+5MyPy4A4Qa0Btlb4K2ay9kRFKag2aEmBCsvykuMJ74FDjLRy61CsCP4B0L09lnzXc3E84BlmIuSAS19U20F8vcmZu4TK+lotHK4OxaVKjKYmIG7uxiJChK9+F7QvLNVXYtIYJ0atDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715583129; c=relaxed/simple;
	bh=OL2tE1fZ1OBJTjxVdngsi6icTtopNvYLzS/5rbeWJtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/pvSNC7kk2LDgnvQwOq3NvSuqQB1vR0zsWaG/Ssra/k1ySMBwOEddPEUAZPMfnH0V8Nm0SDIY3KJIC+1OXE95tslMEHeKg/a0p150KwiOHbKJr6REduX90YjuLX7ZrtVyhLtocthRcIvQBc55+hDlBHnge66uixwwQwZkzntAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wu4Pvoun; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wu4Pvoun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715583127; x=1747119127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OL2tE1fZ1OBJTjxVdngsi6icTtopNvYLzS/5rbeWJtQ=;
  b=Wu4PvounaZitKb/GdifAbkddaHFW28MaxfTqtnVXDkyeIIt8TWZBe5c0
   C9jl0IWkJuOSSBJkSic5zEp50jnXzo36uTgMlFx1P8JYVIPPsYlW/KiPs
   3eR+D+qBkUZVbXaqfxvuezsxvPCUI05usd7GxZWlEgXzpZi78d4IPEC/l
   tr/wH2jqEk9KMa8XRbxThTCNUdBE/lX70gKq2qzZnJ7BilfoI8n3tLVmC
   IJr4xXYx7vmZySx3jXo4bif9adeN4cy1mD5DnKbaTHCYl1isWtcJnKl0+
   LHBbieYrs5K26g3xuYBukh5fW/mR0u3dBcRE59DdFTMT7YDwNce+3qOZ6
   g==;
X-CSE-ConnectionGUID: yQwBmKn8Sf6leLyAmxWeWw==
X-CSE-MsgGUID: fAmrn99STCeTWV0kIoHhhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="29014693"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="29014693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 23:52:04 -0700
X-CSE-ConnectionGUID: 5N+81FMMRpiKh+0oyMLcWA==
X-CSE-MsgGUID: 0PyyO0j9Qx2PbAWhP2DDeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34657964"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2024 23:52:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6PXU-0009cN-2S;
	Mon, 13 May 2024 06:52:00 +0000
Date: Mon, 13 May 2024 14:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: michael.nemanov@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into
 wireless/ti folder
Message-ID: <202405131429.a6ytJ1gQ-lkp@intel.com>
References: <20240512183247.2190242-18-michael.nemanov@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512183247.2190242-18-michael.nemanov@ti.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 83127ecada257e27f4740dbca9644dd0e838bc36]

url:    https://github.com/intel-lab-lkp/linux/commits/michael-nemanov-ti-com/Add-cc33xx-h-cc33xx_i-h/20240513-023728
base:   83127ecada257e27f4740dbca9644dd0e838bc36
patch link:    https://lore.kernel.org/r/20240512183247.2190242-18-michael.nemanov%40ti.com
patch subject: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into wireless/ti folder
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240513/202405131429.a6ytJ1gQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131429.a6ytJ1gQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131429.a6ytJ1gQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ti/cc33xx/main.c:8:
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
   In file included from drivers/net/wireless/ti/cc33xx/main.c:8:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/ti/cc33xx/main.c:8:
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
   In file included from drivers/net/wireless/ti/cc33xx/main.c:11:
   In file included from include/../net/mac80211/ieee80211_i.h:16:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/wireless/ti/cc33xx/main.c:562:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     562 |         if (ret < 0) {
         |             ^~~
   drivers/net/wireless/ti/cc33xx/main.c:552:9: note: initialize the variable 'ret' to silence this warning
     552 |         int ret;
         |                ^
         |                 = 0
>> drivers/net/wireless/ti/cc33xx/main.c:1287:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1287 |         if (plt_mode != PLT_CHIP_AWAKE) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:1302:9: note: uninitialized use occurs here
    1302 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:1287:2: note: remove the 'if' if its condition is always true
    1287 |         if (plt_mode != PLT_CHIP_AWAKE) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:1275:9: note: initialize the variable 'ret' to silence this warning
    1275 |         int ret;
         |                ^
         |                 = 0
>> drivers/net/wireless/ti/cc33xx/main.c:2938:36: warning: variable 'wlvif' is uninitialized when used here [-Wuninitialized]
    2938 |                 cc33xx_acx_group_address_tbl(cc, wlvif, false, NULL, 0);
         |                                                  ^~~~~
   drivers/net/wireless/ti/cc33xx/main.c:2924:26: note: initialize the variable 'wlvif' to silence this warning
    2924 |         struct cc33xx_vif *wlvif;
         |                                 ^
         |                                  = NULL
>> drivers/net/wireless/ti/cc33xx/main.c:5594:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    5594 |         if (!cc->core_status)
         |             ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5619:17: note: uninitialized use occurs here
    5619 |         return ERR_PTR(ret);
         |                        ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5594:2: note: remove the 'if' if its condition is always false
    5594 |         if (!cc->core_status)
         |         ^~~~~~~~~~~~~~~~~~~~~
    5595 |                 goto err_buf32;
         |                 ~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5492:15: note: initialize the variable 'ret' to silence this warning
    5492 |         int i, j, ret;
         |                      ^
         |                       = 0
   drivers/net/wireless/ti/cc33xx/main.c:5952:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5967:9: note: uninitialized use occurs here
    5967 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5952:2: note: remove the 'if' if its condition is always true
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5953 |                 nvs_name = pdev_data->family->nvs_name;
    5954 |                 ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
    5955 |                                               nvs_name, &pdev->dev, GFP_KERNEL,
    5956 |                                               cc, cc33xx_nvs_cb);
    5957 |                 if (ret < 0) {
    5958 |                         cc33xx_error("request_firmware_nowait failed for %s: %d",
    5959 |                                      nvs_name, ret);
    5960 |                         complete_all(&cc->nvs_loading_complete);
    5961 |                 }
    5962 |         } else {
         |           ~~~~~~
    5963 |                 cc33xx_nvs_cb(NULL, cc);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
    5964 |         }
         |         ~
>> drivers/net/wireless/ti/cc33xx/main.c:5952:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5967:9: note: uninitialized use occurs here
    5967 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5952:6: note: remove the '&&' if its condition is always true
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5932:9: note: initialize the variable 'ret' to silence this warning
    5932 |         int ret;
         |                ^
         |                 = 0
>> drivers/net/wireless/ti/cc33xx/main.c:187:36: warning: unused variable 'cc33xx_clk_table_coex' [-Wunused-const-variable]
     187 | static const struct cc33xx_clk_cfg cc33xx_clk_table_coex[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ti/cc33xx/main.c:199:36: warning: unused variable 'cc33xx_clk_table' [-Wunused-const-variable]
     199 | static const struct cc33xx_clk_cfg cc33xx_clk_table[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~
   15 warnings generated.
--
   In file included from drivers/net/wireless/ti/cc33xx/rx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wireless/ti/cc33xx/rx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/wireless/ti/cc33xx/rx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/wireless/ti/cc33xx/rx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   drivers/net/wireless/ti/cc33xx/rx.c:165:5: warning: variable 'is_data' set but not used [-Wunused-but-set-variable]
     165 |         u8 is_data = 0;
         |            ^
>> drivers/net/wireless/ti/cc33xx/rx.c:172:37: warning: variable 'missing_data_bytes' is uninitialized when used here [-Wuninitialized]
     172 |                      cc->partial_rx.desc.pad_len, missing_data_bytes);
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:47: note: expanded from macro 'cc33xx_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                                                    ^~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/rx.c:157:24: note: initialize the variable 'missing_data_bytes' to silence this warning
     157 |         u16 missing_data_bytes;
         |                               ^
         |                                = 0
>> drivers/net/wireless/ti/cc33xx/rx.c:391:1: warning: non-void function does not return a value [-Wreturn-type]
     391 | }
         | ^
   drivers/net/wireless/ti/cc33xx/rx.c:393:52: warning: non-void function does not return a value [-Wreturn-type]
     393 | int cc33xx_rx_filter_clear_all(struct cc33xx *cc) {}
         |                                                    ^
   11 warnings generated.
--
   In file included from drivers/net/wireless/ti/cc33xx/acx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wireless/ti/cc33xx/acx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/wireless/ti/cc33xx/acx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/wireless/ti/cc33xx/acx.c:5:
   In file included from drivers/net/wireless/ti/cc33xx/acx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cmd.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx.h:8:
   In file included from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> drivers/net/wireless/ti/cc33xx/acx.c:677:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     677 |         if (!tsf_info) {
         |             ^~~~~~~~~
   drivers/net/wireless/ti/cc33xx/acx.c:689:9: note: uninitialized use occurs here
     689 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/acx.c:677:2: note: remove the 'if' if its condition is always true
     677 |         if (!tsf_info) {
         |         ^~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/acx.c:674:9: note: initialize the variable 'ret' to silence this warning
     674 |         int ret;
         |                ^
         |                 = 0
   8 warnings generated.
..


vim +/cc +399 drivers/net/wireless/ti/cc33xx/debugfs.c

55925ab4d177e0 Michael Nemanov 2024-05-12  396  
55925ab4d177e0 Michael Nemanov 2024-05-12  397  static inline void cc33xx_debugfs_add_files_helper(struct dentry *moddir)
55925ab4d177e0 Michael Nemanov 2024-05-12  398  {
55925ab4d177e0 Michael Nemanov 2024-05-12 @399  	DEBUGFS_ADD(radar_debug_mode, moddir);
55925ab4d177e0 Michael Nemanov 2024-05-12  400  }
55925ab4d177e0 Michael Nemanov 2024-05-12  401  #else
55925ab4d177e0 Michael Nemanov 2024-05-12  402  static inline void cc33xx_debugfs_add_files_helper(struct dentry *moddir) {}
55925ab4d177e0 Michael Nemanov 2024-05-12  403  #endif /* CFG80211_CERTIFICATION_ONUS */
55925ab4d177e0 Michael Nemanov 2024-05-12  404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
