Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3FC137;
	Mon, 14 Aug 2023 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692032250; x=1723568250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxgurgSnWqQ87TYZvqZPYuyt7x2rQQlEagtfdYJidTI=;
  b=eFj732mgbR4tIGm8SdMyf2BokN8P270HGkclMA1eWiH7HI6yf9X8gf8G
   vDaqD5+JtQWKJms3UxVGt4ijiKUAGY6F4Uxbvycwauy7PudXcatQuTyGp
   dW+LImSqYxALtv785fGknw0jLb/iXmUTWUCrit6rIeje991kumvqXEiM0
   MehcDZj7SA/qBTq2z5ZbdOeGQNFAWk2WMNCBXyRGBp0oeHQBXFjM8Qa1E
   32wqika+Oo3v+WK4IcjVADxvrJc7LqPIj1t1bB+qDa0LIpvGiA356QK3D
   m1ppFJ6gYZyGqp9AF1rxDRjE1pN4f8JQAPeuRR8vp066oSbtY9lhogs2i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458448581"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="458448581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683372415"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="683372415"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Aug 2023 09:57:27 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVash-0000IZ-1y;
	Mon, 14 Aug 2023 16:57:27 +0000
Date: Tue, 15 Aug 2023 00:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v13 12/19] drivers/nvme/host/fabrics.c:634:8: error:
 call to undeclared function 'key_lookup'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308150000.FH2eXpLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: d523697c96a38b1358cefed16ded3d32dfe171d2 [12/19] nvme-fabrics: parse options 'keyring' and 'tls_key'
config: arm-randconfig-r033-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150000.FH2eXpLb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150000.FH2eXpLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150000.FH2eXpLb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/fabrics.c:634:8: error: call to undeclared function 'key_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     634 |         key = key_lookup(key_id);
         |               ^
>> drivers/nvme/host/fabrics.c:634:6: error: incompatible integer to pointer conversion assigning to 'struct key *' from 'int' [-Wint-conversion]
     634 |         key = key_lookup(key_id);
         |             ^ ~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/key_lookup +634 drivers/nvme/host/fabrics.c

   624	
   625	static struct key *nvmf_parse_key(int key_id, char *key_type)
   626	{
   627		struct key *key;
   628	
   629		if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
   630			pr_err("TLS is not supported\n");
   631			return ERR_PTR(-EINVAL);
   632		}
   633	
 > 634		key = key_lookup(key_id);
   635		if (IS_ERR(key))
   636			pr_err("%s %08x not found\n", key_type, key_id);
   637		else
   638			pr_debug("Using %s %08x\n", key_type, key_id);
   639		return key;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
