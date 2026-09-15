Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977641D4F3;
	Tue, 15 Sep 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479953; cv=none; b=N/9hUABby0Ch50i5yaWKB4q+kwAY3hBPg4yrEC4Ks/ZqTslwJu0bpgtgYG+DnkTGbwHq5K+hY2K8Fch9Hv6urBy+DtFvDETDTVOcvqEQ9aeu6etdrRYNUWRR0Mf96/1uqXdg9HU+sKsd4zVu543yZGxv3yLYSXiTAAEhllaRYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479953; c=relaxed/simple;
	bh=tY116aE2yr9evAttuWEg1UGDXG8kUMGyRGCyRkwmOTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM4ISzNp4Rtv4WB9yRK43XtDgyawN/4BySp+tE91zOseSCLtMp3ApRXUzkWitZaFarX5brAfZpa9rXa4zwkOXAEL8eEr2QaFTVCVLTYTTF4GT8QoPO97NakJE970EVq0+G0axjnOe7Prw8HE9gBYJ2zi5CxzQVaYNMKduhPOc7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GY4RgUbL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GY4RgUbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789479951; x=1821015951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tY116aE2yr9evAttuWEg1UGDXG8kUMGyRGCyRkwmOTc=;
  b=GY4RgUbL+ErDDcP3UK/GJe3q8Rp4vZE642TTjFZaKQ/PmVuyfMFonRFw
   LtABFIeMeMIGMGEXjv1P5qjHgv4OUVVbA0HHUapcfjnKpHd1597PA2ylH
   7AyTebpDfiGYx2AP1OBHaYRguUqJ+RqZOVIpqfAqSbDnBAxT7J3TvXmgB
   jTiiPow8TKvQhvgeEO+0tOoo9bXrjjcfHvdpAKZzI7nBcLvAybLXviuSc
   Lr/D5/S6ISagL37IRdqxUeihSlJ5dIjMz63A+Td8L8I+s+dpmZaQQ9Ybw
   ubm9dtdUb+cwhSNZH5lRvst4aOBmPJmjTDCZsUUFqqSr/z7G+ncReXhEV
   A==;
X-CSE-ConnectionGUID: hAxWWIkpScOi+08gW2MA1Q==
X-CSE-MsgGUID: HtzlC7bsRtugnK2bZpAyHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88781681"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88781681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:45:51 -0700
X-CSE-ConnectionGUID: 0WBgAhPXRdKC9wuIu8JGTw==
X-CSE-MsgGUID: SbtTye6fRNe+FQ9Gq0RZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272536075"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2026 06:45:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6TTm-000000004bh-0weZ;
	Tue, 15 Sep 2026 13:45:46 +0000
Date: Tue, 15 Sep 2026 21:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, a.hindborg@kernel.org,
	boqun@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ardalan@uci.edu,
	zhiyunq@cs.ucr.edu, dzueck@uci.edu, pgovind2@uci.edu
Subject: Re: [PATCH 1/1] rust: block: Fix unsoundness in
  `Operations::queue_rq`
Message-ID: <202609152118.xAc2Dsw9-lkp@intel.com>
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
[also build test ERROR on rust/rust-next linus/master v7.3-rc3 next-20260914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Priya-Bala-Govindasamy/rust-block-Fix-unsoundness-in-Operations-queue_rq/20260914-214701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/configfs.git configfs-next
patch link:    https://lore.kernel.org/r/f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2%40uci.edu
patch subject: [PATCH 1/1] rust: block: Fix unsoundness in  `Operations::queue_rq`
config: x86_64-randconfig-072-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152118.xAc2Dsw9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152118.xAc2Dsw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152118.xAc2Dsw9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0200]: the trait `Operations` requires an `unsafe impl` declaration
   --> drivers/block/rnull/rnull.rs:73:1
   |
   73 | impl Operations for NullBlkDevice {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: the trait `Operations` enforces invariants that the compiler can't check. Review the trait documentation and make sure this implementation upholds those invariants before adding the `unsafe` keyword
   help: add `unsafe` to this trait implementation
   |
   73 | unsafe impl Operations for NullBlkDevice {
   | ++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
