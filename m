Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090567494;
	Sat, 26 Apr 2025 23:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745708569; cv=none; b=RuTOp1BtEeLCD8/8dmzSzP1IV8Oo3FskqZjzQK0D+HTZ/3r9J40NYHegPhW2IgtHkb4iJEIlg7UVI+B7XKPH2psGgdiZqo4DF0bR+x0H5CC1UP1uIsdzRjKSfRyURr58MLWtlxFREKK7EpGknvUqGX4Z+arwJngb8WtvSHrOj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745708569; c=relaxed/simple;
	bh=8Sy8u61N0SG7KWgoAF+6QIjhowpXLXZkpX65CJXZmCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDOS2oYdlQYVzgqG6FEmu3bCWWLCSgra3NoKg3/AmwD34oZyeHlOvv1UiSPvUvYFEZYmGyB6fP58u3QmzWdoqndGh1V00Ab3DdEqbmII9P2W/q87wEXHcJUR/vUkHnVAwvMHO8g172+VvFcsyw+HALRXrAbTqI/iC9RRbXGlNOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie4pGmIT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie4pGmIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745708567; x=1777244567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Sy8u61N0SG7KWgoAF+6QIjhowpXLXZkpX65CJXZmCw=;
  b=ie4pGmIT++0PljxSWZI5T1xaIz3MxsR1XULeXrB4AzLwXLnbp7yHP83I
   hBVzUEe1Zlfcym8v7hwi7vvasWJV/Q785Vo9YpPoV9BS6AGX0P9OXPUnx
   //M3GiWcMtHKZvw7iDQQQoug53vZh33F5oZN55WUVpV3JJd+cfo//p4lK
   yUjgZllmShWjZ2gMH15nfWI/YEwHBnXLKUwHhyq2HlbskYo3INboc2uuk
   +dq5vJkv0AJQTQemyXY0zBDS3Kyj/5kCHCHTTA+V4i2twtuCco189ilUj
   5dJQtCzmDmFUEzZTYd/A6dUA8XFMZyQo6ZAkTf8Ud/j93UWxTcD4WTMg8
   g==;
X-CSE-ConnectionGUID: s3HbN+WbSvGxR6VGUKFBMQ==
X-CSE-MsgGUID: Q7brTYcrRT+iEICoCC/Htw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="64862824"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="64862824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 16:02:46 -0700
X-CSE-ConnectionGUID: Hd2BN2pmS0edHP1aAa1XJg==
X-CSE-MsgGUID: Mzimxq45TYa7F5La8cI3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133685505"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2025 16:02:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8oXj-00061J-0J;
	Sat, 26 Apr 2025 23:02:43 +0000
Date: Sun, 27 Apr 2025 07:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 5982/6092] ERROR: modpost: "get_phy_device"
 [drivers/net/phy/mdio-bus.ko] undefined!
Message-ID: <202504270639.mT0lh2o1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 52358dd63e348c3b6c488acc105be1aeda8fb923 [5982/6092] net: phy: remove function stubs
config: powerpc64-randconfig-003-20250427 (https://download.01.org/0day-ci/archive/20250427/202504270639.mT0lh2o1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270639.mT0lh2o1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270639.mT0lh2o1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "get_phy_device" [drivers/net/phy/mdio-bus.ko] undefined!
>> ERROR: modpost: "phy_device_register" [drivers/net/phy/mdio-bus.ko] undefined!
>> ERROR: modpost: "phy_device_free" [drivers/net/phy/mdio-bus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
