Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D47E38DD9;
	Tue, 23 Jul 2024 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721712742; cv=none; b=HUo7BTgcxLzPdjtEQYM0gyEbS9Cz3i/SWOaBuPy03jMe5gnZhdDLv5PRw7fznalFJzDxToPQWyTYNpjNFna40x+RR6dAbd9Wf7ArwTQ8Z5D5nHZjgP75Lj9m+hmGbSEJC+Dr+/htJxOQHRhmmdJDbSGAk27AXo2G08Dzfp7Zt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721712742; c=relaxed/simple;
	bh=WbdBUuNO1Cg5ftfkoTvCPv1BUJkyoYRXB2kFnvACTag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usogQsQrzXtirk1lHY+iF+zTE4UWBtZ30Wr/YuN/at15feoKpS7FrawGgW3TnotJ4t2BOOmm8YtKfdzo0hukEBMqW5+171BF8btUAu/QNAfWAUoM8II9If36lZSoHADtDp+jv8iX8Wyr8+VRE80L+XtXqrhccbanP5pbFhMrNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiLGhLZq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiLGhLZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721712739; x=1753248739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbdBUuNO1Cg5ftfkoTvCPv1BUJkyoYRXB2kFnvACTag=;
  b=OiLGhLZqhlwWoN9rtc/NKqkkQDUCNTwBq9gwp9thJNRWcfU5U3rZ/P1g
   hFLahYVV5LI4f2ZWdq7D2DuM9atLyX+2FaK3rfLJrj8J1jLazGV+G/sWz
   l2HFdBKNqwlwQOQleVeQ/zhiQQkBt9uYLRO0VffiDpdQTG0zVm73vRKC7
   7rEFcyMS3i+D7ATX3EFUUeearIc7FCDe+VSs5kYvtTxMjdZD5k/rbOunO
   zI0hW56OreQBfqIWqdvct325/9md2wH/LzO/zGYNKCosePXe4O4XLnv/d
   SEnEDKZciyPiUYGqbyeH+wYtP8bzC7rNCOpfodGXsKfi8l0shB+/zBKAt
   g==;
X-CSE-ConnectionGUID: yNkvH0n7Re2nvRi2tk5h5w==
X-CSE-MsgGUID: mHColMGAR6ql1iFV+hiBZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36837800"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="36837800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 22:32:18 -0700
X-CSE-ConnectionGUID: iGtTNQzeThyUZyb5CEnpMg==
X-CSE-MsgGUID: HbpJSnmmTUSrLRM/T3kMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56958263"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2024 22:32:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW88F-000lfw-17;
	Tue, 23 Jul 2024 05:32:15 +0000
Date: Tue, 23 Jul 2024 13:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/11] ld.lld: error: undefined symbol:
 vm_normal_page_pmd
Message-ID: <202407231357.lp5UZ4ng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   d67d4b815e12f5db41251e2d60b4930f4d3c9e31
commit: 68d25ad59a06bda87b5dc92a9a6e6fa43034c889 [1/11] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240723/202407231357.lp5UZ4ng-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231357.lp5UZ4ng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231357.lp5UZ4ng-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vm_normal_page_pmd
   >>> referenced by pagewalk.c
   >>>               mm/pagewalk.o:(folio_walk_start) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
