Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F31C84DE;
	Mon,  8 Sep 2025 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757308795; cv=none; b=Ele+fwCvWBqx77XI2NwtRwCQNODbRh8CUIhrSBmt/GFqKkBecpVAflExdN9kJZR88Tz9GHmS40pdvmVJVEoS8s+oN66Aaz9cIGHVObeyzfG+yT+vza7Mau48eaJv4SSHaP6RtpkRvfKfXbxibp4L3iJTtuChjA3rt2LiF54MncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757308795; c=relaxed/simple;
	bh=easrnnuDNiQXsmYj1OCy6rJ5dWM8oaUwlgD4plSJiIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpOMvOOA53D+gOjJAzH0gk9ZC5wsseSOpxnvGCDUdfWTlveCeVNkIVdUGFayxQk5vLnKO2Ngbx1N9pKbfRikNC4NZIbdwBioVveJjifRXXgr7dJuEYKXQfV3dx70/YgYBPRjCnmSfyftmeVm3EvZszN2VxoHBTG6VDbqrZpnI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRSIzm/q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRSIzm/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757308793; x=1788844793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=easrnnuDNiQXsmYj1OCy6rJ5dWM8oaUwlgD4plSJiIU=;
  b=kRSIzm/q6jJNDt0cYfXer7Ec2IDgG2jXJNyPvIxhJrVZQ2/eCsiXy0O3
   b9uxsVj5vFOWd762TcS20P7MYGlzQhhl8q8x634ivliMgf1oUA/tI1clu
   gB5RXNlubVIFLE2hz3a/cQ8/ecvy4zpiDw9dOf5M+p8bX7zFVyxVdxP4k
   wPOjFkoOuNwSNRIuciUjdMu3ox5J2yYXsv5y3kaOmzlHaIH1NpeR7VP26
   6CPe9bTKh+vfAlmzN9jHCpVrnWwWgf8eMHJFK+ss+WIt5zTGj0QEdzzBZ
   QNoau6/k8P2ojVVdLMCpyd163Ol6O/sP1g8puEYR12L6U6Z1cgbiMK8dU
   A==;
X-CSE-ConnectionGUID: Sw6OY2fIRBWi3ZGd4y57Wg==
X-CSE-MsgGUID: 2MxSyaKjRh69EAGFgikPcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="77012416"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="77012416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 22:19:53 -0700
X-CSE-ConnectionGUID: B1fIAf2BTw+g8+QmMfYVzA==
X-CSE-MsgGUID: qmKTLTnKTbqBrfwBu7T7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="171962942"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2025 22:19:52 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvUI9-0003Wp-0c;
	Mon, 08 Sep 2025 05:19:49 +0000
