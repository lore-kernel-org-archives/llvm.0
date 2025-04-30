Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7716EB42;
	Wed, 30 Apr 2025 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991794; cv=none; b=dPyZzaKtri5WumhQAEY9yzi1iwIvHXciZew0VAGr9Ay33Jgfd5V4Zg8kpdqvBFGtNyEcFrY74sCZrt9RvqvmtQYgz/bj7nswryNKutiRvVJh0ZC087ex0LECC8bEQ8x+pm+t409HXbzf3UYGNmANm5+GtlDWwDMlmaviwAJ3Cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991794; c=relaxed/simple;
	bh=QHoVzjI2dGdzd2TfHP/WJSSN4DG0nX+Ye87v5o0XLG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1t/hAgzo4wFwjGsuPlqsdpDQSkPrcu8asFyLH/J2II6O0ZlEN3b+xyE6kmdeC6K7JgxrSAzYAlC6hPtvgiXEdVK8+sffoSGI5aWrRgM33L1Zcuu4B66qKe/Lpz/1kQnLyjedqggXb6tDqiuUAd4EyrtUQ9FIGrjU6dsYxEC07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dedL2xvC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dedL2xvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745991791; x=1777527791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QHoVzjI2dGdzd2TfHP/WJSSN4DG0nX+Ye87v5o0XLG0=;
  b=dedL2xvCzb4TLWqp4Nn65FBLS731R1YpUIl9CYgU+jgE5CrQzd8JgXzD
   m4kBZ6yYkdknu2yJLXshYlA5ffXeVpRrOWK8WMhukhAKiO9kiytUb8vQt
   44ijB6hZUNKZ+Mb7MEoENxPC46Rk9XsAJ6Gz+Yeh051ccV5MW7ZnKHbNj
   PtW4lU7WEHcyiOJ8RSmL/ZK0LUNujfSvR/6mPCce7yN8qcZUmkDRy//YX
   fWyGGDFw/VGiZ6BAe2JWn4do+VNxQaWzomA8B8YBMzRYjYVhiGUZ7APm/
   vN+JwpOO4jbAexuMhcEo+8zYxHIxoNpGb1Sp6fKxcWIYLjqMzeJ7LiWcr
   w==;
X-CSE-ConnectionGUID: 6WrcbMliQgiPBpwSIh8E/A==
X-CSE-MsgGUID: J/i4kLsPTg27oI0hKz/Epg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47546179"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47546179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:43:11 -0700
X-CSE-ConnectionGUID: ZytKg7hMQlGRCzIW4pefjw==
X-CSE-MsgGUID: /hS2BLeKSlimK4bT0F9i4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134337779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 22:36:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA072-0003Bk-13;
	Wed, 30 Apr 2025 05:36:04 +0000
Date: Wed, 30 Apr 2025 13:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv2 7/7] arm64/kexec: Add PE image format support
Message-ID: <202504301314.NaE4JGVw-lkp@intel.com>
References: <20250429041214.13291-8-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429041214.13291-8-piliu@redhat.com>

Hi Pingfan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on bpf-next/net bpf-next/master bpf/master linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/kexec_file-Make-kexec_image_load_default-global-visible/20250429-121621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250429041214.13291-8-piliu%40redhat.com
patch subject: [RFCv2 7/7] arm64/kexec: Add PE image format support
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301314.NaE4JGVw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301314.NaE4JGVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301314.NaE4JGVw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_pe_image.c:219:48: warning: format specifies type 'unsigned long' but the argument has type 'struct mem_range_result *' [-Wformat]
     219 |         pr_info("%s, return range 0x%lx\n", __func__, range);
         |                                     ~~~               ^~~~~
   include/linux/printk.h:580:34: note: expanded from macro 'pr_info'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> kernel/kexec_pe_image.c:158:9: warning: unused variable 'flush' [-Wunused-variable]
     158 |         long (*flush)(void*, unsigned long) = NULL;
         |                ^~~~~
