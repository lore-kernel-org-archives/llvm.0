Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7673E47B;
	Wed,  4 Jun 2025 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056437; cv=none; b=XYIpfyTRgOCMCTAMVr6hYEVlny0imO4K4J/D0NxqTmnc87mZGsn472QadSYgnznsTIeNB9BERifKbip+RAI5AydaQ5/pCWGIPHRXvZZBY5Z9JUvGdlBkTTIJ73dfBIfWAniU3xnPBYjdQ0ydxU2kRnHiSdHKlUR0S5JkN5ykVQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056437; c=relaxed/simple;
	bh=auvs4Tx6ETmc5Q9TTJca+IVOL/0bx9oSSwGfQ6lDcsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7Dk8wzBx+E1mAlxOno5Hkpgu9yZc6iBPPtxSqdkVDM11NeZGiiRtyk5UjsNSZ51YeuArsihL923abIH0FDHVfnNcqHfhKPQ7o5qoV0DQmElmNcJ5keammV4in/L9P+EhGXB/MyyJCNRCRmIIzjZjZ6D09omu5LfVFAiAs6Ay8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MouUGLFO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MouUGLFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749056436; x=1780592436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=auvs4Tx6ETmc5Q9TTJca+IVOL/0bx9oSSwGfQ6lDcsw=;
  b=MouUGLFO/WIEdXLOwnvO9GT48EhejLXoIZlb7EnCM/utbUqGyZRZ0qzh
   yrEqLmgAbVXt/SUHbS5F9DQz0rCXT6G+Rqo4DHo997AmR18ghj91VOYJW
   MqA09aQIfjOyrtudgKllSaZi5NrnEcrSJ1sDYz+fAyGvB7WHpbGD6r3gu
   GhhWrVWPRjtvra7s4hixPIix6hY5QXEBiPB26/R1fi81iAilXVB1vR9Te
   yEeJJbjcD/M5FleyD0i3JqI7iFzus2vytO9kiwifvgyKqol7VAGN3sW/Z
   VWjSA6RtDvG2YSC5g5ynHj/uOnjDsTJ7605XpqB+5ZN24jHimo1cDf0t5
   g==;
X-CSE-ConnectionGUID: Fg7qSkbnSHGHm1kwtTiV0A==
X-CSE-MsgGUID: USJxuVYXRhuT4QXctSotQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62540908"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="62540908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 09:59:16 -0700
X-CSE-ConnectionGUID: djJ2TNIAReGfVSq7rrH3Nw==
X-CSE-MsgGUID: 8o9+lSOVQtWTk1ROwhGjZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145120552"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2025 09:59:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMrSK-0003LT-2c;
	Wed, 04 Jun 2025 16:59:12 +0000
Date: Thu, 5 Jun 2025 00:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 24/27] arch/x86/um/tls_32.c:28:6: warning: variable 'cpu'
 set but not used
Message-ID: <202506050008.AwXLNxQX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   942349413a49670e8bed246e2185fd3a053227be
commit: 406d17c6c370a33cfb54067d9e205305293d4604 [24/27] um: Implement kernel side of SECCOMP based process handling
config: um-randconfig-002-20250604 (https://download.01.org/0day-ci/archive/20250605/202506050008.AwXLNxQX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050008.AwXLNxQX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050008.AwXLNxQX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/um/tls_32.c:28:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      28 |         u32 cpu;
         |             ^
   arch/x86/um/tls_32.c:129:19: warning: unused function 'needs_TLS_update' [-Wunused-function]
     129 | static inline int needs_TLS_update(struct task_struct *task)
         |                   ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/cpu +28 arch/x86/um/tls_32.c

3feb88562d149f arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  24  
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  25  static int do_set_thread_area(struct task_struct* task, struct user_desc *info)
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  26  {
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  27  	int ret;
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31 @28  	u32 cpu;
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  29  
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  30  	if (info->entry_number < host_gdt_entry_tls_min ||
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  31  	    info->entry_number >= host_gdt_entry_tls_min + GDT_ENTRY_TLS_ENTRIES)
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  32  		return -EINVAL;
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  33  
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  34  	if (using_seccomp) {
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  35  		int idx = info->entry_number - host_gdt_entry_tls_min;
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  36  		struct stub_data *data = (void *)task->mm->context.id.stack;
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  37  
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  38  		data->arch_data.tls[idx] = *info;
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  39  		data->arch_data.sync |= BIT(idx);
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  40  
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  41  		return 0;
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  42  	}
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  43  
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  44  	cpu = get_cpu();
406d17c6c370a3 arch/x86/um/tls_32.c   Benjamin Berg                  2025-06-02  45  	ret = os_set_thread_area(info, task->mm->context.id.pid);
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  46  	put_cpu();
b8bec829c90d45 arch/um/sys-i386/tls.c Jeff Dike                      2008-02-04  47  
b8bec829c90d45 arch/um/sys-i386/tls.c Jeff Dike                      2008-02-04  48  	if (ret)
b8bec829c90d45 arch/um/sys-i386/tls.c Jeff Dike                      2008-02-04  49  		printk(KERN_ERR "PTRACE_SET_THREAD_AREA failed, err = %d, "
b8bec829c90d45 arch/um/sys-i386/tls.c Jeff Dike                      2008-02-04  50  		       "index = %d\n", ret, info->entry_number);
b8bec829c90d45 arch/um/sys-i386/tls.c Jeff Dike                      2008-02-04  51  
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  52  	return ret;
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  53  }
aa6758d4867cd0 arch/um/sys-i386/tls.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  54  

:::::: The code at line 28 was first introduced by commit
:::::: aa6758d4867cd07bd76105ade6177fe6148e559a [PATCH] uml: implement {get,set}_thread_area for i386

:::::: TO: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
