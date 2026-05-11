Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372C37B007;
	Mon, 11 May 2026 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537240; cv=none; b=sK5Xg9UvRLwWmwki7G8zUaO2I2yh54rAtegtxqiofoNy4EDWhY/gpdTzWYcIq5h5SBWeOLwJ3HE16u3mboYT+W5Nn90z0vldwKJ++Dt35Y7XudkC/JxaA8ITW5aTtIcuESiZmi+O7bfT5H61EdTONDn0QLfocNU748WVV1JXGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537240; c=relaxed/simple;
	bh=D3RwVKpECpvnz3VOWtx1i2zjFI+IwNR1FXYg0zDWHCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZODP1GQf3sfEG6CRyA+M/XiyCmaP/fo0svXvi/JPEcYqyYj2t87qWxqrBx4UGFUk5Bfay8Nvo3Jb8hy7yYKBt6uYS0LYD7AauCHSEIzRQYZFLelYNApNxk6EkcDU+SPwrVdzF9Md/PF7xYB0Ok8Bqc7XxPR7doTDIOqIEKiCO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXDEr9sn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXDEr9sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778537239; x=1810073239;
  h=date:from:to:cc:subject:message-id;
  bh=D3RwVKpECpvnz3VOWtx1i2zjFI+IwNR1FXYg0zDWHCo=;
  b=iXDEr9snV6ptoUqmxsh1SYYgcOV0B7e5XYOqZ2ISGRZLJG+QTp+gigOJ
   mJ4lx3A6A6c9Xz7VxSRihzUWSde7tbst8kzJsNXdYi70qwkkQrdS01yZr
   4IQ4nJ4hZj8UJ6CFr9moDdxS6rJAtLrS11VKiGThCtEmrN+1q5Hq+AYVv
   lRyP9UFI4k10Mj0xZxgG8ZjfaOWbJDalZ3zx2ND+i6SwTzcRY4OgvjzXD
   pMvlMcalKFuXmc25tbE3pZ8UgSTg82SL7/7bEKN370gh+EMMN2GplRK0m
   bFETP6d1IJ2bydNZmhdf+acju2lDHpIOlZp2099ae0vzO8PNvHQizkA2y
   g==;
X-CSE-ConnectionGUID: kVLAYYi7RzqC3FfBqZCyTw==
X-CSE-MsgGUID: U3EZ3x5HSb2HpdOQYtCaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90902325"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90902325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 15:07:19 -0700
X-CSE-ConnectionGUID: +/u3seXtRHW4UG4zrV8Ahw==
X-CSE-MsgGUID: KhTmvmQ4S4iKq4HAlJGWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242544606"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 15:07:17 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMYmQ-000000001DN-2GP2;
	Mon, 11 May 2026 22:07:14 +0000
Date: Tue, 12 May 2026 06:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-exfat:iomap-work 8/9] fs/exfat/file.c:303:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is true
Message-ID: <202605120615.e3bxdRhJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git iomap-work
head:   6bbe9d8bf6e38726b6d4421a7b144186d8e10a9f
commit: c5b2f44ae0af3036dffc5f3252cd807e42ac8d2b [8/9] exfat: add iomap direct I/O support
config: hexagon-randconfig-002-20260512 (https://download.01.org/0day-ci/archive/20260512/202605120615.e3bxdRhJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120615.e3bxdRhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120615.e3bxdRhJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/exfat/file.c:303:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     303 |         if (ei->start_clu == 0) {
         |             ^~~~~~~~~~~~~~~~~~
   fs/exfat/file.c:319:9: note: uninitialized use occurs here
     319 |         return err;
         |                ^~~
   fs/exfat/file.c:303:2: note: remove the 'if' if its condition is always false
     303 |         if (ei->start_clu == 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
     304 |                 /*
         |                 ~~
     305 |                  * Empty start_clu != ~0 (not allocated)
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     306 |                  */
         |                  ~~
     307 |                 exfat_fs_error(sb, "tried to truncate zeroed cluster.");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     308 |                 goto write_size;
         |                 ~~~~~~~~~~~~~~~~
     309 |         }
         |         ~
   fs/exfat/file.c:300:9: note: initialize the variable 'err' to silence this warning
     300 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +303 fs/exfat/file.c

98d917047e8b7f Namjae Jeon           2020-03-02  294  
c5b2f44ae0af30 Namjae Jeon           2026-05-07  295  static int exfat_truncate(struct inode *inode)
98d917047e8b7f Namjae Jeon           2020-03-02  296  {
98d917047e8b7f Namjae Jeon           2020-03-02  297  	struct super_block *sb = inode->i_sb;
98d917047e8b7f Namjae Jeon           2020-03-02  298  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
7dee6f57d7f22a Christophe Vu-Brugier 2021-11-02  299  	struct exfat_inode_info *ei = EXFAT_I(inode);
98d917047e8b7f Namjae Jeon           2020-03-02  300  	int err;
98d917047e8b7f Namjae Jeon           2020-03-02  301  
98d917047e8b7f Namjae Jeon           2020-03-02  302  	mutex_lock(&sbi->s_lock);
7dee6f57d7f22a Christophe Vu-Brugier 2021-11-02 @303  	if (ei->start_clu == 0) {
98d917047e8b7f Namjae Jeon           2020-03-02  304  		/*
98d917047e8b7f Namjae Jeon           2020-03-02  305  		 * Empty start_clu != ~0 (not allocated)
98d917047e8b7f Namjae Jeon           2020-03-02  306  		 */
98d917047e8b7f Namjae Jeon           2020-03-02  307  		exfat_fs_error(sb, "tried to truncate zeroed cluster.");
98d917047e8b7f Namjae Jeon           2020-03-02  308  		goto write_size;
98d917047e8b7f Namjae Jeon           2020-03-02  309  	}
98d917047e8b7f Namjae Jeon           2020-03-02  310  
f7cde96710a436 Yuezhang Mo           2022-03-28  311  	err = __exfat_truncate(inode);
98d917047e8b7f Namjae Jeon           2020-03-02  312  	if (err)
98d917047e8b7f Namjae Jeon           2020-03-02  313  		goto write_size;
98d917047e8b7f Namjae Jeon           2020-03-02  314  
39c1ce8eafc0ff Yuezhang Mo           2023-01-04  315  	inode->i_blocks = round_up(i_size_read(inode), sbi->cluster_size) >> 9;
98d917047e8b7f Namjae Jeon           2020-03-02  316  write_size:
98d917047e8b7f Namjae Jeon           2020-03-02  317  	mutex_unlock(&sbi->s_lock);
c5b2f44ae0af30 Namjae Jeon           2026-05-07  318  
c5b2f44ae0af30 Namjae Jeon           2026-05-07  319  	return err;
98d917047e8b7f Namjae Jeon           2020-03-02  320  }
98d917047e8b7f Namjae Jeon           2020-03-02  321  

:::::: The code at line 303 was first introduced by commit
:::::: 7dee6f57d7f22a89dd214518c778aec448270d4c exfat: reuse exfat_inode_info variable instead of calling EXFAT_I()

:::::: TO: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
