Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63570A35;
	Sun, 17 Dec 2023 00:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq1qoAxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702771389; x=1734307389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=noVK11556++OZRoQ3bQNTpyYlaexOvx7YhgppKjA6BA=;
  b=Fq1qoAxKWZgJ4MOab2OGXOZA6ikxmcVsxguRC4EcWeA0xA5wYemAmDIV
   AhAiRkpLCwsthgHH3BOtZ1jPqc0RalMyUCHnTTTAvYLQS7GYn+aqhhOg+
   0+SExqe2pvZRmsWDqSdW719kjtuLkoNdXuv0tJvLleiYP37Ip74Om9zmW
   7HsxHPFsoSyCOQecD+17zG/wsjcXShPDkMMTO0C0FtX9QxfErf+TWClyd
   nYwjyZFruqTI+FaMC/MiC4hl9og3ld/n9Krs3aKcOBTL7CiiePEIQTwLo
   MAt60a9sowxLVP3XyT1LNt/LJxpNJpkGAlIk2VNGerMAEfcKwvjvzjCw6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="394267721"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="394267721"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 16:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845521514"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845521514"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 16:03:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEecZ-0002N9-0i;
	Sun, 17 Dec 2023 00:03:03 +0000
Date: Sun, 17 Dec 2023 08:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 29/61] drivers/tty/vt/vt.c:1146: warning: Function
 parameter or member 'from_user' not described in 'vc_do_resize'
Message-ID: <202312170828.HHZkPaC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   29f593717f831f4fe1c36efd2d1b0404f705bc0f
commit: 8126d6fb3ad1e84bc3760668cf99da7919d841a4 [29/61] vt: pass vc_resize_user as a parameter
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170828.HHZkPaC1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170828.HHZkPaC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170828.HHZkPaC1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/vt/vt.c:1146: warning: Function parameter or member 'from_user' not described in 'vc_do_resize'


