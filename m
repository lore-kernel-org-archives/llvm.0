Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C066A29;
	Wed, 19 Jun 2024 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813288; cv=none; b=urLnqcoRNtNgoXSNjfPivikEYyCOyllPtOy4XkmwpSRJK+P+BB2tAaB2v5rTEnDB9RaXuyO7jNq6flSZ1LHKcF1agfqRL4cK5yyBVX7iF9WYiAYmmyuwJ8VqDnItx64MZfEz2FUVuAQ3g/+tNlOiW8fqKB16EgS7KzXwQVAEH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813288; c=relaxed/simple;
	bh=iphLnCoBJGQ9qBV5Q4VL0kktTHmuiVA7bZG54ugYfcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdHh1IyyxxbFln3IHdO4XsypqRP9fghPpJmJhNsuIwCkpKfpFN0RiZ+oWjKPDbsSM7Ey2r0ahr5YtPUq6ECKC4N4ziVF8YPjexXmFYhOgBp3ybHhEDWXe2Jk4aAydRs7xPoFdwjGY45Qe3UOQgNYTqRazq1sagJ7QNSpeYftht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BS/n/n6E; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BS/n/n6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718813286; x=1750349286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iphLnCoBJGQ9qBV5Q4VL0kktTHmuiVA7bZG54ugYfcM=;
  b=BS/n/n6ETQYzwipl5gayv0QqLD3wjjIij8EvNs8tqOKtB6KJV/O7KDvL
   rynZ1I0GXO+DdpSK9PUazr+MZyerO9XNWR9Uwb5i+lbOz8xg/WFUd/825
   juK9IYBrlw6yMGvttSNKBgT0B4wn0o1fKb19e+h3YtZgJWcJmXxkVGoeF
   rqorEi5ir6IgBnJm4YQfesNnY1TMihzqz5qrrHxj/Lqt/Ss1QSo8mVVhy
   SAV+IGdSBGoz3s+8S/Bw1B6+qHw2vrHJ52bfvEOU4MFyRL3VOQXoqAGVY
   5M396n5LFLsR4eNtK44rHGYrzXe134apCG4Mvl/UCtw2YyMsC9t5/ovre
   w==;
X-CSE-ConnectionGUID: PRi5WV2zQ2SZiUKfwzNW6Q==
X-CSE-MsgGUID: aRCYa6vsQZSJsvygmZf0Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18675248"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="18675248"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 09:08:05 -0700
X-CSE-ConnectionGUID: 7tCgh0kqTVG2nIyxPVvMOA==
X-CSE-MsgGUID: K2MS9UeSTae+NRRKgzCZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="42082640"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 09:08:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJxqr-0006jr-1p;
	Wed, 19 Jun 2024 16:08:01 +0000
Date: Thu, 20 Jun 2024 00:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file0IqEIN 13/14] sound/soc/codecs/rt1318.c:785:5:
 warning: no previous prototype for function 'rt1318_pll_calc'
Message-ID: <202406200032.k77XsxDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file0IqEIN
head:   04c200922d911f7a33febc0e7991f3a2efd856ad
commit: 48ed4d2435aa749a8d59fd7543313d51d0800175 [13/14] ASoC: rt1318: Add RT1318 audio amplifier driver
config: x86_64-buildonly-randconfig-005-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200032.k77XsxDK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200032.k77XsxDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200032.k77XsxDK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt1318.c:785:5: warning: no previous prototype for function 'rt1318_pll_calc' [-Wmissing-prototypes]
     785 | int rt1318_pll_calc(const unsigned int freq_in,
         |     ^
   sound/soc/codecs/rt1318.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | int rt1318_pll_calc(const unsigned int freq_in,
         | ^
         | static 
   sound/soc/codecs/rt1318.c:1340:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
    1340 |         .probe_new = rt1318_i2c_probe,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/rt1318_pll_calc +785 sound/soc/codecs/rt1318.c

   784	
 > 785	int rt1318_pll_calc(const unsigned int freq_in,
   786		const unsigned int freq_out, struct rt1318_pll_code *pll_code)
   787	{
   788		int max_n = RT1318_PLL_N_MAX, max_m = RT1318_PLL_M_MAX;
   789		int i, k, red, n_t, pll_out, in_t, out_t;
   790		int n = 0, m = 0, m_t = 0;
   791		int red_t = abs(freq_out - freq_in);
   792		bool m_bypass = false, k_bypass = false;
   793	
   794		if (RT1318_PLL_INP_MAX < freq_in || RT1318_PLL_INP_MIN > freq_in)
   795			return -EINVAL;
   796	
   797		for (i = 0; i < ARRAY_SIZE(pll_preset_table); i++) {
   798			if (freq_in == pll_preset_table[i].pll_in &&
   799				freq_out == pll_preset_table[i].pll_out) {
   800				k = pll_preset_table[i].k;
   801				m = pll_preset_table[i].m;
   802				n = pll_preset_table[i].n;
   803				m_bypass = pll_preset_table[i].m_bp;
   804				k_bypass = pll_preset_table[i].k_bp;
   805				goto code_find;
   806			}
   807		}
   808	
   809		k = 100000000 / freq_out - 2;
   810		if (k > RT1318_PLL_K_MAX)
   811			k = RT1318_PLL_K_MAX;
   812		if (k < 0) {
   813			k = 0;
   814			k_bypass = true;
   815		}
   816		for (n_t = 0; n_t <= max_n; n_t++) {
   817			in_t = freq_in / (k_bypass ? 1 : (k + 2));
   818			pll_out = freq_out / (n_t + 2);
   819			if (in_t < 0)
   820				continue;
   821			if (in_t == pll_out) {
   822				m_bypass = true;
   823				n = n_t;
   824				goto code_find;
   825			}
   826			red = abs(in_t - pll_out);
   827			if (red < red_t) {
   828				m_bypass = true;
   829				n = n_t;
   830				m = m_t;
   831				if (red == 0)
   832					goto code_find;
   833				red_t = red;
   834			}
   835			for (m_t = 0; m_t <= max_m; m_t++) {
   836				out_t = in_t / (m_t + 2);
   837				red = abs(out_t - pll_out);
   838				if (red < red_t) {
   839					m_bypass = false;
   840					n = n_t;
   841					m = m_t;
   842					if (red == 0)
   843						goto code_find;
   844					red_t = red;
   845				}
   846			}
   847		}
   848		pr_debug("Only get approximation about PLL\n");
   849	
   850	code_find:
   851	
   852		pll_code->m_bp = m_bypass;
   853		pll_code->k_bp = k_bypass;
   854		pll_code->m_code = m;
   855		pll_code->n_code = n;
   856		pll_code->k_code = k;
   857		return 0;
   858	}
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
