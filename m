Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7110E0
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651154563; x=1682690563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSWCktNABCg2JAr0XSyNU855vZuk+7+gfIXAMxUwHhs=;
  b=fYVHSdTiXUhGDJy/5qEvmnGTBzb+e033z+7tdZgP87dlNOSVM2j8J6r+
   x+KeRaXuL24AMNkZYA6rizgBnyvdYuXdG2ZywkWpTPvugAL1dGP2PdI8t
   yqDtL5BbTUZWvNNSwCIhQ/kKYftWrtyWUQwgWUcYRmzsygJCAx4zMDoTG
   3sTO3LVtr5heMRs+CTH8RIxBcblL6JETTiflJzbmBzn+W+kTS9aY/Bzsh
   ICCjcRWop9V800PqDseG2xJ+QaC8e40NkuJlBH5cadgQsM7ADgOOp2mV1
   y5giPPcBxvSuUCYv+6zEggUPzksX1aD5sUVmtruVAy7krIHA7beJ+HM38
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246856286"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="246856286"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 07:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="533896104"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2022 07:02:40 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk4jA-0005QV-6i;
	Thu, 28 Apr 2022 14:02:40 +0000
Date: Thu, 28 Apr 2022 22:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v22 3/7] NFSD: move create/destroy of laundry_wq to
 init_nfsd and exit_nfsd
Message-ID: <202204282121.iXZUgvEw-lkp@intel.com>
References: <1651049573-29552-4-git-send-email-dai.ngo@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651049573-29552-4-git-send-email-dai.ngo@oracle.com>

Hi Dai,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.18-rc4 next-20220428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dai-Ngo/NFSD-Initial-implementation-of-NFSv4-Courteous-Server/20220427-170058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 46cf2c613f4b10eb12f749207b0fd2c1bfae3088
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220428/202204282121.iXZUgvEw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/307ca77662e02a78c4048c49092ec3bd72f6dcc2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dai-Ngo/NFSD-Initial-implementation-of-NFSv4-Courteous-Server/20220427-170058
        git checkout 307ca77662e02a78c4048c49092ec3bd72f6dcc2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfssvc.c:27:
>> fs/nfsd/nfsd.h:180:59: error: expected ';' after return statement
   static inline int nfsd4_create_laundry_wq(void) { return 0 };
                                                             ^
                                                             ;
   1 error generated.
--
   In file included from fs/nfsd/export.c:21:
>> fs/nfsd/nfsd.h:180:59: error: expected ';' after return statement
   static inline int nfsd4_create_laundry_wq(void) { return 0 };
                                                             ^
                                                             ;
   fs/nfsd/export.c:979:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
           struct inode            *inode;
                                    ^
   1 warning and 1 error generated.
--
   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:442:
   In file included from fs/nfsd/state.h:42:
>> fs/nfsd/nfsd.h:180:59: error: expected ';' after return statement
   static inline int nfsd4_create_laundry_wq(void) { return 0 };
                                                             ^
                                                             ;
   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:1130:
   include/trace/define_trace.h:95:10: fatal error: './trace.h' file not found
   #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:90:32: note: expanded from macro 'TRACE_INCLUDE'
   # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:87:34: note: expanded from macro '__TRACE_INCLUDE'
   # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
   #define __stringify(x...)       __stringify_1(x)
                                   ^~~~~~~~~~~~~~~~
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
   #define __stringify_1(x...)     #x
                                   ^~
   <scratch space>:45:1: note: expanded from here
   "./trace.h"
   ^~~~~~~~~~~
   2 errors generated.


vim +180 fs/nfsd/nfsd.h

   150	
   151	/* 
   152	 * NFSv4 State
   153	 */
   154	#ifdef CONFIG_NFSD_V4
   155	extern unsigned long max_delegations;
   156	int nfsd4_init_slabs(void);
   157	void nfsd4_free_slabs(void);
   158	int nfs4_state_start(void);
   159	int nfs4_state_start_net(struct net *net);
   160	void nfs4_state_shutdown(void);
   161	void nfs4_state_shutdown_net(struct net *net);
   162	int nfs4_reset_recoverydir(char *recdir);
   163	char * nfs4_recoverydir(void);
   164	bool nfsd4_spo_must_allow(struct svc_rqst *rqstp);
   165	int nfsd4_create_laundry_wq(void);
   166	void nfsd4_destroy_laundry_wq(void);
   167	#else
   168	static inline int nfsd4_init_slabs(void) { return 0; }
   169	static inline void nfsd4_free_slabs(void) { }
   170	static inline int nfs4_state_start(void) { return 0; }
   171	static inline int nfs4_state_start_net(struct net *net) { return 0; }
   172	static inline void nfs4_state_shutdown(void) { }
   173	static inline void nfs4_state_shutdown_net(struct net *net) { }
   174	static inline int nfs4_reset_recoverydir(char *recdir) { return 0; }
   175	static inline char * nfs4_recoverydir(void) {return NULL; }
   176	static inline bool nfsd4_spo_must_allow(struct svc_rqst *rqstp)
   177	{
   178		return false;
   179	}
 > 180	static inline int nfsd4_create_laundry_wq(void) { return 0 };
   181	static inline void nfsd4_destroy_laundry_wq(void) {};
   182	#endif
   183	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
