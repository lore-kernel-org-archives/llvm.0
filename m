Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487319479;
	Sat,  6 Apr 2024 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712381003; cv=none; b=JsnbcTpiZIJvQjRQpRVygkWGyZRXrwSWy9eYUq62XQ5EqQyjHBI63RF+B7a/0PJGVEmIDwuUu1gzHdSjulVo9XrwYiclQh4WTKex/f5z3kgucwW3EB78NRSirtjtBAXhkcBHOGgFRdGRxbvxD3SGz1wLU1MlR372+Qt3wkw5Z2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712381003; c=relaxed/simple;
	bh=8v/4QSKpqAd1heKyPdJqQ2hn+7yboOsb5N2b4rFkcNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/ke+YEQ5zc1sr3cVZWMWcSgGEqQp77ExpnQmiXaJaYwAHxAPFr5UhZBv8MTSHk7KNoKCgLbgKU8Vac/QHGzTKAbIr85LpOFA5Yv4jqeeHupm5Y6SgGIET1sGhEoy8mcWh0CVMPEoTzMLkyE/sjvGs9oLMVAhllGZdfeBsbrLCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej5D1WWH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej5D1WWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712381002; x=1743917002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8v/4QSKpqAd1heKyPdJqQ2hn+7yboOsb5N2b4rFkcNQ=;
  b=ej5D1WWH4DY29pL0mGLL9PEBOokIbM71NG/uu93h7Erp203tnQNxauz6
   +iiyp85UDuKOVJxexdFoUa93FWFEL2AtOhsVUA+A9G3+MvhfW18BN6YCH
   F0nZ3hCgSYM1IC/8AY88MsWAZ9jkNf6q7e5/0NF6s666L59k4v3+IqJOm
   bAmgT9BzpkZ1v040We/SnkEjRQQVjJ5UQWagcNn7of0mN8rYanJNkULn5
   WwjK2PaQV1qziEK0zLxgfQnoM6/a0l6msiVpKdsQEpj52D2bZtSBN0iht
   6Apk1usqFIrTIp1keDkpu0qbTXHF1AChNgx2vIQIL++R1J8Jeq6+HN2X/
   w==;
X-CSE-ConnectionGUID: SoLPrz95Rgm2Ezitjxg98w==
X-CSE-MsgGUID: 0RuLaBMoTfSQHCvt/cjoVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18859421"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18859421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 22:23:21 -0700
X-CSE-ConnectionGUID: VmAkxoSaTRy5V55F0yKHVw==
X-CSE-MsgGUID: nZEYByCeSIimJ3wMK+CW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19480775"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2024 22:23:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsyWL-00039U-0i;
	Sat, 06 Apr 2024 05:23:17 +0000
Date: Sat, 6 Apr 2024 13:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 98/100]
 drivers/net/wireless/ath/ath5k/debug.c:325:2: error: use of undeclared
 identifier 'count'
Message-ID: <202404061301.UwrA8b6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 6b38c794e367abc0ecc7340ed2ac9618e527aac1 [98/100] drivers/net/wireless/ath: convert to read/write iterators
config: i386-randconfig-001-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061301.UwrA8b6R-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061301.UwrA8b6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061301.UwrA8b6R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath5k/debug.c:325:2: error: use of undeclared identifier 'count'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |         ^
   drivers/net/wireless/ath/ath5k/debug.c:325:24: error: use of undeclared identifier 'count'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                               ^
   drivers/net/wireless/ath/ath5k/debug.c:326:32: error: use of undeclared identifier 'count'
     326 |         if (!copy_from_iter_full(buf, count, from))
         |                                       ^
   drivers/net/wireless/ath/ath5k/debug.c:329:6: error: use of undeclared identifier 'count'
     329 |         buf[count] = '\0';
         |             ^
   drivers/net/wireless/ath/ath5k/debug.c:337:9: error: use of undeclared identifier 'count'
     337 |         return count;
         |                ^
   5 errors generated.


vim +/count +325 drivers/net/wireless/ath/ath5k/debug.c

be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  318  
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  319  static ssize_t write_file_debug(struct kiocb *iocb, struct iov_iter *from)
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  320  {
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  321  	struct ath5k_hw *ah = iocb->ki_filp->private_data;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  322  	unsigned int i;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  323  	char buf[20];
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  324  
8aada63cc40887 drivers/net/wireless/ath/ath5k/debug.c Djalal Harouni 2013-08-25 @325  	count = min_t(size_t, count, sizeof(buf) - 1);
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  326  	if (!copy_from_iter_full(buf, count, from))
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  327  		return -EFAULT;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  328  
8aada63cc40887 drivers/net/wireless/ath/ath5k/debug.c Djalal Harouni 2013-08-25  329  	buf[count] = '\0';
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  330  	for (i = 0; i < ARRAY_SIZE(dbg_info); i++) {
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  331  		if (strncmp(buf, dbg_info[i].name,
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  332  					strlen(dbg_info[i].name)) == 0) {
e0d687bd9df218 drivers/net/wireless/ath/ath5k/debug.c Pavel Roskin   2011-07-14  333  			ah->debug.level ^= dbg_info[i].level; /* toggle bit */
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  334  			break;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  335  		}
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  336  	}
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  337  	return count;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  338  }
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  339  

:::::: The code at line 325 was first introduced by commit
:::::: 8aada63cc408874916a19341ba514f941096e424 ath5k: debugfs: NULL-terminate strings

:::::: TO: Djalal Harouni <tixxdz@opendz.org>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
