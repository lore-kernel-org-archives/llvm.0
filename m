Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94593815D2;
	Wed, 15 Apr 2026 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258010; cv=none; b=CHVJWtFKc5P5Oedxy95m7CSVoWu+lUAc0nSYwsK7ORQsJ/yv7OaptlV88GC9NF665KWeq9PHNRwab+TVdxQbv5b/IIVAs6izgYfYQzBpkLimYcNpwJPIDP4etTROSR7z3mloRv2mgoTtg1ZhTDMq8Lhl9xn3NiNWXd1IdG26oHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258010; c=relaxed/simple;
	bh=afA1MgpAw2F05rcidazogK47858Avm8/0SDyFXaYSOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RyLbrI7m2CS55yJJKdVf4YR2QFDPmYUvbPng3lisQ7XH67ANkOBuEW/lF2g7p1l7fU073eBa3VRQe08dkNPx8Jpas0sT1CLb3CBvzd4MkY+1XN8pW2Y6i4E5OXEXhyW4TdIq/MS+4uU9vmjUyYRv8bPiNUEpn4cFOVVXmzXUbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8CKERNA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8CKERNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776258010; x=1807794010;
  h=date:from:to:cc:subject:message-id;
  bh=afA1MgpAw2F05rcidazogK47858Avm8/0SDyFXaYSOU=;
  b=P8CKERNA2cW6cxI8+t9P3Njr9Kq4OYbZzf4vJrsh9aO/MeOhuejcLtO8
   GF+3KTQFoxiTs7Q5xxvKKRtveJTYpLLsrMKzpY3bLTxHIgSFo9A5PaqXx
   p/VrcOYoHDTWNsZhGAwAp5sod7mzN1WMYmbJ1DvG1Y8YwOw7xxZUCQaSk
   Fu4VSs0TBrf1YFZCbmUs2H2apyUt6hV+ARUJtwthPGMM1r2742jZ1yiSH
   H8baraSHl27+nl8jwSSimnqarmNvME43mn9S7g7TdlqwWnPH4Abs0blvI
   sPJyt839il9debpe9XoJUy1MRHVH4v3GTPRsdmXD7k4xIEFYkEVnPI8vU
   w==;
X-CSE-ConnectionGUID: BimCAN6xT1SMX9SxAw/+sQ==
X-CSE-MsgGUID: CQSErhF2SnWnsMvf2ENAdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102691865"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102691865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:00:09 -0700
X-CSE-ConnectionGUID: /JVPJfDaQKKuHHNqKG+GSA==
X-CSE-MsgGUID: vwPm+tjAQcaP1MYwa6jhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230658659"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2026 06:00:06 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCzqd-000000000Wj-2jBc;
	Wed, 15 Apr 2026 13:00:03 +0000
Date: Wed, 15 Apr 2026 20:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Subhransu S. Prusty" <subhransu.sekhar.prusty@altera.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:hssi_patch_v2 5/5]
 drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:43:45: error: too
 many arguments provided to function-like macro invocation
Message-ID: <202604152043.3xJRQQD5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git hssi_patch_v2
head:   c2839fb083f7b0c330a385cc42be70bb2961b9cf
commit: c2839fb083f7b0c330a385cc42be70bb2961b9cf [5/5] net: altr: hssiss: Add debugfs support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604152043.3xJRQQD5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152043.3xJRQQD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152043.3xJRQQD5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:43:45: error: too many arguments provided to function-like macro invocation
      43 | static ssize_t csr_read(struct file *filep, char __user *ubuf,
         |                                             ^
   arch/loongarch/include/asm/loongarch.h:197:9: note: macro 'csr_read' defined here
     197 | #define csr_read(reg) csr_read64(reg)
         |         ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:43:24: error: expected ';' after top level declarator
      43 | static ssize_t csr_read(struct file *filep, char __user *ubuf,
         |                        ^
         |                        ;
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:65:5: error: too many arguments provided to function-like macro invocation
      65 |                          size_t count, loff_t *offp)
         |                          ^
   arch/loongarch/include/asm/loongarch.h:198:9: note: macro 'csr_write' defined here
     198 | #define csr_write(val, reg) csr_write64(val, reg)
         |         ^
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:64:25: error: expected ';' after top level declarator
      64 | static ssize_t csr_write(struct file *filep, const char __user *ubuf,
         |                         ^
         |                         ;
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:680:11: error: incompatible integer to pointer conversion initializing 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') with an expression of type 'ssize_t' (aka 'long') [-Wint-conversion]
     680 |         .write = csr_write,
         |                  ^~~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:681:10: error: incompatible integer to pointer conversion initializing 'ssize_t (*)(struct file *, char *, size_t, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long, long long *)') with an expression of type 'ssize_t' (aka 'long') [-Wint-conversion]
     681 |         .read = csr_read
         |                 ^~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:681:10: error: initializer element is not a compile-time constant
     681 |         .read = csr_read
         |                 ^~~~~~~~
   7 errors generated.


vim +43 drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c

    42	
  > 43	static ssize_t csr_read(struct file *filep, char __user *ubuf,
    44				size_t count, loff_t *offp)
    45	{
    46		struct altera_hssiss_dbg *d = filep->private_data;
    47		char buf[10];
    48		int size;
    49	
    50		size = snprintf(buf, sizeof(buf), "%x\n", d->read.data);
    51	
    52		return simple_read_from_buffer(ubuf, count, offp, buf, size);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
