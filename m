Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3D2DC78C;
	Fri,  2 May 2025 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746214272; cv=none; b=UMzC4QeoXuOcttgJE1AtLdqqQxdqTx3DF3qUlFwMPgd5TgnGKtbEA55bDYfnK24MOFo0l8GQ9gp+78PIr+Cgi+NjYyLJTn12BObYHDej+/MZF20KHW98c7WzQqUOrEYWbBJKqmGzC15+2q7A9ITbq10qGxTQ5PUWdv+RTuwDdGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746214272; c=relaxed/simple;
	bh=30ckmPs5c8CuQmg05iN/O3hdiLvVkEwypWvV4skJLfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj51lbbpm3L8LZplN9RRUhe6fN+SMm/g+rqPFMbrXbh77CheIMaV6DR+IXK6rPJm9T3WqiuhwKeSz/Pv3MXhYDHRgPf+m/y/k4Qnkrlh0utXcVowD2AEjSSEKO9B9Q4MkT5krINpSik3nX0lVYvcbfC+/wgXgP62Z0MUC9UgVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnVhLMoi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnVhLMoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746214269; x=1777750269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=30ckmPs5c8CuQmg05iN/O3hdiLvVkEwypWvV4skJLfk=;
  b=LnVhLMoinwmjNj93EK3wODNLVD5WVTcCxRU2wBoo4RaXoU3uUtqM2oAm
   lvlhLvTFLtZx8/eDD29XfgKTqNHc8oYQN94daeL2P705mdSNwnUpBmr2z
   3Own4nP/VUEUGLYyS0iu5w4QX1Aj0JjWhHK7+rszKvGCIjkTqQEOioAtM
   W/TgEYHJG8AG+Ogv6xGm4vBQXrttD5qKkJxQA26l+AkvaWuEex+CXpYp0
   gM1AeqJcCdeVZkoijO+j4T5nC00H/Gya9bidMNFOEgeuHV0OtOy1WW9a2
   95MmPyQ4CXQCH4PqGNTN8PEr2aBvSxDLH6kYOrp4THtQFxmjW+irkayTW
   g==;
X-CSE-ConnectionGUID: 2Z1j74BnT1OzXY1xHyaAkA==
X-CSE-MsgGUID: 3R4MExuDRDWRgR3gizVmXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47160410"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47160410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 12:31:08 -0700
X-CSE-ConnectionGUID: cX+aVK6mQQes1Ws1gAtmgA==
X-CSE-MsgGUID: 2EC6mBFjTlai4bsL7tUwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134608190"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 May 2025 12:31:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAw6C-0004yj-2n;
	Fri, 02 May 2025 19:31:04 +0000
Date: Sat, 3 May 2025 03:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC, PATCH 04/12] x86/virt/tdx: Account PAMT memory and print
 if in /proc/meminfo
Message-ID: <202505030244.P6vk3r5v-lkp@intel.com>
References: <20250502130828.4071412-5-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502130828.4071412-5-kirill.shutemov@linux.intel.com>

Hi Kirill,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next next-20250502]
[cannot apply to tip/x86/tdx tip/x86/mm kvm/linux-next linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/x86-virt-tdx-Allocate-page-bitmap-for-Dynamic-PAMT/20250502-211346
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250502130828.4071412-5-kirill.shutemov%40linux.intel.com
patch subject: [RFC, PATCH 04/12] x86/virt/tdx: Account PAMT memory and print if in /proc/meminfo
config: i386-buildonly-randconfig-001-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030244.P6vk3r5v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030244.P6vk3r5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030244.P6vk3r5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/intel_ggtt.c:6:
>> arch/x86/include/asm/set_memory.h:93:34: warning: declaration of 'struct seq_file' will not be visible outside of this function [-Wvisibility]
      93 | void direct_pages_meminfo(struct seq_file *m);
         |                                  ^
   1 warning generated.


vim +93 arch/x86/include/asm/set_memory.h

    92	
  > 93	void direct_pages_meminfo(struct seq_file *m);
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
