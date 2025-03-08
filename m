Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4D15B115;
	Sat,  8 Mar 2025 04:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741407831; cv=none; b=uun5uea15Cttwx2qs92t5Yuzu+8g5G0N2uogzp9/Syv6jpuNXnJhAs8FEO5aWc903vr0lb8MiVlr+XVgBG/hfTEDlNgv8Fd0waeL1+fdirQ7rw41YKcnu7ve4JNQhHM5Enx7Dw5DPoSquKTRjCJsDvN4r/fGkCxdm9xAnPdMTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741407831; c=relaxed/simple;
	bh=eb4NdFaCXPg7RT+P8Ueib3nR+ht15SPdMq/ZVe/6uco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyliFnVpf1x8PePf47XzzA8fLX1Eyk+/YBQqtVu0VLVCma06hsnFjEOi6r3FU4Nzihm0uYnTc+iZ6ZNLvM2sQbeEUW57mwyDiv5pjdJuFqz4hTpbaNozx+mYpUu393JglKGRsvgOBqskclBC8NkuauXQkIqqv7AMxPfGDa9WOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK5MU3AG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK5MU3AG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741407829; x=1772943829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eb4NdFaCXPg7RT+P8Ueib3nR+ht15SPdMq/ZVe/6uco=;
  b=kK5MU3AGrNkPX+aX/Kc3LasgXJcfGLbq+K+vmpI00YUgjgadvbFN7W/5
   NptRtJQMzKnbndZmFM7SVLx3MSL+HYF/k3KC52lU1DEUtXSdSQBQ/+38d
   731KfK2r7KQSGmtHLmt/ROrkGeGt1bSKWV2oyRj+hERDQhkB0+Z+QP/h6
   S6onEo+nBLdAsszpfS1BCI7eqf2HdRReiIj954GP5oHMm7yxPfQIkCXxH
   T55KQh0FoZVR8vDT0Dk93sJXxO5P9Mb1XHyrNpQxYJudkOx21sUMLYrj8
   TBgySKdERhFd9bTKm440OT0BZngSBWMThXElnc0Lvx6fzpmPIANkHujyy
   Q==;
X-CSE-ConnectionGUID: mtepzRMFRKGDwwKkrVZSPA==
X-CSE-MsgGUID: wQCwCZUSSBWBpwi7nksj8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42604631"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42604631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:23:44 -0800
X-CSE-ConnectionGUID: 6gdwkICGTGqeqcwFRLzfbg==
X-CSE-MsgGUID: prUr5Nj8TXG50mQvTMJ9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156712399"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 20:23:43 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqliu-0001Tc-1K;
	Sat, 08 Mar 2025 04:23:40 +0000
Date: Sat, 8 Mar 2025 12:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next v1 4/6] RDMA/mlx5: Check enabled UCAPs when
 creating ucontext
