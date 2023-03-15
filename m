Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC066123;
	Wed, 15 Mar 2023 19:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678908185; x=1710444185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oWImIM43xOCrRKtuvJbpmJXc8bzl1h0OJx1FJQDC134=;
  b=OVJ/1oY8uZwlj4T6qmd+54cepWDKO4s0EL4vxtgmPKi+ph9raB0l8faX
   vRmjrTNZSUE9ALXH9yzJWhkfeTWMc5MpVGsOaM95hvBqU+epW8Z0RpxFP
   qLqU5wCb0NWTJGPBsWhm6yptaJ9kJPWfTnq+ssq9ZylOPlBNpyoUytqql
   upBjNGxfHWhAnac3RVrEqe3NXvH34/X52AFBWljq4f6JRo3184OuFLHY0
   dPSQfru49kCeadtgt56cxqJOTxZxCTni+lwqWgcQbd2ViswM7FjqIwjiQ
   YaxV5pXA5EvS6+j5rYjqojE4o4JqJHTrZDfPSaT0pan0ymTO6ZMlj/bbA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365487307"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365487307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 12:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="679611461"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="679611461"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Mar 2023 12:23:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcWiE-0007yp-2w;
	Wed, 15 Mar 2023 19:23:02 +0000
Date: Thu, 16 Mar 2023 03:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 4/4] media: videobuf2: Stop define VB2_MAX_FRAME as global
Message-ID: <202303160338.IGIhm3EY-lkp@intel.com>
References: <20230313135916.862852-5-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313135916.862852-5-benjamin.gaignard@collabora.com>

Hi Benjamin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230313135916.862852-5-benjamin.gaignard%40collabora.com
patch subject: [RFC 4/4] media: videobuf2: Stop define VB2_MAX_FRAME as global
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303160338.IGIhm3EY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a67acf79be87d808e3b6c0836797e39006651241
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
        git checkout a67acf79be87d808e3b6c0836797e39006651241
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160338.IGIhm3EY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/ipu3/ipu3-v4l2.c:398:44: error: use of undeclared identifier 'VB2_MAX_FRAME'
           *num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
                                                     ^
>> drivers/staging/media/ipu3/ipu3-v4l2.c:398:44: error: use of undeclared identifier 'VB2_MAX_FRAME'
>> drivers/staging/media/ipu3/ipu3-v4l2.c:398:44: error: use of undeclared identifier 'VB2_MAX_FRAME'
>> drivers/staging/media/ipu3/ipu3-v4l2.c:398:44: error: use of undeclared identifier 'VB2_MAX_FRAME'
>> drivers/staging/media/ipu3/ipu3-v4l2.c:398:15: error: assigning to 'unsigned int' from incompatible type 'void'
           *num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +/VB2_MAX_FRAME +398 drivers/staging/media/ipu3/ipu3-v4l2.c

a0ca1627b4501d Yong Zhi   2018-12-06  385  
27b795adb3c221 Yong Zhi   2019-02-07  386  static int imgu_vb2_queue_setup(struct vb2_queue *vq,
a0ca1627b4501d Yong Zhi   2018-12-06  387  				unsigned int *num_buffers,
a0ca1627b4501d Yong Zhi   2018-12-06  388  				unsigned int *num_planes,
a0ca1627b4501d Yong Zhi   2018-12-06  389  				unsigned int sizes[],
a0ca1627b4501d Yong Zhi   2018-12-06  390  				struct device *alloc_devs[])
a0ca1627b4501d Yong Zhi   2018-12-06  391  {
a0ca1627b4501d Yong Zhi   2018-12-06  392  	struct imgu_device *imgu = vb2_get_drv_priv(vq);
a0ca1627b4501d Yong Zhi   2018-12-06  393  	struct imgu_video_device *node =
a0ca1627b4501d Yong Zhi   2018-12-06  394  		container_of(vq, struct imgu_video_device, vbq);
a0ca1627b4501d Yong Zhi   2018-12-06  395  	const struct v4l2_format *fmt = &node->vdev_fmt;
a0ca1627b4501d Yong Zhi   2018-12-06  396  	unsigned int size;
a0ca1627b4501d Yong Zhi   2018-12-06  397  
a0ca1627b4501d Yong Zhi   2018-12-06 @398  	*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
a0ca1627b4501d Yong Zhi   2018-12-06  399  	alloc_devs[0] = &imgu->pci_dev->dev;
a0ca1627b4501d Yong Zhi   2018-12-06  400  
a0ca1627b4501d Yong Zhi   2018-12-06  401  	if (vq->type == V4L2_BUF_TYPE_META_CAPTURE ||
a0ca1627b4501d Yong Zhi   2018-12-06  402  	    vq->type == V4L2_BUF_TYPE_META_OUTPUT)
a0ca1627b4501d Yong Zhi   2018-12-06  403  		size = fmt->fmt.meta.buffersize;
a0ca1627b4501d Yong Zhi   2018-12-06  404  	else
a0ca1627b4501d Yong Zhi   2018-12-06  405  		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
a0ca1627b4501d Yong Zhi   2018-12-06  406  
a0ca1627b4501d Yong Zhi   2018-12-06  407  	if (*num_planes) {
a0ca1627b4501d Yong Zhi   2018-12-06  408  		if (sizes[0] < size)
a0ca1627b4501d Yong Zhi   2018-12-06  409  			return -EINVAL;
a0ca1627b4501d Yong Zhi   2018-12-06  410  		size = sizes[0];
a0ca1627b4501d Yong Zhi   2018-12-06  411  	}
a0ca1627b4501d Yong Zhi   2018-12-06  412  
a0ca1627b4501d Yong Zhi   2018-12-06  413  	*num_planes = 1;
a0ca1627b4501d Yong Zhi   2018-12-06  414  	sizes[0] = size;
51abe041c5ed56 Bingbu Cao 2018-12-06  415  
a0ca1627b4501d Yong Zhi   2018-12-06  416  	/* Initialize buffer queue */
a0ca1627b4501d Yong Zhi   2018-12-06  417  	INIT_LIST_HEAD(&node->buffers);
a0ca1627b4501d Yong Zhi   2018-12-06  418  
a0ca1627b4501d Yong Zhi   2018-12-06  419  	return 0;
a0ca1627b4501d Yong Zhi   2018-12-06  420  }
a0ca1627b4501d Yong Zhi   2018-12-06  421  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
