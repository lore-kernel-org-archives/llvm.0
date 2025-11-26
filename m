Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F832693C;
	Wed, 26 Nov 2025 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170291; cv=none; b=T8Pax+kQeqEA62BFAVC2W+V9sOQOAIhnigNQjXHv467cmPuUWMgT6YvXzY1mHgSNntKPTB72h8DN3edUZsIsWG1zjC3jlTbgcapqRbeiTxgt2UhpV3EjvwW/9J+J1pddnHYKinRg+HjCuyEbCZB3UPzVgwVv10e9PMmcyQwawaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170291; c=relaxed/simple;
	bh=9+hR7kxFgEDpd/P2N5Yq1iIDYHVOIcry0cvJa5c8pcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaHFJNs8o2B1o+tqzBw+Ku4WNNsQljOl1mGFKk4uoFvW4H9glsiXrOxZWaXGBArKSk4mG2I9M2xH4/upVklRB+/i9kPmghBR90+1IxJSnULJSktoZ5Qj+WOfaYuuqcfFm0x7xb/Jec7Wz0G4GLum+LdsIHP2p5l6U+zw02DEfU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzGz+EvK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzGz+EvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764170287; x=1795706287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9+hR7kxFgEDpd/P2N5Yq1iIDYHVOIcry0cvJa5c8pcM=;
  b=QzGz+EvKqoU//UqXCZo2oba4E5tx1aBk27pU2UZUXC37HxCfzmGjowjW
   GsuCJUwSrL7yRPfhN5neSUZQDjOm2bv9AtSv2x4jMXOlI97SVNLJSwAu8
   g/M+ufVrdXKMDmcfJR1t0e0hrXsPkTLoyrq2sJZSJn6Tb5NAn/1HdXceL
   gwFNsU0WN/jpFRCwSga4xFn8xE+9AHIMo9mI0/gmCbPUUgL3jR5fUt8cs
   oj+mr74nH7ot/SVLKf4q8iZbWk0W4N58nWDI7EGdIFOzKElS+KeiXzHw7
   M3+SoEEwhDGYM41HIDMzDr9fn9/FSz2Rp8w7MPZmNMNNPeCBVGK+6ZxKd
   w==;
X-CSE-ConnectionGUID: M4J7hpdYTEaNhMFUGtP7Kg==
X-CSE-MsgGUID: UAL5Oy/1T9GVx5dhebwf3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77682935"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77682935"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:18:05 -0800
X-CSE-ConnectionGUID: 6WowPgJeSa+dyjEO+cTwTw==
X-CSE-MsgGUID: NAIktyboSQGVf95RP6xDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197915013"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 07:18:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOHHM-0000000032T-1p57;
	Wed, 26 Nov 2025 15:18:00 +0000
Date: Wed, 26 Nov 2025 23:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Buday Csaba <buday.csaba@prolan.hu>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Buday Csaba <buday.csaba@prolan.hu>
Subject: Re: [PATCH net-next 1/1] net: mdio: reset PHY before attempting to
 access ID register
Message-ID: <202511262214.pygdUoQY-lkp@intel.com>
References: <6cb97b7bfd92d8dc1c1c00662114ece03b6d2913.1764069248.git.buday.csaba@prolan.hu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cb97b7bfd92d8dc1c1c00662114ece03b6d2913.1764069248.git.buday.csaba@prolan.hu>

Hi Buday,

kernel test robot noticed the following build errors:

[auto build test ERROR on e2c20036a8879476c88002730d8a27f4e3c32d4b]

url:    https://github.com/intel-lab-lkp/linux/commits/Buday-Csaba/net-mdio-reset-PHY-before-attempting-to-access-ID-register/20251125-191906
base:   e2c20036a8879476c88002730d8a27f4e3c32d4b
patch link:    https://lore.kernel.org/r/6cb97b7bfd92d8dc1c1c00662114ece03b6d2913.1764069248.git.buday.csaba%40prolan.hu
patch subject: [PATCH net-next 1/1] net: mdio: reset PHY before attempting to access ID register
config: arm-randconfig-003-20251126 (https://download.01.org/0day-ci/archive/20251126/202511262214.pygdUoQY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262214.pygdUoQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262214.pygdUoQY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mdio_device_register_reset" [drivers/net/mdio/fwnode_mdio.ko] undefined!
>> ERROR: modpost: "mdio_device_unregister_reset" [drivers/net/mdio/fwnode_mdio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
