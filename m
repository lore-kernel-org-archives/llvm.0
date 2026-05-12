Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5443B27FB3A;
	Tue, 12 May 2026 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552725; cv=none; b=B1mQeNy43szyQobxFgYyb76p7ZaPLFWnoVvepsjAWkx9US8LNDYsrRxf18pl6AFbZ4p6DZeSD/qQYV9uw3VA3O0YBrF0/ogH34Z6mFKRwzpMG+ZnRB9sKKVrxngYPDrNlT5pBxppp6osrJz9UZnGOmTEs7aMu+1snFvlPeJtkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552725; c=relaxed/simple;
	bh=KtZ3CSfxYzJMO0aFbpNWPQ3J9oGXYmqI1pmCbA0io4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=STvQnTa+sz7P/8lCoXQZNjmd5iytUM6prAwn4Z4zo86h24F1OJvyQun9Dr7HxkbAqDBYfm0mwkqHf9j9DPiL45gX0c69fFUiX+TDuqN9S4wcbDDgnC/VkGVGvZW4H9iJJQbm/FauTZopXh5D4v3z1FCT/pJw1cn8hLdCzvyjBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj75eu2L; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj75eu2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778552724; x=1810088724;
  h=date:from:to:cc:subject:message-id;
  bh=KtZ3CSfxYzJMO0aFbpNWPQ3J9oGXYmqI1pmCbA0io4E=;
  b=Qj75eu2Lf6A3p6w4RjbUKBhjsgUvDUYhGTuRyyt1doXOZEoY+0VUnFzK
   5jBp26NJpFO5CxRu8yzYytU75dnSxsFxQJCiSntqmpef1xKmw27PfvQH2
   sWm28JdJQ/6ZmSFkDolVX02ZH7FPNhrJKmRmUIQkGedO9X0EjYgddqoP5
   tMXIO3TQyU/84KikP/PK69aVj/B7VUOqYW65IRHdLH0fF+MCGDEbXp/38
   tRAUVbST0EwNIJ+JeknvSIlHk9BpsLhAtqA78oqn3zrK5D2CbvMwKmeii
   IYWMzBURMfpEQM84cNfeqUqYfCDpdStRXyiII75QUW7FAdIj1jEJQezp+
   w==;
X-CSE-ConnectionGUID: RJcyGQZeTNq+hPjmqUb1pA==
X-CSE-MsgGUID: S5VX6omjSXm/YCMR7mniJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79561524"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79561524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 19:25:23 -0700
X-CSE-ConnectionGUID: /7AInmzlQp2rtKS1aoKORw==
X-CSE-MsgGUID: woutQfx+Rv+tGM7fZE40pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241982052"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2026 19:25:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMco8-0000000088L-2rDe;
	Tue, 12 May 2026 02:25:16 +0000
Date: Tue, 12 May 2026 04:24:46 +0200
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-exfat:iomap-work 8/9] fs/exfat/file.c:303:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is true
Message-ID: <202605120425.jIp6e2MN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git iomap-work
head:   6bbe9d8bf6e38726b6d4421a7b144186d8e10a9f
commit: c5b2f44ae0af3036dffc5f3252cd807e42ac8d2b [8/9] exfat: add iomap direct I/O support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260512/202605120425.jIp6e2MN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120425.jIp6e2MN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120425.jIp6e2MN-lkp@intel.com/

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
