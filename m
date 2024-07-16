Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687B1DDCE;
	Tue, 16 Jul 2024 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164700; cv=none; b=XDiL9fc/gSix7mS85FKlwr8NZcMFlIBuSDw6GOxpn21rP/Xwkb9+TyE/sPQQD9K1jk9bcQvbLIF+P4riVS85V+x/QuizBK4LvGlzQpNjpu/CaWJxQ17GVGWKMTYq1dA6Q7GORTN9g6R63FekCjZ5VeSDprr26i6XxKLIzHpjnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164700; c=relaxed/simple;
	bh=E0ZAl51tbgLA6yD4ZVBfNBYA6dwIepuOn86kPiOiKzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOslmlCqb5rLFw1YzDb9uMS/08bvVZ0brfKDB9iKjcs3LGWtX3wB9FzwAPvc9RA0U1+r/TMoO9xh7A5HVmq2wAoGEjq6HRJ87l8D6dztB68hUpLtLYUjBP4mFqaiGM1DTbPq7nS9fu3pq1sIzwkEmz6KjOEcqPiWHCzUF9cmDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKLY9ble; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKLY9ble"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721164700; x=1752700700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0ZAl51tbgLA6yD4ZVBfNBYA6dwIepuOn86kPiOiKzE=;
  b=QKLY9bleKMz+MS4eM3t2KAyKddK3fg0cK3bx+cnQFh9GgDx3HSFvqBzT
   ypLgGzr+aaBnEP+m6S4orW3ZV2z4b2tDElOWAp89TRtxPkmuM2XWOBkyV
   SZcwQOO+f4bzJ6FwIuxuq3y4+pFuFPjHnbZbbtZq0eZdWiQ0D/DM8PbjX
   uCDJQEpzFnEurX2V1ic9FzOt5IMM/yPKPkLP+ZdkEBsDuCeQqNbo1F+VR
   lOzM77ISyJOR8URbuQCtXOkB3ii7x9aC+S0Zt4BzYZBHlo7v/sVpVmceH
   ankV/YRVC63E+ujRxJ5hYt7MgaxQ3Rm9zdF40xo+spHOVAkyDY6MUwqd0
   w==;
X-CSE-ConnectionGUID: vTJRHUNfQeaKK6ULyQDo3g==
X-CSE-MsgGUID: o8mecekiRkCRDknyiyF+kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18591803"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18591803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 14:18:19 -0700
X-CSE-ConnectionGUID: JUDMqCOJSMSsZFApxAhzug==
X-CSE-MsgGUID: 76LAPAoyRgurVjZ/vqldBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="54377631"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jul 2024 14:18:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTpYs-000fg2-2h;
	Tue, 16 Jul 2024 21:18:14 +0000
Date: Wed, 17 Jul 2024 05:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 16/17] WARNING: modpost: vmlinux: section
 mismatch in reference: numa_add_cpu+0x40 (section: .text) ->
 early_cpu_to_node (section: .init.text)
Message-ID: <202407170507.BRlm9YyZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   f4c3c723b3a514f59883073667f1ec5c97f7f5b1
commit: 4be72fa454a73b3001d105e6d9bfe32f59af94eb [16/17] arch_numa: switch over to numa_memblks
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407170507.BRlm9YyZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170507.BRlm9YyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170507.BRlm9YyZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: numa_add_cpu+0x40 (section: .text) -> early_cpu_to_node (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: numa_remove_cpu+0x40 (section: .text) -> early_cpu_to_node (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/kernel/arm64-reloc-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/crct10dif-ce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/poly1305-neon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/aes-neon-bs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/kcsan/kcsan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/resource_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/scftorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kfence/kfence_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/nfs_acl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/minix/minix.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/sysv/sysv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/efs/efs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx4/qnx4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx6/qnx6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
