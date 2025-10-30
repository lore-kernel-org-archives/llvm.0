Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70C33C50C;
	Thu, 30 Oct 2025 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824319; cv=none; b=CCPPyuTwQEoxX+5YLcvG0opSmeVcSHbw41J0Sa2tf2/FEHfud3+jWTe4cEYsiGo3vtptHT89zSZ7BNsrGz46I1xG4ULxtw+NHcyFpyweF8KERC1hQHj3XPyJVT5Q0mHtRGiTI7GOe8yFltVWJ6ZqjBYKC2mjVofvhroi8Xow/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824319; c=relaxed/simple;
	bh=1BFjASO6lWeplG7fU2l90+LJhwTZ4xkyoNGVfZ0WcFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBWcGf0NKFvOumn859+/PLX/ZgFEsHS3hP+cuW2bYAg79Ot4bIH42fdkt/4iZcPH19PlUndXc1KJlNWTzy6+2LcvW6YTQxiLs/GueAVPjx0HKkBMFjDbkaxKg0oq/ODN0KaZyOt5L6dMmJwJG36jmMgQLvW8+Lcr38nXV5y+cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gle82EjA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gle82EjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761824318; x=1793360318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1BFjASO6lWeplG7fU2l90+LJhwTZ4xkyoNGVfZ0WcFc=;
  b=gle82EjAnRxvJni5LMrKCAmocyBH/g9xn5n+JdDfaa+BqRX/mhO9mqEN
   JbjmFSvf2rZQwjThNeXuzqYhrFcrdqXvT4ChJGLtlXLcZDoFe+hm8pDuc
   As+RuaGOtUhgnnzCt5G5viACeiIzT7qgyaXXp31ywoPr0MmgBxVIWtZqc
   cr7dmR4Bmm+5w4cn6pWzs0+635Rxs7wcNbQQWVULK8CAFeIaQ3gXSvvQf
   uapzg+rtfTr1cH9O2U+9bHNChI+ogDzbx/H8m7aFtllVPxfZXwSVXwoHs
   zek8nUPU8lQasDA0JHT9EMQyOQfJZVnh93ReMPKDu71r7E5T4Urhxo9i9
   Q==;
X-CSE-ConnectionGUID: AAD8y+UQS22zS3FssJKGPg==
X-CSE-MsgGUID: XJ8h2XdXQkCaS+EjjK1vNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64002286"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="64002286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 04:38:05 -0700
X-CSE-ConnectionGUID: xk10YTX3TOKkvwSdM+ygSg==
X-CSE-MsgGUID: SvcyHLxkQQOsdDdZX9HV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="191070099"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2025 04:38:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEQyB-000LtE-1h;
	Thu, 30 Oct 2025 11:37:42 +0000
Date: Thu, 30 Oct 2025 19:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_sbi_sse_v5 30/33]
 ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined
Message-ID: <202510301931.p8D3cQIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v5
head:   4645b24f1a147b84c4eedf9179d20d1ddd00de2d
commit: ec9c229227152cd8c512ea718df1506b19d660cf [30/33] drivers: firmware: add riscv SSE support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251030/202510301931.p8D3cQIf-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301931.p8D3cQIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301931.p8D3cQIf-lkp@intel.com/

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
