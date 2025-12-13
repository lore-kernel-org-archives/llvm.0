Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D01F3B87;
	Sat, 13 Dec 2025 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765603569; cv=none; b=aFoJRHA3No4pd+SWjoSg1g169s6UL3vZ2vVf3EFmkvKGwfVfOlk/zZOWRu9Rym1TK43YFfUXa7M5kUNKztr9UVqTufheqTBZH3PKdnGMIz0Du2+rRj1IsGSVz3nwmdlQs+YRIjOjKVr7Mth87cHkw7knmpEAiSV0iZXxHbwh2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765603569; c=relaxed/simple;
	bh=Y6/RfiwTSnML8+wiXl5Xto4ymu4lEZrcJGodV+XYja0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0t4q8e6khr+7mgP84azRs20FEbZVF1zWW5xuoHO50/BTWjS/d9eliBEXsmX2+VkHmMvTarIXgke+V84SUaZxKsInH57aR31++ryq75Nic5JBFvPQEViOBR/Ho2KC0xh4SGPYd95seL00Cjs8XzelIDIecFzbGoWpestq7yJjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8Hb9LeA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8Hb9LeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765603568; x=1797139568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6/RfiwTSnML8+wiXl5Xto4ymu4lEZrcJGodV+XYja0=;
  b=C8Hb9LeABfyfuJMnrDTB0SmwUdfaRz6nZp73n6Ab2llzBinVEk0duZP9
   TPPQMU8FA+bnUVUeR4BFymEavh7qnW+KP9o5vKM6/sKNpoXRdTHBjN/BY
   5Cc7ga3YzyKXfzcueCRQTOYNAT8jm1fQ1eU2HLzKIt6AUOwb+UAr+yA66
   /7Q+dndpUM/VaUnp87EBIVMOw9WLE/6ibV9wjHrqJOYjEz8JxmHxPk7CX
   jwecr0E4DB86NMTBIy296cJ64DtADJLw2G8Bethtm0WiR2ucNHvWlDqYB
   B4/Xuq+0+d2I1nkgsrt+omn75sLOGRjULnKB/oREoWL2vzdtmbmj9u6IK
   w==;
X-CSE-ConnectionGUID: glmNv/mLSyW6MOrNIaeHlw==
X-CSE-MsgGUID: t+8UZLtLTrm9mfroJX2cRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67478171"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67478171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:26:03 -0800
X-CSE-ConnectionGUID: qJRCOSQeRtqkJ8KRkQbvJw==
X-CSE-MsgGUID: KD2Bzn0hTbOKDfPxygplaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198085646"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 21:26:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUI8l-0000000076Y-44cT;
	Sat, 13 Dec 2025 05:25:59 +0000
Date: Sat, 13 Dec 2025 13:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: drivers/gpu/drm/omapdrm/dss/dispc.c:527:32: warning: stack frame
 size (2688) exceeds limit (2048) in 'dispc_restore_context'
Message-ID: <202512131329.SjvhP0i3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 660942f2441df622d527f216009f332151843ce8 drm: omapdrm: reduce clang stack usage
date:   6 months ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131329.SjvhP0i3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131329.SjvhP0i3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131329.SjvhP0i3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/omapdrm/dss/dispc.c:4720:27: warning: stack frame size (2672) exceeds limit (2048) in 'dispc_runtime_suspend' [-Wframe-larger-than]
    4720 | static __maybe_unused int dispc_runtime_suspend(struct device *dev)
         |                           ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:527:32: warning: stack frame size (2688) exceeds limit (2048) in 'dispc_restore_context' [-Wframe-larger-than]
     527 | static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
         |                                ^
   2 warnings generated.


