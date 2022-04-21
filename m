Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5F3D6D
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650584246; x=1682120246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsiue63RkpFpSZcg8+e7rbdQ7Pu2T4IlMfL6usHCTU8=;
  b=Z+4dHulkeiqna5M7nzspsHEcPIZVlp3CMlGNHFq0vJ89pQNmbUpx1fbC
   K7SVyv1fd2q1+MQN1ToT5/p0HRuyJDTzWb5VonB2Qp6cLMi4lsd0hQqw1
   9/NaqEoQpm9u1ox1PTC74sk58qLFBaSevYDlJ7QWZ/+FU1Cubnm+k4Lyg
   /qXBpROEBwfzGNh0Kbm/Y27YhaTadMRjvJ2wDbkPaJQYQcpzdW1784+9I
   +VXwNoO/gYQwt8+TaryCoiLoa7BfhQXrvG5vEQydlTk7TVoOOrKCxiuOM
   fzpWu5Ai9TD7M4Zc/SGXm6EoAC4CBGjKYWkXsiElYiyDh2wmdDixoBR9P
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="251834800"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="251834800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 16:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="615150212"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2022 16:37:24 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhgMV-0008v8-SY;
	Thu, 21 Apr 2022 23:37:23 +0000
Date: Fri, 22 Apr 2022 07:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [stable:linux-5.10.y 2705/5321] WARNING: modpost:
 vmlinux.o(.text+0x8cc4): Section mismatch in reference from the function
 __arm_ioremap_pfn_caller() to the function
 .meminit.text:memblock_is_map_memory()
Message-ID: <202204220723.zOZ7gZGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   1052f9bce62982023737a95b7ff1ad26a5149af6
commit: 8dd559d53b3b2de960ca1ec1359f5a9b4a12e181 [2705/5321] arm: ioremap: don't abuse pfn_valid() to check if pfn is in RAM
config: arm-hackkit_defconfig (https://download.01.org/0day-ci/archive/20220422/202204220723.zOZ7gZGT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8dd559d53b3b2de960ca1ec1359f5a9b4a12e181
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 8dd559d53b3b2de960ca1ec1359f5a9b4a12e181
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x8cc4): Section mismatch in reference from the function __arm_ioremap_pfn_caller() to the function .meminit.text:memblock_is_map_memory()
The function __arm_ioremap_pfn_caller() references
the function __meminit memblock_is_map_memory().
This is often because __arm_ioremap_pfn_caller lacks a __meminit
annotation or the annotation of memblock_is_map_memory is wrong.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
