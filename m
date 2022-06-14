Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A11FB0
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655228932; x=1686764932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrUXgew0Z4VbvkF7EY6SQ4f3gJf/MZENvr5lc5Qlyj8=;
  b=kzchJTu0vhYntFZCePcfnIkAZAcEcGt+C5aPBhWfMvaDF5YAjWSQ6rmK
   nZYUDLQsik/UdWjTKA1sN9pN5uKFJHW0A4QHrYR5MpfcjbSIihmGjOq3X
   FDHWFwK5+6Xg61DJ39vRN1OGgW9dJkA6iuRoMwwS4TLAmjVoDYkhCJ/ln
   r08Z6AJLq1xeg01ni8o6ixn1VNYaMihFAt/6AGmNVTMJdjAGEmbVNOQuA
   nHrVWbpR6EOZFrrfCnAdo2BAsbTBvbDyyFZdTKHsAshHTc+2d8FjxdtLq
   AZpDIi08f7o1O8xOylrl3AFn9Yf0nm8skvPh0Yd866F6imwXJStdmSJIO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="365034572"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="365034572"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 10:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="640499892"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2022 10:48:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1Aej-000MAL-7f;
	Tue, 14 Jun 2022 17:48:45 +0000
Date: Wed, 15 Jun 2022 01:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next 43/198] ERROR: modpost: "__umoddi3"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Message-ID: <202206150123.jguddQBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   a6eba20601a3c518f8c60af9da788f9559e0a03c
commit: d3dfceb58de5f897640cdd424f6c2538d9514367 [43/198] drm/amd/display: Add dependant changes for DCN32/321
config: i386-buildonly-randconfig-r002-20220613 (https://download.01.org/0day-ci/archive/20220615/202206150123.jguddQBg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout d3dfceb58de5f897640cdd424f6c2538d9514367
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
