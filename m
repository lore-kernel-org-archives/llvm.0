Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015312AAC5;
	Thu,  4 Apr 2024 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712251931; cv=none; b=GpnpsUOMkcPZmZnM6zpOxXsijB+aCrZmOzxblYQ4r0tdb/uXXt9PU0Hu3D3deL73KEHgEOWWfWyuv/9po8ZZ54Vc5KWLH8P3oA5Ng/+C3KPulzrbe8i549pLw0dNx/zf5cq1uUWONq1CNukmyTNOfH52LyDIMhHsBDzuW7PkZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712251931; c=relaxed/simple;
	bh=/URlMsrO8nHuR7FGc32uaUs0ZO10TcpaOZtECHOwk1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8RRgCEte+KCm7W23epqOvgzfZFemnXyoNKG5mZjnWj0QTX21AqjjTcfNoBHJDuO4JNy4AO2lTtiLOqS3+GJDOqVWo2kSkNffjD7/V1iFYGj7gd7oUS9xUP+ZM5lwtXMijRKH4+Js8/B/FsNF6qJqH4Oylztu3etrCXv6nT+MHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsKOKAYJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsKOKAYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712251929; x=1743787929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/URlMsrO8nHuR7FGc32uaUs0ZO10TcpaOZtECHOwk1A=;
  b=IsKOKAYJjpxZblRnO9yDbSkUnuRr6vQ6jWkaW/Kj69fHXiw+2vHitPwu
   YRzrv/B469Vdq84jqTN/j1kP+nknoJqZ5UeNJaSdkpE9CSdKk0484FshV
   aHIRmfdgGLMyiVzhY6jD7YodMotkmHottBfQiZ0SMPEKa4Dar2hMtcjRF
   tKpsIY0hfZbj9D9Ef+zxmUaoIw5CiwleGDboS2kpdkLkEtdbkpwWMx1nm
   1C7EFS2AXbCrW+z+4Fjs5km2iTesCmqcw+a1JTvu0J4OXOhnL7hNLS4V8
   vtLA09YlKDOzWs7CwpM0FPMZ94yPjZDqNnhz9gfSGySxu4046xldpSFrn
   A==;
X-CSE-ConnectionGUID: n4Y4wFSAQwuaH7n1AGUBSg==
X-CSE-MsgGUID: W/ImvJkPS82TjLZEnj5fVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8132409"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8132409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 10:32:03 -0700
X-CSE-ConnectionGUID: ZkLYlNW1QaGxfCGkzl8pJQ==
X-CSE-MsgGUID: OxzQwyyLQAWZ50tlqQgjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="50098185"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 10:32:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsQwS-0001Jy-01;
	Thu, 04 Apr 2024 17:32:00 +0000
Date: Fri, 5 Apr 2024 01:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter /14] include/linux/nsc_gpio.h:34:36: warning:
 declaration of 'struct kiocb' will not be visible outside of this function
Message-ID: <202404050123.YcqUnDFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   dc20900c9c15e7ca1961fe2d1eb50cc6938c5e78
commit: fe9c21429562ac632f44a86feb722e07aaa1c91e [/14] char: convert drivers to use ->read_iter() and ->write_iter()
config: i386-randconfig-002-20240404 (https://download.01.org/0day-ci/archive/20240405/202404050123.YcqUnDFc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050123.YcqUnDFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050123.YcqUnDFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-net48xx.c:16:
>> include/linux/nsc_gpio.h:34:36: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      34 | ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);
         |                                    ^
   include/linux/nsc_gpio.h:35:35: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      35 | ssize_t nsc_gpio_read_iter(struct kiocb *iocb, struct iov_iter *to);
         |                                   ^
   2 warnings generated.


vim +34 include/linux/nsc_gpio.h

    33	
  > 34	ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
