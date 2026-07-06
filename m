Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D24221540;
	Mon,  6 Jul 2026 23:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379484; cv=none; b=Qcrv2b5b7BPoTAH1iYalFnBBFGxjln5Qtz5n2C/GEeFN6CMi08BdXJfJhf8YaZ/2e6qKUpSIlM4KbHeg71xAAwAxZO+8JAO8JK6/BIWDNqIOyWB2PM40eU5bjoQcizOvEU13rVos4r3gULeEN07kr9xYFq7Uu7Y+XjfhEHb3vR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379484; c=relaxed/simple;
	bh=DdjUcSkoJUUaJ8pJ6O2OwYbXeYqN0M5zv3GiB8wY9LE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pq3osCQkV43HncbCHrGG8lBQo/3q9Nz9CKYmRYKM7364+9NBNP/nvP3VRHSqat/EFGdNPdkr9f1+RR2jcJYTbZJI+3eSkEpRVsTkhDDXnWDRNYFm/8W5ljCK7CtAywHhMkEPfTfboaawo+/7/RYj+AkRBXC11XfAwsMLUGkImp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEYEb09N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEYEb09N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783379482; x=1814915482;
  h=date:from:to:cc:subject:message-id;
  bh=DdjUcSkoJUUaJ8pJ6O2OwYbXeYqN0M5zv3GiB8wY9LE=;
  b=NEYEb09N3+3z01RvS2UsCL+Lfed4wAxZgwl3+wB417VNdinjalJotA0z
   /CINSXrtOPPBgDgB3JV+xo6NHmjNtF4laiekQNk6tEHU/aKh8i0kTg26T
   gJCKQytu/Pd39RuF+IxqhN+swm6mUSUX9nbhu3J4Q5YGSXt4QJEKWcrie
   5jFGlin3gT+b+qewVgKp1T5kvgcNMuuYA+xht4tKtSaX3npfRoiTwT5WC
   +Y+Jwjp8z0tjXm7VxDRVFcLJx8LROe4Eeum9o7dLWiQ9qj56zhObGq9mC
   MjBPMYdNlRizraPqif6DDuPZ+no3WjVoGofBlrFsp8t+e7fCykKitxdY3
   g==;
X-CSE-ConnectionGUID: YvDnLB+jTj63HcR++RkGAA==
X-CSE-MsgGUID: RprL3SuIQv2Jp6HFCgNZtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="94667126"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="94667126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 16:11:22 -0700
X-CSE-ConnectionGUID: zf99JnljTK6+W9Ow+6ZXoQ==
X-CSE-MsgGUID: B6fyYSLTQoWsW2db0cx+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="253929516"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 16:11:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgsSk-00000000Epn-3Qhr;
	Mon, 06 Jul 2026 23:11:00 +0000
Date: Tue, 07 Jul 2026 07:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:direct-map/v0 4/7]
 kernel/liveupdate/kexec_handover.c:1074:10: error: call to undeclared
 function 'get_vm_area_page_order'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607070710.XxP4FQTx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git direct-map/v0
