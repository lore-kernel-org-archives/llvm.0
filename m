Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193181;
	b=HCZtAr/KR6QWUnkJ9RekkBi++bsUzXrX2l5bWoi15E/Zhqy42OEBKGmA23pP67QDallH
	 fCHo66Lqtl2JLgb5oS+w5CS4koUjJuXxS0d21FafRHptgPlKXn2n6ZBLOoyKBK57EZZ86
	 1SP5IwekCWdHnY30Qd6DhzjY6cRvlJdDHI6FP6ZxZgByTQofvm+w1WKzFBrImAEPX6Yjc
	 pjtEqt628l3xPLJ4NDYre6G5fKHcpG19/S20KcitCPecYFqIGcn1+SsknpcLXat2wZyXC
	 4FJd2JaYyEstwsruY0hGTV1cYjia/gIyIJ8h5J57/HDE/r6R9VJ+uKXxn+tE0mXYYpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193181;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=eUefPTbo5ShNdrNR6jqhsd83mgOc0UfvV5FTQi8XHu4=;
	b=bqd3mvDpCxe2MdgaIkbC5nP52Nq9/81j81crVjdf0ZpNrU6QZbh5nSeP2fUXMlnjDEii
	 EwWXe3sAQuPi0MeA58rhWBJ+7t5KAduiqftfg+KqJvb61TsG4yqYiXxQdB3+AVJneW58e
	 e4Pm+vm5MSyNnvo7uPtC3Ns2i6a5/+MrVNg7n5v1XFiE/ee9uebeSVCRgYwaobnDKgSgb
	 NKNHOiuhhMklSY2wXNgFVJVSI8zKX5Pn8x1dZyl0Cuh4BnPynsn7GbdQvLqjYX+qHfUn9
	 DNafQx0h1OjYhfBT6LE2CwsGELYXPrKsy4Am10tYf0hv8BA4q7r9JXgn1qkrMBMinOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SJQVhRaf;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B0606A31D;
	Wed, 28 Oct 2026 13:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7B0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SJQVhRaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793193179; x=1824729179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBMChI9mclm6R+VIrgllkzd3PyXlySBY8XPMLe7B4Ss=;
  b=SJQVhRafd750/8ir4MKAoryb/HBglKyIFSeC9Lc4SLHMRLpcsEfFGgfa
   qDZHNxI7E2EMq1iHzR4plsiu9kmU312eKKJEFAbq3aykRZRHc/XJHbbB5
   PjiikMxkEux78dpWp18UoQZPrjUMCbwXfm2/SGymgD3mkx0QoBrlRuul5
   MHZeiRUe8iqpqUO03mZS2lRu2neX1PI3AQb2e+oYf91odHsYXuEyBf5/b
   KUnCEXAVW0N4OHaCG26hffCIvhHdS0BZ4xbK08pF2fISYbfJhvlJueIVZ
   Muf3VEuvnaUM1jM/LiGdssV4+aqtxYJ85PEuC+gLXXNCUwEbiYXQ2EOk+
   Q==;
X-CSE-ConnectionGUID: PJGFJ1phQB+5K0YcBC/TyQ==
X-CSE-MsgGUID: fgUjgNn5TkuQ3eKu+NHfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1915881"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1915881"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:12:56 -0700
X-CSE-ConnectionGUID: ud3rbwg5R4usJBTv+Gqyjg==
X-CSE-MsgGUID: DACoMpaZQoyAqzVRsb5FFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6680909"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 06:12:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM3SX-000000004sJ-0FRk;
	Wed, 28 Oct 2026 13:12:53 +0000
Date: Wed, 28 Oct 2026 14:12:37 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 20/30]
 drivers/gpio/gpio-virtuser.c:1603:3: error: field designator 'ct_attrs_const'
 does not refer to any field in type 'const struct config_item_type'
Message-ID: <202610281409.XHHiFcDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   5e826d71d4839d8471784d968274823f1f492eb5
commit: a67ab3994716e1bfe86b53330d1cf2f5bf6bfbad [20/30] gpio: virtuser: constify struct configfs_attribute
config: arm-randconfig-2001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281409.XHHiFcDP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281409.XHHiFcDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281409.XHHiFcDP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:1603:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1603 drivers/gpio/gpio-virtuser.c

  1599	
  1600	static const struct
  1601	config_item_type gpio_virtuser_lookup_entry_config_group_type = {
  1602		.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
> 1603		.ct_attrs_const	= gpio_virtuser_lookup_entry_config_attrs,
  1604		.ct_owner	= THIS_MODULE,
  1605	};
  1606	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
