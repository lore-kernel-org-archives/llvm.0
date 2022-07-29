Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34664696
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659104405; x=1690640405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XntR2nXH/XI3nnFN0aAuxcBkL9uipGegy9OnSTQ2BYs=;
  b=JoEHy8S+Ylz7++tvzlVuXFbLJBGaDOmFwcWoOEjaDwds5sJ8aUBAzWEM
   hMpAqzDqHN8xvutswg6NnRAXzTjLgZaEgWb4r/oYHeFaYnlWgb/5fCMrL
   v3sTfHnS/XVjb0yHGktilmANtTmknpO1zcKWPoWmHPNL5+5IRAHL7Iq5e
   eUPZRlBhJEPXVfSX6uZSzqynAZeluXjQrRbUnGBzjkiUPU9z7JVJV6Jut
   8GuKZ4UCPQD7QHgB+DmiXAE8oKm30nEjgOh+5avManBRVu3mgKp0xIXBI
   YXcWrfa1y49IJGNc/lEk4rSZUZfQSjBLDP+UfitpV1cI6cJ9vqGOvLNdX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="314576575"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="314576575"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 07:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="928758049"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jul 2022 07:20:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHQqQ-000Bhy-2B;
	Fri, 29 Jul 2022 14:20:02 +0000
Date: Fri, 29 Jul 2022 22:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/3] netfilter: nf_tables: add string set API
Message-ID: <202207292232.PDyr6L7O-lkp@intel.com>
References: <20220729093129.3108-3-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729093129.3108-3-pablo@netfilter.org>

Hi Pablo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on nf/master]
[also build test ERROR on linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220729/202207292232.PDyr6L7O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/021bda4d09b7b9be8c40f05b017f885ba3010c02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
        git checkout 021bda4d09b7b9be8c40f05b017f885ba3010c02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ac_iterate" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_iter_destroy" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_iter_create" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_del" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_add" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_clone" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_create" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_resolve_fail" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "ac_destroy" [net/netfilter/nf_tables.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
