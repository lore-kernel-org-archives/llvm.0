Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924FF623;
	Sat, 18 Feb 2023 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676686067; x=1708222067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJAHrXAWrfL2lvxNdKWgwnv47B8c9wg7eap7KWQCYtQ=;
  b=WJRWAKWJ32aMjh/NxjwmUiqGIa6I9JPFhodflVXsQNLf5hEfAIIEAWzt
   evLtVv7d20wvvHpDaMzBDoEqbvq2xZGkyDDFuHXd+0MQG5HZgVWq2msQs
   K18dxxL7gn1j43+BS2FxBD/o/qjxV+BzlrXSiVa4tEGYTbeF0veW4c15x
   MG1Zw5jntsPkNsvRakT7DUp9VVsQ5sDfOL+hyTji04MbpDEAXCgy6O++t
   JuTngjvsqEXFOrXhKOaB61+1GWKi5KOUkdoJR9BQlIv61tdcRXlWwD1s2
   HeesbKWYzCF0LRXwoSUMZTCbhtHD94D39Muo+X9bW8ISkaLhp7qRpxghd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311763200"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="311763200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 18:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813551667"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="813551667"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 18:07:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTCda-000C0L-15;
	Sat, 18 Feb 2023 02:07:42 +0000
Date: Sat, 18 Feb 2023 10:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c:648:5:
 warning: stack frame size (1072) exceeds limit (1024) in
 'saa7146_enable_overlay'
Message-ID: <202302180911.6Dde6M71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dbeed98d89ea91ae68ff6dce6060671726292e85
commit: e33fdb5a02490059e2f48ced2c038c8a46c6476d media: saa7146: deprecate hexium_gemini/orion, mxb and ttpci
date:   6 months ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180911.6Dde6M71-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33fdb5a02490059e2f48ced2c038c8a46c6476d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e33fdb5a02490059e2f48ced2c038c8a46c6476d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/staging/media/deprecated/saa7146/common/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180911.6Dde6M71-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c:648:5: warning: stack frame size (1072) exceeds limit (1024) in 'saa7146_enable_overlay' [-Wframe-larger-than]
   int saa7146_enable_overlay(struct saa7146_fh *fh)
       ^
   257/1072 (23.97%) spills, 815/1072 (76.03%) variables
   1 warning generated.


vim +/saa7146_enable_overlay +648 drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c

^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  647  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16 @648  int saa7146_enable_overlay(struct saa7146_fh *fh)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  649  {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  650  	struct saa7146_dev *dev = fh->dev;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  651  	struct saa7146_vv *vv = dev->vv_data;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  652  
5da545ad08a3c6 drivers/media/common/saa7146_hlp.c Hans Verkuil   2012-05-01  653  	saa7146_set_window(dev, vv->ov.win.w.width, vv->ov.win.w.height, vv->ov.win.field);
5da545ad08a3c6 drivers/media/common/saa7146_hlp.c Hans Verkuil   2012-05-01  654  	saa7146_set_position(dev, vv->ov.win.w.left, vv->ov.win.w.top, vv->ov.win.w.height, vv->ov.win.field, vv->ov_fmt->pixelformat);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  655  	saa7146_set_output_format(dev, vv->ov_fmt->trans);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  656  	saa7146_set_clipping_rect(fh);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  657  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  658  	/* enable video dma1 */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  659  	saa7146_write(dev, MC1, (MASK_06 | MASK_22));
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  660  	return 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  661  }
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  662  

:::::: The code at line 648 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
