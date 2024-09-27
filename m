Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72A1C32F4;
	Fri, 27 Sep 2024 20:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727470605; cv=none; b=bV+vJgVpO2Pxsumbb5ReYETVzSv2CDph6XtZEgka9FC7QfkRiPfU1VIWAZHlg74I4fBb+eX9G353YG6xAXrwcqiGcR7CUrtcivL00DH43u2PvGPc7oJpXN7N1ohNi4GzWwjW0Y+C+XFlEcPQsakEEI0OEeMjsEFG3HdtM8d4FvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727470605; c=relaxed/simple;
	bh=6zsHVj6qc07YHay4eZMr/KbTRv//AnziqzntVxEzCxk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebI0pKa87+1/E0Eoa3UN/l+3iKftnWwPwm2UdJjYa88Rb2AFmVl4IIBYjxtM4ms1pPMiBO7dKzc6q8dn2O1p8Q6bFotBOa3nOchjftIb/cVE+VezapyD+BFqiOFGD3kZko1+CliTItIOXA8PZv1dCjzQu04cBlJMThoLhDCdHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyUeSbnK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyUeSbnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727470603; x=1759006603;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6zsHVj6qc07YHay4eZMr/KbTRv//AnziqzntVxEzCxk=;
  b=WyUeSbnK90SNedIkj+LQDJYGkG/Gb2q+rllHGLL2ZkLeeCjCnwSjxZJi
   RNEWTS+cOJCycdfndWNYur0h3RKGLFIklCCOe8gWK6DcqtuCfwqvcnH7Q
   s8tBgLhBt3/tluC/S3n1B8De6g0YD45E4pZIB8m5TL/0WOKeBVtvcE6Tr
   Atqz2Fy/Ay4SL0QYCkLVVtgMrqMeATSp7xXqh4tB8oAl8wUnw2F1N0YDS
   QyrquNTN2nNYGgkSvwMrfJm2gmMVCt+VjH20ZUjwCaVHYYYVF3L37sxr2
   lq85vciaCPJrCCnsxx44c+6lnVYR9DrXQq/m5yR2xoRj/YZ2DSyATbBhJ
   g==;
X-CSE-ConnectionGUID: 4KWDwZfgTFyoDfbBq8p6Zg==
X-CSE-MsgGUID: 3H8r9L6+Qa6/gt73ttfbeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37193912"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37193912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 13:56:43 -0700
X-CSE-ConnectionGUID: vZ3RGmUBQQGP/ZP9ckp/Qg==
X-CSE-MsgGUID: 8lgGhJzCTkK/tHBUYafOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="95979574"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2024 13:56:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suI11-000Mc9-2q;
	Fri, 27 Sep 2024 20:56:39 +0000
Date: Sat, 28 Sep 2024 04:56:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: linker command failed with exit code 1 (use -v to see
 invocation)
Message-ID: <202409280414.5tvUhk5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Foley <pefoley2@pefoley.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eee280841e1c8188fe9af5536c193d07d184e874
commit: 83e913f52aba69149261742aa9ea4ceea7bf182d um: Support LTO
date:   1 year, 7 months ago
config: um-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280414.5tvUhk5w-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280414.5tvUhk5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280414.5tvUhk5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: ../lib/LLVMgold.so: cannot open shared object file: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)
--
>> llvm-objcopy: error: 'arch/x86/um/vdso/vdso.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
