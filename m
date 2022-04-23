Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBEF7A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650731411; x=1682267411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erq/J6IugNqFBPl/JfID0tI97ob10byjp/0rK7jZ9Qw=;
  b=OqhD4FDl5PdB8ym4lQiejASBJ7H9SYJvK/yDdP17UIxipOxfNcKEcBjV
   HgrVn3dVpNYHHSCFER0b4C/8hoRzwm/rMvpUlZOJkOBJof4ofQW661IZO
   WeCGSfZQSCbnYdmCL46zBOxw+canzJYWmWPvxTTv38uy8wJ7zynvPOTru
   3Egp0mDULa9HRpmmtvyLAjkFxX5N5HV9Yig4XU9T3MctLkBsegutbhKpT
   LIgrUp58NNk2J58GAFSWs+8PkvL5dUpuVPUyi1Sju+d3CGcAzsTce82OJ
   vpBGqCTrWIgNMsG4cfAXMYta+X1VnPWnbsQOxJNtadoLLQeBloUzEJ/gj
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="244838079"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="244838079"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 09:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="531346832"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Apr 2022 09:30:09 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niIe8-0000Dz-DQ;
	Sat, 23 Apr 2022 16:30:08 +0000
Date: Sun, 24 Apr 2022 00:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1760/2579] fs/ceph/cache.h:130:9: error:
 call to undeclared function 'filemap_dirty_folio'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202204240008.JDntM9cU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 5906052f724ace8783a32193d743f4db58a3bfee [1760/2579] headers/deps: writeback: Remove the <linux/writeback_api.h> header from <linux/writeback.h>
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220424/202204240008.JDntM9cU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=5906052f724ace8783a32193d743f4db58a3bfee
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 5906052f724ace8783a32193d743f4db58a3bfee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/ceph/caps.c:33:
>> fs/ceph/cache.h:130:9: error: call to undeclared function 'filemap_dirty_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return filemap_dirty_folio(mapping, folio);
                  ^
   fs/ceph/cache.h:130:9: note: did you mean 'filemap_get_folio'?
   include/linux/pagemap.h:525:29: note: 'filemap_get_folio' declared here
   static inline struct folio *filemap_get_folio(struct address_space *mapping,
                               ^
   1 error generated.


vim +/filemap_dirty_folio +130 fs/ceph/cache.h

400e1286c0ec3f Jeff Layton             2021-12-07  126  
8fb72b4a76933a Matthew Wilcox (Oracle  2022-02-09  127) static inline int ceph_fscache_dirty_folio(struct address_space *mapping,
8fb72b4a76933a Matthew Wilcox (Oracle  2022-02-09  128) 		struct folio *folio)
400e1286c0ec3f Jeff Layton             2021-12-07  129  {
8fb72b4a76933a Matthew Wilcox (Oracle  2022-02-09 @130) 	return filemap_dirty_folio(mapping, folio);
400e1286c0ec3f Jeff Layton             2021-12-07  131  }
400e1286c0ec3f Jeff Layton             2021-12-07  132  

:::::: The code at line 130 was first introduced by commit
:::::: 8fb72b4a76933ae6f86725cc8e4a8190ba84d755 fscache: Convert fscache_set_page_dirty() to fscache_dirty_folio()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
