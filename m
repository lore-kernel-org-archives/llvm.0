Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4A4AEEA;
	Mon, 20 May 2024 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716247273; cv=none; b=p35bgYYSkYZd06Tm/1Skt9xIfrf3A3Jz3nQA3e5M6roYKyfK8sqyqag5DcrlnFsceDTaCYfPLv56Lc8LVy05du8uOo0vvxzm+oYS0yYKN40rwAN4inVFJ+w2vi+8lNLFKB6zDfZq6d91qrfz5SwsMY0C3hEpG7LxvG2R0zD3f5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716247273; c=relaxed/simple;
	bh=P9B+iumN/62nlqoadXeuqxMsMM6CHqI0PQq4sbMcGLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi73v/1v8dnpZjBh0ZHTdh+jxg87i6uCf+Ohcxyw3Y2beIfTWOyD7kG3PAwbW7vS5Ru+updVCteacrpJW8Tv7YgaFsGQhz4sMIRh9mzxB4UGtN1tWykM6LtSGYPR47wL/LgAdB97BF8sjwcKhETG+dGbFwNBRiFahU6SwalOYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KibVae/o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KibVae/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716247272; x=1747783272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9B+iumN/62nlqoadXeuqxMsMM6CHqI0PQq4sbMcGLw=;
  b=KibVae/oJpvJBFbKWwwKxRkqVf4dC8f4WhgeDqCv2bDePlOHSd1BegH2
   5nnMurfpoyIviGOGFWytNe0tN8LaTgy1h+4C6bIPdDTdRzL9O3f91wILI
   34xKB4RpsOH+Stuyjf/LP53N/qFTHQgKAudhf8c2PTfJmsRsCwRefZR1s
   I6qwdWcBOuEWQtcoW1QnNH9zNikeDSGfGKHqTgMJMYoz8eXI/IblWteIy
   snnI0PTRMOi5cp8JXvKi1NGAuAWdWrqV9+2GXH3/zvaqcyW0NxRbau+14
   8RjV7eWadWrXJ5wnN31UY2HNpROk5Ogi/FOwAiDMra0q1HlWs+4oTZb3S
   Q==;
X-CSE-ConnectionGUID: ryRSbdbyQMydUQIK09OL3w==
X-CSE-MsgGUID: 7jfOVCFFR/aShQ6u9yTERg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16235756"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="16235756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 16:21:12 -0700
X-CSE-ConnectionGUID: ooqPfSdDRfmCid3oLKYyPg==
X-CSE-MsgGUID: gBb98V5wQJ+vY/OPPCm5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37295701"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2024 16:21:10 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9CJX-0005G8-02;
	Mon, 20 May 2024 23:21:07 +0000
Date: Tue, 21 May 2024 07:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rcu:boqun-dev/hazptr 1/1] kernel/rcu/hazptr_test.c:18:8: warning:
 incompatible integer to pointer conversion assigning to 'struct
 callback_head *' from 'int'
Message-ID: <202405210704.NDdG0x1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git boqun-dev/hazptr
head:   ca2ab86d71c6d322c87127363aa4b665012a0ac2
commit: ca2ab86d71c6d322c87127363aa4b665012a0ac2 [1/1] WIP
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240521/202405210704.NDdG0x1S-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210704.NDdG0x1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210704.NDdG0x1S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rcu/hazptr_test.c:8:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(head);
           ^
   kernel/rcu/hazptr_test.c:18:10: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
                   ^
>> kernel/rcu/hazptr_test.c:18:8: warning: incompatible integer to pointer conversion assigning to 'struct callback_head *' from 'int' [-Wint-conversion]
           dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr_test.c:19:8: warning: incompatible integer to pointer conversion assigning to 'struct callback_head *' from 'int' [-Wint-conversion]
           other = kzalloc(sizeof(*dummy), GFP_KERNEL);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +18 kernel/rcu/hazptr_test.c

    10	
    11	static void simple(void)
    12	{
    13		struct hazptr_context ctx;
    14		struct callback_head *dummy, *tmp, *other;
    15		hazptr_t *hptr;
    16		hazptr_t *hptr2;
    17	
  > 18		dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
    19		other = kzalloc(sizeof(*dummy), GFP_KERNEL);
    20	
    21		if (!dummy || !other) {
    22			printk("allocation failed, skip test\n");
    23			return;
    24		}
    25	
    26		init_hazptr_context(&ctx);
    27		hptr = hazptr_alloc(&ctx);
    28		BUG_ON(!hptr);
    29	
    30		// Get a second hptr.
    31		hptr2 = hazptr_alloc(&ctx);
    32		BUG_ON(!hptr2);
    33	
    34		// No one is modifying 'dummy', protection must succeed.
    35		BUG_ON(!__hazptr_tryprotect(hptr, (void **)&dummy, 0));
    36	
    37		// Simulate changing a global pointer.
    38		tmp = dummy;
    39		WRITE_ONCE(dummy, other);
    40	
    41		// Callback will run after no active readers.
    42		printk("callback added, %px\n", tmp);
    43		call_hazptr(tmp, simple_func);
    44	
    45		// Simulate changing a global pointer.
    46		tmp = dummy;
    47		WRITE_ONCE(dummy, other);
    48	
    49		// No one is modifying 'dummy', protection must succeed.
    50		BUG_ON(!__hazptr_tryprotect(hptr2, (void **)&dummy, 0));
    51	
    52		// The above callback should run after this.
    53		hazptr_clear(hptr);
    54		printk("first reader is out\n");
    55	
    56		for (int i = 0; i < 10; i++)
    57			schedule(); // yield a few times.
    58	
    59		printk("callback added, %px\n", tmp);
    60		call_hazptr(tmp, simple_func);
    61	
    62		cleanup_hazptr_context(&ctx);
    63		printk("no reader here\n");
    64	
    65		for (int i = 0; i < 10; i++)
    66			schedule(); // yield a few times.
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
