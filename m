Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453939E17A;
	Wed, 29 Apr 2026 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777495074; cv=none; b=q5OilY4mgS+TqKR0+eDz5KNUen20/OWtnNWzzxjmrMbs+Z7yT7UmeDlILJXGnbu4yuOp1bSNbArgKU5bEQCB7slBU4ST2uSz9QSLa+6ffSqkP9vHjOQ6Lq6jdNl4E7wvh5mu6PFTwsdsakGcqfXmeTkd6s2ZwSX2mqfJ3CkJ2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777495074; c=relaxed/simple;
	bh=b9bCQw37QhsfaxON4/j724gH3z20vILtdSQxtUQhs7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZ+LJO699mh6xl+8SUqX06M4esNrEXC6Oux9BQSiq7wgJZl5jh+JzemuP2RcTYy+fsAvJQzLSApsMPq0vnapSwk4/nRo9wEeQuNH4uSbK7ivsEvHU2rKnq5MPyChceD3a/kts3wqRf56yqXj58t1FQbuR9OU/+wURloIoVHPyLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BolnUuiw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BolnUuiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777495073; x=1809031073;
  h=date:from:to:cc:subject:message-id;
  bh=b9bCQw37QhsfaxON4/j724gH3z20vILtdSQxtUQhs7U=;
  b=BolnUuiw7BnnH5JW1GRmWlb5hZ+GzLOI22RjY6n7tBHQEinTWuuyPDG8
   gPApgjzyBmqij0t+MnNRTS1m7vu7FApp1Hh4XnRiAj6vrebBpn3WYayCJ
   nr4r6WsR3P/rQfvsVeyqZeJ2CAuQh5rNKw5ldcze6JGN5+ktAfxafeCUH
   pvzlODlLiJjlyKeTU87OQN26oM9jvyM25SM9vEwMPOwS2R49Byrhcqgli
   rG5t/bB2jqFJQwn/sA6YGieBPKozteHN72yH2pFKIXtQlsFKsd3vhRn63
   HrjmtAq4a8XFkGQcJCGSlbU7FPVN2tzScgeXbvmUIxj4kURs40wiK5bMk
   A==;
X-CSE-ConnectionGUID: x3iYjT7HR+eS8yON+FkZCQ==
X-CSE-MsgGUID: OLIo+lm7RFuTOFR1jeyBMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78424036"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78424036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 13:37:53 -0700
X-CSE-ConnectionGUID: XYESIDgFSAmePWuW0bU15w==
X-CSE-MsgGUID: u3P6z5p+Queivi5kVJuAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="257697628"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 13:37:50 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIBfH-00000000BWE-3Rqy;
	Wed, 29 Apr 2026 20:37:47 +0000
Date: Thu, 30 Apr 2026 04:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260407 4/19]
 drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type
 'struct ssp_command_iu'
Message-ID: <202604300450.vVGf8nD0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260407
head:   9505f43094e1efb72854c166160fb7666517f07a
commit: f6054f7e1b3b8a6fdba096f5d0b2a273d07452d4 [4/19] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: s390-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300450.vVGf8nD0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300450.vVGf8nD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300450.vVGf8nD0-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:1779:11: error: invalid application of 'sizeof' to an incomplete type 'struct ssp_command_iu'
    1779 |         dw2 = (((sizeof(struct ssp_command_iu) + sizeof(struct ssp_frame_hdr)
         |                  ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   2 errors generated.
--
   In file included from drivers/scsi/hisi_sas/hisi_sas_main.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                               ^
   drivers/scsi/hisi_sas/hisi_sas.h:617:11: note: forward declaration of 'struct ssp_command_iu'
     617 |                         struct ssp_command_iu task;
         |                                ^
   1 error generated.


vim +617 drivers/scsi/hisi_sas/hisi_sas.h

b3cce125cb1e2e Xiang Chen          2019-02-06  610  
4ca7fe99fc8485 Yihang Li           2025-04-14  611  #define PROT_BUF_SIZE 7
c799d6bd8fe4a8 John Garry          2015-11-18  612  struct hisi_sas_command_table_ssp {
c799d6bd8fe4a8 John Garry          2015-11-18  613  	struct ssp_frame_hdr hdr;
c799d6bd8fe4a8 John Garry          2015-11-18  614  	union {
c799d6bd8fe4a8 John Garry          2015-11-18  615  		struct {
4ca7fe99fc8485 Yihang Li           2025-04-14  616  			u32 prot[PROT_BUF_SIZE];
9b3509411b4f8f Gustavo A. R. Silva 2025-09-19 @617  			struct ssp_command_iu task;
c799d6bd8fe4a8 John Garry          2015-11-18  618  		};
c799d6bd8fe4a8 John Garry          2015-11-18  619  		struct ssp_tmf_iu ssp_task;
c799d6bd8fe4a8 John Garry          2015-11-18  620  		struct xfer_rdy_iu xfer_rdy;
c799d6bd8fe4a8 John Garry          2015-11-18  621  		struct ssp_response_iu ssp_res;
c799d6bd8fe4a8 John Garry          2015-11-18  622  	} u;
c799d6bd8fe4a8 John Garry          2015-11-18  623  };
c799d6bd8fe4a8 John Garry          2015-11-18  624  

:::::: The code at line 617 was first introduced by commit
:::::: 9b3509411b4f8f5ba827619ca315c5f95f0bd8ac scsi: hisi_sas: Avoid a couple -Wflex-array-member-not-at-end warnings

:::::: TO: Gustavo A. R. Silva <gustavoars@kernel.org>
:::::: CC: Gustavo A. R. Silva <gustavoars@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
