Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574734029C;
	Sat,  7 Feb 2026 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466125; cv=none; b=mNzkx/lc2NQ/0jHMacVwdQrVp/qay6eJz4hstkSmM/+Mq2FlO9GrPs5ikWX4QZqRH0eRuIlGDwldBT13xDYKnAb8AChvDoTsphQVNFKlCiVt6p/M6i+ej/XOTQ0RITUjSdEwa5So13IXz1t835LNcSrNtUATfLxC00JJ4OeX2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466125; c=relaxed/simple;
	bh=dhnn76vAWX9q2HMZc+WUB2Jouo/51hRXZodVI75NOQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFW29neuAGkSz8KQPhOx7XamgykxZQ19ajZqTX25sR8dCQDLSHv9J/nRbUG6Fpg5X/xzDU+Lzi+Fp2Si6gZ5wOojwh2S5W/d0F5SR+Ripe27VyGWPCFjjlKikYg58WoF1CCR/0ljDwZMIzGzLs6TGPwvnIMpHjhcW2chnB3syoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyk6YAfX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyk6YAfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770466125; x=1802002125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dhnn76vAWX9q2HMZc+WUB2Jouo/51hRXZodVI75NOQk=;
  b=Nyk6YAfXBrofyTupvKYp3MD6LRPG1FAElleKiQSPfPwz3UVJwXqt7X/w
   raBKCr4V1+by+SA6YtwJr+HW4QC9X2q4Z1W09zbNLZju8LZVhLfiV47q1
   kqtPihppkNFKgN3qwMV3ShHpHHSWQe7cdEq9lJZZQshThdWh/c1gI441d
   wBof/+0morx+q8R+h4tLhN4TozH8vhqzBcUQVRfxPpbPouARLD3q9QTn+
   bAPqLTmMRO22KhgmFcWimyuANmv4WhrQcge0HP1GTGk518iXpCMBZFzZX
   W8d4etv0dBROTwf0qOXj3ZFddqTJ9rjZhg1y9dTi2n74/oqIUyZC5bA/X
   g==;
X-CSE-ConnectionGUID: M6/MkRbwRry5sIlACCHpmg==
X-CSE-MsgGUID: K2cfjTszT8WiNX4RsVoGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89231141"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="89231141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:08:44 -0800
X-CSE-ConnectionGUID: 3rlIt3jgRVuUUdOnIrDqtg==
X-CSE-MsgGUID: FtzDs0rfSIOtzR3VFwhSlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234066265"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 04:08:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voh7A-00000000ld6-03Ax;
	Sat, 07 Feb 2026 12:08:40 +0000
Date: Sat, 7 Feb 2026 20:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH] fs/ntfs3: return folios from ntfs_lock_new_page()
Message-ID: <202602072013.jwrURE2e-lkp@intel.com>
References: <20260205094934.10500-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205094934.10500-1-sun.jian.kdev@gmail.com>

