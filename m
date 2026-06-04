Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A41EF09B;
	Thu,  4 Jun 2026 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540321; cv=none; b=lUTE7xvLDX0ldFTFuO4Zlw42mUElu7Jz5+8X3EOe3eBPglCB4jUnUzpsvRxcdkHLDUkvG8YTZzhxweQe/d4/V0s0jr9kjEfzlgxW5jRJxfwrxGAVbcNisnfjSVt8ByTLa2e4CnUl2rhVoF5eDO8QeNQE8zGARxjRqbizomohG/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540321; c=relaxed/simple;
	bh=ecX+LEyNr+KiQv+ml+XwvO5CEqaF8QSrr+6scWJ9hro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OYGY051hqVcQnFUbhVwXAFgvX2oM9//pw7nOhqcAO+obJus9H8WL/8n8mtCaWR4suQKLiGAG6IQBYpM5g+IJqgaVeREOL9HyUzqGYByk2hT3GrWLcLgrHko9Onut9AzjJp0XtEdS3O/Oaj62kmooGdDl9nW5FdgJNuvvIRhz6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFLSNfg7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFLSNfg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780540320; x=1812076320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecX+LEyNr+KiQv+ml+XwvO5CEqaF8QSrr+6scWJ9hro=;
  b=XFLSNfg7hFoldiKd+WBqpMYHpHyZkg1EqwRu0bK8B996vfrJzoIyEH2L
   tKB+IAwVNJqkSm9bsju58x7K6BDf2VFrtPQqQYX2NYxxo814asLeHxCZb
   AcvK7JxrMpR5GGrrYbw2BWB9nNxdhQZSiKGMZmAlohOOTUD5AMK8zBgGT
   VVMLscO1aoIxm8QpbJkAw40y8K7q0qA/eJwv6n6F7x6wH1fUFr21XMhQk
   IR2GdOEF+Hzr3Wg1bLKBYLnzrNWuX6J6faDPzS9Jkde8+kLAihi29guSI
   IYttRFkA9clw5a/LaJxTmRQgzW81sqiTKNljfkBSeEDZy6nTD+EE3vCk9
   g==;
X-CSE-ConnectionGUID: 7O9OU+BUQbmfpaN455JWSQ==
X-CSE-MsgGUID: yQXpu3YLThika8xnH/WXFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81489411"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81489411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 19:31:59 -0700
X-CSE-ConnectionGUID: AxkxxfF7SWWRaMTzd4Ucfw==
X-CSE-MsgGUID: 39dtM/D6QVm0vmvMl7BYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268070865"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 19:31:56 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUxs9-000000002G1-2x9X;
	Thu, 04 Jun 2026 02:31:53 +0000
Date: Thu, 04 Jun 2026 04:31:26 +0200
From: kernel test robot <lkp@intel.com>
To: "Jonas =?utf-8?Q?Schw=C3=B6bel"?= <jonasschwoebel@yahoo.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: drivers/hwmon/emc1403.c:669:15: warning: cast to smaller
 integer type 'enum emc1403_chip' from 'const void *'
Message-ID: <202606040447.wMiarOHP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-hwmon-lm90-Document-SMSC-EMC1402-1403-1404-1428/20260603-223112
head:   7ecd216775028bbe12faecefad3fe2d0b5c13698
commit: 4fa4634e45d9f0c3637033dec6512af69c164516 hwmon: (emc1403) Convert to use OF bindings
date:   12 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260604/202606040447.wMiarOHP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040447.wMiarOHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040447.wMiarOHP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/emc1403.c:669:15: warning: cast to smaller integer type 'enum emc1403_chip' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     669 |         data->chip = (enum emc1403_chip)i2c_get_match_data(client);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +669 drivers/hwmon/emc1403.c

   658	
   659	static int emc1403_probe(struct i2c_client *client)
   660	{
   661		struct thermal_data *data;
   662		struct device *hwmon_dev;
   663	
   664		data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
   665				    GFP_KERNEL);
   666		if (!data)
   667			return -ENOMEM;
   668	
 > 669		data->chip = (enum emc1403_chip)i2c_get_match_data(client);
   670		if (!data->chip)
   671			return dev_err_probe(&client->dev, -ENODEV, "Unknown device!\n");
   672	
   673		data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
   674		if (IS_ERR(data->regmap))
   675			return PTR_ERR(data->regmap);
   676	
   677		hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
   678								 client->name, data,
   679								 &emc1403_chip_info,
   680								 emc1403_groups);
   681		return PTR_ERR_OR_ZERO(hwmon_dev);
   682	}
   683	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
