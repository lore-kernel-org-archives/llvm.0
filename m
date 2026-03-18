Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2DF19CD1D;
	Wed, 18 Mar 2026 02:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800477; cv=none; b=XQ4tbYRZwtsmkPmhcwelanhFl+wKSogfns7MbCKpn2dPcCfL/3qM4rGOcEV8LOeu/HrMQqAOqu/LSudTVJIaKW8IvA8C8qqm4188NMLmUmsnNo17ErzOXDDZGwbWQsE3oVzaWIADaWBbbxouEWbQ0YTSerARs7mXCxAh85Tj25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800477; c=relaxed/simple;
	bh=b9WM3X9TseulUylADe0iMrtIwueIOUOSN58HM+zcKp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E/d6vU6P6bKTR9ErowS6RcELWkxLzxNDJpiH4wnCPeHoO58Pe+xhPeea2c6e6hGYlWlOFy8IPhwR0Ka2U60rO9ulwkZy7X5wYG1oKet7A6Ufk4Q7+1wu6hBKzgacfhWTRszcWmVncQhxlOg+iMDY0RfhddUhAH0f2cQqbcQXm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQXiRqOO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQXiRqOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773800474; x=1805336474;
  h=date:from:to:cc:subject:message-id;
  bh=b9WM3X9TseulUylADe0iMrtIwueIOUOSN58HM+zcKp0=;
  b=nQXiRqOO2fSaMDK8uFRlpcECklUwnCOOvdIVncgi1CIkCqCMbniDcQ6s
   tQaea+yb4Uq5G1Eaj7PZSaho9vZx7R09DppaQfyppGeF9n9EgR994unU1
   h5O4MA1E8DdZeghnA2N+IyChBiEDdxBgrFMubq5pbaxkdFK/3hfrjrrln
   a6XZw9/RMHPLrSJLKngTU8w/JLzMoOMslbQln/z1PWCBaQEZIgW1OZ+3Y
   blVCYzpax9Yaote45kIBIVg4ILdlAaEe55bFCTU2NKG6b0c0twC+R9tps
   /Td09t94UTgnLrsFCy5VKcrp95LeY3Mc9ZoHF1mz3c7jjZ5gPbYeBfZQJ
   w==;
X-CSE-ConnectionGUID: S3AtAF2DQteAM2luPDhXDA==
X-CSE-MsgGUID: Kt9KknvbS5uKQd9Su1B4Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73867018"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="73867018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:21:13 -0700
X-CSE-ConnectionGUID: QBFIjloJS+6ys4kvVTmfTw==
X-CSE-MsgGUID: SNWmDOy8TvCT+Dg1xsh50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219927934"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 19:21:11 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gWy-000000002M3-34PP;
	Wed, 18 Mar 2026 02:21:08 +0000
Date: Wed, 18 Mar 2026 10:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260309 4/20]
 drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of
 type
Message-ID: <202603181032.wGSYPsWt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260309
head:   323b1c00c49eb37524b7f91e1223f813990b4cce
commit: ace05b14a5eb00ab69a4968656f46e6b8b4a60fa [4/20] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: powerpc-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181032.wGSYPsWt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181032.wGSYPsWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181032.wGSYPsWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:16:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:16:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   drivers/scsi/aic94xx/aic94xx_hwi.c:342:40: error: no member named 'escb' in 'struct scb'
     342 |                 struct empty_scb *escb = &ascb->scb->escb;
         |                                           ~~~~~~~~~  ^
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_reg.c:10:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_reg.c:10:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   1 warning and 1 error generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_scb.c:13:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_scb.c:13:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   drivers/scsi/aic94xx/aic94xx_scb.c:369:39: error: no member named 'escb' in 'struct scb'
     369 |         struct empty_scb *escb = &ascb->scb->escb;
         |                                   ~~~~~~~~~  ^
   drivers/scsi/aic94xx/aic94xx_scb.c:631:42: error: no member named 'control_phy' in 'struct scb'
     631 |         struct control_phy *control_phy = &scb->control_phy;
         |                                            ~~~  ^
   drivers/scsi/aic94xx/aic94xx_scb.c:770:42: error: no member named 'control_phy' in 'struct scb'
     770 |         struct control_phy *control_phy = &scb->control_phy;
         |                                            ~~~  ^
   1 warning and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]


vim +252 drivers/scsi/aic94xx/aic94xx_reg.h

2908d778ab3e24 James Bottomley 2006-08-29  247  
2908d778ab3e24 James Bottomley 2006-08-29  248  static inline void asd_write_reg_addr(struct asd_ha_struct *asd_ha, u32 reg,
2908d778ab3e24 James Bottomley 2006-08-29  249  				      dma_addr_t dma_handle)
2908d778ab3e24 James Bottomley 2006-08-29  250  {
2908d778ab3e24 James Bottomley 2006-08-29  251  	asd_write_reg_dword(asd_ha, reg,   ASD_BUSADDR_LO(dma_handle));
2908d778ab3e24 James Bottomley 2006-08-29 @252  	asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
2908d778ab3e24 James Bottomley 2006-08-29  253  }
2908d778ab3e24 James Bottomley 2006-08-29  254  

:::::: The code at line 252 was first introduced by commit
:::::: 2908d778ab3e244900c310974e1fc1c69066e450 [SCSI] aic94xx: new driver

:::::: TO: James Bottomley <James.Bottomley@SteelEye.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
