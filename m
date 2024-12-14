Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B43130A7D;
	Sat, 14 Dec 2024 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734165789; cv=none; b=DV3E3lByE92KKmwHE2pwnRkJ2rSdzHcs3tE7q0rZKFfLQ+5h4VoAJvn9WJsHeMq5Ud+2jmuvbdIxbVSb6NW0D/LQ8DNrA+dNAEbjf+RF8vLimB2TdFVD3JYVuGe4ocdb1Pjd1LBojIVukY8iO+FG3AuAC/6PjxKAY59PmP2F5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734165789; c=relaxed/simple;
	bh=oAbur0NdDLUwPPTQH0Iz3uP7gT3DeYfBeiGWJ61hrQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqgsJAH0zu39E35poCG39g2+RSK71Zh3LdSo1ZC22/GxrVwCMupmxVJ7HuFPt++Cc7Qgn1N6vVpdLURtEOW7GE5d+Mr8/U+FdArUGUMY/iC6/drTpK7CxVeTeRt1P0Mtvpv8G0rT6kQrmX8q6tcOdlR57m5eRRc3CBK09Uur2UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd8RJcie; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd8RJcie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734165787; x=1765701787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAbur0NdDLUwPPTQH0Iz3uP7gT3DeYfBeiGWJ61hrQU=;
  b=dd8RJcieEsU3BdOi90g6aSE1ukvWa1bErXJA3Ped/ddmrZCaEK017I1S
   g4I24BlNESyhdA5g7I1gNvsF0MGO6Eawd/xd6S91hAVTPhO9jxUMlGDmu
   bRm5vKNkGJrEcnQ/SXyKUcQor23wyjqyTXCyxYAfsDA2/yO5T+brzcP1h
   /yReJfc7gj+/O1i7vAWCFBEri+cOF+0ZQfz67+2co7kiJabadtS5AWwan
   Zk454ER3oIFleT1aBXR1eYnOTn+EHMgASGj29RyLukFB66wBDXoSnYdUK
   FnXXLDdO3j3PlkLX3iaI8FW97Ad2x3oMlvP5PYi3KCG8Xij7oazt+Ywje
   A==;
X-CSE-ConnectionGUID: SH6Nuf8qQ5CMoWGwMjDTpg==
X-CSE-MsgGUID: EYmoHOmmRDuUWQasthey3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45622957"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45622957"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 00:43:07 -0800
X-CSE-ConnectionGUID: vyAf/N2WRf6PYv/+UpbDTw==
X-CSE-MsgGUID: +AlIJbwQQzuMdyONkPYNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100899794"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2024 00:43:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMNjq-000Cnb-1W;
	Sat, 14 Dec 2024 08:43:02 +0000
Date: Sat, 14 Dec 2024 16:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 24/28] drivers/cxl/features.c:162:12: warning:
 variable 'out_size' is uninitialized when used here
Message-ID: <202412141609.PvUKLbQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: 2a47b406a8cd060676e6d34f7a21e486770a02a3 [24/28] cxl: Add support to handle user feature commands for get feature
config: i386-buildonly-randconfig-004-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141609.PvUKLbQO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141609.PvUKLbQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141609.PvUKLbQO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/features.c:5:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/cxl/features.c:60:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct cxl_feat_entry *' [-Wnon-literal-null-conversion]
      60 |                 return false;
         |                        ^~~~~
   drivers/cxl/features.c:64:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct cxl_feat_entry *' [-Wnon-literal-null-conversion]
      64 |                 return false;
         |                        ^~~~~
>> drivers/cxl/features.c:162:12: warning: variable 'out_size' is uninitialized when used here [-Wuninitialized]
     162 |                 kvzalloc(out_size, GFP_KERNEL);
         |                          ^~~~~~~~
   include/linux/slab.h:1026:44: note: expanded from macro 'kvzalloc'
    1026 | #define kvzalloc(_size, _flags)                 kvmalloc(_size, (_flags)|__GFP_ZERO)
         |                                                          ^~~~~
   include/linux/slab.h:1024:49: note: expanded from macro 'kvmalloc'
    1024 | #define kvmalloc(_size, _flags)                 kvmalloc_node(_size, _flags, NUMA_NO_NODE)
         |                                                               ^~~~~
   include/linux/slab.h:1022:63: note: expanded from macro 'kvmalloc_node'
    1022 | #define kvmalloc_node(...)                      alloc_hooks(kvmalloc_node_noprof(__VA_ARGS__))
         |                                                                                  ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/slab.h:785:40: note: expanded from macro 'PASS_BUCKET_PARAMS'
     785 | #define PASS_BUCKET_PARAMS(_size, _b)   (_size)
         |                                          ^~~~~
   include/linux/alloc_tag.h:214:31: note: expanded from macro 'alloc_hooks'
     214 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:206:27: note: expanded from macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   drivers/cxl/features.c:145:17: note: initialize the variable 'out_size' to silence this warning
     145 |         size_t out_size;
         |                        ^
         |                         = 0
   4 warnings generated.


vim +/out_size +162 drivers/cxl/features.c

   138	
   139	static void *cxlctl_get_feature(struct cxl_features_state *cfs,
   140					const struct fwctl_rpc_cxl *rpc_in,
   141					size_t *out_len)
   142	{
   143		struct cxl_mbox_get_feat_in feat_in;
   144		u16 offset, count, return_code;
   145		size_t out_size;
   146		void *feat_out;
   147	
   148		if (rpc_in->op_size != sizeof(feat_in))
   149			return ERR_PTR(-EINVAL);
   150	
   151		if (copy_from_user(&feat_in, u64_to_user_ptr(rpc_in->in_payload),
   152				   rpc_in->op_size))
   153			return ERR_PTR(-EFAULT);
   154	
   155		offset = le16_to_cpu(feat_in.offset);
   156		count = le16_to_cpu(feat_in.count);
   157	
   158		if (!count)
   159			return ERR_PTR(-EINVAL);
   160	
   161		struct fwctl_rpc_cxl_out *rpc_out __free(kvfree) =
 > 162			kvzalloc(out_size, GFP_KERNEL);
   163		if (!rpc_out)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		feat_out = (void *)rpc_out->payload;
   167		out_size = cxl_get_feature(cfs->features, feat_in.uuid,
   168					   feat_in.selection, feat_out,
   169					   count, offset, &return_code);
   170		*out_len = sizeof(struct fwctl_rpc_cxl_out);
   171		if (!out_size) {
   172			rpc_out->size = 0;
   173			rpc_out->retval = return_code;
   174			return no_free_ptr(rpc_out);
   175		}
   176	
   177		rpc_out->size = out_size;
   178		rpc_out->retval = CXL_MBOX_CMD_RC_SUCCESS;
   179		*out_len += out_size;
   180	
   181		return no_free_ptr(rpc_out);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
