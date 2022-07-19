Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A34C77
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658257049; x=1689793049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BqgXG/4LbCtAN57U01YaIg9Myl3LD4Ewp7qmwOT00PM=;
  b=iwYNgsHOnzgmqP5cMS1baLCjEpNKB0Ap7+itnNuoYTREbQ82OhIf5xCY
   7iww6YPWcU4oDdKZvcX6HC4KcceFmB95CUXlKXqlM/+Xq2F6YonLPsopu
   +AaSwMqYT4DBlU4lnu2KI2Ud+hX9ag86UwYZvmbg7Ozl6hyGCRMYYIkeU
   BwHwId8BepkeZOtma2IXxlff60293n2kGN92LOgHpEz525SqI8iUsQJG2
   v4ecmmgMSRhWpUknQ7fj4E5uEUHqq+zeb9owlmMACG9DO9r7AUbmgFjsm
   5bpwvmvpnM91oUc9zemWCXxUxhIFMivSzBk2Dr7Ctd85pcOLNBAuaNWsg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="372874292"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="372874292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 11:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="597776942"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2022 11:57:25 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDsPM-0005v3-Vy;
	Tue, 19 Jul 2022 18:57:24 +0000
Date: Wed, 20 Jul 2022 02:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andres Lagar-Cavilla <andreslc@gridcentric.ca>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	David Vrabel <david.vrabel@citrix.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xen/privcmd:  prevent integer overflow on 32 bit systems
Message-ID: <202207200236.GeswjpCk-lkp@intel.com>
References: <YtEjVdG+pp9DGz++@kili>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtEjVdG+pp9DGz++@kili>

