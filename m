Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B13DD522;
	Wed, 15 Apr 2026 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270266; cv=none; b=JeO3ngMOtb5halbrVeQKI5JXrLSe3lytTOBGqeX09i+YbwSuZWL7gu3hi46lYFLMb1vodF395bL/8JeLmkcdY5Ch0Ju6OoKDvFpSPDsxWQZX5XOlaqC9LmGh1KpVKEZu5meK0Zop09eAHmSAgJ9vPS7nPhd5GYvANLvmbc7MCh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270266; c=relaxed/simple;
	bh=9aVswNNA5NO7ZkXnuZuP82WLWBlGI6fqGaMQ6zk0dc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TpxeTJZ/uzkmElphzXmlkx0APMCguAMaRYUquwEUfrjPNbJQkJy10QPJ+aAmcmwRTu/UxhJG4EeILar510ejGl69Ww4et3D+1QxRfm4eQ/cyoa9DpYRTvliIZRNQxxn0uCC3+P10JF34oSpOJRV0AYDTaw2P2FUCJ2Wf9jE2Alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nz+h78dW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nz+h78dW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776270265; x=1807806265;
  h=date:from:to:cc:subject:message-id;
  bh=9aVswNNA5NO7ZkXnuZuP82WLWBlGI6fqGaMQ6zk0dc0=;
  b=Nz+h78dWEe4u9Apc9KobOPYs86TR5MtJHYXcKc1d5r+F2+c8R6NtAUzd
   1TBWloyFE7O6UzsBHTYJ1f1xdluwgK53DDaHIxbvHrXV4cP8BKEyciYwX
   q4QarsZmqgb9Osh9T20ZIqCd4QYXP2I1Vs8hqjkMkJ4Gfc0KGIV/sl5Jw
   jt43KUgY56UpkwxISPBbFkQxI7Lc5o52APR5Qf76TyLvecblaNz56ZqSq
   frG258atm6UPBjJeZsRKDQnlhG6MldO3udqNDZnNpQOj2pw+NQvtH3PCA
   F5hjmJrpYRBc77tzdpLeZ+ob42WgUXfFYltw21wTsPoKBtwBtidLfm4d5
   Q==;
X-CSE-ConnectionGUID: +/aQyTaoTPSH7iLZoLJvnA==
X-CSE-MsgGUID: D71SGFlORRicYVFrdnJx7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77129975"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77129975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:24:24 -0700
X-CSE-ConnectionGUID: uVBkPW4ORBSrLIxcWkXaoQ==
X-CSE-MsgGUID: RtNdHFLtTb2GrK1VQlUxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234490279"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 09:24:22 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD32J-000000000gy-3pfM;
	Wed, 15 Apr 2026 16:24:19 +0000
Date: Thu, 16 Apr 2026 00:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Subhransu S. Prusty" <subhransu.sekhar.prusty@altera.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:hssi_patch_v2 5/5]
 drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:673:11: error: use
 of undeclared identifier 'cmdsts_write'; did you mean 'pmd_write'?
