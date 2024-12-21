Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A8A1799B;
	Sat, 21 Dec 2024 02:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734747945; cv=none; b=h3YtDLMGtTW9bK83WTIY50R5B7VsiWIkH/QA4TIgn0GmslCL1E35AslywpX1hoECyuJXCWPCG2eFa51C1qnTbhbeu2eM4xql/iSzV/U7CpJwk2MnqVlk0oO0r+xqo7LRWDRPlTn+sy+wzmnzVvfka09SfdC+saU+J8mboWCci6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734747945; c=relaxed/simple;
	bh=tmdiE/SVvZuxB1/JUwJ66drMyAL9a+fPWXQUPICsnkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJS9ua//QpC62L8/rQmWId9SNQR1l0oaTSQ5A6DrBE9+ZwkAmxhDoOFyirksfDE34Jb/tMWKxFE7jQW3TcjGi0146Tu/ZTC6qR+UU83iUR04hb2YIev7Cyjb83zR5Wgk/kbFl42UslDqbgvPg6kCD/fbjSCYzds4MEE+OaaqESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFjeJzrE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFjeJzrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734747944; x=1766283944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmdiE/SVvZuxB1/JUwJ66drMyAL9a+fPWXQUPICsnkM=;
  b=IFjeJzrE6u4qxTlkISyxIQ0pcT8XoSuu5tQ0xXIK2Me00FPgyp6ssatO
   SjjVY+GHTSGygvHqAuSPVOuo5Il2VK9n0RqQfW4Lv0+c5ctrsTwq+oy0o
   Wsn9N0a50E1bHTu0gJQvCKxNfR5ssJB2mFGga+9RwhIgUiQzpEN5hA9xl
   yQQLhgtZwwR2GE6lBa5pqc2HZfbrNJ7WksmKhhkFX81EzkF2QncM9VZuI
   dB7g6xQpSXmY3TRCuYYIYEP472hXMqG36e8tx3WsRrRt66OpzEo9Zj0PW
   KapjZU4cM2ZShdxjofmP88ZuooiHfWTlxXCdHNjeQdBmg7znYxcKkxEO1
   g==;
X-CSE-ConnectionGUID: tVuxnrumRKGWCQKaK3Bbqg==
X-CSE-MsgGUID: juehIjsRSWOAoGjivS4vfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35195177"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35195177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 18:25:43 -0800
X-CSE-ConnectionGUID: m2oxdaiaTjuGyiRCD1MRpg==
X-CSE-MsgGUID: o8yMT2HqQtuScEdUo+cXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98879974"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 18:25:42 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOpBT-0001rR-2b;
	Sat, 21 Dec 2024 02:25:39 +0000
Date: Sat, 21 Dec 2024 10:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 14/19] arch/x86/kernel/early_printk.c:148:3:
 error: use of undeclared identifier 'kexec_debug_8250_port'
Message-ID: <202412211010.SHYCapSs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   fb9fab65d35df319f262a75718987d66f83a088d
commit: 795b69a26ecdda37c76c71c1dffe41290f7611f8 [14/19] x86/kexec: Add 8250 serial port output
config: i386-randconfig-006-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211010.SHYCapSs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211010.SHYCapSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211010.SHYCapSs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/early_printk.c:4:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/early_printk.c:148:3: error: use of undeclared identifier 'kexec_debug_8250_port'
     148 |                 kexec_debug_8250_port = early_serial_base;
         |                 ^
   1 warning and 1 error generated.


vim +/kexec_debug_8250_port +148 arch/x86/kernel/early_printk.c

   130	
   131	static __init void early_serial_hw_init(unsigned divisor)
   132	{
   133		unsigned char c;
   134	
   135		serial_out(early_serial_base, LCR, 0x3);	/* 8n1 */
   136		serial_out(early_serial_base, IER, 0);	/* no interrupt */
   137		serial_out(early_serial_base, FCR, 0);	/* no fifo */
   138		serial_out(early_serial_base, MCR, 0x3);	/* DTR + RTS */
   139	
   140		c = serial_in(early_serial_base, LCR);
   141		serial_out(early_serial_base, LCR, c | DLAB);
   142		serial_out(early_serial_base, DLL, divisor & 0xff);
   143		serial_out(early_serial_base, DLH, (divisor >> 8) & 0xff);
   144		serial_out(early_serial_base, LCR, c & ~DLAB);
   145	
   146	#ifdef CONFIG_KEXEC_DEBUG
   147		if (serial_in == io_serial_in)
 > 148			kexec_debug_8250_port = early_serial_base;
   149	#endif
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
