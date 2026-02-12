Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE313635C;
	Thu, 12 Feb 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866164; cv=none; b=GX7ZdJmxraj7lzCNYkkOXtgqn4pKoRSqfpzQ9YQ3W4DDTIkWmTceI/P0G0QKcCEG3LX+dkfTQ1PcQM9gzApRLaKVcxBG6QnoOsHL5uTZTCsb7E+hiRDXiDJVOmo2ybwQoSUNcCrU9SAm69M4eWfGT63uQ6q1BvrWvOWVUjUZg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866164; c=relaxed/simple;
	bh=OdXaaL/YOGRN1NRa1oAo8bdyiulNfzDiWyDClsqGLVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QwMkB65CKQiKxF8rV5HN7mAX9SbwOREeaimYecxcOiM9SDLtlapV7Id5z/o2Y5SJKqARk3EDEqh1b67F1crkj6QeZyQuvz7deOo5E85cFF5XoO2lsWlvdZ1eJpQxJ0YWtYBMQ+/YglhtAokKzpFotb29OS7GTaaunzwuD3LUSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZil+R+r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZil+R+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770866163; x=1802402163;
  h=date:from:to:cc:subject:message-id;
  bh=OdXaaL/YOGRN1NRa1oAo8bdyiulNfzDiWyDClsqGLVg=;
  b=EZil+R+roRaTnRMsb8OZ9nTDaFl3SpeCR+d5Jxk/XYh9bgR1a+QM6Un+
   NrLiTyOllfjHohazmm3lg4F4Sg+5UsL18EuIIY6QoMcYJVrGC8u9ijfKs
   xwezOkYhX3Gy2/g8qFIEN2GdqD9bbwYX26r624ZZ3tFZO5sABYLKLfiJL
   vqt/scEKmXqu8JiKzor4KUr8LJlun4yCYz5folS39AItm+uz+MR+13NGq
   O5TCZyPJS1Jg+Gqauq6IuUZouQqktiDqDZtEgvEDJIG6Do4ZN8jgqK1UI
   NqDgTsObAIeWoptwcKZ8EONUuqIQq/IARpXWtuuKFy5MwqwFLA6aAzn5i
   g==;
X-CSE-ConnectionGUID: FsMACkPyTWeyp8S3g+CD4g==
X-CSE-MsgGUID: LGBLn/ZIQrWvuWb9xvLw5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83395657"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="83395657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 19:16:02 -0800
X-CSE-ConnectionGUID: TUAzLcbnQh66GR+ogpapzQ==
X-CSE-MsgGUID: Mt+eaUk5TuKDj+b1CnpSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="242119977"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2026 19:16:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqNBO-00000000qay-3ApK;
	Thu, 12 Feb 2026 03:15:58 +0000
Date: Thu, 12 Feb 2026 11:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 7/7] ld.lld: error: undefined
 symbol: __udivdi3
Message-ID: <202602121112.PcauEfoN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   84230c0ac1cf76372e5558aeb30d65ff679aa0d6
commit: 84230c0ac1cf76372e5558aeb30d65ff679aa0d6 [7/7] sched/fair: Use full weight to __calc_delta()
config: i386-randconfig-001-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121112.PcauEfoN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121112.PcauEfoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121112.PcauEfoN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by fair.c:290 (kernel/sched/fair.c:290)
   >>>               kernel/sched/fair.o:(yield_task_fair) in archive vmlinux.a
   >>> referenced by fair.c:290 (kernel/sched/fair.c:290)
   >>>               kernel/sched/fair.o:(set_next_task_fair) in archive vmlinux.a
   >>> referenced by fair.c:290 (kernel/sched/fair.c:290)
   >>>               kernel/sched/fair.o:(reweight_task_fair) in archive vmlinux.a
   >>> referenced 6 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
