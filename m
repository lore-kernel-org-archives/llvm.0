Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BE36B;
	Fri, 29 Nov 2024 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732838582; cv=none; b=k1E4s0Z9gxH9wfH8YFpvoFhTH31tCJf+TYnwLrl5c3uqZJh0FOIQG5SvrUf0LEcBnG1/o6q8NgoL5tujhOxGZLRwYyOtMwEigZU0rkOaTl9oy0n27aSZNlEWRT0ezU55w4hV/zXCBs3SrvYBcEZHdeIA3kZ7JMdrrewdeQCHKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732838582; c=relaxed/simple;
	bh=aVA5PcpbK3PbPzmidYhf9nMoPpCwGl0bYbDcqDdAXPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXthPob3kn0cAo3Ycfe8rRAlWdllPZ6CU8mGJ6CCtJg/frjp8HoxN0H384amoI3+fbwGtmzIVE3EQMtM0G9ZnEf+OcxLgnj1lwtbMh8ajj/9B+UfVQPugUZ19jKhI+HQyOJt96/gqwnTCxPZpHj6zEMr9UCVWxV3gr+G/IeDrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2b9aw+N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2b9aw+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732838580; x=1764374580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVA5PcpbK3PbPzmidYhf9nMoPpCwGl0bYbDcqDdAXPM=;
  b=h2b9aw+N7sL5TgnsgCAB0HBQ92x7tUjXkynY1DpPHLUyifndaWQUU0sw
   zhfpy1WtXJTzb4UThAFEw2raaLDMvW8IjWx5MKVbifd6lvjNFA35dFl9q
   vE8YKlamWtObWIImQKQshg9rXbkk/qBDGIwWldIqfAUvHqcAqaahjSYn0
   DVuQ5ZJK3KlBa7QYJAX2IIffeBrUXeKHV5rNIHfHkMM7ta2jnU0HNEkfr
   hX0My/iq77BG/7QOio6ltTejKhkm1EGNYgMk3jseF1MrywLM/q8l5xyKH
   ENJNmJDd6Af+YZeBjVXv858ouHmPZCsh5agLtac4p/GrITtPkCUuGqZ0t
   Q==;
X-CSE-ConnectionGUID: uyv0Jwt1SN6C6sVITq9y1g==
X-CSE-MsgGUID: eHkYta43RcKPH7mmsgAtIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43740282"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43740282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 16:02:57 -0800
X-CSE-ConnectionGUID: RBM+CgkbRc+yX5YUVIEjjw==
X-CSE-MsgGUID: J0Jnm+quRjWUh+vcm0wmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="115622393"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 16:02:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGoTG-000AAV-0A;
	Fri, 29 Nov 2024 00:02:54 +0000
Date: Fri, 29 Nov 2024 08:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/core 23/23] ld.lld: error: undefined symbol:
 zap_page_range_single
Message-ID: <202411290715.k40TdBWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   02fae3a65df8f78e7cbe879f5f089a4e46c95d6b
commit: 02fae3a65df8f78e7cbe879f5f089a4e46c95d6b [23/23] perf: map pages in advance
config: arm-randconfig-003-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290715.k40TdBWX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290715.k40TdBWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290715.k40TdBWX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: zap_page_range_single
   >>> referenced by core.c
   >>>               kernel/events/core.o:(perf_mmap) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
