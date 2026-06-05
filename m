Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D044E053;
	Fri,  5 Jun 2026 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643714; cv=none; b=PXQmMfiIapiKviAdDAhEq2yj/Ba7cHmzqe1TfA3f6BuEacf9f8iv4eVvZLGe4hVaBa22l7CVlEen4lshkyx+dGOEB+oAMrwJUnh4LMEifMPJO+mQtN1yjYo33EKuynAbod6+Mcjs3MQFyhvBBDTxTTBwcLHkHhSYmhcTmounnnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643714; c=relaxed/simple;
	bh=qwyPU7ax3kVXIchgtoYzveweTq4OWKz4g0yAXFqtEr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CrEWij+BQkIIw9Be2jw17ZVJZARj9YEh3adiz0VUsK7ivA9gEg3EsA4sqACFu+fFF3t67Wz0FwhmfrX7KgPPqGqFy4hwIBLVB77kjEHgDEpJZhzCHxWAAtJz09ea1NB1f/IRBmIaruCYFwV0of8ooOZ33CPjtWCb6vnf3DFJmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASRz/R4g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASRz/R4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780643712; x=1812179712;
  h=date:from:to:cc:subject:message-id;
  bh=qwyPU7ax3kVXIchgtoYzveweTq4OWKz4g0yAXFqtEr4=;
  b=ASRz/R4g+uZXuVT8F11rozeiGoIQZgPF7F1LStNF/OLxozqmqtPyeitP
   N8b1uAnqNShH0vZw42uZKKue0VpOgKB0ESaP7AxLU4I+NHPpoQ8R2Dvwz
   jJzg6AtAmHiH5jP/i3hIcTi7AtZPdVRwYqxIERt/OjqYEeC5jAMZoEQe7
   OBwGxYfyZTLBQKPlVgOulDqht4HldbS8p/lsrPUDNM4ir8KdTWTdpyGap
   xla1UCwZWfR8YDyyp1/5mdbuC9VmO1yFR8POj5uT8iQHC7P2JhY1HVgBv
   ENUZoZNBdy7oMaYHd3fCuxIfJMeaNaeRIaTfGb9Q3fAUePKwMPHFC8Exm
   g==;
X-CSE-ConnectionGUID: X6ar92RtR9KyoeyXMj/l9A==
X-CSE-MsgGUID: t4afcwIlS9OSvkc0e6kGIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328559"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85328559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:15:12 -0700
X-CSE-ConnectionGUID: NORpfU9wT4OGYOVtU5E0Zg==
X-CSE-MsgGUID: qI/sYgenQku/vn1+JNgt5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249880727"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2026 00:15:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVOlo-000000002VH-2SH1;
	Fri, 05 Jun 2026 07:15:08 +0000
Date: Fri, 05 Jun 2026 09:15:06 +0200
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org
Subject: [mst-vhost:balloon 8/39] Warning: mm/page_alloc.c:7270
 expecting prototype for alloc_contig_frozen_pages_user_noprof(). Prototype
 was for alloc_contig_frozen_pages_user() instead
Message-ID: <202606050959.Rsoiib9n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git balloon
head:   b145636d693114d343a0a47a4400f5b31e211fec
commit: 2edc4a8a3ed54fe5fd742e60ff3cba3b7dbd8316 [8/39] mm: add alloc_contig_frozen_pages_user for cache-friendly zeroing
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260605/202606050959.Rsoiib9n-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050959.Rsoiib9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050959.Rsoiib9n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:7270 expecting prototype for alloc_contig_frozen_pages_user_noprof(). Prototype was for alloc_contig_frozen_pages_user() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
