Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BC176AB5;
	Sun, 22 Dec 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734909369; cv=none; b=JT4r8cYglSRqnimYNxX8vUE6QtMR1N3Viyta4Rlf7j03Qy6tFs5b+Yr+ilyCX5yZoX7exo/mdnvyNCbjMLcxOIB2IVILUAlVNxqrcye1od0+qdgqSjbDwaF2DTVZLApSc0p94UDc2vP9OqpXKRupPsmlcIaNGfWZJ8/x9D7OS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734909369; c=relaxed/simple;
	bh=iSnGKsZHwcn7zuFy/5xK/GmjqWyQ/Y3nO+zDuzOf0kQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngkI0mAFi5B7j5IxEmKybWLzEYZgWzOT2jdJFjP/ZHWnORRLJXTbBxnhHDcbcMEjkTzF0hOnBNMvTlQDvysMZ4RZ1h8jz4+6k4wIZJp0DvYRi+63YSF/w9AlIA0+Q5dn+Sq4Cpr7nzc6KLAoKns2/ABJdlFhm6Rl2b+t4Q8nxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hks8dnFW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hks8dnFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734909366; x=1766445366;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iSnGKsZHwcn7zuFy/5xK/GmjqWyQ/Y3nO+zDuzOf0kQ=;
  b=hks8dnFWrM560oXPAnbxQRkHaUaU03d87leh+7qHY6CXej2vd/c1CkVA
   XDeN2abyyQNJF+JWx84chMp3wNsl7OwS8ZBRMimBIgNfT4PX9KxcCYSRi
   U+rvQQrKuQxjz9g7sdJ9QxiDnJquAeRSba/OCXIcjfc/EF6mkqcekG4Hc
   b41gbmy30IdGCDrjFpOKe2I6n9yDhT4q9WPaxu31uhKix3Ds9/XEoPocS
   /3iUq3o8R92Lolxm9l2nCr0D34JeW0Pagy8p6IEK+TSuErCyuGxW0JeQp
   fxBtO2c6AlLJAT6ff7PLCYo7zwAJL9mVdNpA5sgHe5KDUuwTO1L0ZCQ5t
   g==;
X-CSE-ConnectionGUID: RHT5JhrRQl24vAw0z/5cVA==
X-CSE-MsgGUID: atGR38vMTwiQNWCNXPaCOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39059043"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="39059043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:16:05 -0800
X-CSE-ConnectionGUID: fzkJRPTSSz6LZSj4Y2+ulA==
X-CSE-MsgGUID: DyNzgRXXRlSm4iyMb7s7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="104022890"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2024 15:16:04 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVB3-0003GB-1C;
	Sun, 22 Dec 2024 23:16:01 +0000
Date: Mon, 23 Dec 2024 07:15:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] drivers: hwmon: add driver for max42500
Message-ID: <202412230626.JsC2Jzh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20241220012003.9568-3-Kent.Libetario@analog.com>
References: <20241220012003.9568-3-Kent.Libetario@analog.com>
TO: Kent Libetario <Kent.Libetario@analog.com>
TO: linux-hwmon@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on de076198d1e4934c5fc17aa52d5f1884f469ce1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Libetario/dt-bindings-hwmon-add-adi-max42500-yaml/20241220-092728
base:   de076198d1e4934c5fc17aa52d5f1884f469ce1a
patch link:    https://lore.kernel.org/r/20241220012003.9568-3-Kent.Libetario%40analog.com
patch subject: [PATCH 2/2] drivers: hwmon: add driver for max42500
config: x86_64-randconfig-003-20241223 (https://download.01.org/0day-ci/archive/20241223/202412230626.JsC2Jzh5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230626.JsC2Jzh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230626.JsC2Jzh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/max42500.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/max42500.c:201:33: warning: arithmetic between different enumeration types ('enum max42500_vm_input' and 'enum max42500_comp_stat') [-Wenum-enum-conversion]
     201 |         u8 comp_status[MAX42500_VM_MAX * MAX42500_COMP_STAT_MAX];
         |                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +201 drivers/hwmon/max42500.c

   189	
   190	struct max42500_state {
   191		struct i2c_client *client;
   192		struct regmap *regmap;
   193		struct max42500_config *config;
   194		long pwrup_stamp[MAX42500_VM_MAX];
   195		long pwrdn_stamp[MAX42500_VM_MAX];
   196		u8 ov_thresh1[MAX42500_VM_MAX - 2];
   197		u8 ov_thresh2[MAX42500_VM_MAX - 5];
   198		u8 uv_thresh1[MAX42500_VM_MAX - 2];
   199		u8 uv_thresh2[MAX42500_VM_MAX - 5];
   200		u8 nominal_volt[MAX42500_VM_MAX - 2];
 > 201		u8 comp_status[MAX42500_VM_MAX * MAX42500_COMP_STAT_MAX];
   202	};
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
