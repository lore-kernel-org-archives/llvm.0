Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7C218A93C;
	Sat, 14 Jun 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749913683; cv=none; b=FvvfXxysa4K2qwNH0tLDQdIlyffgBwv8iHbFB3ut+HgIx9Lj4k4VnRInIWYW0U+oi9gZbnRwEee3bOg9VSDl6wHi16WvK7ZX8FqeNs7amTkE9HIfoSyF2yseR7SOvnrvSkBwiy2jPjKlY50vW7EglpX353+VJpntwrPsQRHC/ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749913683; c=relaxed/simple;
	bh=v8SG32LF2u8oHYWTwm1S0CCxNEcUm7SoUNgM/gUVAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ot3b0m6GqzfLPm1jRwD3jgla9FlanaxN4nlEVKT0f6/iZxYb1EbKE284bGWFWEoDgyB4yRRxiPSAfT/OMEr19Wm4G7Pn4yS/iBjGpgysBBjjiZrdCJrUqRl0nVjs2rCJk16OAKlR4g0AmMICfGIeXgSh7VsiuNhICdF7Bak2XsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qhu0wG6F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qhu0wG6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749913682; x=1781449682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8SG32LF2u8oHYWTwm1S0CCxNEcUm7SoUNgM/gUVAdM=;
  b=Qhu0wG6FcpyrLwnmrdnDQ7A7FlayxIGQOi+0mWjbt19AI1/TF82s915e
   P76iAc1Wypyy7dnHi2vW0yFxcwLIQJCF0diYGLdwHX0heF9VjFxQb1kpS
   X7Hmd9IcMpIH2LtABln3EAQCSHA6uBC0JnBlLY33JD5hOIZsA2JaxJ2T6
   IeSPqJhT9kp0r9pwSFNHnvfJLwB3m+M4k1KTzqWQeGlwtucVK8t4GBIcE
   2cLlMRHRByQDr+byj1nsVs5qUImSoCGiaUEtJzsWdccETwembxvmg0++J
   WsNIrNHVeNrQK+Fmt/rBs2kmG/VGfR9rK9ca1Ct2CH7NxWj8hQ6rNRSGw
   g==;
X-CSE-ConnectionGUID: W65XbVnhTLePWD734Fs5aA==
X-CSE-MsgGUID: UxIb9/hQTh6vzIj/6zFxJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="74641747"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="74641747"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 08:08:01 -0700
X-CSE-ConnectionGUID: oGL2gBNwTwGDMaxtMSGA9A==
X-CSE-MsgGUID: lRKEvEihTBe0lN2QLIb8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147970218"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2025 08:07:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQSU9-000Dbo-0g;
	Sat, 14 Jun 2025 15:07:57 +0000
Date: Sat, 14 Jun 2025 23:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_sbi_sse_v3 59/62]
 ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined
Message-ID: <202506142301.3ZHu7gSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   734e8651f598d3b6b6f4bc2493a47993a03ac695
commit: 24e4ef0e2ee0cb6adcb0fbcdcdd8fa9dfbf9f1f8 [59/62] drivers: firmware: add riscv SSE support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250614/202506142301.3ZHu7gSP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142301.3ZHu7gSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142301.3ZHu7gSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from samples/ftrace/ftrace-direct.c:7:
   In file included from arch/riscv/include/asm/asm-offsets.h:1:
>> ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined [-Wmacro-redefined]
   #define NR_CPUS 64 /* NR_CPUS */
           ^
   include/linux/threads.h:21:9: note: previous definition is here
   #define NR_CPUS         CONFIG_NR_CPUS
           ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
