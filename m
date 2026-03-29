Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78FD27FD6D;
	Sun, 29 Mar 2026 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802504; cv=none; b=Y650JLU7M65XKGYfumt5K5GkjDsypYo64OwR5MWSzKHSn+Ler4LQDqT17pkLjx6N9HHHt93VaHWk7Yh/Thk4VubdJRHulCP88puKfNKV0gFe2U+QDQy7fHcd14u9LdswXmVqLDF+2VuZDFG8Oywn5X3oQQjChK4R0JsFl1SXcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802504; c=relaxed/simple;
	bh=kChx1aVW3KOwCObZssem7/3yqkOlQfZOpWGymoqMIZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoyHuC/N4ODrgrhic4xrhGJiKigeLdMXp6lU/Ao77LptacdLclxFIBWkPlIJQufBMKP9YtksdetlCxYxaPzlVvrpb46WIVOcMIevgTMPU2QSlG/tnWQbhIeL5HM8FfAcxLilelttyz7DVbOawcuhhDR96Yo+x1KWdOHukLu+wHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN7N0YrA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN7N0YrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774802502; x=1806338502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kChx1aVW3KOwCObZssem7/3yqkOlQfZOpWGymoqMIZc=;
  b=FN7N0YrAledYZx6ocMSJyBENptinfCHZsQklkF5+TyPPsGxGsVGxj4L+
   +aRuXH0Q1RrtuXrrZcAHcQYCie7EyB/8CUEPsUllfxdqed23I5DDLwKHD
   sb9yvxxo6YvenZ2KZgl9xko7KN9wC2lXywhJZIp6bHYq2Ftf0oxBDjTZK
   9vK6NsYAfRd0vgxCWbsjXyyGCvDwHOMvc2cMyVPZdneV+CVD/bjG71E/1
   WIV1fLlxrdOt1GUfFm16RrN6lkL2+ChRbfOr9zCVC5CPYeVFtaxaeNHnt
   Nzy4DsoKRvxNUBkpAypzPXFmZ/xBLzPDHzqdRfa56z1ytQLFxSvuGlgwB
   A==;
X-CSE-ConnectionGUID: 0Km2VWnLRomUezPF4RN1Rg==
X-CSE-MsgGUID: 6Zi/1HWATWO0gEmafllHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74836342"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="74836342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 09:41:41 -0700
X-CSE-ConnectionGUID: 47ho73KyRSaeg4v05DKjaA==
X-CSE-MsgGUID: Jy4tBZlPSVG6We7hCQ4oxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225834048"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2026 09:41:39 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6tCi-00000000CZ7-3CLp;
	Sun, 29 Mar 2026 16:41:36 +0000
Date: Mon, 30 Mar 2026 00:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/2] RDMA/mlx5: get tph for p2p access when registering
 dmabuf mr
Message-ID: <202603300035.HzHCCSdR-lkp@intel.com>
References: <20260324234615.3731237-3-zhipingz@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324234615.3731237-3-zhipingz@meta.com>

Hi Zhiping,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on awilliam-vfio/for-linus linus/master v7.0-rc5]
[cannot apply to rdma/for-next drm-misc/drm-misc-next next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/vfio-add-callback-to-get-tph-info-for-dmabuf/20260327-214419
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20260324234615.3731237-3-zhipingz%40meta.com
patch subject: [RFC v2 2/2] RDMA/mlx5: get tph for p2p access when registering dmabuf mr
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603300035.HzHCCSdR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300035.HzHCCSdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300035.HzHCCSdR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:115:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     115 |                 if (tag == idx_data->tag) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:148:9: note: uninitialized use occurs here
     148 |         return ret;
         |                ^~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:115:3: note: remove the 'if' if its condition is always false
     115 |                 if (tag == idx_data->tag) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                         refcount_inc(&idx_data->usecount);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                         *st_index = index;
         |                         ~~~~~~~~~~~~~~~~~~
     118 |                         goto end;
         |                         ~~~~~~~~~
     119 |                 }
         |                 ~
   drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:102:9: note: initialize the variable 'ret' to silence this warning
     102 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +115 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c

