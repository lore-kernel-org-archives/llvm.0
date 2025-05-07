Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34A1D63FC;
	Wed,  7 May 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603106; cv=none; b=uvHTNOjCDSvAbq6XfDuGhCmbdwIt1YDLYqS7gsjzU9Y4dKcNvtl5mzRp1FJVO85HPveTVUDT2MlIdKaXNWeVnzZJWtgDhgNPc8us+ddrgsB9uASU8UrGIcACr4owqpZ9N81kUnIh01YZapaI4T8Sn28WS/ll28Io+Bfq6RFAKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603106; c=relaxed/simple;
	bh=Mf0/NTdLflpKY9HJGuJz66HrwG9/gdraGlu5PKzoIz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8eG2ZBd9SU2TAGh2lpoj+pScd0OEnBboWTt0r7Z4f3eMUcFMKB2sbS2CnfwiM31NUR4WqDCLyaxjkE82Q5qPH8l+RkFypqnlTXSDFJ83uWmII1QUnRaNfH9im9JhRvhdRreCYdoDgzBAMzkzsPp9KT1ObaiiL4R6ZPNYrghBGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+peTK0u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+peTK0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603104; x=1778139104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mf0/NTdLflpKY9HJGuJz66HrwG9/gdraGlu5PKzoIz0=;
  b=X+peTK0uZpzL8Rld3nJfcx16zg/xsbww8qIa/Q8scw21lLHrvO9fvo00
   GxjUpmizU8Qe3DxWrflBuwvR+nxL4Uj/kErSlsxtYYlKhyEjPFZHipAtv
   5mPgdc/TfSHUW+riL39DAi2Xuy2Ce/nUg1oDf9ZpPg9yoaE4DKnAiejQb
   addNxdoVXCEV5i/7RLBp6kDY5mWqJmQtw71d8hwD5xn7CgDmnij6gQsbC
   j6Vo7Qvk31OIcm8+59fYOGmmPfQMGisbMpbcqi9oB0GV6SwEzU06/BP86
   DkMVSDu00SrtrAAgZkufVhnETwRyRfn0XOKyqab59laB3Pv3uGCbAAjG1
   A==;
X-CSE-ConnectionGUID: +NipHfzJQbCUrd21A7Uy3w==
X-CSE-MsgGUID: mWjIoFwURtaGzU61ynjSjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35944812"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35944812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:31:42 -0700
X-CSE-ConnectionGUID: IPsiTQDpT8+gsIw+kHhSig==
X-CSE-MsgGUID: m13zcm6iTVSwIp6EYCwMxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="173064109"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 00:31:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZFi-0007JV-1K;
	Wed, 07 May 2025 07:31:38 +0000
Date: Wed, 7 May 2025 15:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/5] locking/mutex: implement mutex_trylock_nested
Message-ID: <202505071523.2k7QnWJd-lkp@intel.com>
References: <20250430203013.366479-2-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430203013.366479-2-mlevitsk@redhat.com>

Hi Maxim,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on kvm/queue kvm/next tip/locking/core linus/master v6.15-rc5 next-20250506]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Levitsky/locking-mutex-implement-mutex_trylock_nested/20250501-043418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20250430203013.366479-2-mlevitsk%40redhat.com
patch subject: [PATCH v4 1/5] locking/mutex: implement mutex_trylock_nested
config: x86_64-randconfig-072-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071523.2k7QnWJd-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071523.2k7QnWJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071523.2k7QnWJd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.2
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0425]: cannot find function `mutex_trylock` in crate `bindings`
   --> rust/kernel/sync/lock/mutex.rs:129:41
   |
   129 |         let result = unsafe { bindings::mutex_trylock(ptr) };
   |                                         ^^^^^^^^^^^^^ help: a function with a similar name exists: `mutex_lock`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:181:5
   |
   181 |     pub fn mutex_lock(lock: *mut mutex);
   |     ----------------------------------- similarly named function `mutex_lock` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
