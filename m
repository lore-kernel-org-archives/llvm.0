Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE6371CEA;
	Sat, 13 Jun 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340447; cv=none; b=MPfig1jY9wOZyBm4aYzKeT2BugzqiikMUJBeJXHLd+EOMcMWR0NW7pwBxScG7XREVth0kR2NLm/9YhLczomQ0iBi++CWz6ILwheuZ3lZkgFnNPKn6EvpxDMTyohXax84+UqOZAPwe4Up3oijz4XjX/fDQB4L9N39YFpT1KqHfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340447; c=relaxed/simple;
	bh=YbcjwfJkjCRSz/uhWAeiDdYymq4l4m0CYYGZEIBtHCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJ021YLKQ3iYK5ThuHN0qTZ8Fzh4l3TQaXk7QbC8fYg9o/nfoz90RFV4WYijr7+XWV86xclCODvV6iAdEe/ijTjKkMdAgTXx2IAx2a57F/w6askOLZMI+KgVMZlCGtb2j2gIUxY2xhx16gF6ac9kTaTIX54dqeRmW5knvzymaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFRK7QTV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFRK7QTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781340444; x=1812876444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YbcjwfJkjCRSz/uhWAeiDdYymq4l4m0CYYGZEIBtHCY=;
  b=GFRK7QTVu7rCQJLm9Bztu7e7WcbTArw+8NP6WegvLOWTysrZwWR5qLo4
   LyjNDv1taIASn6nH56tWGLk9m8EmG6o3naN/tDZ6DTaC5cOcGEpE2AceU
   1dPyQYxZQzdTcMYuJtDwFKLq4fa80CkjMde7dgtmnw58WBSghNrH+1BUZ
   87V3WEQppKSo0foa8VeRO38DAuZLGXX3JE4YU3tbZVxrBzzAK7p+hUkl5
   uEiAoA8iZ8J5B445xr0srHjy/Oa4L9h002fb2d7cb6fRdV6vNT1GkWax+
   0R6OgaBVSngJfW6VphajY6j2Q2IxMR3gwExnviMjg+35MscLJR6QUevRK
   w==;
X-CSE-ConnectionGUID: 852aEUXhRKG6ucLsPPNWtQ==
X-CSE-MsgGUID: Bfk9rl1oRAyncd2rUQc7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84731370"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="84731370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 01:47:20 -0700
X-CSE-ConnectionGUID: M4+rJ69VRVWrKdQ7ENC6vw==
X-CSE-MsgGUID: 0JcwkRoATPycQJJHiZ0yVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="247088681"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 01:47:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYK1M-000000004Sz-2TnC;
	Sat, 13 Jun 2026 08:47:16 +0000
Date: Sat, 13 Jun 2026 10:46:50 +0200
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.com>, outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: Re: [PATCH v2] udf: validate extent partition references in
 udf_current_aext()
Message-ID: <202606131029.qRHBJ5LX-lkp@intel.com>
References: <20260612225846.97678-1-kylebot@openai.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612225846.97678-1-kylebot@openai.com>

Hi Kyle,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v7.1-rc7 next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/udf-validate-extent-partition-references-in-udf_current_aext/20260613-070817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260612225846.97678-1-kylebot%40openai.com
patch subject: [PATCH v2] udf: validate extent partition references in udf_current_aext()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260613/202606131029.qRHBJ5LX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131029.qRHBJ5LX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131029.qRHBJ5LX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/udf/inode.c:2154:22: warning: unused variable 'sbi' [-Wunused-variable]
    2154 |         struct udf_sb_info *sbi = UDF_SB(inode->i_sb);
         |                             ^~~
>> fs/udf/inode.c:2303:37: error: use of undeclared identifier 'sbi'
    2303 |         if (eloc->partitionReferenceNum >= sbi->s_partitions) {
         |                                            ^~~
   fs/udf/inode.c:2305:35: error: use of undeclared identifier 'sbi'
    2305 |                           eloc->partitionReferenceNum, sbi->s_partitions);
         |                                                        ^~~
   1 warning and 2 errors generated.


