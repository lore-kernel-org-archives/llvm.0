Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E01851
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651253516; x=1682789516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1BdG3OSNM0hPqX3c2QOBjnMAfGyoh3U/Lu3pHCGB8BY=;
  b=LCcliC24BAhpbogHWFSFJRVpPlNUPK2tKMjgYqfLidv27uZ7VOvHO/mx
   ovgkBUrx0ncSzPPyRhIukBBBT4UNYo7l46FccRPk3XstI0TstDZmqilL6
   SMozOtMz7HLWEr0xQF1sfTCR7E6r8yPHkHUhlIvE90xoeBzkXXwWd4CXa
   mpEWVe8ZdLGx1M56u38+lSz46XgZuLvjBJ7IiJO6NlW7t3ECtxfOJc0wX
   HpcOk86fN9rCR6tasAtwPDNq0nSOeCXR2w8XVFn5utx6Rp/f8G5AEjVLk
   5LOo/51H668jwGlzO6L5uNEbnbe2mhspUSbs1T8TWedXV5jUGzRQMNgaH
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="246628611"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; 
   d="scan'208";a="246628611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 10:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; 
   d="scan'208";a="514926978"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Apr 2022 10:30:18 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkURe-0006WL-6G;
	Fri, 29 Apr 2022 17:30:18 +0000
Date: Sat, 30 Apr 2022 01:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] vb2: add support for (un)prepare_streaming queue ops
Message-ID: <202204300122.4EgCSZEG-lkp@intel.com>
References: <3d8d5868-0896-edc8-5cab-490f9c4c498a@xs4all.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8d5868-0896-edc8-5cab-490f9c4c498a@xs4all.nl>

Hi Hans,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc4 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Verkuil/vb2-add-support-for-un-prepare_streaming-queue-ops/20220429-204554
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220430/202204300122.4EgCSZEG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/617605203b2c478f0f817069e95d095afa9d6e2f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-Verkuil/vb2-add-support-for-un-prepare_streaming-queue-ops/20220429-204554
        git checkout 617605203b2c478f0f817069e95d095afa9d6e2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/common/videobuf2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/common/videobuf2/videobuf2-core.c:548:27: warning: inequality comparison result unused [-Wunused-comparison]
                                     q->cnt_wait_prepare != q->cnt_wait_finish;
                                     ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:548:27: note: use '|=' to turn this inequality comparison into an or-assignment
                                     q->cnt_wait_prepare != q->cnt_wait_finish;
                                                         ^~
                                                         |=
   1 warning generated.


vim +548 drivers/media/common/videobuf2/videobuf2-core.c

