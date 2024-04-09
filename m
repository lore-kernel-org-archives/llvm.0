Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0007880024;
	Tue,  9 Apr 2024 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656264; cv=none; b=XJf28lJYYWuXfS5o+xtK6r7MmipgRYKvhLVxp867IHThDPTVAq32zYkD9prTAPJE9EeSXnBMFluvqiqwz9EUKwRmUBml//IuLMw56W6lT4ggXV9xM0VY/AAuEj4aIoMKJWmZ09yhAaAktuahYt23FwNJYuJat3SrmuCYiiwjE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656264; c=relaxed/simple;
	bh=mPi2Ti+THoKQ0SgFh6SViaTPKg8Myyzt399nKOtQ+Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1OrwShOTuLwlFqHgPdF42nh/b6yqbW3Wz1b5GczNTEBemp3y3xsLHX+9Qgtjb8yRjqM2T+rufyRC/ewfhKD8WCcspfqwCdm7rmljuWYp5M6gYaLLLkUKNFstHyiIuC36lN2hnaJ3g/hL0fSEmbBVxOp3b5FqvGqyN+/vOItnqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et1t/BRV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et1t/BRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712656262; x=1744192262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPi2Ti+THoKQ0SgFh6SViaTPKg8Myyzt399nKOtQ+Gg=;
  b=et1t/BRVpcQq3qvWnzJ72g/ewvZEn9vZPNuiPRldxfy0vyzikiSKsiE4
   dsaKZscuPQyXAqyewOKST43KErAh/ez4bDGK88/m3M7hmAuf4JrkNkrf9
   6ZK3ZwvKSlTqx1EF/I8ltZIv3ooYNOabzRKyhO/8U+SIldtxT3kUDfWlT
   hYKrWlMRUirT2/hGKHOSSDLvYWshquuIQ0Q7N9D9nVNPHaTMfDF5DYsW6
   h53Xd7iy74UEXcCX/C3sjgLsrY19B7ImZdpvYWTFax5RNNAqpvbUUebHC
   fqsx8oqfufMzwVunskf/VumwH4QIKvlp0q68UJk90XoqOrWCESyktkaVA
   Q==;
X-CSE-ConnectionGUID: ZjDWTuaQS/y9e1LfrvX3Bw==
X-CSE-MsgGUID: zyVdLeB7Rq+mMj1ICyNJZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33369540"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="33369540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 02:51:01 -0700
X-CSE-ConnectionGUID: 7xnDhBSNS1GKhe5R3mPLew==
X-CSE-MsgGUID: OfYYqCj0TA2iyCEbK52Maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20291750"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Apr 2024 02:51:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru881-0005yY-1y;
	Tue, 09 Apr 2024 09:50:57 +0000
Date: Tue, 9 Apr 2024 17:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 139/153]
 arch/x86/kernel/cpu/mce/dev-mcelog.c:212:26: error: use of undeclared
 identifier 'buf'
Message-ID: <202404091742.YOUmctL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8d5e62882d13747268ce489ec43048c8eff31b7a
commit: c8ccbf37b54e71a702df0941e3ca250ebdadf35f [139/153] arch/x86: convert to read/write iterators
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240409/202404091742.YOUmctL2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091742.YOUmctL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091742.YOUmctL2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/dev-mcelog.c:212:26: error: use of undeclared identifier 'buf'
     212 |                 err = __mce_read_apei(&buf, usize);
         |                                        ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:213:14: error: use of undeclared identifier 'buf'
     213 |                 if (err || buf != ubuf)
         |                            ^
>> arch/x86/kernel/cpu/mce/dev-mcelog.c:213:21: error: use of undeclared identifier 'ubuf'
     213 |                 if (err || buf != ubuf)
         |                                   ^
   3 errors generated.
--
>> arch/x86/kernel/cpu/mce/inject.c:385:3: error: use of undeclared identifier 'ppos'
     385 |         *ppos += cnt;
         |          ^
   1 error generated.


vim +/buf +212 arch/x86/kernel/cpu/mce/dev-mcelog.c

5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  201  
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  202  static ssize_t mce_chrdev_read(struct kiocb *iocb, struct iov_iter *to)
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  203  {
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  204  	size_t usize = iov_iter_count(to);
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  205  	ssize_t copied = 0;
7298f08ea8870d arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017-11-01  206  	unsigned next;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  207  	int i, err;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  208  
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  209  	mutex_lock(&mce_chrdev_read_mutex);
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  210  
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  211  	if (!mce_apei_read_done) {
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27 @212  		err = __mce_read_apei(&buf, usize);
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27 @213  		if (err || buf != ubuf)
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  214  			goto out;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  215  	}
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  216  
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  217  	/* Only supports full reads right now */
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  218  	err = -EINVAL;
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  219  	if (iocb->ki_pos != 0 || usize < mcelog->len * sizeof(struct mce))
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  220  		goto out;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  221  
d8ecca4043f2d9 arch/x86/kernel/cpu/mce/dev-mcelog.c    Tony Luck       2020-02-18  222  	next = mcelog->next;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  223  	err = 0;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  224  
7298f08ea8870d arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017-11-01  225  	for (i = 0; i < next; i++) {
d8ecca4043f2d9 arch/x86/kernel/cpu/mce/dev-mcelog.c    Tony Luck       2020-02-18  226  		struct mce *m = &mcelog->entry[i];
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  227  
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  228  		err |= !copy_to_iter_full(m, sizeof(*m), to);
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  229  		copied += sizeof(*m);
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  230  	}
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  231  
d8ecca4043f2d9 arch/x86/kernel/cpu/mce/dev-mcelog.c    Tony Luck       2020-02-18  232  	memset(mcelog->entry, 0, next * sizeof(struct mce));
d8ecca4043f2d9 arch/x86/kernel/cpu/mce/dev-mcelog.c    Tony Luck       2020-02-18  233  	mcelog->next = 0;
7298f08ea8870d arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017-11-01  234  
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  235  	if (err)
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  236  		err = -EFAULT;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  237  
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  238  out:
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  239  	mutex_unlock(&mce_chrdev_read_mutex);
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  240  
c8ccbf37b54e71 arch/x86/kernel/cpu/mce/dev-mcelog.c    Jens Axboe      2024-04-05  241  	return err ? err : copied;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  242  }
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017-03-27  243  

:::::: The code at line 212 was first introduced by commit
:::::: 5de97c9f6d85fd83af76e09e338b18e7adb1ae60 x86/mce: Factor out and deprecate the /dev/mcelog driver

:::::: TO: Tony Luck <tony.luck@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