vim +/sbi +2303 fs/udf/inode.c

  2145	
  2146	void udf_write_aext(struct inode *inode, struct extent_position *epos,
  2147			    struct kernel_lb_addr *eloc, uint32_t elen, int inc)
  2148	{
  2149		int adsize;
  2150		uint8_t *ptr;
  2151		struct short_ad *sad;
  2152		struct long_ad *lad;
  2153		struct udf_inode_info *iinfo = UDF_I(inode);
> 2154		struct udf_sb_info *sbi = UDF_SB(inode->i_sb);
  2155	
  2156		if (!epos->bh)
  2157			ptr = iinfo->i_data + epos->offset -
  2158				udf_file_entry_alloc_offset(inode) +
  2159				iinfo->i_lenEAttr;
  2160		else
  2161			ptr = epos->bh->b_data + epos->offset;
  2162	
  2163		switch (iinfo->i_alloc_type) {
  2164		case ICBTAG_FLAG_AD_SHORT:
  2165			sad = (struct short_ad *)ptr;
  2166			sad->extLength = cpu_to_le32(elen);
  2167			sad->extPosition = cpu_to_le32(eloc->logicalBlockNum);
  2168			adsize = sizeof(struct short_ad);
  2169			break;
  2170		case ICBTAG_FLAG_AD_LONG:
  2171			lad = (struct long_ad *)ptr;
  2172			lad->extLength = cpu_to_le32(elen);
  2173			lad->extLocation = cpu_to_lelb(*eloc);
  2174			memset(lad->impUse, 0x00, sizeof(lad->impUse));
  2175			adsize = sizeof(struct long_ad);
  2176			break;
  2177		default:
  2178			return;
  2179		}
  2180	
  2181		if (epos->bh) {
  2182			if (!UDF_QUERY_FLAG(inode->i_sb, UDF_FLAG_STRICT) ||
  2183			    UDF_SB(inode->i_sb)->s_udfrev >= 0x0201) {
  2184				struct allocExtDesc *aed =
  2185					(struct allocExtDesc *)epos->bh->b_data;
  2186				udf_update_tag(epos->bh->b_data,
  2187					       le32_to_cpu(aed->lengthAllocDescs) +
  2188					       sizeof(struct allocExtDesc));
  2189			}
  2190			mmb_mark_buffer_dirty(epos->bh, &iinfo->i_metadata_bhs);
  2191		} else {
  2192			mark_inode_dirty(inode);
  2193		}
  2194	
  2195		if (inc)
  2196			epos->offset += adsize;
  2197	}
  2198	
  2199	/*
  2200	 * Only 1 indirect extent in a row really makes sense but allow upto 16 in case
  2201	 * someone does some weird stuff.
  2202	 */
  2203	#define UDF_MAX_INDIR_EXTS 16
  2204	
  2205	/*
  2206	 * Returns 1 on success, -errno on error, 0 on hit EOF.
  2207	 */
  2208	int udf_next_aext(struct inode *inode, struct extent_position *epos,
  2209			  struct kernel_lb_addr *eloc, uint32_t *elen, int8_t *etype,
  2210			  int inc)
  2211	{
  2212		unsigned int indirections = 0;
  2213		int ret = 0;
  2214		udf_pblk_t block;
  2215	
  2216		while (1) {
  2217			ret = udf_current_aext(inode, epos, eloc, elen,
  2218					       etype, inc);
  2219			if (ret <= 0)
  2220				return ret;
  2221			if (*etype != (EXT_NEXT_EXTENT_ALLOCDESCS >> 30))
  2222				return ret;
  2223	
  2224			if (++indirections > UDF_MAX_INDIR_EXTS) {
  2225				udf_err(inode->i_sb,
  2226					"too many indirect extents in inode %llu\n",
  2227					inode->i_ino);
  2228				return -EFSCORRUPTED;
  2229			}
  2230	
  2231			epos->block = *eloc;
  2232			epos->offset = sizeof(struct allocExtDesc);
  2233			brelse(epos->bh);
  2234			block = udf_get_lb_pblock(inode->i_sb, &epos->block, 0);
  2235			epos->bh = sb_bread(inode->i_sb, block);
  2236			if (!epos->bh) {
  2237				udf_debug("reading block %u failed!\n", block);
  2238				return -EIO;
  2239			}
  2240		}
  2241	}
  2242	
  2243	/*
  2244	 * Returns 1 on success, -errno on error, 0 on hit EOF.
  2245	 */
  2246	int udf_current_aext(struct inode *inode, struct extent_position *epos,
  2247			     struct kernel_lb_addr *eloc, uint32_t *elen, int8_t *etype,
  2248			     int inc)
  2249	{
  2250		int alen;
  2251		uint8_t *ptr;
  2252		struct short_ad *sad;
  2253		struct long_ad *lad;
  2254		struct udf_inode_info *iinfo = UDF_I(inode);
  2255	
  2256		if (!epos->bh) {
  2257			if (!epos->offset)
  2258				epos->offset = udf_file_entry_alloc_offset(inode);
  2259			ptr = iinfo->i_data + epos->offset -
  2260				udf_file_entry_alloc_offset(inode) +
  2261				iinfo->i_lenEAttr;
  2262			alen = udf_file_entry_alloc_offset(inode) +
  2263								iinfo->i_lenAlloc;
  2264		} else {
  2265			struct allocExtDesc *header =
  2266				(struct allocExtDesc *)epos->bh->b_data;
  2267	
  2268			if (!epos->offset)
  2269				epos->offset = sizeof(struct allocExtDesc);
  2270			ptr = epos->bh->b_data + epos->offset;
  2271			if (check_add_overflow(sizeof(struct allocExtDesc),
  2272					le32_to_cpu(header->lengthAllocDescs), &alen))
  2273				return -1;
  2274	
  2275			if (alen > epos->bh->b_size)
  2276				return -1;
  2277		}
  2278	
  2279		switch (iinfo->i_alloc_type) {
  2280		case ICBTAG_FLAG_AD_SHORT:
  2281			sad = udf_get_fileshortad(ptr, alen, &epos->offset, inc);
  2282			if (!sad)
  2283				return 0;
  2284			*etype = le32_to_cpu(sad->extLength) >> 30;
  2285			eloc->logicalBlockNum = le32_to_cpu(sad->extPosition);
  2286			eloc->partitionReferenceNum =
  2287					iinfo->i_location.partitionReferenceNum;
  2288			*elen = le32_to_cpu(sad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2289			break;
  2290		case ICBTAG_FLAG_AD_LONG:
  2291			lad = udf_get_filelongad(ptr, alen, &epos->offset, inc);
  2292			if (!lad)
  2293				return 0;
  2294			*etype = le32_to_cpu(lad->extLength) >> 30;
  2295			*eloc = lelb_to_cpu(lad->extLocation);
  2296			*elen = le32_to_cpu(lad->extLength) & UDF_EXTENT_LENGTH_MASK;
  2297			break;
  2298		default:
  2299			udf_debug("alloc_type = %u unsupported\n", iinfo->i_alloc_type);
  2300			return -EINVAL;
  2301		}
  2302	
> 2303		if (eloc->partitionReferenceNum >= sbi->s_partitions) {
  2304			udf_debug("invalid partition reference %u (partitions %u)\n",
  2305				  eloc->partitionReferenceNum, sbi->s_partitions);
  2306			return -EFSCORRUPTED;
  2307		}
  2308	
  2309		return 1;
  2310	}
  2311	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
