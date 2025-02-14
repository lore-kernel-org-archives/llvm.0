Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C51632C8;
	Fri, 14 Feb 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739520040; cv=none; b=Cq89GxkQ2T1Tf765WZOj2HPqkstR/oPHhyeA1GTLSWgPF1gKghVI32DjfZYchlOAF0XY+eIAvcWjrdbHKZigxqPLiu5MTFxLVAB4HDPuvMk8plkiCNCN78rArCDzcPmbl9/LOYfW+xnH+4hv2x+bNHwoRGGSX6q/pGg7qJkywrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739520040; c=relaxed/simple;
	bh=BxF9XHvRV3i7PafGi5qc6sq8FWAeOT068IbmCK6d1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1SRyy/77o7rujU0PKaomhDlRu92W+BbtpNU6om2ltXA7MzTSLMH/EidqUnMrKKwHsobNd8ClHCX9l3Fz1meiMc0Rizu8hjaieDTtByiRLm+eKEPgzusJENec/WH89eZmTbdDsDzW/g6W5Bo+As9W85OnRjPPE454J/I4l2Cj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH6Zcn0p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH6Zcn0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739520039; x=1771056039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BxF9XHvRV3i7PafGi5qc6sq8FWAeOT068IbmCK6d1Ss=;
  b=oH6Zcn0pae1XCdino+4FCcNWvy0GYtC9pfwZC4wEXDFj/KmWSxkuyw7f
   rQfEPYWCZZ3txl4PFEU6s2nHD2w9ftuT6TJwW6VbCYDWqE5DthacYjbqw
   39+G/cyHrdpcyEVXixYqgeQ7/COxmYVM7EOrDLa+NuwkTdG32fWN1ZyFz
   cqxXuF7NdSGcsqIb0QxY2fGgs9RJHToPYf3oJP4u+Q6s8XUew2k/xueBx
   dhS0Edii+SPVo4as3qNWchpWRcZmmVVSaog5rH9B6fsp0RGBCcqhWAngp
   7SzxctZADjgvzfKJflAwHwIxzlmQynqTnrejWwmwOI69DKJFqfJXIACa6
   Q==;
X-CSE-ConnectionGUID: rzKuicSdQrCC99sQepvJ1Q==
X-CSE-MsgGUID: Q2QY9TMzTnq8f/QV6FU4Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57666755"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57666755"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:00:39 -0800
X-CSE-ConnectionGUID: Ps042pZ8SJuuoxqfBeG1mg==
X-CSE-MsgGUID: nUCMvHoBQAGH2gXIHnet7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113253142"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 00:00:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiqck-0019FR-2O;
	Fri, 14 Feb 2025 08:00:34 +0000
Date: Fri, 14 Feb 2025 16:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:s390x-file-thp2 2/3] arch/s390/kernel/uv.c:325:7:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202502141508.aVtsdM7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux s390x-file-thp2
head:   151d01a70e34570508ec9aeb7614bcc540ed8bf9
commit: c6ce243b304f3f2e5c109fe0418c2a82cd1c8edd [2/3] tmp
config: s390-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141508.aVtsdM7G-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141508.aVtsdM7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141508.aVtsdM7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kernel/uv.c:325:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     325 |                 if (xas_load(&xas) != folio) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/uv.c:371:9: note: uninitialized use occurs here
     371 |         return ret;
         |                ^~~
   arch/s390/kernel/uv.c:325:3: note: remove the 'if' if its condition is always false
     325 |                 if (xas_load(&xas) != folio) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     326 |                         goto fail;
         |                         ~~~~~~~~~~
     327 |                         ret = -EBUSY;
         |                         ~~~~~~~~~~~~~
     328 |                 }
         |                 ~
   arch/s390/kernel/uv.c:293:9: note: initialize the variable 'ret' to silence this warning
     293 |         int ret, cc = 0;
         |                ^
         |                 = 0
   1 warning generated.


