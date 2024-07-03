Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3417C60;
	Wed,  3 Jul 2024 05:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719984514; cv=none; b=lnCWg7BV2FpqueGdCs7upUG7v3iRcPKrLk+s4EXz6qYG/0cK/NOqY7tjRbYFcQfEnOzInFI20HMAu2R15E/bAGXhLzLsh8khHvPcsyXOmAEToc98TnBAikuKS2MmYa9Jgjw2NJQ5uVuKbpbwMdgK/4NSfu5Sph6uQNC63aaDaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719984514; c=relaxed/simple;
	bh=NmcpM8ZbjK5/C928dVQ7tpbGMaR2fDk4l+jdHDUk0dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NopGkaFoDBKSciAHMGuXKN05wpJN3mr29RV8pUKAWoFpGKE15Rd/TNl7xh39l+vkDgqLh7z4McsimYf9lPSvqHcpnm9io61a8EVYWAMzSvgbVNFwWFL/3HwSCppkv0i9kqdY2DcoguMRAgfzj1D/StJPOXZmGvUFvH/gKm0Gkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLLBfu42; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLLBfu42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719984512; x=1751520512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NmcpM8ZbjK5/C928dVQ7tpbGMaR2fDk4l+jdHDUk0dY=;
  b=KLLBfu42Ztt4KqKPu06Sb/JSoo3M4ZCliCCTViSyNiD/7Ti6fRmR70El
   qif+WaPZsx80SOMl1OtcdQD+EZOww+L8pfDMi4fVbD3udUHQ7jRPyRSUd
   kCczvva2K+ffjDdjfBICqinnRR993ybrTDKhKvYcd1LvZUPhJVKUvNysk
   OCicmeryLF7r8i8m76bngtjkiadps9gvXnh2TZz7hCoZ+4U2c4PTUWdsQ
   g8t9Nsmaa7T/JTLyUHvbb2ia7T4/Ycj+zKN2gMrhkSYBd73p7sEmDwvRT
   3fJgwvK6OthPjFULwzHi2fzvCRk+n0hEV2qoxxS18f5cV/bEQZLgO+wAg
   g==;
X-CSE-ConnectionGUID: U3S3qLrsRWyovaEwm4Jh+Q==
X-CSE-MsgGUID: Cp0FcypNR2uUSLkl6/kYKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21064702"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="21064702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 22:28:31 -0700
X-CSE-ConnectionGUID: RgdYGRE6Qnu1alhN+7ihPA==
X-CSE-MsgGUID: 85M9myFyRYmrgre2tt2Psg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="83688463"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2024 22:28:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOsXb-000PKQ-29;
	Wed, 03 Jul 2024 05:28:27 +0000
Date: Wed, 3 Jul 2024 13:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Vdovydchenko <xzeol@yahoo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] hwmon: add MP5920 driver
Message-ID: <202407031340.i4o4meQh-lkp@intel.com>
References: <20240702115252.981416-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702115252.981416-3-xzeol@yahoo.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on next-20240702]
[cannot apply to robh/for-next krzk-dt/for-next linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Vdovydchenko/dt-bindings-hwmon-Add-MPS-mp5920/20240702-202656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240702115252.981416-3-xzeol%40yahoo.com
patch subject: [PATCH v4 2/2] hwmon: add MP5920 driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240703/202407031340.i4o4meQh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031340.i4o4meQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031340.i4o4meQh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/mp5920.c:2:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/mp5920.c:49:48: warning: field precision should have type 'int', but argument has type 'unsigned long' [-Wformat]
      49 |                 return dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n",
         |                                                            ~~^~
      50 |                                      sizeof(buf), buf);
         |                                      ~~~~~~~~~~~
   6 warnings generated.


vim +49 drivers/hwmon/pmbus/mp5920.c

    33	
    34	static int mp5920_probe(struct i2c_client *client)
    35	{
    36		struct device *dev =  &client->dev;
    37		int ret;
    38		u8 buf[I2C_SMBUS_BLOCK_MAX];
    39	
    40		if (!i2c_check_functionality(client->adapter,
    41					     I2C_FUNC_SMBUS_READ_WORD_DATA))
    42			return -ENODEV;
    43	
    44		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
    45		if (ret < 0)
    46			return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
    47	
    48		if (ret != 6 || strncmp(buf, "MP5920", 6)) {
  > 49			return dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n",
    50					     sizeof(buf), buf);
    51		}
    52	
    53		return pmbus_do_probe(client, &mp5920_info);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
