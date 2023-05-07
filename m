Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B323A2;
	Sun,  7 May 2023 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683449735; x=1714985735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huy3zZkWJcDbBVwoWHYFMkw6U4Y5XXOC7LJDEge4Ng8=;
  b=MHDyjro4p06edd9bGiq7t9Td6zVa94iCiffzZ7DdyoCcL5fVGJnhRPtP
   YkL0oOVBLjznLjE1ElDq58se+cvgfw4WZO8JPO3pepfkHo3u8cSiVgYnx
   GfAAvVU7BgRrAKdolijIsW9eSbpSEjAdB5AH1FmKofbMJUrChvuqbL0dN
   zHyHQHUTP0Rb/7U5beUNYuRW8m89IM+vg6VgYKUpIDz6tX7GOuRHpBjvo
   mXM/aGafQ061rK4KXn4CW+2VUsFl9V/2j9V+o8En4e6C/roahrz+UzVov
   scVzqaADSdJsWC1JsXOtAcfgnS5/I0HEGtRDhLUvJ9Sgmm+vf1Hh/s7ON
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338683193"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338683193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 01:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="701073753"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="701073753"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 May 2023 01:55:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvaB0-0000hb-0e;
	Sun, 07 May 2023 08:55:30 +0000
Date: Sun, 7 May 2023 16:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:20230506-fs-freeze 1/6] fs/gfs2/sys.c:167:24: error:
 use of undeclared identifier 'sb'
Message-ID: <202305071647.BFgTuMOH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20230506-fs-freeze
head:   f89cf429edea2c04c26d2bd2bf2f16268ba2b181
commit: 61958780e6d30f6e846f14a5cf2c29250310520a [1/6] fs: unify locking semantics for fs freeze / thaw
config: arm-randconfig-r003-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071647.BFgTuMOH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=61958780e6d30f6e846f14a5cf2c29250310520a
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20230506-fs-freeze
        git checkout 61958780e6d30f6e846f14a5cf2c29250310520a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071647.BFgTuMOH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/gfs2/sys.c:167:24: error: use of undeclared identifier 'sb'
           if (!get_active_super(sb->s_bdev))
                                 ^
   fs/gfs2/sys.c:178:27: error: use of undeclared identifier 'sb'
                   deactivate_locked_super(sb);
                                           ^
   fs/gfs2/sys.c:182:26: error: use of undeclared identifier 'sb'
           deactivate_locked_super(sb);
                                   ^
   3 errors generated.
--
>> fs/gfs2/util.c:348:25: error: use of undeclared identifier 'sb'
                   if (!get_active_super(sb->s_bdev)) {
                                         ^
   fs/gfs2/util.c:356:27: error: use of undeclared identifier 'sb'
                   deactivate_locked_super(sb);
                                           ^
   2 errors generated.


vim +/sb +167 fs/gfs2/sys.c

   155	
   156	static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
   157	{
   158		int error, n;
   159	
   160		error = kstrtoint(buf, 0, &n);
   161		if (error)
   162			return error;
   163	
   164		if (!capable(CAP_SYS_ADMIN))
   165			return -EPERM;
   166	
 > 167		if (!get_active_super(sb->s_bdev))
   168			return -ENOTTY;
   169	
   170		switch (n) {
   171		case 0:
   172			error = thaw_super(sdp->sd_vfs);
   173			break;
   174		case 1:
   175			error = freeze_super(sdp->sd_vfs);
   176			break;
   177		default:
   178			deactivate_locked_super(sb);
   179			return -EINVAL;
   180		}
   181	
   182		deactivate_locked_super(sb);
   183	
   184		if (error) {
   185			fs_warn(sdp, "freeze %d error %d\n", n, error);
   186			return error;
   187		}
   188	
   189		return len;
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
