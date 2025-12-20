Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2E2AE68;
	Sat, 20 Dec 2025 07:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766216207; cv=none; b=BQm14+EWPD/JoAq10u+Ei6xXx4J5NfUpthWRe7BFhznrG0eLqWB1tA7tvKvGo0WE0G+T3tCcad8XZpRyMc4ZimPVOYeFGUAKpnTHgat88/3ulFW+aYnZ9+yI1BVOZsUIlUZ/Qtzt/ka5nrn3K34w8vPGSS0a4QgzFs6U8D0e6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766216207; c=relaxed/simple;
	bh=ddcByeOgcCiukYdMrHFHVj/Qo9rhhSiMR4hHCSlJvqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qi0ps7a9xYYz7+dB6Oym3gMQQpAQslRTbHUnKDwUFOEqAF2u/HQZpokhTOqf1lzWiptl2+Rs5JDkgBA6k+JNuGY+/I2smW6I6pZLbu7KEkQQXq3gokBJQ/lU0eFYtm9Spu9GzjdGvbILolAaBx71BlTj3vQYSmErnCoaaKdQlL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMLESsWS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMLESsWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766216206; x=1797752206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddcByeOgcCiukYdMrHFHVj/Qo9rhhSiMR4hHCSlJvqc=;
  b=VMLESsWSIrcdqf4sBQBvrrzeBiK0qvdA2HcZTHSiFh1vQsn3qtf1a/2u
   t/YXVawuinn4Z+3vyR1Yxmgg16rP8sYfo6h3nXH3uOkWOrN8rSQdlZnEu
   eHE7CY04XVZr5oQDJzMuY3EYoLf4HuguM63C1FGo0q0BS7PtknWfz75NU
   yjcFvB0VOXvOZD7gAXmbMSJywz5Oe8IQtzss01VF+nOF4wb8AxnGmmFh5
   AK0ou+OKtGMzHkRJ2rtApfEiWU/xL4fKg0CPNWCmUUyWNcdQiqFchQGMd
   kU4RoFfaP19nC1nvewBAqv/d+svKCIro0PfYCtyyCR6ip1/f++KgYB3Sd
   Q==;
X-CSE-ConnectionGUID: hl8V/BArR++14Zu02SicVg==
X-CSE-MsgGUID: 0olFzrXJS8eiqi4gGqLAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79532319"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79532319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 23:36:45 -0800
X-CSE-ConnectionGUID: jNbtsGTySTW6tAe06uad1Q==
X-CSE-MsgGUID: ZJAukAU2QPO4tAfbbtfrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="222487754"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2025 23:36:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWrW5-000000004Or-48Pe;
	Sat, 20 Dec 2025 07:36:41 +0000
Date: Sat, 20 Dec 2025 15:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251217 9/21]
 drivers/scsi/hisi_sas/hisi_sas.h:617:26: error: field has incomplete type
 'struct ssp_command_iu'
Message-ID: <202512201547.EC1j275J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251217
head:   150fc993b69605795df706d61b43acac85d85171
commit: 632ae447ed286f2428f907251e03eb931b27c229 [9/21] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512201547.EC1j275J-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201547.EC1j275J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201547.EC1j275J-lkp@intel.com/

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
>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:1779:11: error: invalid application of 'sizeof' to an incomplete type 'struct ssp_command_iu'
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
b1890c7edc271c Gustavo A. R. Silva 2025-09-19 @617  			struct ssp_command_iu task;
c799d6bd8fe4a8 John Garry          2015-11-18  618  		};
c799d6bd8fe4a8 John Garry          2015-11-18  619  		struct ssp_tmf_iu ssp_task;
c799d6bd8fe4a8 John Garry          2015-11-18  620  		struct xfer_rdy_iu xfer_rdy;
c799d6bd8fe4a8 John Garry          2015-11-18  621  		struct ssp_response_iu ssp_res;
c799d6bd8fe4a8 John Garry          2015-11-18  622  	} u;
c799d6bd8fe4a8 John Garry          2015-11-18  623  };
c799d6bd8fe4a8 John Garry          2015-11-18  624  

:::::: The code at line 617 was first introduced by commit
:::::: b1890c7edc271c177e1e22dd6e6ebb2158822a97 scsi: hisi_sas: Avoid a couple -Wflex-array-member-not-at-end warnings

:::::: TO: Gustavo A. R. Silva <gustavoars@kernel.org>
:::::: CC: Gustavo A. R. Silva <gustavoars@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
