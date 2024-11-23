Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D004C139;
	Sat, 23 Nov 2024 04:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732337170; cv=none; b=IswAeefWNYn+RJvZYWgbS+314fcX0mkgGi4zdQ8xX5HVyaxiejLZzjJjFVvHjn+f45mDMXG86hx7KOFyjq1cb6xNr7O2aJn/bIOfngtGnghL0MUjgisdAENPeQ3C2w2v1Nz1BNSNItI65VQoJYQp5KNk0v+29Alw5WIqbp66hG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732337170; c=relaxed/simple;
	bh=ymezLTy2kI1j7k5cJ+BeZ5Mvox8T4TUJ/AHJmTCYx18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVW8U2SBDeRa2NF9z+qGpkfLu940Bl0PIo3w9dEDjJNl3qMMbXWhdNJxnqpwYIZA6SdfMpJsV6U5WQqnD6gTeWZkj1UE/BDsXOCy3fn+hq64a4luKEOXhnoCXcJL0BtGr1K6Z996qIQAT4oZDnEqZoC03HSev60MJawZOQYNVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bojIAU1T; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bojIAU1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732337170; x=1763873170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymezLTy2kI1j7k5cJ+BeZ5Mvox8T4TUJ/AHJmTCYx18=;
  b=bojIAU1TM2VzBpFq3oBYUlncpPjnKw0TpUOt0MnLcqvuW+OJSRSkjHp6
   Dt5VYKRXf4ekTI/Sd8MT7gGWLf1w6Ljos0clEJvM+pz61BnNsdeS+opGF
   PE71SL1sXR56XiPnhznFCGlgZkA/GH1WD/I5NviT+OgEPx9Ht9Tmu734h
   MA+chJ32U6Tu3I2Zf6c4PvzRDNV5QkKv/TmvyKB9V7SvcsLA/bzeOwtce
   Drjt+F2Djq8R1FWh9TpgYxB4gh9NhT4on5eOfcLBV/tvftZdXSkwW7ivL
   YxL8ONvlbU1OOEyc7j7YYCLPrvW/iiadOzlDNR9auIsZtbTUU5q6ZXMId
   A==;
X-CSE-ConnectionGUID: ZeIMRJV4SymBKH8RVjTejA==
X-CSE-MsgGUID: JokrjjAJTjuI303ESRzPUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36280590"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="36280590"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:46:09 -0800
X-CSE-ConnectionGUID: f0dosGyoQ365/OPFZh/vqQ==
X-CSE-MsgGUID: dgrHFsobTD6IoSaksmX6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="121626456"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2024 20:46:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEi21-0004RB-0C;
	Sat, 23 Nov 2024 04:46:05 +0000
Date: Sat, 23 Nov 2024 12:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Li Nan <linan122@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>
Subject: ld.lld: error: relocation refers to a symbol in a discarded section:
 .Ltmp78
Message-ID: <202411231215.IsJm3IZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619d996c86421da1057d589123a28e2da0bf0785
commit: 62ce0782bbacd32ec10292b9bdd127330e9b6968 md: ensure child flush IO does not affect origin bio->bi_status
date:   5 weeks ago
config: arm-randconfig-003-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231215.IsJm3IZm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231215.IsJm3IZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231215.IsJm3IZm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation refers to a symbol in a discarded section: .Ltmp78
   >>> defined in vmlinux.a(drivers/md/md.o)
   >>> referenced by md.c
   >>>               drivers/md/md.o:(.alt.smp.init+0x120) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
