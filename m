Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E92107;
	Sun, 20 Oct 2024 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729387453; cv=none; b=ABpBvMtPHnHE0hKhaD5/T+ojlp6gKegC2+JkcCivUwGnyHhFCaeigm2FelazTGKvRbC8gEkUsyIu2Gra6QrgNISTOmVGocHLyOPvsZxFE1nLSoq95HrtqixrMpCfpMbimBWguK7FLlDEbWRpFmzdy21ip6eazv0I7Xx2SmSjxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729387453; c=relaxed/simple;
	bh=80wYCNlnn8HZ+vn47bySEclsc/5vOzrrhU7T65FVjSM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nF7MOxOdwftTOtdQ8jicCwulsp4467JSJvLIic4WhW+llYc4DpON0b7ND6ZfIs3YRxnQcQN/3dVNR6/IqZGqV07ZOJ7hfrOzUTajKli0SohqkOQZ5fszRIGfiDj8e4xjviMQV/8Sqyhyr9eQaDQ+HrVDMuXEz/Ap4W+51lcP+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVVm+7bA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVVm+7bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729387451; x=1760923451;
  h=date:from:cc:subject:message-id:mime-version;
  bh=80wYCNlnn8HZ+vn47bySEclsc/5vOzrrhU7T65FVjSM=;
  b=jVVm+7bAwn+7l7PrzG23lY7COJVloBSfgGBdKy0UIlc/ekXzZuTXA0Ce
   BPO30T1wfA+iQ8zBX0PoZqknx0FQAqYYDUTJYiqI5Zuv1kfLSfwBmmd8s
   /oTlGNTdaQH3UmT1uNL9RM9Gl5XvSv985RubyLi1I8w/U1QuzfYB7C6jN
   dpCa+i5BCumwtbFVRDqQJVlATcIX3kHHsr4YsFEbsA1g+4LU1MuZ6dJpR
   TbrmJb7LhRvnLYRL7nRxop4yjLphZRVbZjg6rQ5x9MYqZKuQ1I99gNNDQ
   hX0UaqmH4vM6ZcrlFJhBcHHtZGFjcN6pJXxNqqE30PTIIH/fk4ALMvhWa
   Q==;
X-CSE-ConnectionGUID: U4+6GKVFSzGb2d7neojIMA==
X-CSE-MsgGUID: iCo+MoGaSd6R3oYlBd8AEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="31754107"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="31754107"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:24:10 -0700
X-CSE-ConnectionGUID: tlrmPKDHRGOM5vhP5SAezw==
X-CSE-MsgGUID: te1B8AEOQUiUpCA6J4RVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="78782569"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2024 18:24:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Kfv-000Pkb-1n;
	Sun, 20 Oct 2024 01:24:07 +0000
Date: Sun, 20 Oct 2024 09:23:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:objtool-jump-table-annotations-v3 3/9] vmlinux.o: warning:
 objtool: .text+0x3: unreachable instruction
Message-ID: <202410200918.miJX4gn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git objtool-jump-table-annotations-v3
head:   f9d0cfe1d2d90f5c65b29dec3adc01fb3b64a20e
commit: a23f44312feaa9f028f2dfb8318f1cf90c86144f [3/9] objtool: Deal with relative jump tables correctly
config: x86_64-buildonly-randconfig-006-20241020 (https://download.01.org/0day-ci/archive/20241020/202410200918.miJX4gn5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200918.miJX4gn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200918.miJX4gn5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x3: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x8: unreachable instruction
   vmlinux.o: warning: objtool: .text+0xc: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x13: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x1a: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x1f: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x26: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2b: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2d: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2f: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x31: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x33: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
