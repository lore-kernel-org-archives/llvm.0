Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499DE37F8A1;
	Fri, 10 Apr 2026 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775852059; cv=none; b=IZf1IBqmZSD2z83Zg7RKL64W8N+yWdSptaHHFSlzRgUCT9NflW9XupufMgZERnUFQewKXNhfWMXYhKeKvXszW9cwtryOlQU0//B9v2Q5wzzEbPMM4kcZ/0HRMSsMeLaPEfOqIGTXmc11oqpcMUGd+NXUrvYO3j3lTTEwNm9SJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775852059; c=relaxed/simple;
	bh=6WPBJ2ZW5lY+MJiNPXiEXBG8LBRTyG39mImzhm9LsGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=atRo9bEve7o71OdSD6viIhF26uVIgBdHnL5/s6ft5kuZUdO53WiuyIRnn7DftFJ3Pcxs44nlNjFU4kMj89IYVJ0rbkJz2hexPiAvC/dgVgyuXldYVtNFBMFfX73745fFrZbSta0zhWb66u9ONbFkDgpKAKDcqYVVRdJSvy9yuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVlbQq3g; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVlbQq3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775852055; x=1807388055;
  h=date:from:to:cc:subject:message-id;
  bh=6WPBJ2ZW5lY+MJiNPXiEXBG8LBRTyG39mImzhm9LsGs=;
  b=IVlbQq3gOuB59Bm/G8rKgR2n0Wv3/NXXSAceJ4xJjReyrmKWkrLNK/69
   Vn6Phb5bvab7bBeZcvLGjbVbBOmlNJpw5V7zTr5Mffw1k+b+hoZCkc+9Q
   OIZ9h4ulDlDiDXvL2v233vm6kc34BG45Wb9NtwCkCpOStO4zbj+K9VXvn
   4X5pZWmUVTVs46vH68uYbWgy0kxU71iCfQmwQ3vVa70g7LHd60oK9BQ3h
   oN6vSE0lk3DOa/WSMewBZlwCPDolkWfu/ZPaEhUNaoD9jG7fna1a2H7zP
   DdsnuWhzqx+wI2ua6lEC3Scx2kdifqTw1Q7uUlELcWSjuy/25OWD6eS55
   Q==;
X-CSE-ConnectionGUID: mGxymgVMQIeQGzhjFf1qQw==
X-CSE-MsgGUID: 4voGnQsgQhWaMUr29+9/+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76757073"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76757073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 13:14:14 -0700
X-CSE-ConnectionGUID: FbENRmlmT+6dwVqyBXu14g==
X-CSE-MsgGUID: KLFYw5gmQv+dfDLocyhAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222695947"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 13:14:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBIF0-00000000AwX-0O57;
	Fri, 10 Apr 2026 20:14:10 +0000
Date: Fri, 10 Apr 2026 22:13:49 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vfio_kvm_file_refcount 1/1]
 arch/x86/kvm/../../../virt/kvm/vfio.c:178:35: error: incompatible pointer
 types passing 'struct kvm *' to parameter of type 'struct file *'
Message-ID: <202604102216.tSE06wuI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vfio_kvm_file_refcount
head:   3088b9660354afa55c95eeec0bba6d939123ce06
commit: 3088b9660354afa55c95eeec0bba6d939123ce06 [1/1] tmp
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260410/202604102216.tSE06wuI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102216.tSE06wuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102216.tSE06wuI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/vfio.c:178:35: error: incompatible pointer types passing 'struct kvm *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
     178 |         kvm_vfio_file_set_kvm(kvf->file, dev->kvm);
         |                                          ^~~~~~~~
   arch/x86/kvm/../../../virt/kvm/vfio.c:38:67: note: passing argument to parameter 'kvm' here
      38 | static void kvm_vfio_file_set_kvm(struct file *file, struct file *kvm)
         |                                                                   ^
   1 error generated.


vim +178 arch/x86/kvm/../../../virt/kvm/vfio.c

