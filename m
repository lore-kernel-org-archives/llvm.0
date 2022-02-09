Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037E2F28
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644411354; x=1675947354;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XkKCrfI0fycI5Zhp7DcWIg9hk0Hgi7O9FWpCplL7p+E=;
  b=ZoVuJmKv+sUS5cC+BhHltHSgQRiNr5+GyNGWslo7pCTXUwzg6/CjdRl7
   cHu2mZUl6wHPCGPFKAbJ7CsiTJVvBhmaAd6lIk9nqGgHfWtoYANMxJ7dY
   CLk5zf9IXypV6RkZhGX2/iEiyq6bkOD2YEo4oFcy19PO1mZEcfb46+UBY
   YWcgZKHIXYMrAari0vmT1pwKKdv2XDpPbUAY2Fl9qj9Zq/5Aua70Ec7gn
   78QeDOlfa3XDV1RSXWzXhiBblkwigzuMekhNdD7yyWP3XN7yMDIdm8V0x
   4ajpLyRRsdgUvPQWWQDmRQyscOPgUqZTdxS34abl6HyckLQCc+zYIg7Nh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="236603229"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="236603229"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 04:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="771333777"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2022 04:55:47 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHmVe-0001p0-Ff; Wed, 09 Feb 2022 12:55:46 +0000
Date: Wed, 9 Feb 2022 20:55:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 3871/4656]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.o: warning:
 objtool: hubbub31_program_watermarks()+0x61: unreachable instruction
Message-ID: <202202092059.9gegO2oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Charlene Liu <Charlene.Liu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   10207e3a840b47b5eae573486a88fb6e29884f77
commit: ca7f9d0aba9940f4d3e759f44c414c3707a94b21 [3871/4656] drm/amd/display: fix yellow carp wm clamping
config: x86_64-buildonly-randconfig-r002-20220207 (https://download.01.org/0day-ci/archive/20220209/202202092059.9gegO2oq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ca7f9d0aba9940f4d3e759f44c414c3707a94b21
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ca7f9d0aba9940f4d3e759f44c414c3707a94b21
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.o: warning: objtool: hubbub31_program_watermarks()+0x61: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
