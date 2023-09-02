Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36334258F;
	Sat,  2 Sep 2023 23:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693697317; x=1725233317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TV/ivZ04e2fC/N1YTTF5QLJkc06vTNar9N1RrlXInpc=;
  b=WMgE5CvuoMprJiuD4/jBFEn9aj2wMleeYXa9cvetzgRMNsgEkveSTtzK
   yybD+HCffkZ10d1eDlXyO1DWgr8cLC0wr/BYCrM2d2JFbgrN/9bwQxNPR
   Dc9mzYmB6uiZdqpSy1D08qdVapbYRORoqxMZ0tlVhmzJxWrGhcvGLxpJx
   CPYxvSWtv2/Upwd+qjtgWwAwgfFN364HSXbCQCf4nFZDh2HzHJPKhKu6w
   CH9Goj5hvEzYcTiXoo56U/ex9SC5DksBWdtiux7+gNhhA1CLfhLTQwUGa
   fS8iQrrCuEfJJvJGWUV8rpyhWOB/TpiL/AsoAaWdo1nga8g+039jHZj/Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="442809528"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="442809528"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 16:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="805851714"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="805851714"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2023 16:28:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qca2a-0002gZ-17;
	Sat, 02 Sep 2023 23:28:32 +0000
Date: Sun, 3 Sep 2023 07:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:rpi/v6.5/unicam/dev 5/20]
 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:8: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202309030713.kOdUicZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/unicam/dev