Date: Mon, 8 Sep 2025 13:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 12/13] dmaengine: sdxi: Add Kconfig and Makefile
Message-ID: <202509081310.SsgvmgVR-lkp@intel.com>
References: <20250905-sdxi-base-v1-12-d0341a1292ba@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sdxi-base-v1-12-d0341a1292ba@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Lynch-via-B4-Relay/PCI-Add-SNIA-SDXI-accelerator-sub-class/20250906-025019
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250905-sdxi-base-v1-12-d0341a1292ba%40amd.com
patch subject: [PATCH RFC 12/13] dmaengine: sdxi: Add Kconfig and Makefile
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250908/202509081310.SsgvmgVR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081310.SsgvmgVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081310.SsgvmgVR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/dma/sdxi/dma.c:78:20: warning: result of comparison of constant 4294967296 with expression of type 'size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      78 |         if (sdxi_cmd->len > MAX_DMA_COPY_BYTES)
         |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/dma/sdxi/enqueue.c:115:19: error: invalid operand for instruction
     115 |                         bool success = cmpxchg(Write_Index,
         |                                        ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/hexagon/include/asm/cmpxchg.h:62:3: note: expanded from macro 'arch_cmpxchg'
      62 |                 "1:     %0 = memw_locked(%1);\n"                \
         |                 ^
   <inline asm>:1:12: note: instantiated into assembly here
       1 |         1:      r5:4 = memw_locked(r23);
         |                        ^
>> drivers/dma/sdxi/enqueue.c:115:19: error: invalid operand for instruction
     115 |                         bool success = cmpxchg(Write_Index,
         |                                        ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/hexagon/include/asm/cmpxchg.h:65:4: note: expanded from macro 'arch_cmpxchg'
      65 |                 "       memw_locked(%1,p0) = %3;\n"             \
         |                  ^
   <inline asm>:4:24: note: instantiated into assembly here
       4 |         memw_locked(r23,p0) = r9:8;
         |                               ^
   2 errors generated.
--
>> drivers/dma/sdxi/descriptor_kunit.c:34:19: warning: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 4294967297 to 1 [-Wconstant-conversion]
      34 |         copy.len = SZ_4G + 1;
         |                  ~ ~~~~~~^~~
   drivers/dma/sdxi/descriptor_kunit.c:42:13: warning: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
      42 |         copy.len = SZ_4G;
         |                  ~ ^~~~~
   include/linux/sizes.h:54:18: note: expanded from macro 'SZ_4G'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:71:1: note: expanded from here
      71 | 0x100000000ULL
         | ^~~~~~~~~~~~~~
   2 warnings generated.


vim +115 drivers/dma/sdxi/enqueue.c

65c648c037296d4 Nathan Lynch 2025-09-05   83  
65c648c037296d4 Nathan Lynch 2025-09-05   84  int sdxi_enqueue(const __le64 *enq_entries,                 /* Ptr to entries to enqueue */
65c648c037296d4 Nathan Lynch 2025-09-05   85  		 u64 enq_num,                               /* Number of entries to enqueue */
65c648c037296d4 Nathan Lynch 2025-09-05   86  		 __le64 *ring_base,                         /* Ptr to ring location */
65c648c037296d4 Nathan Lynch 2025-09-05   87  		 u64 ring_size,                             /* (Ring Size in bytes)/64 */
65c648c037296d4 Nathan Lynch 2025-09-05   88  		 __le64 const volatile * const Read_Index,  /* Ptr to Read_Index location */
65c648c037296d4 Nathan Lynch 2025-09-05   89  		 __le64 volatile * const Write_Index,       /* Ptr to Write_Index location */
65c648c037296d4 Nathan Lynch 2025-09-05   90  		 __le64 __iomem *Door_Bell)                 /* Ptr to Ring Doorbell location */
65c648c037296d4 Nathan Lynch 2025-09-05   91  {
65c648c037296d4 Nathan Lynch 2025-09-05   92  	u64 old_write_idx;
65c648c037296d4 Nathan Lynch 2025-09-05   93  	u64 new_idx;
65c648c037296d4 Nathan Lynch 2025-09-05   94  
65c648c037296d4 Nathan Lynch 2025-09-05   95  	while (true) {
65c648c037296d4 Nathan Lynch 2025-09-05   96  		u64 read_idx;
65c648c037296d4 Nathan Lynch 2025-09-05   97  
65c648c037296d4 Nathan Lynch 2025-09-05   98  		read_idx = le64_to_cpu(READ_ONCE(*Read_Index));
65c648c037296d4 Nathan Lynch 2025-09-05   99  		dma_rmb();  /* Get Read_Index before Write_Index to always get consistent values */
65c648c037296d4 Nathan Lynch 2025-09-05  100  		old_write_idx = le64_to_cpu(READ_ONCE(*Write_Index));
65c648c037296d4 Nathan Lynch 2025-09-05  101  
65c648c037296d4 Nathan Lynch 2025-09-05  102  		if (read_idx > old_write_idx) {
65c648c037296d4 Nathan Lynch 2025-09-05  103  			/* Only happens if Write_Index wraps or ring has bad setup */
65c648c037296d4 Nathan Lynch 2025-09-05  104  			return -EIO;
65c648c037296d4 Nathan Lynch 2025-09-05  105  		}
65c648c037296d4 Nathan Lynch 2025-09-05  106  
65c648c037296d4 Nathan Lynch 2025-09-05  107  		new_idx = old_write_idx + enq_num;
65c648c037296d4 Nathan Lynch 2025-09-05  108  		if (new_idx - read_idx > ring_size) {
65c648c037296d4 Nathan Lynch 2025-09-05  109  			cpu_relax();
65c648c037296d4 Nathan Lynch 2025-09-05  110  			continue;  /* Not enough free entries, try again */
65c648c037296d4 Nathan Lynch 2025-09-05  111  		}
65c648c037296d4 Nathan Lynch 2025-09-05  112  
65c648c037296d4 Nathan Lynch 2025-09-05  113  		if (SDXI_MULTI_PRODUCER) {
65c648c037296d4 Nathan Lynch 2025-09-05  114  			/* Try to atomically update Write_Index. */
65c648c037296d4 Nathan Lynch 2025-09-05 @115  			bool success = cmpxchg(Write_Index,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