vim +/dispc_restore_context +527 drivers/gpu/drm/omapdrm/dss/dispc.c

   526	
 > 527	static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
   528	{
   529		int i, j;
   530	
   531		DSSDBG("dispc_restore_context\n");
   532	
   533		if (!dispc->ctx_valid)
   534			return;
   535	
   536		/*RR(dispc, IRQENABLE);*/
   537		/*RR(dispc, CONTROL);*/
   538		RR(dispc, CONFIG);
   539		RR(dispc, LINE_NUMBER);
   540		if (dispc_has_feature(dispc, FEAT_ALPHA_FIXED_ZORDER) ||
   541				dispc_has_feature(dispc, FEAT_ALPHA_FREE_ZORDER))
   542			RR(dispc, GLOBAL_ALPHA);
   543		if (dispc_has_feature(dispc, FEAT_MGR_LCD2))
   544			RR(dispc, CONFIG2);
   545		if (dispc_has_feature(dispc, FEAT_MGR_LCD3))
   546			RR(dispc, CONFIG3);
   547	
   548		for (i = 0; i < dispc_get_num_mgrs(dispc); i++) {
   549			RR(dispc, DEFAULT_COLOR(i));
   550			RR(dispc, TRANS_COLOR(i));
   551			RR(dispc, SIZE_MGR(i));
   552			if (i == OMAP_DSS_CHANNEL_DIGIT)
   553				continue;
   554			RR(dispc, TIMING_H(i));
   555			RR(dispc, TIMING_V(i));
   556			RR(dispc, POL_FREQ(i));
   557			RR(dispc, DIVISORo(i));
   558	
   559			RR(dispc, DATA_CYCLE1(i));
   560			RR(dispc, DATA_CYCLE2(i));
   561			RR(dispc, DATA_CYCLE3(i));
   562	
   563			if (dispc_has_feature(dispc, FEAT_CPR)) {
   564				RR(dispc, CPR_COEF_R(i));
   565				RR(dispc, CPR_COEF_G(i));
   566				RR(dispc, CPR_COEF_B(i));
   567			}
   568		}
   569	
   570		for (i = 0; i < dispc_get_num_ovls(dispc); i++) {
   571			RR(dispc, OVL_BA0(i));
   572			RR(dispc, OVL_BA1(i));
   573			RR(dispc, OVL_POSITION(i));
   574			RR(dispc, OVL_SIZE(i));
   575			RR(dispc, OVL_ATTRIBUTES(i));
   576			RR(dispc, OVL_FIFO_THRESHOLD(i));
   577			RR(dispc, OVL_ROW_INC(i));
   578			RR(dispc, OVL_PIXEL_INC(i));
   579			if (dispc_has_feature(dispc, FEAT_PRELOAD))
   580				RR(dispc, OVL_PRELOAD(i));
   581			if (i == OMAP_DSS_GFX) {
   582				RR(dispc, OVL_WINDOW_SKIP(i));
   583				RR(dispc, OVL_TABLE_BA(i));
   584				continue;
   585			}
   586			RR(dispc, OVL_FIR(i));
   587			RR(dispc, OVL_PICTURE_SIZE(i));
   588			RR(dispc, OVL_ACCU0(i));
   589			RR(dispc, OVL_ACCU1(i));
   590	
   591			for (j = 0; j < 8; j++)
   592				RR(dispc, OVL_FIR_COEF_H(i, j));
   593	
   594			for (j = 0; j < 8; j++)
   595				RR(dispc, OVL_FIR_COEF_HV(i, j));
   596	
   597			for (j = 0; j < 5; j++)
   598				RR(dispc, OVL_CONV_COEF(i, j));
   599	
   600			if (dispc_has_feature(dispc, FEAT_FIR_COEF_V)) {
   601				for (j = 0; j < 8; j++)
   602					RR(dispc, OVL_FIR_COEF_V(i, j));
   603			}
   604	
   605			if (dispc_has_feature(dispc, FEAT_HANDLE_UV_SEPARATE)) {
   606				RR(dispc, OVL_BA0_UV(i));
   607				RR(dispc, OVL_BA1_UV(i));
   608				RR(dispc, OVL_FIR2(i));
   609				RR(dispc, OVL_ACCU2_0(i));
   610				RR(dispc, OVL_ACCU2_1(i));
   611	
   612				for (j = 0; j < 8; j++)
   613					RR(dispc, OVL_FIR_COEF_H2(i, j));
   614	
   615				for (j = 0; j < 8; j++)
   616					RR(dispc, OVL_FIR_COEF_HV2(i, j));
   617	
   618				for (j = 0; j < 8; j++)
   619					RR(dispc, OVL_FIR_COEF_V2(i, j));
   620			}
   621			if (dispc_has_feature(dispc, FEAT_ATTR2))
   622				RR(dispc, OVL_ATTRIBUTES2(i));
   623		}
   624	
   625		if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV))
   626			RR(dispc, DIVISOR);
   627	
   628		/* enable last, because LCD & DIGIT enable are here */
   629		RR(dispc, CONTROL);
   630		if (dispc_has_feature(dispc, FEAT_MGR_LCD2))
   631			RR(dispc, CONTROL2);
   632		if (dispc_has_feature(dispc, FEAT_MGR_LCD3))
   633			RR(dispc, CONTROL3);
   634		/* clear spurious SYNC_LOST_DIGIT interrupts */
   635		dispc_clear_irqstatus(dispc, DISPC_IRQ_SYNC_LOST_DIGIT);
   636	
   637		/*
   638		 * enable last so IRQs won't trigger before
   639		 * the context is fully restored
   640		 */
   641		RR(dispc, IRQENABLE);
   642	
   643		DSSDBG("context restored\n");
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