e0f0bbc527f6e9 Alex Williamson 2013-10-30  142  
2f99073a722bee Yi Liu          2023-07-18  143  static int kvm_vfio_file_add(struct kvm_device *dev, unsigned int fd)
ec53500fae421e Alex Williamson 2013-10-30  144  {
ec53500fae421e Alex Williamson 2013-10-30  145  	struct kvm_vfio *kv = dev->private;
2f99073a722bee Yi Liu          2023-07-18  146  	struct kvm_vfio_file *kvf;
d55d9e7a457218 Jason Gunthorpe 2022-05-04  147  	struct file *filp;
73e2f19da50857 Dmitry Torokhov 2023-07-14  148  	int ret = 0;
ec53500fae421e Alex Williamson 2013-10-30  149  
d55d9e7a457218 Jason Gunthorpe 2022-05-04  150  	filp = fget(fd);
d55d9e7a457218 Jason Gunthorpe 2022-05-04  151  	if (!filp)
ec53500fae421e Alex Williamson 2013-10-30  152  		return -EBADF;
ec53500fae421e Alex Williamson 2013-10-30  153  
b1a59be8a2b64d Yi Liu          2023-07-18  154  	/* Ensure the FD is a vfio FD. */
b1a59be8a2b64d Yi Liu          2023-07-18  155  	if (!kvm_vfio_file_is_valid(filp)) {
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  156  		ret = -EINVAL;
73e2f19da50857 Dmitry Torokhov 2023-07-14  157  		goto out_fput;
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  158  	}
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  159  
ec53500fae421e Alex Williamson 2013-10-30  160  	mutex_lock(&kv->lock);
ec53500fae421e Alex Williamson 2013-10-30  161  
2f99073a722bee Yi Liu          2023-07-18  162  	list_for_each_entry(kvf, &kv->file_list, node) {
2f99073a722bee Yi Liu          2023-07-18  163  		if (kvf->file == filp) {
73b0565f19a8fb Jason Gunthorpe 2022-05-04  164  			ret = -EEXIST;
73e2f19da50857 Dmitry Torokhov 2023-07-14  165  			goto out_unlock;
ec53500fae421e Alex Williamson 2013-10-30  166  		}
ec53500fae421e Alex Williamson 2013-10-30  167  	}
ec53500fae421e Alex Williamson 2013-10-30  168  
69050f8d6d075d Kees Cook       2026-02-20  169  	kvf = kzalloc_obj(*kvf, GFP_KERNEL_ACCOUNT);
2f99073a722bee Yi Liu          2023-07-18  170  	if (!kvf) {
73b0565f19a8fb Jason Gunthorpe 2022-05-04  171  		ret = -ENOMEM;
73e2f19da50857 Dmitry Torokhov 2023-07-14  172  		goto out_unlock;
ec53500fae421e Alex Williamson 2013-10-30  173  	}
ec53500fae421e Alex Williamson 2013-10-30  174  
73e2f19da50857 Dmitry Torokhov 2023-07-14  175  	kvf->file = get_file(filp);
2f99073a722bee Yi Liu          2023-07-18  176  	list_add_tail(&kvf->node, &kv->file_list);
ec53500fae421e Alex Williamson 2013-10-30  177  
9e0f4f2918c2ff Dmitry Torokhov 2023-07-14 @178  	kvm_vfio_file_set_kvm(kvf->file, dev->kvm);
e0f0bbc527f6e9 Alex Williamson 2013-10-30  179  	kvm_vfio_update_coherency(dev);
e0f0bbc527f6e9 Alex Williamson 2013-10-30  180  
73e2f19da50857 Dmitry Torokhov 2023-07-14  181  out_unlock:
73b0565f19a8fb Jason Gunthorpe 2022-05-04  182  	mutex_unlock(&kv->lock);
73e2f19da50857 Dmitry Torokhov 2023-07-14  183  out_fput:
d55d9e7a457218 Jason Gunthorpe 2022-05-04  184  	fput(filp);
73b0565f19a8fb Jason Gunthorpe 2022-05-04  185  	return ret;
73b0565f19a8fb Jason Gunthorpe 2022-05-04  186  }
ec53500fae421e Alex Williamson 2013-10-30  187  

:::::: The code at line 178 was first introduced by commit
:::::: 9e0f4f2918c2ff145d3dedee862d9919a6ed5812 kvm/vfio: ensure kvg instance stays around in kvm_vfio_group_add()

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