888a7776f4fb04 Yishai Hadas   2025-07-17   94  
0af7a73615dcee Zhiping Zhang  2026-03-24   95  int mlx5_st_alloc_index_by_tag(struct mlx5_core_dev *dev, u16 tag,
0af7a73615dcee Zhiping Zhang  2026-03-24   96  			       u16 *st_index)
888a7776f4fb04 Yishai Hadas   2025-07-17   97  {
888a7776f4fb04 Yishai Hadas   2025-07-17   98  	struct mlx5_st_idx_data *idx_data;
888a7776f4fb04 Yishai Hadas   2025-07-17   99  	struct mlx5_st *st = dev->st;
888a7776f4fb04 Yishai Hadas   2025-07-17  100  	unsigned long index;
888a7776f4fb04 Yishai Hadas   2025-07-17  101  	u32 xa_id;
888a7776f4fb04 Yishai Hadas   2025-07-17  102  	int ret;
888a7776f4fb04 Yishai Hadas   2025-07-17  103  
888a7776f4fb04 Yishai Hadas   2025-07-17  104  	if (!st)
888a7776f4fb04 Yishai Hadas   2025-07-17  105  		return -EOPNOTSUPP;
888a7776f4fb04 Yishai Hadas   2025-07-17  106  
2d838c11e10e91 Yishai Hadas   2025-10-27  107  	if (st->direct_mode) {
2d838c11e10e91 Yishai Hadas   2025-10-27  108  		*st_index = tag;
2d838c11e10e91 Yishai Hadas   2025-10-27  109  		return 0;
2d838c11e10e91 Yishai Hadas   2025-10-27  110  	}
2d838c11e10e91 Yishai Hadas   2025-10-27  111  
888a7776f4fb04 Yishai Hadas   2025-07-17  112  	mutex_lock(&st->lock);
888a7776f4fb04 Yishai Hadas   2025-07-17  113  
888a7776f4fb04 Yishai Hadas   2025-07-17  114  	xa_for_each(&st->idx_xa, index, idx_data) {
888a7776f4fb04 Yishai Hadas   2025-07-17 @115  		if (tag == idx_data->tag) {
888a7776f4fb04 Yishai Hadas   2025-07-17  116  			refcount_inc(&idx_data->usecount);
888a7776f4fb04 Yishai Hadas   2025-07-17  117  			*st_index = index;
888a7776f4fb04 Yishai Hadas   2025-07-17  118  			goto end;
888a7776f4fb04 Yishai Hadas   2025-07-17  119  		}
888a7776f4fb04 Yishai Hadas   2025-07-17  120  	}
888a7776f4fb04 Yishai Hadas   2025-07-17  121  
bf4afc53b77aea Linus Torvalds 2026-02-21  122  	idx_data = kzalloc_obj(*idx_data);
888a7776f4fb04 Yishai Hadas   2025-07-17  123  	if (!idx_data) {
888a7776f4fb04 Yishai Hadas   2025-07-17  124  		ret = -ENOMEM;
888a7776f4fb04 Yishai Hadas   2025-07-17  125  		goto end;
888a7776f4fb04 Yishai Hadas   2025-07-17  126  	}
888a7776f4fb04 Yishai Hadas   2025-07-17  127  
888a7776f4fb04 Yishai Hadas   2025-07-17  128  	refcount_set(&idx_data->usecount, 1);
888a7776f4fb04 Yishai Hadas   2025-07-17  129  	idx_data->tag = tag;
888a7776f4fb04 Yishai Hadas   2025-07-17  130  
888a7776f4fb04 Yishai Hadas   2025-07-17  131  	ret = xa_alloc(&st->idx_xa, &xa_id, idx_data, st->index_limit, GFP_KERNEL);
888a7776f4fb04 Yishai Hadas   2025-07-17  132  	if (ret)
888a7776f4fb04 Yishai Hadas   2025-07-17  133  		goto clean_idx_data;
888a7776f4fb04 Yishai Hadas   2025-07-17  134  
888a7776f4fb04 Yishai Hadas   2025-07-17  135  	ret = pcie_tph_set_st_entry(dev->pdev, xa_id, tag);
888a7776f4fb04 Yishai Hadas   2025-07-17  136  	if (ret)
888a7776f4fb04 Yishai Hadas   2025-07-17  137  		goto clean_idx_xa;
888a7776f4fb04 Yishai Hadas   2025-07-17  138  
888a7776f4fb04 Yishai Hadas   2025-07-17  139  	*st_index = xa_id;
888a7776f4fb04 Yishai Hadas   2025-07-17  140  	goto end;
888a7776f4fb04 Yishai Hadas   2025-07-17  141  
888a7776f4fb04 Yishai Hadas   2025-07-17  142  clean_idx_xa:
888a7776f4fb04 Yishai Hadas   2025-07-17  143  	xa_erase(&st->idx_xa, xa_id);
888a7776f4fb04 Yishai Hadas   2025-07-17  144  clean_idx_data:
888a7776f4fb04 Yishai Hadas   2025-07-17  145  	kfree(idx_data);
888a7776f4fb04 Yishai Hadas   2025-07-17  146  end:
888a7776f4fb04 Yishai Hadas   2025-07-17  147  	mutex_unlock(&st->lock);
888a7776f4fb04 Yishai Hadas   2025-07-17  148  	return ret;
888a7776f4fb04 Yishai Hadas   2025-07-17  149  }
0af7a73615dcee Zhiping Zhang  2026-03-24  150  EXPORT_SYMBOL_GPL(mlx5_st_alloc_index_by_tag);
0af7a73615dcee Zhiping Zhang  2026-03-24  151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
