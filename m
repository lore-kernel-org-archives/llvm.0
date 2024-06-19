Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF215217F;
	Wed, 19 Jun 2024 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813952; cv=none; b=Y2cmu/sOikvD7KwsGKTO9bBUbt9OeOey8f3pfOqSGJmcHpTHbGhUYCaMnys1lMahd/aI22RW8GyYfWm1H5mhHhcjAJBvHEpwTn7hcM17Z9MUjXmdlkNwujdgbmg1Bx71Bi5V1dwqjBaftHqhJ53fWyuTXdG372ynI0PeYSMn6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813952; c=relaxed/simple;
	bh=lYkNZB0629KlZhon3CKgpJMfP2sJzPjjaTvW13OpSjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaVGEupFhrSt7l0Z31s9s+tZQ1FQeioK5Zh56a8FPqxjANIoltV5FYQBWfj9BvQqqUqm/cqAkQLVr8k083hSHMyxb8P2X9CoQV4ltCH1bbvq8hw5oxysIAg9R06EPtpjFL0F0FVFD9U5bc543zqu2CsfJeyLKpTHLScH6+G+l6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRVmi0Vr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRVmi0Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718813949; x=1750349949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYkNZB0629KlZhon3CKgpJMfP2sJzPjjaTvW13OpSjw=;
  b=nRVmi0Vr5q4rvqvJB5OtHCn1p6frvp+VGPf/klIb3zTNuoe6rpgOsUYq
   h5+RcjhLy85I50hG87/M7E4hKF2jQi/AXnbVMTxRiNDNgeXu8RmZy/F/A
   aH2XvN4mPqk6e1AuE+zepnUBM1DJQlhuMZB9kEt+9+9u7eyElGDWPx+gj
   C+UtLuufM13TsLVxaDzUXNM6ekdOI1JAvfFjlM7EuKxGXKUujdoO59V84
   dsRKhf5vwDYMrv+zhzxeiD9ZYaxWR39hxbDjLiCUJMIAPrVM4WExN9FH4
   PrEZyzCs4IGPzW6Sswb/hkPS5gOP5uW+lnaSPum8uAnCkfdOZgEA2JZ92
   g==;
X-CSE-ConnectionGUID: EdZTtThzSTyEKkuyWhSPbg==
X-CSE-MsgGUID: PuaGIbwURGWd0fCEK/Kulw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15599731"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15599731"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 09:19:08 -0700
X-CSE-ConnectionGUID: vUIQNYzXSdOpUBxVsLSsoA==
X-CSE-MsgGUID: XgNIycm1SQ2Pq9SfmdMrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="42095242"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2024 09:19:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJy1Y-0006kh-0G;
	Wed, 19 Jun 2024 16:19:04 +0000
Date: Thu, 20 Jun 2024 00:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file0IqEIN 13/14] sound/soc/codecs/rt1318.c:1340:3:
 error: field designator 'probe_new' does not refer to any field in type
 'struct i2c_driver'
Message-ID: <202406200054.fkVIlKhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file0IqEIN
head:   04c200922d911f7a33febc0e7991f3a2efd856ad
commit: 48ed4d2435aa749a8d59fd7543313d51d0800175 [13/14] ASoC: rt1318: Add RT1318 audio amplifier driver
config: x86_64-buildonly-randconfig-005-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200054.fkVIlKhA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200054.fkVIlKhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200054.fkVIlKhA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt1318.c:785:5: warning: no previous prototype for function 'rt1318_pll_calc' [-Wmissing-prototypes]
     785 | int rt1318_pll_calc(const unsigned int freq_in,
         |     ^
   sound/soc/codecs/rt1318.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | int rt1318_pll_calc(const unsigned int freq_in,
         | ^
         | static 
>> sound/soc/codecs/rt1318.c:1340:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
    1340 |         .probe_new = rt1318_i2c_probe,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1340 sound/soc/codecs/rt1318.c

  1333	
  1334	struct i2c_driver rt1318_i2c_driver = {
  1335		.driver = {
  1336			.name = "rt1318",
  1337			.of_match_table = of_match_ptr(rt1318_of_match),
  1338			.acpi_match_table = ACPI_PTR(rt1318_acpi_match),
  1339		},
> 1340		.probe_new = rt1318_i2c_probe,
  1341		.id_table = rt1318_i2c_id,
  1342	};
  1343	module_i2c_driver(rt1318_i2c_driver);
  1344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
