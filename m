Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39A32222A0;
	Sat, 27 Dec 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766846175; cv=none; b=iED6G0qfqgdho3+KsLaqMFUguk2xZDCmMFSPs0M9EomDfFbNjtlS0rGb+DIGi9rgxPx0C/N7sGe2yE5AFcLnDIAInSbcNWfITSyIt7m7o+E3s/MX9Vy1Hco/mdbPbhcyLmUKck/mOUwSq3TKRKN3XcMJ0DMoU/E+yKUGGCHJgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766846175; c=relaxed/simple;
	bh=XruNjXDQ+pLSmZykNsY99NzSIdjR9hrgODcg6kqeGpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU3kssv9Hu5s6Jja4yyyLtbh8pE2dIifxHU+tgcD+PuxZOEw3TJIkZKNZhDEeohr4cgEINL8e7mqpi/rmDX8LQkGalBp4OpUMUNYFs+YINNTq82KCKCeon5z9XCLm312YdAbzkmYEsxDcWKicB5OSIxuQRoMeru0CTZR5aImZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhLnNfvy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhLnNfvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766846173; x=1798382173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XruNjXDQ+pLSmZykNsY99NzSIdjR9hrgODcg6kqeGpQ=;
  b=fhLnNfvypuQkTavjJ0KDu3xQ001F4Fdprj4EUbI7dy6kSq70TgKGLt62
   ZJ99Kc9RRHgRJIeyh7aMna8bvNQobvyq2V8esV1rm79+0/wR7h3AhBR+M
   vV8JtSNciQYqflDlQI9U5dy3nqUuLzRMnxceuzZcjkGClqkRFrNHQmf23
   Xu7/gwE4wrVTG1/4kEpI1NIiQu0EgcHnS20VAzrJ93oqZWXMBru5um2Ae
   X9Z7KA42sgq7i4Ne19K1232rvuyhIADJnokL1G9W8DcDevYJ4BSIWtAnm
   N9aMJUbWvKcCZrPBnwA2KVIP84NaaoaU1dsrGcEcYnxpLDKAUeIeUbg/D
   A==;
X-CSE-ConnectionGUID: xQ+PC/H0SMSiv4FNa33iEA==
X-CSE-MsgGUID: I+Qoh6DtQY6DPZ+0+IH+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="94014698"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="94014698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:36:12 -0800
X-CSE-ConnectionGUID: ytWJBh5gQ0SgHankNUyK4Q==
X-CSE-MsgGUID: Lzx5E9MqRXeniwUYM6lSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200581167"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 06:36:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZVOn-000000005sn-1JCs;
	Sat, 27 Dec 2025 14:36:05 +0000
Date: Sat, 27 Dec 2025 22:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Coiby Xu <coxu@redhat.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Staudt <tstaudt@de.ibm.com>,
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <202512272218.ghBaSjzO-lkp@intel.com>
References: <20251226140636.1378505-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226140636.1378505-1-coxu@redhat.com>

Hi Coiby,

kernel test robot noticed the following build errors:

[auto build test ERROR on ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1]

url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/powerpc-kdump-pass-dm-crypt-keys-to-kdump-kernel/20251226-220726
base:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
patch link:    https://lore.kernel.org/r/20251226140636.1378505-1-coxu%40redhat.com
patch subject: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
config: powerpc64-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kexec/elf_64.c:95:9: error: call to undeclared function 'crash_load_dm_crypt_keys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |                 ret = crash_load_dm_crypt_keys(image);
         |                       ^
   1 error generated.


