Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886A374
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659489404; x=1691025404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIh/XZVzO2WS1Fk61O5ECpym1wGw37w9jLK4tchGzNU=;
  b=a4Zj3oE7hM/2DmP3pUugIucSgk/2r/Dt3J+VJkEO04DxgDoe7zNlVKi2
   hyRsegmOS2IMnWhgxbIuebZxycuTRzjnNkZAeDpwArZZS3YyS3x6WOHiQ
   g/qPqAq9bqziLL6igts0xl6FAqTvYv2psfRLxQ9UDXgplzFAOxwP0B9Z2
   iXTC4YXX72zLDsJjHzwZ+ntvhzqU6mrEFzSbjIikof8RqR0STO2IcFPhC
   re1YqJ4yzMyUMgD1S2Zx4LXTbzj8w3dTRTw3/0GxTSLt0hZ0lnVyJrvvT
   Pjp9/lb7M1Ozavup9DvvOQp9uJbGUrBEzDvh9qkVqtCEme7c0+6GIEBi3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290329528"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="290329528"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 18:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="930192032"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2022 18:16:41 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ305-000Gdz-0o;
	Wed, 03 Aug 2022 01:16:41 +0000
Date: Wed, 3 Aug 2022 09:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [hverkuil-media-tree:for-v5.21b 12/13]
 drivers/media/platform/nxp/dw100/dw100.c:382:18: warning: variable 'dh' set
 but not used
Message-ID: <202208030910.mKccvhw6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.21b
head:   ac27e33a9e4dd1487bde072493d9303358af0507
commit: b92bfb7b8350160895d0ea34a98831ed4f01af1d [12/13] media: dw100: Add i.MX8MP dw100 dewarper driver
config: arm-randconfig-c002-20220802 (https://download.01.org/0day-ci/archive/20220803/202208030910.mKccvhw6-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v5.21b
        git checkout b92bfb7b8350160895d0ea34a98831ed4f01af1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/nxp/dw100/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/dw100/dw100.c:382:18: warning: variable 'dh' set but not used [-Wunused-but-set-variable]
           u32 sw, sh, dw, dh, mw, mh, idx;
                           ^
>> drivers/media/platform/nxp/dw100/dw100.c:382:14: warning: variable 'dw' set but not used [-Wunused-but-set-variable]
           u32 sw, sh, dw, dh, mw, mh, idx;
                       ^
   In file included from drivers/media/platform/nxp/dw100/dw100.c:20:
   In file included from include/media/v4l2-ctrls.h:13:
   In file included from include/linux/videodev2.h:61:
   include/uapi/linux/videodev2.h:1776:2: warning: field  within 'struct v4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous at include/uapi/linux/videodev2.h:1776:2)' and is usually due to 'struct v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   3 warnings generated.


vim +/dh +382 drivers/media/platform/nxp/dw100/dw100.c

   363	
   364	/*
   365	 * Initialize the dewarping map with an identity mapping.
   366	 *
   367	 * A 16 pixels cell size grid is mapped on the destination image.
   368	 * The last cells width/height might be lesser than 16 if the destination image
   369	 * width/height is not divisible by 16. This dewarping grid map specifies the
   370	 * source image pixel location (x, y) on each grid intersection point.
   371	 * Bilinear interpolation is used to compute inner cell points locations.
   372	 *
   373	 * The coordinates are saved in UQ12.4 fixed point format.
   374	 */
   375	static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
   376						  u32 from_idx, u32 elems,
   377						  union v4l2_ctrl_ptr ptr)
   378	{
   379		struct dw100_ctx *ctx =
   380			container_of(ctrl->handler, struct dw100_ctx, hdl);
   381	
 > 382		u32 sw, sh, dw, dh, mw, mh, idx;
   383		u16 qx, qy, qdx, qdy, qsh, qsw;
   384		u32 *map = ctrl->p_cur.p_u32;
   385	
   386		sw = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
   387		dw = ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
   388		sh = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
   389		dh = ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
   390	
   391		mw = ctrl->dims[0];
   392		mh = ctrl->dims[1];
   393	
   394		qsw = dw100_map_convert_to_uq12_4(sw);
   395		qsh = dw100_map_convert_to_uq12_4(sh);
   396		qdx = qsw / (mw - 1);
   397		qdy = qsh / (mh - 1);
   398	
   399		ctx->map_width = mw;
   400		ctx->map_height = mh;
   401		ctx->map_size = mh * mw * sizeof(u32);
   402	
   403		for (idx = from_idx; idx < elems; idx++) {
   404			qy = min_t(u32, (idx / mw) * qdy, qsh);
   405			qx = min_t(u32, (idx % mw) * qdx, qsw);
   406			map[idx] = dw100_map_format_coordinates(qx, qy);
   407		}
   408	
   409		ctx->user_map_is_set = false;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
