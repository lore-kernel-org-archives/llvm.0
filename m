Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1318C332;
	Sat,  3 May 2025 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746246999; cv=none; b=qgi7saygtgONsvDhkvSQmgPNvyZb/QqL4QLMYBXht3MXnvoyaCdM8SEpvuq94RHE8QjrAcw8297MwMNdlA5HkQWnwGGyw2cLP2zQjiICjKrxxyA9liQnBx5zd9fM4Ud72w9aiqDyciPh9pLfKFCJC10HW/TZr9kjvNSrI+IUgls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746246999; c=relaxed/simple;
	bh=ge0MxYCjlv/d6KCBzZjehBZaE/6ME8+3TaGWiefnB90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HbGV+Sshq+lw+EdFni7+KJy3hx6FTLASsaUoU/pPoXr+oOuSHUdNMdhmsHZGsXyCMW+KqhZxxyfoQ+ZXIeGE5FdfVQh5mupm2xMsZKiNzCXXAFq+y2oyWSzOmTRhcFshpj4DhHqwSO++VmEdiCvfQMsx0jmTI6O9LNylM0QCEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBkJ4SDt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBkJ4SDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746246998; x=1777782998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ge0MxYCjlv/d6KCBzZjehBZaE/6ME8+3TaGWiefnB90=;
  b=RBkJ4SDtTozi+Q2OdMPpWmBE36Tqvkp84ZcPxgeKyBanlIWuvR+kQ3vx
   LX6Vfi9kfAI8DTty9PzD4zsrBIwNKiUo5yVd3IylB7GnAv/RWs8jPJO3x
   lmDRN+IwSAAHEEtjOyClGHggATJEYLCr7VyEeTzuh78F9y7hY4nB+x4QW
   wlcwfAOLW1X1QVXNNYGSIyHNosnVclmwawr57gKPpw2x6vFAwcau/xhAY
   LPpn9+04oK13pNoaWiKo7HCMnOR59NSGxtYoycPSgydpk9EzAH6AtPtk9
   bF91TN0UrnnnchxEBodspqcARQR3DSiDG43rSkUt7DavYPa2WztQhGU7s
   Q==;
X-CSE-ConnectionGUID: H8UPU/L0SK+n+7iyl2+vfQ==
X-CSE-MsgGUID: Eke6kaMgT6qS33ooItOqyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48017066"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="48017066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 21:36:34 -0700
X-CSE-ConnectionGUID: QEGDFEk7RQyvlnTn/rg8kg==
X-CSE-MsgGUID: c7uF0dNQQXegVhpWrka6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="172046021"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 21:36:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB4c2-0005C8-14;
	Sat, 03 May 2025 04:36:30 +0000
Date: Sat, 3 May 2025 12:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/msiof-fifo 23/24]
 sound/soc/renesas/rcar/msiof.c:137:9: error: call to undeclared function
 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505031216.aUF2iRLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/msiof-fifo
head:   7b93d38b35516004a8e0863475297a7b47e7eec1
commit: d8dfe7cdd8980e08b9fae51ff9fcddac20eca22b [23/24] ASoC: renesas: msiof: Convert to <linux/spi/sh_msiof.h>
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250503/202505031216.aUF2iRLT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031216.aUF2iRLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031216.aUF2iRLT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/renesas/rcar/msiof.c:137:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |                       FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
         |                       ^
   sound/soc/renesas/rcar/msiof.c:151:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 val = FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
         |                       ^
   2 errors generated.


vim +/FIELD_PREP +137 sound/soc/renesas/rcar/msiof.c

   107	
   108	static int msiof_hw_start(struct snd_soc_component *component,
   109				  struct snd_pcm_substream *substream, int cmd)
   110	{
   111		struct msiof_priv *priv = snd_soc_component_get_drvdata(component);
   112		struct snd_pcm_runtime *runtime = substream->runtime;
   113		int is_play = msiof_is_play(substream);
   114		int width = snd_pcm_format_width(runtime->format);
   115		u32 val;
   116	
   117		/*
   118		 * see
   119		 *	[NOTE] on top of this driver
   120		 */
   121		/*
   122		 * see
   123		 *	Datasheet 109.3.6 [Transmit and Receive Procedures]
   124		 *
   125		 *	TX: Fig 109.14	- Fig 109.23
   126		 *	RX: Fig 109.15
   127		 */
   128	
   129		/* reset errors */
   130		priv->err_syc[substream->stream] =
   131		priv->err_ovf[substream->stream] =
   132		priv->err_udf[substream->stream] = 0;
   133	
   134		/* SITMDRx */
   135		if (is_play) {
   136			val = SITMDR1_PCON |
 > 137			      FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
   138			      SIMDR1_SYNCAC | SIMDR1_XXSTP;
   139			if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
   140				val |= FIELD_PREP(SIMDR1_DTDL, 1);
   141	
   142			msiof_write(priv, SITMDR1, val);
   143	
   144			val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
   145			msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
   146			msiof_write(priv, SITMDR3, val);
   147	
   148		}
   149		/* SIRMDRx */
   150		else {
   151			val = FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
   152			      SIMDR1_SYNCAC;
   153			if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
   154				val |= FIELD_PREP(SIMDR1_DTDL, 1);
   155	
   156			msiof_write(priv, SIRMDR1, val);
   157	
   158			val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
   159			msiof_write(priv, SIRMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
   160			msiof_write(priv, SIRMDR3, val);
   161		}
   162	
   163		/* SIIER */
   164		if (is_play)
   165			val = SIIER_TDREQE | SIIER_TDMAE | SISTR_ERR_TX;
   166		else
   167			val = SIIER_RDREQE | SIIER_RDMAE | SISTR_ERR_RX;
   168		msiof_update(priv, SIIER, val, val);
   169	
   170		/* SICTR */
   171		if (is_play)
   172			val = SICTR_TXE | SICTR_TEDG;
   173		else
   174			val = SICTR_RXE | SICTR_REDG;
   175		msiof_update_and_wait(priv, SICTR, val, val, val);
   176	
   177		msiof_status_clear(priv);
   178	
   179		/* Start DMAC */
   180		snd_dmaengine_pcm_trigger(substream, cmd);
   181	
   182		return 0;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
