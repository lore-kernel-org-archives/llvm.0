Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E628AD22;
	Sun,  3 Mar 2024 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455846; cv=none; b=arJ24c9z7Eivyplkn+Fxsgc9FJq8Vuisc5MavlczzHcb2Wxf/jM3RdDb38Ve8Oym3RUJCWZAeSCzvfQuvweyv8GWgFwf/CeklcLcAdCyzPYaBNndXapDbj10U3IcTaRXyZMmXBh3xt5Dtiw0q79WJFI1YWIQh5l9XVWSPc5KKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455846; c=relaxed/simple;
	bh=Ac28i28Dd0Q+J3tVJsYgyYlnVF+wi0r0rcNXZW5Z/8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGdJxNJYCnsUD1Td3UprKTbJ0wwN4OgNPFnj0B+IgYujrH/XAJLrGbc9qQiCYQWYLjHSlM82hB9/wnNtn5NCeL/gFXtpXsfgFdpgBevy/qXbmpe+GguF4aVe+9eaXfk12cLcj8om7uZWS26LZKOMm4SQbPbR6e4hVxmk0U/BKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOQLvfkl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOQLvfkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709455844; x=1740991844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ac28i28Dd0Q+J3tVJsYgyYlnVF+wi0r0rcNXZW5Z/8s=;
  b=IOQLvfklBV3PTpqFhbriMucaf+hmm/SAYOec/3EkC06kySk77govJV33
   7f9lK774ATMsjafSLC/eHAYK8y5R+60TcDR7/9P6VxKlp7z5RfB4xvdyg
   2k9UzLUEO4cguusmGp+64yViIHscptOs7wtHjVKsedtgGSnKBPd8uD7gx
   qOiqy2GoMIT1Jmo6OsMG2TmENqHYlZf6LpEpXEkpzpf4J/y0+M4LGstev
   E2PAZV4dxQa5sEhqcYvZDP0HoeEyfb59MldOVLShVIcToWkpXOPBKSW5Z
   N8lVA8x+0OBRh6FnkAbxNXqDHF11x9RfqxKrfOLJkwGcmbtLG6sf55Gf1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3811926"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3811926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="9114888"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 00:50:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rghYM-0001Zk-2l;
	Sun, 03 Mar 2024 08:50:38 +0000
Date: Sun, 3 Mar 2024 16:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/unicam/next 8/16]
 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:8: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202403031658.yi7bVq8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.8/unicam/next
