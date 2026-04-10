Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28ED347BDB;
	Fri, 10 Apr 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813131; cv=none; b=qiHCjrorz1q9aicAcLKeTgi51XsdxcNnUmI1tbawylt4sEzAGF5KoQ5RyFpFGQrtVPRisZ+Uw4SByWfYxVujcaa9FYjjARBB7xAtGsAFJ7g3gzR/K8eMbuH5T6+NGST/A3FrsBtms8f6K+hVX9330hO2ylXtfCgvNwIwlpxti+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813131; c=relaxed/simple;
	bh=rLwOWacUL4Xi9Ui2JVw2n7Xv3NCCBpb1z6Wpf3xrbkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPc1/cbVYQLSCYUDCCILpMn5/CGvt9zBpxUMTr8w1FbWCYlCh+gs4OZrdXKCxhNMj5jr9prwaGdU38wFzcvGL/gxKfjn86cCf0hdNWR2mi5sJY+BXZkcHSuOwK6B24pIE2wFx7ghEKh7tqZIws91XiZXKmbV/5W+g3FPLaZj57E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLBAYZIN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLBAYZIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775813129; x=1807349129;
  h=date:from:to:cc:subject:message-id;
  bh=rLwOWacUL4Xi9Ui2JVw2n7Xv3NCCBpb1z6Wpf3xrbkg=;
  b=JLBAYZINunGXj3LDzvVoP2OI9uGI7UnKJMdIPBp+hpTjQTpKCLOBBOHM
   9p+n5Y+vl7bXw1RqZWOGFnT9sdmBGe8iRMLyc7ppNIQwiAQN5mAkMZ/m0
   kp/GG7iLkDx4I+oqfZNu9MTGL5WclxTTL/A11bqesb9DJc0+rKve/xOli
   ZKARGa17eDcF1VX/i1w2g5KlOGcsHAm0wD+qLByViptCWzbON5xTC29hk
   iKNz75dtn6BQECHLRyclU92EasTosWLfbYWTEcIqlCX8+SJFh7Wbrkaon
   BCYLbiQ77ddH2EGGXheoxFWHvEKQWrJnMN4Ycruod1m7zFfHb8Nu330tA
   w==;
X-CSE-ConnectionGUID: OvjaZDDQSROHoJjnCooDUg==
X-CSE-MsgGUID: f2fpE7HSTaqXmn09rO0O0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76719992"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76719992"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:25:26 -0700
X-CSE-ConnectionGUID: rjApwcr3QNO7oKfk7Is6gA==
X-CSE-MsgGUID: UGxf22n0QxmGxiyeJoi8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233121550"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2026 02:25:25 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB878-000000003YQ-0FXx;
	Fri, 10 Apr 2026 09:25:22 +0000
Date: Fri, 10 Apr 2026 17:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: drivers/gpu/drm/omapdrm/dss/dispc.c:527:32: warning: stack
 frame size (2688) exceeds limit (2048) in 'dispc_restore_context'
Message-ID: <202604101715.Hc2lbByA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 660942f2441df622d527f216009f332151843ce8 drm: omapdrm: reduce clang stack usage
date:   10 months ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604101715.Hc2lbByA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101715.Hc2lbByA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 660942f2441d ("drm: omapdrm: reduce clang stack usage")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101715.Hc2lbByA-lkp@intel.com/

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
