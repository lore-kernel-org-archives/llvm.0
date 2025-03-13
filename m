Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1251F3B91;
	Thu, 13 Mar 2025 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741889523; cv=none; b=dUGME0SVZNTTSDwMo9VIrEsV4t0KiV/Gms+6BLSm9XIjjE0zotnG5GffrP+cTdPhVarcvh5RDlU+RwE2JU4kcSZeaienn/RgUTc9cmp/EQl9W0aAolJa+ET0Ee1o6utMQDOB+iNVAsU9u8ZNvMLhYpVmNypEVpnpHTY4JICsIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741889523; c=relaxed/simple;
	bh=a/n5TVHgKG0dOJU3nx1VX2LJ+70y4FSPoziu9PZN35Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+XY18m8DOtigMdO1+ZVcK0efnvolRtVZ+ffkbNm8VVFbGJLuoJWnOcGztxDWF7huA+nIpa8hAsoCI5fLiTubE8MJ919Qgq/EWB3SP1j/q3AM/OUp/j+h61XSeM0BgDvWaLNXjxG5bA44W0j359FeuHlie0CrTDNR9kWZ4atgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz02XWJB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz02XWJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741889522; x=1773425522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/n5TVHgKG0dOJU3nx1VX2LJ+70y4FSPoziu9PZN35Q=;
  b=cz02XWJB1s64JKOG/GGZvD9nsL3qaD4egheYZYepehR4I6Y3HxVMZKga
   9h/1a0uO///msksXRNBX74ueEJUbwK0q26AvHdFAtrgBNJ7hhB/v8Hf7N
   lWK6T5SGN/ThV5+dWoeRIT4dAJmEszSriz40a/n2Js8O1D8DtNfufE8+R
   0VVCVf1KchSHbCImbyWQSFm7yn+JGpJGI0wiHY9FT1NWleWotYKgNkGeT
   MvQUIQ1hk9SWoPzXf7WrhDqTNQuVAayGYkiYdXtsO8FmeZoTx+lzp5c6r
   Jv6kDpaJKcpOG9g2bhXyEhXj6RFxe8R5t3mhupX2PK18iAAs66SspI3GP
   w==;
X-CSE-ConnectionGUID: Wc4Rob3PTi+ce5FAkuzmDQ==
X-CSE-MsgGUID: 89sSdJs7RayJIvRQOrYdqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46924448"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="46924448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 11:12:01 -0700
X-CSE-ConnectionGUID: SfOOpD0VRIWTi4mq6PFSsw==
X-CSE-MsgGUID: 5LokG3CYRrG7oBh7Yk7+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="125916064"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Mar 2025 11:12:00 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsn2D-0009kC-2i;
	Thu, 13 Mar 2025 18:11:57 +0000
Date: Fri, 14 Mar 2025 02:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug-7 4/8] arch/x86/kernel/early_printk.c:148:17:
 error: 'kexec_debug_8250_port' undeclared
Message-ID: <202503140119.nsQQvdsr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug-7
head:   6d691abbf75379a981e41eee850d964d5ebb94c8
commit: d06df8671875384784c4dcb881dea831b3520f08 [4/8] x86/kexec: Add 8250 serial port output
config: i386-randconfig-002-20250313 (https://download.01.org/0day-ci/archive/20250314/202503140119.nsQQvdsr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140119.nsQQvdsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140119.nsQQvdsr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/early_printk.c: In function 'early_serial_hw_init':
>> arch/x86/kernel/early_printk.c:148:17: error: 'kexec_debug_8250_port' undeclared (first use in this function)
     148 |                 kexec_debug_8250_port = early_serial_base;
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:148:17: note: each undeclared identifier is reported only once for each function it appears in


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
   146	#ifdef CONFIG_KEXEC_CORE
   147		if (serial_in == io_serial_in)
 > 148			kexec_debug_8250_port = early_serial_base;
   149	#endif
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