vim +/crash_load_dm_crypt_keys +95 arch/powerpc/kexec/elf_64.c

    27	
    28	static void *elf64_load(struct kimage *image, char *kernel_buf,
    29				unsigned long kernel_len, char *initrd,
    30				unsigned long initrd_len, char *cmdline,
    31				unsigned long cmdline_len)
    32	{
    33		int ret;
    34		unsigned long kernel_load_addr;
    35		unsigned long initrd_load_addr = 0, fdt_load_addr;
    36		void *fdt;
    37		const void *slave_code;
    38		struct elfhdr ehdr;
    39		char *modified_cmdline = NULL;
    40		struct crash_mem *rmem = NULL;
    41		struct kexec_elf_info elf_info;
    42		struct kexec_buf kbuf = { .image = image, .buf_min = 0,
    43					  .buf_max = ppc64_rma_size };
    44		struct kexec_buf pbuf = { .image = image, .buf_min = 0,
    45					  .buf_max = ppc64_rma_size, .top_down = true,
    46					  .mem = KEXEC_BUF_MEM_UNKNOWN };
    47	
    48		ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
    49		if (ret)
    50			return ERR_PTR(ret);
    51	
    52		if (IS_ENABLED(CONFIG_CRASH_DUMP) && image->type == KEXEC_TYPE_CRASH) {
    53			/* min & max buffer values for kdump case */
    54			kbuf.buf_min = pbuf.buf_min = crashk_res.start;
    55			kbuf.buf_max = pbuf.buf_max =
    56					((crashk_res.end < ppc64_rma_size) ?
    57					 crashk_res.end : (ppc64_rma_size - 1));
    58		}
    59	
    60		ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
    61		if (ret)
    62			goto out;
    63	
    64		kexec_dprintk("Loaded the kernel at 0x%lx\n", kernel_load_addr);
    65	
    66		ret = kexec_load_purgatory(image, &pbuf);
    67		if (ret) {
    68			pr_err("Loading purgatory failed.\n");
    69			goto out;
    70		}
    71	
    72		kexec_dprintk("Loaded purgatory at 0x%lx\n", pbuf.mem);
    73	
    74		/* Load additional segments needed for panic kernel */
    75		if (IS_ENABLED(CONFIG_CRASH_DUMP) && image->type == KEXEC_TYPE_CRASH) {
    76			ret = load_crashdump_segments_ppc64(image, &kbuf);
    77			if (ret) {
    78				pr_err("Failed to load kdump kernel segments\n");
    79				goto out;
    80			}
    81	
    82			/* Setup cmdline for kdump kernel case */
    83			modified_cmdline = setup_kdump_cmdline(image, cmdline,
    84							       cmdline_len,
    85							       "elfcorehdr",
    86							       image->elf_load_addr);
    87			if (!modified_cmdline) {
    88				pr_err("Setting up cmdline for kdump kernel failed\n");
    89				ret = -EINVAL;
    90				goto out;
    91			}
    92			cmdline = modified_cmdline;
    93			cmdline_len = strlen(cmdline) + 1;
    94	
  > 95			ret = crash_load_dm_crypt_keys(image);
    96			if (ret == -ENOENT) {
    97				kexec_dprintk("No dm crypt key to load\n");
    98			} else if (ret) {
    99				pr_err("Failed to load dm crypt keys\n");
   100				return ERR_PTR(ret);
   101			}
   102	
   103			if (image->dm_crypt_keys_addr != 0) {
   104				modified_cmdline = setup_kdump_cmdline(image, cmdline,
   105								       cmdline_len,
   106								       "dmcryptkeys",
   107								       image->dm_crypt_keys_addr);
   108				if (!modified_cmdline) {
   109					pr_err("Setting up cmdline for kdump kernel failed\n");
   110					ret = -EINVAL;
   111					goto out;
   112				}
   113				cmdline = modified_cmdline;
   114			}
   115		}
   116	
   117		if (initrd != NULL) {
   118			kbuf.buffer = initrd;
   119			kbuf.bufsz = kbuf.memsz = initrd_len;
   120			kbuf.buf_align = PAGE_SIZE;
   121			kbuf.top_down = false;
   122			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   123			ret = kexec_add_buffer(&kbuf);
   124			if (ret)
   125				goto out;
   126			initrd_load_addr = kbuf.mem;
   127	
   128			kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
   129		}
   130	
   131		ret = get_reserved_memory_ranges(&rmem);
   132		if (ret)
   133			goto out;
   134	
   135		fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
   136						   initrd_len, cmdline,
   137						   kexec_extra_fdt_size_ppc64(image, rmem));
   138		if (!fdt) {
   139			pr_err("Error setting up the new device tree.\n");
   140			ret = -EINVAL;
   141			goto out;
   142		}
   143	
   144		ret = setup_new_fdt_ppc64(image, fdt, rmem);
   145		if (ret)
   146			goto out_free_fdt;
   147	
   148		if (!IS_ENABLED(CONFIG_CRASH_HOTPLUG) || image->type != KEXEC_TYPE_CRASH)
   149			fdt_pack(fdt);
   150	
   151		kbuf.buffer = fdt;
   152		kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
   153		kbuf.buf_align = PAGE_SIZE;
   154		kbuf.top_down = true;
   155		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   156		ret = kexec_add_buffer(&kbuf);
   157		if (ret)
   158			goto out_free_fdt;
   159	
   160		/* FDT will be freed in arch_kimage_file_post_load_cleanup */
   161		image->arch.fdt = fdt;
   162	
   163		fdt_load_addr = kbuf.mem;
   164	
   165		kexec_dprintk("Loaded device tree at 0x%lx\n", fdt_load_addr);
   166	
   167		slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
   168		ret = setup_purgatory_ppc64(image, slave_code, fdt, kernel_load_addr,
   169					    fdt_load_addr);
   170		if (ret)
   171			pr_err("Error setting up the purgatory.\n");
   172	
   173		goto out;
   174	
   175	out_free_fdt:
   176		kvfree(fdt);
   177	out:
   178		kfree(rmem);
   179		kfree(modified_cmdline);
   180		kexec_free_elf_info(&elf_info);
   181	
   182		return ret ? ERR_PTR(ret) : NULL;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
