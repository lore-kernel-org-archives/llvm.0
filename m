Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA33D79
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658702314; x=1690238314;
  h=date:from:cc:subject:message-id:mime-version;
  bh=reNScEfQcyUavZq2bRqCTCyZw/IJzM6IpoTAYtOWqrA=;
  b=cKr0OhKFKDW2USAUb6ovGoSmmap88o8KsKlyHEEcKhTrBnMO9xYNaSbf
   JXtZAT878s5LpuoSnSxczix27wtzUigHVfNszgF/A7rogynWZgH+QvPNH
   +o/gGxfRROrf4EIMIna7CgDflw95fvpmnwbpYZ/k0Be5YLAn//y9qB1od
   wX7aiAfKtTbpq1+KiznHpTMrEsADoHt2APVnA34AJ1fSlj3Tb08GYEhkj
   P6FXl9l9dJvnZ6oAn/cI5f8i7OHOG1QEAAp7gTu6uHO9NxE4lK4KhDHmS
   W/6v3oHPLjHSxJBPbQGKYtzHCUsFeS0cykWBmBHjAZkpUmBud0C2GYoKd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="287587687"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="287587687"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 15:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="599407484"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jul 2022 15:38:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFkF5-0004ML-22;
	Sun, 24 Jul 2022 22:38:31 +0000
Date: Mon, 25 Jul 2022 06:37:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 29087/30000]
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:246:26: warning:
 taking address of packed member 'width' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
Message-ID: <202207250606.riwCV79P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c: 246:26: warning:
 taking address of packed member 'width' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c: 249:7: warning:
 taking address of packed member 'height' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c: 306:26: warning:
 taking address of packed member 'width' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c: 309:7: warning:
 taking address of packed member 'height' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
 [-Waddress-of-packed-member]

BCC: lkp@intel.com
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

Hi Yunfei,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   2377c81769bf81e7a658ee35a2ee2fa80d03bc8f
commit: 314787a6fadda343cf8532a3f3707df5d2a4406f [29087/30000] BACKPORT: UPSTREAM: media: platform: rename mediatek/mtk-jpeg/ to mediatek/jpeg/
config: mips-randconfig-r023-20220724 (https://download.01.org/0day-ci/archive/20220725/202207250606.riwCV79P-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 314787a6fadda343cf8532a3f3707df5d2a4406f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/mediatek/vcodec/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:246:26: warning: taking address of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   v4l_bound_align_image(&pix_fmt_mp->width,
                                          ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:249:7: warning: taking address of packed member 'height' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                           &pix_fmt_mp->height,
                                            ^~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c:306:26: warning: taking address of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   v4l_bound_align_image(&pix_fmt_mp->width,
                                          ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c:309:7: warning: taking address of packed member 'height' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                           &pix_fmt_mp->height,
                                            ^~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +246 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c

590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  219  
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  220  static int vidioc_try_fmt(struct v4l2_format *f,
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  221  			  const struct mtk_video_fmt *fmt)
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  222  {
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  223  	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  224  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  225  	pix_fmt_mp->field = V4L2_FIELD_NONE;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  226  
085b999783ee6f drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c Yunfei Dong       2022-05-24  227  	pix_fmt_mp->width =
085b999783ee6f drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c Yunfei Dong       2022-05-24  228  		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
085b999783ee6f drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c Yunfei Dong       2022-05-24  229  	pix_fmt_mp->height =
085b999783ee6f drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c Yunfei Dong       2022-05-24  230  		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
b5e897639187f1 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Alexandre Courbot 2021-04-27  231  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  232  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  233  		pix_fmt_mp->num_planes = 1;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  234  		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  235  	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  236  		int tmp_w, tmp_h;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  237  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  238  		/*
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  239  		 * Find next closer width align 64, heign align 64, size align
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  240  		 * 64 rectangle
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  241  		 * Note: This only get default value, the real HW needed value
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  242  		 *       only available when ctx in MTK_STATE_HEADER state
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  243  		 */
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  244  		tmp_w = pix_fmt_mp->width;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  245  		tmp_h = pix_fmt_mp->height;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02 @246  		v4l_bound_align_image(&pix_fmt_mp->width,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  247  					MTK_VDEC_MIN_W,
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  248  					MTK_VDEC_MAX_W, 6,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02 @249  					&pix_fmt_mp->height,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  250  					MTK_VDEC_MIN_H,
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  251  					MTK_VDEC_MAX_H, 6, 9);
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  252  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  253  		if (pix_fmt_mp->width < tmp_w &&
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  254  			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  255  			pix_fmt_mp->width += 64;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  256  		if (pix_fmt_mp->height < tmp_h &&
77076a154531e7 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Yunfei Dong       2022-05-19  257  			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  258  			pix_fmt_mp->height += 64;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  259  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  260  		mtk_v4l2_debug(0,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  261  			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d",
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  262  			tmp_w, tmp_h, pix_fmt_mp->width,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  263  			pix_fmt_mp->height,
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  264  			pix_fmt_mp->width * pix_fmt_mp->height);
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  265  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  266  		pix_fmt_mp->num_planes = fmt->num_planes;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  267  		pix_fmt_mp->plane_fmt[0].sizeimage =
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  268  				pix_fmt_mp->width * pix_fmt_mp->height;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  269  		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  270  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  271  		if (pix_fmt_mp->num_planes == 2) {
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  272  			pix_fmt_mp->plane_fmt[1].sizeimage =
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  273  				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  274  			pix_fmt_mp->plane_fmt[1].bytesperline =
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  275  				pix_fmt_mp->width;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  276  		}
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  277  	}
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  278  
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  279  	pix_fmt_mp->flags = 0;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  280  	return 0;
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  281  }
590577a4e5257a drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c          Tiffany Lin       2016-09-02  282  

:::::: The code at line 246 was first introduced by commit
:::::: 590577a4e5257ac3ed72999a94666ad6ba8f24bc [media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver

:::::: TO: Tiffany Lin <tiffany.lin@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
