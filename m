Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2110FD;
	Sat, 11 Feb 2023 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676112727; x=1707648727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HEkIwX0TppbunnS6QcnCD74R28Bcv51gPEQk2UP3y0=;
  b=HOCaqW4oARblC9Es3oyeVakBVtz557PfuXM/tVHB04mLEHJ3S69ay2dq
   aq7Siup3N/31N/OvtGNr6XNwgFakkd51vU7sqvSkm2ix5obhsW8fMgZJa
   gm4VuQgBMv8QFC+7xw9GgLQ9HTgKsSbbkjOXHt4HkAvMTQqI22ikMlC6f
   Pp5UvrkuWoLtLmCHw+ewuMFbfOwIr86ZtXBnGqzj7ErZEVtkmTPuMtoqp
   07EqzW11quds1Ugk++J+3kO7kSQtvo4BZXs/YlTFaXc9UHPL+GSfX0+2M
   RLXsxXLEVZjz3+lJ8gFvWs2D3H5wYpYEw2uzAT+NducQ5EWTd3oGcrDod
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330610935"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="330610935"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 02:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842277401"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="842277401"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Feb 2023 02:52:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQnUD-0006R7-0b;
	Sat, 11 Feb 2023 10:52:05 +0000
Date: Sat, 11 Feb 2023 18:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 379/554]
 ./usr/include/drm/asahi_drm.h:284:32: warning: // comments are not allowed
 in this language
Message-ID: <202302111841.oA36ab39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   4e22161bdf43a03196f70f50d0794c60fc89a9b8
commit: de76c82a4aa0c44d537b4f77ac09e36c0524c37f [379/554] drm/asahi: Add initial compute UAPI
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230211/202302111841.oA36ab39-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/explicit-sync
        git checkout de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111841.oA36ab39-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/drm/asahi_drm.h:284:32: warning: // comments are not allowed in this language [-Wcomment]
           __u32 buffer_descriptor_size; // ?
                                         ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
