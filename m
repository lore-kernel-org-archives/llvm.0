Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5E20B803;
	Fri,  7 Mar 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342864; cv=none; b=GGWAjKb7E3SLHdpF8vaDqSn/sq7VuNEA0azti1PteaaNvD6XhkaNdE4uLpilqymF7twruy58rwylmBFOmj498WBOBVUwvY/QfG89/nOwTdvBLYS/y1yiG+tP6dbN36p9+RFbgWSaB4dEkdZ63o7bOrC5/vslfuF/xK+Ar7FGwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342864; c=relaxed/simple;
	bh=dQnlVGWbYiwMPKkWJqaOBto3IdcfEayFg0Vp1UtN5zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d26xzVoUBYKCu+ItTU6zdKu7cqY7KrLEsVaVqIyc7D50BEY3EgVLuMPtqLFA79itIigkfiBnx+p3IPdOwbGD4UErWP52W/EQVbnVG0wsE0Kw5tJmxBU+PlP37Uoq8ulaQ1RUYWTnWHwGG+apeuZAKzoqiW9pTL2OfELtfVafwzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI2nOCE2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI2nOCE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741342863; x=1772878863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQnlVGWbYiwMPKkWJqaOBto3IdcfEayFg0Vp1UtN5zE=;
  b=WI2nOCE2Tc3+uf7XQa/CknZxuS2LBSEcfmGPtBQV9rx05pONi5bg8ddi
   rJLpUXCJrmXgnUs0ZXi9oMBwViONl/Scu/boBS8SreJTUv3djIvrM+bq9
   dM+P/YQe6E7a9XgPAX5QKk0k0UNl9oMBZuHwJ36XimwpIKl5Zi1cchm2l
   V2gdt3MeJODm6QaC1FWsIdjerPR/hu9UovrzGxAlUKxw2p9rrm/K1MsP2
   7Zn0TJU7bToli+PAEpNCkN2ECc+yKDtNfUGzxOdDmfEFSqi6xzC8vLZdV
   X3xhchVhQRXvumQTDQ2qHstn222PkQiPH5RUUjq8raoQxJPOgPLE9l85r
   Q==;
X-CSE-ConnectionGUID: YS9gIYS3TFOMxTtMfssMIw==
X-CSE-MsgGUID: djOtXwtjR56DbG/eu36/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59944688"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="59944688"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:21:03 -0800
X-CSE-ConnectionGUID: Mn8/YWZbTgqHgbHQvAlbgg==
X-CSE-MsgGUID: 7xdn67vpSDyuLPdGCAuq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119810934"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 02:21:02 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqUp9-0000IB-0b;
	Fri, 07 Mar 2025 10:20:59 +0000
Date: Fri, 7 Mar 2025 18:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] nfsd: add some stub tracepoints around key vfs
 functions
Message-ID: <202503071828.4eKhNhUb-lkp@intel.com>
References: <20250306-nfsd-tracepoints-v1-3-4405bf41b95f@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-nfsd-tracepoints-v1-3-4405bf41b95f@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7dc86d35a5f8a7ac24b53792c704b101e5041842]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfsd-add-commit-start-done-tracepoints-around-nfsd_commit/20250306-204120
base:   7dc86d35a5f8a7ac24b53792c704b101e5041842
patch link:    https://lore.kernel.org/r/20250306-nfsd-tracepoints-v1-3-4405bf41b95f%40kernel.org
patch subject: [PATCH 3/4] nfsd: add some stub tracepoints around key vfs functions
config: arm-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071828.4eKhNhUb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071828.4eKhNhUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071828.4eKhNhUb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfsproc.c:57:2: error: call to undeclared function 'trace_nfsd_getattr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         trace_nfsd_getattr(rqstp, &argp->fh);
         |         ^
   1 error generated.


vim +/trace_nfsd_getattr +57 fs/nfsd/nfsproc.c

    46	
    47	/*
    48	 * Get a file's attributes
    49	 * N.B. After this call resp->fh needs an fh_put
    50	 */
    51	static __be32
    52	nfsd_proc_getattr(struct svc_rqst *rqstp)
    53	{
    54		struct nfsd_fhandle *argp = rqstp->rq_argp;
    55		struct nfsd_attrstat *resp = rqstp->rq_resp;
    56	
  > 57		trace_nfsd_getattr(rqstp, &argp->fh);
    58	
    59		dprintk("nfsd: GETATTR  %s\n", SVCFH_fmt(&argp->fh));
    60	
    61		fh_copy(&resp->fh, &argp->fh);
    62		resp->status = fh_verify(rqstp, &resp->fh, 0,
    63					 NFSD_MAY_NOP | NFSD_MAY_BYPASS_GSS_ON_ROOT);
    64		if (resp->status != nfs_ok)
    65			goto out;
    66		resp->status = fh_getattr(&resp->fh, &resp->stat);
    67	out:
    68		resp->status = nfsd_map_status(resp->status);
    69		return rpc_success;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
