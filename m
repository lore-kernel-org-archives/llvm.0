Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6811363;
	Fri,  2 Jun 2023 02:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685672880; x=1717208880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQBY6CSkF8HVOgom8PLO7+N9vZQlh9ITh/b+24j0gaw=;
  b=iNUtS/ZHtFMNOsdsUDOeznsq4sM26voG6DjsD5yvoV+UIiIXtBRaxOsl
   vwmlnhwCDQSoAeOZtCeeHCH94i6qq047/2YvTIbWbsgLKAfiY/ohjh0e/
   128orK/dsok3X3DW6mx5MwXSpX+0lJT1GBF1K8eTT/iYCH9IiY8j1rg48
   QpxTJySDtcCsXXqIEtZT1QbEJp2BpEUFewA07SKCcco893NCZ9IWQdEnG
   9j05sJ104lGpytAIXg0cOMwBSqCAxU8b/7NCBVCENMZV5BqZfaTPCCToM
   f7QFDGo1yNRcOsmVlCHV8XZKkpsb1eSoml6ehkLnct0H6h6mcgXd3gvmr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335360371"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="335360371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 19:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881872738"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="881872738"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 19:27:55 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4uWB-0002vu-0K;
	Fri, 02 Jun 2023 02:27:55 +0000
Date: Fri, 2 Jun 2023 10:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Franziska Naepelt <franziska.naepelt@googlemail.com>,
	keyrings@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dhowells@redhat.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org,
	Franziska Naepelt <franziska.naepelt@gmail.com>
Subject: Re: [PATCH] certs/extract-cert: Fix checkpatch issues
Message-ID: <202306021040.UTvXfH5J-lkp@intel.com>
References: <20230601190508.56610-1-franziska.naepelt@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601190508.56610-1-franziska.naepelt@gmail.com>

Hi Franziska,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7877cb91f1081754a1487c144d85dc0d2e2e7fc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Franziska-Naepelt/certs-extract-cert-Fix-checkpatch-issues/20230602-030657
base:   7877cb91f1081754a1487c144d85dc0d2e2e7fc4
patch link:    https://lore.kernel.org/r/20230601190508.56610-1-franziska.naepelt%40gmail.com
patch subject: [PATCH] certs/extract-cert: Fix checkpatch issues
config: mips-buildonly-randconfig-r002-20230602 (https://download.01.org/0day-ci/archive/20230602/202306021040.UTvXfH5J-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7fdfaec7a3c9f58676a5892e679d8bca319abd8a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Franziska-Naepelt/certs-extract-cert-Fix-checkpatch-issues/20230602-030657
        git checkout 7fdfaec7a3c9f58676a5892e679d8bca319abd8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021040.UTvXfH5J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> certs/extract-cert.c:36:8: error: unknown type name '__noreturn'
   static __noreturn
          ^
   1 error generated.


vim +/__noreturn +36 certs/extract-cert.c

    35	
  > 36	static __noreturn
    37	void format(void)
    38	{
    39		fprintf(stderr,
    40			"Usage: extract-cert <source> <dest>\n");
    41		exit(2);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