Hi Sun,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.19-rc8]
[cannot apply to next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-Jian/fs-ntfs3-return-folios-from-ntfs_lock_new_page/20260205-175053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260205094934.10500-1-sun.jian.kdev%40gmail.com
patch subject: [PATCH] fs/ntfs3: return folios from ntfs_lock_new_page()
config: hexagon-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072013.jwrURE2e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072013.jwrURE2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072013.jwrURE2e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs3/frecord.c:2200:7: error: incompatible pointer types assigning to 'struct page *' from 'struct folio *' [-Wincompatible-pointer-types]
    2200 |                         pg = ntfs_lock_new_page(mapping, index, gfp_mask);
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2200 fs/ntfs3/frecord.c

4342306f0f0d5ff Konstantin Komarov      2021-08-13  2133  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2134  #ifdef CONFIG_NTFS3_LZX_XPRESS
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2135  /*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2136   * ni_decompress_file - Decompress LZX/Xpress compressed file.
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2137   *
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2138   * Remove ATTR_DATA::WofCompressedData.
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2139   * Remove ATTR_REPARSE.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2140   */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2141  int ni_decompress_file(struct ntfs_inode *ni)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2142  {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2143  	struct ntfs_sb_info *sbi = ni->mi.sbi;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2144  	struct inode *inode = &ni->vfs_inode;
4fd6c08a16d7f1b Konstantin Komarov      2024-01-26  2145  	loff_t i_size = i_size_read(inode);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2146  	struct address_space *mapping = inode->i_mapping;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2147  	gfp_t gfp_mask = mapping_gfp_mask(mapping);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2148  	struct page **pages = NULL;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2149  	struct ATTR_LIST_ENTRY *le;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2150  	struct ATTRIB *attr;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2151  	CLST vcn, cend, lcn, clen, end;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2152  	pgoff_t index;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2153  	u64 vbo;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2154  	u8 frame_bits;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2155  	u32 i, frame_size, pages_per_frame, bytes;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2156  	struct mft_inode *mi;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2157  	int err;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2158  
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2159  	/* Clusters for decompressed data. */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2160  	cend = bytes_to_cluster(sbi, i_size);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2161  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2162  	if (!i_size)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2163  		goto remove_wof;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2164  
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2165  	/* Check in advance. */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2166  	if (cend > wnd_zeroes(&sbi->used.bitmap)) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2167  		err = -ENOSPC;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2168  		goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2169  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2170  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2171  	frame_bits = ni_ext_compress_bits(ni);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2172  	frame_size = 1u << frame_bits;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2173  	pages_per_frame = frame_size >> PAGE_SHIFT;
345482bc431f649 Kari Argillander        2021-08-24  2174  	pages = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2175  	if (!pages) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2176  		err = -ENOMEM;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2177  		goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2178  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2179  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2180  	/*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2181  	 * Step 1: Decompress data and copy to new allocated clusters.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2182  	 */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2183  	index = 0;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2184  	for (vbo = 0; vbo < i_size; vbo += bytes) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2185  		bool new;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2186  
f35590ee26f5722 Konstantin Komarov      2025-10-14  2187  		bytes = vbo + frame_size > i_size ? (i_size - vbo) : frame_size;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2188  		end = bytes_to_cluster(sbi, vbo + bytes);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2189  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2190  		for (vcn = vbo >> sbi->cluster_bits; vcn < end; vcn += clen) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2191  			err = attr_data_get_block(ni, vcn, cend - vcn, &lcn,
c380b52f6c5702c Konstantin Komarov      2022-10-07  2192  						  &clen, &new, false);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2193  			if (err)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2194  				goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2195  		}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2196  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2197  		for (i = 0; i < pages_per_frame; i++, index++) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2198  			struct page *pg;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2199  
68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18 @2200) 			pg = ntfs_lock_new_page(mapping, index, gfp_mask);
68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18  2201) 			if (IS_ERR(pg)) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2202  				while (i--) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2203  					unlock_page(pages[i]);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2204  					put_page(pages[i]);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2205  				}
68f6bd128e75a03 Matthew Wilcox (Oracle  2025-07-18  2206) 				err = PTR_ERR(pg);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2207  				goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2208  			}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2209  			pages[i] = pg;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2210  		}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2211  
f35590ee26f5722 Konstantin Komarov      2025-10-14  2212  		err = ni_read_frame(ni, vbo, pages, pages_per_frame, 1);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2213  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2214  		for (i = 0; i < pages_per_frame; i++) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2215  			unlock_page(pages[i]);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2216  			put_page(pages[i]);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2217  		}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2218  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2219  		if (err)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2220  			goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2221  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2222  		cond_resched();
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2223  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2224  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2225  remove_wof:
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2226  	/*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2227  	 * Step 2: Deallocate attributes ATTR_DATA::WofCompressedData
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2228  	 * and ATTR_REPARSE.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2229  	 */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2230  	attr = NULL;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2231  	le = NULL;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2232  	while ((attr = ni_enum_attr_ex(ni, attr, &le, NULL))) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2233  		CLST svcn, evcn;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2234  		u32 asize, roff;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2235  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2236  		if (attr->type == ATTR_REPARSE) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2237  			struct MFT_REF ref;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2238  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2239  			mi_get_ref(&ni->mi, &ref);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2240  			ntfs_remove_reparse(sbi, 0, &ref);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2241  		}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2242  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2243  		if (!attr->non_res)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2244  			continue;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2245  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2246  		if (attr->type != ATTR_REPARSE &&
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2247  		    (attr->type != ATTR_DATA ||
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2248  		     attr->name_len != ARRAY_SIZE(WOF_NAME) ||
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2249  		     memcmp(attr_name(attr), WOF_NAME, sizeof(WOF_NAME))))
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2250  			continue;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2251  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2252  		svcn = le64_to_cpu(attr->nres.svcn);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2253  		evcn = le64_to_cpu(attr->nres.evcn);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2254  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2255  		if (evcn + 1 <= svcn)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2256  			continue;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2257  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2258  		asize = le32_to_cpu(attr->size);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2259  		roff = le16_to_cpu(attr->nres.run_off);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2260  
6db620863f8528e Edward Lo               2022-08-06  2261  		if (roff > asize) {
6db620863f8528e Edward Lo               2022-08-06  2262  			err = -EINVAL;
6db620863f8528e Edward Lo               2022-08-06  2263  			goto out;
6db620863f8528e Edward Lo               2022-08-06  2264  		}
6db620863f8528e Edward Lo               2022-08-06  2265  
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2266  		/*run==1  Means unpack and deallocate. */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2267  		run_unpack_ex(RUN_DEALLOCATE, sbi, ni->mi.rno, svcn, evcn, svcn,
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2268  			      Add2Ptr(attr, roff), asize - roff);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2269  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2270  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2271  	/*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2272  	 * Step 3: Remove attribute ATTR_DATA::WofCompressedData.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2273  	 */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2274  	err = ni_remove_attr(ni, ATTR_DATA, WOF_NAME, ARRAY_SIZE(WOF_NAME),
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2275  			     false, NULL);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2276  	if (err)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2277  		goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2278  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2279  	/*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2280  	 * Step 4: Remove ATTR_REPARSE.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2281  	 */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2282  	err = ni_remove_attr(ni, ATTR_REPARSE, NULL, 0, false, NULL);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2283  	if (err)
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2284  		goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2285  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2286  	/*
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2287  	 * Step 5: Remove sparse flag from data attribute.
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2288  	 */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2289  	attr = ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL, &mi);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2290  	if (!attr) {
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2291  		err = -EINVAL;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2292  		goto out;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2293  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2294  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2295  	if (attr->non_res && is_attr_sparsed(attr)) {
d3624466b56dd5b Konstantin Komarov      2021-08-31  2296  		/* Sparsed attribute header is 8 bytes bigger than normal. */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2297  		struct MFT_REC *rec = mi->mrec;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2298  		u32 used = le32_to_cpu(rec->used);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2299  		u32 asize = le32_to_cpu(attr->size);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2300  		u16 roff = le16_to_cpu(attr->nres.run_off);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2301  		char *rbuf = Add2Ptr(attr, roff);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2302  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2303  		memmove(rbuf - 8, rbuf, used - PtrOffset(rec, rbuf));
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2304  		attr->size = cpu_to_le32(asize - 8);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2305  		attr->flags &= ~ATTR_FLAG_SPARSED;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2306  		attr->nres.run_off = cpu_to_le16(roff - 8);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2307  		attr->nres.c_unit = 0;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2308  		rec->used = cpu_to_le32(used - 8);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2309  		mi->dirty = true;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2310  		ni->std_fa &= ~(FILE_ATTRIBUTE_SPARSE_FILE |
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2311  				FILE_ATTRIBUTE_REPARSE_POINT);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2312  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2313  		mark_inode_dirty(inode);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2314  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2315  
e8b8e97f91b80f0 Kari Argillander        2021-08-03  2316  	/* Clear cached flag. */
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2317  	ni->ni_flags &= ~NI_FLAG_COMPRESSED_MASK;
c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2318) 	if (ni->file.offs_folio) {
c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2319) 		folio_put(ni->file.offs_folio);
c091354d6bf60ec Matthew Wilcox (Oracle  2024-04-22  2320) 		ni->file.offs_folio = NULL;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2321  	}
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2322  	mapping->a_ops = &ntfs_aops;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2323  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2324  out:
195c52bdd5d5ecf Kari Argillander        2021-08-24  2325  	kfree(pages);
c12df45ee690112 Konstantin Komarov      2022-07-13  2326  	if (err)
c12df45ee690112 Konstantin Komarov      2022-07-13  2327  		_ntfs_bad_inode(inode);
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2328  
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2329  	return err;
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2330  }
4342306f0f0d5ff Konstantin Komarov      2021-08-13  2331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
