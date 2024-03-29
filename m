Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204DB3AC10;
	Fri, 29 Mar 2024 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711685138; cv=none; b=PLHjQ0nm3IxAK1yNOFe4XcysjgQm7QDr/mlqLfbwsFCObo8/PXWugW161ceaZVnhHRMQ3Viyvbes4P8JsJz0Rc38NY1hqAbYq9SFSGvlR7Yf1FfN/wM2CVfyAOF9gAQhlstLDO4rJfWVPFRy0p7gY5Z2FuM89hddJCtIHqz8g9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711685138; c=relaxed/simple;
	bh=FG3geALZ3G1Y4+GgJFnzem7P90jQhFE9PDeBPT+2GnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UU/eg26P+QUiL1u82yHQ0yAYnnxbkZ7LguRxqzTN0EYsQeWlfu8Nk1XYDBqx1U6dGR9iwAidu86jbJM5Duan57vdu4DEg4DlP384dA311DK2jyXHSneh9Pop9jMlcNtcxLi47ZIeC0TbOHz+p5Jn+dsc1QnQvkhjTHBYkF1lhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku5+dXQS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku5+dXQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711685136; x=1743221136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FG3geALZ3G1Y4+GgJFnzem7P90jQhFE9PDeBPT+2GnE=;
  b=ku5+dXQSBEKttizPX68OC6dQ7eMGcn9DHV7tZqgYMGl+Xzc99VQJcMBV
   Q2LeyJHElC4fLzYmlsSh+hiW7CYwMMy3aAP7Y9KrEY0W0dKonbHfawob4
   b1zNGjq6B7jrIYHy1wHYwYKSm31gsbgSKKZgReEdTmoj9sjzYtBbUvkT0
   12tXT5AeJf/+wFGuOE0JZcQ1XvRe7JEtWW1J4S6AAz+HUotlYnsbB6+TZ
   aUo1Dy3Q8ZBVLcdRr3VvcbtKI60bQJK8JaThvhi79OvCpix3K13HnSXjD
   gsNwLaQdVWZV4LjlGMhDfDUmNt8txkIKc3LvJjMapCMmp5EAeWbWli4At
   w==;
X-CSE-ConnectionGUID: /XezKC7gSRy/zHVaAv1r/A==
X-CSE-MsgGUID: 3PAADzPbRKa91e0oxXFKVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6985914"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6985914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16922670"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2024 21:05:33 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq3Uh-0002pe-1t;
	Fri, 29 Mar 2024 04:05:31 +0000
Date: Fri, 29 Mar 2024 12:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [akpm-mm:mm-nonmm-unstable 62/62] lib/test_fpu_glue.c:41:7: error:
 call to undeclared function 'kernel_fpu_available'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202403291239.zVJl8cpJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b065e14a3960a495216a032e6d383c104147c9ef
commit: b065e14a3960a495216a032e6d383c104147c9ef [62/62] selftests/fpu: allow building on other architectures
config: i386-buildonly-randconfig-003-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291239.zVJl8cpJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291239.zVJl8cpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291239.zVJl8cpJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_fpu_glue.c:41:7: error: call to undeclared function 'kernel_fpu_available'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         if (!kernel_fpu_available())
         |              ^
   1 error generated.


vim +/kernel_fpu_available +41 lib/test_fpu_glue.c

    38	
    39	static int __init test_fpu_init(void)
    40	{
  > 41		if (!kernel_fpu_available())
    42			return -EINVAL;
    43	
    44		selftest_dir = debugfs_create_dir("selftest_helpers", NULL);
    45		if (!selftest_dir)
    46			return -ENOMEM;
    47	
    48		debugfs_create_file_unsafe("test_fpu", 0444, selftest_dir, NULL,
    49					   &test_fpu_fops);
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
