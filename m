Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF52210B;
	Sat, 20 Jan 2024 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705752883; cv=none; b=GxAxzvHBijjtU2pbJup98BJnypfzumWdG17S9cU2GCVTA30wTE59VxrRgh2e/LuTcFsx7/xdGiMD/N/23B6VHrVp7dY0MCALrDlFRFBCQxfbT6X9Zl6Bx/TPdzVRsJhHB+++NFxGOMmKaTrjeTK63f+BvoR9PWo7UUwfSynAoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705752883; c=relaxed/simple;
	bh=LcYyEkTqMXbJ+x3dFR1L0XJLk6bdfqSrtZZZQ0Ew/a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHVkREoFJkGQhP2BwNNhhpEHP+KyE5LZHJ/H/Jf8Qg8mVob1Psr+V5bpBCI32vzq0I+s98NLgN+AwkcWyJ4DhDh2CClLTCVgoxsZZyGwq/wnQzSavffQVyjksFAma+0Bk78q3C9uhb7Gkcm1G1rBenA7QRyLvhuaUgBANkzjGD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhJNTgyo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhJNTgyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705752881; x=1737288881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcYyEkTqMXbJ+x3dFR1L0XJLk6bdfqSrtZZZQ0Ew/a4=;
  b=nhJNTgyoX+QmXiAqh+VTB9Y0Kjayjp5hvDn4Os73uLQwRynmQZ5QODev
   70rDQQXgFLtkmFHoW1vkub0cGRyb9Mlvjn6n9vvjNVQ8xn0p2QRjUkmyd
   Z3w21OP2/beAmfHNqRGDEDvHBJAUoQfA8kkrnKKxks3K9JW0dIIhwSsMs
   jwXDB0uaxNvhnbB6YQr13gYDPTb32dkZqsauIUfUPX817Vu/g7x5zzTWW
   1NM+o2fyFR22f3h6f1Hh1A1dEPfqzQD3uZ6pReQ6wVoCdhH1MfSGe6O4z
   sxss9vrdPL8aEU7mX3q1Y/CAkwQ6/08ij+Jb9BSXPAZK0/2cmePxPMV/H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19508279"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="19508279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 04:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="26963911"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2024 04:14:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRAFA-00054m-0r;
	Sat, 20 Jan 2024 12:14:36 +0000
Date: Sat, 20 Jan 2024 20:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 1/8] net_sched: Introduce eBPF based Qdisc
Message-ID: <202401201954.x8zfr4TI-lkp@intel.com>
References: <232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung@bytedance.com>

Hi Amery,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on v6.7]
[cannot apply to bpf-next/master bpf/master net/main net-next/main linus/master horms-ipvs/master next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/net_sched-Introduce-eBPF-based-Qdisc/20240118-055917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung%40bytedance.com
patch subject: [RFC PATCH v7 1/8] net_sched: Introduce eBPF based Qdisc
config: i386-buildonly-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201954.x8zfr4TI-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201954.x8zfr4TI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201954.x8zfr4TI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/filter.c:8929:9: error: call to undeclared function 'bpf_get_btf_vmlinux'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8929 |                 btf = bpf_get_btf_vmlinux();
         |                       ^
>> net/core/filter.c:8929:7: error: incompatible integer to pointer conversion assigning to 'struct btf *' from 'int' [-Wint-conversion]
    8929 |                 btf = bpf_get_btf_vmlinux();
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/bpf_get_btf_vmlinux +8929 net/core/filter.c

  8909	
  8910	static bool tc_qdisc_is_valid_access(int off, int size,
  8911					     enum bpf_access_type type,
  8912					     const struct bpf_prog *prog,
  8913					     struct bpf_insn_access_aux *info)
  8914	{
  8915		struct btf *btf;
  8916	
  8917		if (off < 0 || off >= sizeof(struct bpf_qdisc_ctx))
  8918			return false;
  8919	
  8920		switch (off) {
  8921		case offsetof(struct bpf_qdisc_ctx, skb):
  8922			if (type == BPF_WRITE ||
  8923			    size != sizeof_field(struct bpf_qdisc_ctx, skb))
  8924				return false;
  8925	
  8926			if (prog->expected_attach_type != BPF_QDISC_ENQUEUE)
  8927				return false;
  8928	
> 8929			btf = bpf_get_btf_vmlinux();
  8930			if (IS_ERR_OR_NULL(btf))
  8931				return false;
  8932	
  8933			info->btf = btf;
  8934			info->btf_id = tc_qdisc_ctx_access_btf_ids[0];
  8935			info->reg_type = PTR_TO_BTF_ID | PTR_TRUSTED;
  8936			return true;
  8937		case bpf_ctx_range(struct bpf_qdisc_ctx, classid):
  8938			return size == sizeof_field(struct bpf_qdisc_ctx, classid);
  8939		case bpf_ctx_range(struct bpf_qdisc_ctx, expire):
  8940			return size == sizeof_field(struct bpf_qdisc_ctx, expire);
  8941		case bpf_ctx_range(struct bpf_qdisc_ctx, delta_ns):
  8942			return size == sizeof_field(struct bpf_qdisc_ctx, delta_ns);
  8943		default:
  8944			return false;
  8945		}
  8946	
  8947		return false;
  8948	}
  8949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
