Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E421CC51;
	Mon,  5 Jan 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588390; cv=none; b=XLNGnjAcgEK1JJ6VnaFdylI+uI7fP7im5yJHmR1u7uI6HzoTe1X3l8wDDiT3bsA+m+yWoCjV24HZRUPOGzJly1GXbz/YyDJlZ1/HHWE80KODW9C+WdsDO33ZLUx09koIbW70hdntzoGZCPiESpmJ75fBCRehVFdbWV1+PIzojMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588390; c=relaxed/simple;
	bh=e66a15lEvMS5/0tetiz2yLJL3T9fHXsu4MzXu0oYxec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GdhxaX4JS3ObmAwKyMFppKBotCzw99VrgWmWwQ/dkqDvzu1ePbZZW+WkW6iPB/6hoDMtT4GdBpuyHl/tsjRuGc9a0P4eeunffAEBbup8dUA6r+o4IEMj617SOklS82mzEbDiHVIiIju5O/1k3gnk3niO3JUVS7uYDCw1IF0TXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhK4rz0m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhK4rz0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767588386; x=1799124386;
  h=date:from:to:cc:subject:message-id;
  bh=e66a15lEvMS5/0tetiz2yLJL3T9fHXsu4MzXu0oYxec=;
  b=WhK4rz0mQFVUzxfa0r4aRYSR6An+RuouQw5J9cDaPs6lp328hV8LShz+
   IHOAHTFsOpON1z0e56FsHrgG+xWNAurutEBG/Pc/3L+fzUtYEhLZFeAJ/
   Rc/FJmTVaZMNSJqAkJfOV52ACP1sTHsCjRBV1YqE8nqqh0XgX1hVl6w6j
   Pa36WFXmT/arl8+KUrYIboXHKTDdS7+7ca0wU8zLSaTB94SWFA+MU3O7a
   V/7O+ILq0qAWmBRxTYOLHNkvEBFUs0oGVRWZaWplwX3G7n2adNYe2qcdO
   KuMKeajLS7pok35F7kYOkebrovMGdBaewBzLrLFf8ZHpA+jTCCzTAmTFE
   Q==;
X-CSE-ConnectionGUID: MepKoDP4QTSY+WAQ4nP1kg==
X-CSE-MsgGUID: OrOB1ruXSQ6ClquJp9hJOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="67965066"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="67965066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 20:46:25 -0800
X-CSE-ConnectionGUID: BFNiGtvcTiquc4zhMt9meg==
X-CSE-MsgGUID: sflfUcZORl+soO98ljR6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="206780138"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jan 2026 20:46:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vccU0-000000000wH-3KdF;
	Mon, 05 Jan 2026 04:46:20 +0000
Date: Mon, 05 Jan 2026 12:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [sashal-next:mm-next 5/7]
 arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function
 '__bpf_address_lookup'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601051241.10hXC1ge-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git mm-next
head:   e10a56cdd2c231b8e6e59651bf02e3878ea3cc76
commit: 5c48a0498b4b96a11af18d27ae295822bc40e0c3 [5/7] Merge 'mm-nonmm-unstable' from https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (mm-nonmm-unstable)
config: loongarch-randconfig-002-20260105 (https://download.01.org/0day-ci/archive/20260105/202601051241.10hXC1ge-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051241.10hXC1ge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051241.10hXC1ge-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function '__bpf_address_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1322 |         if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
         |              ^
   arch/loongarch/net/bpf_jit.c:1322:7: note: did you mean 'bpf_address_lookup'?
   include/linux/filter.h:1378:5: note: 'bpf_address_lookup' declared here
    1378 | int bpf_address_lookup(unsigned long addr, unsigned long *size,
         |     ^
   1 error generated.


vim +/__bpf_address_lookup +1322 arch/loongarch/net/bpf_jit.c

9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1305  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1306  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
ae4a3160d19cd16 Menglong Dong 2025-11-18  1307  		       enum bpf_text_poke_type new_t, void *old_addr,
ae4a3160d19cd16 Menglong Dong 2025-11-18  1308  		       void *new_addr)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1309  {
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1310  	int ret;
ae4a3160d19cd16 Menglong Dong 2025-11-18  1311  	bool is_call;
73721d8676771c6 Chenghao Duan 2025-12-31  1312  	unsigned long size = 0;
73721d8676771c6 Chenghao Duan 2025-12-31  1313  	unsigned long offset = 0;
73721d8676771c6 Chenghao Duan 2025-12-31  1314  	void *image = NULL;
73721d8676771c6 Chenghao Duan 2025-12-31  1315  	char namebuf[KSYM_NAME_LEN];
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1316  	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1317  	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1318  
3d770bd11b94306 Hengqi Chen   2025-10-02  1319  	/* Only poking bpf text is supported. Since kernel function entry
3d770bd11b94306 Hengqi Chen   2025-10-02  1320  	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
3d770bd11b94306 Hengqi Chen   2025-10-02  1321  	 */
73721d8676771c6 Chenghao Duan 2025-12-31 @1322  	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1323  		return -ENOTSUPP;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1324  
73721d8676771c6 Chenghao Duan 2025-12-31  1325  	image = ip - offset;
73721d8676771c6 Chenghao Duan 2025-12-31  1326  
73721d8676771c6 Chenghao Duan 2025-12-31  1327  	/* zero offset means we're poking bpf prog entry */
73721d8676771c6 Chenghao Duan 2025-12-31  1328  	if (offset == 0) {
73721d8676771c6 Chenghao Duan 2025-12-31  1329  		/* skip to the nop instruction in bpf prog entry:
73721d8676771c6 Chenghao Duan 2025-12-31  1330  		 * move t0, ra
73721d8676771c6 Chenghao Duan 2025-12-31  1331  		 * nop
73721d8676771c6 Chenghao Duan 2025-12-31  1332  		 */
73721d8676771c6 Chenghao Duan 2025-12-31  1333  		ip = image + LOONGARCH_INSN_SIZE;
73721d8676771c6 Chenghao Duan 2025-12-31  1334  	}
73721d8676771c6 Chenghao Duan 2025-12-31  1335  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1336  	is_call = old_t == BPF_MOD_CALL;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1337  	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1338  	if (ret)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1339  		return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1340  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1341  	if (memcmp(ip, old_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1342  		return -EFAULT;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1343  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1344  	is_call = new_t == BPF_MOD_CALL;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1345  	ret = emit_jump_or_nops(new_addr, ip, new_insns, is_call);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1346  	if (ret)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1347  		return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1348  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1349  	mutex_lock(&text_mutex);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1350  	if (memcmp(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1351  		ret = larch_insn_text_copy(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1352  	mutex_unlock(&text_mutex);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1353  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1354  	return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1355  }
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1356  

:::::: The code at line 1322 was first introduced by commit
:::::: 73721d8676771c6c7b06d4e636cc053fc76afefd LoongArch: BPF: Enhance the bpf_arch_text_poke() function

:::::: TO: Chenghao Duan <duanchenghao@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
