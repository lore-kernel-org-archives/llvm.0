Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AAC2031A;
	Tue, 19 Dec 2023 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9J2V3TO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702997998; x=1734533998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ka/xTThvuxrMrbNmjd7YloPMsKbLXmeY/GI2hUSi8Cw=;
  b=O9J2V3TOvh+fZvwIbVGowGM8+TzSskoCJRBbDaccklsWOLi3JjO18kf3
   bRK9xam9ozF/qx7Y89McGtVobXsKfQp9chEp04OkHgeHlqqRW7Pp1zMQE
   TyQQmxM8lI+feUX5rypikx3t9DycGD95uTYe0K/4IZhFz5zLLowrnWdM1
   yfRQrGVc2Bq4XOtRs2AsORX+Sk8Dq3vZVTyzDVdAD/pNaW3BS51Wb5ePr
   ABZqDoGCgwhT0ppmwX0xCi4LD0by2L88WO5QEprGq25hkBNsWDhQRIVSQ
   VQZ2nE3nvL6yyMbPCtKEFiOjc96HRKqetg+u6cM/EqzGDT3n8+63hA5lA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="481858669"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="481858669"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="949189744"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="949189744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Dec 2023 06:59:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFbZZ-0005Uv-0b;
	Tue, 19 Dec 2023 14:59:53 +0000
Date: Tue, 19 Dec 2023 22:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 8770/9096] ld.lld: error: undefined symbol:
 spi_setup
Message-ID: <202312192256.lJelQEoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: b592ed2e1d78a475f781802e441c499ab446975b [8770/9096] ALSA: hda: cs35l41: Support additional ASUS ROG 2023 models
config: arm64-randconfig-002-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192256.lJelQEoZ-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192256.lJelQEoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192256.lJelQEoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: spi_setup
   >>> referenced by cs35l41_hda_property.c
   >>>               sound/pci/hda/cs35l41_hda_property.o:(generic_dsd_config) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
