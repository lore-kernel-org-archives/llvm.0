Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56822F74E;
	Wed,  2 Jul 2025 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466026; cv=none; b=j3Rkzvow14T3kgYg4Lh3ztV40tgq1/MhWZAKRTThLXbaLd5G7yPgE/yAraONK/YFh0omgnCntIrZxyOy9XK5+l1WOQaqXwrmnGOAdb7djvyx40Rv2yz3beWm5Zi3qzZSQGTa/iR5JF/k2rXNudiFA9NxI94qd5hLyQDV4Vsv+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466026; c=relaxed/simple;
	bh=fUjjmNwNu+I918GyCW7ZLvqGnEQsJGFlLj4tLWza9Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ax7ImOfShcQzIrHvvpL4jZgG/R8aMTLM5F3KLTUPkHrDvhesvRc5y1DFlkC4NuKUYJMdHdruYN9FGdoDhbS5VahjpSPWE2hnqY+08QtNLZTng2b2J15GfOMxVzxmGJohcgmA9l6+1utMAgKtxOXSKEYkYdyhjNw6QrP7Fzl7cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WolByMn8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WolByMn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751466024; x=1783002024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUjjmNwNu+I918GyCW7ZLvqGnEQsJGFlLj4tLWza9Zk=;
  b=WolByMn8zigsgAUBLxkH55ZMmVPmQuW6jpImZArWud82CWEM/qrVFEWi
   sNMLihvJh9ouurE1tvD06G/bIoP053RitfzxfwwWp31RBKwGQ4NJuJHZZ
   A9C61YzLEoe6awJd+a/t2CV/rUjWRtWpxaxFoNzfA3OzAY3HZaVi2f2Oz
   z8AMRuC9zOP6hWaSgDjQaxtH6P7lW5eOhAAO+X6ozUanfsUWPAdamnpth
   L6uHPPq/bKyezm3Gty16XWEBWRtG7K4RsoficokMT3KinsvBOY5AXpz+j
   7r2xx2gG5HYVQXgGx8zSDnltnbWUc0rDzJ45h0WulvjPL8b0WAYgn6Kws
   A==;
X-CSE-ConnectionGUID: +ENibMrZSJ2s2r2Rp4Eg7g==
X-CSE-MsgGUID: 4VMJY9i6SOWsyCma4erQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64811959"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64811959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:20:23 -0700
X-CSE-ConnectionGUID: D0EEC0aASAeo7dKqHseC+A==
X-CSE-MsgGUID: YT9KZdJySLCN713sTeb9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154162229"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2025 07:20:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWyJv-0000jT-38;
	Wed, 02 Jul 2025 14:20:19 +0000
Date: Wed, 2 Jul 2025 22:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5977/6007] drivers/pinctrl/pinctrl-k210.c:600:6:
 error: unexpected token
Message-ID: <202507022208.BF3SgKv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50c8770a42faf8b1c7abe93e7c114337f580a97d
commit: 31624295f28fd44d1cae16144caf8ada5e9b189a [5977/6007] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507022208.BF3SgKv5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022208.BF3SgKv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022208.BF3SgKv5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-k210.c:600:6: error: unexpected token
     600 |         if (WARN_ON(pin >= K210_NPINS))
         |             ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:22:1: note: expanded from here
      22 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/pinctrl/pinctrl-k210.c\"; .popsection; .long 10002b - .; .short 600; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/pinctrl/pinctrl-k210.c"; .popsection; .long 10002b - .; .short 600; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   1 error generated.


vim +600 drivers/pinctrl/pinctrl-k210.c

d4c34d09ab03e1 Damien Le Moal 2021-01-12  593  
d4c34d09ab03e1 Damien Le Moal 2021-01-12  594  static int k210_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
d4c34d09ab03e1 Damien Le Moal 2021-01-12  595  			    unsigned long *configs, unsigned int num_configs)
d4c34d09ab03e1 Damien Le Moal 2021-01-12  596  {
d4c34d09ab03e1 Damien Le Moal 2021-01-12  597  	unsigned int param, arg;
d4c34d09ab03e1 Damien Le Moal 2021-01-12  598  	int i, ret;
d4c34d09ab03e1 Damien Le Moal 2021-01-12  599  
d4c34d09ab03e1 Damien Le Moal 2021-01-12 @600  	if (WARN_ON(pin >= K210_NPINS))
d4c34d09ab03e1 Damien Le Moal 2021-01-12  601  		return -EINVAL;
d4c34d09ab03e1 Damien Le Moal 2021-01-12  602  
d4c34d09ab03e1 Damien Le Moal 2021-01-12  603  	for (i = 0; i < num_configs; i++) {
d4c34d09ab03e1 Damien Le Moal 2021-01-12  604  		param = pinconf_to_config_param(configs[i]);
d4c34d09ab03e1 Damien Le Moal 2021-01-12  605  		arg = pinconf_to_config_argument(configs[i]);
d4c34d09ab03e1 Damien Le Moal 2021-01-12  606  		ret = k210_pinconf_set_param(pctldev, pin, param, arg);
d4c34d09ab03e1 Damien Le Moal 2021-01-12  607  		if (ret)
d4c34d09ab03e1 Damien Le Moal 2021-01-12  608  			return ret;
d4c34d09ab03e1 Damien Le Moal 2021-01-12  609  	}
d4c34d09ab03e1 Damien Le Moal 2021-01-12  610  
d4c34d09ab03e1 Damien Le Moal 2021-01-12  611  	return 0;
d4c34d09ab03e1 Damien Le Moal 2021-01-12  612  }
d4c34d09ab03e1 Damien Le Moal 2021-01-12  613  

:::::: The code at line 600 was first introduced by commit
:::::: d4c34d09ab03e1e631fe195ddf35365a1273be9c pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
