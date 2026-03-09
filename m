Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972BD28468E;
	Mon,  9 Mar 2026 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086537; cv=none; b=OCQmtVM58+Ewb41BIXowOPCgmK3u/B8l0u3gQuD+41xgcZ/owlleMYFJ9VOFxi9FywE+BXum501yDUUfLFi2IfAZ8n8faMs7xXUcOJ1ry4cWqQNZD/sPPKjN7ADUZgG9z6bRi7mTmLMXa2y7B46p38Ufp7VAuoc93EYiIsvcsao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086537; c=relaxed/simple;
	bh=KwN2/QpGEWJWWCk/fREnpSRX85f5N6DdZdaRA3c0G6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDLgpce3GHuBe7vnyaIgEsRRgQt16p1bEeEg9Wvbut9B9Elr7W1RdXSMy0mgIlRNJnwUNi4Nk17CuhgKXSPfXo8kaxtpSO05VPNnBL3mDHNTOVAZZeBt+4h7Na8O36X5i6IX3f1W2p/UJ1/pIEp+t8m9g9n0r2+zIdy/kHdoYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVltCFGS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVltCFGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773086536; x=1804622536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KwN2/QpGEWJWWCk/fREnpSRX85f5N6DdZdaRA3c0G6k=;
  b=WVltCFGSARaTPGNXADoqZTWVIW5Jq9bWiyZbwArCfYcqG3oFqgttB+iU
   vIcKcUfuvAsYOfMw6VjVCNl4eiexYpwsifVnUqpEY/p7ZBIAOiG39WLXr
   j17UAiLbtVG/hMmlQyIyMGSjeC+Fiandmk5AZZu53YgO6z+qtkbNhee9J
   AQLFDCOXlMDRK6umkUWGS9wohc5ECQ1ENuo4KLIbmIkq3nc9KsmoGswQe
   swUCWI0iyITSDV/FfvDZnr8G8G3HwTRnS1jgrxJtHBIufK0kinW5n3gng
   qtxDyo/zhsz13ncBOmyDd6JDnHt4V4cNKNO4nJ/8xgte32Mq6YvW6t3l+
   Q==;
X-CSE-ConnectionGUID: MLVdqCmoRkC9zQQuABdOuA==
X-CSE-MsgGUID: 9SnuqK/VT4esOSW1Q0QTXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84449963"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84449963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 13:02:15 -0700
X-CSE-ConnectionGUID: DXxdW0NzQda9QHQTYmEHug==
X-CSE-MsgGUID: 8xBox6r2QyuVL/4EgABK8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="223975906"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2026 13:02:12 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzgnp-000000000m8-0V8m;
	Mon, 09 Mar 2026 20:02:09 +0000
Date: Tue, 10 Mar 2026 04:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>, brauner@kernel.org, hch@lst.de,
	djwong@kernel.org, jack@suse.cz, cem@kernel.org, kbusch@kernel.org,
	axboe@kernel.dk
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gost.dev@samsung.com, Kanchan Joshi <joshi.k@samsung.com>
Subject: Re: [PATCH v2 4/5] xfs: steer allocation using write stream
Message-ID: <202603100305.6kIq1qtR-lkp@intel.com>
References: <20260309052944.156054-5-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309052944.156054-5-joshi.k@samsung.com>

Hi Kanchan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/fs-add-generic-write-stream-management-ioctl/20260309-133736
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260309052944.156054-5-joshi.k%40samsung.com
patch subject: [PATCH v2 4/5] xfs: steer allocation using write stream
config: arm-randconfig-002-20260309 (https://download.01.org/0day-ci/archive/20260310/202603100305.6kIq1qtR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100305.6kIq1qtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100305.6kIq1qtR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by xfs_inode.c:126 (fs/xfs/xfs_inode.c:126)
   >>>               fs/xfs/xfs_inode.o:(xfs_inode_write_stream_to_ag) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
