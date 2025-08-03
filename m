Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD619258E;
	Sun,  3 Aug 2025 20:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253619; cv=none; b=kb1IolHy+eA7UpFO2MtsVhuB737N+dlPqX6yQkcLaVCwa92viIq482Yil/zH75l8zMAesi8ngxiAOy2zLzhBKbZpjSsKj1qO/xVVIOrHcur/gYJKZr2670Hvia8hNwzjNkXPvz4PFSEJ6HTWlVobDIKw9FZp5KgOP73z/WdUO3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253619; c=relaxed/simple;
	bh=bpPpVVpys4RMoeUN7KZ/J3HEjlKaR5MePwisv0Ov+2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyaQLYuaS57o8a03ML1fiBBzYqw7ba+f/HfN2bo+zp3mN70fMGHo/CkjFuZ3GYGm5H2lV0qkhNYHJ/fxpfmqljYA2xF1QPbJd635E8jwc3MNdpa6O7ZGwqxB1hyF+PpOYGRLX/UFVF0cWvw9B8v+9bt2O4gfHlteXeU+MpzCqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKUqMvZr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKUqMvZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754253617; x=1785789617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpPpVVpys4RMoeUN7KZ/J3HEjlKaR5MePwisv0Ov+2k=;
  b=DKUqMvZraNepRvKspDF7/xpmuJd8UNWYpkNPAPunu2cl9AMn8idldQqk
   HadF7tcg3XcN+VqQDLg/Musmru4d5TWw4gOaiDG7w27n3TrY0/ocu7/dh
   USd4PZ6EMKWcaqvsSBR1qS5G+6Igcc8VTWHT+9lHNcyGkZUIl3LVleJhv
   a2fyITeKFr9HE5ZAkuhSI7GdUDi5cvWc921QJNFfMLGnj5S4aCwLzowfs
   7XE5LoiwvBxkuw9YV1Lq5aG0G0hUdbx2vL3NfEWDEPZysKHNxjZOqXdLK
   1/ei6lBQVn2gRd3bzVMKcjhbU0G9nmai7d1tmtr1baI11RHnD7cFgoKJv
   g==;
X-CSE-ConnectionGUID: VRNZsK+GS7+YkTqqDmAUIw==
X-CSE-MsgGUID: Z6Nfn4xWS8uDGgy4ha6K4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56477572"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56477572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 13:40:17 -0700
X-CSE-ConnectionGUID: btNCN4o/Tdy1sGJoSqz4Iw==
X-CSE-MsgGUID: wj/3In4RQ6yHGTIu7XLEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168247920"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2025 13:40:15 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uifV6-0006cy-2q;
	Sun, 03 Aug 2025 20:40:12 +0000
Date: Mon, 4 Aug 2025 04:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] vfio-nvme: implement TP4159 live migration cmds
Message-ID: <202508040432.A5v60BDB-lkp@intel.com>
References: <20250803024705.10256-5-kch@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803024705.10256-5-kch@nvidia.com>

Hi Chaitanya,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on axboe-block/for-next linus/master v6.16 next-20250801]
[cannot apply to linux-nvme/for-next awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Kulkarni/vfio-nvme-add-vfio-nvme-lm-driver-infrastructure/20250803-105056
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250803024705.10256-5-kch%40nvidia.com
patch subject: [RFC PATCH 4/4] vfio-nvme: implement TP4159 live migration cmds
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250804/202508040432.A5v60BDB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040432.A5v60BDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040432.A5v60BDB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/nvme/nvme.c:332:18: warning: variable 'hdr' is uninitialized when used here [-Wuninitialized]
     332 |         if (le16_to_cpu(hdr->nvmecss) > NVME_LM_MAX_NVMECS ||
         |                         ^~~
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/vfio/pci/nvme/nvme.c:310:32: note: initialize the variable 'hdr' to silence this warning
     310 |         struct nvme_lm_ctrl_state *hdr;
         |                                       ^
         |                                        = NULL
   1 warning generated.


vim +/hdr +332 drivers/vfio/pci/nvme/nvme.c

   303	
   304	static int nvmevf_get_ctrl_state(struct pci_dev *dev,
   305					__u8 csvi, __u8 csuuidi, __u8 csuidxp,
   306					struct nvmevf_migration_file *migf,
   307					struct nvme_lm_ctrl_state_info *state)
   308	{
   309		struct nvme_command c = { };
   310		struct nvme_lm_ctrl_state *hdr;
   311		/* Make sure hdr_len is a multiple of 4 */
   312		size_t hdr_len = ALIGN(sizeof(*hdr), 4);
   313		__u16 id = nvme_get_ctrl_id(dev);
   314		void *local_buf;
   315		size_t len;
   316		int ret;
   317	
   318		/* Step 1: Issue Migration Receive (Select = 0) to get header */
   319		local_buf = kzalloc(hdr_len, GFP_KERNEL);
   320		if (!local_buf)
   321			return -ENOMEM;
   322	
   323		nvmevf_init_get_ctrl_state_cmd(&c, id, csvi, csuuidi, csuidxp, hdr_len);
   324		ret = nvme_submit_vf_cmd(dev, &c, NULL, local_buf, hdr_len);
   325		if (ret) {
   326			dev_warn(&dev->dev,
   327				"nvme_admin_lm_recv failed (ret=0x%x)\n", ret);
   328			kfree(local_buf);
   329			return ret;
   330		}
   331	
 > 332		if (le16_to_cpu(hdr->nvmecss) > NVME_LM_MAX_NVMECS ||
   333		    le16_to_cpu(hdr->vss) > NVME_LM_MAX_VSD) {
   334			kfree(local_buf);
   335			return -EINVAL;
   336		}
   337	
   338		hdr = local_buf;
   339		len = hdr_len + 4 * (le16_to_cpu(hdr->nvmecss) + le16_to_cpu(hdr->vss));
   340	
   341		kfree(local_buf);
   342	
   343		if (len == hdr_len)
   344			dev_warn(&dev->dev, "nvmecss == 0 or vss = 0\n");
   345	
   346		/* Step 2: Allocate full buffer */
   347		migf->total_length = len;
   348		migf->vf_data = kvzalloc(migf->total_length, GFP_KERNEL);
   349		if (!migf->vf_data)
   350			return -ENOMEM;
   351	
   352		memset(&c, 0, sizeof(c));
   353		nvmevf_init_get_ctrl_state_cmd(&c, id, csvi, csuuidi, csuidxp, len);
   354		ret = nvme_submit_vf_cmd(dev, &c, NULL, migf->vf_data, len);
   355		if (ret)
   356			goto free_big;
   357	
   358		/* Populate state struct */
   359		hdr = (struct nvme_lm_ctrl_state *)migf->vf_data;
   360		state->raw = hdr;
   361		state->total_len = len;
   362		state->version = hdr->version;
   363		state->csattr = hdr->csattr;
   364		state->nvmecss = hdr->nvmecss;
   365		state->vss = hdr->vss;
   366		state->nvme_cs = hdr->data;
   367		state->vsd = hdr->data + le16_to_cpu(hdr->nvmecss) * 4;
   368	
   369		return ret;
   370	
   371	free_big:
   372		kvfree(migf->vf_data);
   373		return ret;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
