Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C03205;
	Wed, 12 Apr 2023 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681309815; x=1712845815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O2uk/sU+O+qip2NfqLG97oSjATXTuvDSGlR3MD9OeDw=;
  b=MEQNK9X3Qy4LsIJ2Ralmm74vl1d9IM6M2dUounz4sboufiWsxpz2TLUK
   lcaC3r9ePjEAzogKqmoC7o95JbI0Mq0E0WEYiJIluGMoQJWw8OEsvtD6s
   3vofI/SBIE1AhYISL4KiwgKGtn4MQwuzpdX7v1gMIXxhY054v3IFKjzM7
   hNF66q4fIKRnUagoUsi+kg1n6+0kLsc9fCahtLnzP0Z4RNZsTzI/tvz9k
   CAZ6/qHjUNL1Cw8Fds8ZFouS7SVHxH3cGluG945MSAUACmUMBvVlSY03D
   Ls0ic04xKEi2DFRU/WbKqOOhGyIYLvk/cDX6mR+iTnWR+Kcxf4tiWeB3J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343917365"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="343917365"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 07:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688957332"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="688957332"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Apr 2023 07:30:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmbUB-000XmV-1X;
	Wed, 12 Apr 2023 14:30:11 +0000
Date: Wed, 12 Apr 2023 22:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 02/13] media: AV1: Make sure that bit depth in
 correctly initialize
Message-ID: <202304122222.yPR9mAsH-lkp@intel.com>
References: <20230412115652.403949-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412115652.403949-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230412]
[also build test ERROR on linus/master v6.3-rc6]
[cannot apply to media-tree/master rockchip/for-next pza/reset/next pza/imx-drm/next v6.3-rc6 v6.3-rc5 v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230412-195930
patch link:    https://lore.kernel.org/r/20230412115652.403949-3-benjamin.gaignard%40collabora.com
patch subject: [PATCH v6 02/13] media: AV1: Make sure that bit depth in correctly initialize
config: hexagon-randconfig-r045-20230412 (https://download.01.org/0day-ci/archive/20230412/202304122222.yPR9mAsH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a68573a34dc1e20897be6052b62873a662c0ddd4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230412-195930
        git checkout a68573a34dc1e20897be6052b62873a662c0ddd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122222.yPR9mAsH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:161:7: error: use of undeclared identifier 'V4L2_CTRL_TYPE_AV1_SEQUENCE'; did you mean 'V4L2_CTRL_TYPE_MPEG2_SEQUENCE'?
           case V4L2_CTRL_TYPE_AV1_SEQUENCE:
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                V4L2_CTRL_TYPE_MPEG2_SEQUENCE
   include/uapi/linux/videodev2.h:1885:2: note: 'V4L2_CTRL_TYPE_MPEG2_SEQUENCE' declared here
           V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
           ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:163:17: error: incomplete definition of type 'struct v4l2_ctrl_av1_sequence'
                   p_av1_sequence->bit_depth = 8;
                   ~~~~~~~~~~~~~~^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:114:9: note: forward declaration of 'struct v4l2_ctrl_av1_sequence'
           struct v4l2_ctrl_av1_sequence *p_av1_sequence;
                  ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:161:7: error: duplicate case value 'V4L2_CTRL_TYPE_MPEG2_SEQUENCE'
           case V4L2_CTRL_TYPE_AV1_SEQUENCE:
                ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:123:7: note: previous case defined here
           case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
                ^
   6 warnings and 3 errors generated.


vim +161 drivers/media/v4l2-core/v4l2-ctrls-core.c

   103	
   104	static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
   105				      union v4l2_ctrl_ptr ptr)
   106	{
   107		struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
   108		struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
   109		struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
   110		struct v4l2_ctrl_vp8_frame *p_vp8_frame;
   111		struct v4l2_ctrl_vp9_frame *p_vp9_frame;
   112		struct v4l2_ctrl_fwht_params *p_fwht_params;
   113		struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
   114		struct v4l2_ctrl_av1_sequence *p_av1_sequence;
   115		void *p = ptr.p + idx * ctrl->elem_size;
   116	
   117		if (ctrl->p_def.p_const)
   118			memcpy(p, ctrl->p_def.p_const, ctrl->elem_size);
   119		else
   120			memset(p, 0, ctrl->elem_size);
   121	
   122		switch ((u32)ctrl->type) {
   123		case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
   124			p_mpeg2_sequence = p;
   125	
   126			/* 4:2:0 */
   127			p_mpeg2_sequence->chroma_format = 1;
   128			break;
   129		case V4L2_CTRL_TYPE_MPEG2_PICTURE:
   130			p_mpeg2_picture = p;
   131	
   132			/* interlaced top field */
   133			p_mpeg2_picture->picture_structure = V4L2_MPEG2_PIC_TOP_FIELD;
   134			p_mpeg2_picture->picture_coding_type =
   135						V4L2_MPEG2_PIC_CODING_TYPE_I;
   136			break;
   137		case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
   138			p_mpeg2_quant = p;
   139	
   140			memcpy(p_mpeg2_quant->intra_quantiser_matrix,
   141			       mpeg2_intra_quant_matrix,
   142			       ARRAY_SIZE(mpeg2_intra_quant_matrix));
   143			/*
   144			 * The default non-intra MPEG-2 quantisation
   145			 * coefficients are all 16, as per the specification.
   146			 */
   147			memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16,
   148			       sizeof(p_mpeg2_quant->non_intra_quantiser_matrix));
   149			break;
   150		case V4L2_CTRL_TYPE_VP8_FRAME:
   151			p_vp8_frame = p;
   152			p_vp8_frame->num_dct_parts = 1;
   153			break;
   154		case V4L2_CTRL_TYPE_VP9_FRAME:
   155			p_vp9_frame = p;
   156			p_vp9_frame->profile = 0;
   157			p_vp9_frame->bit_depth = 8;
   158			p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
   159				V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
   160			break;
 > 161		case V4L2_CTRL_TYPE_AV1_SEQUENCE:
   162			p_av1_sequence = p;
 > 163			p_av1_sequence->bit_depth = 8;
   164			break;
   165		case V4L2_CTRL_TYPE_FWHT_PARAMS:
   166			p_fwht_params = p;
   167			p_fwht_params->version = V4L2_FWHT_VERSION;
   168			p_fwht_params->width = 1280;
   169			p_fwht_params->height = 720;
   170			p_fwht_params->flags = V4L2_FWHT_FL_PIXENC_YUV |
   171				(2 << V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
   172			break;
   173		case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
   174			p_h264_scaling_matrix = p;
   175			/*
   176			 * The default (flat) H.264 scaling matrix when none are
   177			 * specified in the bitstream, this is according to formulas
   178			 *  (7-8) and (7-9) of the specification.
   179			 */
   180			memset(p_h264_scaling_matrix, 16, sizeof(*p_h264_scaling_matrix));
   181			break;
   182		}
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
