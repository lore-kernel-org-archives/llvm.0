Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9172798F8;
	Sat, 13 Jun 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334437; cv=none; b=Wg8scV94/T2ii8gE6utiGKB7W1MLjk2FKdVYPE93zc/BexKfFhJVaeSz+J50ZMFJyfPbwHHc6LjeQufYOcwQ1SLDFfObNC+ca6x0kV7yN7tdgN1HPbQWyZlmO4JTaDJm87ynBIcp0DF57Ww0k2/Z8TuDLTNMBZwXHTL8qvyK8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334437; c=relaxed/simple;
	bh=EtNR/AXIc8cH3H0+feKXrvGJy0t9KHmOeOdwGv0I1gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWSMZblLlC1Ny2peeClVWG746rq+c/I+FcTGBFnyq7f2GSX2QK5Q8Qe6aTZ30QS2J0epsX8Ea1wmAMM2ZKuHKt8nwy2vFDggiBfm+oOwZUGDOInSEBvuaG6VCD1ZYkUtPElpxhKdAChu5P0eRUJeDGCSDJqMJvi5P83N7DXLweo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf2Kl9hc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf2Kl9hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781334436; x=1812870436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtNR/AXIc8cH3H0+feKXrvGJy0t9KHmOeOdwGv0I1gw=;
  b=cf2Kl9hcdYttpUHl2Y+v/qXjW90RxHlHBNaGVWgq/Z8Psu2QnL2ZZ0I2
   mG3v1lUz+Uo10vq375XsmhTrU7tQ4lHI/gN9rwfnydOcUhbBfgRo86ByQ
   yEmVp2wFXDIR+uP/8SJmiO2zl7PGlpD5d70UhJBx7Tt5ev0jLQWjas5tu
   yFyiTkR9wTnoAQU/G5A3CXCBsRWQUc0pU1kE9W9MJFous7bw3oAziOaCQ
   ehvofBiaG35V8+NxI5aTCW1jjVAHM0wqjVnbmbF1wLAIXks9a+kUe4Wiv
   fSDRooR9mTRE5R8p8hdQ12zH0EYOQbS7NTOpI1envVI+3SIWxcHEOa7MI
   w==;
X-CSE-ConnectionGUID: v168ElxKRtq51lnHiVjK3A==
X-CSE-MsgGUID: AunxGV5QT86LD6zCXnTZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107593777"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="107593777"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 00:07:15 -0700
X-CSE-ConnectionGUID: V15ALI+nR5++5NpRXZlxgQ==
X-CSE-MsgGUID: skqik96ZT1mtrp8NLfykxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="252109942"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 00:07:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYISV-00000000PlO-07Kc;
	Sat, 13 Jun 2026 07:07:11 +0000
Date: Sat, 13 Jun 2026 15:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.com>, outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: Re: [PATCH v2] udf: validate extent partition references in
 udf_current_aext()
Message-ID: <202606131500.3pJCF54j-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260613/202606131500.3pJCF54j-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131500.3pJCF54j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131500.3pJCF54j-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/udf/inode.c:2154:22: warning: unused variable 'sbi' [-Wunused-variable]
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
