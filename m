Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBD1863;
	Thu,  4 May 2023 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683196704; x=1714732704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9DoSdXD98Kbgr75+eqQkTtqq+LoekYsauPScmzlF5Ag=;
  b=SBmATPy+elzk9X6vy7Iu4UJCJWEENjFpzibtQqU+53t3K8lHcxbiegYB
   VP1RHU8Mr4TZYSGPw1c6FhWsHfg/hgosrWZWLxOq/FobF6tUOiL78ILcW
   1Jy7tUFoVnYT6lG1ZgQAUgwNqEFGW/xSYMdZC6rII6621/5zjRCaOIqcL
   X0jy3m0uJgVTsVfrpUCPyaGTyZzWGPQpSR+b7r/XIPkl8WBRa91STpdfC
   QM+9Ocdv4Me16bvoZLpEcxcVqiKVGKIecEBM4wRLIXyYcbyDDkmasCGMk
   XkdLZD0lLtYO/GoQFZAK2U+fQTtxV1DPruyqwWkQ/jba19ISTV19Rp3RS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376963324"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="376963324"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 03:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="766515228"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="766515228"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 03:38:22 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puWLt-0002qq-1j;
	Thu, 04 May 2023 10:38:21 +0000
Date: Thu, 4 May 2023 18:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <pc@manguebit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] cifs: fix sharing of DFS connections
Message-ID: <202305041804.gcUhBfzt-lkp@intel.com>
References: <20230503222117.7609-8-pc@manguebit.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503222117.7609-8-pc@manguebit.com>

Hi Paulo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[also build test WARNING on linus/master next-20230428]
[cannot apply to cifs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paulo-Alcantara/cifs-fix-potential-race-when-tree-connecting-ipc/20230504-062335
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230503222117.7609-8-pc%40manguebit.com
patch subject: [PATCH 7/7] cifs: fix sharing of DFS connections
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230504/202305041804.gcUhBfzt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5a2a7b1846bb61ee5669afdfe2238eaa80c339c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paulo-Alcantara/cifs-fix-potential-race-when-tree-connecting-ipc/20230504-062335
        git checkout 5a2a7b1846bb61ee5669afdfe2238eaa80c339c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/cifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041804.gcUhBfzt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cifs/connect.c:2310:26: warning: variable 'server' set but not used [-Wunused-but-set-variable]
           struct TCP_Server_Info *server;
                                   ^
   1 warning generated.


vim +/server +2310 fs/cifs/connect.c

  2306	
  2307	void
  2308	cifs_put_tcon(struct cifs_tcon *tcon)
  2309	{
> 2310		struct TCP_Server_Info *server;
  2311		struct cifs_ses *ses;
  2312		unsigned int xid;
  2313	
  2314		/*
  2315		 * IPC tcon share the lifetime of their session and are
  2316		 * destroyed in the session put function
  2317		 */
  2318		if (tcon == NULL || tcon->ipc)
  2319			return;
  2320	
  2321		ses = tcon->ses;
  2322		server = ses->server;
  2323		cifs_dbg(FYI, "%s: tc_count=%d\n", __func__, tcon->tc_count);
  2324		spin_lock(&cifs_tcp_ses_lock);
  2325		spin_lock(&tcon->tc_lock);
  2326		if (--tcon->tc_count > 0) {
  2327			spin_unlock(&tcon->tc_lock);
  2328			spin_unlock(&cifs_tcp_ses_lock);
  2329			return;
  2330		}
  2331	
  2332		/* tc_count can never go negative */
  2333		WARN_ON(tcon->tc_count < 0);
  2334	
  2335		list_del_init(&tcon->tcon_list);
  2336		tcon->status = TID_EXITING;
  2337		spin_unlock(&tcon->tc_lock);
  2338		spin_unlock(&cifs_tcp_ses_lock);
  2339	
  2340		/* cancel polling of interfaces */
  2341		cancel_delayed_work_sync(&tcon->query_interfaces);
  2342	#ifdef CONFIG_CIFS_DFS_UPCALL
  2343		cancel_delayed_work_sync(&tcon->dfs_cache_work);
  2344	#endif
  2345	
  2346		if (tcon->use_witness) {
  2347			int rc;
  2348	
  2349			rc = cifs_swn_unregister(tcon);
  2350			if (rc < 0) {
  2351				cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
  2352						__func__, rc);
  2353			}
  2354		}
  2355	
  2356		xid = get_xid();
  2357		if (ses->server->ops->tree_disconnect)
  2358			ses->server->ops->tree_disconnect(xid, tcon);
  2359		_free_xid(xid);
  2360	
  2361		cifs_fscache_release_super_cookie(tcon);
  2362		tconInfoFree(tcon);
  2363		cifs_put_smb_ses(ses);
  2364	}
  2365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
