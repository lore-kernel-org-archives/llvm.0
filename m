Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80920168483;
	Sat,  2 Nov 2024 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730541331; cv=none; b=deG18LHqM9Y8ncDOvFKt0mZgeqqkDrFC6Q20RIglsf+i/8Vn4GY4n3JhZOF/k2cQbklaZJ3qAqkZavvkx2jjr41Kj67nssmahOYpQtHSncytChG9HqWOMpNDnSeLf2TWKYhlVgY3xn1EaaPnaz9BZGWCBgBfScNn+lYi0EiU6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730541331; c=relaxed/simple;
	bh=6MZvuWxach0D6KdBxftJFx+qE18sHV16xHYPPUUlxWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=utTGffxTF4HFYIOUInPVAEpJXeI+f3ddSGLNZt6nLo+Jymh0znc/qRFVE/776mH1Zk4LmepMIaRGXBz7mFiCT/L1lf+dTJS1ynZfcfRKy1FCOJxInZPEm/Quojza+4ZSFkY/4Xco5c/95Esr8xtH1WlNRXG29rj2bZop/7YpE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nl1mlU6S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nl1mlU6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730541329; x=1762077329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MZvuWxach0D6KdBxftJFx+qE18sHV16xHYPPUUlxWw=;
  b=Nl1mlU6S9MHEJm6HxXXLgCra/Yee+wkbLNM87ThWvEtCDSsuQHIFmWCr
   1Vqy0uckqONzxu8lgJmxMsc3klH2Syl2KC+ByyjrDFX9avlXhz4bHpKTN
   DTjP422Cc2w5JNslDEScANOBBXYhUej305kkhV4BNOpzH6KG2mR2xt1rz
   FxnfhCNRvF/k/7hM5La4VCwieABEgkoP6lW08x99uUrL7451ZU04iNSMF
   nMpvELONjIZzXmg+YPy1jr6TyBQOwjbbPTXUMrj2W9dGJDV258/9DigVj
   QIWvvDFbxaaOBHHqpzqDkCCXboI8jEYDQCOzLTGmRbuYkDUKua+fszlyd
   Q==;
X-CSE-ConnectionGUID: xHooVFXKSa2uhux6msBBPg==
X-CSE-MsgGUID: w5KzU1uqTje2/JocNxjA2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41697119"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="41697119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 02:55:29 -0700
X-CSE-ConnectionGUID: td++E8PLSZmf3bJgASgugg==
X-CSE-MsgGUID: 3uW7WNrtQvin50uZGoZYMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="88320982"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2024 02:55:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Aqr-000ihx-0X;
	Sat, 02 Nov 2024 09:55:25 +0000
Date: Sat, 2 Nov 2024 17:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:v2_20241024_wangweidong_a_asoc_codecs_add_aw88081_amplifier_driver
 83/150] ld.lld: error: undefined symbol: sdca_device_quirk_match
Message-ID: <202411021722.DiX1Y5sf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20241024_wangweidong_a_asoc_codecs_add_aw88081_amplifier_driver
head:   88264e4f0b6695245cea2810bf54bebf1c98c070
commit: 5703ab86ff7bf079aa1ddf7a65b9727d0249383a [83/150] ASoC: Intel: soc-acpi: add is_device_rt712_vb() helper
config: i386-randconfig-011-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021722.DiX1Y5sf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021722.DiX1Y5sf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021722.DiX1Y5sf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sdca_device_quirk_match
   >>> referenced by soc-acpi-intel-sdca-quirks.c:31 (sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c:31)
   >>>               sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o:(snd_soc_acpi_intel_sdca_is_device_rt712_vb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