head:   21effbca0418e549e468c2141da5ba1ef83f06fb
commit: 5990078704982cce2dc9a952fb328771a7e7d991 [4/7] mm: split out vmalloc declarations from internal.h
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260707/202607070710.XxP4FQTx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070710.XxP4FQTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607070710.XxP4FQTx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/liveupdate/kexec_handover.c:1074:10: error: call to undeclared function 'get_vm_area_page_order'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |         order = get_vm_area_page_order(vm);
         |                 ^
   kernel/liveupdate/kexec_handover.c:1074:10: note: did you mean 'get_vm_area_caller'?
   include/linux/vmalloc.h:247:26: note: 'get_vm_area_caller' declared here
     247 | extern struct vm_struct *get_vm_area_caller(unsigned long size,
         |                          ^
>> kernel/liveupdate/kexec_handover.c:1220:2: error: call to undeclared function 'clear_vm_uninitialized_flag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1220 |         clear_vm_uninitialized_flag(area);
         |         ^
   2 errors generated.


vim +/get_vm_area_page_order +1074 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1043) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1044) /**
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1045)  * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1046)  * @ptr: pointer to the area in vmalloc address space
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1047)  * @preservation: placeholder for preservation metadata
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1048)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1049)  * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1050)  * physical pages mapped at @ptr will be preserved and on successful return
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1051)  * @preservation will hold the physical address of a structure that describes
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1052)  * the preservation.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1053)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1054)  * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1055)  * restored on the same node
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1056)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1057)  * Return: 0 on success, error code on failure
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1058)  */
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1059) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1060) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1061) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1062) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1063) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1064) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1065) 	int err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1066) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1067) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1068) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1069) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1070) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1071) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1072) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1073) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21 @1074) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1075) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1076) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1077) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1078) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1079) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1080) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1081) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1082) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1083) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1084) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1085) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1086) 		if (err)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1087) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1088) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1089) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1090) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1091) 			chunk = new_vmalloc_chunk(chunk);
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1092  			if (!chunk) {
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1093  				err = -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1094) 				goto err_free;
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1095  			}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1096) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1097) 		}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1098) 	}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1099) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1100) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1101) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1102) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1103) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1104) 	return 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1105) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1106) err_free:
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1107  	kho_unpreserve_vmalloc(preservation);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1108) 	return err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1109) }
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1110) EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1111) 
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1112  /**
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1113   * kho_unpreserve_vmalloc - unpreserve memory allocated with vmalloc()
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1114   * @preservation: preservation metadata returned by kho_preserve_vmalloc()
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1115   *
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1116   * Instructs KHO to unpreserve the area in vmalloc address space that was
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1117   * previously preserved with kho_preserve_vmalloc().
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1118   */
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1119  void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation)
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1120  {
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1121  	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1122  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1123  	while (chunk) {
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1124  		struct kho_vmalloc_chunk *tmp = chunk;
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1125  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1126  		kho_vmalloc_unpreserve_chunk(chunk, preservation->order);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1127  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1128  		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1129  		free_page((unsigned long)tmp);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1130  	}
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1131  }
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1132  EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1133  
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1134) /**
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1135)  * kho_restore_vmalloc - recreates and populates an area in vmalloc address
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1136)  * space from the preserved memory.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1137)  * @preservation: preservation metadata.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1138)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1139)  * Recreates an area in vmalloc address space and populates it with memory that
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1140)  * was preserved using kho_preserve_vmalloc().
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1141)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1142)  * Return: pointer to the area in the vmalloc address space, NULL on failure.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1143)  */
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1144) void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1145) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1146) 	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1147  	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_PROT_NORMAL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1148) 	unsigned int align, order, shift, vm_flags;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1149) 	unsigned long total_pages, contig_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1150) 	unsigned long addr, size;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1151) 	struct vm_struct *area;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1152) 	struct page **pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1153) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1154) 	int err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1155) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1156) 	vm_flags = kho_flags_to_vmalloc(preservation->flags);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1157) 	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1158) 		return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1159) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1160) 	total_pages = preservation->total_pages;
bf4afc53b77aea kernel/liveupdate/kexec_handover.c Linus Torvalds            2026-02-21  1161  	pages = kvmalloc_objs(*pages, total_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1162) 	if (!pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1163) 		return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1164) 	order = preservation->order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1165) 	contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1166) 	shift = PAGE_SHIFT + order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1167) 	align = 1 << shift;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1168) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1169) 	while (chunk) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1170) 		struct page *page;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1171) 
0b07092d09e54e kernel/kexec_handover.c            Pratyush Yadav            2025-11-03  1172  		for (int i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1173) 			phys_addr_t phys = chunk->phys[i];
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1174) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1175) 			if (idx + contig_pages > total_pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1176) 				goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1177) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1178) 			page = kho_restore_pages(phys, contig_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1179) 			if (!page)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1180) 				goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1181) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1182) 			for (int j = 0; j < contig_pages; j++)
4bc84cd539dff1 kernel/liveupdate/kexec_handover.c Mike Rapoport (Microsoft  2025-11-25  1183) 				pages[idx++] = page + j;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1184) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1185) 			phys += contig_pages * PAGE_SIZE;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1186) 		}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1187) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1188) 		page = kho_restore_pages(virt_to_phys(chunk), 1);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1189) 		if (!page)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1190) 			goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1191) 		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1192) 		__free_page(page);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1193) 	}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1194) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1195) 	if (idx != total_pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1196) 		goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1197) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1198) 	area = __get_vm_area_node(total_pages * PAGE_SIZE, align, shift,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1199  				  vm_flags | VM_UNINITIALIZED,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1200  				  VMALLOC_START, VMALLOC_END,
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1201) 				  NUMA_NO_NODE, GFP_KERNEL,
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1202) 				  __builtin_return_address(0));
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1203) 	if (!area)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1204) 		goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1205) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1206) 	addr = (unsigned long)area->addr;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1207) 	size = get_vm_area_size(area);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1208) 	err = vmap_pages_range(addr, addr + size, PAGE_KERNEL, pages, shift);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1209) 	if (err)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1210) 		goto err_free_vm_area;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1211) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1212) 	area->nr_pages = total_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1213) 	area->pages = pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1214) 
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1215  	if (vm_flags & VM_ALLOC)
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1216  		kasan_flags |= KASAN_VMALLOC_VM_ALLOC;
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1217  
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1218  	area->addr = kasan_unpoison_vmalloc(area->addr, total_pages * PAGE_SIZE,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1219  					    kasan_flags);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25 @1220  	clear_vm_uninitialized_flag(area);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1221  
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1222) 	return area->addr;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1223) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1224) err_free_vm_area:
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1225) 	free_vm_area(area);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1226) err_free_pages_array:
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1227) 	kvfree(pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1228) 	return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1229) }
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1230) EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1231) 

:::::: The code at line 1074 was first introduced by commit
:::::: a667300bd53f272a3055238bcefe108f88836270 kho: add support for preserving vmalloc allocations

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
