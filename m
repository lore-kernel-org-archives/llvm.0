Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F219B3CB;
	Mon, 19 May 2025 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661433; cv=none; b=bF5o1s/NMD6JKTLirtZdKqgnlIYLMKWY6ZyL1gPFyQUcDFQuCALnUfGQzR6u3i9g/q3YOnGkh+yiPU65lM5hF0JxJBofIS2t9LJ2Y7+zIpqoWrcoC4s/xuM9F0JCjBPb/7sGQm/JMw5BrbF2NAP28V1xRt0rCTnw7y2lQwAY8t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661433; c=relaxed/simple;
	bh=MJ7vOa+oj1RhPSK2buLK5hM+TQSLSfm2cwTN10gM6U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ma4uHuhxukNf1HjzNLFNWHQa7K/DyPLiNAjsGHMcmWgH4TMt+xzuwQ/ZHm20cMhkcZ5m+ET39QnCaW0YECAZht4rHY4GPqCNQhvowd0b5PRRgrZDZDU1CsJ3RssG9XIeoCSdXnRSHwYu//oqRMyJzEC8hV6afYt0MDDmvyvaN7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb6iWkwS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb6iWkwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747661431; x=1779197431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJ7vOa+oj1RhPSK2buLK5hM+TQSLSfm2cwTN10gM6U8=;
  b=Gb6iWkwS/YVOJXUUo7GG/zTs3n5AI80cj1TJnsoZrDNQvenECgVMOfnc
   RKTVm7N6Ic6n7IDElt2NzJIXqM1r0e8EpoKn/JLeDpz2BIj84PcjXKSsS
   ucvWFNEoF0bw8tSGIwVD2nJAwgX8ZtBNdUKEIoMCBKaI/YEi9O1kvfeZ8
   2z5GkpLD7R2qy/r3hYx1p1ggNHaqsXdHTRPc4efDK+PVzqjGPYHrpPwH+
   emobAjGagGBccUVIAy4dukki4/qqLIrSMLjbnWHbwO8rnuZs8RNpzCDgl
   eARTGZs0elfMV/dA5QpV/LglwLuHLrPsWvF+DcmZj92KKDjS562tocIbj
   g==;
X-CSE-ConnectionGUID: OyfOJZO4Q3emzYUA9lHLAQ==
X-CSE-MsgGUID: rzulUkyrTMuuH952mK0+Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52193427"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="52193427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:30:30 -0700
X-CSE-ConnectionGUID: jPtl0WZhRLCudMkyPJ0M8g==
X-CSE-MsgGUID: VOZZ5P4vQGaBIhUgk/II7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139210657"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2025 06:30:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH0ZW-000LWm-0z;
	Mon, 19 May 2025 13:30:26 +0000
Date: Mon, 19 May 2025 21:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 27/75]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:805:15: warning: variable
 'argp' set but not used
Message-ID: <202505192134.fNISBqMT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 02bb15aeea3c78413143e7b2944e2b801c7024e7 [27/75] KVM: guest_memfd: Introduce KVM_GMEM_CONVERT_SHARED/PRIVATE ioctls
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250519/202505192134.fNISBqMT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192134.fNISBqMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192134.fNISBqMT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:401:2: error: too few arguments to function call, at least argument 'fmt' must be specified
     401 |         WARN_ONCE("Unexpected call to get shared folio.")
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:152:29: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/once_lite.h:31:4: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:3: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:106:20: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                 ~~~~~~~~~~~~~    ^
   include/asm-generic/bug.h:93:28: note: '__warn_printk' declared here
      93 | extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
         |                            ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:401:51: error: expected ';' after expression
     401 |         WARN_ONCE("Unexpected call to get shared folio.")
         |                                                          ^
         |                                                          ;
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:805:15: warning: variable 'argp' set but not used [-Wunused-but-set-variable]
     805 |         void __user *argp;
         |                      ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:835:1: warning: unused label 'out' [-Wunused-label]
     835 | out:
         | ^~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:858:33: warning: unused variable 'private' [-Wunused-variable]
     858 |         struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
         |                                        ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1014:20: error: no member named 'shareability' in 'struct kvm_gmem_inode_private'
    1014 |         mt_init(&private->shareability);
         |                  ~~~~~~~  ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1017:36: error: incompatible pointer types passing 'struct kvm_gmem_inode_private *' to parameter of type 'struct maple_tree *' [-Werror,-Wincompatible-pointer-types]
    1017 |         err = kvm_gmem_shareability_setup(private, size, flags);
         |                                           ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:394:59: note: passing argument to parameter 'mt' here
     394 | static int kvm_gmem_shareability_setup(struct maple_tree *mt, loff_t size, u64 flags)
         |                                                           ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1192:6: error: call to undeclared function 'kvm_gmem_supports_shared'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1192 |         if (kvm_gmem_supports_shared(inode)) {
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1192:6: note: did you mean 'kvm_gmem_memslot_supports_shared'?
   include/linux/kvm_host.h:2513:20: note: 'kvm_gmem_memslot_supports_shared' declared here
    2513 | static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
         |                    ^
   3 warnings and 5 errors generated.


vim +/argp +805 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   801	
   802	static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
   803				   unsigned long arg)
   804	{
 > 805		void __user *argp;
   806		int r;
   807	
   808		argp = (void __user *)arg;
   809	
   810		switch (ioctl) {
   811	#ifdef CONFIG_KVM_GMEM_SHARED_MEM
   812		case KVM_GMEM_CONVERT_SHARED:
   813		case KVM_GMEM_CONVERT_PRIVATE: {
   814			struct kvm_gmem_convert param;
   815			bool to_shared;
   816	
   817			r = -EFAULT;
   818			if (copy_from_user(&param, argp, sizeof(param)))
   819				goto out;
   820	
   821			to_shared = ioctl == KVM_GMEM_CONVERT_SHARED;
   822			r = kvm_gmem_ioctl_convert_range(file, &param, to_shared);
   823			if (r) {
   824				if (copy_to_user(argp, &param, sizeof(param))) {
   825					r = -EFAULT;
   826					goto out;
   827				}
   828			}
   829			break;
   830		}
   831	#endif
   832		default:
   833			r = -ENOTTY;
   834		}
 > 835	out:
   836		return r;
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
