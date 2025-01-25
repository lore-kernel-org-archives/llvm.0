Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC31FAC50;
	Sat, 25 Jan 2025 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737769141; cv=none; b=gvOUYb5zOHYx2AAYD/6i4QJt/Yg67nnRyHXTTEb5yWnascBOqefgOZpb0FpE0nYh55V5tXwNuc3MRQGY+yHSU5R0/0BjyfQP4IKcvMWSaVeqfYq2TqnDcTe6mAz2vWL7BdXrOPNBDkz4YuM9uDH6qamUPSoxf9sZSkRFCZKB+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737769141; c=relaxed/simple;
	bh=7FbQ+zImABYAz8a9adEJ0lTrG2jkVR3v2NK6FtnBSuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcffO1zlS/U0v9TQC8ALAmqXJr+2ejoxo+WcRjjZWJCPw1eYuBolNjm2n/hepsTygH+SaxzP3wUCyPGQlo1kPSyo4fdQhcav5KmHCRUlsJu8/AziNLasXGW7e9ZaWvlpDBXCNP4Tqv+idaWq+RtWTxm9QVZn2xTNkEYXjByAK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItPvtjLw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItPvtjLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737769139; x=1769305139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FbQ+zImABYAz8a9adEJ0lTrG2jkVR3v2NK6FtnBSuM=;
  b=ItPvtjLwK71jh9EWl+EFTDKGveXlTi5LVnkRkrUwOr8YbbnJ5+AUHa9d
   2JBE5Xn3kuYyFYYb/huVDJf7IFFwZ/WoImDQatZhNH/GYb8a4X6Qy0dil
   JNj75sIUMbcQjilB/xrxfUV0e//UPZTOVQlSdtTeH9cujeLyJH/WqXDmh
   da0l/XJwEtJejTTjCqQ5hgYqEY8wRzq9IpK/ooGah1twfFhFc38iTIDDO
   NKTGalyi0qMWdkoudPNZp3ljfr3qOxJJ1z7d7REBM5bnnr9k0MEoOXUkC
   eQ1+3dku/ABWPwKaJJx4i3vYc5Gp7HL4Kh94IoIhJXs8GFHKeqZbAE1yu
   w==;
X-CSE-ConnectionGUID: fJ7ymOY4RIKqWVbJHv98Zw==
X-CSE-MsgGUID: guFSNLttQwK/71WFczh9YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38568956"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="38568956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 17:38:59 -0800
X-CSE-ConnectionGUID: a8Oi7h/QRo6mgoaCK9OoTA==
X-CSE-MsgGUID: iEoH1kYKT2uux8AMBGQ65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="108458167"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2025 17:38:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbV8R-000dM7-2B;
	Sat, 25 Jan 2025 01:38:55 +0000
Date: Sat, 25 Jan 2025 09:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug-6 5/7] arch/x86/kernel/early_printk.c:148:3:
 error: use of undeclared identifier 'kexec_debug_8250_port'
Message-ID: <202501250944.JEBhawoz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug-6
head:   145ae55a8834381a4011861d8607cb4c0f9cf88e
commit: 3d8ea5d45b0a2079e58cd0c72e0a1ac28fd431ca [5/7] x86/kexec: Add 8250 serial port output
config: x86_64-randconfig-076-20250124 (https://download.01.org/0day-ci/archive/20250125/202501250944.JEBhawoz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250944.JEBhawoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250944.JEBhawoz-lkp@intel.com/

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
