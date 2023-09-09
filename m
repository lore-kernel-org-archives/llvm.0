Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F971FAB;
	Sat,  9 Sep 2023 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694254630; x=1725790630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrN0QfcILxXkPjYs8S8tWAvasNVGZItQXG+0dHGyA+g=;
  b=YjHxhnIBloZkYG5H3vGqGEXUwWwNB5A8FLaZPrA3wtUHkEVnFG9XPDwa
   iew5sR2VOipduvNid4fMCcsIy2KqFcbHdeqWK2h3nYPBP73ktX4rU1OUF
   CeT20YT+VUMxC6VHzb3wUC+IcDr9Bvs4cdASnUPIBCoUNZGswT74GuP9W
   N7cC4bHbWneVvDgYik3pty57hIk85ceblW8nFIbdFhXGagQQN5O+caT8I
   mEgGWfnTUKS6bOaHY519+fU7yfHUJ0tC1nYsay5Qa0CCKlRQBzU1W4mX7
   118IOb+PVWfWJQfZ7tzvxXRfQ3wRHWl4vLcPCbo5/B52D7BqStks+Foke
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362860039"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="362860039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 03:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073591152"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="1073591152"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2023 03:17:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qev1W-0003IY-0O;
	Sat, 09 Sep 2023 10:17:06 +0000
Date: Sat, 9 Sep 2023 18:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:enc-dec-cmd 28/31]
 drivers/media/platform/allegro-dvt/allegro-core.c:2822:3: error: call to
 undeclared function 'v4l2_m2m_last_buffer_done'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202309091857.hmzD9eCZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git enc-dec-cmd
head:   2036ca38beff822c3ebbf9ae60b5bb184cbe6e19
commit: 7c08f89f12294f745b7202b12d8e1f7e4a6a936f [28/31] media: core: v4l2-mem2mem: remove v4l2_m2m_last_buffer_done
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309091857.hmzD9eCZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091857.hmzD9eCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091857.hmzD9eCZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/allegro-dvt/allegro-core.c:2822:3: error: call to undeclared function 'v4l2_m2m_last_buffer_done'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2822 |                 v4l2_m2m_last_buffer_done(channel->fh.m2m_ctx, vbuf);
         |                 ^
   drivers/media/platform/allegro-dvt/allegro-core.c:2822:3: note: did you mean 'v4l2_m2m_dst_buf_remove'?
   include/media/v4l2-mem2mem.h:748:1: note: 'v4l2_m2m_dst_buf_remove' declared here
     748 | v4l2_m2m_dst_buf_remove(struct v4l2_m2m_ctx *m2m_ctx)
         | ^
   1 error generated.
--
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1871:3: error: call to undeclared function 'v4l2_m2m_last_buffer_done'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1871 |                 v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
         |                 ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1871:3: note: did you mean 'v4l2_m2m_dst_buf_remove'?
   include/media/v4l2-mem2mem.h:748:1: note: 'v4l2_m2m_dst_buf_remove' declared here
     748 | v4l2_m2m_dst_buf_remove(struct v4l2_m2m_ctx *m2m_ctx)
         | ^
   1 error generated.
--
>> drivers/media/platform/verisilicon/hantro_v4l2.c:892:3: error: call to undeclared function 'v4l2_m2m_last_buffer_done'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     892 |                 v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
         |                 ^
   drivers/media/platform/verisilicon/hantro_v4l2.c:892:3: note: did you mean 'v4l2_m2m_dst_buf_remove'?
   include/media/v4l2-mem2mem.h:748:1: note: 'v4l2_m2m_dst_buf_remove' declared here
     748 | v4l2_m2m_dst_buf_remove(struct v4l2_m2m_ctx *m2m_ctx)
         | ^
   1 error generated.


vim +/v4l2_m2m_last_buffer_done +2822 drivers/media/platform/allegro-dvt/allegro-core.c

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2804  
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2805  static void allegro_buf_queue(struct vb2_buffer *vb)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2806  {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2807  	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2808  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2809  	struct vb2_queue *q = vb->vb2_queue;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2810  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2811  	if (V4L2_TYPE_IS_CAPTURE(q->type) &&
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2812  	    vb2_is_streaming(q) &&
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2813  	    v4l2_m2m_dst_buf_is_last(channel->fh.m2m_ctx)) {
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2814  		unsigned int i;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2815  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2816  		for (i = 0; i < vb->num_planes; i++)
05fd87b8d9a607 drivers/media/platform/allegro-dvt/allegro-core.c Dafna Hirschfeld 2021-12-01  2817  			vb2_set_plane_payload(vb, i, 0);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2818  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2819  		vbuf->field = V4L2_FIELD_NONE;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2820  		vbuf->sequence = channel->csequence++;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2821  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02 @2822  		v4l2_m2m_last_buffer_done(channel->fh.m2m_ctx, vbuf);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2823  		allegro_channel_eos_event(channel);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2824  		return;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2825  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2826  
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2827  	v4l2_m2m_buf_queue(channel->fh.m2m_ctx, vbuf);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2828  }
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2829  

:::::: The code at line 2822 was first introduced by commit
:::::: 0e13f6f6ff9d065cf0aba26a6f4f9c851c92a9d2 media: allegro: remove custom drain state handling

:::::: TO: Michael Tretter <m.tretter@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