Message-ID: <202604160014.82z6CIpJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git hssi_patch_v2
head:   c2839fb083f7b0c330a385cc42be70bb2961b9cf
commit: c2839fb083f7b0c330a385cc42be70bb2961b9cf [5/5] net: altr: hssiss: Add debugfs support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260416/202604160014.82z6CIpJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160014.82z6CIpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160014.82z6CIpJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:43:45: error: too many arguments provided to function-like macro invocation
   static ssize_t csr_read(struct file *filep, char __user *ubuf,
                                               ^
   arch/riscv/include/asm/csr.h:558:9: note: macro 'csr_read' defined here
   #define csr_read(csr)                                           \
           ^
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:43:24: error: expected ';' after top level declarator
   static ssize_t csr_read(struct file *filep, char __user *ubuf,
                          ^
                          ;
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:65:5: error: too many arguments provided to function-like macro invocation
                            size_t count, loff_t *offp)
                            ^
   arch/riscv/include/asm/csr.h:567:9: note: macro 'csr_write' defined here
   #define csr_write(csr, val)                                     \
           ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:673:11: error: use of undeclared identifier 'cmdsts_write'; did you mean 'pmd_write'?
           .write = cmdsts_write,
                    ^~~~~~~~~~~~
                    pmd_write
   arch/riscv/include/asm/pgtable.h:816:19: note: 'pmd_write' declared here
   static inline int pmd_write(pmd_t pmd)
                     ^
   arch/riscv/include/asm/pgtable.h:815:19: note: expanded from macro 'pmd_write'
   #define pmd_write pmd_write
                     ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:674:10: error: use of undeclared identifier 'cmdsts_read'
           .read = cmdsts_read
                   ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:680:11: error: use of undeclared identifier 'csr_write'
           .write = csr_write,
                    ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:687:11: error: use of undeclared identifier 'wr_reg_write'; did you mean 'irq_reg_writel'?
           .write = wr_reg_write,
                    ^~~~~~~~~~~~
                    irq_reg_writel
   include/linux/irq.h:1224:20: note: 'irq_reg_writel' declared here
   static inline void irq_reg_writel(struct irq_chip_generic *gc,
                      ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:688:10: error: use of undeclared identifier 'wr_reg_read'; did you mean 'irq_reg_readl'?
           .read = wr_reg_read
                   ^~~~~~~~~~~
                   irq_reg_readl
   include/linux/irq.h:1233:19: note: 'irq_reg_readl' declared here
   static inline u32 irq_reg_readl(struct irq_chip_generic *gc,
                     ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:687:11: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') with an expression of type 'void (struct irq_chip_generic *, u32, int)' (aka 'void (struct irq_chip_generic *, unsigned int, int)') [-Wincompatible-function-pointer-types]
           .write = wr_reg_write,
                    ^~~~~~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:688:10: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long, long long *)') with an expression of type 'u32 (struct irq_chip_generic *, int)' (aka 'unsigned int (struct irq_chip_generic *, int)') [-Wincompatible-function-pointer-types]
           .read = wr_reg_read
                   ^~~~~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:694:11: error: use of undeclared identifier 'rd_reg_write'; did you mean 'irq_reg_writel'?
           .write = rd_reg_write,
                    ^~~~~~~~~~~~
                    irq_reg_writel
   include/linux/irq.h:1224:20: note: 'irq_reg_writel' declared here
   static inline void irq_reg_writel(struct irq_chip_generic *gc,
                      ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:695:10: error: use of undeclared identifier 'rd_reg_read'
           .read = rd_reg_read
                   ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:701:11: error: use of undeclared identifier 'sal_write'; did you mean 'seq_write'?
           .write = sal_write,
                    ^~~~~~~~~
                    seq_write
   include/linux/seq_file.h:113:5: note: 'seq_write' declared here
   int seq_write(struct seq_file *seq, const void *data, size_t len);
       ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:702:10: error: use of undeclared identifier 'sal_read'; did you mean 'seq_read'?
           .read = sal_read
                   ^~~~~~~~
                   seq_read
   include/linux/seq_file.h:109:9: note: 'seq_read' declared here
   ssize_t seq_read(struct file *, char __user *, size_t, loff_t *);
           ^
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:701:11: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') with an expression of type 'int (struct seq_file *, const void *, size_t)' (aka 'int (struct seq_file *, const void *, unsigned long)') [-Wincompatible-function-pointer-types]
           .write = sal_write,
                    ^~~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:708:10: error: use of undeclared identifier 'readme_read'; did you mean 'readme_ops'?
           .read = readme_read
                   ^~~~~~~~~~~
                   readme_ops
   drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:705:37: note: 'readme_ops' declared here
   static const struct file_operations readme_ops = {
                                       ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:708:10: error: initializing 'ssize_t (*)(struct file *, char *, size_t, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long, long long *)') with an expression of incompatible type 'const struct file_operations'
           .read = readme_read
                   ^~~~~~~~~~~
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:714:10: error: use of undeclared identifier 'dumpcsr_read'
           .read = dumpcsr_read
                   ^
>> drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c:720:11: error: use of undeclared identifier 'direct_reg_write'
           .write = direct_reg_write,
                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +673 drivers/net/ethernet/altera/hssiss/altera_hssiss_debug.c

   669	
   670	static const struct file_operations cmdsts_ops = {
   671		.owner = THIS_MODULE,
   672		.open = simple_open,
 > 673		.write = cmdsts_write,
 > 674		.read = cmdsts_read
   675	};
   676	
   677	static const struct file_operations csr_ops = {
   678		.owner = THIS_MODULE,
   679		.open = simple_open,
 > 680		.write = csr_write,
   681		.read = csr_read
   682	};
   683	
   684	static const struct file_operations wr_reg_ops = {
   685		.owner = THIS_MODULE,
   686		.open = simple_open,
 > 687		.write = wr_reg_write,
 > 688		.read = wr_reg_read
   689	};
   690	
   691	static const struct file_operations rd_reg_ops = {
   692		.owner = THIS_MODULE,
   693		.open = simple_open,
 > 694		.write = rd_reg_write,
 > 695		.read = rd_reg_read
   696	};
   697	
   698	static const struct file_operations sal_ops = {
   699		.owner = THIS_MODULE,
   700		.open = simple_open,
 > 701		.write = sal_write,
 > 702		.read = sal_read
   703	};
   704	
   705	static const struct file_operations readme_ops = {
   706		.owner = THIS_MODULE,
   707		.open = simple_open,
 > 708		.read = readme_read
   709	};
   710	
   711	static const struct file_operations dumpcsr_ops = {
   712		.owner = THIS_MODULE,
   713		.open = simple_open,
 > 714		.read = dumpcsr_read
   715	};
   716	
   717	static const struct file_operations direct_reg_ops = {
   718		.owner = THIS_MODULE,
   719		.open = simple_open,
 > 720		.write = direct_reg_write,
   721		.read = direct_reg_read
   722	};
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
