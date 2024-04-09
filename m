Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C054FAF;
	Tue,  9 Apr 2024 05:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712641972; cv=none; b=KMagb/yYRoB62/OX062ClNiPeSUfUgwCFVqgWIj5lODOCokVqBbhbxaf5XGrSti4z9JPtlU+KGYMc+GlYwP99m53nKYJQS6+rY2VrFqT0cq16mzobKYwnyqgIivNbXg8xn+2Le9BQdmjtuRJkqc2d272OWsUmC7msw075rTFmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712641972; c=relaxed/simple;
	bh=7wUmDr3frKZuQy64K+WPW7PE3+/3btlpAS+Kqagh5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cevvlyk44zsLrLXkKEI456aUw/5pC1idq609m7jYAAsDanqRHmBIssd8y+BC4HFaNZaqhZt1Fdl/UgOSYPfdBQUJYhr5H7afRhTOb1J6/kna+jPi6KJYu7iNwlHKDkA9h1awsH7CGIzYuD6kTc5HBwO0ZFdgdQ9719/7ghF9s9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRci/fGl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRci/fGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712641970; x=1744177970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wUmDr3frKZuQy64K+WPW7PE3+/3btlpAS+Kqagh5dw=;
  b=YRci/fGlrvHX1YccpJoEWg1l1gzcC5nU+OCRPsH1TGsFgYAE0LzhTr/x
   zjxcBiDoVS42ITpXuzpHHqYVStDTRjEqN8vcPqTZpJEoDFJ+FrFd+HwbV
   UDzv2b2uBHdljgv2vnrQdIATmbltggEcZMZUve+PUvwtUyIQJigaF+wo0
   PuF6nK+tLtn7+nijGtpZpLKqHDxZ/BOgFxgvRYjek7eq5CDHr6w8tEBwf
   19VGMUMRCjyAswOTn1MYsaHnmzhdgM+Qh1+D3bsq8JjPe1xNB7/8XY6/b
   KhDZol6QNlTP6E0qX7xOHD0TNzQe1bxwtqlkdTH0isMRvoiSwtp8h5ihD
   Q==;
X-CSE-ConnectionGUID: RxWBX3jvTOyCYh9/6XI2Kw==
X-CSE-MsgGUID: /j6XeOEXRrK2O7DUQUVWhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7814924"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="7814924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 22:52:50 -0700
X-CSE-ConnectionGUID: FH7NPd1dSwqS6kuFU1TDug==
X-CSE-MsgGUID: ZtPxBkcbRLiqPk4EkLsAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="20031577"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2024 22:52:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru4PW-0005n4-0e;
	Tue, 09 Apr 2024 05:52:46 +0000
Date: Tue, 9 Apr 2024 13:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 161/222] fs/ubifs/debug.c:2690: warning:
 Function parameter or struct member 'iocb' not described in
 'provide_user_output'
Message-ID: <202404091311.xLdIyOn0-lkp@intel.com>
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
commit: d9673adf2dd3c1d1e73990a1f38ea80c09167efb [161/222] ubifs: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240409/202404091311.xLdIyOn0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091311.xLdIyOn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091311.xLdIyOn0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/debug.c:2690: warning: Function parameter or struct member 'iocb' not described in 'provide_user_output'
>> fs/ubifs/debug.c:2690: warning: Function parameter or struct member 'to' not described in 'provide_user_output'
>> fs/ubifs/debug.c:2690: warning: Excess function parameter 'u' description in 'provide_user_output'
>> fs/ubifs/debug.c:2690: warning: Excess function parameter 'count' description in 'provide_user_output'
>> fs/ubifs/debug.c:2690: warning: Excess function parameter 'ppos' description in 'provide_user_output'


vim +2690 fs/ubifs/debug.c

552ff3179d1e93a Artem Bityutskiy 2008-10-23  2676  
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2677  /**
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2678   * provide_user_output - provide output to the user reading a debugfs file.
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2679   * @val: boolean value for the answer
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2680   * @u: the buffer to store the answer at
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2681   * @count: size of the buffer
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2682   * @ppos: position in the @u output buffer
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2683   *
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2684   * This is a simple helper function which stores @val boolean value in the user
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2685   * buffer when the user reads one of UBIFS debugfs files. Returns amount of
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2686   * bytes written to @u in case of success and a negative error code in case of
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2687   * failure.
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2688   */
d9673adf2dd3c1d Jens Axboe       2024-04-05  2689  static int provide_user_output(int val, struct kiocb *iocb, struct iov_iter *to)
28488fc28aa3981 Artem Bityutskiy 2011-06-03 @2690  {
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2691  	char buf[3];
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2692  
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2693  	if (val)
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2694  		buf[0] = '1';
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2695  	else
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2696  		buf[0] = '0';
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2697  	buf[1] = '\n';
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2698  	buf[2] = 0x00;
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2699  
d9673adf2dd3c1d Jens Axboe       2024-04-05  2700  	return simple_copy_to_iter(buf, &iocb->ki_pos, 2, to);
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2701  }
28488fc28aa3981 Artem Bityutskiy 2011-06-03  2702  

:::::: The code at line 2690 was first introduced by commit
:::::: 28488fc28aa39815b78c2cbeaaf25f33fef92ce8 UBIFS: introduce debugfs helpers

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <dedekind1@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