Hi Dan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on linus/master v5.19-rc7 next-20220719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/xen-privcmd-prevent-integer-overflow-on-32-bit-systems/20220715-162307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220720/202207200236.GeswjpCk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ea22ebd83753c7181043e69251b78f0be73675ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dan-Carpenter/xen-privcmd-prevent-integer-overflow-on-32-bit-systems/20220715-162307
        git checkout ea22ebd83753c7181043e69251b78f0be73675ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/ drivers/ata/ drivers/rtc/ drivers/thermal/intel/ drivers/xen/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/xen/privcmd.c:459:13: warning: result of comparison of constant 2305843009213693951 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
                   if (m.num > SIZE_MAX / sizeof(*m.arr))
                       ~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:469:13: warning: result of comparison of constant 2305843009213693951 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
                   if (m.num > SIZE_MAX / sizeof(*m.arr))
                       ~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +459 drivers/xen/privcmd.c

   441	
   442	static long privcmd_ioctl_mmap_batch(
   443		struct file *file, void __user *udata, int version)
   444	{
   445		struct privcmd_data *data = file->private_data;
   446		int ret;
   447		struct privcmd_mmapbatch_v2 m;
   448		struct mm_struct *mm = current->mm;
   449		struct vm_area_struct *vma;
   450		unsigned long nr_pages;
   451		LIST_HEAD(pagelist);
   452		struct mmap_batch_state state;
   453	
   454		switch (version) {
   455		case 1:
   456			if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
   457				return -EFAULT;
   458			/* Returns per-frame error in m.arr. */
 > 459			if (m.num > SIZE_MAX / sizeof(*m.arr))
   460				return -EINVAL;
   461			m.err = NULL;
   462			if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
   463				return -EFAULT;
   464			break;
   465		case 2:
   466			if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
   467				return -EFAULT;
   468			/* Returns per-frame error code in m.err. */
   469			if (m.num > SIZE_MAX / sizeof(*m.arr))
   470				return -EINVAL;
   471			if (!access_ok(m.err, m.num * (sizeof(*m.err))))
   472				return -EFAULT;
   473			break;
   474		default:
   475			return -EINVAL;
   476		}
   477	
   478		/* If restriction is in place, check the domid matches */
   479		if (data->domid != DOMID_INVALID && data->domid != m.dom)
   480			return -EPERM;
   481	
   482		nr_pages = DIV_ROUND_UP(m.num, XEN_PFN_PER_PAGE);
   483		if ((m.num <= 0) || (nr_pages > (LONG_MAX >> PAGE_SHIFT)))
   484			return -EINVAL;
   485	
   486		ret = gather_array(&pagelist, m.num, sizeof(xen_pfn_t), m.arr);
   487	
   488		if (ret)
   489			goto out;
   490		if (list_empty(&pagelist)) {
   491			ret = -EINVAL;
   492			goto out;
   493		}
   494	
   495		if (version == 2) {
   496			/* Zero error array now to only copy back actual errors. */
   497			if (clear_user(m.err, sizeof(int) * m.num)) {
   498				ret = -EFAULT;
   499				goto out;
   500			}
   501		}
   502	
   503		mmap_write_lock(mm);
   504	
   505		vma = find_vma(mm, m.addr);
   506		if (!vma ||
   507		    vma->vm_ops != &privcmd_vm_ops) {
   508			ret = -EINVAL;
   509			goto out_unlock;
   510		}
   511	
   512		/*
   513		 * Caller must either:
   514		 *
   515		 * Map the whole VMA range, which will also allocate all the
   516		 * pages required for the auto_translated_physmap case.
   517		 *
   518		 * Or
   519		 *
   520		 * Map unmapped holes left from a previous map attempt (e.g.,
   521		 * because those foreign frames were previously paged out).
   522		 */
   523		if (vma->vm_private_data == NULL) {
   524			if (m.addr != vma->vm_start ||
   525			    m.addr + (nr_pages << PAGE_SHIFT) != vma->vm_end) {
   526				ret = -EINVAL;
   527				goto out_unlock;
   528			}
   529			if (xen_feature(XENFEAT_auto_translated_physmap)) {
   530				ret = alloc_empty_pages(vma, nr_pages);
   531				if (ret < 0)
   532					goto out_unlock;
   533			} else
   534				vma->vm_private_data = PRIV_VMA_LOCKED;
   535		} else {
   536			if (m.addr < vma->vm_start ||
   537			    m.addr + (nr_pages << PAGE_SHIFT) > vma->vm_end) {
   538				ret = -EINVAL;
   539				goto out_unlock;
   540			}
   541			if (privcmd_vma_range_is_mapped(vma, m.addr, nr_pages)) {
   542				ret = -EINVAL;
   543				goto out_unlock;
   544			}
   545		}
   546	
   547		state.domain        = m.dom;
   548		state.vma           = vma;
   549		state.va            = m.addr;
   550		state.index         = 0;
   551		state.global_error  = 0;
   552		state.version       = version;
   553	
   554		BUILD_BUG_ON(((PAGE_SIZE / sizeof(xen_pfn_t)) % XEN_PFN_PER_PAGE) != 0);
   555		/* mmap_batch_fn guarantees ret == 0 */
   556		BUG_ON(traverse_pages_block(m.num, sizeof(xen_pfn_t),
   557					    &pagelist, mmap_batch_fn, &state));
   558	
   559		mmap_write_unlock(mm);
   560	
   561		if (state.global_error) {
   562			/* Write back errors in second pass. */
   563			state.user_gfn = (xen_pfn_t *)m.arr;
   564			state.user_err = m.err;
   565			ret = traverse_pages_block(m.num, sizeof(xen_pfn_t),
   566						   &pagelist, mmap_return_errors, &state);
   567		} else
   568			ret = 0;
   569	
   570		/* If we have not had any EFAULT-like global errors then set the global
   571		 * error to -ENOENT if necessary. */
   572		if ((ret == 0) && (state.global_error == -ENOENT))
   573			ret = -ENOENT;
   574	
   575	out:
   576		free_page_list(&pagelist);
   577		return ret;
   578	
   579	out_unlock:
   580		mmap_write_unlock(mm);
   581		goto out;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
