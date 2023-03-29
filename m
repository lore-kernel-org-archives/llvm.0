Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2FE33D8;
	Wed, 29 Mar 2023 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680106398; x=1711642398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hps5jsYWZuWMPz8GSp0n187O/lBhXc5uhNP4MtLz8+s=;
  b=VG2JVgeSuFwfPWfwcI0Sojqx6PVH0nvSS8z5SdTlEUxc3kl6v/+J6DFs
   di88y+oymUPr3we3gU6hmwEV9sftMEh2mMQB1KkZIj/VdKvTw+ZXTJMh9
   /LAfCl2Y9YiXcUoMO4lu/L9L8KqBk39HE/i2TiufBWSxSmuYIyjOz5ZN0
   UXbmyGboQR6XXaBQwZhPcHTE8ygvymsQTWRwQ5BJ3pFfw5Qzqrb73EQzN
   Po0jjGhYJusS4Vm71uqFk8MjanCI+TNwdcJXqg0Rv45gBH49hPLyIGojP
   74KEPyQ7Hng8YBudZSKExwhorUtl/uPc9pBk9j+weCL/8pdaP4i7qFlJj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="340947590"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="340947590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748828855"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="748828855"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 09:12:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phYP2-000Jhk-0j;
	Wed, 29 Mar 2023 16:12:00 +0000
Date: Thu, 30 Mar 2023 00:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yang Shi <shy828301@gmail.com>, Yu Zhao <yuzhao@google.com>,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Zi Yan <ziy@nvidia.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Zach O'Keefe <zokeefe@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/7] mm: page_owner: add support for splitting to any
 order in split page_owner.
Message-ID: <202303300056.N12iGUqy-lkp@intel.com>
References: <20230329011712.3242298-5-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329011712.3242298-5-zi.yan@sent.com>

Hi Zi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-memcg-use-order-instead-of-nr-in-split_page_memcg/20230329-091809
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230329011712.3242298-5-zi.yan%40sent.com
patch subject: [PATCH v2 4/7] mm: page_owner: add support for splitting to any order in split page_owner.
config: riscv-buildonly-randconfig-r006-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300056.N12iGUqy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6d1831c0e01a1a742e026454fe6e5643e08c5985
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zi-Yan/mm-memcg-use-order-instead-of-nr-in-split_page_memcg/20230329-091809
        git checkout 6d1831c0e01a1a742e026454fe6e5643e08c5985
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300056.N12iGUqy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_owner.c:226:14: error: call to undeclared function 'lookup_page_ext'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   page_ext = lookup_page_ext(page + i);
                              ^
>> mm/page_owner.c:226:12: error: incompatible integer to pointer conversion assigning to 'struct page_ext *' from 'int' [-Wint-conversion]
                   page_ext = lookup_page_ext(page + i);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/lookup_page_ext +226 mm/page_owner.c

   213	
   214	void __split_page_owner(struct page *page, int old_order, int new_order)
   215	{
   216		int i;
   217		struct page_ext *page_ext = page_ext_get(page);
   218		struct page_owner *page_owner;
   219		unsigned int old_nr = 1 << old_order;
   220		unsigned int new_nr = 1 << new_order;
   221	
   222		if (unlikely(!page_ext))
   223			return;
   224	
   225		for (i = 0; i < old_nr; i += new_nr) {
 > 226			page_ext = lookup_page_ext(page + i);
   227			page_owner = get_page_owner(page_ext);
   228			page_owner->order = new_order;
   229		}
   230		page_ext_put(page_ext);
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
