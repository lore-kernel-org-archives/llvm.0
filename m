Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA1C20FF
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648538718; x=1680074718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nXCzK7eNroax6VfJWHr3xtpZ++gimyG6n8VcC7uqn6I=;
  b=UUyt7Vw1xjStYGv3BlQ9RMLO6oApxPtFQbqJ/jePhVBX5VSiVaVs2Nu5
   Vv1Ri4PbainECgECHJwjhfL0KBxQaCMb0b96J6JPVDc7CajHY/Hbjs2zY
   6Q7wUtBYCpB3RFcfO0yNzjaaHnD7p2BrZJbJlaf2mCGa+HFprq5+bfc6x
   95p1kz06pHXzlpapqKOL8h+W6c7yvc2qJH6uwj+acQFFjK3Lr5sQEKmq6
   lHCIufTxN+kw16TmaqO1CP8KWMoyQ5FK0/8Xsoalmd1C6mJ3QYYs+PbnY
   ho8Tkpi3Pl7CNuQJn6yCb/HjI91v12JEjRSUw91urp4DDSzCiBeF32fjA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239115287"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; 
   d="scan'208";a="239115287"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 00:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; 
   d="scan'208";a="652734975"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 00:25:00 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZ6Dr-0002mf-L6; Tue, 29 Mar 2022 07:24:59 +0000
Date: Tue, 29 Mar 2022 15:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Downs-Razouk <colindr@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Chris Morin <cmtm@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-kiwi-5.10
 8832/9999] drivers/virtio/virtio_pvclock.c:49:6: warning: no previous
 prototype for function 'update_suspend_time'
Message-ID: <202203291512.gezfy3Lu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-kiwi-5.10
head:   9c6bdae16301919fcab74129dee1083eba844952
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [8832/9999] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220329/202203291512.gezfy3Lu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/029865ac9555743665dd106b4bbefb2f371849e9
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-kiwi-5.10
        git checkout 029865ac9555743665dd106b4bbefb2f371849e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for function 'update_suspend_time' [-Wmissing-prototypes]
   void update_suspend_time(struct work_struct *work)
        ^
   drivers/virtio/virtio_pvclock.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_suspend_time(struct work_struct *work)
   ^
   static 
>> drivers/virtio/virtio_pvclock.c:295:11: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           uint32_t rating =
                    ^
   2 warnings generated.


vim +/update_suspend_time +49 drivers/virtio/virtio_pvclock.c

    48	
  > 49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
    77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
