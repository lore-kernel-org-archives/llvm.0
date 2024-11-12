Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434D201023;
	Tue, 12 Nov 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423741; cv=none; b=KF0JCIurdsNGo5OYx/CUCFUYww4TxvaXqVLF2eP3+q5ancM+VRMQEMy8UBsRBANju7+A9bN8QigmtCf9TqtTI8T+W5Z7omyTtg1VeWOGy+xGVp6kRM/k5JP0Tyl6pw+8Gx7pcKTEEAt8UhQn8UdX56LnwIq7LatpSYaO1pm3ZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423741; c=relaxed/simple;
	bh=LCokbYw/7s9ukfBNYLEMgQ2OE1Se3GV7PwY/SYYCRwE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VFTVixzV0bngjSeBV1HynmDveZKCng0snM7P6/JKAqxDxWSvvZqdCslR2JBsMQT8yJhV7T9HwKkkogjzkXZQeRL5x6Sc9cbSUWnOVlDT5gMj2BmsI1r1UeP2tukOrF9id9jxdq6g4mthXdh6adZDP1NeqQc74G8eFoZev/fJmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7bHo7gR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7bHo7gR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731423741; x=1762959741;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LCokbYw/7s9ukfBNYLEMgQ2OE1Se3GV7PwY/SYYCRwE=;
  b=V7bHo7gRl0pb7kKTMgH6kWNfRc5L4Gokyl0npQzz9Lmz6BeWB3SYMTIV
   uT4tW6c2R6pOLT7ZddhWc49WwlKQn1YQLpeM9lsNk2FTxEZaQq3xT+ZIG
   W32SK+XgFdJPEO51A5FkCxIgFPF3gUebx52tD/QioPWp5paWJeMGn6hQ4
   jswg8PWIu9gGsJvCrpW8AfaInBzH2efiRsHK0aWIqxKuH5fKV83VL3ib3
   kUMEnxkn12drpQDudXrtYRwcTPywlZYRGhs9okyiVvWRRXCpB58Bnaq1l
   bJSaN5H99srWl0kOIfxe+pb4Os1kVHGya4aBBFALhZ/9vIZvnlxYLzSI6
   w==;
X-CSE-ConnectionGUID: 3BSXLvFDStu5GpZSqhDTnA==
X-CSE-MsgGUID: awIRrl7kS0qtKVmNcJxZGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31115765"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31115765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:02:20 -0800
X-CSE-ConnectionGUID: pfXbU8ZSR+GFzBOg2BGXeg==
X-CSE-MsgGUID: a0j30aXuQty5444SCzNuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87623461"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2024 07:02:18 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAsPI-0001Rs-2J;
	Tue, 12 Nov 2024 15:02:16 +0000
Date: Tue, 12 Nov 2024 23:02:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [dwmw2:kexec-debug 9/9] vmlinux.o: warning: objtool: pr_nybble+0xe:
 RET before UNTRAIN
Message-ID: <202411122239.LxvpNmxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: David Woodhouse <dwmw@amazon.co.uk>

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   2b3693312ccb50042f84abbf2daa041b925a803f
commit: 2b3693312ccb50042f84abbf2daa041b925a803f [9/9] [DO NOT MERGE] x86/kexec: enable DEBUG
config: x86_64-randconfig-006-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122239.LxvpNmxd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122239.LxvpNmxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122239.LxvpNmxd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: pr_nybble+0xe: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
