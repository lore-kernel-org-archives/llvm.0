Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF64430;
	Sun,  3 Nov 2024 02:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730602212; cv=none; b=pjquH0RUP2goeiEjwxaBW4WGHVyjd4X1vxqDzq181QVZXGk1qhQrYiV5HqTDxGQijz7sePf5GTyG2OtE2gaV459yxg47vTuzfAA+BqR56QMXC7OEGt6MSW9vdbVV5Dodh772YkXGG5N31ysU9dFmqAnrtWb/WXX686fWg25Cz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730602212; c=relaxed/simple;
	bh=WC7gNqVYN7/vSZ3D33xg5hjsxLeE+foPBleYVaWXFCU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=izjTsWJQbYufWdc64VIt/Lr1NC8uFsM7lPWhOiheIVVxZu6ngL/wlD+TYAjrhKzWsJoMGbbQWOj1va8zgsmSto++fYUEBltyLM1RawR9752mrvAC+/sY/vlYnZabQ8H8n6ShRI4Ekcu9RAvpb9OPLbJGZDEfHrrcWZPoc7+Hvpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njG8/7eE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njG8/7eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730602210; x=1762138210;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WC7gNqVYN7/vSZ3D33xg5hjsxLeE+foPBleYVaWXFCU=;
  b=njG8/7eE8CCtUzR+/Rwu/LfrhRMJJWgIDT3+crvk570Vuwdj/XWrLgS0
   LpMHeOzbzVj4UI9ftNr94nmccV50CF7y/AcyjClaLdCrlVEHjnxHeTyiD
   jX8bQRoJdFDCYZJNWVuvbzWYPz9zJZrZ9lHl7ctlNNzcpV+9SD6G8yFGO
   nSwvmDAheqS4PKMtoefgJwdLGcWRJmF4IaRmBm6JuwJ0Rncp/T73VVHAe
   EjmvN1E3N6eRgk/TksPaq9wVP3Mm/iEsJQ5olzoGD8nb2JDlt8uteB77F
   BmtW4UM2xdceQ6latxXjfKeGNQ4vSxizA311b+A6wBXFfL5TJxPdKDrQT
   w==;
X-CSE-ConnectionGUID: wc4OTb9eTNWw3jLDfaM41g==
X-CSE-MsgGUID: lf0eW6JkQ4ejDq5AVtPTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30427324"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="30427324"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 19:50:10 -0700
X-CSE-ConnectionGUID: 79M+J8aMTYqpdqq5n5W2aA==
X-CSE-MsgGUID: 5Flf8xxdR0aSJl8pBt+Axg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="88141664"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2024 19:50:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Qgo-000jbp-1N;
	Sun, 03 Nov 2024 02:50:06 +0000
Date: Sun, 3 Nov 2024 10:49:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [herbert-cryptodev-2.6:master 56/92] vmlinux.o: warning: objtool:
 .text+0x0: unreachable instruction
Message-ID: <202411031023.8TYIguWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-crypto@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   c418ba6baca3ae10ffaf47b0803d2a9e6bf1af96
commit: 84dd048cf89557e1e4badd20c9522f7aaa0275fe [56/92] crypto: x86/crc32c - eliminate jump table and excessive unrolling
config: x86_64-buildonly-randconfig-002-20241103 (https://download.01.org/0day-ci/archive/20241103/202411031023.8TYIguWN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031023.8TYIguWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031023.8TYIguWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x0: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x4: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x5: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x8: unreachable instruction
   vmlinux.o: warning: objtool: .text+0xf: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x16: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x1b: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x22: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x27: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x28: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2a: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2c: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2e: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x30: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
