Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1EB46AEE8;
	Thu, 26 Feb 2026 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138168; cv=none; b=hrydUWJZFW3sTgPPLl5zCkl813dSM/+/AKZHgRNeuXj7btMAmFp1KtmhE7l3PiOC0+iSjZPiPmEJyH4BGPkoD7Q+/qCJ0lGY2iyrCe2n6GTJTm6aIMp/IUZ4u7YW5J265AOjm0CqvBq5XcVJoX24az5akxEGKGC2djZ/FwVCoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138168; c=relaxed/simple;
	bh=oi5bCRy0XyG07kPtczcO3wUU1xZaEMt/ImAa1WysYZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phfZGAz6C5VF5ETLi9+QFvuBtilqwOFjaaVsTdKNJL2ltj2orykjPGNkjYBMSxg9FszE+NtgMSCb9wb4VDSSBNIO6DP9kM7kU2QiIVJK+Vc8l/pt+FBLcX6wxoScURdKQXvWnM3vSyJUUS9Y7MSB+ASAUs7kQorkmFWODw7NebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0AD4zdB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0AD4zdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772138164; x=1803674164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oi5bCRy0XyG07kPtczcO3wUU1xZaEMt/ImAa1WysYZ4=;
  b=C0AD4zdB4OR+W7lzVfA3bQVsXfQiYFyeR6ihB1CZgBbSLCZJfKCVOiEb
   DU3VCaNYvsgIDV3II5PZBC3+/u8/5yW88kgHKfi/LbAJxjGLo3znH45dJ
   N36bEWW8wnDMk9q4WqugpMv2xCRyvicW6fUH9QoMV88gSUqrGFoLYnggc
   hdbI5vjE4k+u2bR8pqadhj+8rNfx7aoG+hSRtcS8BjVVDfl/Ch9NDIq61
   b+0L6sHm67dQRFqEq8xdoU4cy4xkqVyP3peOpjfnGvbwpAsKQxokRA/ZO
   kVqq/K3y+6MX1dsqfwVqDmDwjH28w2hd8gXRt6D6QgyzwBlnMhRVOBH3x
   A==;
X-CSE-ConnectionGUID: wnsjoErhQ+Ghps9Fho8MOg==
X-CSE-MsgGUID: zg5w0VPMReWUwNE/KNn4Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72246412"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72246412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:36:03 -0800
X-CSE-ConnectionGUID: cKAN3npeQWGVhSS4N2lACg==
X-CSE-MsgGUID: y5msovCpQ6WKnPOMeayfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="247201778"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2026 12:35:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvi4m-000000009rL-31Bq;
	Thu, 26 Feb 2026 20:35:24 +0000
Date: Fri, 27 Feb 2026 04:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, pmladek@suse.com,
	rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
	paulmck@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <202602270403.GagykAb8-lkp@intel.com>
