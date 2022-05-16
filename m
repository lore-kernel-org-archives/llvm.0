Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBB29A1
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 23:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652744335; x=1684280335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KkkLfc4fAEbkp53pbjYLSGYfnjBIhuUl1eB506Pyt84=;
  b=RKs8DhMCVEKdOXx8nw2wVt4pIq7TpnEutm/JFinsmD9AlfhYf3HvYXQT
   thEXOSNXxit1pMhlQ/l8OvQ6bSujAbcYcFF1Qh6XrTeLfNGrWpy3RR6R9
   l7A3Ql6jBhKpOTDfOa/y/bWv7gjExPEhb26x+2sQQTN1FAS+2n5fvTAHI
   ufsMLhip/9ZGHZC0ezSouTCh5NtHz9FpPnMIKKExMf1VS6MjGCcgNWNIl
   RO3jvQZnonbexNaHbwxD2IVVzxQs5OPNgl5m1rpNvGiNn9FxC0986B0LU
   tb5wXWawQ2utXoii2x5LONaP/aJwCECtqrekfM6djOBKxYL44ymsBA3zX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258557476"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="258557476"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 16:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="555498539"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 May 2022 16:38:53 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqkIf-0000Pp-4l;
	Mon, 16 May 2022 23:38:53 +0000
Date: Tue, 17 May 2022 07:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [hverkuil-media-tree:extron 2/2] ld.lld: error: undefined symbol:
 v4l2_device_register
Message-ID: <202205170716.EOe20iPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   d25c7a9925ea4a748782ad0b1f951716be89d672
commit: d25c7a9925ea4a748782ad0b1f951716be89d672 [2/2] cec/extron: add the Extron CEC driver
config: x86_64-randconfig-r002-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170716.EOe20iPO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree extron
        git checkout d25c7a9925ea4a748782ad0b1f951716be89d672
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   vmlinux.o: warning: objtool: bmi160_data_rdy_trigger_set_state()+0x8e: sibling call from callable instruction with modified stack frame
>> ld.lld: error: undefined symbol: v4l2_device_register
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_connect)
--
>> ld.lld: error: undefined symbol: v4l2_device_unregister
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_connect)
--
>> ld.lld: error: undefined symbol: v4l2_set_edid_phys_addr
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_s_edid)
--
>> ld.lld: error: undefined symbol: video_device_release_empty
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_videodev)
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_poll
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_fops)
--
>> ld.lld: error: undefined symbol: video_ioctl2
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_fops)
--
>> ld.lld: error: undefined symbol: v4l2_fh_open
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_fops)
--
>> ld.lld: error: undefined symbol: v4l2_fh_release
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_fops)
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_subscribe_event
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_ioctl_ops)
--
>> ld.lld: error: undefined symbol: v4l2_event_unsubscribe
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_ioctl_ops)
--
>> ld.lld: error: undefined symbol: video_unregister_device
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_disconnect)
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_setup_thread)
   >>> referenced by fbdev.c
   >>> vmlinux.o:(extron_setup_thread)
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
