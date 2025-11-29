Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D626738D;
	Sat, 29 Nov 2025 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435504; cv=none; b=YvcQVe8HwopS6LYFq3Z+BlBzFMS7oLY9/ZsWHhXeBdNEoZl5AghOcAI6bawkWOHLq6K98ylCI6ae2u7KcSqQ4et4+1gKxaQNaA6UNzZfECUFX76Dbrs9NG+TebZJuQowSd8oEsSGZ7bzVDYf0kYFVfpZrKP02sgy7sewVShHa4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435504; c=relaxed/simple;
	bh=pW5UrQwSVFwM/jP1/sOOsumOV5VJnPtB2fuzc/HkqS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZkai6O98hgdvJVo0jmWQfjPLXbKKVLwaxjVARJg1+Xy2yZR13YZhkIaIVuC0raGmcaFrM2hZ8EODtVq2SOsV0lTOpFKjGW0ca9KkBkwzL9+M9hRDxybnWFwSzua5bkidiJKguEPkD8tjQLczrVdSedpbl0OkOfQVjR2h2WSuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdVTcbS3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdVTcbS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764435502; x=1795971502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pW5UrQwSVFwM/jP1/sOOsumOV5VJnPtB2fuzc/HkqS8=;
  b=cdVTcbS3Q5WjuJXwzmbiaFp4Moz/W7jmW3aEHr1L4JvsCyLLVjEhelEl
   TAiC9aTqYSnCBrwo4hTZWJVzXRevOZ78ByCtRBladVjUxFwxT/OW0pmX3
   0k7J4Fmeg6OHPBnrprO90ShfR+RkeE4n3tNd4qChn7FPa9hQADbjTiiDR
   /ndo56eeg+N7/dBxVegaPQ6bly/rcz7neG0uZ2wwbWMeu9+zIgkS9ijks
   89CYyGt1Zian7mgyU380cWV6SoZR4JJ942uFdGyyV4Mpg08H/e2KPe3HJ
   Dj1PbW1H46jJvJ229kDAdwIbCs8+URijh0VZCs8c9mWa5LDOMI0yNhXD/
   Q==;
X-CSE-ConnectionGUID: 5QBHwfc+Raau6WYHmMcdfA==
X-CSE-MsgGUID: fP7c7nJiScm8PulHhU2YZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="89075318"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="89075318"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 08:58:22 -0800
X-CSE-ConnectionGUID: If1lwWeQRb+7b+R4MEMF3w==
X-CSE-MsgGUID: bFijp0h0RleO5AY6Teeh3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="198619031"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2025 08:58:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPOH4-000000007Ov-0fRZ;
	Sat, 29 Nov 2025 16:58:18 +0000
Date: Sun, 30 Nov 2025 00:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/16] crypto: qat - add support for zstd
Message-ID: <202511300007.jf6qGfjm-lkp@intel.com>
References: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>

Hi Giovanni,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ebbdf6466b30e3b37f3b360826efd21f0633fb9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Giovanni-Cabiddu/crypto-zstd-fix-double-free-in-per-CPU-stream-cleanup/20251128-222112
base:   ebbdf6466b30e3b37f3b360826efd21f0633fb9e
patch link:    https://lore.kernel.org/r/20251128191531.1703018-15-giovanni.cabiddu%40intel.com
patch subject: [RFC PATCH 14/16] crypto: qat - add support for zstd
config: i386-buildonly-randconfig-003 (https://download.01.org/0day-ci/archive/20251130/202511300007.jf6qGfjm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300007.jf6qGfjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511300007.jf6qGfjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:104:17: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                                                                      ~~~
         |                                                                                      %zu
     104 |                                          __func__, seqs_idx, out_seqs_capacity, lz4s_buff_size);
         |                                                    ^~~~~~~~
   include/linux/printk.h:636:26: note: expanded from macro 'pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:104:27: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                                                                                             ~~~
         |                                                                                                             %zu
     104 |                                          __func__, seqs_idx, out_seqs_capacity, lz4s_buff_size);
         |                                                              ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:636:26: note: expanded from macro 'pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 warnings generated.


vim +104 drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c

    14	
    15	/*
    16	 * Implement the same algorithm as the QAT ZSTD sequence producer plugin,
    17	 * to decode LZ4s formatted data into ZSTD_Sequence format.
    18	 */
    19	size_t qat_alg_dec_lz4s(ZSTD_Sequence *out_seqs, size_t out_seqs_capacity,
    20				unsigned char *lz4s_buff, unsigned int lz4s_buff_size,
    21				unsigned char *literals, unsigned int *lit_len)
    22	{
    23		unsigned char *end_ip = lz4s_buff + lz4s_buff_size;
    24		unsigned int hist_literal_len = 0;
    25		unsigned char *ip = lz4s_buff;
    26		size_t seqs_idx = 0;
    27	
    28		*lit_len = 0;
    29	
    30		if (!lz4s_buff_size)
    31			return 0;
    32	
    33		while (ip < end_ip) {
    34			size_t length = 0;
    35			size_t offset = 0;
    36			size_t literal_len = 0, match_len = 0;
    37	
    38			/* get literal length */
    39			unsigned const token = *ip++;
    40	
    41			length = token >> ML_BITS;
    42			if (length == RUN_MASK) {
    43				unsigned int s;
    44	
    45				do {
    46					s = *ip++;
    47					length += s;
    48				} while (s == 255);
    49			}
    50	
    51			literal_len = length;
    52	
    53			{
    54				u8 *start = ip;
    55				u8 *dest = literals;
    56				u8 *dest_end = literals + length;
    57	
    58				do {
    59					__builtin_memcpy(dest, start, QAT_ZSTD_LIT_COPY_LEN);
    60					dest += QAT_ZSTD_LIT_COPY_LEN;
    61					start += QAT_ZSTD_LIT_COPY_LEN;
    62				} while (dest < dest_end);
    63			}
    64	
    65			literals += length;
    66			*lit_len += length;
    67	
    68			ip += length;
    69			if (ip == end_ip) { /* Meet the end of the LZ4 sequence */
    70				literal_len += hist_literal_len;
    71				out_seqs[seqs_idx].litLength = literal_len;
    72				out_seqs[seqs_idx].offset = offset;
    73				out_seqs[seqs_idx].matchLength = match_len;
    74				break;
    75			}
    76	
    77			/* get matchPos */
    78			offset = le16_to_cpu(*(__le16 *)ip);
    79			ip += 2;
    80	
    81			/* get match length */
    82			length = token & ML_MASK;
    83			if (length == ML_MASK) {
    84				unsigned int s;
    85	
    86				do {
    87					s = *ip++;
    88					length += s;
    89				} while (s == 255);
    90			}
    91			if (length != 0) {
    92				length += LZ4MINMATCH;
    93				match_len = (unsigned short)length;
    94				literal_len += hist_literal_len;
    95	
    96				/* update ZSTD_Sequence */
    97				out_seqs[seqs_idx].offset = offset;
    98				out_seqs[seqs_idx].litLength = literal_len;
    99				out_seqs[seqs_idx].matchLength = match_len;
   100				hist_literal_len = 0;
   101				++seqs_idx;
   102				if (seqs_idx >= (out_seqs_capacity - 1)) {
   103					pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
 > 104						 __func__, seqs_idx, out_seqs_capacity, lz4s_buff_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