References: <20260226130437.1867658-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226130437.1867658-5-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on robh/for-next linus/master v7.0-rc1 next-20260226]
[cannot apply to powerpc/next powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/powerpc-crash-sort-crash-memory-ranges-before-preparing-elfcorehdr/20260226-222516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260226130437.1867658-5-ruanjinjie%40huawei.com
patch subject: [PATCH v7 4/5] arm64: kexec: Add support for crashkernel CMA reservation
config: x86_64-buildonly-randconfig-004-20260226 (https://download.01.org/0day-ci/archive/20260227/202602270403.GagykAb8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270403.GagykAb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270403.GagykAb8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/kexec.c:312:29: warning: unused variable 'i' [-Wunused-variable]
     312 |         int ret, chosen_node, len, i;
         |                                    ^
   1 warning generated.


vim +/i +312 drivers/of/kexec.c

   294	
   295	/*
   296	 * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
   297	 *
   298	 * @image:		kexec image being loaded.
   299	 * @initrd_load_addr:	Address where the next initrd will be loaded.
   300	 * @initrd_len:		Size of the next initrd, or 0 if there will be none.
   301	 * @cmdline:		Command line for the next kernel, or NULL if there will
   302	 *			be none.
   303	 * @extra_fdt_size:	Additional size for the new FDT buffer.
   304	 *
   305	 * Return: fdt on success, or NULL errno on error.
   306	 */
   307	void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
   308					   unsigned long initrd_load_addr,
   309					   unsigned long initrd_len,
   310					   const char *cmdline, size_t extra_fdt_size)
   311	{
 > 312		int ret, chosen_node, len, i;
   313		const void *prop;
   314		size_t fdt_size;
   315		void *fdt;
   316	
   317		fdt_size = fdt_totalsize(initial_boot_params) +
   318			   (cmdline ? strlen(cmdline) : 0) +
   319			   FDT_EXTRA_SPACE +
   320			   extra_fdt_size;
   321		fdt = kvmalloc(fdt_size, GFP_KERNEL);
   322		if (!fdt)
   323			return NULL;
   324	
   325		ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
   326		if (ret < 0) {
   327			pr_err("Error %d setting up the new device tree.\n", ret);
   328			goto out;
   329		}
   330	
   331		/* Remove memory reservation for the current device tree. */
   332		ret = fdt_find_and_del_mem_rsv(fdt, initial_boot_params_pa,
   333					       fdt_totalsize(initial_boot_params));
   334		if (ret == -EINVAL) {
   335			pr_err("Error removing memory reservation.\n");
   336			goto out;
   337		}
   338	
   339		chosen_node = fdt_path_offset(fdt, "/chosen");
   340		if (chosen_node == -FDT_ERR_NOTFOUND)
   341			chosen_node = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
   342						      "chosen");
   343		if (chosen_node < 0) {
   344			ret = chosen_node;
   345			goto out;
   346		}
   347	
   348		ret = fdt_delprop(fdt, chosen_node, "linux,elfcorehdr");
   349		if (ret && ret != -FDT_ERR_NOTFOUND)
   350			goto out;
   351		ret = fdt_delprop(fdt, chosen_node, "linux,usable-memory-range");
   352		if (ret && ret != -FDT_ERR_NOTFOUND)
   353			goto out;
   354	
   355		/* Did we boot using an initrd? */
   356		prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", &len);
   357		if (prop) {
   358			u64 tmp_start, tmp_end, tmp_size;
   359	
   360			tmp_start = of_read_number(prop, len / 4);
   361	
   362			prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", &len);
   363			if (!prop) {
   364				ret = -EINVAL;
   365				goto out;
   366			}
   367	
   368			tmp_end = of_read_number(prop, len / 4);
   369	
   370			/*
   371			 * kexec reserves exact initrd size, while firmware may
   372			 * reserve a multiple of PAGE_SIZE, so check for both.
   373			 */
   374			tmp_size = tmp_end - tmp_start;
   375			ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, tmp_size);
   376			if (ret == -ENOENT)
   377				ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
   378							       round_up(tmp_size, PAGE_SIZE));
   379			if (ret == -EINVAL)
   380				goto out;
   381		}
   382	
   383		/* add initrd-* */
   384		if (initrd_load_addr) {
   385			ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-start",
   386					      initrd_load_addr);
   387			if (ret)
   388				goto out;
   389	
   390			ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-end",
   391					      initrd_load_addr + initrd_len);
   392			if (ret)
   393				goto out;
   394	
   395			ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
   396			if (ret)
   397				goto out;
   398	
   399		} else {
   400			ret = fdt_delprop(fdt, chosen_node, "linux,initrd-start");
   401			if (ret && (ret != -FDT_ERR_NOTFOUND))
   402				goto out;
   403	
   404			ret = fdt_delprop(fdt, chosen_node, "linux,initrd-end");
   405			if (ret && (ret != -FDT_ERR_NOTFOUND))
   406				goto out;
   407		}
   408	
   409		if (image->type == KEXEC_TYPE_CRASH) {
   410			/* add linux,elfcorehdr */
   411			ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
   412					"linux,elfcorehdr", image->elf_load_addr,
   413					image->elf_headers_sz);
   414			if (ret)
   415				goto out;
   416	
   417			/*
   418			 * Avoid elfcorehdr from being stomped on in kdump kernel by
   419			 * setting up memory reserve map.
   420			 */
   421			ret = fdt_add_mem_rsv(fdt, image->elf_load_addr,
   422					      image->elf_headers_sz);
   423			if (ret)
   424				goto out;
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
