Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4A3A4F20;
	Fri, 17 Apr 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776420818; cv=none; b=O7mzN6GTPf78/iJO8Nw9tU3+cz8tOkOh5FBQZx0x6ThZxtyXj/6FKLmRaqZQGyGiBk6WxUmP8slOSYqmteOf/43ladrhqBfxPiHf6BmyhhacSX+gL5KsolHzHM4SThR8Ok/y6C3ynX+fsVn1G/xKT1hetsuoZvJeAsly6/82AeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776420818; c=relaxed/simple;
	bh=VAJ2uGIyyrwmwqczusVqnrbguGnUeUQxNaqRqcRW/tA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kHCl7wRLQsewhxuXJYtpmfAqFVkI/EK6XuLPOWXaJD3ZuCf9Kf6+ShNlGmZE32JxXDCRy+UbXaDXccK569uXmswcq4p7N7FQB1CX+TNZga6Rke9cGA4LY0v/R6Mole5v4O18fdgouXiXF9UShvJtqZRWQ0cNDUA5MKTW9qgJxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AG0QSqhW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AG0QSqhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776420811; x=1807956811;
  h=date:from:to:cc:subject:message-id;
  bh=VAJ2uGIyyrwmwqczusVqnrbguGnUeUQxNaqRqcRW/tA=;
  b=AG0QSqhWZ2MGNN7IP41yePcQyOL/n5xylvdRq0OOhfxpo/yzd66T7SCj
   dKXdDwxBcrRbZ6hv2WbYO0r2yrgS/JV0CHuWS99bo6STXjVMpy9pcyKDV
   nKka85p5fxk5g8ovaWjxJFiPyOHnvpa9yEbajUX3xZY9FXzhTTZETv2cY
   v80BNX5lOjyaP4Z4qOyM9xRWEGiFCeR7iQ7jqaO7uBerlkPiy3at+eDGa
   rdckh63t/8kWzbqP+k7iVrKSEJuYpcBPofpNy7VF5vY2MPOwT/ASJCMzt
   w9tbr9iTLD9XHa+D9wItUG/bcIhGvFFEz+7VThMPxaS8ZNuHEnirzhZCG
   w==;
X-CSE-ConnectionGUID: ECAcBqeXTeCmo9EW7qC3bA==
X-CSE-MsgGUID: Lb0/vwH6RouPhJAeDo9wkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88507964"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88507964"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:13:30 -0700
X-CSE-ConnectionGUID: X5ffpt5kSQi/bTCnth1X3A==
X-CSE-MsgGUID: EE78naG4TFKbtWtIB5l/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="269021647"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 03:13:28 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDgCT-000000000Dt-14iX;
	Fri, 17 Apr 2026 10:13:25 +0000
Date: Fri, 17 Apr 2026 18:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/rewrite_dbg_cmds 3/5]
 arch/x86/kvm/svm/sev.c:1968:20: error: incompatible pointer types passing
 'struct page *' to parameter of type 'struct page **'; take the address with
 &
Message-ID: <202604171836.TgNX7ADT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux svm/rewrite_dbg_cmds
head:   1355c91eb47e8bea0a1addb82d3a7aed3288a5a3
commit: d730a1d766569b0ab715eb4cfb175ccd64b2e570 [3/5] KVM: SEV: Add helper function to pin/unpin a single page
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604171836.TgNX7ADT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171836.TgNX7ADT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171836.TgNX7ADT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:1742:16: warning: unused variable 'n' [-Wunused-variable]
    1742 |         unsigned long n;
         |                       ^
>> arch/x86/kvm/svm/sev.c:1968:20: error: incompatible pointer types passing 'struct page *' to parameter of type 'struct page **'; take the address with & [-Werror,-Wincompatible-pointer-types]
    1968 |         sev_clflush_pages(guest_page, n);
         |                           ^~~~~~~~~~
         |                           &
   arch/x86/kvm/svm/sev.c:837:44: note: passing argument to parameter 'pages' here
     837 | static void sev_clflush_pages(struct page *pages[], unsigned long npages)
         |                                            ^
   arch/x86/kvm/svm/sev.c:1968:32: warning: variable 'n' is uninitialized when used here [-Wuninitialized]
    1968 |         sev_clflush_pages(guest_page, n);
         |                                       ^
   arch/x86/kvm/svm/sev.c:1920:17: note: initialize the variable 'n' to silence this warning
    1920 |         unsigned long n;
         |                        ^
         |                         = 0
   2 warnings and 1 error generated.


vim +1968 arch/x86/kvm/svm/sev.c

