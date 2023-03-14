Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA728EF;
	Tue, 14 Mar 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678788277; x=1710324277;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DuyYrXX2r95sQ6uG4hkHhhoMI9GTEbdQx/DJbwGYTK8=;
  b=bIviCExwJhD+1aeLdDeANrdIlPCrkSV0BtEMEkK35uEgSohleepGuf1B
   LdSxuHL9hi9fjVPEhF0jAhOwA+WhZ9Dd3T0u31hb+SnRStzuqy1jK8D0F
   p3NGR3LH8BBgQexDX2iAPEsXyKvYNl4W7h9fKQfxv7Ti1WSOU2JU9S3mN
   tIrUI5Tp5LRa9lFfL4CRrOtQV9Y2JrmJmCC4x+eJxOhNi/ITXeQRzEjE8
   8ggaMNcRxCcbk/kEF8OL5p1f0rxwaOcd98JBD3rs8/w4Y3l/oLRD1i3kj
   Qv4u/XwBefJ5szuWLIgm0IVjhWmMAPzMTDvxCiMJ1koTYPgrwYcHFuOJH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334862330"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="334862330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 03:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="679029799"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="679029799"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 03:04:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc1W9-0006nW-0U;
	Tue, 14 Mar 2023 10:04:29 +0000
Date: Tue, 14 Mar 2023 18:04:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/media/v4l2-core/v4l2-ioctl.c:302:28: warning: taking address
 of packed member 'pixelformat' of class or structure
 'v4l2_pix_format_mplane' may result in an unaligned pointer value
Message-ID: <202303141714.UxHEuotf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/media/v4l2-core/v4l2-ioctl.c: 302:28: warning: taking address of
 packed member 'pixelformat' of class or structure 'v4l2_pix_format_mplane'
 may result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/media/v4l2-core/v4l2-ioctl.c: 346:37: warning: taking address of
 packed member 'pixelformat' of class or structure 'v4l2_sdr_format' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/media/v4l2-core/v4l2-ioctl.c: 352:5: warning: taking address of
 packed member 'dataformat' of class or structure 'v4l2_meta_format' may
 result in an unaligned pointer value [-Waddress-of-packed-member]

TO: Luciano Coelho <luciano.coelho@intel.com>
TO: Golan Ben Ami <golan.ben.ami@intel.com>
TO: Michael Golant <michael.golant@intel.com>
TO: Johannes Berg <johannes.berg@intel.com>

Hi Sakari,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 8abcb9019ee52170db785200c4fbf321f7ea329f UPSTREAM: v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
date:   1 year, 10 months ago
config: mips-randconfig-r001-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141714.UxHEuotf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=8abcb9019ee52170db785200c4fbf321f7ea329f
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core62-50-1
        git checkout 8abcb9019ee52170db785200c4fbf321f7ea329f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141714.UxHEuotf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ioctl.c:302:28: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           mp->width, mp->height, &mp->pixelformat,
                                                   ^~~~~~~~~~~~~~~
   include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:346:37: warning: taking address of packed member 'pixelformat' of class or structure 'v4l2_sdr_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
                                                     ^~~~~~~~~~~~~~~~
   include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-ioctl.c:352:5: warning: taking address of packed member 'dataformat' of class or structure 'v4l2_meta_format' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           &meta->dataformat, meta->buffersize);
                            ^~~~~~~~~~~~~~~~
   include/linux/printk.h:385:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~
   3 warnings generated.


vim +302 drivers/media/v4l2-core/v4l2-ioctl.c

   272	
   273	static void v4l_print_format(const void *arg, bool write_only)
   274	{
   275		const struct v4l2_format *p = arg;
   276		const struct v4l2_pix_format *pix;
   277		const struct v4l2_pix_format_mplane *mp;
   278		const struct v4l2_vbi_format *vbi;
   279		const struct v4l2_sliced_vbi_format *sliced;
   280		const struct v4l2_window *win;
   281		const struct v4l2_sdr_format *sdr;
   282		const struct v4l2_meta_format *meta;
   283		u32 planes;
   284		unsigned i;
   285	
   286		pr_cont("type=%s", prt_names(p->type, v4l2_type_names));
   287		switch (p->type) {
   288		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
   289		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
   290			pix = &p->fmt.pix;
   291			pr_cont(", width=%u, height=%u, pixelformat=%p4cc, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
   292				pix->width, pix->height, &pix->pixelformat,
   293				prt_names(pix->field, v4l2_field_names),
   294				pix->bytesperline, pix->sizeimage,
   295				pix->colorspace, pix->flags, pix->ycbcr_enc,
   296				pix->quantization, pix->xfer_func);
   297			break;
   298		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
   299		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
   300			mp = &p->fmt.pix_mp;
   301			pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
 > 302				mp->width, mp->height, &mp->pixelformat,
   303				prt_names(mp->field, v4l2_field_names),
   304				mp->colorspace, mp->num_planes, mp->flags,
   305				mp->ycbcr_enc, mp->quantization, mp->xfer_func);
   306			planes = min_t(u32, mp->num_planes, VIDEO_MAX_PLANES);
   307			for (i = 0; i < planes; i++)
   308				printk(KERN_DEBUG "plane %u: bytesperline=%u sizeimage=%u\n", i,
   309						mp->plane_fmt[i].bytesperline,
   310						mp->plane_fmt[i].sizeimage);
   311			break;
   312		case V4L2_BUF_TYPE_VIDEO_OVERLAY:
   313		case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
   314			win = &p->fmt.win;
   315			/* Note: we can't print the clip list here since the clips
   316			 * pointer is a userspace pointer, not a kernelspace
   317			 * pointer. */
   318			pr_cont(", wxh=%dx%d, x,y=%d,%d, field=%s, chromakey=0x%08x, clipcount=%u, clips=%p, bitmap=%p, global_alpha=0x%02x\n",
   319				win->w.width, win->w.height, win->w.left, win->w.top,
   320				prt_names(win->field, v4l2_field_names),
   321				win->chromakey, win->clipcount, win->clips,
   322				win->bitmap, win->global_alpha);
   323			break;
   324		case V4L2_BUF_TYPE_VBI_CAPTURE:
   325		case V4L2_BUF_TYPE_VBI_OUTPUT:
   326			vbi = &p->fmt.vbi;
   327			pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%p4cc, start=%u,%u, count=%u,%u\n",
   328				vbi->sampling_rate, vbi->offset,
   329				vbi->samples_per_line, &vbi->sample_format,
   330				vbi->start[0], vbi->start[1],
   331				vbi->count[0], vbi->count[1]);
   332			break;
   333		case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
   334		case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
   335			sliced = &p->fmt.sliced;
   336			pr_cont(", service_set=0x%08x, io_size=%d\n",
   337					sliced->service_set, sliced->io_size);
   338			for (i = 0; i < 24; i++)
   339				printk(KERN_DEBUG "line[%02u]=0x%04x, 0x%04x\n", i,
   340					sliced->service_lines[0][i],
   341					sliced->service_lines[1][i]);
   342			break;
   343		case V4L2_BUF_TYPE_SDR_CAPTURE:
   344		case V4L2_BUF_TYPE_SDR_OUTPUT:
   345			sdr = &p->fmt.sdr;
 > 346			pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
   347			break;
   348		case V4L2_BUF_TYPE_META_CAPTURE:
   349		case V4L2_BUF_TYPE_META_OUTPUT:
   350			meta = &p->fmt.meta;
   351			pr_cont(", dataformat=%p4cc, buffersize=%u\n",
 > 352				&meta->dataformat, meta->buffersize);
   353			break;
   354		}
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
