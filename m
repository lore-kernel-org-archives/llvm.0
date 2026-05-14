Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E531F9A5;
	Thu, 14 May 2026 01:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722747; cv=none; b=umugEaYVotzTD/2B85u1XGYsgnnHuviNb2Z2P58TxKJ4TX0QyBr9SkkSbEEEMSq4p0gCbQvUsIauSgK3VMmMM1Bh/jYlBOryyiRRT7CZ0OXzZRFp0cvvZz8rLHd8cbwPPlm95aVyXYew/BTsgMI4shIYwJJA0HPngFq3lJ52AgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722747; c=relaxed/simple;
	bh=zXwtdp+YjAdVp9OJoO84enid4Ti08H/Ay04wWcpCzEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u34Fs8RFhfZ9DLa0BM0vM5hvztrnGEnKak02GwtNCzgdrPScH75gQDxELz2p01M26ZKiK5j4HyzmiwRq1NugF6vZygMWk0bbbQTY6+9cnCSeJR7zdrEBVPeaovbTU1xb+JURjPIDv5C2S+hIV288sjnbM1h5pM1RgOl55DDi7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xn0hNpdO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn0hNpdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722745; x=1810258745;
  h=date:from:to:cc:subject:message-id;
  bh=zXwtdp+YjAdVp9OJoO84enid4Ti08H/Ay04wWcpCzEQ=;
  b=Xn0hNpdOXZcGlJ7oNF4fLVRmr4OuQT0BNOxOR9SkxNuy86qN0boTwj3G
   eFd3oj+KHyF9dsLUHmhZpeKsXVJDjMidCCmZNAxJtgneLJPx/nBRKMMt4
   enueEdtrAyuvz1sdCEl+ZEorQjEeLpjJXI7FNeC5zCVcZ1KjZXvjRVs6T
   T/RQSRhneTiJU2/CH7c+nKyXNcXg3ATnYwrPlqFkeS3MfUBJRU0ylgPcV
   ycgT8v74dEMMIH88WZI4uYnv5oJKG6VqamrWPRVgcsheMgCBXw0jgGbxm
   rYXt+mzMfPNrnyi+7pKwkyZdWsfaRdZq7dgDrW8U2YZ8xO1L+1P+Zs0dd
   A==;
X-CSE-ConnectionGUID: Hjv+erKeQg68a3xZEWt36Q==
X-CSE-MsgGUID: 2cKBwET9S92H/1pUkpejiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79519181"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79519181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:39:03 -0700
X-CSE-ConnectionGUID: 3bH1zwYlQPC+w0k76cxGvQ==
X-CSE-MsgGUID: 4zL0JSdmRqifES204eLtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243228403"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 18:39:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNL2Q-000000005Xv-1qVY;
	Thu, 14 May 2026 01:38:58 +0000
Date: Thu, 14 May 2026 09:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: [xen-tip:linux-next 2/6] ld.lld: error: undefined symbol:
 __memset
Message-ID: <202605140922.q7IlUv7o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
head:   67d618348f8f1ce11b1d76f3303a28097f165ac9
commit: 99cf26a6143c22ee6c5b940a0e5e027a99e5524a [2/6] x86/asm, x86/boot: Expose inline memcmp
config: x86_64-randconfig-005-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140922.q7IlUv7o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140922.q7IlUv7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __memset
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memset_0)
--
>> ld.lld: error: undefined symbol: __memmove
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memmove_1)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
