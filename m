Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31B13B2B0;
	Thu, 15 Feb 2024 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708039049; cv=none; b=HTh6T+QDKicdkERE6HnibZfsji1l1DoDPO1A/K9YPoC4Y3u5+o6oGJo5jSuMVmrCh/jdBKlc3fzfpZfbgLBqvI85vFm67EKj2msO3TWgOgvfLeOFf38bUmLwMjzF93X3Gwx+nhuxU5h7H3/eSINm5NsItFnhhuPpDVID0hiS1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708039049; c=relaxed/simple;
	bh=BIJ2P29CFR1C4jSbk9R3nHzWG5zyHG+8daCdXLOdwE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUt5AZI/vwmuk1AarYwuxmT81NO4BfGN0Rs9ItFpY+lDnwbLFO92rJd9N+PZjwpGNbUFcF+uDFe2v8ReweuO98OwYOeHKFFKo/Jf8Khme2XGYlsIIjQv3cvXPPjdO1KfGHQv5BA46l0bsfzV57Ehx3FJcutOSxq4rk6atqLpw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1jqqwJF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1jqqwJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708039048; x=1739575048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BIJ2P29CFR1C4jSbk9R3nHzWG5zyHG+8daCdXLOdwE4=;
  b=a1jqqwJFoRTecyC9xc1OHL8MoeLcellP5oYg18Ez3bFWKK9oKKQhunLs
   ExMXcD61qfUmZNtXNO3Z31dtPnE+MKTeVkBO9RYjVj6oGw15naftUl5Y7
   b7BzeYfGiF4E85S4GMg2p59v0+iQP3Mu8EeCXRCy+3xLXG04UsayQzeS6
   jL8sDkf3F8teZbwZLHtComJWhIju727zhAVOi+sPuFXPxeeeaSv3RQJbh
   FvWTn5F5+Xs2k0UN58Z3fb3PuOFwClLMgoocRaIGB+SXA/C15cm91c/hj
   P18jHzvFoYbUKqBtdbMiJwpP1E6h4a1Ax3o7pUWyMaQCWeMCWYsfeKFsn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13560352"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="13560352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 15:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8362092"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Feb 2024 15:17:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rakyo-0000q8-0i;
	Thu, 15 Feb 2024 23:17:22 +0000
Date: Fri, 16 Feb 2024 07:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>
Subject: [kvm:kvm-coco-queue 33/42] include/linux/kvm_host.h:2404:2: warning:
 non-void function does not return a value
Message-ID: <202402160743.povFwG5c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
head:   3428d62d5effe9bed1b9084ea8f7722761441ec0
commit: 08d58c22e8f1aa52e0732113e4af634302af9f06 [33/42] KVM: guest_memfd: add API to undo kvm_gmem_get_uninit_pfn
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240216/202402160743.povFwG5c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160743.povFwG5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160743.povFwG5c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:2404:2: warning: non-void function does not return a value [-Wreturn-type]
    2404 | {}
         |  ^
   1 warning generated.


vim +2404 include/linux/kvm_host.h

  2400	
  2401	static inline int kvm_gmem_undo_get_pfn(struct kvm *kvm,
  2402					        struct kvm_memory_slot *slot, gfn_t gfn,
  2403					        int order)
> 2404	{}
  2405	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
