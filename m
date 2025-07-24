Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFE26560D;
	Thu, 24 Jul 2025 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345202; cv=none; b=i/+SbbxOAUnCkBKYnhar8i6ZoHTGJrerClqLrkXgOsJBfvClbTqgvIEM8hl8IwcE3VNnu7nh4eeQ4MTG14Bm7l4CunrLGbm/J3YHp52UDOcXLxhVOSeZMMGww+Qg27kkPM0jJsVSZOFhIQ9/zQqCUWx90b82Y7TbbZBktBlQ/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345202; c=relaxed/simple;
	bh=GPDvqI9AvDaBf6pFc5E7uhO2SAdwewG5nqXm33wh0/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2ra9awJQk6P1iuWJvAiAv3Y8w9w7Zgl94jaqCI2uEYHtTRYvcSWrwpjARjPzDk8IxvSsCMSIIzzVb72447fKPkdO4S0LGeIARk13Hzd6mMiGtU+2M3h538xVKDtHNKFckMyzhVN8E3DuTnGfnQQkHfi79noD2azV0g7BCJGkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0VbccSs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0VbccSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753345201; x=1784881201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPDvqI9AvDaBf6pFc5E7uhO2SAdwewG5nqXm33wh0/Y=;
  b=P0VbccSsr8eP2oTfKk6gzeIg1EKOTQfokO3OcnLXnxOwXtO4U4u9Jlw3
   h8Oz7E0SxXDmxgb9dC5DKAvpEAdwKrEEtlT78fNqWKxk1I+7wXp2RGcj0
   OPoNtOWtA+LZ238nFIDHWaRkER+vzugpCm1aJc4k+xZtoKI3GH9Qs7niD
   2FW0kdutOwsWgZ+8VVhTC2XV7ZuofYj2sKnOVZ1xvtXzcyP45G5e2qhri
   /gH1+lpGRiVK6FJBv79mcJRO7jsa6Geh/Q1xRCuV/2F5pwCuDBPljU36L
   OC3cpjeuwJXFaJ/O1ef32widTkvTd7vHGokoPZWyZxgxjVF45fFBOJbJc
   Q==;
X-CSE-ConnectionGUID: 5dZelzE1RNyhv3r4JZom6A==
X-CSE-MsgGUID: muWmr6D+QSqrQf/K0Ky8ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66343826"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="66343826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 01:20:00 -0700
X-CSE-ConnectionGUID: qF7h7IpUTDqmWqueSrO5Tw==
X-CSE-MsgGUID: rkABhtl7ScSLiB7jDMShsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159319614"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2025 01:19:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uerBE-000KDj-2G;
	Thu, 24 Jul 2025 08:19:56 +0000
Date: Thu, 24 Jul 2025 16:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 11884/12139] drivers/rtc/rtc-pcf85063.c:566:37:
 warning: unused variable 'config_rv8063'
Message-ID: <202507241607.dmz2qrO5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
commit: a3c7f7e16ea8f1c8a34227c7ea08a7e002c2608b [11884/12139] rtc: pcf85063: add support for RV8063
config: hexagon-randconfig-001-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241607.dmz2qrO5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241607.dmz2qrO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241607.dmz2qrO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-pcf85063.c:566:37: warning: unused variable 'config_rv8063' [-Wunused-const-variable]
     566 | static const struct pcf85063_config config_rv8063 = {
         |                                     ^~~~~~~~~~~~~
   1 warning generated.


vim +/config_rv8063 +566 drivers/rtc/rtc-pcf85063.c

   565	
 > 566	static const struct pcf85063_config config_rv8063 = {
   567		.regmap = {
   568			.reg_bits = 8,
   569			.val_bits = 8,
   570			.max_register = 0x11,
   571			.read_flag_mask = BIT(7) | BIT(5),
   572			.write_flag_mask = BIT(5),
   573		},
   574		.has_alarms = 1,
   575		.force_cap_7000 = 1,
   576	};
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
