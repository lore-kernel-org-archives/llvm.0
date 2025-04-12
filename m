Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD891166F29;
	Sat, 12 Apr 2025 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744475678; cv=none; b=EWT18TOLSOlm4TzZSY0yK9RhJwvVBwHSe2maAEDXqpPlpBKdSGpPPa6kix/MmGqEccz7gQ60nqr4dLki4diXKftTMbesdBh8elSwEV3PUKVhR6045MqKopgtYnawk1GUzXoMfULA5Txe+ZOpgG1AMHRL9/UDCtMoFYHma96qRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744475678; c=relaxed/simple;
	bh=FNumPhSMLMr7AxW7IqSMWkNfXfowQOpCWVTfllt5cdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dVjs6MwksJ/0AsE0B8dJBdZ4rsfpmTLmrW+VYaenrAJsOujlJSG//0sfRvFqgbZQiBdP7G9r455vsv+1YJ2I9Io0tQ/MoxtalbnSESb2BFZFcBQ8lx7RvUi00sf1PYy9j8KQBUUKlFP7fL0zeDuhZ3mpJF2bjIMVPQZCw5SCtmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiOKCyBK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiOKCyBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744475677; x=1776011677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNumPhSMLMr7AxW7IqSMWkNfXfowQOpCWVTfllt5cdA=;
  b=iiOKCyBKA4Zh5bR8UZeXYP1BYQtUHlPIAZWA2ggAUhp+OFEQy3kkneJB
   i0OLeyBKwaQnRLn3IIoru/Gn+ufkWos8VdcyaL5T0BXMLtSdCFRk1ltyb
   xdMT0hUx313yViaJzWrOazAlVUzY+EtqeU+hplfe0zr1+AFs+7KOQLJoo
   4Y0iJJRj06+0JewmvNp0nH9n9L4b3plQzjzhYiZcADqbrQnvXbuXExNAO
   6Z+VV3nXtUy/zjjSapTKl1+XUr4m3Vvs7tJsp3my57Ls2b83HxZB0L775
   g5Q9cf5pB2Mm8tmBeprRQ26sOS2SKS214UUahn15TjvjXl9YhmNKzcz53
   g==;
X-CSE-ConnectionGUID: /5iQKlLISjGqYgqG0z25Jw==
X-CSE-MsgGUID: rD+Thxr0TkiA6ktGb260KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49835428"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="49835428"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 09:34:36 -0700
X-CSE-ConnectionGUID: bjII5qA6Rd2urRPRZd2Pbg==
X-CSE-MsgGUID: iOlwIMG1RpiaJbE3odfHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134427968"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2025 09:34:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3doO-000Bxg-2S;
	Sat, 12 Apr 2025 16:34:32 +0000
Date: Sun, 13 Apr 2025 00:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] drivers/misc/lkdtm/perms.c:89:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202504130031.wonuYld0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e [6/6] objtool: Validate kCFI calls
config: arm-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130031.wonuYld0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130031.wonuYld0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130031.wonuYld0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/perms.c:89:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      89 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^
         | int
>> drivers/misc/lkdtm/perms.c:89:20: error: a parameter list without types is only allowed in a function definition
      89 | ANNOTATE_NOCFI_SYM(execute_location);
         |                    ^
   2 errors generated.


vim +/int +89 drivers/misc/lkdtm/perms.c

    70	
    71	static noinline __nocfi void execute_location(void *dst, bool write)
    72	{
    73		void (*func)(void);
    74		func_desc_t fdesc;
    75	
    76		pr_info("attempting ok execution at %px\n", do_nothing_ptr);
    77		do_nothing();
    78	
    79		if (write == CODE_WRITE) {
    80			memcpy(dst, do_nothing_ptr, EXEC_SIZE);
    81			flush_icache_range((unsigned long)dst,
    82					   (unsigned long)dst + EXEC_SIZE);
    83		}
    84		pr_info("attempting bad execution at %px\n", dst);
    85		func = setup_function_descriptor(&fdesc, dst);
    86		func();
    87		pr_err("FAIL: func returned\n");
    88	}
  > 89	ANNOTATE_NOCFI_SYM(execute_location);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