af43cbbf954b50 Brijesh Singh       2021-04-15  1913  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1914  static int sev_receive_update_data(struct kvm *kvm, struct kvm_sev_cmd *argp)
15fb7de1a7f5af Brijesh Singh       2021-04-15  1915  {
15fb7de1a7f5af Brijesh Singh       2021-04-15  1916  	struct kvm_sev_receive_update_data params;
238eca821cee90 Sean Christopherson 2021-04-06  1917  	struct sev_data_receive_update_data data;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1918  	void *hdr = NULL, *trans = NULL;
d730a1d766569b Sean Christopherson 2026-04-16  1919  	struct page *guest_page;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1920  	unsigned long n;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1921  	int ret, offset;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1922  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1923  	if (!sev_guest(kvm))
15fb7de1a7f5af Brijesh Singh       2021-04-15  1924  		return -EINVAL;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1925  
1ab157ce573f5a Paolo Bonzini       2024-02-26  1926  	if (copy_from_user(&params, u64_to_user_ptr(argp->data),
15fb7de1a7f5af Brijesh Singh       2021-04-15  1927  			sizeof(struct kvm_sev_receive_update_data)))
15fb7de1a7f5af Brijesh Singh       2021-04-15  1928  		return -EFAULT;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1929  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1930  	if (!params.hdr_uaddr || !params.hdr_len ||
15fb7de1a7f5af Brijesh Singh       2021-04-15  1931  	    !params.guest_uaddr || !params.guest_len ||
15fb7de1a7f5af Brijesh Singh       2021-04-15  1932  	    !params.trans_uaddr || !params.trans_len)
15fb7de1a7f5af Brijesh Singh       2021-04-15  1933  		return -EINVAL;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1934  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1935  	/* Check if we are crossing the page boundary */
15fb7de1a7f5af Brijesh Singh       2021-04-15  1936  	offset = params.guest_uaddr & (PAGE_SIZE - 1);
f94f053aa3a5d6 Peter Gonda         2023-02-07  1937  	if (params.guest_len > PAGE_SIZE || (params.guest_len + offset) > PAGE_SIZE)
15fb7de1a7f5af Brijesh Singh       2021-04-15  1938  		return -EINVAL;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1939  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1940  	hdr = psp_copy_user_blob(params.hdr_uaddr, params.hdr_len);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1941  	if (IS_ERR(hdr))
15fb7de1a7f5af Brijesh Singh       2021-04-15  1942  		return PTR_ERR(hdr);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1943  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1944  	trans = psp_copy_user_blob(params.trans_uaddr, params.trans_len);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1945  	if (IS_ERR(trans)) {
15fb7de1a7f5af Brijesh Singh       2021-04-15  1946  		ret = PTR_ERR(trans);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1947  		goto e_free_hdr;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1948  	}
15fb7de1a7f5af Brijesh Singh       2021-04-15  1949  
238eca821cee90 Sean Christopherson 2021-04-06  1950  	memset(&data, 0, sizeof(data));
238eca821cee90 Sean Christopherson 2021-04-06  1951  	data.hdr_address = __psp_pa(hdr);
238eca821cee90 Sean Christopherson 2021-04-06  1952  	data.hdr_len = params.hdr_len;
238eca821cee90 Sean Christopherson 2021-04-06  1953  	data.trans_address = __psp_pa(trans);
238eca821cee90 Sean Christopherson 2021-04-06  1954  	data.trans_len = params.trans_len;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1955  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1956  	/* Pin guest memory */
d730a1d766569b Sean Christopherson 2026-04-16  1957  	guest_page = sev_pin_page(kvm, params.guest_uaddr & PAGE_MASK, FOLL_WRITE);
c7a1b2b678c54a Sean Christopherson 2021-05-06  1958  	if (IS_ERR(guest_page)) {
c7a1b2b678c54a Sean Christopherson 2021-05-06  1959  		ret = PTR_ERR(guest_page);
238eca821cee90 Sean Christopherson 2021-04-06  1960  		goto e_free_trans;
c7a1b2b678c54a Sean Christopherson 2021-05-06  1961  	}
15fb7de1a7f5af Brijesh Singh       2021-04-15  1962  
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1963  	/*
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1964  	 * Flush (on non-coherent CPUs) before RECEIVE_UPDATE_DATA, the PSP
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1965  	 * encrypts the written data with the guest's key, and the cache may
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1966  	 * contain dirty, unencrypted data.
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1967  	 */
c8c340a9b4149f Masahiro Kozuka     2021-09-14 @1968  	sev_clflush_pages(guest_page, n);
c8c340a9b4149f Masahiro Kozuka     2021-09-14  1969  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1970  	/* The RECEIVE_UPDATE_DATA command requires C-bit to be always set. */
d730a1d766569b Sean Christopherson 2026-04-16  1971  	data.guest_address = page_to_phys(guest_page) + offset;
238eca821cee90 Sean Christopherson 2021-04-06  1972  	data.guest_address |= sev_me_mask;
238eca821cee90 Sean Christopherson 2021-04-06  1973  	data.guest_len = params.guest_len;
8a01902a016824 Nikunj A Dadhania   2025-01-23  1974  	data.handle = to_kvm_sev_info(kvm)->handle;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1975  
238eca821cee90 Sean Christopherson 2021-04-06  1976  	ret = sev_issue_cmd(kvm, SEV_CMD_RECEIVE_UPDATE_DATA, &data,
15fb7de1a7f5af Brijesh Singh       2021-04-15  1977  				&argp->error);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1978  
d730a1d766569b Sean Christopherson 2026-04-16  1979  	sev_unpin_page(kvm, guest_page);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1980  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1981  e_free_trans:
15fb7de1a7f5af Brijesh Singh       2021-04-15  1982  	kfree(trans);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1983  e_free_hdr:
15fb7de1a7f5af Brijesh Singh       2021-04-15  1984  	kfree(hdr);
15fb7de1a7f5af Brijesh Singh       2021-04-15  1985  
15fb7de1a7f5af Brijesh Singh       2021-04-15  1986  	return ret;
15fb7de1a7f5af Brijesh Singh       2021-04-15  1987  }
15fb7de1a7f5af Brijesh Singh       2021-04-15  1988  

:::::: The code at line 1968 was first introduced by commit
:::::: c8c340a9b4149fe5caa433f3b62463a1c8e07a46 KVM: SEV: Flush cache on non-coherent systems before RECEIVE_UPDATE_DATA

:::::: TO: Masahiro Kozuka <masa.koz@kozuka.jp>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
