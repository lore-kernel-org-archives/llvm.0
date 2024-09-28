Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A312E75;
	Sat, 28 Sep 2024 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520736; cv=none; b=oh4H6o5L84JaYfLwrB/JThAkoiDRmZvfCYtkW0oMOh32qlt1+fP9AkH2j0GZ7pzb9WsE5a7pQE02NXxljfvMTXxVHEzxbLUg9jw8RWaIdIrGi2635FQjPznrZuqLXQE9bUNbh2I687qN3iuE2uCk6J085xRtuw6AagJDKVkXAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520736; c=relaxed/simple;
	bh=aUL2MNKny/FrCKLUkjdju1BoQqqG98YFjitX+H1pLf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZpKQGzYZhMMpHxlKsryuIDFoWuJC2YUP0jmxe7geBhF4MdA7xZsK77IzvC3+kBKrcimVg8XDcac0jtG9g5mRALD3VtJA+tm7SB3733zvvwQBf+zbecAVO29izXj2pDyMv6Zsn3gpOhw66mJd7c6yPSargnWFZ5R4DgrufkXREZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftKSF92C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftKSF92C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727520734; x=1759056734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aUL2MNKny/FrCKLUkjdju1BoQqqG98YFjitX+H1pLf8=;
  b=ftKSF92C/VNF3mBD0+Yat5BvoUQcdAaIPYlYQ7ig1LwXYN3qt1Xdq3R4
   9JsGiq6yC9FJ1aB19TWuqZ3sD8GElPGy4Tbhl4SnsHA72k2oWF+x7NGaP
   cII3vjoRxeKa4hmE2vBCJqsYMqHwpaPIwvF0Z9VfwVwlU+wM+hJRNIscl
   /waCCBN7JmZC1MUCclpaexih8igdefxm8zhPj1ZVh171aU9mThGwdPq+w
   krlFfDfORb5ecMKIM8SmkETcpYlbDxpCyCuDdWZOF4IQS+QtL8IiAApMr
   t139bJXoqYZtJ08HYKgfLL7Fp27YYX46Cpon36VlMBKU5tywA5q5f7pQw
   w==;
X-CSE-ConnectionGUID: 1QwAS9VOTluAvWJ3nKoS0Q==
X-CSE-MsgGUID: RGE1Zyr+T4+zHRo0KjLkqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44128037"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44128037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:52:14 -0700
X-CSE-ConnectionGUID: yMvNpt40Rwib1e4ymzgERA==
X-CSE-MsgGUID: bKvmQ2t/QM61kNdOaX734A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72363724"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 03:52:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suV3a-000NBo-0W;
	Sat, 28 Sep 2024 10:52:10 +0000
Date: Sat, 28 Sep 2024 18:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 9/10] arch/x86/um/../kernel/module.c:undefined
 reference to `apply_direct_call_offset'
Message-ID: <202409281834.27t5v0fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: 76743359658d730ecba565019069d870d30fe3b8 [9/10] x86/ibt: Implement IBT+
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240928/202409281834.27t5v0fl-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281834.27t5v0fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281834.27t5v0fl-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> arch/x86/um/../kernel/module.c:(.text+0x4bd): undefined reference to `apply_direct_call_offset'
   clang-15: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
