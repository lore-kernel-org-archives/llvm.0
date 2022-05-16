Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CCED1
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652707592; x=1684243592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lur/3NOqlYo8OA4XcGOZZynoHlfOsUsH13GiiFM9Bx8=;
  b=YfRcDfmdFbdO9pbDiFYoMv/ARRa/5013KPiCJ5PJfpfWW11sMsxj83k4
   2gWvtA9ddAxrKitVx2E19cScaIs/YxoTJy9ZQhpKpzjd8RPI2Na5TJNre
   neajkWQU1tZAf/MAD5YNij+S4RirA90Q3KXmCSKBQKjZ1kv3EX34JP3HN
   E0nedN/Fwkbd3WlBtauQvPAVHnroj/rtCcpcvaRq6UupH00S9wGJ6F8xf
   AMvnjR05cDby8dRaRS6nxNhuFgm5RyHuMSpBTceP9zj7xSwmv07AiHKI0
   Kj3C99DLwNxIIARsyoi6CMsbv76vD4tlDxu+6e28h6U4akGTXAbn+v+4O
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="251345066"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="251345066"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 06:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="604854114"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 May 2022 06:26:28 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqak0-00002b-1p;
	Mon, 16 May 2022 13:26:28 +0000
Date: Mon, 16 May 2022 21:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v1 5/6] media: uvcvideo: Initialize roi to default value
Message-ID: <202205162134.uZvFM4c1-lkp@intel.com>
References: <20220516092209.1801656-6-yunkec@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516092209.1801656-6-yunkec@google.com>

Hi Yunke,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.18-rc7 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220516-172509
base:   git://linuxtv.org/media_tree.git master
config: i386-buildonly-randconfig-r002-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162134.uZvFM4c1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/453e68b0e012e424659c3fd4c4c7824ad768f440
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220516-172509
        git checkout 453e68b0e012e424659c3fd4c4c7824ad768f440
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/usb/uvc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/usb/uvc/uvc_ctrl.c:2587:44: error: use of undeclared identifier 'camera_entity'
                               uvc_entity_match_guid(ctrl->entity, camera_entity))
                                                                   ^
   1 error generated.


vim +/camera_entity +2587 drivers/media/usb/uvc/uvc_ctrl.c

  2551	
  2552	/*
  2553	 * Add control information and hardcoded stock control mappings to the given
  2554	 * device.
  2555	 */
  2556	static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
  2557				       struct uvc_control *ctrl)
  2558	{
  2559		const struct uvc_control_info *info = uvc_ctrls;
  2560		const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
  2561		const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
  2562		const struct uvc_control_mapping *mend =
  2563			mapping + ARRAY_SIZE(uvc_ctrl_mappings);
  2564	
  2565		/* XU controls initialization requires querying the device for control
  2566		 * information. As some buggy UVC devices will crash when queried
  2567		 * repeatedly in a tight loop, delay XU controls initialization until
  2568		 * first use.
  2569		 */
  2570		if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
  2571			return;
  2572	
  2573		for (; info < iend; ++info) {
  2574			if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
  2575			    ctrl->index == info->index) {
  2576				uvc_ctrl_add_info(chain->dev, ctrl, info);
  2577				/*
  2578				 * Retrieve control flags from the device. Ignore errors
  2579				 * and work with default flag values from the uvc_ctrl
  2580				 * array when the device doesn't properly implement
  2581				 * GET_INFO on standard controls.
  2582				 */
  2583				uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
  2584	
  2585				if (ctrl->info.selector ==
  2586					UVC_CT_REGION_OF_INTEREST_CONTROL &&
> 2587				    uvc_entity_match_guid(ctrl->entity, camera_entity))
  2588					uvc_ctrl_init_roi(chain->dev, ctrl);
  2589				break;
  2590			 }
  2591		}
  2592	
  2593		if (!ctrl->initialized)
  2594			return;
  2595	
  2596		for (; mapping < mend; ++mapping) {
  2597			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
  2598			    ctrl->info.selector == mapping->selector)
  2599				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
  2600		}
  2601	}
  2602	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
