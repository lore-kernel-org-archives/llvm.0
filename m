Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF342D61E;
	Sat, 25 Nov 2023 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbeN3cHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700934987; x=1732470987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsoTqpafrAnBZcS+rNOk/EEWenRQKP+O2sQldtTLPn8=;
  b=TbeN3cHRicub9MCe+lCKmLtlfCUZ9I2NOGlcAkEM/YfS9P6YRE4WqnN4
   0E8Y8hem7YQmvCQG5H+qfSRvStdROAJL/wog0se70xOsMeEN7xwWL5+T4
   yEc0dnqp/SMo4ktMD/rCbWsRXYDMagVHe/EVNonxZ5PXYVgMKDjzeBrtA
   DDVdjQZ908i8FXf1kn1iBWLEcy8y2voCkvlDvwZkI+K5IxLY/Gb0sz32H
   bEqddHSf9TfoMmJRipatM5uqVd9oNccM2S/B6a0Tduqw3dfvIbHZbWyuC
   Ajcd94FAwTJ/p5EgYf6lkZB2tVlexkhhFnw7Z73czjlpWNVkP3+G1a6/g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377572081"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="377572081"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 09:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="858627604"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="858627604"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2023 09:56:22 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6wtA-0004G4-2H;
	Sat, 25 Nov 2023 17:56:20 +0000
Date: Sun, 26 Nov 2023 01:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 15/100]
 sound/soc/codecs/cs42l84.c:1019:34: warning: unused variable
 'cs42l84_of_match'
Message-ID: <202311260145.0ChiOMum-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: 827931e09e9997aa37a11fc39ed89a303ecf6cd1 [15/100] wip: ASoC: cs42l84: Start new codec driver
config: x86_64-buildonly-randconfig-004-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260145.0ChiOMum-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260145.0ChiOMum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260145.0ChiOMum-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l84.c:1019:34: warning: unused variable 'cs42l84_of_match' [-Wunused-const-variable]
   static const struct of_device_id cs42l84_of_match[] = {
                                    ^
   1 warning generated.


vim +/cs42l84_of_match +1019 sound/soc/codecs/cs42l84.c

  1018	
> 1019	static const struct of_device_id cs42l84_of_match[] = {
  1020		{ .compatible = "cirrus,cs42l84", },
  1021		{}
  1022	};
  1023	MODULE_DEVICE_TABLE(of, cs42l84_of_match);
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
