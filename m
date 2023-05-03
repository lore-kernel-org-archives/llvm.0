Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B6BE4C;
	Wed,  3 May 2023 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683147515; x=1714683515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2Jhm9JCN1ufFaAMvraCMRp8lbUi7LFZ3NAXboYQDG8=;
  b=XVsUZbyOJTlMTVwVeE0xfetHCUcww4EGbeOmdNOQn/LSgb3R8nuRhW0d
   nea9L7z0cMfL/iU7RtXuwhmbdioxEwCGmm3eD4L2OmtWCoNirtHCucrjz
   kohH4+wgx0jXAxUIY7fcwnsMrKNEwekI+dmXTqJCq8sOhtKwawpyjlCd1
   wwrTGxGmch9k5/eQpBilTnaKcKNeY1PSaHOKS0Xy6D0soeLu0vmsEBqE7
   FkonVeO61+tHSmur2SbJHSgOLv7jZykmqnoc8PndN5cKtgDflopVU21cn
   J8plar2snmjBWDhvemMP9desYGa+2g6MHjgfTpv5YeclWmCWy1l85wef7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329126187"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="329126187"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 13:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="699569362"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="699569362"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 May 2023 13:58:33 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puJYW-0002HI-21;
	Wed, 03 May 2023 20:58:32 +0000
Date: Thu, 4 May 2023 04:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 02/13] media: AV1: Make sure that bit depth in
 correctly initialize
Message-ID: <202305040452.AOtjEcoR-lkp@intel.com>
References: <20230503083438.85139-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503083438.85139-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on rockchip/for-next linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230503083438.85139-3-benjamin.gaignard%40collabora.com
patch subject: [PATCH v7 02/13] media: AV1: Make sure that bit depth in correctly initialize
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040452.AOtjEcoR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b6ab729a6726070daaa93896fdbd8e11c8c8a26d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
        git checkout b6ab729a6726070daaa93896fdbd8e11c8c8a26d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040452.AOtjEcoR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ctrls-core.c:161:7: error: use of undeclared identifier 'V4L2_CTRL_TYPE_AV1_SEQUENCE'; did you mean 'V4L2_CTRL_TYPE_MPEG2_SEQUENCE'?
           case V4L2_CTRL_TYPE_AV1_SEQUENCE:
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                V4L2_CTRL_TYPE_MPEG2_SEQUENCE
   include/uapi/linux/videodev2.h:1893:2: note: 'V4L2_CTRL_TYPE_MPEG2_SEQUENCE' declared here
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
   3 errors generated.


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
