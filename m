Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B49F2236EE;
	Sat, 15 Nov 2025 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763194722; cv=none; b=HsfTqX7DFrTHbDciv+HEqwfbY11+v3ci6uW8AfF/F6QwrowQknzg89iANp4vsLlcCtY/yEs5+UMRiamPoQy0suyKWkMQGM4uRhl91vGk3OKhi+At8kTFoa0ZhneJvI/10Tux1tyrV5zF8Dw8xl4J8PJbY73s1f54NyHuKjTVJ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763194722; c=relaxed/simple;
	bh=QsMzhhGHuFwGF5Fk+yS0ZbpK0HBYtHjkSo53szw/eVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1MR/JTuT9q5ZNEBRLzgEoMzjtkAoRANvTec1pEJU/tydLOaOLNSfMlH6Yz+OasqLs5LoKyZxLiadOhZMMDyS6Pn6bA2nAIVMbL119JuzhFEH1Ya+6/F6nfuuFlaDM7jbzBHVyYmEJyN6FUnErlYbBj9vRrgUXKl2X6Si4DxN+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmrdBcNn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmrdBcNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763194720; x=1794730720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QsMzhhGHuFwGF5Fk+yS0ZbpK0HBYtHjkSo53szw/eVw=;
  b=jmrdBcNnzeFUf+qkBDyJuoHVi/DTK2qNUpZxsnNrfnvEoiv7iATnKYn/
   dxaKkUBucFbR+NSpM4c2SGHppkLuLkfpmJDyX++cqW8FVia5eHR/QkxLT
   c7cTNmqSNhZdNt4kb3egeoHUp36IYURqYF9frn/orEStnUbohDQhoCSF1
   W39YKO9aZOQMH5ujVMvd1mR65ctN05P54eIjdwsBRT3kGWAEeubfVPjR+
   MDINbIol6j0x/+TaHasVcM1OW8l2AxsFeMHcxw3VlLhZoXPJT71RlXrz4
   z/7woPvff0ieKc13Kped0CDkYo+RqqG/rscoPHV6GXAmIgoygctZt+BJD
   g==;
X-CSE-ConnectionGUID: dca/RIRKSOa1j1E1IicpmA==
X-CSE-MsgGUID: qljIDcEKQQWLvaCNQv7yQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82908883"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="82908883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 00:18:39 -0800
X-CSE-ConnectionGUID: hYKAjl/3QuiRaT/sxi1HlA==
X-CSE-MsgGUID: i10qcbnXR0qIzJSVf7rcwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190026251"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2025 00:18:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKBUR-0007oX-2L;
	Sat, 15 Nov 2025 08:18:35 +0000
Date: Sat, 15 Nov 2025 16:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs.all 308/373] usr/include/linux/fcntl.h:88:2:
 error: unknown type name 'uint32_t'
Message-ID: <202511151609.GV7D9Nd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   f28c9935f78bffe6fee62f7fb9f6c5af7e30d9b2
commit: 1602bad16d7df82faca6d7c70821117684a66f49 [308/373] vfs: expose delegation support to userland
config: s390-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151609.GV7D9Nd0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151609.GV7D9Nd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151609.GV7D9Nd0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/watch_queue.h:6:
>> usr/include/linux/fcntl.h:88:2: error: unknown type name 'uint32_t'
      88 |         uint32_t        d_flags;        /* Must be 0 */
         |         ^
>> usr/include/linux/fcntl.h:89:2: error: unknown type name 'uint16_t'
      89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLCK */
         |         ^
   usr/include/linux/fcntl.h:90:2: error: unknown type name 'uint16_t'
      90 |         uint16_t        __pad;          /* Must be 0 */
         |         ^
   3 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/fcntl.h:88:2: error: unknown type name 'uint32_t'
      88 |         uint32_t        d_flags;        /* Must be 0 */
         |         ^
>> ./usr/include/linux/fcntl.h:89:2: error: unknown type name 'uint16_t'
      89 |         uint16_t        d_type;         /* F_RDLCK, F_WRLCK, F_UNLCK */
         |         ^
   ./usr/include/linux/fcntl.h:90:2: error: unknown type name 'uint16_t'
      90 |         uint16_t        __pad;          /* Must be 0 */
         |         ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
