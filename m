Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F43537E1;
	Tue,  3 Mar 2026 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558499; cv=none; b=jIsJ7cuiuSjwNI0FjKxl8VN72ZOR4E5ZjENbya5xlmugVjh9dVfH8ynuR5Gn24w4rLpb/RVVMO5t5J8RIt1hhdn70zl/BD2CUsUb1YcJls4JZt3H/E0gBKlTfD7PmGdHBOSUT1Ro7qKzcLJEqlxbXDU1eguUl0qVlks/JdEKTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558499; c=relaxed/simple;
	bh=4qginQjDpHPEs3rblyMRaQLMKuOrwk/UkWTAej7TX+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ivc58KNewP02oo3Urz0mfdbeEywOJUqNvB/tA6WfMSUh8r0cCnKpiU+kGR5/eAfN1xhyFabE8emsDZ8sxT0i1RltZ+lLN7KRWpkvdGy6wViPP2khqmlV0PCxbs9dlgdX6IAf0SK90Dmjg86Z9LmvaYLCqI7lvlNoSi7kUPlKvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioiQeFeu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioiQeFeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772558497; x=1804094497;
  h=date:from:to:cc:subject:message-id;
  bh=4qginQjDpHPEs3rblyMRaQLMKuOrwk/UkWTAej7TX+A=;
  b=ioiQeFeuAUaHb0lAVF8QM5H0RT8ZUd0zVEPSgkthDp46ga+dzyaX3j2B
   SpE0XhoVtDjcPCSh/+DZB7EmwhbEx8ziLHSIibJI6OB2c6cD76x8gVy/V
   f9RytMqyoYvgo5RwJneZZTlkdg884JWWFa8LxDhYO/Zs5tT+tQ5WcE9yM
   KLg2cVuYt1PdLxxjU7ecoxHFbCKF8z81Cl+tJYtwgzLzM/wBTcOy9Wd8J
   ZcFvF3CBnH2UEe2ZIdVzjIBDmIUo1GFlKioWsWUygsWGE0BDGYh1AorDi
   zCvtgsPozw52z6kMkG0utLTunZnuKlh6EZyLPV8Rjz+D+IdSAbSF141Pj
   A==;
X-CSE-ConnectionGUID: wd+JzJ/RSDGvdCJOIYq8Bw==
X-CSE-MsgGUID: ltep9AkPQV2JRhQk/TkG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73512056"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73512056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 09:21:36 -0800
X-CSE-ConnectionGUID: tn48ElcuRJ2GULxcD/4Bug==
X-CSE-MsgGUID: u935PBcoRZCUplpD8RonvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="216424401"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2026 09:21:34 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxTR5-000000002bx-17xq;
	Tue, 03 Mar 2026 17:21:31 +0000
Date: Wed, 04 Mar 2026 01:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 4/12]
 drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type
 'struct ssp_command_iu'
Message-ID: <202603040130.7mpFGwpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   759ff201de93e9bf74683ac6d4414b9141b12c27
commit: 052ea0d6ef438e32950d71cec77517e300b94872 [4/12] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603040130.7mpFGwpP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040130.7mpFGwpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040130.7mpFGwpP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/hisi_sas/hisi_sas_main.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                               ^
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   1 error generated.
--
   In file included from drivers/scsi/hisi_sas/hisi_sas_v1_hw.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                               ^
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
>> drivers/scsi/hisi_sas/hisi_sas_v1_hw.c:1002:11: error: invalid application of 'sizeof' to an incomplete type 'struct ssp_command_iu'
    1002 |                 dw2 = ((sizeof(struct ssp_command_iu) +
         |                         ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   2 errors generated.
--
   In file included from drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                               ^
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:1779:11: error: invalid application of 'sizeof' to an incomplete type 'struct ssp_command_iu'
    1779 |         dw2 = (((sizeof(struct ssp_command_iu) + sizeof(struct ssp_frame_hdr)
         |                  ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   2 errors generated.


vim +617 drivers/scsi/hisi_sas/hisi_sas.h

b3cce125cb1e2e Xiang Chen          2019-02-06  610  
4ca7fe99fc8485 Yihang Li           2025-04-14  611  #define PROT_BUF_SIZE 7
c799d6bd8fe4a8 John Garry          2015-11-18  612  struct hisi_sas_command_table_ssp {
c799d6bd8fe4a8 John Garry          2015-11-18  613  	struct ssp_frame_hdr hdr;
c799d6bd8fe4a8 John Garry          2015-11-18  614  	union {
c799d6bd8fe4a8 John Garry          2015-11-18  615  		struct {
4ca7fe99fc8485 Yihang Li           2025-04-14  616  			u32 prot[PROT_BUF_SIZE];
a0227bfe8d6594 Gustavo A. R. Silva 2025-09-19 @617  			struct ssp_command_iu task;
c799d6bd8fe4a8 John Garry          2015-11-18  618  		};
c799d6bd8fe4a8 John Garry          2015-11-18  619  		struct ssp_tmf_iu ssp_task;
c799d6bd8fe4a8 John Garry          2015-11-18  620  		struct xfer_rdy_iu xfer_rdy;
c799d6bd8fe4a8 John Garry          2015-11-18  621  		struct ssp_response_iu ssp_res;
c799d6bd8fe4a8 John Garry          2015-11-18  622  	} u;
c799d6bd8fe4a8 John Garry          2015-11-18  623  };
c799d6bd8fe4a8 John Garry          2015-11-18  624  

:::::: The code at line 617 was first introduced by commit
:::::: a0227bfe8d659406e59a181150f9ff5ce4fda588 scsi: hisi_sas: Avoid a couple -Wflex-array-member-not-at-end warnings

:::::: TO: Gustavo A. R. Silva <gustavoars@kernel.org>
:::::: CC: Gustavo A. R. Silva <gustavoars@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
