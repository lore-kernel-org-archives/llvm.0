Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604D6104;
	Tue,  9 Jan 2024 04:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g14RKh+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704773704; x=1736309704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQ/iaGXFPMIzkkJS7CqVoqvsZXIARMC/+FaP8pR1SVg=;
  b=g14RKh+BJhHvwhyyBWEOOUVw9aT89FyGFjnUOP2pI08j7MLbPkGQYE1g
   OezivZvEUU/GYU4ws4qELdvIIfi6FheNsV6aQJEdSU59dFp37Gh0xehN3
   H0F7deAuZq6NJ0mO1FHTDFFUSL1gYK4Ecy7z42DgonjWlFlr6oDQXLIMw
   17TQ8tN4pdWciV8Sft7L6BEd00oNN7a7aKEfyDYUyukD2/7gOyfrvI9GO
   6vF0Sg+yMfzyoboAkehd5fX+gMqan77tmtZZrnQXouZI+jFN50z1sI6iT
   aDBYennL/CG3Fbt5Ht87kOB8KtMjR2Cxwr6Ukp3gAgJ5vS7cKZy1HxWSt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5426392"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="5426392"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 20:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872104782"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="872104782"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2024 20:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN3Vw-0005SO-0Q;
	Tue, 09 Jan 2024 04:14:56 +0000
Date: Tue, 9 Jan 2024 12:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [gmprice:mempolicy2_mbind2 3/12] mm/mempolicy.c:1992:14: warning:
 variable length array used
Message-ID: <202401091205.hyEFknS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   4aff1aeabff106d25029a57f52d961d703588bc3
commit: fcf523ffd2839c474457c3af29555129848d8eb3 [3/12] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240109/202401091205.hyEFknS4-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091205.hyEFknS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091205.hyEFknS4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:1992:14: warning: variable length array used [-Wvla]
    1992 |                 u8 weights[nr_nodes];
         |                            ^~~~~~~~
   mm/mempolicy.c:2419:14: warning: variable length array used [-Wvla]
    2419 |                 u8 weights[nnodes];
         |                            ^~~~~~
   2 warnings generated.


vim +1992 mm/mempolicy.c

  1981	
  1982	static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  1983	{
  1984		nodemask_t nodemask;
  1985		unsigned int target, weight_total, nr_nodes, cur_node;
  1986		int nid = numa_node_id();
  1987		u8 weight;
  1988	
  1989		nr_nodes = read_once_policy_nodemask(pol, &nodemask);
  1990	
  1991		if (nr_nodes) {
> 1992			u8 weights[nr_nodes];
  1993	
  1994			weight_total = read_once_interleave_weights(pol, weights,
  1995								    &nodemask);
  1996			if (!weight_total)
  1997				return nid;
  1998	
  1999			/* Finally, calculate the node offset based on totals */
  2000			target = ilx % weight_total;
  2001			nid = first_node(nodemask);
  2002			cur_node = 0;
  2003			while (target) {
  2004				weight = weights[cur_node++];
  2005				if (target < weight)
  2006					break;
  2007				target -= weight;
  2008				nid = next_node_in(nid, nodemask);
  2009			}
  2010		}
  2011		return nid;
  2012	}
  2013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
