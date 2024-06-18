Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24490FC18;
	Tue, 18 Jun 2024 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718688277; cv=none; b=BdEob6188QtXTh0+6GrhfTFH/zNPXECrp1iYUO3YnkDnnrZE08bu6WpmlG6WuYYo8TzXzTZIPmKwpM8AzweSqe2ht4hB0bc9Sy7v/oxSMPhUKgM32UECWMYnjY3cPh2kM0rCqpHAmxsxtPOFChaLRNqYcr7vKAMh0zi/KAjxJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718688277; c=relaxed/simple;
	bh=kg1RYikNFkHadMFmy0XjM76udcOABVV2v3RHzhvzrpo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FAWUkMbgJOhv5wRJMJbju5i450SbHixuD1tJHrnpHRJnU4dYiqku4C+ptLIQXzw13p5qqQQlnyUecpBBxsN8jnue8K8iL93zxSgmPNNXFay5yaSEyiVDK4hm2gsllEOHO20I/YU3eqWk2OcCgwdac9uKXqAQOmj+vcVPDnJ5TGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaaQDBPk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaaQDBPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718688277; x=1750224277;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kg1RYikNFkHadMFmy0XjM76udcOABVV2v3RHzhvzrpo=;
  b=DaaQDBPkVnN2piu8yhd4Nsh5q9qncOCGUbLNN2Eksi/2Vi4JSYd/NPZ0
   8mpFKLACx90WjRpZRUHIl3li0zVU4yLhFPop5fmz1EMK9X2T82UQ49t7J
   a9lgQPjd8Jfnahyd2ryvX1oJ4c3bfOpCGvERwfJrlY/WID9Fueo2x7FbB
   NRoyKDfb/IIrgdaSsv3WpC4yDlr1gsc4E5+XZ9vOLsuyvbkoUqmdsdxIA
   WVNWWSyp5coJ+UlTWb/SfiPV/LkyV0HBvReGEFIrQpYl40wJBX0OTcS8R
   zLWmN1GuY9JNVeHUqKB2a3GUInpfF8YyCFmPicUQlwD0HHGUvoyarl24p
   Q==;
X-CSE-ConnectionGUID: vJODe8FaQFeemH7zBbyEog==
X-CSE-MsgGUID: 4pIAVz6ERQ6bJpmDAfpDKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38064844"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="38064844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 22:24:36 -0700
X-CSE-ConnectionGUID: V1iRi19AQHa4Xn2prR7T5A==
X-CSE-MsgGUID: j0CA044cQJClmMkUu+/0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="41512984"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2024 22:24:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJRKa-0005Ed-1E;
	Tue, 18 Jun 2024 05:24:32 +0000
Date: Tue, 18 Jun 2024 13:23:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [cel:nfsd-5.10.y 194/770] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x412):
 relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202406181300.fyX9NQCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Christoph Hellwig <hch@lst.de>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Miroslav Benes <mbenes@suse.cz>
CC: Jessica Yu <jeyu@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.10.y
head:   297ad218672e7f8d6e1f6af048c42a42760f56b1
commit: 82d2e07ec0e29721d03501edea4219bdfb20e314 [194/770] kallsyms: only build {,module_}kallsyms_on_each_symbol when required
config: riscv-randconfig-002-20240618 (https://download.01.org/0day-ci/archive/20240618/202406181300.fyX9NQCQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181300.fyX9NQCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181300.fyX9NQCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x412): relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c:81 (kernel/kallsyms.c:81)
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x448): relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c:81 (kernel/kallsyms.c:81)
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x450): relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c:81 (kernel/kallsyms.c:81)
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_attrs: .text+0x4fe): relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c:85 (kernel/kallsyms.c:85)
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_attrs: .text+0x50c): relocation R_RISCV_PCREL_HI20 out of range: 33553758 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c:85 (kernel/kallsyms.c:85)
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
