Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFF230BFD;
	Sun, 19 Oct 2025 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860680; cv=none; b=gw5wMRp1Xd1piVhrhdF6pWF4vj9BRs5wgL+8zTxNDWmdAY4GFwA6I0DWJn8AOW8qyttkOjFwMRfrPm1fyL9RKwHptMruzN2OFNBWT5IqYSLs8xaDLTS0Ew7drO6bVRG2KPWwnKFWsl0WrrLfdEncx5wBgblFTAWX7VSGEmF3q+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860680; c=relaxed/simple;
	bh=NzyLFKmpBAFAkEFYbrpaU49Bq284I+wqLdWiK+QvxR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRjdPpqb0oFlgNUHMkifvcXRfvi4ObbUH85PmCDa6C+kDeORCcoREo/82Hy6q71y7MuSpPgmsMliFeEsQ1TKq1Q25a7ICJvVjfN6CPtkwO2z1Wpkrz1Ks1ZuNPC4SFsi+sFoow3b751IqINigimiGyLldbcfRP7kgNNzud6tHO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ai3NfoW7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ai3NfoW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760860680; x=1792396680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NzyLFKmpBAFAkEFYbrpaU49Bq284I+wqLdWiK+QvxR0=;
  b=Ai3NfoW7V/c0JQXFVKMs41g829tjy1jKg3nccxN+Cb3xkCDuY3KvxwSo
   eNRVDz/EWy62/dWckxJPBTMLIJZ7NHrH3v6vuWZxaKaO6G3FX2ZypYOq4
   bQX4bZyrBlYANvG6oDyyesvvWoUrAUwwEx34Rx3p02M7yhsh4APJ3ATNo
   DKwkBw0bCB2SjkklkjTdbBnNQ2ZfrwgfJcSBfVeXL3kxJnxjl5OdkkUpe
   edwB12qppSewAaPiNH8yZmbKoxCkw/z5gKOCP85ZcmqIsfJeWRg8uR1nA
   ou/VBFdjtNUo1JrY1UK+tfstZ6JYb8AxXCCNXkfNKNjn4sPqAeeniDgQu
   A==;
X-CSE-ConnectionGUID: HHWwWgW+Q6aIcsR6N+UQCA==
X-CSE-MsgGUID: cDWELN0XSUqcZLpqtZFoow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74131297"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="74131297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 00:57:58 -0700
X-CSE-ConnectionGUID: 7MQHtWInQlyk5ydDQbQACQ==
X-CSE-MsgGUID: +mXL1m/BTr+N4mxhKe1Azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="214055684"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2025 00:57:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAOIK-0008vh-2i;
	Sun, 19 Oct 2025 07:57:42 +0000
Date: Sun, 19 Oct 2025 15:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch v2 16/16] multikernel: Integrate Kexec HandOver
 framework for DTB preservation
Message-ID: <202510191559.Q2qvEdKR-lkp@intel.com>
References: <20251019061631.2235405-17-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019061631.2235405-17-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on powerpc/fixes robh/for-next linus/master v6.18-rc1]
[cannot apply to powerpc/next next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20251019-141940
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251019061631.2235405-17-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch v2 16/16] multikernel: Integrate Kexec HandOver framework for DTB preservation
config: i386-buildonly-randconfig-004-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191559.Q2qvEdKR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191559.Q2qvEdKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191559.Q2qvEdKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/pci/common.c:21:
   In file included from arch/x86/include/asm/setup.h:72:
>> include/linux/kexec_handover.h:173:44: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
     173 | static inline int mk_kexec_finalize(struct kimage *target_image)
         |                                            ^
   1 warning generated.


vim +173 include/linux/kexec_handover.h

   172	
 > 173	static inline int mk_kexec_finalize(struct kimage *target_image)
   174	{
   175		return -EOPNOTSUPP;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