vim +325 arch/s390/kernel/uv.c

   269	
   270	/**
   271	 * make_folio_secure() - make a folio secure
   272	 * @folio: the folio to make secure
   273	 * @uvcb: the uvcb that describes the UVC to be used
   274	 *
   275	 * The folio @folio will be made secure if possible, @uvcb will be passed
   276	 * as-is to the UVC.
   277	 *
   278	 * Return: 0 on success;
   279	 *         -EBUSY if the folio is in writeback or has too many references;
   280	 *         -E2BIG if the folio is large;
   281	 *         -EAGAIN if the UVC needs to be attempted again;
   282	 *         -ENXIO if the address is not mapped;
   283	 *         -EINVAL if the UVC failed for other reasons.
   284	 *
   285	 * Context: The caller must hold exactly one extra reference on the folio
   286	 *          (it's the same logic as split_folio())
   287	 */
   288	int make_folio_secure(struct folio *folio, struct uv_cb_header *uvcb)
   289	{
   290		XA_STATE(xas, &folio->mapping->i_pages, folio->index);
   291		struct address_space *mapping = NULL;
   292		struct anon_vma *anon_vma = NULL;
   293		int ret, cc = 0;
   294		int expected;
   295	
   296		if (folio_test_large(folio))
   297			return -E2BIG;
   298		if (folio_test_writeback(folio))
   299			return -EBUSY;
   300	
   301		/* Does it make sense to try at all? */
   302		if (folio_ref_count(folio) != expected_folio_refs(folio) + 1)
   303			return -EBUSY;
   304	
   305		/* See split_huge_page_to_list_to_order() on the nasty details. */
   306		if (folio_test_anon(folio)) {
   307			anon_vma = folio_get_anon_vma(folio);
   308			if (!anon_vma)
   309				return -EBUSY;
   310			anon_vma_lock_write(anon_vma);
   311		} else {
   312			mapping = folio->mapping;
   313			if (!mapping)
   314				return -EBUSY;
   315			/* Hmmm, do we need filemap_release_folio()? */
   316			i_mmap_lock_read(mapping);
   317		}
   318	
   319		unmap_folio(folio);
   320	
   321		local_irq_disable();
   322		if (mapping) {
   323			xas_lock(&xas);
   324			xas_reset(&xas);
 > 325			if (xas_load(&xas) != folio) {
   326				goto fail;
   327				ret = -EBUSY;
   328			}
   329		}
   330	
   331		expected = expected_folio_refs(folio) + 1;
   332		if (!folio_mapped(folio) &&
   333		    folio_ref_freeze(folio, expected)) {
   334			set_bit(PG_arch_1, &folio->flags);
   335			/*
   336			 * If the UVC does not succeed or fail immediately, we don't want to
   337			 * loop for long, or we might get stall notifications.
   338			 * On the other hand, this is a complex scenario and we are holding a lot of
   339			 * locks, so we can't easily sleep and reschedule. We try only once,
   340			 * and if the UVC returned busy or partial completion, we return
   341			 * -EAGAIN and we let the callers deal with it.
   342			 */
   343			cc = __uv_call(0, (u64)uvcb);
   344			folio_ref_unfreeze(folio, expected);
   345			/*
   346			 * Return -ENXIO if the folio was not mapped, -EINVAL for other errors.
   347			 * If busy or partially completed, return -EAGAIN.
   348			 */
   349			if (cc == UVC_CC_OK)
   350				ret = 0;
   351			else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
   352				ret = -EAGAIN;
   353			else
   354				ret = uvcb->rc == 0x10a ? -ENXIO : -EINVAL;
   355		} else {
   356			ret = -EBUSY;
   357		}
   358	
   359		if (mapping)
   360			xas_unlock(&xas);
   361	fail:
   362		local_irq_enable();
   363		remap_page(folio, 1, 0);
   364		if (anon_vma) {
   365			anon_vma_unlock_write(anon_vma);
   366			put_anon_vma(anon_vma);
   367		}
   368		if (mapping)
   369			i_mmap_unlock_read(mapping);
   370		xas_destroy(&xas);
   371		return ret;
   372	}
   373	EXPORT_SYMBOL_GPL(make_folio_secure);
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