Message-ID: <202503081223.ISLOmyVZ-lkp@intel.com>
References: <8b180583a207cb30deb7a2967934079749cdcc44.1741261611.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b180583a207cb30deb7a2967934079749cdcc44.1741261611.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/RDMA-uverbs-Introduce-UCAP-User-CAPabilities-API/20250306-195708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/8b180583a207cb30deb7a2967934079749cdcc44.1741261611.git.leon%40kernel.org
patch subject: [PATCH rdma-next v1 4/6] RDMA/mlx5: Check enabled UCAPs when creating ucontext
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250308/202503081223.ISLOmyVZ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081223.ISLOmyVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081223.ISLOmyVZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/main.c:1992:10: error: call to undeclared function 'mlx5_cmd_add_privileged_uid'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           err = mlx5_cmd_add_privileged_uid(dev->mdev,
                                 ^
>> drivers/infiniband/hw/mlx5/main.c:2086:3: error: call to undeclared function 'mlx5_cmd_remove_privileged_uid'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   mlx5_cmd_remove_privileged_uid(dev->mdev, context->devx_uid);
                   ^
   drivers/infiniband/hw/mlx5/main.c:2134:4: error: call to undeclared function 'mlx5_cmd_remove_privileged_uid'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           mlx5_cmd_remove_privileged_uid(dev->mdev,
                           ^
   drivers/infiniband/hw/mlx5/main.c:4229:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
           if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~
                                                   MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
           MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
           ^
   drivers/infiniband/hw/mlx5/main.c:4233:6: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA'; did you mean 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA'?
               MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
               RDMA_UCAP_MLX5_CTRL_OTHER_VHCA
   include/rdma/ib_ucaps.h:13:2: note: 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA' declared here
           RDMA_UCAP_MLX5_CTRL_OTHER_VHCA,
           ^
   drivers/infiniband/hw/mlx5/main.c:4241:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
           if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL) {
                                                   ^~~~~~~~~~~~~~~~~~~~~~~
                                                   MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
           MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
           ^
   drivers/infiniband/hw/mlx5/main.c:4248:6: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA'; did you mean 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA'?
               MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
               RDMA_UCAP_MLX5_CTRL_OTHER_VHCA
   include/rdma/ib_ucaps.h:13:2: note: 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA' declared here
           RDMA_UCAP_MLX5_CTRL_OTHER_VHCA,
           ^
   drivers/infiniband/hw/mlx5/main.c:4257:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
           if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~
                                                   MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
           MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
           ^
   drivers/infiniband/hw/mlx5/main.c:4264:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
           if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
               ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
           MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
           ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
   #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
                                                                 ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
   #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
                                    ^                   ~~~
   include/linux/mlx5/device.h:52:35: note: expanded from macro '__mlx5_bit_off'
   #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
                                     ^                                      ~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: expanded from macro '__be64_to_cpu'
   #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
                                                     ^
   drivers/infiniband/hw/mlx5/main.c:4265:6: error: use of undeclared identifier 'MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL'; did you mean 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER'?
               MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
               MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER
   include/linux/mlx5/mlx5_ifc.h:12493:2: note: 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER' declared here
           MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER = BIT_ULL(0x20),
           ^
   drivers/infiniband/hw/mlx5/main.c:4318:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
           if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
               ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
           MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
           ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
   #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
                                                                 ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
   #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
                                    ^                   ~~~
   include/linux/mlx5/device.h:52:35: note: expanded from macro '__mlx5_bit_off'
   #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
                                     ^                                      ~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: expanded from macro '__be64_to_cpu'
   #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
                                                     ^
   drivers/infiniband/hw/mlx5/main.c:4319:6: error: use of undeclared identifier 'MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL'; did you mean 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER'?
               MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
               MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER
   include/linux/mlx5/mlx5_ifc.h:12493:2: note: 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER' declared here
           MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER = BIT_ULL(0x20),
           ^
   12 errors generated.


vim +/mlx5_cmd_add_privileged_uid +1992 drivers/infiniband/hw/mlx5/main.c

  1943	
  1944	static int mlx5_ib_alloc_ucontext(struct ib_ucontext *uctx,
  1945					  struct ib_udata *udata)
  1946	{
  1947		struct ib_device *ibdev = uctx->device;
  1948		struct mlx5_ib_dev *dev = to_mdev(ibdev);
  1949		struct mlx5_ib_alloc_ucontext_req_v2 req = {};
  1950		struct mlx5_ib_alloc_ucontext_resp resp = {};
  1951		struct mlx5_ib_ucontext *context = to_mucontext(uctx);
  1952		struct mlx5_bfreg_info *bfregi;
  1953		int ver;
  1954		int err;
  1955		size_t min_req_v2 = offsetof(struct mlx5_ib_alloc_ucontext_req_v2,
  1956					     max_cqe_version);
  1957		bool lib_uar_4k;
  1958		bool lib_uar_dyn;
  1959	
  1960		if (!dev->ib_active)
  1961			return -EAGAIN;
  1962	
  1963		if (udata->inlen == sizeof(struct mlx5_ib_alloc_ucontext_req))
  1964			ver = 0;
  1965		else if (udata->inlen >= min_req_v2)
  1966			ver = 2;
  1967		else
  1968			return -EINVAL;
  1969	
  1970		err = ib_copy_from_udata(&req, udata, min(udata->inlen, sizeof(req)));
  1971		if (err)
  1972			return err;
  1973	
  1974		if (req.flags & ~MLX5_IB_ALLOC_UCTX_DEVX)
  1975			return -EOPNOTSUPP;
  1976	
  1977		if (req.comp_mask || req.reserved0 || req.reserved1 || req.reserved2)
  1978			return -EOPNOTSUPP;
  1979	
  1980		req.total_num_bfregs = ALIGN(req.total_num_bfregs,
  1981					    MLX5_NON_FP_BFREGS_PER_UAR);
  1982		if (req.num_low_latency_bfregs > req.total_num_bfregs - 1)
  1983			return -EINVAL;
  1984	
  1985		if (req.flags & MLX5_IB_ALLOC_UCTX_DEVX) {
  1986			err = mlx5_ib_devx_create(dev, true, uctx->enabled_caps);
  1987			if (err < 0)
  1988				goto out_ctx;
  1989			context->devx_uid = err;
  1990	
  1991			if (uctx_rdma_ctrl_is_enabled(uctx->enabled_caps)) {
> 1992				err = mlx5_cmd_add_privileged_uid(dev->mdev,
  1993								  context->devx_uid);
  1994				if (err)
  1995					goto out_devx;
  1996			}
  1997		}
  1998	
  1999		lib_uar_4k = req.lib_caps & MLX5_LIB_CAP_4K_UAR;
  2000		lib_uar_dyn = req.lib_caps & MLX5_LIB_CAP_DYN_UAR;
  2001		bfregi = &context->bfregi;
  2002	
  2003		if (lib_uar_dyn) {
  2004			bfregi->lib_uar_dyn = lib_uar_dyn;
  2005			goto uar_done;
  2006		}
  2007	
  2008		/* updates req->total_num_bfregs */
  2009		err = calc_total_bfregs(dev, lib_uar_4k, &req, bfregi);
  2010		if (err)
  2011			goto out_ucap;
  2012	
  2013		mutex_init(&bfregi->lock);
  2014		bfregi->lib_uar_4k = lib_uar_4k;
  2015		bfregi->count = kcalloc(bfregi->total_num_bfregs, sizeof(*bfregi->count),
  2016					GFP_KERNEL);
  2017		if (!bfregi->count) {
  2018			err = -ENOMEM;
  2019			goto out_ucap;
  2020		}
  2021	
  2022		bfregi->sys_pages = kcalloc(bfregi->num_sys_pages,
  2023					    sizeof(*bfregi->sys_pages),
  2024					    GFP_KERNEL);
  2025		if (!bfregi->sys_pages) {
  2026			err = -ENOMEM;
  2027			goto out_count;
  2028		}
  2029	
  2030		err = allocate_uars(dev, context);
  2031		if (err)
  2032			goto out_sys_pages;
  2033	
  2034	uar_done:
  2035		err = mlx5_ib_alloc_transport_domain(dev, &context->tdn,
  2036						     context->devx_uid);
  2037		if (err)
  2038			goto out_uars;
  2039	
  2040		INIT_LIST_HEAD(&context->db_page_list);
  2041		mutex_init(&context->db_page_mutex);
  2042	
  2043		context->cqe_version = min_t(__u8,
  2044					 (__u8)MLX5_CAP_GEN(dev->mdev, cqe_version),
  2045					 req.max_cqe_version);
  2046	
  2047		err = set_ucontext_resp(uctx, &resp);
  2048		if (err)
  2049			goto out_mdev;
  2050	
  2051		resp.response_length = min(udata->outlen, sizeof(resp));
  2052		err = ib_copy_to_udata(udata, &resp, resp.response_length);
  2053		if (err)
  2054			goto out_mdev;
  2055	
  2056		bfregi->ver = ver;
  2057		bfregi->num_low_latency_bfregs = req.num_low_latency_bfregs;
  2058		context->lib_caps = req.lib_caps;
  2059		print_lib_caps(dev, context->lib_caps);
  2060	
  2061		if (mlx5_ib_lag_should_assign_affinity(dev)) {
  2062			u32 port = mlx5_core_native_port_num(dev->mdev) - 1;
  2063	
  2064			atomic_set(&context->tx_port_affinity,
  2065				   atomic_add_return(
  2066					   1, &dev->port[port].roce.tx_port_affinity));
  2067		}
  2068	
  2069		return 0;
  2070	
  2071	out_mdev:
  2072		mlx5_ib_dealloc_transport_domain(dev, context->tdn, context->devx_uid);
  2073	
  2074	out_uars:
  2075		deallocate_uars(dev, context);
  2076	
  2077	out_sys_pages:
  2078		kfree(bfregi->sys_pages);
  2079	
  2080	out_count:
  2081		kfree(bfregi->count);
  2082	
  2083	out_ucap:
  2084		if (req.flags & MLX5_IB_ALLOC_UCTX_DEVX &&
  2085		    uctx_rdma_ctrl_is_enabled(uctx->enabled_caps))
> 2086			mlx5_cmd_remove_privileged_uid(dev->mdev, context->devx_uid);
  2087	
  2088	out_devx:
  2089		if (req.flags & MLX5_IB_ALLOC_UCTX_DEVX)
  2090			mlx5_ib_devx_destroy(dev, context->devx_uid);
  2091	
  2092	out_ctx:
  2093		return err;
  2094	}
  2095	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
