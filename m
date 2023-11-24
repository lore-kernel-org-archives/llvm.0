Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E22FC32;
	Fri, 24 Nov 2023 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkSol9+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840486; x=1732376486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D5UoaHtWexbdAnxceTXgFK3Cx1P8AsRR0+3dQ45KcHg=;
  b=QkSol9+GvoOPCAm9OHdVr+WYs00DrPIbAthc1XIvcqlDj71mCZVhXtEh
   BEEIm6rAdee6orYIoAmlboFTp+T3IHbLlMB0AkOGP2jnekEykkt0gkhX9
   F61DHQBPkQig/VkKLP5JfGr208ShDJsqMEnUp2WPMO5owQW5K/O/yVb4m
   ZqV8pjqTKHsXA4TSKEg9/MyA/5A4uWCbpFqMD3H0eqesV1I60mMJPUtDq
   2R46QD6AQ1VSJFxTudiajYhrS+mDcjKkZkW5gNfZKjmjXRrpmsDJuFCfY
   MYbgH/A0Ss/BPc1rNSOjgIttOG1RkP+5S2kdKfGtfpdGHPXjtuOekMQNb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478650493"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="478650493"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="838110799"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="838110799"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2023 07:41:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIx-0002xg-1n;
	Fri, 24 Nov 2023 15:41:19 +0000
Date: Fri, 24 Nov 2023 23:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH 11/11] nfsd: allow layout state to be admin-revoked.
Message-ID: <202311241941.jNlc0B4A-lkp@intel.com>
References: <20231124002925.1816-12-neilb@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124002925.1816-12-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/nfsd-hold-cl_lock-for-hash_delegation_locked/20231124-123723
base:   linus/master
patch link:    https://lore.kernel.org/r/20231124002925.1816-12-neilb%40suse.de
patch subject: [PATCH 11/11] nfsd: allow layout state to be admin-revoked.
config: x86_64-buildonly-randconfig-002-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241941.jNlc0B4A-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241941.jNlc0B4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241941.jNlc0B4A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/export.c:24:
>> fs/nfsd/pnfs.h:94:46: warning: declaration of 'struct nfs4_layout_stateid' will not be visible outside of this function [-Wvisibility]
   static inline void nfsd4_close_layout(struct nfs4_layout_stateid *ls)
                                                ^
   fs/nfsd/export.c:1016:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
           struct inode            *inode;
                                    ^
   2 warnings generated.


vim +94 fs/nfsd/pnfs.h

    86	
    87	static inline void nfsd4_return_all_client_layouts(struct nfs4_client *clp)
    88	{
    89	}
    90	static inline void nfsd4_return_all_file_layouts(struct nfs4_client *clp,
    91			struct nfs4_file *fp)
    92	{
    93	}
  > 94	static inline void nfsd4_close_layout(struct nfs4_layout_stateid *ls)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
