Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484A2836F;
	Sun,  2 Nov 2025 06:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762064330; cv=none; b=IHJFiVEAX5DokCPlFCfdfnjytozaLBStA5oXegNAWfT+CVaySbN4ykaQYYw/g+bnLCXkKouAeVdlEIzfRHNQwYvdUgH8X9hP0RwlD5ZDw5NA0qkYvvhOuW8LHYRK712rm4NFhzt3FKv+uKDBZONdxR8NnIezwctFNEx1t0QuH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762064330; c=relaxed/simple;
	bh=w+iYWGTz+0nArkulYrvXmRTIAiiQSk7FRyi1MwZvuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYP8AuCo2Li+yPZJ0rK3vtyOrjP/DhMPxLu8HEdcBjjWdJzts4WWC+LqujwAnpLa70KNJ0Uz80en/gDhbShFEl4oHlO2pDzAz3+H5T1dNs5y5c2gD7bN1rF+KpEmSYxJrykmglad/E24VJG8+SLy8Z0mXku8K38ufb2NiFTtco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rs8yUlhS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rs8yUlhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762064327; x=1793600327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+iYWGTz+0nArkulYrvXmRTIAiiQSk7FRyi1MwZvuSY=;
  b=Rs8yUlhSW7kItOlh5cOzdyNsHvdk3/A0t7jYpBifqnmdWeTXFWmMgtE0
   ABFD7m1PDaQ+VuZovneBCzu//iek2mc88uQUONOGtJuwxfqDXmocTY186
   HicpijwLsHNnzx/09asJghGq+Pd4wtB8Kw1y1nfkh1xsermHNvQhjBmgE
   0xnSdHyNwAjz9OeMdsWie02wVCRrlMNnD6JfTajuEBncawwNDUwgQsQQm
   b/p44/PYq0IzcjH2ZCjTV+dKy1GdIKX0qH2cuM9FjncFWlaPp77F485ET
   cZN9lToMaYflcw93FYI1kMI45BdtYvpimA8uWTFEaNp/Jw5MtHVGTtQTT
   w==;
X-CSE-ConnectionGUID: T7r0qMS/TFunnAoERNx3/Q==
X-CSE-MsgGUID: VHxDsAOgS3uaysYFC+w8rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="63869080"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="63869080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 23:18:46 -0700
X-CSE-ConnectionGUID: pqii3NynQcKYWc3nc9qD8w==
X-CSE-MsgGUID: A74z2s+tT+C1zSh/ejI/PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186733391"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2025 23:18:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFRQC-000P2a-2d;
	Sun, 02 Nov 2025 06:18:38 +0000
Date: Sun, 2 Nov 2025 14:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 11/11] fs/ntfsplus/attrib.c:93:7:
 warning: variable 'ctx_is_temporary' is used uninitialized whenever 'if'
 condition is true
