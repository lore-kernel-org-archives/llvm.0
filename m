Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60BD173
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642195769; x=1673731769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eL8cbg/YE44wHLkkTQqnQq0nvxsy4VO/CjAQAKS5k2A=;
  b=AxIt8mhVdffCWjN+mHqMlZ0Rl5qgAqtjFpXTMBrqHFWZKKAtDXqiXDWK
   ImcA6RTHq9N8vRCwoHn9pAL720hvJk3NmMgp/7CTKFwNWaGut29297mF2
   lsijSjZz/Ioli+XyInDq1A7qqWCaA3NAUHGm0s+1Z6HPwfk4iWkCkIpkJ
   MwW90G6FaUcX2RtomzvGR2Pvpan6Mm+SucFL15TqUO9x6+9TO5WWhqmMs
   70IIxAWNA09o99wiP0HwiYp8fdbcJI47hMogCQdzjrcQBzg12044IhllO
   30OB/7D5Fbh9nrrLmV3xfpTDj4FmGaM17Q4q9dc6YIyPM0GWKGu9iX0Wo
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="305063906"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="305063906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 13:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="670977644"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2022 13:29:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8U8U-00090x-PZ; Fri, 14 Jan 2022 21:29:26 +0000
Date: Sat, 15 Jan 2022 05:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v5.18f 76/82]
 drivers/media/platform/aspeed-video.c:977:5: warning: format specifies type
 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long
 long')
Message-ID: <202201150524.D0pO65rp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.18f
head:   97dd85f0caf1ad96c275147583c46f8ee12308fc
commit: 63c049607882d11ee1cce0c739113c8dfd7fed02 [76/82] media: aspeed: add more debug log messages
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220115/202201150524.D0pO65rp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v5.18f
        git checkout 63c049607882d11ee1cce0c739113c8dfd7fed02
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/aspeed-video.c:977:5: warning: format specifies type 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
                            video->srcs[0].dma, video->srcs[0].size);
                            ^~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
                           v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
                                                        ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                               ~~~                   ^~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/media/platform/aspeed-video.c:979:5: warning: format specifies type 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
                            video->srcs[1].dma, video->srcs[1].size);
                            ^~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
                           v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
                                                        ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                               ~~~                   ^~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/media/platform/aspeed-video.c:1806:25: warning: format specifies type 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
                    VE_JPEG_HEADER_SIZE, video->jpeg.dma);
                                         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +977 drivers/media/platform/aspeed-video.c

   916	
   917	static void aspeed_video_set_resolution(struct aspeed_video *video)
   918	{
   919		struct v4l2_bt_timings *act = &video->active_timings;
   920		unsigned int size = act->width * act->height;
   921	
   922		/* Set capture/compression frame sizes */
   923		aspeed_video_calc_compressed_size(video, size);
   924	
   925		if (video->active_timings.width == 1680) {
   926			/*
   927			 * This is a workaround to fix a silicon bug on A1 and A2
   928			 * revisions. Since it doesn't break capturing operation of
   929			 * other revisions, use it for all revisions without checking
   930			 * the revision ID. It picked 1728 which is a very next
   931			 * 64-pixels aligned value to 1680 to minimize memory bandwidth
   932			 * and to get better access speed from video engine.
   933			 */
   934			aspeed_video_write(video, VE_CAP_WINDOW,
   935					   1728 << 16 | act->height);
   936			size += (1728 - 1680) * video->active_timings.height;
   937		} else {
   938			aspeed_video_write(video, VE_CAP_WINDOW,
   939					   act->width << 16 | act->height);
   940		}
   941		aspeed_video_write(video, VE_COMP_WINDOW,
   942				   act->width << 16 | act->height);
   943		aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
   944	
   945		/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
   946		if (size < DIRECT_FETCH_THRESHOLD) {
   947			v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
   948			aspeed_video_write(video, VE_TGS_0,
   949					   FIELD_PREP(VE_TGS_FIRST,
   950						      video->frame_left - 1) |
   951					   FIELD_PREP(VE_TGS_LAST,
   952						      video->frame_right));
   953			aspeed_video_write(video, VE_TGS_1,
   954					   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
   955					   FIELD_PREP(VE_TGS_LAST,
   956						      video->frame_bottom + 1));
   957			aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
   958		} else {
   959			v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
   960			aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
   961		}
   962	
   963		size *= 4;
   964	
   965		if (size != video->srcs[0].size) {
   966			if (video->srcs[0].size)
   967				aspeed_video_free_buf(video, &video->srcs[0]);
   968			if (video->srcs[1].size)
   969				aspeed_video_free_buf(video, &video->srcs[1]);
   970	
   971			if (!aspeed_video_alloc_buf(video, &video->srcs[0], size))
   972				goto err_mem;
   973			if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
   974				goto err_mem;
   975	
   976			v4l2_dbg(1, debug, &video->v4l2_dev, "src buf0 addr(%#x) size(%d)\n",
 > 977				 video->srcs[0].dma, video->srcs[0].size);
   978			v4l2_dbg(1, debug, &video->v4l2_dev, "src buf1 addr(%#x) size(%d)\n",
   979				 video->srcs[1].dma, video->srcs[1].size);
   980			aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
   981			aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
   982		}
   983	
   984		return;
   985	
   986	err_mem:
   987		dev_err(video->dev, "Failed to allocate source buffers\n");
   988	
   989		if (video->srcs[0].size)
   990			aspeed_video_free_buf(video, &video->srcs[0]);
   991	}
   992	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
