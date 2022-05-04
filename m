Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865512583
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651678930; x=1683214930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NO8tAeiPK3K0Hr9frV1lRTE+HO29ZdSEd0GGtR88tZE=;
  b=AFbxwLstIHFtDNLfMLnZ1zE/wITHFoDVIpRtq0se13lX17SeFX+keCvB
   quE2+a8UR3xMDlgcsEbuL9K6vt+3Wg9eqnmVlHfbdpmxNdtTyV7bFO61Z
   Cn1CqmWZQRtuQmvhHL1NVrulmP6E/+cGlvrAPZ2QQ8rJnMiuvaaAMpQ8T
   fKjRVv1vIn8H+FpJZ26HI/pU5B16DM6gDUPvPkQ6rYmTCnL5OCEhZdYVJ
   WN4Yi8VMK7GJHuvmz8vgEMbxQZ2tLhPiQYOVbDnuXbiAXcHJCx5nRxpig
   dn34qw7TlCPDl/BR/dncxe8SYa1RlQ6eUrxKxZCSsE3PhX8xD1vU4Ngzj
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267956395"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="267956395"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 08:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="653770696"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2022 08:42:08 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmH8i-000BVj-0h;
	Wed, 04 May 2022 15:42:08 +0000
Date: Wed, 4 May 2022 23:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jirislaby:devel 53/73] drivers/video/console/vgacon.c:370:4: error:
 incompatible pointer types assigning to 'struct uni_pagedir *' from 'struct
 uni_pagedict *'
Message-ID: <202205042336.F5kLAB1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   fab642eca5e0ca41e656c8a0685cadf975b7ff88
commit: 9aaf33513f7cd36e3ac26196731192e7d7d92a99 [53/73] vt: rename and document struct uni_pagedir
config: hexagon-randconfig-r045-20220501 (https://download.01.org/0day-ci/archive/20220504/202205042336.F5kLAB1t-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=9aaf33513f7cd36e3ac26196731192e7d7d92a99
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 9aaf33513f7cd36e3ac26196731192e7d7d92a99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/video/console/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/video/console/vgacon.c:370:4: error: incompatible pointer types assigning to 'struct uni_pagedir *' from 'struct uni_pagedict *' [-Werror,-Wincompatible-pointer-types]
           p = *c->vc_uni_pagedir_loc;
             ^ ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/console/vgacon.c:371:28: warning: comparison of distinct pointer types ('struct uni_pagedict **' and 'struct uni_pagedir **') [-Wcompare-distinct-pointer-types]
           if (c->vc_uni_pagedir_loc != &vgacon_uni_pagedir) {
               ~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
>> drivers/video/console/vgacon.c:373:25: error: incompatible pointer types assigning to 'struct uni_pagedict **' from 'struct uni_pagedir **' [-Werror,-Wincompatible-pointer-types]
                   c->vc_uni_pagedir_loc = &vgacon_uni_pagedir;
                                         ^ ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +370 drivers/video/console/vgacon.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  342  
^1da177e4c3f41 Linus Torvalds     2005-04-16  343  static void vgacon_init(struct vc_data *c, int init)
^1da177e4c3f41 Linus Torvalds     2005-04-16  344  {
e4bdab70dd07d8 Takashi Iwai       2014-05-13  345  	struct uni_pagedir *p;
^1da177e4c3f41 Linus Torvalds     2005-04-16  346  
50ec42edd9784f Antonino A. Daplas 2006-06-26  347  	/*
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  348  	 * We cannot be loaded as a module, therefore init will be 1
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  349  	 * if we are the default console, however if we are a fallback
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  350  	 * console, for example if fbcon has failed registration, then
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  351  	 * init will be 0, so we need to make sure our boot parameters
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  352  	 * have been copied to the console structure for vgacon_resize
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  353  	 * ultimately called by vc_resize.  Any subsequent calls to
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  354  	 * vgacon_init init will have init set to 0 too.
50ec42edd9784f Antonino A. Daplas 2006-06-26  355  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  356  	c->vc_can_do_color = vga_can_do_color;
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  357  	c->vc_scan_lines = vga_scan_lines;
3dfac26e2ef29f Maciej W. Rozycki  2021-10-26  358  	c->vc_font.height = c->vc_cell_height = vga_video_font_height;
50ec42edd9784f Antonino A. Daplas 2006-06-26  359  
50ec42edd9784f Antonino A. Daplas 2006-06-26  360  	/* set dimensions manually if init != 0 since vc_resize() will fail */
50ec42edd9784f Antonino A. Daplas 2006-06-26  361  	if (init) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  362  		c->vc_cols = vga_video_num_columns;
^1da177e4c3f41 Linus Torvalds     2005-04-16  363  		c->vc_rows = vga_video_num_lines;
50ec42edd9784f Antonino A. Daplas 2006-06-26  364  	} else
50ec42edd9784f Antonino A. Daplas 2006-06-26  365  		vc_resize(c, vga_video_num_columns, vga_video_num_lines);
50ec42edd9784f Antonino A. Daplas 2006-06-26  366  
^1da177e4c3f41 Linus Torvalds     2005-04-16  367  	c->vc_complement_mask = 0x7700;
a40920b42ae232 Bill Nottingham    2005-05-01  368  	if (vga_512_chars)
a40920b42ae232 Bill Nottingham    2005-05-01  369  		c->vc_hi_font_mask = 0x0800;
^1da177e4c3f41 Linus Torvalds     2005-04-16 @370  	p = *c->vc_uni_pagedir_loc;
0f2893f0d1acff Takashi Iwai       2014-05-13 @371  	if (c->vc_uni_pagedir_loc != &vgacon_uni_pagedir) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  372  		con_free_unimap(c);
0f2893f0d1acff Takashi Iwai       2014-05-13 @373  		c->vc_uni_pagedir_loc = &vgacon_uni_pagedir;
0f2893f0d1acff Takashi Iwai       2014-05-13  374  		vgacon_refcount++;
0f2893f0d1acff Takashi Iwai       2014-05-13  375  	}
0f2893f0d1acff Takashi Iwai       2014-05-13  376  	if (!vgacon_uni_pagedir && p)
^1da177e4c3f41 Linus Torvalds     2005-04-16  377  		con_set_default_unimap(c);
f6c06b6807ff92 Matthew Garrett    2009-11-13  378  
b434a680a29424 Matthew Garrett    2009-11-13  379  	/* Only set the default if the user didn't deliberately override it */
b434a680a29424 Matthew Garrett    2009-11-13  380  	if (global_cursor_default == -1)
b434a680a29424 Matthew Garrett    2009-11-13  381  		global_cursor_default =
b434a680a29424 Matthew Garrett    2009-11-13  382  			!(screen_info.flags & VIDEO_FLAGS_NOCURSOR);
^1da177e4c3f41 Linus Torvalds     2005-04-16  383  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  384  

:::::: The code at line 370 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
