Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21A1E105C;
	Wed,  9 Oct 2024 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728496095; cv=none; b=L56ODt4n4hmd115SAulAgAqW1nXOllxZjxvkWWFA2w3jO3Mhkzs3pfETfr3nNXIqWwma2vKe4LBf3ER/Aflcs0wVGEJ4hNhNnbuy/SNoHREKpxlbYkhlYAqAd+V0eFqtz2IMCH1p6DvR7XzToPowbUIBBvmVyxR30ochS1yVURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728496095; c=relaxed/simple;
	bh=bB++Q1UDkOF7ygQpl8qjqf+2mDeK1kvI7Rdv0/gpsac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYQbsAP1Jq+P1TYSE9YdtCwwYHjqtswF+MgBqV+Jql4JmHXZIor13SDY6NfzwacXBIgDZm4UzebKpfNpciUeGV+Oewjlpf3MV0hWYwj/LS73oKa4NyHOO2yeSt0+OFqQetXeNVIRm+wRmx5dxUv1QSvghnalTBdcLcDbdF1MccU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR/Wtp83; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR/Wtp83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728496094; x=1760032094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bB++Q1UDkOF7ygQpl8qjqf+2mDeK1kvI7Rdv0/gpsac=;
  b=lR/Wtp83nmIaeUdQmPPU8YSuedGNdyvvdEyp9cTegOa8sSKKVNNCQn6+
   cfrnZJ9eNq1Vd/NfKMI9C5juaybbSVyhPvxxvAxscQ5gqjQGBZ40vs8Kh
   F9IBAwypNr4SGyaRVPgoZlTRjdHBlEP04ys2MTVvzbZpFeMtf6ZLwzko7
   3HTZ6UY3iGysJc0DxQhz+SgZo8wJygDsoZdmq5eh7bUSF0q2rmRlzaTH8
   Ygvwm8J+VzijSOiV2TlPGTo+ZAqki5f8HDpkp4FSbpzFRrkDurOFuTz6Z
   659iLO/HBilItsy3QxWku1A7S7SF2cz2/upbpWQUndDfhEr2LEAVvh3np
   A==;
X-CSE-ConnectionGUID: 5L+Ug7W0T9+y+Kt9iIxGjg==
X-CSE-MsgGUID: T57x0h1tR42vakp/ePGuOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27933418"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27933418"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 10:48:11 -0700
X-CSE-ConnectionGUID: E1KNcOifSae4RuWpEUT/9A==
X-CSE-MsgGUID: pfIZOaDqSmyHlUoVKfcc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76273538"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2024 10:48:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syanA-0009Yi-05;
	Wed, 09 Oct 2024 17:48:08 +0000
Date: Thu, 10 Oct 2024 01:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3426/3432] error[E0432]: unresolved import
 `crate::types::ARef`
Message-ID: <202410100136.vvX9cS2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: 6f1eae733bf1bfb92f5339e096b6990f28e4262f [3426/3432] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
config: x86_64-buildonly-randconfig-001-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100136.vvX9cS2a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100136.vvX9cS2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100136.vvX9cS2a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::types::ARef`
   --> rust/kernel/task.rs:10:13
   |
   10 |     types::{ARef, NotThreadSafe, Opaque},
   |             ^^^^ no `ARef` in `types`
   |
   = help: consider importing this struct instead:
   crate::sync::aref::ARef
--
>> error[E0690]: transparent struct needs at most one field with non-trivial size or alignment, but has 2
   --> rust/kernel/seq_file.rs:11:1
   |
   11 | pub struct SeqFile {
   | ^^^^^^^^^^^^^^^^^^ needs at most one field with non-trivial size or alignment, but has 2
   12 |     inner: Opaque<bindings::seq_file>,
   |     --------------------------------- this field has non-zero size or requires alignment
   13 |     _not_send: NotThreadSafe,
   |     ------------------------ this field has non-zero size or requires alignment

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
