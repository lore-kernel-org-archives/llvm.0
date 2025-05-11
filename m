Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F9EAFA;
	Sun, 11 May 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746928128; cv=none; b=HmzkT+/oUhYtVIFuMZdc25oPT7o2Gn+rlp/EJLD/daS35STGX6TFbSvKouMRvQxiaRl1Bw6rUhtEgH5kVxq0ACPqs0fJfsiHSCN32RwKmEDaOE4UCYI0X6kVyu1okjYdkMxSjsEJtHPjwsZRZP/A5Q6VxODdijIxtwPA1pih2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746928128; c=relaxed/simple;
	bh=sto49xYoMbjPYVeX2JVNPzeBFY+055O3s4vBRnfo7B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVVNmPyr28g5n//ofhEFFpX7Y3qalLraNVUAt09TQpIwAa3qM3gRw8e73M9LGVQAFjO1NgvzAu9uAIx6Y/yV7EIj0uRbZvn55Vk6r9Mba2poOKq8BGjHEBTXw4DbaKOfIOT1i5L63WoHnBKq01C68+qU77+1N3WgPnZaySrt4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiCgYJY6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiCgYJY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746928126; x=1778464126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sto49xYoMbjPYVeX2JVNPzeBFY+055O3s4vBRnfo7B0=;
  b=aiCgYJY6xi/apkoi87jykM7vcohcx72s1LOkD75/Sjlr4uyA5QPmhfsS
   FLGsxMN1Jsd21ixDFo9ziTomNSJZXVAV5jgoJ4FBQXqTEPXuhwiWb5nGz
   7hbt2hJuPPkFtUqmDr2fuoFWyM72k19OI3QcKFRddKwMlQ9NhSmjYDLcM
   /UMmBe3Q4tz12laqrtkRQioFQfSuBcl/G/7W2kOlV4IU+MMYT/tV4vlF+
   yj4PNGnXUwo1sKg9BxOnkOjrHwsEdFXVfw53V75haD6RquKZVUkwpEeCI
   Dl2nUUBW48F4nY7rY05di0/sVOMrODEa4imgGVU8N+MaKBTncQrccXs1x
   A==;
X-CSE-ConnectionGUID: I9cByHijRD+70imNjpEaiA==
X-CSE-MsgGUID: 0x0Pn/mwTzqp84f8FyFF2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48661832"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48661832"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 18:48:45 -0700
X-CSE-ConnectionGUID: D9w9r3/MSfm5KafviECJWQ==
X-CSE-MsgGUID: wy57fVWvTnSWa4qhVXbn+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="174180918"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2025 18:48:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDvo1-000DWl-2M;
	Sun, 11 May 2025 01:48:41 +0000
Date: Sun, 11 May 2025 09:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket 12/17] ld.lld: error: call to
 __compiletime_assert_395 marked "dontcall-error": Need native word sized
 stores/loads for atomicity.
Message-ID: <202505110941.IvT43R4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket
head:   4c247245ad525a7db1b1a5cbb5bdfc1a32b87d83
commit: 9528b1626a4416807ce96a4a592f5340bd043e1d [12/17] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: i386-buildonly-randconfig-005-20250511 (https://download.01.org/0day-ci/archive/20250511/202505110941.IvT43R4y-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110941.IvT43R4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110941.IvT43R4y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_395 marked "dontcall-error": Need native word sized stores/loads for atomicity.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