head:   0301903671d87170fc043a48deb7e0d7a38a332c
commit: 73bdce8e3693eba9d97649d53eaff7592fd07a5f [8/16] media: v4l: Add V4L2-PIX-FMT-Y14P format
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031658.yi7bVq8q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031658.yi7bVq8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031658.yi7bVq8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     548 |                         if (IS_ERR(buf->mmal.dma_buf)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:563:9: note: uninitialized use occurs here
     563 |         return ret;
         |                ^~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:548:4: note: remove the 'if' if its condition is always true
     548 |                         if (IS_ERR(buf->mmal.dma_buf)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:483:9: note: initialize the variable 'ret' to silence this warning
     483 |         int ret;
         |                ^
         |                 = 0
   drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c:160:20: warning: unused function 'node_is_capture' [-Wunused-function]
     160 | static inline bool node_is_capture(struct bcm2835_isp_node *node)
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +548 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c

ccf04478fd461b Naushir Patuck   2023-11-09  474  
ccf04478fd461b Naushir Patuck   2023-11-09  475  static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
ccf04478fd461b Naushir Patuck   2023-11-09  476  {
ccf04478fd461b Naushir Patuck   2023-11-09  477  	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
ccf04478fd461b Naushir Patuck   2023-11-09  478  	struct bcm2835_isp_dev *dev = node_get_dev(node);
ccf04478fd461b Naushir Patuck   2023-11-09  479  	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
ccf04478fd461b Naushir Patuck   2023-11-09  480  	struct bcm2835_isp_buffer *buf =
ccf04478fd461b Naushir Patuck   2023-11-09  481  		container_of(vb2, struct bcm2835_isp_buffer, vb);
ccf04478fd461b Naushir Patuck   2023-11-09  482  	struct dma_buf *dma_buf;
ccf04478fd461b Naushir Patuck   2023-11-09  483  	int ret;
ccf04478fd461b Naushir Patuck   2023-11-09  484  
ccf04478fd461b Naushir Patuck   2023-11-09  485  	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
ccf04478fd461b Naushir Patuck   2023-11-09  486  		 __func__, vb->vb2_queue->type, vb);
ccf04478fd461b Naushir Patuck   2023-11-09  487  
ccf04478fd461b Naushir Patuck   2023-11-09  488  	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
ccf04478fd461b Naushir Patuck   2023-11-09  489  		if (vb2->field == V4L2_FIELD_ANY)
ccf04478fd461b Naushir Patuck   2023-11-09  490  			vb2->field = V4L2_FIELD_NONE;
ccf04478fd461b Naushir Patuck   2023-11-09  491  		if (vb2->field != V4L2_FIELD_NONE) {
ccf04478fd461b Naushir Patuck   2023-11-09  492  			v4l2_err(&dev->v4l2_dev,
ccf04478fd461b Naushir Patuck   2023-11-09  493  				 "%s field isn't supported\n", __func__);
ccf04478fd461b Naushir Patuck   2023-11-09  494  			return -EINVAL;
ccf04478fd461b Naushir Patuck   2023-11-09  495  		}
ccf04478fd461b Naushir Patuck   2023-11-09  496  	}
ccf04478fd461b Naushir Patuck   2023-11-09  497  
ccf04478fd461b Naushir Patuck   2023-11-09  498  	if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
ccf04478fd461b Naushir Patuck   2023-11-09  499  		v4l2_err(&dev->v4l2_dev,
ccf04478fd461b Naushir Patuck   2023-11-09  500  			 "%s data will not fit into plane (%lu < %lu)\n",
ccf04478fd461b Naushir Patuck   2023-11-09  501  			 __func__, vb2_plane_size(vb, 0),
ccf04478fd461b Naushir Patuck   2023-11-09  502  			 (long)node->q_data.sizeimage);
ccf04478fd461b Naushir Patuck   2023-11-09  503  		return -EINVAL;
ccf04478fd461b Naushir Patuck   2023-11-09  504  	}
ccf04478fd461b Naushir Patuck   2023-11-09  505  
ccf04478fd461b Naushir Patuck   2023-11-09  506  	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
ccf04478fd461b Naushir Patuck   2023-11-09  507  		vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
ccf04478fd461b Naushir Patuck   2023-11-09  508  
ccf04478fd461b Naushir Patuck   2023-11-09  509  	switch (vb->memory) {
ccf04478fd461b Naushir Patuck   2023-11-09  510  	case VB2_MEMORY_DMABUF:
ccf04478fd461b Naushir Patuck   2023-11-09  511  		dma_buf = dma_buf_get(vb->planes[0].m.fd);
ccf04478fd461b Naushir Patuck   2023-11-09  512  
ccf04478fd461b Naushir Patuck   2023-11-09  513  		if (dma_buf != buf->mmal.dma_buf) {
ccf04478fd461b Naushir Patuck   2023-11-09  514  			/*
ccf04478fd461b Naushir Patuck   2023-11-09  515  			 * dmabuf either hasn't already been mapped, or it has
ccf04478fd461b Naushir Patuck   2023-11-09  516  			 * changed.
ccf04478fd461b Naushir Patuck   2023-11-09  517  			 */
ccf04478fd461b Naushir Patuck   2023-11-09  518  			if (buf->mmal.dma_buf) {
ccf04478fd461b Naushir Patuck   2023-11-09  519  				v4l2_err(&dev->v4l2_dev,
ccf04478fd461b Naushir Patuck   2023-11-09  520  					 "%s Buffer changed - why did the core not call cleanup?\n",
ccf04478fd461b Naushir Patuck   2023-11-09  521  					 __func__);
ccf04478fd461b Naushir Patuck   2023-11-09  522  				bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
ccf04478fd461b Naushir Patuck   2023-11-09  523  			}
ccf04478fd461b Naushir Patuck   2023-11-09  524  
ccf04478fd461b Naushir Patuck   2023-11-09  525  			buf->mmal.dma_buf = dma_buf;
ccf04478fd461b Naushir Patuck   2023-11-09  526  		} else {
ccf04478fd461b Naushir Patuck   2023-11-09  527  			/*
ccf04478fd461b Naushir Patuck   2023-11-09  528  			 * Already have a reference to the buffer, so release it
ccf04478fd461b Naushir Patuck   2023-11-09  529  			 * here.
ccf04478fd461b Naushir Patuck   2023-11-09  530  			 */
ccf04478fd461b Naushir Patuck   2023-11-09  531  			dma_buf_put(dma_buf);
ccf04478fd461b Naushir Patuck   2023-11-09  532  		}
ccf04478fd461b Naushir Patuck   2023-11-09  533  		ret = 0;
ccf04478fd461b Naushir Patuck   2023-11-09  534  		break;
ccf04478fd461b Naushir Patuck   2023-11-09  535  	case VB2_MEMORY_MMAP:
ccf04478fd461b Naushir Patuck   2023-11-09  536  		/*
ccf04478fd461b Naushir Patuck   2023-11-09  537  		 * We want to do this at init, but vb2_core_expbuf checks that
ccf04478fd461b Naushir Patuck   2023-11-09  538  		 * the index < q->num_buffers, and q->num_buffers only gets
ccf04478fd461b Naushir Patuck   2023-11-09  539  		 * updated once all the buffers are allocated.
ccf04478fd461b Naushir Patuck   2023-11-09  540  		 */
ccf04478fd461b Naushir Patuck   2023-11-09  541  		if (!buf->mmal.dma_buf) {
ccf04478fd461b Naushir Patuck   2023-11-09  542  			buf->mmal.dma_buf = vb2_core_expbuf_dmabuf(vb->vb2_queue,
ccf04478fd461b Naushir Patuck   2023-11-09  543  								   vb->vb2_queue->type,
a2017d899ab931 Laurent Pinchart 2023-12-01  544  								   vb, 0, O_CLOEXEC);
ccf04478fd461b Naushir Patuck   2023-11-09  545  			v4l2_dbg(3, debug, &dev->v4l2_dev,
ccf04478fd461b Naushir Patuck   2023-11-09  546  				 "%s: exporting ptr %p to dmabuf %p\n",
ccf04478fd461b Naushir Patuck   2023-11-09  547  				 __func__, vb, buf->mmal.dma_buf);
ccf04478fd461b Naushir Patuck   2023-11-09 @548  			if (IS_ERR(buf->mmal.dma_buf)) {
ccf04478fd461b Naushir Patuck   2023-11-09  549  				ret = PTR_ERR(buf->mmal.dma_buf);
ccf04478fd461b Naushir Patuck   2023-11-09  550  				v4l2_err(&dev->v4l2_dev,
ccf04478fd461b Naushir Patuck   2023-11-09  551  					 "%s: Failed to expbuf idx %d, ret %d\n",
ccf04478fd461b Naushir Patuck   2023-11-09  552  					 __func__, vb->index, ret);
ccf04478fd461b Naushir Patuck   2023-11-09  553  			}
ccf04478fd461b Naushir Patuck   2023-11-09  554  		} else {
ccf04478fd461b Naushir Patuck   2023-11-09  555  			ret = 0;
ccf04478fd461b Naushir Patuck   2023-11-09  556  		}
ccf04478fd461b Naushir Patuck   2023-11-09  557  		break;
ccf04478fd461b Naushir Patuck   2023-11-09  558  	default:
ccf04478fd461b Naushir Patuck   2023-11-09  559  		ret = -EINVAL;
ccf04478fd461b Naushir Patuck   2023-11-09  560  		break;
ccf04478fd461b Naushir Patuck   2023-11-09  561  	}
ccf04478fd461b Naushir Patuck   2023-11-09  562  
ccf04478fd461b Naushir Patuck   2023-11-09  563  	return ret;
ccf04478fd461b Naushir Patuck   2023-11-09  564  }
ccf04478fd461b Naushir Patuck   2023-11-09  565  

:::::: The code at line 548 was first introduced by commit
:::::: ccf04478fd461b0517a703743a57a65ca304faf2 staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component

:::::: TO: Naushir Patuck <naush@raspberrypi.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
