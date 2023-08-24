Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B36A93E;
	Thu, 24 Aug 2023 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915253; x=1724451253;
  h=date:from:cc:subject:message-id:mime-version;
  bh=725yJAQN0PenEtfy8flWI7ty2voE7ZAK5VPY5+B22Vg=;
  b=bBTTMKjNndVZOp33NLleLpfpo/OBcPpAmVaBGkCqUAMXq+M5k4Uz8fgx
   63aqfMAVkDzY2tTvMYXj3lirX04nhoIaj5TRWHcDTBqwqnSExoqkR8rIF
   Drmk3gg/apUvGkFYaHKiiHSdi6IUn7Ib2vTYupXHUnsKtrqK/pFRvVuUg
   bKOcITCpFE01yKufU3gucF9Yb9UWcEzZPNDZ4mPFCEmBsL0q3kKsp0L34
   b/46CyTsUZQTOs1yle7QL0YznWMOJycHRa8PpS05j6txz86jIzxpSTTXp
   unNzJwpxQ3YLqA0pduRirp3Cm8pnRqqLIsPv0ICYZ0P0ORjXt6u62O7dK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405570384"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405570384"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827341748"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827341748"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 15:14:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIaf-0002zy-0j;
	Thu, 24 Aug 2023 22:14:09 +0000
Date: Fri, 25 Aug 2023 06:13:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr()
 is missing an ELF size annotation
Message-ID: <202308250648.Oat7F2jN-lkp@intel.com>
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
head:   b5cc3833f13ace75e26e3f7b51cd7b6da5e9cf17
commit: ab4e4380d4e158486e595013a2635190e07e28ce Bluetooth: Add vhci devcoredump support
date:   4 months ago
config: x86_64-randconfig-016-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250648.Oat7F2jN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250648.Oat7F2jN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250648.Oat7F2jN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr() is missing an ELF size annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