head:   3f609d0d03e4967469b2aa22738b1bae74cff2b0
commit: d58f9a24df342493c1b8bf3064a6be03ad7d4de1 [5/20] media: v4l: Add V4L2-PIX-FMT-Y14P format
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230903/202309030713.kOdUicZM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030713.kOdUicZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030713.kOdUicZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (IS_ERR(buf->mmal.dma_buf)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:563:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:4: note: remove the 'if' if its condition is always true
                           if (IS_ERR(buf->mmal.dma_buf)) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:483:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:160:20: warning: unused function 'node_is_capture' [-Wunused-function]
   static inline bool node_is_capture(struct bcm2835_isp_node *node)
                      ^
   2 warnings generated.


vim +548 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c

11c7ef536f621f Naushir Patuck 2020-04-23  474  
11c7ef536f621f Naushir Patuck 2020-04-23  475  static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
11c7ef536f621f Naushir Patuck 2020-04-23  476  {
11c7ef536f621f Naushir Patuck 2020-04-23  477  	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
11c7ef536f621f Naushir Patuck 2020-04-23  478  	struct bcm2835_isp_dev *dev = node_get_dev(node);
11c7ef536f621f Naushir Patuck 2020-04-23  479  	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
11c7ef536f621f Naushir Patuck 2020-04-23  480  	struct bcm2835_isp_buffer *buf =
11c7ef536f621f Naushir Patuck 2020-04-23  481  		container_of(vb2, struct bcm2835_isp_buffer, vb);
11c7ef536f621f Naushir Patuck 2020-04-23  482  	struct dma_buf *dma_buf;
11c7ef536f621f Naushir Patuck 2020-04-23  483  	int ret;
11c7ef536f621f Naushir Patuck 2020-04-23  484  
11c7ef536f621f Naushir Patuck 2020-04-23  485  	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
11c7ef536f621f Naushir Patuck 2020-04-23  486  		 __func__, vb->vb2_queue->type, vb);
11c7ef536f621f Naushir Patuck 2020-04-23  487  
11c7ef536f621f Naushir Patuck 2020-04-23  488  	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
11c7ef536f621f Naushir Patuck 2020-04-23  489  		if (vb2->field == V4L2_FIELD_ANY)
11c7ef536f621f Naushir Patuck 2020-04-23  490  			vb2->field = V4L2_FIELD_NONE;
11c7ef536f621f Naushir Patuck 2020-04-23  491  		if (vb2->field != V4L2_FIELD_NONE) {
11c7ef536f621f Naushir Patuck 2020-04-23  492  			v4l2_err(&dev->v4l2_dev,
11c7ef536f621f Naushir Patuck 2020-04-23  493  				 "%s field isn't supported\n", __func__);
11c7ef536f621f Naushir Patuck 2020-04-23  494  			return -EINVAL;
11c7ef536f621f Naushir Patuck 2020-04-23  495  		}
11c7ef536f621f Naushir Patuck 2020-04-23  496  	}
11c7ef536f621f Naushir Patuck 2020-04-23  497  
11c7ef536f621f Naushir Patuck 2020-04-23  498  	if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
11c7ef536f621f Naushir Patuck 2020-04-23  499  		v4l2_err(&dev->v4l2_dev,
11c7ef536f621f Naushir Patuck 2020-04-23  500  			 "%s data will not fit into plane (%lu < %lu)\n",
11c7ef536f621f Naushir Patuck 2020-04-23  501  			 __func__, vb2_plane_size(vb, 0),
11c7ef536f621f Naushir Patuck 2020-04-23  502  			 (long)node->q_data.sizeimage);
11c7ef536f621f Naushir Patuck 2020-04-23  503  		return -EINVAL;
11c7ef536f621f Naushir Patuck 2020-04-23  504  	}
11c7ef536f621f Naushir Patuck 2020-04-23  505  
11c7ef536f621f Naushir Patuck 2020-04-23  506  	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
11c7ef536f621f Naushir Patuck 2020-04-23  507  		vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
11c7ef536f621f Naushir Patuck 2020-04-23  508  
11c7ef536f621f Naushir Patuck 2020-04-23  509  	switch (vb->memory) {
11c7ef536f621f Naushir Patuck 2020-04-23  510  	case VB2_MEMORY_DMABUF:
11c7ef536f621f Naushir Patuck 2020-04-23  511  		dma_buf = dma_buf_get(vb->planes[0].m.fd);
11c7ef536f621f Naushir Patuck 2020-04-23  512  
11c7ef536f621f Naushir Patuck 2020-04-23  513  		if (dma_buf != buf->mmal.dma_buf) {
11c7ef536f621f Naushir Patuck 2020-04-23  514  			/*
11c7ef536f621f Naushir Patuck 2020-04-23  515  			 * dmabuf either hasn't already been mapped, or it has
11c7ef536f621f Naushir Patuck 2020-04-23  516  			 * changed.
11c7ef536f621f Naushir Patuck 2020-04-23  517  			 */
11c7ef536f621f Naushir Patuck 2020-04-23  518  			if (buf->mmal.dma_buf) {
11c7ef536f621f Naushir Patuck 2020-04-23  519  				v4l2_err(&dev->v4l2_dev,
11c7ef536f621f Naushir Patuck 2020-04-23  520  					 "%s Buffer changed - why did the core not call cleanup?\n",
11c7ef536f621f Naushir Patuck 2020-04-23  521  					 __func__);
11c7ef536f621f Naushir Patuck 2020-04-23  522  				bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
11c7ef536f621f Naushir Patuck 2020-04-23  523  			}
11c7ef536f621f Naushir Patuck 2020-04-23  524  
11c7ef536f621f Naushir Patuck 2020-04-23  525  			buf->mmal.dma_buf = dma_buf;
11c7ef536f621f Naushir Patuck 2020-04-23  526  		} else {
11c7ef536f621f Naushir Patuck 2020-04-23  527  			/*
11c7ef536f621f Naushir Patuck 2020-04-23  528  			 * Already have a reference to the buffer, so release it
11c7ef536f621f Naushir Patuck 2020-04-23  529  			 * here.
11c7ef536f621f Naushir Patuck 2020-04-23  530  			 */
11c7ef536f621f Naushir Patuck 2020-04-23  531  			dma_buf_put(dma_buf);
11c7ef536f621f Naushir Patuck 2020-04-23  532  		}
11c7ef536f621f Naushir Patuck 2020-04-23  533  		ret = 0;
11c7ef536f621f Naushir Patuck 2020-04-23  534  		break;
11c7ef536f621f Naushir Patuck 2020-04-23  535  	case VB2_MEMORY_MMAP:
11c7ef536f621f Naushir Patuck 2020-04-23  536  		/*
11c7ef536f621f Naushir Patuck 2020-04-23  537  		 * We want to do this at init, but vb2_core_expbuf checks that
11c7ef536f621f Naushir Patuck 2020-04-23  538  		 * the index < q->num_buffers, and q->num_buffers only gets
11c7ef536f621f Naushir Patuck 2020-04-23  539  		 * updated once all the buffers are allocated.
11c7ef536f621f Naushir Patuck 2020-04-23  540  		 */
11c7ef536f621f Naushir Patuck 2020-04-23  541  		if (!buf->mmal.dma_buf) {
11c7ef536f621f Naushir Patuck 2020-04-23  542  			buf->mmal.dma_buf = vb2_core_expbuf_dmabuf(vb->vb2_queue,
11c7ef536f621f Naushir Patuck 2020-04-23  543  								   vb->vb2_queue->type,
11c7ef536f621f Naushir Patuck 2020-04-23  544  								   vb->index, 0, O_CLOEXEC);
11c7ef536f621f Naushir Patuck 2020-04-23  545  			v4l2_dbg(3, debug, &dev->v4l2_dev,
11c7ef536f621f Naushir Patuck 2020-04-23  546  				 "%s: exporting ptr %p to dmabuf %p\n",
11c7ef536f621f Naushir Patuck 2020-04-23  547  				 __func__, vb, buf->mmal.dma_buf);
11c7ef536f621f Naushir Patuck 2020-04-23 @548  			if (IS_ERR(buf->mmal.dma_buf)) {
11c7ef536f621f Naushir Patuck 2020-04-23  549  				ret = PTR_ERR(buf->mmal.dma_buf);
11c7ef536f621f Naushir Patuck 2020-04-23  550  				v4l2_err(&dev->v4l2_dev,
11c7ef536f621f Naushir Patuck 2020-04-23  551  					 "%s: Failed to expbuf idx %d, ret %d\n",
11c7ef536f621f Naushir Patuck 2020-04-23  552  					 __func__, vb->index, ret);
11c7ef536f621f Naushir Patuck 2020-04-23  553  			}
11c7ef536f621f Naushir Patuck 2020-04-23  554  		} else {
11c7ef536f621f Naushir Patuck 2020-04-23  555  			ret = 0;
11c7ef536f621f Naushir Patuck 2020-04-23  556  		}
11c7ef536f621f Naushir Patuck 2020-04-23  557  		break;
11c7ef536f621f Naushir Patuck 2020-04-23  558  	default:
11c7ef536f621f Naushir Patuck 2020-04-23  559  		ret = -EINVAL;
11c7ef536f621f Naushir Patuck 2020-04-23  560  		break;
11c7ef536f621f Naushir Patuck 2020-04-23  561  	}
11c7ef536f621f Naushir Patuck 2020-04-23  562  
11c7ef536f621f Naushir Patuck 2020-04-23  563  	return ret;
11c7ef536f621f Naushir Patuck 2020-04-23  564  }
11c7ef536f621f Naushir Patuck 2020-04-23  565  

:::::: The code at line 548 was first introduced by commit
:::::: 11c7ef536f621f0e16903697c4785f7eee84f6d8 staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component

:::::: TO: Naushir Patuck <naush@raspberrypi.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
