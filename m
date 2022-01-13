Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84029CA
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642081071; x=1673617071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0moxA1lCdI5ugcQRXln+ImaNFqLpbC6L4ShiuHrUqVI=;
  b=nvl6Le4BFQ/0LKMaQBczW+nh78TliCkWizx2Fxf7VN4VviL0vgNUIBk2
   BkpD0U9Vgv4EN00yBS4rOtLz6RWGnn2FbcKCXIlYz1hEr5lPYMol4z17L
   tbWWgBAiIY8PEs3/cK74EmZXRleHYjozqESWPgwDx7FgaMa4SbffKhcaU
   f8HNvuqj1AEBnRPaClFXasgmcIpWZvpR8g783MykOU71cyAxkUws+NgKg
   /AlC3PmxkMg89jALl3RZ5XqjlOmYRS2+O0h69kuV0P1Culc30Qe2hnz4A
   /aN6FmwnnsbVG/x36wt3/S1PdJ278KSBSS0Mpvg3owbCexh+IIptBa+eI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="242824499"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="242824499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 05:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="691802843"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2022 05:37:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n80IW-0007F1-4f; Thu, 13 Jan 2022 13:37:48 +0000
Date: Thu, 13 Jan 2022 21:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [cel:topic-rpc-with-tls-upcall 16/19] ERROR: modpost:
 "inet6_getname" [net/tls/tls.ko] undefined!
Message-ID: <202201132110.eYE2iS4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   0fd328ea53e7d539bf8bb160d773e1d027c60fea
commit: 021aa32bd7f87e46837a5f8774a010f9aa347e61 [16/19] net/tls: Add support for PF_TLSH (a TLS handshake listener)
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220113/202201132110.eYE2iS4l-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=021aa32bd7f87e46837a5f8774a010f9aa347e61
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 021aa32bd7f87e46837a5f8774a010f9aa347e61
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "inet6_getname" [net/tls/tls.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
