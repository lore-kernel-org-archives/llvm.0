Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640AB2FC037;
	Sun, 22 Mar 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774171710; cv=none; b=lfcuOyjn+sasevzP4JoD0cBeb+TLkxm+zJ9Sy9nT51ML0bceHswIwV3XJimWqJARIc87G0zL18flpK89+WRHKqreLfv5SR7xwE2JHtHpq3+hxx3x0XMY+R8qkLnnmD7plLaI/0yUsppi7ZzFjds4t0EY8UcRi0QiLsXVOZTFUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774171710; c=relaxed/simple;
	bh=wlsj78X4xOMfOPl9nNkkvRaam2RLW/SMDM0/9+HWLFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7jewZNtrB6x5zBQWJ6nXMMfyFtriJ2Ejo/cbOmFYpOmzRpcxXlz4dHaJs6avVt0M6jmgpZd1xxgs3oE2+C2MDS2AxFvJ2DflpgpCdgny4uMwzdV0x/2csxw1SzyUR/s12RxnW79d72h/FgWZtzk5d5hdQE+wnqfUPjOxg00yx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaO0ftVO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaO0ftVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774171709; x=1805707709;
  h=date:from:to:cc:subject:message-id;
  bh=wlsj78X4xOMfOPl9nNkkvRaam2RLW/SMDM0/9+HWLFY=;
  b=LaO0ftVOO+BADE7Ix/jp3ZS5ISge72O1d2V/yDxVhm/Iq4er4bpSoaRw
   CKdXpn9ousRyGsexDSaQW66ZyCn0SX3DW9Owqjc8loCc9XVkDMdaOgmjL
   9/byDlJTnIRSKmZHPvkKyPnoVB3ZJFItLT+3twMY8nS2n4A4wO4xv5yGs
   6SUGTw59hopa81HY92LO1bHWfctOhmXwNLRXUNPSW6lTbmHPiz5FRBX0a
   WsyhQ7j9gniMucgb4+2i9I5MlZrjpZKT9PRq6s79R1W8vFpAOqyv58Z9A
   PwvbrpAyoLyiNErDgNc4i8c7dleIP9OiqYcuVOq6cZ7C7IC/F0JZyU5VL
   A==;
X-CSE-ConnectionGUID: aetYoS8MT46ldg80xUgFOQ==
X-CSE-MsgGUID: 2Bco31bwTGiq/FpJ+JXpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="100653291"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="100653291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 02:28:28 -0700
X-CSE-ConnectionGUID: Adw6zMdhTTq1D7qnvhzYLg==
X-CSE-MsgGUID: e4Vfe0I/Sj+rqqUn8h2/CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="223767037"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2026 02:28:26 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4F6c-000000001wH-3xZ4;
	Sun, 22 Mar 2026 09:28:22 +0000
Date: Sun, 22 Mar 2026 17:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crypto 3/3] ERROR: modpost:
 "crypto_register_kpp" [crypto/crypto_engine.ko] undefined!
Message-ID: <202603221755.qX7fVto3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crypto
head:   2105b8775edddbbf41231d6335a598c249242d58
commit: 2105b8775edddbbf41231d6335a598c249242d58 [3/3] crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260322/202603221755.qX7fVto3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221755.qX7fVto3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221755.qX7fVto3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "crypto_register_kpp" [crypto/crypto_engine.ko] undefined!
>> ERROR: modpost: "crypto_unregister_kpp" [crypto/crypto_engine.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
