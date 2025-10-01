Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074BD1F03C5;
	Wed,  1 Oct 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332860; cv=none; b=Y1NmOKv2AVtURYAOdVdP0zbFQ9cFVE83Z2sH4hR5nN+7cuMdm8A4w3gBFlrQKjQb4fVZqPaqKFGoaWwef+2ZI5MR9z8tgcBet7pBx9zChC56zygtZ2OMGfCtCj2TLl7V5tBHJldvJMVmeh2xPDe3jFWAYL+bDfO4C2V6MjW6dLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332860; c=relaxed/simple;
	bh=lnyR9CiCDVlhtaHIBa8Xp4CgZ59rL0AJ1nDMPQMG+V8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pm583sJpmKb9K4MwC1VaPcjKHV7qrE742ShiYEG83BWPZ59SVPS4FqgQGo5yA7nyUsLa7zIenDm64VqIfyXjTlvjXVR1uOtgtF3/F5fGe0o9TVT9ZVwMCVwkJp54Uvk5hUzRB/dnkoA+e2c2FR7oZezEFkJWwPnG9zZgTBhID7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrawMnb/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrawMnb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759332859; x=1790868859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnyR9CiCDVlhtaHIBa8Xp4CgZ59rL0AJ1nDMPQMG+V8=;
  b=nrawMnb/eVHcrIsSRdU4o1dJIT+/5XNImKyQvWvRqOqfx4ZXCrirkic4
   6HxJh80Nv7rQtX0BarIJZ5XmTLxAlW0t6X2JxIms3C7r6UvcbqM3CWaDH
   fvrFVzqNt8pIHwlZTAJ55DLfuEY2PXoLXqRHQtbt2cGJyKzhsWiiaJFmI
   11AhRj5jwU6xvbUQXmyTv/IJJMBlCAuaCo3rTmWOj6Dap2OsCZxexfgpM
   dhYaVO1x/CeCNEvYakSLoqL1AGDQmKGHw10Cwqmbt/WqvpgC1kKUfX195
   pxPK1jNBaUfLJtpscI1m6GwF/o6CGEZSdtiI+oy6A+hrlIzKjHH+ht77g
   A==;
X-CSE-ConnectionGUID: Ivj8v0VpQ4Ws95WD4GTeeA==
X-CSE-MsgGUID: HbQyMc8eR8S0pUk3woCFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60825268"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="60825268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 08:34:18 -0700
X-CSE-ConnectionGUID: AmYTzjd4Ru23VMBOcc1dHA==
X-CSE-MsgGUID: ysQRxSnEQBa0FriJoM0yag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="177938036"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2025 08:34:16 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3yqL-00038J-29;
	Wed, 01 Oct 2025 15:34:13 +0000
Date: Wed, 1 Oct 2025 23:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [sean-jc:x86/gmem_inplace 30/37]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1016:3: error: member reference
 base type 'void' is not a structure or union
Message-ID: <202510012352.KRNCbmOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   1b94e099a7fd1a1e2d61d908a51937b494816d7c
commit: 929f1ef0baca80f6b4f19add5f95823eab942e02 [30/37] KVM: guest_memfd: Introduce per-gmem attributes, use to guard user mappings
config: x86_64-buildonly-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251001/202510012352.KRNCbmOW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510012352.KRNCbmOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510012352.KRNCbmOW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1016:3: error: member reference base type 'void' is not a structure or union
    1016 |                 mt_set_external_lock(&gi->attributes, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:206:34: note: expanded from macro 'mt_set_external_lock'
     206 |         (mt)->ma_external_lock = &(lock)->dep_map
         |                                   ~~~~~~^ ~~~~~~~
   1 error generated.


vim +/void +1016 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   994	
   995	static void kvm_gmem_destroy_inode(struct inode *inode)
   996	{
   997		struct gmem_inode *gi = GMEM_I(inode);
   998	
   999		mpol_free_shared_policy(&gi->policy);
  1000	
  1001		/* Nothing to do if the maple tree hasn't been initialized. */
  1002		if (mt_external_lock(&gi->attributes)) {
  1003			/*
  1004			 * Acquire the invalidation lock purely to make lockdep happy,
  1005			 * the inode is unreachable at this point.
  1006			 */
  1007			filemap_invalidate_lock(inode->i_mapping);
  1008			__mt_destroy(&gi->attributes);
  1009			filemap_invalidate_unlock(inode->i_mapping);
  1010	
  1011			/*
  1012			 * Purge the maple tree locking state to prepare for the next
  1013			 * use of the inode and thus the tree.
  1014			 */
  1015			mt_init(&gi->attributes);
> 1016			mt_set_external_lock(&gi->attributes, NULL);
  1017		}
  1018	}
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
