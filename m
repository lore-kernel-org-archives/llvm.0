Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15626E707;
	Tue, 19 Aug 2025 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755618623; cv=none; b=ZNftV6C9xsVVxOoozTKqdrqq/kutr+VszIf7cAGMbkg7hGKcnIJSPN1uFcVGp8U9ICsWSBRynbrK4y/uJ5RrEhFOYShTjBlaZXhl+KK8iDjoaFlgC9FYKoLvkqKXBTXZeGXVIYPacuCcNJGe5chRuP5DsumKsaBxjtrUxzsdxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755618623; c=relaxed/simple;
	bh=CD9EiwctYW2UDeDE3G9iG8y4pjzP6WYFZ5IgcUilY2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIrbl6C2d4UhD6GRx2BqsSFB/hqN9Ofp2MCvUtQ04R8BQgp+tpvF7gZ7yPmSrYsSGYeAetnMA6JHz3JC9E4v0ez17xxB5uGMKCrUdGFkTxjVon5WdqQ6hSQtG/TDJG2xM1WIbvr1vWnTzYbyvEMmY4a3KIRFpz+qvR/NIsPH1WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmz3HugJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmz3HugJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755618621; x=1787154621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CD9EiwctYW2UDeDE3G9iG8y4pjzP6WYFZ5IgcUilY2s=;
  b=Zmz3HugJPZ46hsRz9SABAp8LrMOeLtZWD9G2LZYSToHLyD81y8KY/XBE
   RHdkDOO2fpyoHShSULwE7SLA0vgaVbTlG/x685QnzyzBtX598JCGbnZc9
   tZI6YKOH9ChCnLL9d7spaifnNfKJN4A4SCHBWOtxInzXTRX27DLmZCacX
   sSru/obNqWuQvB3Z2LOfG/AGNZwsVAm9ZA8s9JV3MvQCcBC8JS0AtjSg5
   okunMIS8iFxeWb5Q+viEnKiFBcn3016fzPLAJw7PtoFpCJVtuXlrYYtSU
   RvQDUYTHuiV1eNuGkKPzQqhYg+jbb5iQokODe+Z7m8JLR1eJjs1HD9eb2
   A==;
X-CSE-ConnectionGUID: sXIAwatSQ2i0rdUcztQ8ow==
X-CSE-MsgGUID: 9r4ku5aGTGa7jcayKbEm+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68965453"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="68965453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 08:50:21 -0700
X-CSE-ConnectionGUID: jDJf6pnjRgeJZ3A63TwpVw==
X-CSE-MsgGUID: Ctlt1x80RU+PzcD5QcPIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="173124011"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2025 08:50:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoObJ-000H4t-1Y;
	Tue, 19 Aug 2025 15:50:17 +0000
Date: Tue, 19 Aug 2025 23:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next v2 3/3] netfilter: nft_set_pipapo: Use nested-BH
 locking for nft_pipapo_scratch
Message-ID: <202508192340.c0ABcR8U-lkp@intel.com>
References: <20250815160937.1192748-4-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815160937.1192748-4-bigeasy@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on linus/master v6.17-rc2 next-20250819]
[cannot apply to nf-next/master horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/netfilter-nft_set_pipapo-Store-real-pointer-adjust-later/20250816-001334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20250815160937.1192748-4-bigeasy%40linutronix.de
patch subject: [PATCH nf-next v2 3/3] netfilter: nft_set_pipapo: Use nested-BH locking for nft_pipapo_scratch
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250819/202508192340.c0ABcR8U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192340.c0ABcR8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508192340.c0ABcR8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo_avx2.c:1176:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'const struct nft_set_ext *' [-Wnon-literal-null-conversion]
    1176 |                 return false;
         |                        ^~~~~
   1 warning generated.


vim +1176 net/netfilter/nft_set_pipapo_avx2.c

  1134	
  1135	/**
  1136	 * nft_pipapo_avx2_lookup() - Lookup function for AVX2 implementation
  1137	 * @net:	Network namespace
  1138	 * @set:	nftables API set representation
  1139	 * @key:	nftables API element representation containing key data
  1140	 *
  1141	 * For more details, see DOC: Theory of Operation in nft_set_pipapo.c.
  1142	 *
  1143	 * This implementation exploits the repetitive characteristic of the algorithm
  1144	 * to provide a fast, vectorised version using the AVX2 SIMD instruction set.
  1145	 *
  1146	 * Return: true on match, false otherwise.
  1147	 */
  1148	const struct nft_set_ext *
  1149	nft_pipapo_avx2_lookup(const struct net *net, const struct nft_set *set,
  1150			       const u32 *key)
  1151	{
  1152		struct nft_pipapo *priv = nft_set_priv(set);
  1153		const struct nft_set_ext *ext = NULL;
  1154		struct nft_pipapo_scratch *scratch;
  1155		u8 genmask = nft_genmask_cur(net);
  1156		const struct nft_pipapo_match *m;
  1157		const struct nft_pipapo_field *f;
  1158		unsigned long *res, *fill, *map;
  1159		const u8 *rp = (const u8 *)key;
  1160		bool map_index;
  1161		int i;
  1162	
  1163		local_bh_disable();
  1164	
  1165		if (unlikely(!irq_fpu_usable())) {
  1166			ext = nft_pipapo_lookup(net, set, key);
  1167	
  1168			local_bh_enable();
  1169			return ext;
  1170		}
  1171	
  1172		m = rcu_dereference(priv->match);
  1173		scratch = *raw_cpu_ptr(m->scratch);
  1174		if (unlikely(!scratch)) {
  1175			local_bh_enable();
> 1176			return false;
  1177		}
  1178		__local_lock_nested_bh(&scratch->bh_lock);
  1179		/* Note that we don't need a valid MXCSR state for any of the
  1180		 * operations we use here, so pass 0 as mask and spare a LDMXCSR
  1181		 * instruction.
  1182		 */
  1183		kernel_fpu_begin_mask(0);
  1184	
  1185		map_index = scratch->map_index;
  1186		map = NFT_PIPAPO_LT_ALIGN(&scratch->__map[0]);
  1187		res  = map + (map_index ? m->bsize_max : 0);
  1188		fill = map + (map_index ? 0 : m->bsize_max);
  1189	
  1190		pipapo_resmap_init_avx2(m, res);
  1191	
  1192		nft_pipapo_avx2_prepare();
  1193	
  1194	next_match:
  1195		nft_pipapo_for_each_field(f, i, m) {
  1196			bool last = i == m->field_count - 1, first = !i;
  1197			int ret = 0;
  1198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
