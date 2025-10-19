Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BA354AE4;
	Sun, 19 Oct 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760901596; cv=none; b=B0Ftl7n/Gl9UpoyxEpbcQiqsnB0c5V99QYqIxR7qW+aAv75k2oRNBgYomAh1CM1mg8TwoH7mgSbEugpyQnr03GX74gdq07PXtblAAtBuTsoxALYF9ZeBa9/SA38QI7PYy+xaRpctcM2sLgXyHoHxeXc2lwx8Z6s+m3sHyw5dDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760901596; c=relaxed/simple;
	bh=Q/Zv2yLp98b/RmFOKLotKB0UTJLVzwOIP1Qoaa0SczQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmRlq8ETrLGblcRDKabASrENNa7BlxsRZZVtAdYvlfdV9PQQpcIvIvrjdY0VUyMpXU3cxLe/2eXddofAIWts0F/nolzOQFSnUTWHScFmgnooEY5Rgx9vPJrtXyDa2Y5JhGJOOOX4vbGYk2YzW4Te/a66rEuAfyfqy4VMuU/lAWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3BgrmZe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3BgrmZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760901595; x=1792437595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/Zv2yLp98b/RmFOKLotKB0UTJLVzwOIP1Qoaa0SczQ=;
  b=j3BgrmZe6tqMmKe+h9vnN6+7OzXOlvXB9kciNzbhxx9CDnzVk6+3wGei
   ANpIscpDtXxUozw7zPQLlAueS3MQ25v2geJTUJ7X4t8xKvgd0kUo5CyxJ
   xxcfzCTEkNxeYBrOPCZ/27eQCdU8JJ953VxV+ez5map68pVEbfjlrIAiB
   zHiE5s8XEBk8wXGDfEluDZU6iQR3KbWirvRprRtV++Nr1JVewIh5Ki80O
   FAyE/AlIE7owiVyXKG7Z6InVygvnMlBTe9XS78KUkjAQYvkT4mGq9uVCA
   FirUAszhaE3+BH5pW1IsfdqKVGszy/q1JyXk3Aov2CfnLfLc3OpzaqFC6
   A==;
X-CSE-ConnectionGUID: WF4vjz1KQxyd0BcfBeuYEg==
X-CSE-MsgGUID: 8OcL1pczSJKhOND900gBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63132442"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="63132442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 12:19:54 -0700
X-CSE-ConnectionGUID: 5Ua9T6ljQ96GmLmX0vI81Q==
X-CSE-MsgGUID: IIKaZFG2Q1iTHqtQndnlZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="187433917"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2025 12:19:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAYwX-0009HT-0z;
	Sun, 19 Oct 2025 19:19:49 +0000
Date: Mon, 20 Oct 2025 03:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:void-gfp/v2 2/2] drivers/tty/vt/vc_screen.c:56:44: error:
 incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'void *'
Message-ID: <202510200314.T6g7HRpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git void-gfp/v2
head:   5bc4806712d9e97f6b0344869d11b529287dc037
commit: 5bc4806712d9e97f6b0344869d11b529287dc037 [2/2] mm, treewide: make addr parameter of free_pages() void *
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251020/202510200314.T6g7HRpE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200314.T6g7HRpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200314.T6g7HRpE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/vt/vc_screen.c:56:44: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'void *' [-Wint-conversion]
      56 | DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:386:36: note: expanded from macro 'free_page'
     386 | #define free_page(addr) free_pages((addr), 0)
         |                                    ^
   include/linux/cleanup.h:211:71: note: expanded from macro 'DEFINE_FREE'
     211 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   include/linux/gfp.h:383:30: note: passing argument to parameter 'addr' here
     383 | extern void free_pages(void *addr, unsigned int order);
         |                              ^
   1 error generated.


vim +56 drivers/tty/vt/vc_screen.c

fcdba07ee390d9 Jiri Olsa         2011-02-07  55  
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14 @56) DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14  57) 

:::::: The code at line 56 was first introduced by commit
:::::: e730c373b6ff16a177e132859bf6ea4dbb15105f tty/vt: use guard()s

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
