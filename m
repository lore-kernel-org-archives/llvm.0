Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A5398;
	Fri, 20 Oct 2023 01:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9tsfyW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697766044; x=1729302044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBcNQvxkTEiXwcSho1CR+VNvdSGqKOWhVmYFDSRz1yk=;
  b=N9tsfyW3YA6IXbD694rIefn5tlz+OAnaM/95MWEg7mgYHkfSN8bVhM6A
   xaKuTephrKquIoezsVUCH9Y0CtvmMVvKmcAqp0OWOnreH7Aj6HwCx7H81
   yVlqnyfO+ln47I9TTiuUoEUpwi8ShLWOws87SaixU2L3dgH3r4Idcobzq
   eCMBRO0+Ski9rE0RMvPQYC3SzYS7oZOVqTMat+u0SWk31WLyuVX/+sTnn
   9kiPOp6hz8/O60g0wPkmykCornY6VZp9fApBJYXcSzNLK1O5ogTaBJb/v
   ArDe59BSZJ7lYBJ9coZTayedIzEGGSddEJMekmwL+6EJFc734gx1NwSXQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389272341"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="389272341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5221860"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 18:40:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qteVC-0002q6-0w;
	Fri, 20 Oct 2023 01:40:38 +0000
Date: Fri, 20 Oct 2023 09:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH -next v2] sunrpc: Use no_printk() in dfprintk*() dummies
Message-ID: <202310200948.TK9Y6iGy-lkp@intel.com>
References: <a93de2e8afa826745746b00fc5f64e513df5d52f.1697104757.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a93de2e8afa826745746b00fc5f64e513df5d52f.1697104757.git.geert+renesas@glider.be>

Hi Geert,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231016]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/sunrpc-Use-no_printk-in-dfprintk-dummies/20231017-104813
base:   next-20231016
patch link:    https://lore.kernel.org/r/a93de2e8afa826745746b00fc5f64e513df5d52f.1697104757.git.geert%2Brenesas%40glider.be
patch subject: [PATCH -next v2] sunrpc: Use no_printk() in dfprintk*() dummies
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231020/202310200948.TK9Y6iGy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200948.TK9Y6iGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200948.TK9Y6iGy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfsfh.c:111:45: error: use of undeclared identifier 'buf'
                           svc_print_addr(rqstp, buf, sizeof(buf)));
                                                             ^
   fs/nfsd/nfsfh.c:111:33: error: use of undeclared identifier 'buf'
                           svc_print_addr(rqstp, buf, sizeof(buf)));
                                                 ^
   2 errors generated.


vim +/buf +111 fs/nfsd/nfsfh.c

9d7ed1355db5b00 J. Bruce Fields 2018-03-08  101  
6fa02839bf9412e J. Bruce Fields 2007-11-12  102  static __be32 nfsd_setuser_and_check_port(struct svc_rqst *rqstp,
6fa02839bf9412e J. Bruce Fields 2007-11-12  103  					  struct svc_export *exp)
6fa02839bf9412e J. Bruce Fields 2007-11-12  104  {
12045a6ee9908b3 J. Bruce Fields 2009-12-08  105  	int flags = nfsexp_flags(rqstp, exp);
12045a6ee9908b3 J. Bruce Fields 2009-12-08  106  
6fa02839bf9412e J. Bruce Fields 2007-11-12  107  	/* Check if the request originated from a secure port. */
9d7ed1355db5b00 J. Bruce Fields 2018-03-08  108  	if (!nfsd_originating_port_ok(rqstp, flags)) {
5216a8e70e25b01 Pavel Emelyanov 2008-02-21  109  		RPC_IFDEBUG(char buf[RPC_MAX_ADDRBUFLEN]);
a48fd0f9f77b6e1 Kinglong Mee    2014-05-29  110  		dprintk("nfsd: request from insecure port %s!\n",
6fa02839bf9412e J. Bruce Fields 2007-11-12 @111  		        svc_print_addr(rqstp, buf, sizeof(buf)));
6fa02839bf9412e J. Bruce Fields 2007-11-12  112  		return nfserr_perm;
6fa02839bf9412e J. Bruce Fields 2007-11-12  113  	}
6fa02839bf9412e J. Bruce Fields 2007-11-12  114  
6fa02839bf9412e J. Bruce Fields 2007-11-12  115  	/* Set user creds for this exportpoint */
6fa02839bf9412e J. Bruce Fields 2007-11-12  116  	return nfserrno(nfsd_setuser(rqstp, exp));
6fa02839bf9412e J. Bruce Fields 2007-11-12  117  }
6fa02839bf9412e J. Bruce Fields 2007-11-12  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
