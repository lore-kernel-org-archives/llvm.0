Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979629CA
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640620607; x=1672156607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PxtyPzt0KLfSLLa1pPBudg9doH4Gy9uQA/cjdZanweI=;
  b=ahV+WiFkqp/5e6VN0XhaDdA8ex3CWODe6NcJmkdQlLdkrcIm0O12rPiK
   +WZ2ij/BBaIG6JR/d9ne9DrGNZe6nYQkJKtX3o9mJyYlI9cQC1IhZTFdi
   UvewKKzpvwgvkhkVAaoJ4BNOdWzznv01xafzzgN5WUtJD3UZHGruAeEeH
   t+dryklpHS6rD08CpxZ2qFm2wyo5Z+I2dZdfySYH9wt3c/S2k3m3nzHLS
   oZ/RJCdvQD7tQBB7aiyN9vtI2ChrsqC/pqhcXtua1xKSEfDkqkxOyqa4o
   2WDmhF2PXMisBwdArgiD4efBYezB08LhRqFU4tmBMPQlzzPkJEDIbvLDa
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="304585257"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="304585257"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 07:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="686318910"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 07:56:28 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1sMO-0006XQ-Bx; Mon, 27 Dec 2021 15:56:28 +0000
Date: Mon, 27 Dec 2021 23:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: Re: [PATCH v1 19/23] cachefiles: implement .demand_read() for demand
 read
Message-ID: <202112272353.ekKESQX6-lkp@intel.com>
References: <20211227125444.21187-20-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227125444.21187-20-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jeffle,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dhowells-fs/fscache-next]
[cannot apply to xiang-erofs/dev-test ceph-client/for-linus linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git fscache-next
config: i386-randconfig-r005-20211227 (https://download.01.org/0day-ci/archive/20211227/202112272353.ekKESQX6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/54c300b4598e3f2836d8233681da387fe388cfda
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
        git checkout 54c300b4598e3f2836d8233681da387fe388cfda
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/cachefiles/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cachefiles/io.c:564:5: warning: no previous prototype for function 'cachefiles_demand_read' [-Wmissing-prototypes]
   int cachefiles_demand_read(struct netfs_cache_resources *cres,
       ^
   fs/cachefiles/io.c:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int cachefiles_demand_read(struct netfs_cache_resources *cres,
   ^
   static 
   1 warning generated.


vim +/cachefiles_demand_read +564 fs/cachefiles/io.c

   563	
 > 564	int cachefiles_demand_read(struct netfs_cache_resources *cres,
   565				   loff_t start_pos, size_t len)
   566	{
   567		struct cachefiles_object *object;
   568		struct cachefiles_cache *cache;
   569		struct cachefiles_req *req;
   570		int ret;
   571	
   572		object = cachefiles_cres_object(cres);
   573		cache = object->volume->cache;
   574	
   575		req = cachefiles_alloc_req(object, start_pos, len);
   576		if (!req)
   577			return -ENOMEM;
   578	
   579		spin_lock(&cache->reqs_lock);
   580		ret = idr_alloc(&cache->reqs, req, 0, 0, GFP_KERNEL);
   581		if (ret >= 0)
   582			req->req_in.id = ret;
   583		spin_unlock(&cache->reqs_lock);
   584		if (ret < 0) {
   585			kfree(req);
   586			return -ENOMEM;
   587		}
   588	
   589		wake_up_all(&cache->daemon_pollwq);
   590	
   591		wait_for_completion(&req->done);
   592		kfree(req);
   593	
   594		return 0;
   595	}
   596	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
