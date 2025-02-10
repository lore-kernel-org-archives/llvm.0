Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C625EFA3;
	Mon, 10 Feb 2025 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229217; cv=none; b=BpItblt+1Yu47R2biV2pfbKhMfJD52xfeNUb80Yktm7n9xITTxGr9NYOm8MbaOOWyftRRl/mFJoRn5qOj5iB+6XYh3EDK8O6Pz/7DG/7NSv3lkOVIrhoPuDKooE4Dnv0xvdSqza9o0oCAUTttGyZtQH79/joDgVFt6OzMwIizvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229217; c=relaxed/simple;
	bh=xGD4hz8B5Y5mw6ZnZNDUQO3yiIJ44RZZtCeU56r+3io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ot/MwbmQi/rf8WpgHfi2A2gA9HsFfwCnJQ6IO/Bk7I57kBvVCHcAT8XkjCYOUgKCA1y41CMQhboQ8W1T+/wrXjwwelNicMmAL48ua6d/MegaJUjzyJnqXrQxAavpejDEvGASZMUt+wg8nWqONmDxB5jItWojbwwM9B7OvWQmdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjIpXvOn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjIpXvOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739229216; x=1770765216;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xGD4hz8B5Y5mw6ZnZNDUQO3yiIJ44RZZtCeU56r+3io=;
  b=ZjIpXvOnnlgs6dM10e8oZf0Z21c7qxNXyEGJDN3C/K8IHVMmkr6fljz/
   LnB7WsrQ8Bao++W53+qwgM9AVCDZYIAa0sQi+JJXZBGR7MB9ytCNnWSLC
   yZn25ez+OxeLH04YO0ReqWbSoRyIScVn5XRlUIKgmr7aL/74B0QUvYvAT
   zf4+NrrJnfoIV7gNClVUITMxDtKToh+EPfG29g1p1gyZXl8K3mwzMRCN3
   wD74bBEdMJEPucBQcG/ZjhL6YglEFvCLBj0tQcQEOYiR8ZhzSpya3z2TX
   gWddlKjSuwETzAPkLJ02CNo5Nsyo+O46wKfwGVdXWaSt8uqh47ARJq1S8
   A==;
X-CSE-ConnectionGUID: w1N14OMITvWBd6lOTPf/wg==
X-CSE-MsgGUID: twRsMOtnSlet78TbPN9kzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39961079"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39961079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 15:13:36 -0800
X-CSE-ConnectionGUID: ovvfY2lyRi++QLEBT7tOsQ==
X-CSE-MsgGUID: GJwpPBS7TDyaIojhGio8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143190958"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 15:13:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thcy3-0013VT-1U;
	Mon, 10 Feb 2025 23:13:31 +0000
Date: Tue, 11 Feb 2025 07:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 3/114] sound/soc/codecs/tas2764.c:781:34:
 warning: unused variable 'tas2764_of_match'
Message-ID: <202502110710.rU4zs1n1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   6374439594d500a1555ebfed447ade5e4c203509
commit: 750abf9093b990291ad656d4f01e5d3eb5639f44 [3/114] ASoC: tas2764: Extend driver to SN012776
config: x86_64-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110710.rU4zs1n1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110710.rU4zs1n1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110710.rU4zs1n1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2764.c:781:34: warning: unused variable 'tas2764_of_match' [-Wunused-const-variable]
     781 | static const struct of_device_id tas2764_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/tas2764_of_match +781 sound/soc/codecs/tas2764.c

827ed8a0fa50bd Dan Murphy     2020-10-07  780  
827ed8a0fa50bd Dan Murphy     2020-10-07 @781  static const struct of_device_id tas2764_of_match[] = {
750abf9093b990 Martin Povišer 2022-03-11  782  	{ .compatible = "ti,tas2764",  },
750abf9093b990 Martin Povišer 2022-03-11  783  	{ .compatible = "ti,sn012776", },
827ed8a0fa50bd Dan Murphy     2020-10-07  784  	{},
827ed8a0fa50bd Dan Murphy     2020-10-07  785  };
827ed8a0fa50bd Dan Murphy     2020-10-07  786  MODULE_DEVICE_TABLE(of, tas2764_of_match);
827ed8a0fa50bd Dan Murphy     2020-10-07  787  

:::::: The code at line 781 was first introduced by commit
:::::: 827ed8a0fa50bdd365c9f4c9f6ef561ca7032e49 ASoC: tas2764: Add the driver for the TAS2764

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
