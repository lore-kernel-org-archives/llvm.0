Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC92BEC55;
	Sat, 31 Jan 2026 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769822922; cv=none; b=HDMF1WU7Tbe6222jZHs4YTx9iCgURGE0FYwfR+oYbeNy4vcajsbGbexgQHvAiEH6yZa5REWFozyFZo7k69E5Hloo3odNFNsMQcnEmyDXHqxIGY4FHQrkUAk9cqE5ZrFcEAamqkdz56kssyLZy5CdYSDLt5ghOfN5T35CCg7Osvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769822922; c=relaxed/simple;
	bh=Stxe/mG205ejtxFnioLq9eexmfu4yC3YqXx5VaDWFl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q3w/TLrLmY2bOmSbIl8OV/N5LvawXnQbNDkPn66ap8+EtLsIwLQOUo0dm5F8MI8MVnB1Vf4VVkyy3rgDSgoqZhVkkBbyaE0VsN3s1443aPjA4pcJeg/2DlUiLjYmT+L6AdWMotED1WYvEPJt1QkKVVFPkzqV1JvxSjluJu+g1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUPSM1cu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUPSM1cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769822921; x=1801358921;
  h=date:from:to:cc:subject:message-id;
  bh=Stxe/mG205ejtxFnioLq9eexmfu4yC3YqXx5VaDWFl0=;
  b=DUPSM1curFPYd+ufyArDSRStsevG+xGeY0zdVFXXx6wD3lm1CMQSrAz9
   2PeL8gcEv2kRXJuTkgdWF9Ck8ta9AB+FaAivY/E8/ZKrcOSWku7c9zxBW
   idXJDhuQcNYcRtEcQY+HbbnFcF5GVnHaZbCj4Ob2TOlR87QeOoBtnUSM8
   ZFITNPEbsXx66DrvR+XG4pANsSlXfUm/RkPPqXYW1i1NNT2apoG8TNjFi
   9o0+NF5+uk7+oOKeOxpDcDbqbAqwpkPlqlvYU8hRqp2M/Fc36B5hWCpty
   YX8XamSXX3O+dthyK2Vcjhyfn6WBq+zywdJa3mIoqqLjpRE1/VOfUq8N5
   A==;
X-CSE-ConnectionGUID: c2QShuP4RXCFpya8sBSvTA==
X-CSE-MsgGUID: WXW90DJdSICPhFOQPbAd4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88651947"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88651947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 17:28:40 -0800
X-CSE-ConnectionGUID: YU4nJGA/TfCsr/LpDGvDpg==
X-CSE-MsgGUID: xGiQ7rLFSGeHE30HFHmNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213494018"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2026 17:28:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlzmu-00000000dXM-3TQY;
	Sat, 31 Jan 2026 01:28:36 +0000
Date: Sat, 31 Jan 2026 09:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 1/1]
 ./usr/include/linux/exportd_netlink.h:1:1: error: // comments are not allowed
 in this language
Message-ID: <202601310921.uNenQsbL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   077e7343a43c486345b6ed3fcee3b2ef296ec201
commit: 077e7343a43c486345b6ed3fcee3b2ef296ec201 [1/1] nfsd: add new netlink spec for svc_export upcall
config: s390-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310921.uNenQsbL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310921.uNenQsbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310921.uNenQsbL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/exportd_netlink.h:1:1: error: // comments are not allowed in this language [-Werror,-Wcomment]
       1 | // SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
         | ^
>> ./usr/include/linux/exportd_netlink.h:7:10: fatal error: 'net/netlink.h' file not found
       7 | #include <net/netlink.h>
         |          ^~~~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
