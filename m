Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC5134A8;
	Sun, 14 Apr 2024 02:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713061891; cv=none; b=Yg5R05qmb/MayIkc2Pu9DIvvjWWMaZB+0LBL6HwHuprDU1Ts9pC6wFaJDhijtqRwtk1i5K9dWzwSRTUSxLb3ZoSDnveaCYVOyl77BYamYZ7OC7d7RZhbAO2mr+6p2VnkUU4z+jkFuOYrghEZJdOhWX3EbKfV+VmOy5VAbnocF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713061891; c=relaxed/simple;
	bh=w1+oemlR9GngmucwiYN3Qqlhba0O0Tw/aMghMq4yu/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3InDFL8vl7v1I8dELQ4NUe/H6MNe6EKzPN8mcxV0w3Jdk+ShGTTIxjQmb5JD24GDHqR7Lek7LYFf6QWZX2DUjkClIJI4PsI53dq8F5+4Am9vnaFlnQOsV9LbD3MdzWpzQEX2rzCnyvt3s9i8EPhJ00AwVosBBAVhaT/tla3LYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdKRwwXv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdKRwwXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713061890; x=1744597890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1+oemlR9GngmucwiYN3Qqlhba0O0Tw/aMghMq4yu/g=;
  b=NdKRwwXvRIsPImRSg9rK2qtV5T0ElmWAeQIE5YmOZ5x+Hr4n0HjrFD7j
   Z+n/tkn/U+pooN890rs0k5tui3AdlwhQicYlpi93d2TJP/JwmylJk0RGI
   JdkrR84RkjAaXKWbJAJA4xnSVjI9OOoWalO7CngSeG/5RnE5ujIqdI03k
   ArpSbkRbzI4E9wZelP6n8rJe07nH2d0YQvoVhoqtyhc6HKX7cM7/GxTdX
   HaX8lG8/E+UpeBgz6475VewIxnWa5UIZjvUB++G+xFc1Wzu232CM9vt5m
   MH4rv7Y4Si9VlTOuSvfRlFMUqETIviVoVil6jr/PuXF2uWKmZq6dUDVzI
   Q==;
X-CSE-ConnectionGUID: oISSv6mmTuyRE0biaKXH1A==
X-CSE-MsgGUID: KZmrrfByQoOsViC5CJNi/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8346185"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8346185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 19:31:29 -0700
X-CSE-ConnectionGUID: N8IDTJe3TLGAbOo34N9txQ==
X-CSE-MsgGUID: OIQmClcUQkWOpGUb3WrCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="59001024"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Apr 2024 19:31:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvpeO-0003AK-28;
	Sun, 14 Apr 2024 02:31:24 +0000
Date: Sun, 14 Apr 2024 10:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>
Subject: [phy:next 32/34] drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202404141048.qFAYDctQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   a1fe1eca0d8be69ccc1f3d615e5a529df1c82e66
commit: 2f70bbddeb457580cef3ceb574506083b9272188 [32/34] phy: rockchip: add usbdp combo phy driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240414/202404141048.qFAYDctQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141048.qFAYDctQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141048.qFAYDctQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/rockchip/phy-rockchip-usbdp.c:19:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-usbdp.c:1301:9: note: uninitialized use occurs here
    1301 |         return ret;
         |                ^~~
   drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:2: note: remove the 'if' if its condition is always false
    1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1293 |                 rk_udphy_u3_port_disable(udphy, true);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1294 |                 goto unlock;
         |                 ~~~~~~~~~~~~
    1295 |         }
         |         ~
>> drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-usbdp.c:1301:9: note: uninitialized use occurs here
    1301 |         return ret;
         |                ^~~
   drivers/phy/rockchip/phy-rockchip-usbdp.c:1292:6: note: remove the '||' if its condition is always false
    1292 |         if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-usbdp.c:1288:9: note: initialize the variable 'ret' to silence this warning
    1288 |         int ret;
         |                ^
         |                 = 0
   7 warnings generated.


vim +1292 drivers/phy/rockchip/phy-rockchip-usbdp.c

  1284	
  1285	static int rk_udphy_usb3_phy_init(struct phy *phy)
  1286	{
  1287		struct rk_udphy *udphy = phy_get_drvdata(phy);
  1288		int ret;
  1289	
  1290		mutex_lock(&udphy->mutex);
  1291		/* DP only or high-speed, disable U3 port */
> 1292		if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
  1293			rk_udphy_u3_port_disable(udphy, true);
  1294			goto unlock;
  1295		}
  1296	
  1297		ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
  1298	
  1299	unlock:
  1300		mutex_unlock(&udphy->mutex);
  1301		return ret;
  1302	}
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
