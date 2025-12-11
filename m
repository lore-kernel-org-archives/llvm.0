Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC532D0C84;
	Thu, 11 Dec 2025 03:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425156; cv=none; b=axbzCvndElQrXdFWJc145MrcyYS1I7qR0KAYHV8ibJ9wPcynIaT4TvPeB1+jrvuIBrJjsoOUb0JK0xdHNNO70gruvb0Xiz/+RvtW2xgdMfx/BNJjqWtC8yvYsp4/Zekqxe7hKr9VI9/hFp4WvUyx8FbrkuW4HynR2BPXBdI57CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425156; c=relaxed/simple;
	bh=ZAAtV+VGLogv/+RlVSEu0skrx/+aZ8Me0QY/NpEhXiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJN5uydwsxpC3Pg8+SeBBK+onK9ddBrBgP1Vlz9SmRRGSdjjTkwQNcM4hnx5ezYNMMQBFoSK4zpSYiW9mY+P9pwS9U+xU6uFnI49ZfDf/CHhOLvScBBOYyfA02fAMS2ZT4dBWc2XK2WRA3UnMyajhbZalYQG40y7FIlBGl+bMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNSfUa0l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNSfUa0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425155; x=1796961155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAAtV+VGLogv/+RlVSEu0skrx/+aZ8Me0QY/NpEhXiw=;
  b=jNSfUa0lpdcczOnJylKMVEuandYxu4xNJ/gLAI3B4U0Ce3pS/i9+KVDC
   zTDIMWqNzrlRQ9aAGc98ACqRddl+kMaVDb8PkWIhaBVc0dQXnC49TwJcj
   GZKor0E+08JSy1QMgca5bMNhGisw6kLCV1rAAHrJEY3Jfmx7+ZXvpjMGz
   wspD1Hsogp/wa/404uWrmTSf2b5XbEd5SX4XgjiQfu4H8+CIxTDhhXGxO
   efbWsa0puDqLw7ynegDCfV223PUx1birSASFQgTIVgxOr2JcMGA4xK1+D
   /AOo3SWcusF6Sa3Yok77X0wPyHCJEjxaMaBmY8WP7NzBHk1+ODtiK6gCd
   Q==;
X-CSE-ConnectionGUID: VEGY4pbFREqCpc09dPmp6A==
X-CSE-MsgGUID: ZtBfrk5gQRaAq+JNlzdLMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71250555"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71250555"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:52:32 -0800
X-CSE-ConnectionGUID: n/hWlA02SqWUwxeHuKLKkQ==
X-CSE-MsgGUID: kKBNEIGkQy2cEjMWL19FxQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 19:52:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXjB-0000000047Z-0QaO;
	Thu, 11 Dec 2025 03:52:29 +0000
Date: Thu, 11 Dec 2025 11:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/16] lib/asn1_decoder.o: warning: objtool:
 asn1_ber_decoder+0x1e8: can't find switch jump table
Message-ID: <202512111159.Sx5UHhMX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 3ba70776dd9c02b64ba2b9dd8541be5da1126f4e [12/16] x86: Use PIE codegen for the core kernel
config: x86_64-buildonly-randconfig-003-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111159.Sx5UHhMX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111159.Sx5UHhMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111159.Sx5UHhMX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/asn1_decoder.o: warning: objtool: asn1_ber_decoder+0x1e8: can't find switch jump table
--
>> lib/maple_tree.o: warning: objtool: mas_empty_area_rev+0x473: can't find switch jump table
--
>> kernel/cpu.o: warning: objtool: mitigations_parse_cmdline+0xc1: can't find switch jump table
--
>> block/blk-merge.o: warning: objtool: bio_split_to_limits+0x60: can't find switch jump table
--
>> block/blk-core.o: warning: objtool: errno_to_blk_status+0x27: can't find switch jump table
--
>> block/blk-settings.o: warning: objtool: blk_validate_limits+0xa9d: can't find switch jump table
--
>> block/blk-mq.o: warning: objtool: blk_mq_submit_bio+0x4ba: can't find switch jump table
--
>> block/blk-integrity.o: warning: objtool: blk_get_meta_cap+0x1d0: can't find switch jump table
--
>> block/bio-integrity-auto.o: warning: objtool: bi_offload_capable+0x3b: can't find switch jump table
--
>> mm/huge_memory.o: warning: objtool: split_huge_pages_write+0x288: can't find switch jump table
--
>> mm/gup_test.o: warning: objtool: gup_test_ioctl+0x4c: can't find switch jump table
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
