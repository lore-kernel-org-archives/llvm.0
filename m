Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A01649D9;
	Fri,  5 Apr 2024 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712316712; cv=none; b=Yv4MKlZ9hfEXAFrg8kJt8uOp1gyPETmZSaFkffk8ClqKWEx6F3nr1QqkRXmdhYCqdH5MzFueSXYNU6Bev1Azvi+Xh6GWwtLelAPiTVlqPapy+alNPbsNEz0gIJ+MpMRCxt8KdP3J1J/wu/yVkCNzGsWJxRluucgtIACMqYY6FjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712316712; c=relaxed/simple;
	bh=P1Q+TD9aXToHjoMZ5pt7Cig3oxiTyod8aYgAxTlsc1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYSeI5IAyQ/v4wCBrj60hkkgRoxdZ4ARUs2wyHXXXqLc7y/sxlY9UQrN++ZAByhnrJNiJGNsxxMWl9LsjXlPUqRWQvpIeLeD0YqeZHMDo1ACVYsF8CSaRn0ysurHN9yyvHJG6EK5Yp1pe3YSEb45s2XWlicFEvQamMQY/wcjjcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq3w2KR1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq3w2KR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712316710; x=1743852710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1Q+TD9aXToHjoMZ5pt7Cig3oxiTyod8aYgAxTlsc1U=;
  b=Lq3w2KR1TnhAf/2zo/dJEdbBYmIqD/oFF6jX7vxhXTviY7yIRq5rjBWx
   3muVROpDMoqFXmi6OpWfAfaVzjOQs2S6Rtx0lZ12BQhPoG0E2VFoF9dSs
   RW/A85xg6s5Q59INeN94IWmqm6r6ouipwckVXfj9obQBb+S6aImgt+MIT
   UopyKOKco0dZJUMpG9hYk3FkTxGbtF2Lv3SbqQ2cubT6cF5c1YLDxaQyF
   FZfNjgAW9ft5ts4ebj768C8T9PyN4mAi3mbLY9zlIsri4MPfTtaz2zm/x
   z+UJVtnif43gyrBUoaNp5STPHB6tDIFVRbSmZEODjuY5aOJeCDU9//WXu
   g==;
X-CSE-ConnectionGUID: fQKUNZ+3TpawE4oSz72I3Q==
X-CSE-MsgGUID: +DgBZ3CTRcudTJVQarDnfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7523946"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7523946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:31:49 -0700
X-CSE-ConnectionGUID: nA6gWKx0REmM0LXYHDtZ+w==
X-CSE-MsgGUID: ctCtU/n4QCCmod+41Sd0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19056002"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2024 04:31:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshnI-0002Cq-10;
	Fri, 05 Apr 2024 11:31:40 +0000
Date: Fri, 5 Apr 2024 19:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, rafael@kernel.org,
	peterz@infradead.org, adrian.hunter@intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, jun.nakajima@intel.com,
	rick.p.edgecombe@intel.com, thomas.lendacky@amd.com,
	michael.roth@amd.com, seanjc@google.com, kai.huang@intel.com,
	bhe@redhat.com, kirill.shutemov@linux.intel.com, bdas@redhat.com,
	vkuznets@redhat.com, dionnaglaze@google.com, anisinha@redhat.com,
	jroedel@suse.de, ardb@kernel.org, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] x86/snp: Convert shared memory back to private on
 kexec
Message-ID: <202404051940.mApchEy0-lkp@intel.com>
References: <41db1ebbe58fb082dbe848f1c666ed23e83f1752.1712270976.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41db1ebbe58fb082dbe848f1c666ed23e83f1752.1712270976.git.ashish.kalra@amd.com>

Hi Ashish,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on linus/master v6.9-rc2 next-20240405]
[cannot apply to tip/x86/core tip/master tip/x86/mm tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashish-Kalra/efi-x86-skip-efi_arch_mem_reserve-in-case-of-kexec/20240405-071346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/41db1ebbe58fb082dbe848f1c666ed23e83f1752.1712270976.git.ashish.kalra%40amd.com
patch subject: [PATCH v3 4/4] x86/snp: Convert shared memory back to private on kexec
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240405/202404051940.mApchEy0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051940.mApchEy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051940.mApchEy0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at extable.c
   >>>            arch/x86/mm/extable.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at fault.c
   >>>            arch/x86/mm/fault.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at amd.c
   >>>            arch/x86/kernel/cpu/amd.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at common.c
   >>>            arch/x86/kernel/cpu/common.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at probe_roms.c
   >>>            arch/x86/kernel/probe_roms.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at nmi.c
   >>>            arch/x86/kernel/nmi.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: snp_kexec_unshare_mem
   >>> defined at init.c
   >>>            arch/x86/realmode/init.o:(snp_kexec_unshare_mem) in archive vmlinux.a
   >>> defined at head64.c
   >>>            arch/x86/kernel/head64.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
