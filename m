Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F589D0
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662585333; x=1694121333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZZJqsZJrCYlDyHph8xdCoe+iknngZkT0G9cnPOAiBY=;
  b=k8iWj2v78JNI8QgoRyywDW6TEyUw/7lDN+l3XJPSHgfoGxzuj3lt2qdb
   WZZB9BFA+4l5/3+FRKW1S1NpSUroxZJR/XM/v3Z9T++icN314ue8mNp2H
   alkswNWYWSqp1kmWxgYZ2xJo6lLO/pcL7DJT+gjidqKF7uswQ/ZIUOC+M
   94M1B+6ITQcafqqi1NKR7ghBF5aiWlLhU3jjzSREo9U3fTfAdY81WZCiN
   x+aHrfVMAaPU6Uyd+Sv1LxQcFXzxZOpytAwAg2pJNvER76ImbplP0ta+p
   ODznce06Ffv3wp1YPT4bKfZ7KTuQ7hEVlf0yJOuCXOA1hPfk6HlMdD6o2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="295733936"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="295733936"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 14:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="740439955"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Sep 2022 14:15:30 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW2OP-0006xv-2H;
	Wed, 07 Sep 2022 21:15:29 +0000
Date: Thu, 8 Sep 2022 05:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl-media:streams/v6.0/v11 27/49]
 drivers/media/v4l2-core/v4l2-subdev.c:156:8: error: call to undeclared
 function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202209080505.7TfHX43B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git streams/v6.0/v11
head:   c8cf58f00bee6d4f43462b3e3f83ef516c594d61
commit: 46db369d5850a9ac814a5ac236a4d39e390ca217 [27/49] media: subdev: add stream based configuration
config: arm-randconfig-r002-20220907 (https://download.01.org/0day-ci/archive/20220908/202209080505.7TfHX43B-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media streams/v6.0/v11
        git checkout 46db369d5850a9ac814a5ac236a4d39e390ca217
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:156:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
                        ^
   1 error generated.


vim +/v4l2_subdev_state_get_stream_format +156 drivers/media/v4l2-core/v4l2-subdev.c

   150	
   151	static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
   152			       u32 which, u32 pad, u32 stream)
   153	{
   154	#if defined(CONFIG_MEDIA_CONTROLLER)
   155		if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) {
 > 156			if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
   157				return -EINVAL;
   158			return 0;
   159		}
   160	#endif
   161	
   162		if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
   163			return -EINVAL;
   164	
   165		return 0;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
