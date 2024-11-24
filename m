Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE374163;
	Sun, 24 Nov 2024 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732482257; cv=none; b=fJWisyJM0ncERxRjJ/gDyziQVKg46Oub72VS29/L8GS0xnRVdHhbjUB0XKM/5LNT3OVsQg1e5dP2R1hY79g1nW7wuQEQIVHeI69LART+qaFQ695GqEYNvMWwO/rebs5RwtfXu43z/rfJAZrdLufMBXPjzpNw7J35qtW4L8i7iHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732482257; c=relaxed/simple;
	bh=FARJMJnWm9JkgOKx+Ie2wcp6CCal/pctKabx4gr8cRo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KufnbU2oX75Kod3n4lHHYVKxsCqiSp1JKZw9spGg4GOWkklMYgj4YqoVll2zRYy4rczNlEvm+NhkP+fF+RQn+PoaWtwhTXy/muLWgwUszen4zK5wwi5PyhThSGieWmrjiDhfp7zwEaDZJKAuWSEjjxfrpACcSuJWfQoa1NNhy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT+KEzoz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT+KEzoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732482256; x=1764018256;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FARJMJnWm9JkgOKx+Ie2wcp6CCal/pctKabx4gr8cRo=;
  b=UT+KEzozoghxxH0cKbIBuywWox0RYxK0L/iqBExctpJqbpguiDhLtSKP
   93h8VvLQNQu0zdsX2fFqNtNYZxJ+FnjLq8qt2tEO34M1sfrv6jSqOdKkC
   SgZbQ+xQl9xNz//e8eR86mXuj0yepDBPok5oEDl2iGprNLc6s97xa9i0T
   nHSdl9vf0iVVI70cWbKAmZmId7sgKDbuN+CkbH2TkjNyAMhmUvNpMRj12
   1GdjKuGbXZ+Fb3sr2dT/gmOChZegHQ0P1DCXtGI5FBeDIlhLETCuIjJ+j
   haXfvwb3qGJkVQ+nx3Lyrd/N3vhoRuXLsI9ylZj2HJPgerW1kbxpWw48A
   A==;
X-CSE-ConnectionGUID: xrcHhedYQlGJe8n24AmtCg==
X-CSE-MsgGUID: wSA+gjA7Q4qK/0KnlcB4VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32517720"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="32517720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 13:04:15 -0800
X-CSE-ConnectionGUID: FCIwjKicQaaX0J4xfPz3vA==
X-CSE-MsgGUID: /eUTONuVSh+ucoJWZOE/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91047266"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Nov 2024 13:04:14 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFJm8-0005EP-0T;
	Sun, 24 Nov 2024 21:04:12 +0000
Date: Mon, 25 Nov 2024 05:04:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ep_poll_callback+0x25f: unreachable
 instruction
Message-ID: <202411250559.fn0eZXeN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 84dd048cf89557e1e4badd20c9522f7aaa0275fe crypto: x86/crc32c - eliminate jump table and excessive unrolling
date:   4 weeks ago
config: x86_64-buildonly-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411250559.fn0eZXeN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250559.fn0eZXeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250559.fn0eZXeN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ep_poll_callback+0x25f: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
