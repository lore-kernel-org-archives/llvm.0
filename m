Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA89EAD8;
	Sun,  3 Nov 2024 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730641351; cv=none; b=GQFP//8oX+7W8BIW3BPErtG4uJ+M/cCmDpZsbxfqyBDNgJLaVQBs/R3Cj/ehKWnFjIgOE1b7n8OWK8CTl0t9oobfiPk0i1ehJwIZ/7DdKcSi7M2mGn7QD4AniuiXi1KIc9oHKjfB/JTu8Tk4pLCdvU6IKA6nmvO9+Ilc3vpb8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730641351; c=relaxed/simple;
	bh=tJ7tJX1hCX5vgqyd4uA84/xO02M06ad5DOorPfKO43Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqx6W3sF0ZXVVO+2QraG/KmZ0b2LZMEhBjEo+B8bDC7Epv+BoZ9fzJdEv7pUvQEAiKmr6asOf+3fGWyiNe/nkUfYaGFWu2YkFo1oQ1g3xxS7dJ/95VDk5sugmabEhQzolFt3jf3XErRp13UshYEf3HzmrSUMzgaUgVzkw3lh6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfH0i/qk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfH0i/qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730641349; x=1762177349;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tJ7tJX1hCX5vgqyd4uA84/xO02M06ad5DOorPfKO43Y=;
  b=gfH0i/qkXbTKLa/xnaJOM2h52pKOizc2oVFI4z8PempDTvTET4ubOLzg
   LCoCmOFnB9IyP02c0K8WyNY9NvuY/yimSWSDZq/CggaNIYvccT3S1qwg9
   bK7miNWuYrg9GHXlxiuuICMhCi9s4Zb37yTAom1VV03cI8SvHpsTZwjBw
   CDBJZkuXpuwnT8bKs8/BIvNQ7LiIogRzJV0Oe55fZCllUnz4navKAhpMb
   WleQ+sEz1QGLWosrLVdSqpAjvTTqJcdz1A+XxYrM2PXb5xXFupYXrbPz1
   icH1nempnZ9AuAa6P3hkjcjXNwz5QHGmvUtvqZUFz5/+Dr/eBwzZFzFEd
   g==;
X-CSE-ConnectionGUID: gfDitEMYRP6/M7F6Gjr/2Q==
X-CSE-MsgGUID: FLkWQDgmQiKVutc2QwwYgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29764974"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="29764974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 05:42:28 -0800
X-CSE-ConnectionGUID: aoDWrpwZRySl5EjHhjuQug==
X-CSE-MsgGUID: VEr63UCGSOyuULu6mITohw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83330419"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Nov 2024 05:42:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7as5-000jyP-0o;
	Sun, 03 Nov 2024 13:42:25 +0000
Date: Sun, 3 Nov 2024 21:41:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [dwmw2:kexec-debug 7/7] arch/x86/kernel/relocate_kernel_64.o:
 warning: objtool: relocate_range+0x2f9: unreachable instruction
Message-ID: <202411032106.qYUkz2pQ-lkp@intel.com>
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
head:   323ac978117ad1c540de0414282f8aad6c1f10a5
commit: 323ac978117ad1c540de0414282f8aad6c1f10a5 [7/7] [DO NOT MERGE] x86/kexec: enable DEBUG
config: x86_64-buildonly-randconfig-003-20241103 (https://download.01.org/0day-ci/archive/20241103/202411032106.qYUkz2pQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411032106.qYUkz2pQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411032106.qYUkz2pQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x2f9: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x308: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x50f: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x510: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x512: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x514: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x516: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x518: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x51a: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x51c: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x523: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x529: unreachable instruction
   arch/x86/kernel/relocate_kernel_64.o: warning: objtool: relocate_range+0x52b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
