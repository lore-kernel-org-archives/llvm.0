Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F489BA
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 22:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662590386; x=1694126386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5UmoP6saF84vKJX85H+LxTh7UU3Z+oM/j/JFxmc3nA=;
  b=P9/pSnZhNTpfUpRNWBrq5W5wDECiclW3TLKI7aQGnjvJX5AzImLJEUJm
   +qrs5ct7qtgdmBAekM8dsATBdP8yQp3zIu7rmWtvPKO5N+AMvgvKlAFTe
   unrfmGrco+Yn7ZN3Sc/poAHb8K4nMeGs2vlAV6dJHZvVbJ/aCxoAaVU3H
   gulPz41puziHopkVcfBIWNdjxQfwehzblG+rQ9lcj5SXpEpJBI32r7R5T
   oUxP+8UI0EupxQGKY7sWeSg3yHAcuxeZH/IANexbXP34mKyVeYRl6tTpl
   LFVpT4sYFBqUu+7+EKXxuQNjZ9LXAL1fmM6DfAvfVJt57uACE7C/zpD+2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323202754"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="323202754"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 15:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="644813437"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 15:39:34 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW3hl-00071x-1U;
	Wed, 07 Sep 2022 22:39:33 +0000
Date: Thu, 8 Sep 2022 06:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl-media:streams/v6.0/v11 34/49]
 drivers/media/v4l2-core/v4l2-subdev.c:931:2: error: call to undeclared
 function 'for_each_active_route'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202209080614.TwoNgZoW-lkp@intel.com>
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
commit: 9fc634e7ac71c145523c64f734836068ee14a4e8 [34/49] media: subdev: use for_each_active_route() in v4l2_subdev_init_stream_configs()
config: arm-randconfig-r002-20220907 (https://download.01.org/0day-ci/archive/20220908/202209080614.TwoNgZoW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media streams/v6.0/v11
        git checkout 9fc634e7ac71c145523c64f734836068ee14a4e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c:157:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
                        ^
>> drivers/media/v4l2-core/v4l2-subdev.c:931:2: error: call to undeclared function 'for_each_active_route'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           for_each_active_route(routing, route) {
           ^
>> drivers/media/v4l2-core/v4l2-subdev.c:931:39: error: expected ';' after expression
           for_each_active_route(routing, route) {
                                                ^
                                                ;
   drivers/media/v4l2-core/v4l2-subdev.c:955:39: error: expected ';' after expression
           for_each_active_route(routing, route) {
                                                ^
                                                ;
   4 errors generated.


vim +/for_each_active_route +931 drivers/media/v4l2-core/v4l2-subdev.c

   917	
   918	static int
   919	v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
   920					const struct v4l2_subdev_krouting *routing)
   921	{
   922		struct v4l2_subdev_route *route;
   923		u32 num_configs = 0;
   924		u32 format_idx = 0;
   925	
   926		kvfree(stream_configs->configs);
   927		stream_configs->configs = NULL;
   928		stream_configs->num_configs = 0;
   929	
   930		/* Count number of formats needed */
 > 931		for_each_active_route(routing, route) {
   932			/*
   933			 * Each route needs a format on both ends of the route, except
   934			 * for source streams which only need one format.
   935			 */
   936			num_configs +=
   937				(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
   938		}
   939	
   940		if (!num_configs)
   941			return 0;
   942	
   943		stream_configs->configs = kvcalloc(num_configs,
   944			sizeof(*stream_configs->configs), GFP_KERNEL);
   945	
   946		if (!stream_configs->configs)
   947			return -ENOMEM;
   948	
   949		stream_configs->num_configs = num_configs;
   950	
   951		/*
   952		 * Fill in the 'pad' and stream' value for each item in the array from
   953		 * the routing table
   954		 */
   955		for_each_active_route(routing, route) {
   956			u32 idx;
   957	
   958			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
   959				idx = format_idx++;
   960	
   961				stream_configs->configs[idx].pad = route->sink_pad;
   962				stream_configs->configs[idx].stream = route->sink_stream;
   963			}
   964	
   965			idx = format_idx++;
   966	
   967			stream_configs->configs[idx].pad = route->source_pad;
   968			stream_configs->configs[idx].stream = route->source_stream;
   969		}
   970	
   971		return 0;
   972	}
   973	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