vim +1146 drivers/tty/vt/vt.c

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1128  
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1129  /**
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1130   *	vc_do_resize	-	resizing method for the tty
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1131   *	@tty: tty being resized
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1132   *	@vc: virtual console private data
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1133   *	@cols: columns
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1134   *	@lines: lines
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1135   *
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1136   *	Resize a virtual console, clipping according to the actual constraints.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1137   *	If the caller passes a tty structure then update the termios winsize
3ad2f3fbb96142 drivers/char/vt.c   Daniel Mack                   2010-02-03  1138   *	information and perform any necessary signal handling.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1139   *
6a1c0680cf3ba9 drivers/tty/vt/vt.c Peter Hurley                  2013-06-15  1140   *	Caller must hold the console semaphore. Takes the termios rwsem and
64d608db38ffc0 drivers/tty/vt/vt.c Jiri Slaby                    2021-05-05  1141   *	ctrl.lock of the tty IFF a tty is passed.
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1142   */
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1143  
fc6f6238226e6d drivers/char/vt.c   Alan Cox                      2009-01-02  1144  static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
8126d6fb3ad1e8 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-12-13  1145) 			unsigned int cols, unsigned int lines, bool from_user)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16 @1146  {
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1147  	unsigned long old_origin, new_origin, new_scr_end, rlth, rrem, err = 0;
9e0ba741aabdf1 drivers/char/vt.c   qiaochong                     2010-08-09  1148  	unsigned long end;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1149  	unsigned int old_rows, old_row_size, first_copied_row;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1150  	unsigned int new_cols, new_rows, new_row_size, new_screen_size;
f8d1653daec023 drivers/tty/vt/vt.c Tetsuo Handa                  2020-07-29  1151  	unsigned short *oldscreen, *newscreen;
feb36abbedea26 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-01-12  1152) 	u32 **new_uniscr = NULL;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1153  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1154  	WARN_CONSOLE_UNLOCKED();
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1155  
ce684552a266cb drivers/tty/vt/vt.c Tetsuo Handa                  2020-07-12  1156  	if (cols > VC_MAXCOL || lines > VC_MAXROW)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1157  		return -EINVAL;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1158  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1159  	new_cols = (cols ? cols : vc->vc_cols);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1160  	new_rows = (lines ? lines : vc->vc_rows);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1161  	new_row_size = new_cols << 1;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1162  	new_screen_size = new_row_size * new_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1163  
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1164  	if (new_cols == vc->vc_cols && new_rows == vc->vc_rows) {
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1165  		/*
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1166  		 * This function is being called here to cover the case
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1167  		 * where the userspace calls the FBIOPUT_VSCREENINFO twice,
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1168  		 * passing the same fb_var_screeninfo containing the fields
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1169  		 * yres/xres equal to a number non-multiple of vc_font.height
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1170  		 * and yres_virtual/xres_virtual equal to number lesser than the
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1171  		 * vc_font.height and yres/xres.
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1172  		 * In the second call, the struct fb_var_screeninfo isn't
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1173  		 * being modified by the underlying driver because of the
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1174  		 * if above, and this causes the fbcon_display->vrows to become
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1175  		 * negative and it eventually leads to out-of-bound
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1176  		 * access by the imageblit function.
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1177  		 * To give the correct values to the struct and to not have
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1178  		 * to deal with possible errors from the code below, we call
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1179  		 * the resize_screen here as well.
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1180  		 */
8126d6fb3ad1e8 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-12-13  1181) 		return resize_screen(vc, new_cols, new_rows, from_user);
3b0c406124719b drivers/tty/vt/vt.c Igor Matheus Andrade Torrente 2021-06-28  1182  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1183  
ce684552a266cb drivers/tty/vt/vt.c Tetsuo Handa                  2020-07-12  1184  	if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
32b2921e6a7461 drivers/tty/vt/vt.c Dmitry Vyukov                 2016-10-14  1185  		return -EINVAL;
21eff69aaaa0e7 drivers/tty/vt/vt.c Alexander Potapenko           2018-06-14  1186  	newscreen = kzalloc(new_screen_size, GFP_USER);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1187  	if (!newscreen)
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1188  		return -ENOMEM;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1189  
feb36abbedea26 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-01-12  1190) 	if (vc->vc_uni_lines) {
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1191  		new_uniscr = vc_uniscr_alloc(new_cols, new_rows);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1192  		if (!new_uniscr) {
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1193  			kfree(newscreen);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1194  			return -ENOMEM;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1195  		}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1196  	}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1197  
dce05aa6eec977 drivers/tty/vt/vt.c Jiri Slaby                    2020-02-19  1198  	if (vc_is_sel(vc))
009e39ae44f419 drivers/tty/vt/vt.c Scot Doyle                    2016-10-13  1199  		clear_selection();
009e39ae44f419 drivers/tty/vt/vt.c Scot Doyle                    2016-10-13  1200  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1201  	old_rows = vc->vc_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1202  	old_row_size = vc->vc_size_row;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1203  
8126d6fb3ad1e8 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-12-13  1204) 	err = resize_screen(vc, new_cols, new_rows, from_user);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1205  	if (err) {
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1206  		kfree(newscreen);
57d38f26d81e42 drivers/tty/vt/vt.c Nicolas Pitre                 2020-05-02  1207  		vc_uniscr_free(new_uniscr);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1208  		return err;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1209  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1210  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1211  	vc->vc_rows = new_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1212  	vc->vc_cols = new_cols;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1213  	vc->vc_size_row = new_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1214  	vc->vc_screenbuf_size = new_screen_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1215  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1216  	rlth = min(old_row_size, new_row_size);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1217  	rrem = new_row_size - rlth;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1218  	old_origin = vc->vc_origin;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1219  	new_origin = (long) newscreen;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1220  	new_scr_end = new_origin + new_screen_size;
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1221  
28bc24fc46f9c9 drivers/tty/vt/vt.c Jiri Slaby                    2020-06-15  1222  	if (vc->state.y > new_rows) {
28bc24fc46f9c9 drivers/tty/vt/vt.c Jiri Slaby                    2020-06-15  1223  		if (old_rows - vc->state.y < new_rows) {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1224  			/*
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1225  			 * Cursor near the bottom, copy contents from the
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1226  			 * bottom of buffer
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1227  			 */
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1228  			first_copied_row = (old_rows - new_rows);
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1229  		} else {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1230  			/*
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1231  			 * Cursor is in no man's land, copy 1/2 screenful
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1232  			 * from the top and bottom of cursor position
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1233  			 */
28bc24fc46f9c9 drivers/tty/vt/vt.c Jiri Slaby                    2020-06-15  1234  			first_copied_row = (vc->state.y - new_rows/2);
9fc2b2d0cf7430 drivers/char/vt.c   Francisco Jerez               2010-08-22  1235  		}
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1236  		old_origin += first_copied_row * old_row_size;
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1237  	} else
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1238  		first_copied_row = 0;
9fc2b2d0cf7430 drivers/char/vt.c   Francisco Jerez               2010-08-22  1239  	end = old_origin + old_row_size * min(old_rows, new_rows);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1240  
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1241  	vc_uniscr_copy_area(new_uniscr, new_cols, new_rows,
feb36abbedea26 drivers/tty/vt/vt.c Jiri Slaby (SUSE              2023-01-12  1242) 			    vc->vc_uni_lines, rlth/2, first_copied_row,
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1243  			    min(old_rows, new_rows));
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1244  	vc_uniscr_set(vc, new_uniscr);
d8ae7242718738 drivers/tty/vt/vt.c Nicolas Pitre                 2018-06-26  1245  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1246  	update_attr(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1247  
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1248  	while (old_origin < end) {
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1249  		scr_memcpyw((unsigned short *) new_origin,
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1250  			    (unsigned short *) old_origin, rlth);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1251  		if (rrem)
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1252  			scr_memsetw((void *)(new_origin + rlth),
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1253  				    vc->vc_video_erase_char, rrem);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1254  		old_origin += old_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1255  		new_origin += new_row_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1256  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1257  	if (new_scr_end > new_origin)
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1258  		scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
3b41dc1a3c7839 drivers/char/vt.c   Antonino A. Daplas            2005-09-09  1259  			    new_scr_end - new_origin);
f8d1653daec023 drivers/tty/vt/vt.c Tetsuo Handa                  2020-07-29  1260  	oldscreen = vc->vc_screenbuf;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1261  	vc->vc_screenbuf = newscreen;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1262  	vc->vc_screenbuf_size = new_screen_size;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1263  	set_origin(vc);
f8d1653daec023 drivers/tty/vt/vt.c Tetsuo Handa                  2020-07-29  1264  	kfree(oldscreen);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1265  
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1266  	/* do part of a reset_terminal() */
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1267  	vc->vc_top = 0;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1268  	vc->vc_bottom = vc->vc_rows;
28bc24fc46f9c9 drivers/tty/vt/vt.c Jiri Slaby                    2020-06-15  1269  	gotoxy(vc, vc->state.x, vc->state.y);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1270  	save_cur(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1271  
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1272  	if (tty) {
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1273  		/* Rewrite the requested winsize data with the actual
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1274  		   resulting sizes */
8c9a9dd0fa3a26 drivers/char/vt.c   Alan Cox                      2008-08-15  1275  		struct winsize ws;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1276  		memset(&ws, 0, sizeof(ws));
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1277  		ws.ws_row = vc->vc_rows;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1278  		ws.ws_col = vc->vc_cols;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1279  		ws.ws_ypixel = vc->vc_scan_lines;
fc6f6238226e6d drivers/char/vt.c   Alan Cox                      2009-01-02  1280  		tty_do_resize(tty, &ws);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1281  	}
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1282  
6ca8dfd78187d8 drivers/tty/vt/vt.c Jiri Slaby                    2016-06-23  1283  	if (con_is_visible(vc))
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1284  		update_screen(vc);
8b92e87d39bfd0 drivers/char/vt.c   Alan Cox                      2009-09-19  1285  	vt_event_post(VT_EVENT_RESIZE, vc->vc_num, vc->vc_num);
0c9b1965faddad drivers/tty/vt/vt.c Nicolas Pitre                 2019-01-08  1286  	notify_update(vc);
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1287  	return err;
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1288  }
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds                2005-04-16  1289  

:::::: The code at line 1146 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
