Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01BFA40;
	Tue, 28 Mar 2023 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679992438; x=1711528438;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ptUTHCuOrLUl6lv59C3Xi0Q2qVbBYvKGiplNyi6jQKA=;
  b=a4ORcbJiwPUqn6/TfcQmzI/dCdZe9TOm9/UzS1mqnvpcPcDQABWyl+Sv
   z47aGtOGfEqQ2QkUWXeha9jqS/SFFK2SAOUXtEEySED24Vu2HvRYO0X98
   /N8KDoxYu4ljV8xBMepl8bG8uHwdi4D7gC98YMKLeHX71boUPbwpqn4Gm
   yO2zMTQBWf+OwA3E5QifIpH0nwrsuTdzGo1CVWVNVvymirRFnL9Cv9h9t
   rMS1mwCdXNrTOPl7jOYjnr0HHr7mHKHqGMzE8Hd2jUS2pmS8e2gCVSA2O
   /0h8BWwzg/cXX1GaX5bJhFOPT3wDZPW/nqBpR3C4CgqHes7olz0Ufekj5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320906475"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="320906475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 01:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="633951279"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="633951279"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Mar 2023 01:33:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph4mC-000IOR-0o;
	Tue, 28 Mar 2023 08:33:56 +0000
Date: Tue, 28 Mar 2023 16:33:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 25/64]
 drivers/media/test-drivers/visl/visl-video.c:380:34: warning: taking address
 of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may
 result in an unaligned pointer value
Message-ID: <202303281617.np7VyX09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/media/test-drivers/visl/visl-video.c: 380:34: warning: taking address
 of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/media/test-drivers/visl/visl-video.c: 381:13: warning: taking address
 of packed member 'height' of class or structure 'v4l2_pix_format_mplane' may
 result in an unaligned pointer value [-Waddress-of-packed-member]

TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c7060e95007c2b896f4729104c381e0f0727c228
commit: e2fbae08263ef80e2972124ca04cdef1e51d3ac1 [25/64] BACKPORT: media: visl: add virtual stateless decoder driver
config: mips-randconfig-r014-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281617.np7VyX09-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout e2fbae08263ef80e2972124ca04cdef1e51d3ac1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/test-drivers/visl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281617.np7VyX09-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/visl/visl-video.c:380:34: warning: taking address of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
           v4l2_apply_frmsize_constraints(&pix_mp->width,
                                           ^~~~~~~~~~~~~
>> drivers/media/test-drivers/visl/visl-video.c:381:13: warning: taking address of packed member 'height' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &pix_mp->height,
                                           ^~~~~~~~~~~~~~
   drivers/media/test-drivers/visl/visl-video.c:404:34: warning: taking address of packed member 'width' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
           v4l2_apply_frmsize_constraints(&pix_mp->width,
                                           ^~~~~~~~~~~~~
   drivers/media/test-drivers/visl/visl-video.c:405:13: warning: taking address of packed member 'height' of class or structure 'v4l2_pix_format_mplane' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                          &pix_mp->height,
                                           ^~~~~~~~~~~~~~
   4 warnings generated.


vim +380 drivers/media/test-drivers/visl/visl-video.c

   361	
   362	static int visl_try_fmt_vid_cap(struct file *file, void *priv,
   363					struct v4l2_format *f)
   364	{
   365		struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
   366		struct visl_ctx *ctx = visl_file_to_ctx(file);
   367		const struct visl_coded_format_desc *coded_desc;
   368		unsigned int i;
   369	
   370		coded_desc = ctx->coded_format_desc;
   371	
   372		for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
   373			if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
   374				break;
   375		}
   376	
   377		if (i == coded_desc->num_decoded_fmts)
   378			pix_mp->pixelformat = coded_desc->decoded_fmts[0];
   379	
 > 380		v4l2_apply_frmsize_constraints(&pix_mp->width,
 > 381					       &pix_mp->height,
   382					       &coded_desc->frmsize);
   383	
   384		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
   385				    pix_mp->width, pix_mp->height);
   386	
   387		pix_mp->field = V4L2_FIELD_NONE;
   388	
   389		return 0;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
