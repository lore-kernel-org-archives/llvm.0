Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875773FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643235447; x=1674771447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xooQbuHivbMOOs9OpcyfoNfdN4za7A4ATPcdg05Z0lw=;
  b=JPf7iY1q5nJubxdf04bATIxoeAihNdiAEj5icuKVllzukBtg+tJzlcP7
   U6u6i3U2DxeHMixAP1v/EPtbzFqUokSG/NMqk9rzQJh8QrVZxGv2HV9Qp
   5jECxIJSa/7ofBCe5dJReSPANIgvtqnZSYMI5O0/+mnsy6+35ltWJjsVy
   i4g+x++p/1rwIUegp6BXov2VPydzruI992zACsML2gB4sctBO/9jZpd8d
   frnz+WN6rvG40zAKzawvtK0+PYK4YVwcIMiC5rR0WiWBROMuPDoNWQSG/
   lKR5g399gBPHVa/RYX9MPB+9UzP+sSi8x93bIXsf6Z/Wz2iSgfrSznkmC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245500920"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="245500920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 14:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="480040840"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jan 2022 14:17:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCqbR-000LiT-W6; Wed, 26 Jan 2022 22:17:21 +0000
Date: Thu, 27 Jan 2022 06:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [hverkuil-media-tree:extron 101/103]
 ./usr/include/linux/cec.h:150:19: error: unknown type name 'bool'
Message-ID: <202201270613.3EEZBJH4-lkp@intel.com>
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
head:   54377f21d8b2084a9f5993230bdab8e8cd55bb22
commit: d679f6adf24b7fef91e8a3b3584b48587e9cf0a2 [101/103] cec.h: add cec_msg_recv_is_tx_result() helper
config: i386-randconfig-a012-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270613.3EEZBJH4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree extron
        git checkout d679f6adf24b7fef91e8a3b3584b48587e9cf0a2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/cec-funcs.h:11:
>> ./usr/include/linux/cec.h:150:19: error: unknown type name 'bool'
   static __inline__ bool cec_msg_recv_is_tx_result(const struct cec_msg *msg)
                     ^
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
