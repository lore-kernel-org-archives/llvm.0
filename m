Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FECF479895;
	Tue, 15 Sep 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465428; cv=none; b=o1PYcXBh5XiCglKsUPVQzTDaGxjb83cdD+NwaEAykmbRjJTpDl+QnDETZK/p8p6fAkvcJGQgTUn7rMCA7GyWwLzZmRRtBqJWXHyi3ldZ4+5XkFS/9DVU/K3yOhEwAinzm45dSe//QdEeviZhmVHe0r2lbvj5k/5VIY2Wz1n1SCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465428; c=relaxed/simple;
	bh=MGpSjBR+ocgxGXPO4UimstJCvQ+U/X7vqAiYBYADG9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAzVF46s2VH0hwRlhajuwPVX1eb1IWMOyNMacRhb43lD+bY8vFbFQ9f6xxAKq5jrznDGuFlwBXRsqO7lkZIW+5SF9njeiwCcAMG1xP/21ureGBdcrDxQlu12SUsQTVs+t7eHD9eszldWJvyw+B1cXt5p/BjR1aTyJBE3jZm1VKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMcSNCem; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMcSNCem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789465425; x=1821001425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGpSjBR+ocgxGXPO4UimstJCvQ+U/X7vqAiYBYADG9w=;
  b=gMcSNCem6Y769FfILEIZXC76SkkqFlC88kN1D6WqBGIhS+l0T3uJXcaP
   35+00+Nw0VZdSMQVhIguIXNEfEchCk8y+mG0aL91cL5jKSvQX+6wBUeUO
   VRzP3G2TYGMnsY3sI12vztADDz+lnVnFmArk1vTTtAw9h+B3GG9vpTpd1
   LnHB7RoP++8Ef7re+8V33jCjgSF+8wryeOf/bNTpUXbhjhZKQ+Fa7Y4KX
   DIST2LyVo+U++iQakAA6OJQq/KmOTpUvN6WX5Td7U9Nm5jlDnJAAk9yq0
   TurOzfzsbAG4tJifcPKQ5ugNju11qN8Lk5iKpHcBUbKmLzr9LNFkTsp5X
   A==;
X-CSE-ConnectionGUID: 0fptOdldQA2G5QIe6ZC4/g==
X-CSE-MsgGUID: aAuQFrGPRzSgWZtFmFSBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100420448"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100420448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:43:44 -0700
X-CSE-ConnectionGUID: zGi5iV8zTduuRkLcp9EdgA==
X-CSE-MsgGUID: lSJnQGzQQNKBn/4HTzU+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272912812"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 02:43:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6PhT-000000004L7-0oTj;
	Tue, 15 Sep 2026 09:43:39 +0000
Date: Tue, 15 Sep 2026 17:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, a.hindborg@kernel.org,
	boqun@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ardalan@uci.edu,
	zhiyunq@cs.ucr.edu, dzueck@uci.edu, pgovind2@uci.edu
Subject: Re: [PATCH 1/1] rust: block: Fix unsoundness in
  `Operations::queue_rq`
Message-ID: <202609151724.qbLBSoTM-lkp@intel.com>
References: <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>

Hi Priya,

kernel test robot noticed the following build errors:

[auto build test ERROR on ah-configfs/configfs-next]
[also build test ERROR on rust/rust-next linus/master v7.3-rc3 next-20260911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Priya-Bala-Govindasamy/rust-block-Fix-unsoundness-in-Operations-queue_rq/20260914-214701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/configfs.git configfs-next
patch link:    https://lore.kernel.org/r/f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2%40uci.edu
patch subject: [PATCH 1/1] rust: block: Fix unsoundness in  `Operations::queue_rq`
config: loongarch-randconfig-001-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151724.qbLBSoTM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151724.qbLBSoTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151724.qbLBSoTM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0200]: the trait `rust_doctest_kernel_alloc_allocator_rs_0::kernel::block::mq::Operations` requires an `unsafe impl` declaration
   --> rust/doctests_kernel_generated.rs:4101:1
   |
   4101 | impl Operations for MyBlkDevice {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: the trait `rust_doctest_kernel_alloc_allocator_rs_0::kernel::block::mq::Operations` enforces invariants that the compiler can't check. Review the trait documentation and make sure this implementation upholds those invariants before adding the `unsafe` keyword
   help: add `unsafe` to this trait implementation
   |
   4101 | unsafe impl Operations for MyBlkDevice {
   | ++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
