Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C2239E7F;
	Tue,  8 Sep 2026 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788829113; cv=none; b=qXXfMv1NKuYUHvGgoeROQg9yV/vD+Y/gInk4W5n55wZa9j8ZWNFbblqsTQtTn/0XCDf0mUEMKfa1PicEDQtMbFbKCfWfkWNNNj9sNQvpHodQJQDeBPPyz/Yjc0lRqLFucfYaigesCyDyC7GZ1rKPKSIKEBLs442E797sqrr30HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788829113; c=relaxed/simple;
	bh=g234LDnNm3zbfFZEcNxpTnRYCHq7yep686w4ocVO5F0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I6HH9+e1AUpT0NTKuB0XFmech9rrDV9u8L+gquek84TKQtbXuGtUovLQ++nSqwREjtfFKNbJJ2DBY721Hudo0lY6P4uq+dn7iINxyUHjee2/dy1+KWat6bBfc4CXof21C3gDft1QI2vRqknvtupqg4xQHdJMcGpA5E0NJRqvYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJHBOSez; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJHBOSez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788829111; x=1820365111;
  h=date:from:to:cc:subject:message-id;
  bh=g234LDnNm3zbfFZEcNxpTnRYCHq7yep686w4ocVO5F0=;
  b=WJHBOSezOvEoe70C7DSg84T4g+GxZPYneOvfnoBziZ8Cyezl3y83jgvF
   MYHkssCfNnWR/oz5rdSOvaeK7NxEQAvc50KIVA/YBZm/kUtS6JGhSyUIS
   +62IbCCI2ieBiJqIV02XJlGW1K2LsJmCTfx9X1u5m2OQa9SFya+QCiZy1
   7KsEj4O/1EodPzmALSdOueh6J45Iz9uCqxwbizFtg1dVO9H1N3AuPrUc4
   98+VspPsNVYMiHgLwCUWdLIKiVcqoROgYaXDSIz83me1SOwDs9lONwRYI
   yE1R2AQqvdpGEN2kBg/tPHhnz4+YPaSjIg9AlM2sAbpvIG5bPqBWIcXBP
   g==;
X-CSE-ConnectionGUID: ZxLI+zRmQKmPk1BBxpVcJA==
X-CSE-MsgGUID: pMC5hGzXRza8XFNmDAfofw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111999200"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="111999200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 17:58:30 -0700
X-CSE-ConnectionGUID: ddszyrbFRViZJEnPQAklcQ==
X-CSE-MsgGUID: eXSL6nTmTVyAifSpvVOwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269113682"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 17:58:28 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kAL-000000001TL-0M0f;
	Tue, 08 Sep 2026 00:58:25 +0000
Date: Tue, 08 Sep 2026 08:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Anup Patel <anup@brainfault.org>
Subject: [tip:irq/drivers 6/22]
 drivers/media/platform/mediatek/vpu/mtk_vpu.c:299:9: warning: comparison of
 different enumeration types ('enum ipi_id' and 'enum ipi_message_type')
Message-ID: <202609080837.vE9lfq1K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi GUO,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c65a1331928d0207c385f03fb5eba0cfecce0e6
commit: 1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9 [6/22] riscv: smp: Move enum ipi_message_type to asm/smp.h
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609080837.vE9lfq1K-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080837.vE9lfq1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080837.vE9lfq1K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/vpu/mtk_vpu.c:20:
   drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redefinition of enumerator 'IPI_MAX'
      63 |         IPI_MAX,
         |         ^
   arch/riscv/include/asm/smp.h:27:2: note: previous definition is here
      27 |         IPI_MAX
         |         ^
>> drivers/media/platform/mediatek/vpu/mtk_vpu.c:299:9: warning: comparison of different enumeration types ('enum ipi_id' and 'enum ipi_message_type') [-Wenum-compare]
     299 |         if (id < IPI_MAX && handler) {
         |             ~~ ^ ~~~~~~~
   drivers/media/platform/mediatek/vpu/mtk_vpu.c:322:31: warning: comparison of different enumeration types ('enum ipi_id' and 'enum ipi_message_type') [-Wenum-compare]
     322 |         if (id <= IPI_VPU_INIT || id >= IPI_MAX ||
         |                                   ~~ ^  ~~~~~~~
   2 warnings and 1 error generated.


vim +299 drivers/media/platform/mediatek/vpu/mtk_vpu.c

040d31ccf2bd87 drivers/media/platform/mtk-vpu/mtk_vpu.c Irui Wang      2020-10-29  286  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  287  int vpu_ipi_register(struct platform_device *pdev,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  288  		     enum ipi_id id, ipi_handler_t handler,
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  289  		     const char *name, void *priv)
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  290  {
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  291  	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  292  	struct vpu_ipi_desc *ipi_desc;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  293  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  294  	if (!vpu) {
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  295  		dev_err(&pdev->dev, "vpu device in not ready\n");
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  296  		return -EPROBE_DEFER;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  297  	}
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  298  
c4abb192caca96 drivers/media/platform/mtk-vpu/mtk_vpu.c Hans Verkuil   2019-11-03 @299  	if (id < IPI_MAX && handler) {
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  300  		ipi_desc = vpu->ipi_desc;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  301  		ipi_desc[id].name = name;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  302  		ipi_desc[id].handler = handler;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  303  		ipi_desc[id].priv = priv;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  304  		return 0;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  305  	}
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  306  
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  307  	dev_err(&pdev->dev, "register vpu ipi id %d with invalid arguments\n",
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  308  		id);
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  309  	return -EINVAL;
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  310  }
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  311  EXPORT_SYMBOL_GPL(vpu_ipi_register);
3003a180ef6b94 drivers/media/platform/mtk-vpu/mtk_vpu.c Andrew-CT Chen 2016-05-03  312  

:::::: The code at line 299 was first introduced by commit
:::::: c4abb192caca96a53c2e833d25b1f7f12b454bf4 media: mtk-vpu: fix two smatch warnings

:::::: TO: Hans Verkuil <hverkuil-cisco@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
