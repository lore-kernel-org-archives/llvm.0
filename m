Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6337FF46;
	Wed,  8 Apr 2026 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632727; cv=none; b=Vjyu+eYjbWcbPSlQdQktkXaTddAJYewASlS7IoNrtJbmiJW2a1We8GPFdDrt9EMTPre95iyc8K0fr1x8YYErnRt7M4zb06t9oO70UUZ734NJEjl6IrPbuBBpUzOkKTCsU0lD3AJSSyDzvOFxCM++0+PHEKS07ZYYhn7m+dDJHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632727; c=relaxed/simple;
	bh=AtgegxOX0KuecyL009bOjNrgq02ohPSbazAjF+ng244=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o/2+0ffK9X1s0uvLeQSysO9Yb+aBgW5AjNRk5YmJxq/izGXZKvBus9Z5iuQEwTnFbqJNcUX9JwgyAW7HV27LnI/PPikjZIkylT0otuUY9ZMiaPyYxkADUhgXSeJoL/0CdXwa15yYmNoCcSWzN8DipPbearRrW4nKWPD+rb2FkRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOWrCXbl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOWrCXbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775632726; x=1807168726;
  h=date:from:to:cc:subject:message-id;
  bh=AtgegxOX0KuecyL009bOjNrgq02ohPSbazAjF+ng244=;
  b=fOWrCXbloLdy4d/lxgPptxESeVqQ7xpX8x+JX4E+E3zDvJeptD+aOe1w
   FnIH8sfGqFGNJ5tfXjrF+7lvCVRVG6RfGxwUGG6scY+lXqPe/1t9XJwpn
   PqnjfeGDaO+hDHLRg5wWRWR3wZRc9ATYODIp41f+w3bt2Yb8cuOz1RYg6
   I+Z6UvcMhcNuWdZ4aL13CFd2hw+BCxhcCAinzgRqhY8bugprSZ7gs+3cw
   rkJP8yt+s3Lb+vyrkyVpR8N6LhQvIDRLBoeN/6bJ5GYpl1jPCaoWTFIn0
   9SUXaw/mEDZQWWzRXFlkgRTR7jz72RQ7jjdlYK/2YhZl0ZU6bz/+hyPOB
   Q==;
X-CSE-ConnectionGUID: 63ZyQkgzSBybTlr9JAWlkw==
X-CSE-MsgGUID: S8RWR0dQS+a0o5rsLSMSBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75646098"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="75646098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 00:18:46 -0700
X-CSE-ConnectionGUID: xD73TkOeTuOQXeW8UkfEZg==
X-CSE-MsgGUID: ohmiRmwpTkOqYt7fw3tXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232435959"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2026 00:18:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wANBR-00000000AQ9-3wOj;
	Wed, 08 Apr 2026 07:18:41 +0000
Date: Wed, 08 Apr 2026 09:18:00 +0200
From: kernel test robot <lkp@intel.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:2276:19: error: use of undeclared
 identifier 'bpf_landlock_ruleset_btf_ids'
Message-ID: <202604080920.Cm9eXBu4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Justin-Suess/landlock-Move-operations-from-syscall-into-ruleset-code/20260408-053705
head:   7423cdaa89895ef6399743cfef9c7bfe1c22b8ad
commit: a0c8fd8936e1475411b42961f95d16772832b543 bpf: verifier: Add Landlock ruleset map support
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260408/202604080920.Cm9eXBu4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080920.Cm9eXBu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080920.Cm9eXBu4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/verifier.c:2276:19: error: use of undeclared identifier 'bpf_landlock_ruleset_btf_ids'
    2276 |                         reg->btf_id = *bpf_landlock_ruleset_btf_ids;
         |                                        ^
   1 error generated.


vim +/bpf_landlock_ruleset_btf_ids +2276 kernel/bpf/verifier.c

  2252	
  2253	static void mark_ptr_not_null_reg(struct bpf_reg_state *reg)
  2254	{
  2255		if (base_type(reg->type) == PTR_TO_MAP_VALUE) {
  2256			const struct bpf_map *map = reg->map_ptr;
  2257	
  2258			if (map->inner_map_meta) {
  2259				reg->type = CONST_PTR_TO_MAP;
  2260				reg->map_ptr = map->inner_map_meta;
  2261				/* transfer reg's id which is unique for every map_lookup_elem
  2262				 * as UID of the inner map.
  2263				 */
  2264				if (btf_record_has_field(map->inner_map_meta->record,
  2265							 BPF_TIMER | BPF_WORKQUEUE | BPF_TASK_WORK)) {
  2266					reg->map_uid = reg->id;
  2267				}
  2268			} else if (map->map_type == BPF_MAP_TYPE_XSKMAP) {
  2269				reg->type = PTR_TO_XDP_SOCK;
  2270			} else if (map->map_type == BPF_MAP_TYPE_SOCKMAP ||
  2271				   map->map_type == BPF_MAP_TYPE_SOCKHASH) {
  2272				reg->type = PTR_TO_SOCKET;
  2273			} else if (map->map_type == BPF_MAP_TYPE_LANDLOCK_RULESET) {
  2274				reg->type = PTR_TO_BTF_ID | PTR_TRUSTED;
  2275				reg->btf = btf_vmlinux;
> 2276				reg->btf_id = *bpf_landlock_ruleset_btf_ids;
  2277			} else {
  2278				reg->type = PTR_TO_MAP_VALUE;
  2279			}
  2280			return;
  2281		}
  2282	
  2283		reg->type &= ~PTR_MAYBE_NULL;
  2284	}
  2285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
