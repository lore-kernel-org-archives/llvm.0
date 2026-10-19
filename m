Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B151F936;
	Mon, 19 Oct 2026 00:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368601; cv=none; b=Znc0Qpf3ZYqpiG88fi8RpZdt5AReRgAt09HQv6F6mU3UknP8WF1r+2G0X9WKONGrqAqs0/2m1HL4WhAliRK2OThjdAAS9rLAhkVs4NI7XWPU5Kxv3x/CWcalz/Yi26WM2PXoK7iscJUa7JC5U9tTrCo1+WVw1Yy6Kmb8QvSH0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368601; c=relaxed/simple;
	bh=XPdu0XNNSbjMVRcCRVbbiIhZsmhqTLhF3ciGLbWbV60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wp7U/e+G03Zz2b1iG1kTY79Z9Ii34HdOXXlWQlbrp2vMaOiBML7N7k+v96NbV/UbgzEk+heFJaAWnA7oXfrMBqaOEIbPVmVaAGQH4f1Jfp+NKMpHGZLY7ryvUgl5g/wocjRn6UqSEe3KXoeooeEpujCWJMdO5lQZ8idbaSD5Rro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTi7YJXc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTi7YJXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792368599; x=1823904599;
  h=date:from:to:cc:subject:message-id;
  bh=XPdu0XNNSbjMVRcCRVbbiIhZsmhqTLhF3ciGLbWbV60=;
  b=HTi7YJXcKmW0crkGOLPfH3H/PAt0dQFZrhzHtvUvJOpy8M0TZB1D0/Jl
   BteYmUs+VzNEa/v0d1mnYxALwHyt9zGSfGrcEN8Kd2M4fVKR1zPLZHOYi
   /guMYnhuYG8BJJE5piNTZ27V7AteZRSKv6b3k7M11bzncSwWrTq3VqN63
   +s1i2N9l/FWZhAh3SOLyxAXcc8JrfOE4HFKQFBMP39EhLyy4pRJ0EUp7q
   DpY6FFMplVJ8NBcUJCFI6rKGZAoRXZjNlm4OOB2ysf3dCcKQmopMhNmp6
   t44eWPFvbcMsH3UXk1sYSuWIpieU3K3wY4k7mdk9GGbdMkUGxn4mPeiYb
   Q==;
X-CSE-ConnectionGUID: dhcsax8pSIieJn29fZT6ig==
X-CSE-MsgGUID: rViec3u9RoKV8eh1aJEWIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="933892"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="933892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 17:09:58 -0700
X-CSE-ConnectionGUID: EvzKi/IwRu6D2ccGUEXuKA==
X-CSE-MsgGUID: udsMdunfTvmSEeOIITIsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2504276"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 17:09:57 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIawt-000000005NL-19xg;
	Mon, 19 Oct 2026 00:09:55 +0000
Date: Mon, 19 Oct 2026 02:09:20 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:44: warning: omitting the parameter name in a function
 definition is a C2x extension
Message-ID: <202610190257.ynzn7tYi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: arm-randconfig-2001-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190257.ynzn7tYi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190257.ynzn7tYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190257.ynzn7tYi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:184:44: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     184 | static void irq_work_kick(struct irq_work *)
         |                                            ^
   1 warning generated.


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