>> kernel/kexec_pe_image.c:399:22: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
     399 | __attribute__((used, optimize("O0"))) void bpf_handle_pefile(char *image, int image_sz,
         |                      ^~~~~~~~~~~~~~
>> kernel/kexec_pe_image.c:399:44: warning: no previous prototype for function 'bpf_handle_pefile' [-Wmissing-prototypes]
     399 | __attribute__((used, optimize("O0"))) void bpf_handle_pefile(char *image, int image_sz,
         |                                            ^
   kernel/kexec_pe_image.c:399:39: note: declare 'static' if the function is not intended to be used outside of this translation unit
     399 | __attribute__((used, optimize("O0"))) void bpf_handle_pefile(char *image, int image_sz,
         |                                       ^
         |                                       static 
   kernel/kexec_pe_image.c:404:22: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
     404 | __attribute__((used, optimize("O0"))) void bpf_post_handle_pefile(void)
         |                      ^~~~~~~~~~~~~~
>> kernel/kexec_pe_image.c:404:44: warning: no previous prototype for function 'bpf_post_handle_pefile' [-Wmissing-prototypes]
     404 | __attribute__((used, optimize("O0"))) void bpf_post_handle_pefile(void)
         |                                            ^
   kernel/kexec_pe_image.c:404:39: note: declare 'static' if the function is not intended to be used outside of this translation unit
     404 | __attribute__((used, optimize("O0"))) void bpf_post_handle_pefile(void)
         |                                       ^
         |                                       static 
>> kernel/kexec_pe_image.c:529:7: warning: expression which evaluates to zero treated as a null pointer constant of type 'char *' [-Wnon-literal-null-conversion]
     529 |                 c = '\0';
         |                     ^~~~
>> kernel/kexec_pe_image.c:446:37: warning: variable 'cmdline_sz' set but not used [-Wunused-but-set-variable]
     446 |         unsigned long linux_sz, initrd_sz, cmdline_sz, bpf_sz;
         |                                            ^
   kernel/kexec_pe_image.c:90:13: warning: unused function 'flush_buffer' [-Wunused-function]
      90 | static long flush_buffer(void *buf, unsigned long len)
         |             ^~~~~~~~~~~~
   9 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for KEXEC_PE_IMAGE
   Depends on [n]: KEXEC_FILE [=y] && DEBUG_INFO_BTF [=n] && BPF_SYSCALL [=y]
   Selected by [y]:
   - ARCH_SELECTS_KEXEC_FILE [=y] && KEXEC_FILE [=y]


vim +219 kernel/kexec_pe_image.c

318ac91dd61443 Pingfan Liu 2025-04-29  152  
318ac91dd61443 Pingfan Liu 2025-04-29  153  __bpf_kfunc struct mem_range_result *bpf_kexec_decompress(char *image_gz_payload, int image_gz_sz,
318ac91dd61443 Pingfan Liu 2025-04-29  154  			unsigned int expected_decompressed_sz)
318ac91dd61443 Pingfan Liu 2025-04-29  155  {
318ac91dd61443 Pingfan Liu 2025-04-29  156  	decompress_fn decompressor;
318ac91dd61443 Pingfan Liu 2025-04-29  157  	//todo, use flush to cap the memory size used by decompression
318ac91dd61443 Pingfan Liu 2025-04-29 @158  	long (*flush)(void*, unsigned long) = NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  159  	struct mem_range_result *range;
318ac91dd61443 Pingfan Liu 2025-04-29  160  	const char *name;
318ac91dd61443 Pingfan Liu 2025-04-29  161  	void *output_buf;
318ac91dd61443 Pingfan Liu 2025-04-29  162  	char *input_buf;
318ac91dd61443 Pingfan Liu 2025-04-29  163  	int ret;
318ac91dd61443 Pingfan Liu 2025-04-29  164  
318ac91dd61443 Pingfan Liu 2025-04-29  165  	range = kmalloc(sizeof(struct mem_range_result), GFP_KERNEL);
318ac91dd61443 Pingfan Liu 2025-04-29  166  	if (!range) {
318ac91dd61443 Pingfan Liu 2025-04-29  167  		pr_err("fail to allocate mem_range_result\n");
318ac91dd61443 Pingfan Liu 2025-04-29  168  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  169  	}
318ac91dd61443 Pingfan Liu 2025-04-29  170  	refcount_set(&range->usage, 1);
318ac91dd61443 Pingfan Liu 2025-04-29  171  
318ac91dd61443 Pingfan Liu 2025-04-29  172  	input_buf = vmalloc(image_gz_sz);
318ac91dd61443 Pingfan Liu 2025-04-29  173  	if (!input_buf) {
318ac91dd61443 Pingfan Liu 2025-04-29  174  		pr_err("fail to allocate input buffer\n");
318ac91dd61443 Pingfan Liu 2025-04-29  175  		kfree(range);
318ac91dd61443 Pingfan Liu 2025-04-29  176  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  177  	}
318ac91dd61443 Pingfan Liu 2025-04-29  178  
318ac91dd61443 Pingfan Liu 2025-04-29  179  	ret = copy_from_kernel_nofault(input_buf, image_gz_payload, image_gz_sz);
318ac91dd61443 Pingfan Liu 2025-04-29  180  	if (ret < 0) {
318ac91dd61443 Pingfan Liu 2025-04-29  181  		pr_err("Error when copying from 0x%px, size:0x%x\n",
318ac91dd61443 Pingfan Liu 2025-04-29  182  				image_gz_payload, image_gz_sz);
318ac91dd61443 Pingfan Liu 2025-04-29  183  		kfree(range);
318ac91dd61443 Pingfan Liu 2025-04-29  184  		vfree(input_buf);
318ac91dd61443 Pingfan Liu 2025-04-29  185  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  186  	}
318ac91dd61443 Pingfan Liu 2025-04-29  187  
318ac91dd61443 Pingfan Liu 2025-04-29  188  	output_buf = vmalloc(expected_decompressed_sz);
318ac91dd61443 Pingfan Liu 2025-04-29  189  	if (!output_buf) {
318ac91dd61443 Pingfan Liu 2025-04-29  190  		pr_err("fail to allocate output buffer\n");
318ac91dd61443 Pingfan Liu 2025-04-29  191  		kfree(range);
318ac91dd61443 Pingfan Liu 2025-04-29  192  		vfree(input_buf);
318ac91dd61443 Pingfan Liu 2025-04-29  193  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  194  	}
318ac91dd61443 Pingfan Liu 2025-04-29  195  
318ac91dd61443 Pingfan Liu 2025-04-29  196  	decompressor = decompress_method(input_buf, image_gz_sz, &name);
318ac91dd61443 Pingfan Liu 2025-04-29  197  	if (!decompressor) {
318ac91dd61443 Pingfan Liu 2025-04-29  198  		pr_err("Can not find decompress method\n");
318ac91dd61443 Pingfan Liu 2025-04-29  199  		kfree(range);
318ac91dd61443 Pingfan Liu 2025-04-29  200  		vfree(input_buf);
318ac91dd61443 Pingfan Liu 2025-04-29  201  		vfree(output_buf);
318ac91dd61443 Pingfan Liu 2025-04-29  202  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  203  	}
318ac91dd61443 Pingfan Liu 2025-04-29  204  	//to do, use flush
318ac91dd61443 Pingfan Liu 2025-04-29  205  	ret = decompressor(image_gz_payload, image_gz_sz, NULL, NULL,
318ac91dd61443 Pingfan Liu 2025-04-29  206  				output_buf, NULL, NULL);
318ac91dd61443 Pingfan Liu 2025-04-29  207  
318ac91dd61443 Pingfan Liu 2025-04-29  208  	/* Update the range map */
318ac91dd61443 Pingfan Liu 2025-04-29  209  	if (ret == 0) {
318ac91dd61443 Pingfan Liu 2025-04-29  210  		range->buf = output_buf;
318ac91dd61443 Pingfan Liu 2025-04-29  211  		range->size = expected_decompressed_sz;
318ac91dd61443 Pingfan Liu 2025-04-29  212  		range->status = 0;
318ac91dd61443 Pingfan Liu 2025-04-29  213  	} else {
318ac91dd61443 Pingfan Liu 2025-04-29  214  		pr_err("Decompress error\n");
318ac91dd61443 Pingfan Liu 2025-04-29  215  		vfree(output_buf);
318ac91dd61443 Pingfan Liu 2025-04-29  216  		kfree(range);
318ac91dd61443 Pingfan Liu 2025-04-29  217  		return NULL;
318ac91dd61443 Pingfan Liu 2025-04-29  218  	}
318ac91dd61443 Pingfan Liu 2025-04-29 @219  	pr_info("%s, return range 0x%lx\n", __func__, range);
318ac91dd61443 Pingfan Liu 2025-04-29  220  	return range;
318ac91dd61443 Pingfan Liu 2025-04-29  221  }
318ac91dd61443 Pingfan Liu 2025-04-29  222  
318ac91dd61443 Pingfan Liu 2025-04-29  223  __bpf_kfunc int bpf_kexec_result_release(struct mem_range_result *result)
318ac91dd61443 Pingfan Liu 2025-04-29  224  {
318ac91dd61443 Pingfan Liu 2025-04-29  225  	if (!result) {
318ac91dd61443 Pingfan Liu 2025-04-29  226  		pr_err("%s, receive invalid range\n", __func__);
318ac91dd61443 Pingfan Liu 2025-04-29  227  		return -EINVAL;
318ac91dd61443 Pingfan Liu 2025-04-29  228  	}
318ac91dd61443 Pingfan Liu 2025-04-29  229  
318ac91dd61443 Pingfan Liu 2025-04-29  230  	if (refcount_dec_and_test(&result->usage)) {
318ac91dd61443 Pingfan Liu 2025-04-29  231  		vfree(result->buf);
318ac91dd61443 Pingfan Liu 2025-04-29  232  		kfree(result);
318ac91dd61443 Pingfan Liu 2025-04-29  233  	}
318ac91dd61443 Pingfan Liu 2025-04-29  234  
318ac91dd61443 Pingfan Liu 2025-04-29  235  	return 0;
318ac91dd61443 Pingfan Liu 2025-04-29  236  }
318ac91dd61443 Pingfan Liu 2025-04-29  237  
318ac91dd61443 Pingfan Liu 2025-04-29  238  __bpf_kfunc_end_defs();
318ac91dd61443 Pingfan Liu 2025-04-29  239  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  240  static bool is_valid_pe(const char *kernel_buf, unsigned long kernel_len)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  241  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  242  	struct mz_hdr *mz;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  243  	struct pe_hdr *pe;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  244  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  245  	if (!kernel_buf)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  246  		return false;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  247  	mz = (struct mz_hdr *)kernel_buf;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  248  	if (mz->magic != MZ_MAGIC)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  249  		return false;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  250  	pe = (struct pe_hdr *)(kernel_buf + mz->peaddr);
2e57f9ba29ca48 Pingfan Liu 2025-04-29  251  	if (pe->magic != PE_MAGIC)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  252  		return false;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  253  	if (pe->opt_hdr_size == 0) {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  254  		pr_err("optional header is missing\n");
2e57f9ba29ca48 Pingfan Liu 2025-04-29  255  		return false;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  256  	}
2e57f9ba29ca48 Pingfan Liu 2025-04-29  257  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  258  	return true;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  259  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  260  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  261  static bool is_valid_format(const char *kernel_buf, unsigned long kernel_len)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  262  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  263  	return is_valid_pe(kernel_buf, kernel_len);
2e57f9ba29ca48 Pingfan Liu 2025-04-29  264  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  265  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  266  /*
2e57f9ba29ca48 Pingfan Liu 2025-04-29  267   * The UEFI Terse Executable (TE) image has MZ header.
2e57f9ba29ca48 Pingfan Liu 2025-04-29  268   */
2e57f9ba29ca48 Pingfan Liu 2025-04-29  269  static int pe_image_probe(const char *kernel_buf, unsigned long kernel_len)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  270  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  271  	return is_valid_pe(kernel_buf, kernel_len) ? 0 : -1;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  272  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  273  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  274  static int get_pe_section(char *file_buf, const char *sect_name,
2e57f9ba29ca48 Pingfan Liu 2025-04-29  275  		char **sect_start, unsigned long *sect_sz)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  276  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  277  	struct pe_hdr *pe_hdr;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  278  	struct pe32plus_opt_hdr *opt_hdr;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  279  	struct section_header *sect_hdr;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  280  	int section_nr, i;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  281  	struct mz_hdr *mz = (struct mz_hdr *)file_buf;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  282  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  283  	*sect_start = NULL;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  284  	*sect_sz = 0;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  285  	pe_hdr = (struct pe_hdr *)(file_buf + mz->peaddr);
2e57f9ba29ca48 Pingfan Liu 2025-04-29  286  	section_nr = pe_hdr->sections;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  287  	opt_hdr = (struct pe32plus_opt_hdr *)(file_buf + mz->peaddr + sizeof(struct pe_hdr));
2e57f9ba29ca48 Pingfan Liu 2025-04-29  288  	sect_hdr = (struct section_header *)((char *)opt_hdr + pe_hdr->opt_hdr_size);
2e57f9ba29ca48 Pingfan Liu 2025-04-29  289  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  290  	for (i = 0; i < section_nr; i++) {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  291  		if (strcmp(sect_hdr->name, sect_name) == 0) {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  292  			*sect_start = file_buf + sect_hdr->data_addr;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  293  			*sect_sz = sect_hdr->raw_data_size;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  294  			return 0;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  295  		}
2e57f9ba29ca48 Pingfan Liu 2025-04-29  296  		sect_hdr++;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  297  	}
2e57f9ba29ca48 Pingfan Liu 2025-04-29  298  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  299  	return -1;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  300  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  301  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  302  static bool pe_has_bpf_section(char *file_buf, unsigned long pe_sz)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  303  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  304  	char *sect_start = NULL;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  305  	unsigned long sect_sz = 0;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  306  	int ret;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  307  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  308  	ret = get_pe_section(file_buf, ".bpf", &sect_start, &sect_sz);
2e57f9ba29ca48 Pingfan Liu 2025-04-29  309  	if (ret < 0)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  310  		return false;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  311  	return true;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  312  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  313  
5e8d32eeac7956 Pingfan Liu 2025-04-29  314  static struct kexec_pe_parser_bpf *pe_parser;
5e8d32eeac7956 Pingfan Liu 2025-04-29  315  
5e8d32eeac7956 Pingfan Liu 2025-04-29  316  static void *get_symbol_from_elf(const char *elf_data, size_t elf_size,
5e8d32eeac7956 Pingfan Liu 2025-04-29  317  		const char *symbol_name, unsigned int *symbol_size)
5e8d32eeac7956 Pingfan Liu 2025-04-29  318  {
5e8d32eeac7956 Pingfan Liu 2025-04-29  319  	Elf_Ehdr *ehdr = (Elf_Ehdr *)elf_data;
5e8d32eeac7956 Pingfan Liu 2025-04-29  320  	Elf_Shdr *shdr, *symtab_shdr, *strtab_shdr, *dst_shdr;
5e8d32eeac7956 Pingfan Liu 2025-04-29  321  	Elf64_Sym *sym, *symtab = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  322  	char *strtab = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  323  	void *symbol_data = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  324  	int i;
5e8d32eeac7956 Pingfan Liu 2025-04-29  325  
5e8d32eeac7956 Pingfan Liu 2025-04-29  326  	symtab_shdr = strtab_shdr = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  327  	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  328  		pr_err("Not a valid ELF file\n");
5e8d32eeac7956 Pingfan Liu 2025-04-29  329  		goto out;
5e8d32eeac7956 Pingfan Liu 2025-04-29  330  	}
5e8d32eeac7956 Pingfan Liu 2025-04-29  331  
5e8d32eeac7956 Pingfan Liu 2025-04-29  332  	shdr = (struct elf_shdr *)(elf_data + ehdr->e_shoff);
5e8d32eeac7956 Pingfan Liu 2025-04-29  333  	for (i = 0; i < ehdr->e_shnum; i++) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  334  		if (shdr[i].sh_type == SHT_SYMTAB) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  335  			symtab_shdr = &shdr[i];
5e8d32eeac7956 Pingfan Liu 2025-04-29  336  		} else if (shdr[i].sh_type == SHT_STRTAB && i != ehdr->e_shstrndx) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  337  			strtab_shdr = &shdr[i];
5e8d32eeac7956 Pingfan Liu 2025-04-29  338  		}
5e8d32eeac7956 Pingfan Liu 2025-04-29  339  	}
5e8d32eeac7956 Pingfan Liu 2025-04-29  340  
5e8d32eeac7956 Pingfan Liu 2025-04-29  341  	if (!symtab_shdr || !strtab_shdr) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  342  		pr_err("Symbol table or string table not found\n");
5e8d32eeac7956 Pingfan Liu 2025-04-29  343  		goto out;
5e8d32eeac7956 Pingfan Liu 2025-04-29  344  	}
5e8d32eeac7956 Pingfan Liu 2025-04-29  345  	symtab = (Elf64_Sym *)(elf_data + symtab_shdr->sh_offset);
5e8d32eeac7956 Pingfan Liu 2025-04-29  346  	strtab = (char *)(elf_data + strtab_shdr->sh_offset);
5e8d32eeac7956 Pingfan Liu 2025-04-29  347  	for (i = 0; i < symtab_shdr->sh_size / sizeof(Elf64_Sym); i++) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  348  		sym = &symtab[i];
5e8d32eeac7956 Pingfan Liu 2025-04-29  349  		if (strcmp(&strtab[sym->st_name], symbol_name) == 0) {
5e8d32eeac7956 Pingfan Liu 2025-04-29  350  			if (sym->st_shndx >= SHN_LORESERVE)
5e8d32eeac7956 Pingfan Liu 2025-04-29  351  			    return NULL; // No section data for these
5e8d32eeac7956 Pingfan Liu 2025-04-29  352  			dst_shdr = &shdr[sym->st_shndx];
5e8d32eeac7956 Pingfan Liu 2025-04-29  353  			symbol_data = (void *)(elf_data + dst_shdr->sh_offset + sym->st_value);
5e8d32eeac7956 Pingfan Liu 2025-04-29  354  			*symbol_size = symtab[i].st_size;
5e8d32eeac7956 Pingfan Liu 2025-04-29  355  			break;
5e8d32eeac7956 Pingfan Liu 2025-04-29  356  		}
5e8d32eeac7956 Pingfan Liu 2025-04-29  357  	}
5e8d32eeac7956 Pingfan Liu 2025-04-29  358  
5e8d32eeac7956 Pingfan Liu 2025-04-29  359  out:
5e8d32eeac7956 Pingfan Liu 2025-04-29  360      return symbol_data;
5e8d32eeac7956 Pingfan Liu 2025-04-29  361  }
5e8d32eeac7956 Pingfan Liu 2025-04-29  362  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  363  /* Load a ELF */
2e57f9ba29ca48 Pingfan Liu 2025-04-29  364  static int arm_bpf_prog(char *bpf_elf, unsigned long sz)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  365  {
5e8d32eeac7956 Pingfan Liu 2025-04-29  366  	opts_data = get_symbol_from_elf(bpf_elf, sz, "opts_data", &opts_data_sz);
5e8d32eeac7956 Pingfan Liu 2025-04-29  367  	opts_insn = get_symbol_from_elf(bpf_elf, sz, "opts_insn", &opts_insn_sz);
5e8d32eeac7956 Pingfan Liu 2025-04-29  368  	if (!opts_data || !opts_insn)
5e8d32eeac7956 Pingfan Liu 2025-04-29  369  		return -1;
5e8d32eeac7956 Pingfan Liu 2025-04-29  370  	/*
5e8d32eeac7956 Pingfan Liu 2025-04-29  371  	 * When light skeleton generates opts_data[] and opts_insn[], it appends a
5e8d32eeac7956 Pingfan Liu 2025-04-29  372  	 * NULL terminator at the end of string
5e8d32eeac7956 Pingfan Liu 2025-04-29  373  	 */
5e8d32eeac7956 Pingfan Liu 2025-04-29  374  	opts_data_sz = opts_data_sz - 1;
5e8d32eeac7956 Pingfan Liu 2025-04-29  375  	opts_insn_sz = opts_insn_sz - 1;
5e8d32eeac7956 Pingfan Liu 2025-04-29  376  
5e8d32eeac7956 Pingfan Liu 2025-04-29  377  	pe_parser = kexec_pe_parser_bpf__open_and_load();
5e8d32eeac7956 Pingfan Liu 2025-04-29  378  	if (!pe_parser)
5e8d32eeac7956 Pingfan Liu 2025-04-29  379  		return -1;
5e8d32eeac7956 Pingfan Liu 2025-04-29  380  	kexec_pe_parser_bpf__attach(pe_parser);
5e8d32eeac7956 Pingfan Liu 2025-04-29  381  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  382  	return 0;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  383  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  384  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  385  static void disarm_bpf_prog(void)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  386  {
5e8d32eeac7956 Pingfan Liu 2025-04-29  387  	kexec_pe_parser_bpf__destroy(pe_parser);
5e8d32eeac7956 Pingfan Liu 2025-04-29  388  	pe_parser = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  389  	opts_data = NULL;
5e8d32eeac7956 Pingfan Liu 2025-04-29  390  	opts_insn = NULL;
2e57f9ba29ca48 Pingfan Liu 2025-04-29  391  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  392  
2e57f9ba29ca48 Pingfan Liu 2025-04-29  393  /*
2e57f9ba29ca48 Pingfan Liu 2025-04-29  394   * In eBPF, functions can only pass up to five arguments through R1 to R5.
2e57f9ba29ca48 Pingfan Liu 2025-04-29  395   * If five arguments are not enough, considering parse_zboot(struct pt_regs *regs)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  396   *
2e57f9ba29ca48 Pingfan Liu 2025-04-29  397   * optimize("O0") prevents inline, compiler constant propagation
2e57f9ba29ca48 Pingfan Liu 2025-04-29  398   */
2e57f9ba29ca48 Pingfan Liu 2025-04-29 @399  __attribute__((used, optimize("O0"))) void bpf_handle_pefile(char *image, int image_sz,
2e57f9ba29ca48 Pingfan Liu 2025-04-29  400  			char *initrd, int initrd_sz, char *cmdline)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  401  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  402  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  403  
2e57f9ba29ca48 Pingfan Liu 2025-04-29 @404  __attribute__((used, optimize("O0"))) void bpf_post_handle_pefile(void)
2e57f9ba29ca48 Pingfan Liu 2025-04-29  405  {
2e57f9ba29ca48 Pingfan Liu 2025-04-29  406  }
2e57f9ba29ca48 Pingfan Liu 2025-04-29  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
