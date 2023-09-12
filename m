Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC82F37;
	Tue, 12 Sep 2023 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694516395; x=1726052395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXWlWLTjo3jdOMHzHR0i7wRRh1VXREEyxI70vy+B7+c=;
  b=kMTZDr90F6ind+TaEw9V4gzKAW9BQ93+aIasWvffwCbSlbTnfxfAIuU8
   mA5ppdOX3jBxxi1wBT+gtKw6Fxl3A/3PEMXrvVN9F23V3nAYrA+DW84yl
   7R5Sul9RnJRRC43+LGpxRYwAbZ4pU3JSo9UZT6Voim7c7VcnVDG53A65O
   PnxmlQOPhGvaBP5+Aeis4CWOmkTsZ/PiCTtdviDh1FbsWxzQTF38EoGEY
   nFYtGk1XToMtGgZAuQRTJt5sx2pkReedu1Kode4HZH55fFnRYo3VcLfIU
   gs0o4+Cfyqx4/Pp/ECZ08SehQpZiaTH9vYM8TdnXeQ+/hbSr5Z0xuvU/h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="358616376"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="358616376"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="693456311"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="693456311"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 03:59:53 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg17W-0000I7-3D;
	Tue, 12 Sep 2023 10:59:50 +0000
Date: Tue, 12 Sep 2023 18:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 2/6] arch/x86/coco/tdx/tdx.c:863: warning:
 Function parameter or member 'irq' not described in 'tdx_free_event_irq'
Message-ID: <202309121821.x699FlTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   f3da65595aa53304b251dc5e42ca72b55bb83bc9
commit: 188ce29701e06f96c21f5aaf3daf4fb0a96daf71 [2/6] x86/tdx: Add tdx_alloc_event_irq() and tdx_free_event_irq() interfaces
config: x86_64-randconfig-072-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121821.x699FlTI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121821.x699FlTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121821.x699FlTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:863: warning: Function parameter or member 'irq' not described in 'tdx_free_event_irq'


vim +863 arch/x86/coco/tdx/tdx.c

   857	
   858	/**
   859	 * tdx_free_event_irq() - Free the event IRQ.
   860	 *
   861	 */
   862	void tdx_free_event_irq(int irq)
 > 863	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
