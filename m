Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0B26AC5;
	Tue,  9 Apr 2024 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655003; cv=none; b=nDstBBVYaEJJDslWELG0Uz03ZNbVMzbeC3117dMSnlx4WobgUetifevMo+aBNtqwa+dc/HS+1AXHxZmiKIBu6A9yLFQWgMrVN9tI5f0ZX/NdBQHHfTHTuTCLQB0HZZsyt5Ld5Y9lgfGA+G0/PS/qjtBW35OeUCpX3c8BKqUo91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655003; c=relaxed/simple;
	bh=+CNzT7DeDRPE7lQAjuXqj2i3am9Kv4GkKfNRdbGoYEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMUEVyo9hFYy9iqOquDrYILBRL/QnIcx73kkMMWiPy9HYMJelPVe3KYWs5hFSIgB728gdZMrvZsNcAD6QxADohBijalDvnd9LByeyc3/0XUATbnrNoUOLGowTDL2icYW+4M5k5A0739Jhc6KqPdt27ZOtgYZnUb9XyHYuSEx3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF8fHYen; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF8fHYen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712655002; x=1744191002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CNzT7DeDRPE7lQAjuXqj2i3am9Kv4GkKfNRdbGoYEw=;
  b=FF8fHYenBPyFqh0hW1qRXgh+PFTsAcHvbmhisnNLiptu9IkexZxH6SYD
   MkhrJ4vHPwhho7YYDpmaFxkmQ64L6BpetLT85uc7z6L0qHDq+Zu5ZI/Mg
   o2ZpHGLhmTRMMrO9KovIaniHHD6hI92k+HE6tqTATv1E/cvQqh2dGEsaD
   Mm/icZjQMZrXK9TVtArS+zPKiTcH3I6gllikxOZv1UE0EJzvJF3fTbPmH
   8YwsGYc3QomW0UOOpljCH79zJNKYphuHAsIXQWuklZeZbFbXScP4t/h/q
   TDgBwhmp612KQD4Cjgrn1dnD5rx+s5NhYQUeKdkSztvFM2hzHRoivY9eA
   g==;
X-CSE-ConnectionGUID: 7lmnAyPnSkOendljFVHKUg==
X-CSE-MsgGUID: Gs4ln2f9TEmlM7P/rUZHaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11738596"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="11738596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 02:30:01 -0700
X-CSE-ConnectionGUID: BYcbINoRSpWdfykN8kxhSw==
X-CSE-MsgGUID: imhwGzJNSmCnqRp1xqmw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20615236"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2024 02:30:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru7nh-0005xk-0I;
	Tue, 09 Apr 2024 09:29:57 +0000
Date: Tue, 9 Apr 2024 17:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 215/222] drivers/iio/iio_core.h:66:41: warning:
 declaration of 'struct kiocb' will not be visible outside of this function
Message-ID: <202404091723.zKPS8iRr-lkp@intel.com>
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
commit: 973b33db709a7217c5d23d2dc1b7d60badca1444 [215/222] iio: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240409/202404091723.zKPS8iRr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091723.zKPS8iRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091723.zKPS8iRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/inkern.c:15:
>> drivers/iio/iio_core.h:66:41: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
   ssize_t iio_buffer_read_wrapper( struct kiocb *iocb, struct iov_iter *to);
                                           ^
   drivers/iio/iio_core.h:67:42: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
   ssize_t iio_buffer_write_wrapper( struct kiocb *iocb, struct iov_iter *from);
                                            ^
   2 warnings generated.


vim +66 drivers/iio/iio_core.h

    63	
    64	__poll_t iio_buffer_poll_wrapper(struct file *filp,
    65					 struct poll_table_struct *wait);
  > 66	ssize_t iio_buffer_read_wrapper( struct kiocb *iocb, struct iov_iter *to);
    67	ssize_t iio_buffer_write_wrapper( struct kiocb *iocb, struct iov_iter *from);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
