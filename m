Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D5302769;
	Thu, 13 Nov 2025 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009487; cv=none; b=NA+zWbT+YFukpGa2sqfIyuxewmhxXLqG1s85VK+BuJ/tOmZv9K8jQUaBJeFZBpN/YNPedCqpCITKdUTXKg9l5AA0yIulX6ytrV5A+sfYwTzHuQFzkThsy0rlElMUJVZazJf+Z+s8DQUVn30OVoB/ifFuguW1q33YYLReYyANbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009487; c=relaxed/simple;
	bh=28RzlPlyfRbhqui+diGRtnW+9x8VfdYTNgDbMt+fbLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xf6rG3niKLz7SBFic3v9xPFrPhOBMvd/1e5wMwwupbheTFT5kE1wQEYMwodiB04ekVAQCDrRxHQuDQ9x1p8hvc9GO/3F70+B1dIH1Zbdn8FGBEeLIdoYJEHXU8CEgKeEPQ0loFVsl7B5xsZb/ps9W8OzrovaxoMePJPsfcWktgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuKVuNhN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuKVuNhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009486; x=1794545486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28RzlPlyfRbhqui+diGRtnW+9x8VfdYTNgDbMt+fbLo=;
  b=JuKVuNhNHGFnKUv06sRZ0MYhdbwo7RzOXqcUcLfQIWPOUuD3qzzw2tJX
   2eUtf/rqMN3p7c93QPRhn9dY6v42mpq1RH+OOqWV0EFQgm1M6rkT9VWI8
   CScyZxGOY2F8IIs8fBucXIKFvepVbOYkG+nsFH/Y7iDFSeDT0BGu1l96Z
   oe8qGDJeoGc+CtnpTREK1yTag7U3BiwoCCan3juClA+6XaTNIcBgqFfLT
   zzt9YnNgTrSgBsXr6ZzKcvK5p2+i0rkLY/nLvPSo9d8iSPakzR78fg4FD
   y1NE6fjzjQDM7f7aZ7ZLZcWPNXiMxD/Zzuef0q815tfmUqJmTDUYsuvQ/
   Q==;
X-CSE-ConnectionGUID: G4L3URDMQ52KMATEO4P9/Q==
X-CSE-MsgGUID: EVEtmQSFTnyLjYwfiDJUhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008595"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:22 -0800
X-CSE-ConnectionGUID: +uuZD4eIR8io5aR6Iufewg==
X-CSE-MsgGUID: KVddaVvhT22WUEamsoHNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161051"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIl-0004tX-0P;
	Thu, 13 Nov 2025 04:51:19 +0000
Date: Thu, 13 Nov 2025 12:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_memfd_decrypted 1/1] mm/shmem.c:5253:8: error:
 call to undeclared function 'set_memory_decrypted'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511130322.x6B3sisb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_memfd_decrypted
head:   dcdd295fca26e98165b1ddd584bf29a2fdc22f03
commit: dcdd295fca26e98165b1ddd584bf29a2fdc22f03 [1/1] mm/memfd: add a flag allowing user to specify need for decrypted memory
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511130322.x6B3sisb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130322.x6B3sisb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130322.x6B3sisb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:5253:8: error: call to undeclared function 'set_memory_decrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5253 |         err = set_memory_decrypted(addr, nr_pages);
         |               ^
>> mm/shmem.c:5289:8: error: call to undeclared function 'set_memory_encrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5289 |         err = set_memory_encrypted(addr, nr_pages);
         |               ^
   2 errors generated.


vim +/set_memory_decrypted +5253 mm/shmem.c

  5225	
  5226	/**
  5227	 * shmem_decrypt_folio - Decrypt a folio if the inode requires it
  5228	 * @inode: The inode associated with the folio
  5229	 * @folio: The folio to decrypt
  5230	 *
  5231	 * This function decrypts the folio if the inode has the decrypted flag set.
  5232	 * It should be called after a folio is allocated and added to the page cache.
  5233	 *
  5234	 * Return: 0 on success, negative error code on failure
  5235	 */
  5236	int shmem_decrypt_folio(struct inode *inode, struct folio *folio)
  5237	{
  5238		unsigned long addr;
  5239		int nr_pages;
  5240		int err;
  5241	
  5242		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT))
  5243			return 0;
  5244	
  5245		if (!mapping_decrypted(inode->i_mapping))
  5246			return 0;
  5247	
  5248		nr_pages = folio_nr_pages(folio);
  5249		addr = (unsigned long)folio_address(folio);
  5250		if (!addr)
  5251			return 0;
  5252	
> 5253		err = set_memory_decrypted(addr, nr_pages);
  5254		if (err)
  5255			pr_warn_ratelimited("failed to decrypt folio at %p for inode %lu, error %d\n",
  5256					    folio_address(folio), inode->i_ino, err);
  5257	
  5258		return err;
  5259	}
  5260	EXPORT_SYMBOL_GPL(shmem_decrypt_folio);
  5261	
  5262	/**
  5263	 * shmem_encrypt_folio - Encrypt a folio if it was decrypted
  5264	 * @inode: The inode associated with the folio
  5265	 * @folio: The folio to encrypt
  5266	 *
  5267	 * This function encrypts the folio if the inode has the decrypted flag set.
  5268	 * It should be called when a folio is being released or removed from cache.
  5269	 *
  5270	 * Return: 0 on success, negative error code on failure
  5271	 */
  5272	int shmem_encrypt_folio(struct inode *inode, struct folio *folio)
  5273	{
  5274		unsigned long addr;
  5275		int nr_pages;
  5276		int err;
  5277	
  5278		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT))
  5279			return 0;
  5280	
  5281		if (!mapping_decrypted(inode->i_mapping))
  5282			return 0;
  5283	
  5284		nr_pages = folio_nr_pages(folio);
  5285		addr = (unsigned long)folio_address(folio);
  5286		if (!addr)
  5287			return 0;
  5288	
> 5289		err = set_memory_encrypted(addr, nr_pages);
  5290		if (err)
  5291			pr_warn_ratelimited("failed to encrypt folio at %p for inode %lu, error %d\n",
  5292					    folio_address(folio), inode->i_ino, err);
  5293	
  5294		return err;
  5295	}
  5296	EXPORT_SYMBOL_GPL(shmem_encrypt_folio);
  5297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
