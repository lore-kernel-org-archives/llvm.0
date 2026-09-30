Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C14F85CF;
	Wed, 30 Sep 2026 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773926; cv=none; b=Jwwcn/9yuQHHpjeaDjlUYuBnBSAvbR6jVU7Ud5cCzuYnYqcftvkqsnssfjCYIa3EZlzQ/ZXl0WJF8e+tM6/ZyklRgKJWIwbSndObWX8JMoUYijyufC2BRGxNnpn4Af77OKY44l373rmmxckJkQGhcZxYqqf3CsvfG/zYXSXuk2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773926; c=relaxed/simple;
	bh=wpNwxAGbJkC0OKnsLsCvsD3GNUnv3xius84j+KIy5b8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b7ELNclJ6N8o9QgB+xKUK1cgbojgNcpj8EzfPcfmxWDra4snEccTazoVv/JWbKl6aN2i/f1om4fWbCl8kVd1cQVXKg13XzxLzXz6VVtdrNlh8cshEVLyR75oD8LSRdXIJ9rkkuYGxLX69Y1ydsGF60gi20V0vn9hE7+8Fz1ViQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYaeF+pe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYaeF+pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790773907; x=1822309907;
  h=date:from:to:cc:subject:message-id;
  bh=wpNwxAGbJkC0OKnsLsCvsD3GNUnv3xius84j+KIy5b8=;
  b=ZYaeF+perzhmmf8KgIerOhkNzwGsHz9yA7i6fAASMb1K0TZUnym8q36F
   czhT+REoj4LDHdlvfqjnPghAEf46sfZpf6KNw5cZ34vWejHNR5zm614UF
   yJMi6JRb12Gzxc/zC2785W4JdRvJLL14c1zdKVtlJxZgQC5VMmKVp7dwj
   lqTNJ7/StFcbeIVSeIVIQNdTkFEpFXQCQmLI1LuUue5iDlxAlI9sqSsdH
   sSL9UyrQ7ohULE3duXXRuLCCdmNdIfkkeOv55egOZtHsQsaSD2q/UGqXB
   UT+MT7lxV38Py7QtwSj2viVKyA/H+mFFgWtyny7N9dlSLJP//fe22euho
   Q==;
X-CSE-ConnectionGUID: Z5HHLL5zQXy8HTcjjIitfg==
X-CSE-MsgGUID: KpYb/8FbSi+I0oLrWU9z+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95320200"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="95320200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:11:43 -0700
X-CSE-ConnectionGUID: DW/PPe1ARpOD3UpM0KzZyg==
X-CSE-MsgGUID: Q+by5NFMQri2avqwYwSDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="280436134"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2026 06:11:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBu5z-00000000Qej-1LFb;
	Wed, 30 Sep 2026 13:11:39 +0000
Date: Wed, 30 Sep 2026 21:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_mpxy_imp_v1 2/5] ld.lld: error: duplicate
 symbol: sbi_mpxy_read_attrs
Message-ID: <202609302048.lrMAmhfT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_mpxy_imp_v1
head:   ca441e957bb4806b528959ae80efb7e7a9f5447a
commit: 36c74ca9f1dd2278453c544310c73d45beb9c993 [2/5] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20260930/202609302048.lrMAmhfT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302048.lrMAmhfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302048.lrMAmhfT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: sbi_mpxy_read_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_read_attrs) in archive vmlinux.a
   >>> defined at cpu.c
   >>>            arch/riscv/kernel/cpu.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_write_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_write_attrs) in archive vmlinux.a
   >>> defined at cpu.c
   >>>            arch/riscv/kernel/cpu.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_get_notifications
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_get_notifications) in archive vmlinux.a
   >>> defined at cpufeature.c
   >>>            arch/riscv/kernel/cpufeature.o:(.text+0x100) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_read_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_read_attrs) in archive vmlinux.a
   >>> defined at irq.c
   >>>            arch/riscv/kernel/irq.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_write_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_write_attrs) in archive vmlinux.a
   >>> defined at irq.c
   >>>            arch/riscv/kernel/irq.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_send_message_with_resp
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_send_message_with_resp) in archive vmlinux.a
   >>> defined at irq.c
   >>>            arch/riscv/kernel/irq.o:(.text+0x80) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_write_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_write_attrs) in archive vmlinux.a
   >>> defined at cacheflush.c
   >>>            arch/riscv/mm/cacheflush.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_read_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_read_attrs) in archive vmlinux.a
   >>> defined at traps_misaligned.c
   >>>            arch/riscv/kernel/traps_misaligned.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_write_attrs
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_write_attrs) in archive vmlinux.a
   >>> defined at traps_misaligned.c
   >>>            arch/riscv/kernel/traps_misaligned.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_send_message_with_resp
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_send_message_with_resp) in archive vmlinux.a
   >>> defined at traps_misaligned.c
   >>>            arch/riscv/kernel/traps_misaligned.o:(.text+0x80) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sbi_mpxy_send_message_without_resp
   >>> defined at alternative.c
   >>>            arch/riscv/kernel/alternative.o:(sbi_mpxy_send_message_without_resp) in archive vmlinux.a
   >>> defined at traps_misaligned.c
   >>>            arch/riscv/kernel/traps_misaligned.o:(.text+0xc0) in archive vmlinux.a
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