Message-ID: <202511021422.S9Wy2DV1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251102/202511021422.S9Wy2DV1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021422.S9Wy2DV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021422.S9Wy2DV1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfsplus/attrib.c:93:7: warning: variable 'ctx_is_temporary' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      93 |                 if (!a->non_resident) {
         |                     ^~~~~~~~~~~~~~~~
   fs/ntfsplus/attrib.c:173:6: note: uninitialized use occurs here
     173 |         if (ctx_is_temporary) {
         |             ^~~~~~~~~~~~~~~~
   fs/ntfsplus/attrib.c:93:3: note: remove the 'if' if its condition is always false
      93 |                 if (!a->non_resident) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
      94 |                         err = -EIO;
         |                         ~~~~~~~~~~~
      95 |                         goto err_out;
         |                         ~~~~~~~~~~~~~
      96 |                 }
         |                 ~
   fs/ntfsplus/attrib.c:68:23: note: initialize the variable 'ctx_is_temporary' to silence this warning
      68 |         bool ctx_is_temporary, ctx_needs_reset;
         |                              ^
         |                               = 0
   1 warning generated.
--
>> fs/ntfsplus/ea.c:200:7: warning: variable 'ea_info_qsize' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     200 |                 if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfsplus/ea.c:338:6: note: uninitialized use occurs here
     338 |         if (ea_info_qsize > 0)
         |             ^~~~~~~~~~~~~
   fs/ntfsplus/ea.c:200:3: note: remove the 'if' if its condition is always false
     200 |                 if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     201 |                         goto out;
         |                         ~~~~~~~~
>> fs/ntfsplus/ea.c:200:7: warning: variable 'ea_info_qsize' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     200 |                 if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
         |                     ^~~~~~~~~~
   fs/ntfsplus/ea.c:338:6: note: uninitialized use occurs here
     338 |         if (ea_info_qsize > 0)
         |             ^~~~~~~~~~~~~
   fs/ntfsplus/ea.c:200:7: note: remove the '||' if its condition is always false
     200 |                 if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
         |                     ^~~~~~~~~~~~~
   fs/ntfsplus/ea.c:189:34: note: initialize the variable 'ea_info_qsize' to silence this warning
     189 |         unsigned short int ea_info_qsize;
         |                                         ^
         |                                          = 0
   2 warnings generated.


vim +93 fs/ntfsplus/attrib.c

a26b600766d769 Namjae Jeon 2025-10-17   32  
a26b600766d769 Namjae Jeon 2025-10-17   33  /**
a26b600766d769 Namjae Jeon 2025-10-17   34   * ntfs_map_runlist_nolock - map (a part of) a runlist of an ntfs inode
a26b600766d769 Namjae Jeon 2025-10-17   35   * @ni:		ntfs inode for which to map (part of) a runlist
a26b600766d769 Namjae Jeon 2025-10-17   36   * @vcn:	map runlist part containing this vcn
a26b600766d769 Namjae Jeon 2025-10-17   37   * @ctx:	active attribute search context if present or NULL if not
a26b600766d769 Namjae Jeon 2025-10-17   38   *
a26b600766d769 Namjae Jeon 2025-10-17   39   * Map the part of a runlist containing the @vcn of the ntfs inode @ni.
a26b600766d769 Namjae Jeon 2025-10-17   40   *
a26b600766d769 Namjae Jeon 2025-10-17   41   * If @ctx is specified, it is an active search context of @ni and its base mft
a26b600766d769 Namjae Jeon 2025-10-17   42   * record.  This is needed when ntfs_map_runlist_nolock() encounters unmapped
a26b600766d769 Namjae Jeon 2025-10-17   43   * runlist fragments and allows their mapping.  If you do not have the mft
a26b600766d769 Namjae Jeon 2025-10-17   44   * record mapped, you can specify @ctx as NULL and ntfs_map_runlist_nolock()
a26b600766d769 Namjae Jeon 2025-10-17   45   * will perform the necessary mapping and unmapping.
a26b600766d769 Namjae Jeon 2025-10-17   46   *
a26b600766d769 Namjae Jeon 2025-10-17   47   * Note, ntfs_map_runlist_nolock() saves the state of @ctx on entry and
a26b600766d769 Namjae Jeon 2025-10-17   48   * restores it before returning.  Thus, @ctx will be left pointing to the same
a26b600766d769 Namjae Jeon 2025-10-17   49   * attribute on return as on entry.  However, the actual pointers in @ctx may
a26b600766d769 Namjae Jeon 2025-10-17   50   * point to different memory locations on return, so you must remember to reset
a26b600766d769 Namjae Jeon 2025-10-17   51   * any cached pointers from the @ctx, i.e. after the call to
a26b600766d769 Namjae Jeon 2025-10-17   52   * ntfs_map_runlist_nolock(), you will probably want to do:
a26b600766d769 Namjae Jeon 2025-10-17   53   *	m = ctx->mrec;
a26b600766d769 Namjae Jeon 2025-10-17   54   *	a = ctx->attr;
a26b600766d769 Namjae Jeon 2025-10-17   55   * Assuming you cache ctx->attr in a variable @a of type attr_record * and that
a26b600766d769 Namjae Jeon 2025-10-17   56   * you cache ctx->mrec in a variable @m of type struct mft_record *.
a26b600766d769 Namjae Jeon 2025-10-17   57   */
a26b600766d769 Namjae Jeon 2025-10-17   58  int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_search_ctx *ctx)
a26b600766d769 Namjae Jeon 2025-10-17   59  {
a26b600766d769 Namjae Jeon 2025-10-17   60  	s64 end_vcn;
a26b600766d769 Namjae Jeon 2025-10-17   61  	unsigned long flags;
a26b600766d769 Namjae Jeon 2025-10-17   62  	struct ntfs_inode *base_ni;
a26b600766d769 Namjae Jeon 2025-10-17   63  	struct mft_record *m;
a26b600766d769 Namjae Jeon 2025-10-17   64  	struct attr_record *a;
a26b600766d769 Namjae Jeon 2025-10-17   65  	struct runlist_element *rl;
a26b600766d769 Namjae Jeon 2025-10-17   66  	struct folio *put_this_folio = NULL;
a26b600766d769 Namjae Jeon 2025-10-17   67  	int err = 0;
a26b600766d769 Namjae Jeon 2025-10-17   68  	bool ctx_is_temporary, ctx_needs_reset;
a26b600766d769 Namjae Jeon 2025-10-17   69  	struct ntfs_attr_search_ctx old_ctx = { NULL, };
a26b600766d769 Namjae Jeon 2025-10-17   70  	size_t new_rl_count;
a26b600766d769 Namjae Jeon 2025-10-17   71  
a26b600766d769 Namjae Jeon 2025-10-17   72  	ntfs_debug("Mapping runlist part containing vcn 0x%llx.",
a26b600766d769 Namjae Jeon 2025-10-17   73  			(unsigned long long)vcn);
a26b600766d769 Namjae Jeon 2025-10-17   74  	if (!NInoAttr(ni))
a26b600766d769 Namjae Jeon 2025-10-17   75  		base_ni = ni;
a26b600766d769 Namjae Jeon 2025-10-17   76  	else
a26b600766d769 Namjae Jeon 2025-10-17   77  		base_ni = ni->ext.base_ntfs_ino;
a26b600766d769 Namjae Jeon 2025-10-17   78  	if (!ctx) {
a26b600766d769 Namjae Jeon 2025-10-17   79  		ctx_is_temporary = ctx_needs_reset = true;
a26b600766d769 Namjae Jeon 2025-10-17   80  		m = map_mft_record(base_ni);
a26b600766d769 Namjae Jeon 2025-10-17   81  		if (IS_ERR(m))
a26b600766d769 Namjae Jeon 2025-10-17   82  			return PTR_ERR(m);
a26b600766d769 Namjae Jeon 2025-10-17   83  		ctx = ntfs_attr_get_search_ctx(base_ni, m);
a26b600766d769 Namjae Jeon 2025-10-17   84  		if (unlikely(!ctx)) {
a26b600766d769 Namjae Jeon 2025-10-17   85  			err = -ENOMEM;
a26b600766d769 Namjae Jeon 2025-10-17   86  			goto err_out;
a26b600766d769 Namjae Jeon 2025-10-17   87  		}
a26b600766d769 Namjae Jeon 2025-10-17   88  	} else {
a26b600766d769 Namjae Jeon 2025-10-17   89  		s64 allocated_size_vcn;
a26b600766d769 Namjae Jeon 2025-10-17   90  
a26b600766d769 Namjae Jeon 2025-10-17   91  		BUG_ON(IS_ERR(ctx->mrec));
a26b600766d769 Namjae Jeon 2025-10-17   92  		a = ctx->attr;
a26b600766d769 Namjae Jeon 2025-10-17  @93  		if (!a->non_resident) {
a26b600766d769 Namjae Jeon 2025-10-17   94  			err = -EIO;
a26b600766d769 Namjae Jeon 2025-10-17   95  			goto err_out;
a26b600766d769 Namjae Jeon 2025-10-17   96  		}
a26b600766d769 Namjae Jeon 2025-10-17   97  		ctx_is_temporary = false;
a26b600766d769 Namjae Jeon 2025-10-17   98  		end_vcn = le64_to_cpu(a->data.non_resident.highest_vcn);
a26b600766d769 Namjae Jeon 2025-10-17   99  		read_lock_irqsave(&ni->size_lock, flags);
a26b600766d769 Namjae Jeon 2025-10-17  100  		allocated_size_vcn = ni->allocated_size >>
a26b600766d769 Namjae Jeon 2025-10-17  101  				ni->vol->cluster_size_bits;
a26b600766d769 Namjae Jeon 2025-10-17  102  		read_unlock_irqrestore(&ni->size_lock, flags);
a26b600766d769 Namjae Jeon 2025-10-17  103  		if (!a->data.non_resident.lowest_vcn && end_vcn <= 0)
a26b600766d769 Namjae Jeon 2025-10-17  104  			end_vcn = allocated_size_vcn - 1;
a26b600766d769 Namjae Jeon 2025-10-17  105  		/*
a26b600766d769 Namjae Jeon 2025-10-17  106  		 * If we already have the attribute extent containing @vcn in
a26b600766d769 Namjae Jeon 2025-10-17  107  		 * @ctx, no need to look it up again.  We slightly cheat in
a26b600766d769 Namjae Jeon 2025-10-17  108  		 * that if vcn exceeds the allocated size, we will refuse to
a26b600766d769 Namjae Jeon 2025-10-17  109  		 * map the runlist below, so there is definitely no need to get
a26b600766d769 Namjae Jeon 2025-10-17  110  		 * the right attribute extent.
a26b600766d769 Namjae Jeon 2025-10-17  111  		 */
a26b600766d769 Namjae Jeon 2025-10-17  112  		if (vcn >= allocated_size_vcn || (a->type == ni->type &&
a26b600766d769 Namjae Jeon 2025-10-17  113  				a->name_length == ni->name_len &&
a26b600766d769 Namjae Jeon 2025-10-17  114  				!memcmp((u8 *)a + le16_to_cpu(a->name_offset),
a26b600766d769 Namjae Jeon 2025-10-17  115  				ni->name, ni->name_len) &&
a26b600766d769 Namjae Jeon 2025-10-17  116  				le64_to_cpu(a->data.non_resident.lowest_vcn)
a26b600766d769 Namjae Jeon 2025-10-17  117  				<= vcn && end_vcn >= vcn))
a26b600766d769 Namjae Jeon 2025-10-17  118  			ctx_needs_reset = false;
a26b600766d769 Namjae Jeon 2025-10-17  119  		else {
a26b600766d769 Namjae Jeon 2025-10-17  120  			/* Save the old search context. */
a26b600766d769 Namjae Jeon 2025-10-17  121  			old_ctx = *ctx;
a26b600766d769 Namjae Jeon 2025-10-17  122  			/*
a26b600766d769 Namjae Jeon 2025-10-17  123  			 * If the currently mapped (extent) inode is not the
a26b600766d769 Namjae Jeon 2025-10-17  124  			 * base inode we will unmap it when we reinitialize the
a26b600766d769 Namjae Jeon 2025-10-17  125  			 * search context which means we need to get a
a26b600766d769 Namjae Jeon 2025-10-17  126  			 * reference to the page containing the mapped mft
a26b600766d769 Namjae Jeon 2025-10-17  127  			 * record so we do not accidentally drop changes to the
a26b600766d769 Namjae Jeon 2025-10-17  128  			 * mft record when it has not been marked dirty yet.
a26b600766d769 Namjae Jeon 2025-10-17  129  			 */
a26b600766d769 Namjae Jeon 2025-10-17  130  			if (old_ctx.base_ntfs_ino && old_ctx.ntfs_ino !=
a26b600766d769 Namjae Jeon 2025-10-17  131  					old_ctx.base_ntfs_ino) {
a26b600766d769 Namjae Jeon 2025-10-17  132  				put_this_folio = old_ctx.ntfs_ino->folio;
a26b600766d769 Namjae Jeon 2025-10-17  133  				folio_get(put_this_folio);
a26b600766d769 Namjae Jeon 2025-10-17  134  			}
a26b600766d769 Namjae Jeon 2025-10-17  135  			/*
a26b600766d769 Namjae Jeon 2025-10-17  136  			 * Reinitialize the search context so we can lookup the
a26b600766d769 Namjae Jeon 2025-10-17  137  			 * needed attribute extent.
a26b600766d769 Namjae Jeon 2025-10-17  138  			 */
a26b600766d769 Namjae Jeon 2025-10-17  139  			ntfs_attr_reinit_search_ctx(ctx);
a26b600766d769 Namjae Jeon 2025-10-17  140  			ctx_needs_reset = true;
a26b600766d769 Namjae Jeon 2025-10-17  141  		}
a26b600766d769 Namjae Jeon 2025-10-17  142  	}
a26b600766d769 Namjae Jeon 2025-10-17  143  	if (ctx_needs_reset) {
a26b600766d769 Namjae Jeon 2025-10-17  144  		err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
a26b600766d769 Namjae Jeon 2025-10-17  145  				CASE_SENSITIVE, vcn, NULL, 0, ctx);
a26b600766d769 Namjae Jeon 2025-10-17  146  		if (unlikely(err)) {
a26b600766d769 Namjae Jeon 2025-10-17  147  			if (err == -ENOENT)
a26b600766d769 Namjae Jeon 2025-10-17  148  				err = -EIO;
a26b600766d769 Namjae Jeon 2025-10-17  149  			goto err_out;
a26b600766d769 Namjae Jeon 2025-10-17  150  		}
a26b600766d769 Namjae Jeon 2025-10-17  151  		BUG_ON(!ctx->attr->non_resident);
a26b600766d769 Namjae Jeon 2025-10-17  152  	}
a26b600766d769 Namjae Jeon 2025-10-17  153  	a = ctx->attr;
a26b600766d769 Namjae Jeon 2025-10-17  154  	/*
a26b600766d769 Namjae Jeon 2025-10-17  155  	 * Only decompress the mapping pairs if @vcn is inside it.  Otherwise
a26b600766d769 Namjae Jeon 2025-10-17  156  	 * we get into problems when we try to map an out of bounds vcn because
a26b600766d769 Namjae Jeon 2025-10-17  157  	 * we then try to map the already mapped runlist fragment and
a26b600766d769 Namjae Jeon 2025-10-17  158  	 * ntfs_mapping_pairs_decompress() fails.
a26b600766d769 Namjae Jeon 2025-10-17  159  	 */
a26b600766d769 Namjae Jeon 2025-10-17  160  	end_vcn = le64_to_cpu(a->data.non_resident.highest_vcn) + 1;
a26b600766d769 Namjae Jeon 2025-10-17  161  	if (unlikely(vcn && vcn >= end_vcn)) {
a26b600766d769 Namjae Jeon 2025-10-17  162  		err = -ENOENT;
a26b600766d769 Namjae Jeon 2025-10-17  163  		goto err_out;
a26b600766d769 Namjae Jeon 2025-10-17  164  	}
a26b600766d769 Namjae Jeon 2025-10-17  165  	rl = ntfs_mapping_pairs_decompress(ni->vol, a, &ni->runlist, &new_rl_count);
a26b600766d769 Namjae Jeon 2025-10-17  166  	if (IS_ERR(rl))
a26b600766d769 Namjae Jeon 2025-10-17  167  		err = PTR_ERR(rl);
a26b600766d769 Namjae Jeon 2025-10-17  168  	else {
a26b600766d769 Namjae Jeon 2025-10-17  169  		ni->runlist.rl = rl;
a26b600766d769 Namjae Jeon 2025-10-17  170  		ni->runlist.count = new_rl_count;
a26b600766d769 Namjae Jeon 2025-10-17  171  	}
a26b600766d769 Namjae Jeon 2025-10-17  172  err_out:
a26b600766d769 Namjae Jeon 2025-10-17  173  	if (ctx_is_temporary) {
a26b600766d769 Namjae Jeon 2025-10-17  174  		if (likely(ctx))
a26b600766d769 Namjae Jeon 2025-10-17  175  			ntfs_attr_put_search_ctx(ctx);
a26b600766d769 Namjae Jeon 2025-10-17  176  		unmap_mft_record(base_ni);
a26b600766d769 Namjae Jeon 2025-10-17  177  	} else if (ctx_needs_reset) {
a26b600766d769 Namjae Jeon 2025-10-17  178  		/*
a26b600766d769 Namjae Jeon 2025-10-17  179  		 * If there is no attribute list, restoring the search context
a26b600766d769 Namjae Jeon 2025-10-17  180  		 * is accomplished simply by copying the saved context back over
a26b600766d769 Namjae Jeon 2025-10-17  181  		 * the caller supplied context.  If there is an attribute list,
a26b600766d769 Namjae Jeon 2025-10-17  182  		 * things are more complicated as we need to deal with mapping
a26b600766d769 Namjae Jeon 2025-10-17  183  		 * of mft records and resulting potential changes in pointers.
a26b600766d769 Namjae Jeon 2025-10-17  184  		 */
a26b600766d769 Namjae Jeon 2025-10-17  185  		if (NInoAttrList(base_ni)) {
a26b600766d769 Namjae Jeon 2025-10-17  186  			/*
a26b600766d769 Namjae Jeon 2025-10-17  187  			 * If the currently mapped (extent) inode is not the
a26b600766d769 Namjae Jeon 2025-10-17  188  			 * one we had before, we need to unmap it and map the
a26b600766d769 Namjae Jeon 2025-10-17  189  			 * old one.
a26b600766d769 Namjae Jeon 2025-10-17  190  			 */
a26b600766d769 Namjae Jeon 2025-10-17  191  			if (ctx->ntfs_ino != old_ctx.ntfs_ino) {
a26b600766d769 Namjae Jeon 2025-10-17  192  				/*
a26b600766d769 Namjae Jeon 2025-10-17  193  				 * If the currently mapped inode is not the
a26b600766d769 Namjae Jeon 2025-10-17  194  				 * base inode, unmap it.
a26b600766d769 Namjae Jeon 2025-10-17  195  				 */
a26b600766d769 Namjae Jeon 2025-10-17  196  				if (ctx->base_ntfs_ino && ctx->ntfs_ino !=
a26b600766d769 Namjae Jeon 2025-10-17  197  						ctx->base_ntfs_ino) {
a26b600766d769 Namjae Jeon 2025-10-17  198  					unmap_extent_mft_record(ctx->ntfs_ino);
a26b600766d769 Namjae Jeon 2025-10-17  199  					ctx->mrec = ctx->base_mrec;
a26b600766d769 Namjae Jeon 2025-10-17  200  					BUG_ON(!ctx->mrec);
a26b600766d769 Namjae Jeon 2025-10-17  201  				}
a26b600766d769 Namjae Jeon 2025-10-17  202  				/*
a26b600766d769 Namjae Jeon 2025-10-17  203  				 * If the old mapped inode is not the base
a26b600766d769 Namjae Jeon 2025-10-17  204  				 * inode, map it.
a26b600766d769 Namjae Jeon 2025-10-17  205  				 */
a26b600766d769 Namjae Jeon 2025-10-17  206  				if (old_ctx.base_ntfs_ino &&
a26b600766d769 Namjae Jeon 2025-10-17  207  				    old_ctx.ntfs_ino !=	old_ctx.base_ntfs_ino) {
a26b600766d769 Namjae Jeon 2025-10-17  208  retry_map:
a26b600766d769 Namjae Jeon 2025-10-17  209  					ctx->mrec = map_mft_record(old_ctx.ntfs_ino);
a26b600766d769 Namjae Jeon 2025-10-17  210  					/*
a26b600766d769 Namjae Jeon 2025-10-17  211  					 * Something bad has happened.  If out
a26b600766d769 Namjae Jeon 2025-10-17  212  					 * of memory retry till it succeeds.
a26b600766d769 Namjae Jeon 2025-10-17  213  					 * Any other errors are fatal and we
a26b600766d769 Namjae Jeon 2025-10-17  214  					 * return the error code in ctx->mrec.
a26b600766d769 Namjae Jeon 2025-10-17  215  					 * Let the caller deal with it...  We
a26b600766d769 Namjae Jeon 2025-10-17  216  					 * just need to fudge things so the
a26b600766d769 Namjae Jeon 2025-10-17  217  					 * caller can reinit and/or put the
a26b600766d769 Namjae Jeon 2025-10-17  218  					 * search context safely.
a26b600766d769 Namjae Jeon 2025-10-17  219  					 */
a26b600766d769 Namjae Jeon 2025-10-17  220  					if (IS_ERR(ctx->mrec)) {
a26b600766d769 Namjae Jeon 2025-10-17  221  						if (PTR_ERR(ctx->mrec) == -ENOMEM) {
a26b600766d769 Namjae Jeon 2025-10-17  222  							schedule();
a26b600766d769 Namjae Jeon 2025-10-17  223  							goto retry_map;
a26b600766d769 Namjae Jeon 2025-10-17  224  						} else
a26b600766d769 Namjae Jeon 2025-10-17  225  							old_ctx.ntfs_ino =
a26b600766d769 Namjae Jeon 2025-10-17  226  								old_ctx.base_ntfs_ino;
a26b600766d769 Namjae Jeon 2025-10-17  227  					}
a26b600766d769 Namjae Jeon 2025-10-17  228  				}
a26b600766d769 Namjae Jeon 2025-10-17  229  			}
a26b600766d769 Namjae Jeon 2025-10-17  230  			/* Update the changed pointers in the saved context. */
a26b600766d769 Namjae Jeon 2025-10-17  231  			if (ctx->mrec != old_ctx.mrec) {
a26b600766d769 Namjae Jeon 2025-10-17  232  				if (!IS_ERR(ctx->mrec))
a26b600766d769 Namjae Jeon 2025-10-17  233  					old_ctx.attr = (struct attr_record *)(
a26b600766d769 Namjae Jeon 2025-10-17  234  							(u8 *)ctx->mrec +
a26b600766d769 Namjae Jeon 2025-10-17  235  							((u8 *)old_ctx.attr -
a26b600766d769 Namjae Jeon 2025-10-17  236  							(u8 *)old_ctx.mrec));
a26b600766d769 Namjae Jeon 2025-10-17  237  				old_ctx.mrec = ctx->mrec;
a26b600766d769 Namjae Jeon 2025-10-17  238  			}
a26b600766d769 Namjae Jeon 2025-10-17  239  		}
a26b600766d769 Namjae Jeon 2025-10-17  240  		/* Restore the search context to the saved one. */
a26b600766d769 Namjae Jeon 2025-10-17  241  		*ctx = old_ctx;
a26b600766d769 Namjae Jeon 2025-10-17  242  		/*
a26b600766d769 Namjae Jeon 2025-10-17  243  		 * We drop the reference on the page we took earlier.  In the
a26b600766d769 Namjae Jeon 2025-10-17  244  		 * case that IS_ERR(ctx->mrec) is true this means we might lose
a26b600766d769 Namjae Jeon 2025-10-17  245  		 * some changes to the mft record that had been made between
a26b600766d769 Namjae Jeon 2025-10-17  246  		 * the last time it was marked dirty/written out and now.  This
a26b600766d769 Namjae Jeon 2025-10-17  247  		 * at this stage is not a problem as the mapping error is fatal
a26b600766d769 Namjae Jeon 2025-10-17  248  		 * enough that the mft record cannot be written out anyway and
a26b600766d769 Namjae Jeon 2025-10-17  249  		 * the caller is very likely to shutdown the whole inode
a26b600766d769 Namjae Jeon 2025-10-17  250  		 * immediately and mark the volume dirty for chkdsk to pick up
a26b600766d769 Namjae Jeon 2025-10-17  251  		 * the pieces anyway.
a26b600766d769 Namjae Jeon 2025-10-17  252  		 */
a26b600766d769 Namjae Jeon 2025-10-17  253  		if (put_this_folio)
a26b600766d769 Namjae Jeon 2025-10-17  254  			folio_put(put_this_folio);
a26b600766d769 Namjae Jeon 2025-10-17  255  	}
a26b600766d769 Namjae Jeon 2025-10-17  256  	return err;
a26b600766d769 Namjae Jeon 2025-10-17  257  }
a26b600766d769 Namjae Jeon 2025-10-17  258  

:::::: The code at line 93 was first introduced by commit
:::::: a26b600766d7696b004470a05f625b75bb0a32db ntfsplus: add attrib operatrions

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
