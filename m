Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB241078F;
	Tue,  1 Apr 2025 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494188; cv=none; b=SDDo/soo94r/M4UsD/mCvZxKVYF0+6N9PlKB1NsG7B9Lcex2AvYj5uv9M2zKDvfN5Qk+qQ0S6Z2voe5rgNttMNI1YELIIe8Ymy7B3EwSfzcDxIKtC5zjziY8nba/Q/sI6zlkNyMkApvZhKK2qhSzmR1DJDKR1GJxuu2CE4ZijAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494188; c=relaxed/simple;
	bh=X6qgeS0xM+XYTRsqh64yeBywgfHt7rqHpnGr3FF/KmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuJHQqzbznDCpheK5GBOxog4YVXfqMqQV8LQ8IvggvYEAqxqcWaV5eLji6DOuS6okeO1xiJLsoqqvODZaW1IQD1gFWtK2gDwNsnzYnzRErdhR7fAs9pOBap46+VN7qJnoIn2itNFSkVZUS4ry8FmS8FA+GgsxOS8zo+ftjDGDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbS+WIjQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbS+WIjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743494184; x=1775030184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6qgeS0xM+XYTRsqh64yeBywgfHt7rqHpnGr3FF/KmM=;
  b=VbS+WIjQR5UntmfOgpOObtzv9snW2OzwmmAI501Cn8Nv/81TxOCfNxpW
   9uiBpYx3QOvNck6Ea5LTcxxsIVTIzn+AwwurgRb5CUKJ35DBA4OYGwwJK
   TQa8TLnym2iEy11RbXmfD6tcG7PD69vTcFge33jcyafEqpi1CmLsl3okl
   FyaMmAVaGo7GxVoisijaGMTnlV2n5zOuN4lqbVO3wIPEM5GxSpbffu9z9
   6GvFiXn0gBR33y/7+oZJyDrqplhJHPoi1CqmYKJOGaoQMt5BF59UvGe8z
   ZascsM9jvGWRYfKQtanPSVbaQ7qOrhubtSBBi/jEn0K5kebkDVTGYzkPG
   Q==;
X-CSE-ConnectionGUID: OlGzWDTES16nT1/v5VvgBg==
X-CSE-MsgGUID: Pz8hckk+SAepYcW8NQH99A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44695340"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="44695340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:56:24 -0700
X-CSE-ConnectionGUID: juAFEvahQHykdk93/H+5lw==
X-CSE-MsgGUID: p4cFyYq8QWGDp7tSEDhruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="131525352"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Apr 2025 00:56:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzWTj-0009iM-1e;
	Tue, 01 Apr 2025 07:56:13 +0000
Date: Tue, 1 Apr 2025 15:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pabeni@redhat.com,
	edumazet@google.com, horms@kernel.org, kuba@kernel.org,
	John Ousterhout <ouster@cs.stanford.edu>
Subject: Re: [PATCH net-next v7 01/14] net: homa: define user-visible API for
 Homa
Message-ID: <202504011506.UcytJuoU-lkp@intel.com>
References: <20250331234548.62070-2-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331234548.62070-2-ouster@cs.stanford.edu>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20250401-080339
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250331234548.62070-2-ouster%40cs.stanford.edu
patch subject: [PATCH net-next v7 01/14] net: homa: define user-visible API for Homa
config: i386-buildonly-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011506.UcytJuoU-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011506.UcytJuoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011506.UcytJuoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/linux/homa.h:179: userspace cannot reference function or variable defined in the kernel
   usr/include/linux/homa.h:183: userspace cannot reference function or variable defined in the kernel

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
