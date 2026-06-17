Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918F2E7362;
	Wed, 17 Jun 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705314; cv=none; b=MjWdJo12kLw4yJdn6YsVNK24XIqS9AAPOd519NSLODtbk/THGX0W3Bn/LGB4T8E2J1iiLiTnkMFubwLQ32gSif6hv3m7nR/xjxmsQQNloOOSdsB4ngckRmlz3eqtTo0AeYZxXU1H3qfqDIU2jumOaJJ6TfcgMtc/3T5cDSEtm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705314; c=relaxed/simple;
	bh=Dm86Dp7aJ0/ybiyOSoljPyf8cV7TNSsxTaVUwYACK9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=slgBZjDa3Z2HTp8J18XZTmK7bwSypEjx+/8rFZMgQVmjYd7aLVRwE7h9MigKyQjpJ7euQsDEdYF3aeMYSDklZSMKSsBI+HY2w2JqQQo58JodxtH8nm8m23pPv/jVPHCoeKnbrxYpB1lmksjIhJDpPHcUQzLPrGsY4oYmZ/gR2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEl96AfT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEl96AfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781705313; x=1813241313;
  h=date:from:to:cc:subject:message-id;
  bh=Dm86Dp7aJ0/ybiyOSoljPyf8cV7TNSsxTaVUwYACK9E=;
  b=nEl96AfTgdD6RbJ21p0Q3dfEzxxfgMBao3RabKdaYvON49w8cPwzaIfJ
   8ucnPUV5AIahdT7h+ExIukOM5an0lHpcXwUAOnbvVJjNhaetrzcKxVnjc
   FO0XufKg6ZJSW+Ob0KCxKmUM0JpBVE2kGYsIvtYyEzRDpkk1bx5UdE1CB
   rFn4JYI0Aru4LvBzFu8UKZuq38fO2WRP5wfsla7YI/bepk/PFFzFFqHno
   Xw/lHnFCbI457rLbSx1sjphlJFjoSRuEjDa91L8ZiR3yje+/3kcVTrv+j
   aKYFm3KogCIP4qyh1gUmb5KdxDN2wRTiMvZAEmyxxQZcgFC3DOqrruJs6
   A==;
X-CSE-ConnectionGUID: 10S7L9QUQO2GTaspC2IUYQ==
X-CSE-MsgGUID: rd43Rk7/TEe06tbPawCLeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82507785"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82507785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 07:08:32 -0700
X-CSE-ConnectionGUID: DJXGjoXXQU2xqRFv9JoBSA==
X-CSE-MsgGUID: zUzCmglpQSe3GbiUNpEfQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252381192"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 07:08:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZqwN-00000000UXG-1orx;
	Wed, 17 Jun 2026 14:08:27 +0000
Date: Wed, 17 Jun 2026 22:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 drivers/gpu/drm/vc4/vc4_hdmi.c:2232:3: error: field designator 'name' does
 not refer to any field in type 'const struct snd_soc_component_driver'
Message-ID: <202606172108.BHkXTjAK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 05b5b2a6efd5a6e54abc6f45325da66dd0680510 [326/326] ASoC: soc-component: remove compatible definition
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606172108.BHkXTjAK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606172108.BHkXTjAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606172108.BHkXTjAK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:39:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2232:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
    2232 |         .name = "vc4-hdmi-cpu-dai-component",
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +2232 drivers/gpu/drm/vc4/vc4_hdmi.c

bb7d78568814a3 Eric Anholt    2017-02-27  2230  
bb7d78568814a3 Eric Anholt    2017-02-27  2231  static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
bb7d78568814a3 Eric Anholt    2017-02-27 @2232  	.name = "vc4-hdmi-cpu-dai-component",
db827cb34ca38f Charles Keepax 2022-06-23  2233  	.legacy_dai_naming = 1,
bb7d78568814a3 Eric Anholt    2017-02-27  2234  };
bb7d78568814a3 Eric Anholt    2017-02-27  2235  

:::::: The code at line 2232 was first introduced by commit
:::::: bb7d78568814a31a11fa14f1479a9fe51f1582ad drm/vc4: Add HDMI audio support

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
