Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049112472B6;
	Sun, 12 Jul 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893621; cv=none; b=S9Lz+EdjxCTeNL9Dgn0l/o8fitjSbkHqqgtrDnApMTEkb5lLf3Zt6COVniVpXgu2WGbc70FH0jsVXskvggvLc7zKDQwBsIg7SyjBbAxHF/JOaqQzARzXUjCIfVLK0+547HwwHZ4+m5TEBaLmUrMl2V3xFMdfwLR46KY2/xMDE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893621; c=relaxed/simple;
	bh=3wROelc3RFyuv0RxxEpvOofElqPZyhZfvPQTBBCX3QU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m4grmwsalbIubdIdzW8SnIvQc1MmB5SwzZl7/egoC6cGKAbq6W4arYmdgBMrCNi27y7sEMx8nXI8qaZMQyURngMdYavN2MNt9mIHO/BNmBiShmVevCnMX5ZzxeecmhFkUCxauKL4+a/7YtDekJ4/cj/zkHv8kZRNQV7NeP1zimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmTUC/Zt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmTUC/Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783893619; x=1815429619;
  h=date:from:to:cc:subject:message-id;
  bh=3wROelc3RFyuv0RxxEpvOofElqPZyhZfvPQTBBCX3QU=;
  b=JmTUC/Zt94rDPlTzuDhk9cvBNJgdvJ6KHVP7AOirgDREaSnXVqrNDTWg
   w6xaiRN1FKfOKzSoMUTE5NATmsAwuL3SmwqV5YXA1xMQgdQok/yVvMtHH
   ZLLt4lqUQJ+WDADmviMSjffGDFV50g88c7pYdjQ365fiAm2TB0FH4+4Tm
   weS4wfo6nEqwHnjttpVSxfvyLpCgtxm7Eeg7CjsRtg/zCfLoDhh48dXNN
   e7rhF1sYvpiHrXl5pn052P5yh8kwElHqsyCiEt9UbvH5m7UXoODqjytpq
   Umt//gM4wpOTKEwRsTlP4HO7QGMBvKP6mPvJ8n+9uXu/HB30rh1t9Vcl5
   w==;
X-CSE-ConnectionGUID: 26Nnpg0oQkGTwdCPqfIPBw==
X-CSE-MsgGUID: Y7NgW6+yQFSEw1GAGHznvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84387499"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84387499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:00:18 -0700
X-CSE-ConnectionGUID: uy933YWWRFKlph513Hfuhg==
X-CSE-MsgGUID: eiGDwwIASouA+sAxiLiMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252001100"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jul 2026 15:00:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj2De-00000000LAQ-0dDa;
	Sun, 12 Jul 2026 22:00:14 +0000
Date: Mon, 13 Jul 2026 05:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan McDowell <noodles@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Mimi Zohar <zohar@linux.ibm.com>
Subject: arch/x86/kernel/setup.c:145:20: warning: variable
 'ima_kexec_buffer_phys' set but not used
Message-ID: <202607130528.J4hCbOF2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44696aa3a489d2baf58efa61b37833f100072bee
commit: b69a2afd5afce9bf6d56e349d6ab592c916e20f2 x86/kexec: Carry forward IMA measurement log on kexec
date:   4 years ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260713/202607130528.J4hCbOF2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130528.J4hCbOF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130528.J4hCbOF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/x86/kernel/setup.c:145:20: warning: variable 'ima_kexec_buffer_phys' set but not used [-Wunused-but-set-global]
     145 | static phys_addr_t ima_kexec_buffer_phys;
         |                    ^
>> arch/x86/kernel/setup.c:146:15: warning: variable 'ima_kexec_buffer_size' set but not used [-Wunused-but-set-global]
     146 | static size_t ima_kexec_buffer_size;
         |               ^
   3 warnings generated.


vim +/ima_kexec_buffer_phys +145 arch/x86/kernel/setup.c

   143	
   144	#ifdef CONFIG_IMA
 > 145	static phys_addr_t ima_kexec_buffer_phys;
 > 146	static size_t ima_kexec_buffer_size;
   147	#endif
   148	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
