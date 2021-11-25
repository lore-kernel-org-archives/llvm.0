Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880B2C80
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 16:58:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="233034670"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="233034670"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 08:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="457918053"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Nov 2021 08:58:45 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqI56-0006fn-6j; Thu, 25 Nov 2021 16:58:44 +0000
Date: Fri, 26 Nov 2021 00:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [hverkuil-media-tree:extron 24/26] ./usr/include/linux/cec.h:150:19:
 error: unknown type name 'bool'
Message-ID: <202111260058.vapJnwHD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   14428d5edce10d71fd18564114989459dbc00ae8
commit: b06e0fa1fd28ff51c1bfad1e1d9d0b977c64e986 [24/26] cec.h: add cec_msg_recv_is_tx_result() helper
config: x86_64-randconfig-a014-20211123 (https://download.01.org/0day-ci/archive/20211126/202111260058.vapJnwHD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree extron
        git checkout b06e0fa1fd28ff51c1bfad1e1d9d0b977c64e986
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/cec.h:150:19: error: unknown type name 'bool'
   static __inline__ bool cec_msg_recv_is_tx_result(const struct cec_msg *msg)
                     ^
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
