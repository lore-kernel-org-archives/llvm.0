Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A11BDCF;
	Fri, 11 Jul 2025 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752192016; cv=none; b=KDsFajCuR4wl2UGcao/ZwuKjZn+ETEyNEVXRKODCmltjS+aqxyIpu2SNxqDJnFTqLdb1GDedGqfMNJ5OFDLV3Bd53M/euh9EGIPuEQjB5NJGcLHBeE/6U6KOwscsKWbeoGhysRt5+x16hWZyiV5ilgPngSmH0DAUBJ/3i+Vm9DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752192016; c=relaxed/simple;
	bh=b2b4cWg2djSkVTYjQ5f4Rk/HVmCESLdHPX2koHFh13M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAE+5CNE7Lr8pWtDsFUkQdkG2hAieRLoWWfiY33bDOuHM5IGeZudpqWpMihn9sUGnSOxmMlCTwli70/0MmsEh4uo2UaWEGsVHIYG/MIBGa+Bf8MS+4d9PlXCiGFJoX6W8zwKyyBa71V8xkNTZ1kWbn4SYbYrz6LjmZsJKEYaJkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjhJu9uv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjhJu9uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752192015; x=1783728015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2b4cWg2djSkVTYjQ5f4Rk/HVmCESLdHPX2koHFh13M=;
  b=cjhJu9uvXL/8Kug4cv0fnRP7EQC2luKHSraeWieb+lXpujX3KW3UPuHE
   8hhCC4jTRQXT9J5C/iMeaGYUocbIO95ZMPYhO2GlYCk2MEHMYvzbg+a6R
   FN17VZnQosuyRS5tylWn5GP5Umq2yRmyI4upXc8quxYzetCZN12giavjg
   vRJ4F7TPEYJ7sY9IpM4XNX/MgReqG5PxiDLJgEdC3cZN06xQDC4VTBRmF
   S+ANtU8rXeHAspnJoVrYv+Qeo9iqeDz8dce44mRKe8E0qpS5Y4jwC9u/G
   VYsmNRBulSVZ6xHCk6Q9TX6Pivqi64GvV6+IOP1Tl3eIW1B/jBZw6LKRZ
   Q==;
X-CSE-ConnectionGUID: YoAMwRJlRTSVzZWmkjXwDg==
X-CSE-MsgGUID: Siy8v1vaTSiKMqlgwHaP7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65186191"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65186191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 17:00:14 -0700
X-CSE-ConnectionGUID: 7zMcqflwQvSe3hZZzeC0sA==
X-CSE-MsgGUID: 1MtURMLPR1ypAcLH3oCXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="156784220"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2025 17:00:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua1BS-0005bo-1t;
	Fri, 11 Jul 2025 00:00:10 +0000
Date: Fri, 11 Jul 2025 07:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tor Vic <torvic9@mailbox.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: vmlinux.o: warning: objtool: fat_ioctl_filldir+0x72c: stack state
 mismatch: cfa1=4+168 cfa2=4+160
Message-ID: <202507110734.nbN9j4St-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc9ff192a6c940d9a26e21a0a82f2667067aaf5f
commit: ea1dcca1de129dfdf145338a868648bc0e24717c x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to locally optimize the kernel with '-march=native'
date:   4 months ago
config: x86_64-buildonly-randconfig-003-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110734.nbN9j4St-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110734.nbN9j4St-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110734.nbN9j4St-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x1e8: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: fat_ioctl_filldir+0x72c: stack state mismatch: cfa1=4+168 cfa2=4+160
   vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch+0xde: call to __msan_memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf3: call to __msan_memset() with UACCESS enabled
   vmlinux.o: warning: objtool: .text.aw_dev_dsp_update_cfg: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
