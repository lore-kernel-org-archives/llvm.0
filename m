Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244432E6CBF;
	Thu, 20 Nov 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639466; cv=none; b=RJU2zOLYFHVoSfkr1kte894fGOJJEC9yz8NA2IwU2KgQqo0JHfwP/CWYx1TnBNlHotXnbThar0lTF+1WU6PrehVYGj6LokDKDox4p/J6AgBsVUVDnfH/rtw+omadWsisZItpXRmOeLhIQV7zdRq1y+tv92hFcM0fg3Yyy0h7dd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639466; c=relaxed/simple;
	bh=p1f8YKagYJCWOUcA2258jSo+hezfJAzVSLlwkXF1AIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQF9p+WAzUOlcTTcwUx1Zkg8FKHnQOAZKtL/RyB+VLOBq0tKwPNEoBHXm4SZCxR5mF7vEHBR6uLIa0ce/LsDQ6forORq7nfKZJi/rdKFZxjMnmXI3NDaFBOOTi1UGAH43xS/PYNUxNed2OvprmPBqnw2vO9fovEtRwNtbn13LsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bknGhzl6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bknGhzl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763639464; x=1795175464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1f8YKagYJCWOUcA2258jSo+hezfJAzVSLlwkXF1AIA=;
  b=bknGhzl6iVqPjcYT9R5g9BhgWhmwymDPIJ+vhm1SlJVZxb8dVV87TJkd
   jETSlQf5Sk5mLP4QMoTB+iMmPUB4GVOj5f4Ufc1DTnz2sHtDKxcvlo0kd
   ai04yh1ZlBV3giuNa+mwIadIveR8vSiu976UrdcKDTzSb3Kn15/9bdFgi
   EsaZhc2lxjiTF3EOEAaszz3yToIKy0kTNx/yruNwCDIy/8rFeSdpnjLYu
   DllNc9nrBY2/lsqcK0qC/tOhyYBxL3IseDBsX+dkZENThAtByozqb6RIK
   5CACUMwpSNN6mRVJp5wtaAYYv9lQctmnXinVU3KKzbCQZiIJyfUluc6au
   Q==;
X-CSE-ConnectionGUID: qZamFHq6Qr6VDCa6Ukd0rg==
X-CSE-MsgGUID: 2UZf9XlWQFeNa5EteYzIZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83093131"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="83093131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 03:51:03 -0800
X-CSE-ConnectionGUID: kGbSPuDUR0S3WMHwM2pCUw==
X-CSE-MsgGUID: f8dTIGf1SLqVguH6md2cGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="192142354"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Nov 2025 03:51:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM3Bk-0003wF-0v;
	Thu, 20 Nov 2025 11:51:00 +0000
Date: Thu, 20 Nov 2025 19:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/8] uprobe/x86: Add support to emulate mov reg,reg
 instructions
Message-ID: <202511201932.iuDaTkGE-lkp@intel.com>
References: <20251117124057.687384-4-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117124057.687384-4-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on bpf-next/net bpf-next/master bpf/master linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/uprobe-x86-Introduce-struct-arch_uprobe_xol-object/20251117-205911
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251117124057.687384-4-jolsa%40kernel.org
patch subject: [RFC PATCH 3/8] uprobe/x86: Add support to emulate mov reg,reg instructions
config: x86_64-buildonly-randconfig-6003-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201932.iuDaTkGE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201932.iuDaTkGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201932.iuDaTkGE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1600:39: error: too few arguments to function call, expected 2, have 1
    1600 |         off_src = insn_get_modrm_reg_off(insn);
         |                   ~~~~~~~~~~~~~~~~~~~~~~     ^
   arch/x86/include/asm/insn-eval.h:23:5: note: 'insn_get_modrm_reg_off' declared here
      23 | int insn_get_modrm_reg_off(struct insn *insn, struct pt_regs *regs);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1603:38: error: too few arguments to function call, expected 2, have 1
    1603 |         off_dst = insn_get_modrm_rm_off(insn);
         |                   ~~~~~~~~~~~~~~~~~~~~~     ^
   arch/x86/include/asm/insn-eval.h:22:5: note: 'insn_get_modrm_rm_off' declared here
      22 | int insn_get_modrm_rm_off(struct insn *insn, struct pt_regs *regs);
         |     ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1600 arch/x86/kernel/uprobes.c

  1580	
  1581	#ifdef CONFIG_X86_64
  1582	/* Returns -ENOSYS if mov_xol_ops doesn't handle this insn */
  1583	static int mov_setup_xol_ops(struct arch_uprobe_xol *xol, struct insn *insn)
  1584	{
  1585		u8 opc1 = OPCODE1(insn);
  1586		int off_src, off_dst;
  1587	
  1588		/* validate opcode */
  1589		if (opc1 != 0x89)
  1590			return -ENOSYS;
  1591		if (insn->rex_prefix.nbytes != 1 ||
  1592		    insn->rex_prefix.bytes[0] != 0x48)
  1593			return -ENOSYS;
  1594	
  1595		/* only register operands */
  1596		if (X86_MODRM_MOD(insn->modrm.value) != 3)
  1597			return -ENOSYS;
  1598	
  1599		/* get registers offset */
> 1600		off_src = insn_get_modrm_reg_off(insn);
  1601		if (off_src < 0)
  1602			return off_src;
  1603		off_dst = insn_get_modrm_rm_off(insn);
  1604		if (off_dst < 0)
  1605			return off_dst;
  1606	
  1607		xol->mov.src = off_src;
  1608		xol->mov.dst = off_dst;
  1609		xol->mov.ilen = insn->length;
  1610		xol->ops = &mov_xol_ops;
  1611		return 0;
  1612	}
  1613	#else
  1614	static int mov_setup_xol_ops(struct arch_uprobe_xol *xol, struct insn *insn)
  1615	{
  1616		return -ENOSYS;
  1617	}
  1618	#endif
  1619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
