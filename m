Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595E7C
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 03:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655178675; x=1686714675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+ndtT0I6CDoeRisjwK724Qu+JMp1jNdghcFLYFJniU=;
  b=cUjr8KEjY9OnWWJ5y1YsKJiQyWyYUWpj39rSwoxTE7HHrMmGa5Q3mMQT
   DgxharXxIS6eF5+2OsjU/upkvY+/CUcxGZqnV90FECzLh0O+cZn3F0zdi
   RyRdARiRfRzmx1tsXzyqEmtUAa62UYU8wxcK3YoDLzcWeFRsXnvuAeB3M
   4oovGZAwSshVyhNnbRNxlCFehC5fDBFI0qmUXedWCd7e6WYMQgkV2Ky4h
   E+ADg3ZWMOF3RHe0XVI+azTz/AwvaK5qLgOUzeIlifcL2uCCLqGN2FZRp
   lS5+t78agbxtSEer6hO6tkasKjMEgeuF0c3OsLnCN76n/mg9+fbODbGWk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277269334"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="277269334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 20:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="535397044"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2022 20:51:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0xaC-000LRp-9r;
	Tue, 14 Jun 2022 03:51:12 +0000
Date: Tue, 14 Jun 2022 11:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:guest-unaccepted-memory 6/17] fs/proc/meminfo.c:156:5:
 warning: 'CONFIG_UNACCEPTED_MEMORY' is not defined, evaluates to 0
Message-ID: <202206141159.Vdw6s1IH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-unaccepted-memory
head:   7a902d05477ac272558ba731d903c6b0c9d72903
commit: e4fbeb9c5cb4aa02fcd17388eef920f389fc83ea [6/17] mm: Report unaccepted memory in meminfo
config: x86_64-randconfig-a002-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141159.Vdw6s1IH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/e4fbeb9c5cb4aa02fcd17388eef920f389fc83ea
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-unaccepted-memory
        git checkout e4fbeb9c5cb4aa02fcd17388eef920f389fc83ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/proc/ mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/proc/meminfo.c:156:5: warning: 'CONFIG_UNACCEPTED_MEMORY' is not defined, evaluates to 0 [-Wundef]
   #if CONFIG_UNACCEPTED_MEMORY
       ^
   1 warning generated.


vim +/CONFIG_UNACCEPTED_MEMORY +156 fs/proc/meminfo.c

   155	
 > 156	#if CONFIG_UNACCEPTED_MEMORY
   157		show_val_kb(m, "UnacceptedPages:",
   158			    global_node_page_state(NR_UNACCEPTED));
   159	#endif
   160	
   161		hugetlb_report_meminfo(m);
   162	
   163		arch_report_meminfo(m);
   164	
   165		return 0;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
