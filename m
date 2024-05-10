Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74111128386;
	Fri, 10 May 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346158; cv=none; b=jjaTh04zBJ2U+2ZydbnLmXkZwvolCD/oPk5DefxEqQe35BHCO3MleQRmUwCB8vWwbU9vg0mhGsaWWCebN2ojEhV44ZGpr+ZnCLinig8Y9jS/mNqcevIYO9nJBCJYKIdS7dtDFCZVbLbtd5FjUgvxU73Wbe1J3BslYpwTRI2mwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346158; c=relaxed/simple;
	bh=VJH0F6iEUVUY4rg/Ns3oAXljg7WfexitK7V1pT2kflM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RlJu8jt5wSpjrdfoGw2hz0wacyaoUja82wLnT/ARWVPXpEYl1saJmAZkg+QSVd9Rf2dbJr6wOezy2/AatYdCdzsUc2W40K8Fc0WkO3AL/O1FoRCUrYHHdnvUdYimDltaPNzHecM/0bZwpgsKiV7rxP8Bw9HukSPHu3p98SQnP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0h2BumD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0h2BumD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715346152; x=1746882152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJH0F6iEUVUY4rg/Ns3oAXljg7WfexitK7V1pT2kflM=;
  b=m0h2BumDgEYmuQXNR3+Wz2KczFAbQt+k714u7I4pRtD/AFC//87GD341
   rqPcztXKhsL/PM9glKI8tO6IAaUtz1npBQVKOMV+tyYkID3O8mQPHlTLg
   UJh5dadei+vUCcOBcHKAfZlsKVjISDX0P7IYvRNPeSn47/gsXO4jUY9Mh
   XDq26qlQaAPZx27tDV/QAh8ENkDlN8APumkYDDt0vwlBBdwrXdT4XT1DQ
   UZUhjOsmnuOt1rRl7l9jpZA3OfKph/7auu6gHgEN2jKGTjwdHfGchtd0d
   CxhQTfw1SEuJaVXsf5HPAoJUruxRyn+uSign/PP/oaZbKrC+jJi8A1Gde
   Q==;
X-CSE-ConnectionGUID: klpozGvFRXiCalYI25SViQ==
X-CSE-MsgGUID: lb2h/prkQEyRpSHESoywHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22731535"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22731535"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 06:02:10 -0700
X-CSE-ConnectionGUID: JzdljHL9Tu28gdEI63PmLQ==
X-CSE-MsgGUID: 13fIRbGFSOS4jO08EBKwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34046635"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2024 06:02:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Psz-0006AF-2d;
	Fri, 10 May 2024 13:02:05 +0000
Date: Fri, 10 May 2024 21:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:pci-mbox 7/9] drivers/pci/mmb.c:248:35: warning: unused
 variable 'pci_mbox_ops'
Message-ID: <202405102047.VfwHBD0Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git pci-mbox
head:   9c38a15525283584d0d49404c11c397fe71ba1e8
commit: d7ef18124cb4ba45e597c4b1fdd44ab208ce797e [7/9] PCI/cxl: Migrate the common mailbox operation code from CXL to PCI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405102047.VfwHBD0Y-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102047.VfwHBD0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102047.VfwHBD0Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/mmb.c:248:35: warning: unused variable 'pci_mbox_ops' [-Wunused-const-variable]
     248 | static const struct mmio_mbox_ops pci_mbox_ops = {
         |                                   ^~~~~~~~~~~~
   1 warning generated.


vim +/pci_mbox_ops +248 drivers/pci/mmb.c

   247	
 > 248	static const struct mmio_mbox_ops pci_mbox_ops = {
   249		.mbox_ready = pci_mmb_ready,
   250		.mbox_send = mmio_mailbox_send,
   251	};
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
