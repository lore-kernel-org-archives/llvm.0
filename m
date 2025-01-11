Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D318E03A;
	Sat, 11 Jan 2025 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588974; cv=none; b=EhBYSmFnin2JssMjAjD0A1R2fO1V2xc9t1geMp3Ao+872A1yJIy5OTZkIJmusRKj8veEzx9S25FiitDLSHnry0KpqquezoLsqqEDc3Kbehtt7kY9y33U4qucXz4v2H3FhZNi9cdggZ1kyseR0THS/1tCkXwPCoINNRkce6m1CT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588974; c=relaxed/simple;
	bh=fJneAG2e2IjqcWED90SuaOpGkKAmPjMZPoMSb92OI7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOY3GQ3Ac2BQ24vy3do0piKHONzT5c3h4D608EeDKLwUj9fxNOkAIkVEY5Qy8x5P+sKcygdGueavQDKxT5zGgEZEkKGw3S+cGeLNE8BCpqVSqmDrn49uwj3rI/MHQGeHs3Owa6SpJqaxfIRu/LSDG24D+3HNfeRflIg3m0zSh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE1y9qkf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE1y9qkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736588974; x=1768124974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fJneAG2e2IjqcWED90SuaOpGkKAmPjMZPoMSb92OI7I=;
  b=gE1y9qkff2vieL1SIMbRO6wDhvzoo/sA7x2HSmDB90nkEslbNECelDTn
   VLu75pLDZA63OABm0cd2cpKn6b9MPQ1/7oJXb4Ou8ufcPJTivTH9/MxFz
   6RysfiH5Il4DEWM0+qSekOwQ1g8PyadSVOV3HmnaCvFZYYXFf3kDPeFUg
   hz8XFtECZpzChEuEsa8dHHWqE8nuvWBBRtfnUEHmMjtlCoDWpStcJJNPd
   LWoaOQ2op7J33P1weSDDX1hQylJtnNWhQoiOeERzdmimicA1Tqnr57I7p
   RYI94uMfAO2Fb0uRgCViIRcEncbhsWYIsTJwO/s+nvvWHgy6TURaiDC0s
   w==;
X-CSE-ConnectionGUID: UR8mJkAnTImF41o4wuC1LQ==
X-CSE-MsgGUID: KA705d88QV2LU97kKOjgQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40646921"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="40646921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:49:30 -0800
X-CSE-ConnectionGUID: 8yBD54+gSJ2eZrN1HyEkig==
X-CSE-MsgGUID: 14ORSzlgSyahUj2kOy/9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="103766866"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 01:49:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWY7Q-000KSP-0u;
	Sat, 11 Jan 2025 09:49:24 +0000
Date: Sat, 11 Jan 2025 17:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH net-next 3/3] net: phy: realtek: add hwmon support for
 temp sensor on RTL822x
Message-ID: <202501111711.i1W0TGwl-lkp@intel.com>
References: <dbfeb139-808f-4345-afe8-830b7f4da26a@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbfeb139-808f-4345-afe8-830b7f4da26a@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/net-phy-realtek-add-support-for-reading-MDIO_MMD_VEND2-regs-on-RTL8125-RTL8126/20250110-195043
base:   net-next/main
patch link:    https://lore.kernel.org/r/dbfeb139-808f-4345-afe8-830b7f4da26a%40gmail.com
patch subject: [PATCH net-next 3/3] net: phy: realtek: add hwmon support for temp sensor on RTL822x
config: i386-randconfig-013-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111711.i1W0TGwl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111711.i1W0TGwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111711.i1W0TGwl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/realtek_hwmon.c:3:4: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
       2 |  *
         |  int
       3 |  * HWMON support for Realtek PHY's
         |    ^
>> drivers/net/phy/realtek_hwmon.c:3:9: error: expected ';' after top level declarator
       3 |  * HWMON support for Realtek PHY's
         |         ^
         |         ;
   drivers/net/phy/realtek_hwmon.c:3:33: warning: missing terminating ' character [-Winvalid-pp-token]
       3 |  * HWMON support for Realtek PHY's
         |                                 ^
   In file included from drivers/net/phy/realtek_hwmon.c:8:
   In file included from include/linux/hwmon.h:15:
   In file included from include/linux/bitops.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   include/asm-generic/int-ll64.h:16:9: error: unknown type name '__s8'; did you mean '__u8'?
      16 | typedef __s8  s8;
         |         ^~~~
         |         __u8
   include/uapi/asm-generic/int-ll64.h:21:23: note: '__u8' declared here
      21 | typedef unsigned char __u8;
         |                       ^
   In file included from drivers/net/phy/realtek_hwmon.c:9:
   In file included from include/linux/phy.h:15:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:35:
   In file included from include/linux/math64.h:6:
   include/linux/math.h:115:1: error: unknown type name '__s8'; did you mean '__u8'?
     115 | __STRUCT_FRACT(s8)
         | ^
   include/linux/math.h:112:2: note: expanded from macro '__STRUCT_FRACT'
     112 |         __##type numerator;                             \
         |         ^
   <scratch space>:221:1: note: expanded from here
     221 | __s8
         | ^
   include/uapi/asm-generic/int-ll64.h:21:23: note: '__u8' declared here
      21 | typedef unsigned char __u8;
         |                       ^
   In file included from drivers/net/phy/realtek_hwmon.c:9:
   In file included from include/linux/phy.h:15:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:35:
   In file included from include/linux/math64.h:6:
   include/linux/math.h:115:1: error: unknown type name '__s8'; did you mean '__u8'?
     115 | __STRUCT_FRACT(s8)
         | ^
   include/linux/math.h:113:2: note: expanded from macro '__STRUCT_FRACT'
     113 |         __##type denominator;                           \
         |         ^
   <scratch space>:222:1: note: expanded from here
     222 | __s8
         | ^
   include/uapi/asm-generic/int-ll64.h:21:23: note: '__u8' declared here
      21 | typedef unsigned char __u8;
         |                       ^
   In file included from drivers/net/phy/realtek_hwmon.c:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:17:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/phy/realtek_hwmon.c:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:17:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/phy/realtek_hwmon.c:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:17:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/int +3 drivers/net/phy/realtek_hwmon.c

   > 3	 * HWMON support for Realtek PHY's
     4	 *
     5	 * Author: Heiner Kallweit <hkallweit1@gmail.com>
     6	 */
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
