Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1583EA9B;
	Fri, 15 Dec 2023 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxVe3Ua5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702658330; x=1734194330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NEhk85/oz6l+9+O5DDdZG3ZrGSSP2UHhluxajnZXgo=;
  b=nxVe3Ua5BG8o6w6kporpvoKQov1kNnnKJtDqKKbAc5/YIMmPtc6w5B/s
   vQaFOqqYk6veoIqoH4KEeckrzrX3QuG717HY5QFJ5MaFvCttbKjDjuO+u
   EpDPnhWhzpbQMAkAfqyq9Z6jshh9tpHG/i7JTbRKADwyc2HGCorEpcwCG
   TIAHDz9r9OIwhUwnST+0mDAm7YfihegjAf7uWdug8NnBfzdlfiqqCPvTN
   AwOKC84iw4Lo/95wSt7mnz/N66rRcpbjT5zTDXLMQ3EMbEaj/ZYkHmi3y
   5ggQWWZWoaBf+SbSuomlPned8QDwE3R6BXh5UlV32nMnP8f6HeHx1+Gl9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380294574"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="380294574"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 08:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803765538"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="803765538"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2023 08:38:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEBD3-0000T4-0q;
	Fri, 15 Dec 2023 16:38:45 +0000
Date: Sat, 16 Dec 2023 00:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Petlozu Pravareshwar <petlozup@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
	Stefan Kristiansson <stefank@nvidia.com>
Subject: scripts/kernel-doc: drivers/soc/tegra/pmc.c:467: warning: Function
 parameter or struct member 'syscore' not described in 'tegra_pmc'
Message-ID: <202312160052.KMv3CVOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: 1ddb8f6d44ff482c9953a06f800453bc372cfead soc/tegra: pmc: Fix dual edge triggered wakes
date:   1 year, 1 month ago
config: arm-randconfig-003-20231215 (https://download.01.org/0day-ci/archive/20231216/202312160052.KMv3CVOg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160052.KMv3CVOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160052.KMv3CVOg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/soc/tegra/pmc.c:467: warning: Function parameter or struct member 'syscore' not described in 'tegra_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
