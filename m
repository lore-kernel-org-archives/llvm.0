Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F62C82
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642857220; x=1674393220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sJ0wbIgA19cnk5VVCPT1WO+w96chFBBiTgVZNwfn80=;
  b=Z7vU2BGU9aHlqjdmxs1jd2+xTZT338dsTx6CKrt2KROVPlSSBPGvgr6a
   mMj7254tF6gMxenJiCmRF0X8ovODpuLV3l+6CqfuD4MG319ScwnPE1fum
   hoIjb+eby4HL3n/dL/pkR80lSgqbsocRpuxvh1ixSKYYhC6FkoEqEhXfR
   zdnPRqIRaB+I/kbJk/wqO0wPqm5CEtHXFH/j2pLkE260T2Uqak4WMoC3p
   933IhNUT/vCHONR7Q5L00Jpo4gRgZlaEq7pa3+r+Y6cDBj0GBVTS/6jxE
   pic9bnU6dEB4bbYC5B+PDgQvnBDzgYBjBG25lt5covuNn3kBAph1A4rTw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="245604049"
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="245604049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 05:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="478547731"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2022 05:13:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBGD3-000GQ3-2u; Sat, 22 Jan 2022 13:13:37 +0000
Date: Sat, 22 Jan 2022 21:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [cxl:preview 46/53] drivers/cxl/core/memdev.c:222:6: warning: no
 previous prototype for function 'detach_memdev'
Message-ID: <202201222155.g7TX2HHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   e675fabdbbcdb6e32dba688a20fb0bd42e0e2d5d
commit: 2b2d6579d0ee25b92d9af10c407c11cb4e3e0afe [46/53] cxl/mem: Add the cxl_mem driver
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220122/202201222155.g7TX2HHO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=2b2d6579d0ee25b92d9af10c407c11cb4e3e0afe
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 2b2d6579d0ee25b92d9af10c407c11cb4e3e0afe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/memdev.c:222:6: warning: no previous prototype for function 'detach_memdev' [-Wmissing-prototypes]
   void detach_memdev(struct work_struct *work)
        ^
   drivers/cxl/core/memdev.c:222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void detach_memdev(struct work_struct *work)
   ^
   static 
   1 warning generated.


vim +/detach_memdev +222 drivers/cxl/core/memdev.c

   221	
 > 222	void detach_memdev(struct work_struct *work)
   223	{
   224		struct cxl_memdev *cxlmd;
   225	
   226		cxlmd = container_of(work, typeof(*cxlmd), detach_work);
   227		device_release_driver(&cxlmd->dev);
   228		put_device(&cxlmd->dev);
   229	}
   230	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
