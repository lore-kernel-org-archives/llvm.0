Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1320C6C6CC;
	Thu, 14 Dec 2023 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcgLXe10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702597112; x=1734133112;
  h=date:from:cc:subject:message-id:mime-version;
  bh=be8nTYdPRwdXDK0SUXIQKA8ecPmpUICkCHCq53+ZOqU=;
  b=EcgLXe10bCZ5AJelpnp91m9CZLoyycCUygfV/qzxbl+xmWCdK9FJX0oX
   TW24xgVsff4usqoyVx7/O2+UHWsW9ZXMq9B5QPrYGC8BC88s3ZW6kBjW5
   klcyrlpDVH1oFfS2R3S8gIgvj25DlYzGSuEE/RulHL/LXktItWxfXiz+D
   T5gXNxxFvp1RoGNjl2toSYMAd1Gzhmw/TA/6y9nYfJrVAen7VWztGvj8+
   bYJYT6RT5oJXY98BHrrVVYbFX3WHUi4ceoQxexeir2AyJjyxtX6mjVKDl
   dCymfHEt1AKEbpYZMvc7ZY0QKCAIk1kiGK15B6dklLdXGL+eGxOWeoAz4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461667879"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="461667879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 15:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="865190413"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="865190413"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2023 15:38:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDvHg-000MkO-0y;
	Thu, 14 Dec 2023 23:38:28 +0000
Date: Fri, 15 Dec 2023 07:38:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: vhci_coredump_hdr() falls through to
 next function __cfi_vhci_open_timeout()
Message-ID: <202312150722.J7LzZPMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Manish Mandlik <mmandlik@google.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c7402612e2e61b76177f22e6e7f705adcbecc6fe
commit: ab4e4380d4e158486e595013a2635190e07e28ce Bluetooth: Add vhci devcoredump support
date:   8 months ago
config: x86_64-randconfig-012-20231215 (https://download.01.org/0day-ci/archive/20231215/202312150722.J7LzZPMW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150722.J7LzZPMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150722.J7LzZPMW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vhci_coredump_hdr() falls through to next function __cfi_vhci_open_timeout()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
