Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C41D90C5;
	Sun,  9 Mar 2025 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741530730; cv=none; b=bmoR9NFuIYkC/vt8RhmoFt1L3x2/VI5EUKtz07JmEVW+4hVrVyGUBus6nbJ/ao7eFgr34T5hwYxPCqzVic9xUgsszjjvSkEWQHSlcRfiqiHyUeJnqhWcDUz9IbAKjVIB+eRj+tmVElK6wxa0piehY7n8f1gk6+0sR+ITZ5/+fCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741530730; c=relaxed/simple;
	bh=ZWTyKCgzxgzSSnZYEH9mQTJDvRlV/PPeWnE8ql+GB+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmlBnu195oB1K94UbqIc/3BBDjSs6UsCWCxfSGqSSJckQYS999ERHfe1glKX+hBFUdTkcd49emyV7/MBiJbcGqyNLqhDKuTa9A3jYUoTChRQtAsRcJLfKZvfDd0AkfWc/pofIlzGMO74IbwTb5mTJhc5Oz9p+dpr2nz6Oh7AwS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3/ENNus; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3/ENNus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741530729; x=1773066729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWTyKCgzxgzSSnZYEH9mQTJDvRlV/PPeWnE8ql+GB+Y=;
  b=L3/ENNusB9qZO8NGKxrGpsjiYFbDFspbdBD+H5eMMumSHiDl0h65sumq
   uaiF6T0s7qrJNruIUp8inXH0bYT7z5tPa1gKXA0JBb7JLNNYXCKTV9O8A
   y42jrTfUBpob4BJcq1Ye6h5obATzxAE5+HbEAoGaaF81YYoFAD1YQOKBM
   5Xtw3xZelg87rhAHK0HUbsxDRRTq5ZjHAHYYJ/hP/hdO7k838I26cyeaa
   T+N9tom0GiuCiVcWxALVKqCWZsyEaKH/+i7UGhsqSsiLVKXMmc/Np4rqz
   H2VWdtpjJfxo0xjhY1i/8Y1zdUCFzoVbHCI+yuqW0RFqnkwcMQjR3VXOq
   Q==;
X-CSE-ConnectionGUID: c1QyPciSTe+WC/Kh9QwVJA==
X-CSE-MsgGUID: 8qUkjJpWRfu8eQosS+BT3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="59938764"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="59938764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 07:32:08 -0700
X-CSE-ConnectionGUID: aMco+C0zQ5qpV9QAErOFcw==
X-CSE-MsgGUID: ZxCFfxEnQMevnKssQarnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123947082"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2025 07:32:04 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trHhC-0003BM-0K;
	Sun, 09 Mar 2025 14:32:02 +0000
Date: Sun, 9 Mar 2025 22:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wen Yang <wen.yang@linux.dev>, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wen Yang <wen.yang@linux.dev>, Jens Axboe <axboe@kernel.dk>,
	Dylan Yudaken <dylany@fb.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] eventfd: introduce configurable maximum value for
 eventfd
Message-ID: <202503092210.z9CcRYoe-lkp@intel.com>
References: <20250309055003.32194-1-wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309055003.32194-1-wen.yang@linux.dev>

Hi Wen,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wen-Yang/eventfd-introduce-configurable-maximum-value-for-eventfd/20250309-135152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250309055003.32194-1-wen.yang%40linux.dev
patch subject: [PATCH v3] eventfd: introduce configurable maximum value for eventfd
config: i386-buildonly-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250309/202503092210.z9CcRYoe-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092210.z9CcRYoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092210.z9CcRYoe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/eventfd.c:251:69: error: use of undeclared identifier 'ucnt'
     251 |         return (ctx->maximum > ctx->count) && (ctx->maximum - ctx->count > ucnt);
         |                                                                            ^
   1 error generated.


vim +/ucnt +251 fs/eventfd.c

   248	
   249	static inline bool eventfd_is_writable(const struct eventfd_ctx *ctx)
   250	{
 > 251		return (ctx->maximum > ctx->count) && (ctx->maximum - ctx->count > ucnt);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
