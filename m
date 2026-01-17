Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD52D7DD5;
	Sat, 17 Jan 2026 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768674677; cv=none; b=Ebo1KchHa0gTIS8QmtttUyFcOZXnbQsTGEi+MTbSCcF9WeKXKypiFBk8cxHLRnSpzqpRu3Ki3jlXXloJPP0s5g20kK37wOIuLg46JHWL+/HYCtaBEe2NZWH774LHa2tF/uz8O1G//Dsa+9J60mtoHI4lI/ghmut9lOWn5yBAi7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768674677; c=relaxed/simple;
	bh=aTkbxl3lYXIJ4D1eCN10mVbG/Ol/FgsJaAk3tI1J0yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gny4BPhDO6JEo5qc4SRCFYpCUgj3fdkH0ZwV1f5XixGTXey/2pQw0kEOa/p4sz3qK/bjaCpigQ24g4t3za4CnZaK3LuqDsfV7RQJXq+aOLxtjvYvzJdjoy7zPAabDN0jABFfv2hMkhu4h6d3VOJUm6qwxFGxXYXgWALmIOVQW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKO4QeD7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKO4QeD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768674675; x=1800210675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTkbxl3lYXIJ4D1eCN10mVbG/Ol/FgsJaAk3tI1J0yM=;
  b=XKO4QeD7KPJPqrE0LTi7UcFF+UOvkfzjpmox+elTFwYklDh7ZWNYqjao
   NpQlhW4NL2KV2PWHnmqPfJCKWiRQTaB4veZEpNKzcOSHxoIT30j+q2Lb/
   jyR/SMbztvPhljHxB8KTbfoPmrngU2G3Gj1NHzvhmUHCLf2R3HZLRUzcN
   bx9QI2DiAK9n/IFXE10pIBLDLCKce0crYyG9IRCqx+vzElMTE/GDl/lgZ
   PcpjglxpXPoikvvQqtifRnNUlpNFG8p+A0QF0EGPfUeskSc7/nVHz2nkL
   Wl7xxpp49mBPWP4w3K4sb6g5YgVPVIfyvdyDPhVHyL2eUT4tbVfQJ9O0s
   Q==;
X-CSE-ConnectionGUID: vFFQ83gJRlGJ5TtGTSa4wA==
X-CSE-MsgGUID: gVdrQFZaR4iszN6PzDG8uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69928034"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69928034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:31:14 -0800
X-CSE-ConnectionGUID: ZAYtqoq6TeWZ8PDxIfiAOg==
X-CSE-MsgGUID: 94nP9B8rR4eqvkmbtTo1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="209996337"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 10:31:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhB4o-00000000M8M-0EYC;
	Sat, 17 Jan 2026 18:31:10 +0000
Date: Sun, 18 Jan 2026 02:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/3] bsg: add uring_cmd support to BSG generic
 layer
Message-ID: <202601180229.GMPWbiZI-lkp@intel.com>
References: <217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei@kylinos.cn>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next axboe/for-next linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiuwei/bsg-add-bsg_uring_cmd-uapi-structure/20260116-123155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei%40kylinos.cn
patch subject: [RFC PATCH v3 2/3] bsg: add uring_cmd support to BSG generic layer
config: x86_64-randconfig-003-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180229.GMPWbiZI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180229.GMPWbiZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180229.GMPWbiZI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: scsi_bsg_uring_cmd
   >>> referenced by bsg.c:217 (block/bsg.c:217)
   >>>               block/bsg.o:(bsg_uring_cmd) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