e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  499  
2a87af6ba1b9df4 drivers/media/v4l2-core/videobuf2-core.c        Mauro Carvalho Chehab 2017-11-27  500  /*
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  501   * __vb2_queue_free() - free buffers at the end of the queue - video memory and
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  502   * related information, if no buffers are left return the queue to an
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  503   * uninitialized state. Might be called even if the queue has already been freed.
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  504   */
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  505  static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  506  {
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  507  	unsigned int buffer;
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  508  
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  509  	/*
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  510  	 * Sanity check: when preparing a buffer the queue lock is released for
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  511  	 * a short while (see __buf_prepare for the details), which would allow
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  512  	 * a race with a reqbufs which can call this function. Removing the
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  513  	 * buffers from underneath __buf_prepare is obviously a bad idea, so we
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  514  	 * check if any of the buffers is in the state PREPARING, and if so we
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  515  	 * just return -EAGAIN.
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  516  	 */
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  517  	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  518  	     ++buffer) {
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  519  		if (q->bufs[buffer] == NULL)
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  520  			continue;
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  521  		if (q->bufs[buffer]->state == VB2_BUF_STATE_PREPARING) {
b820935b35479e8 drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinchart      2020-06-21  522  			dprintk(q, 1, "preparing buffers, cannot free\n");
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  523  			return -EAGAIN;
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  524  		}
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  525  	}
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  526  
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  527  	/* Call driver-provided cleanup function for each buffer, if provided */
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  528  	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  529  	     ++buffer) {
256f3162c17595b drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  530  		struct vb2_buffer *vb = q->bufs[buffer];
256f3162c17595b drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  531  
256f3162c17595b drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  532  		if (vb && vb->planes[0].mem_priv)
a1d36d8c705e10a drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-03-17  533  			call_void_vb_qop(vb, buf_cleanup, vb);
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  534  	}
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  535  
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  536  	/* Release video buffer memory */
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  537  	__vb2_free_mem(q, buffers);
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  538  
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  539  #ifdef CONFIG_VIDEO_ADV_DEBUG
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  540  	/*
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  541  	 * Check that all the calls were balances during the life-time of this
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  542  	 * queue. If not (or if the debug level is 1 or up), then dump the
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  543  	 * counters to the kernel log.
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  544  	 */
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  545  	if (q->num_buffers) {
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  546  		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
617605203b2c478 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-04-29  547  				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29 @548  				  q->cnt_wait_prepare != q->cnt_wait_finish;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  549  
af3bac1a7c8a21f drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-11-03  550  		if (unbalanced || debug) {
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  551  			pr_info("counters for queue %p:%s\n", q,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  552  				unbalanced ? " UNBALANCED!" : "");
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  553  			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  554  				q->cnt_queue_setup, q->cnt_start_streaming,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  555  				q->cnt_stop_streaming);
617605203b2c478 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-04-29  556  			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
617605203b2c478 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-04-29  557  				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  558  			pr_info("     wait_prepare: %u wait_finish: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  559  				q->cnt_wait_prepare, q->cnt_wait_finish);
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  560  		}
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  561  		q->cnt_queue_setup = 0;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  562  		q->cnt_wait_prepare = 0;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  563  		q->cnt_wait_finish = 0;
617605203b2c478 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-04-29  564  		q->cnt_prepare_streaming = 0;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  565  		q->cnt_start_streaming = 0;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  566  		q->cnt_stop_streaming = 0;
617605203b2c478 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-04-29  567  		q->cnt_unprepare_streaming = 0;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  568  	}
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  569  	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  570  		struct vb2_buffer *vb = q->bufs[buffer];
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  571  		bool unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  572  				  vb->cnt_mem_prepare != vb->cnt_mem_finish ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  573  				  vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  574  				  vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  575  				  vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  576  				  vb->cnt_buf_queue != vb->cnt_buf_done ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  577  				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  578  				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  579  
af3bac1a7c8a21f drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-11-03  580  		if (unbalanced || debug) {
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  581  			pr_info("   counters for queue %p, buffer %d:%s\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  582  				q, buffer, unbalanced ? " UNBALANCED!" : "");
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  583  			pr_info("     buf_init: %u buf_cleanup: %u buf_prepare: %u buf_finish: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  584  				vb->cnt_buf_init, vb->cnt_buf_cleanup,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  585  				vb->cnt_buf_prepare, vb->cnt_buf_finish);
28d77c21cbeb2c6 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  586  			pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
28d77c21cbeb2c6 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  587  				vb->cnt_buf_out_validate, vb->cnt_buf_queue,
28d77c21cbeb2c6 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  588  				vb->cnt_buf_done, vb->cnt_buf_request_complete);
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  589  			pr_info("     alloc: %u put: %u prepare: %u finish: %u mmap: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  590  				vb->cnt_mem_alloc, vb->cnt_mem_put,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  591  				vb->cnt_mem_prepare, vb->cnt_mem_finish,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  592  				vb->cnt_mem_mmap);
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  593  			pr_info("     get_userptr: %u put_userptr: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  594  				vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  595  			pr_info("     attach_dmabuf: %u detach_dmabuf: %u map_dmabuf: %u unmap_dmabuf: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  596  				vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  597  				vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
2e33dbb06da4078 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  598  			pr_info("     get_dmabuf: %u num_users: %u vaddr: %u cookie: %u\n",
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  599  				vb->cnt_mem_get_dmabuf,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  600  				vb->cnt_mem_num_users,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  601  				vb->cnt_mem_vaddr,
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  602  				vb->cnt_mem_cookie);
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  603  		}
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  604  	}
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  605  #endif
b5b4541eef8eac8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  606  
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  607  	/* Free videobuf buffers */
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  608  	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  609  	     ++buffer) {
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  610  		kfree(q->bufs[buffer]);
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  611  		q->bufs[buffer] = NULL;
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  612  	}
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  613  
2d86401c2cbfce9 drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  614  	q->num_buffers -= buffers;
a7afcaccfab2fb0 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-02-24  615  	if (!q->num_buffers) {
ce4686702f8f56e drivers/media/common/videobuf/videobuf2-core.c  Satendra Singh Thakur 2017-12-28  616  		q->memory = VB2_MEMORY_UNKNOWN;
bd50d999d4d4f31 drivers/media/video/videobuf2-core.c            Marek Szyprowski      2011-10-25  617  		INIT_LIST_HEAD(&q->queued_list);
a7afcaccfab2fb0 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-02-24  618  	}
63faabfd89f4db9 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  619  	return 0;
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  620  }
e23ccc0ad925863 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  621  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
