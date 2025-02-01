Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5084A2F;
	Sat,  1 Feb 2025 04:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738383914; cv=none; b=h6013gTDboIRvF7vrAAe3MghBO9tyliJukzA8G3uw/Ah2qAZL6iRyCHIuzB/gnCd2jmndKfLdI9A/MSf6LkHxG5MrdVdd10WZMJ4z2IUQGLylSpzdt0o0TngN1yGTLnStd6KbPxQOVTtl+1C+2vvHeV33o5n4K6uXsmYgmxKKQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738383914; c=relaxed/simple;
	bh=/QaRJNyS/xtps2c+16CQW9CyTcFj7p+B0NJrKUNN59Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KS5Plvp924PKDDMI5WHnDSDc8D2EiZm+PF05Q4HTg9RblLZiXarh3RwY/e4OHQVt7V74qv1HUs3AyxGvqvIbfCg7xi23KurJt51UDSN0a3/ixBmiuCPGF3f1HtYV2/A7R5MqsE1HWAeOZHV/itegj2iCOPB1tHMN+f0S97tBTAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EThrELVd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EThrELVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738383912; x=1769919912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/QaRJNyS/xtps2c+16CQW9CyTcFj7p+B0NJrKUNN59Y=;
  b=EThrELVd2I68ROSQSz33jFAIT5trvzn36H46gz/x80v5JongBUu3DUoD
   wXKJPmq8uATdz/RG7A+pRxtb88K2LZz9WHv577CeUXlRYOu5fgj5UktH3
   LkIDtMw4XRjqtstXtuBRBP+K0ArC2xU/FkzxxwugVOzY6fMCbt3Q3dAql
   RUcP7Q6xCMOcnCCoYnvdj87E6sx2M38A2owJLkhssUkXBAV5NZYZemlB5
   Rb3dXCD/Y+zSa+K4aqTYog3qBhZsOjfnWHFXi/6/J+mmIo1RlVdDp66U7
   6MkKx2z+dvPQvoBLPD5spsVGWfoMRZNGog8rjQw/vuJB4Nnb5kXxNfjAR
   Q==;
X-CSE-ConnectionGUID: Byv+3ZAURBCVthzLIw+eJA==
X-CSE-MsgGUID: CP1X+d3bT3GzRAgHPvtoAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38860686"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="38860686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 20:25:12 -0800
X-CSE-ConnectionGUID: +mMQA7IuTl+NuJRCu32mLg==
X-CSE-MsgGUID: S9x0yOEDRm+taCIsRbdMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109639997"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2025 20:25:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te547-000nl9-3D;
	Sat, 01 Feb 2025 04:25:07 +0000
Date: Sat, 1 Feb 2025 12:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:fuse 2/3] fs/fuse/control.c:54:6: warning: variable 'value'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202502011249.NNx7K6U5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git fuse
head:   dab78745e20591bc228e71dcdea06da75da7bbf8
commit: 0eeb0bede371cbfe42ef9f2605da708ddd1b1ffd [2/3] fuse: don't set file->private_data in fuse_conn_waiting_read
config: x86_64-buildonly-randconfig-005-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011249.NNx7K6U5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011249.NNx7K6U5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011249.NNx7K6U5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/control.c:54:6: warning: variable 'value' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      54 |         if (!*ppos) {
         |             ^~~~~~
   fs/fuse/control.c:62:30: note: uninitialized use occurs here
      62 |         size = sprintf(tmp, "%d\n", value);
         |                                     ^~~~~
   fs/fuse/control.c:54:2: note: remove the 'if' if its condition is always true
      54 |         if (!*ppos) {
         |         ^~~~~~~~~~~
   fs/fuse/control.c:52:11: note: initialize the variable 'value' to silence this warning
      52 |         int value;
         |                  ^
         |                   = 0
   1 warning generated.


vim +54 fs/fuse/control.c

bafa96541b250a Miklos Szeredi 2006-06-25  46  
bafa96541b250a Miklos Szeredi 2006-06-25  47  static ssize_t fuse_conn_waiting_read(struct file *file, char __user *buf,
bafa96541b250a Miklos Szeredi 2006-06-25  48  				      size_t len, loff_t *ppos)
bafa96541b250a Miklos Szeredi 2006-06-25  49  {
bafa96541b250a Miklos Szeredi 2006-06-25  50  	char tmp[32];
bafa96541b250a Miklos Szeredi 2006-06-25  51  	size_t size;
0eeb0bede371cb Jeff Layton    2025-01-31  52  	int value;
bafa96541b250a Miklos Szeredi 2006-06-25  53  
bafa96541b250a Miklos Szeredi 2006-06-25 @54  	if (!*ppos) {
bafa96541b250a Miklos Szeredi 2006-06-25  55  		struct fuse_conn *fc = fuse_ctl_file_conn_get(file);
bafa96541b250a Miklos Szeredi 2006-06-25  56  		if (!fc)
bafa96541b250a Miklos Szeredi 2006-06-25  57  			return 0;
bafa96541b250a Miklos Szeredi 2006-06-25  58  
1729a16c2c92bb Miklos Szeredi 2008-11-26  59  		value = atomic_read(&fc->num_waiting);
bafa96541b250a Miklos Szeredi 2006-06-25  60  		fuse_conn_put(fc);
bafa96541b250a Miklos Szeredi 2006-06-25  61  	}
0eeb0bede371cb Jeff Layton    2025-01-31  62  	size = sprintf(tmp, "%d\n", value);
bafa96541b250a Miklos Szeredi 2006-06-25  63  	return simple_read_from_buffer(buf, len, ppos, tmp, size);
bafa96541b250a Miklos Szeredi 2006-06-25  64  }
bafa96541b250a Miklos Szeredi 2006-06-25  65  

:::::: The code at line 54 was first introduced by commit
:::::: bafa96541b250a7051e3fbc5de6e8369daf8ffec [PATCH] fuse: add control filesystem

:::::: TO: Miklos Szeredi <miklos@szeredi.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
