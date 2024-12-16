Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC964F9DA;
	Mon, 16 Dec 2024 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734357914; cv=none; b=Kat1lGjMPdxyrTBKK0IDyt2lDBUvblIkez7CxAV2egz6Gg2UsZRwL7CAfUhfzj9vIcPvGIG5eLJFOQ1wKLQBrV4EA+IitzLikiZmQowXw39zhY+5EnRbc2d0ce6MCvmrMzmcqXVq/OawAyFeeHPLkTbNJ5js14uzr145GwnpQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734357914; c=relaxed/simple;
	bh=+4LrslpdE9aX2c1bQSRIBvG4jbsoB4bBv0RYWzKdtw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQlRAFm+pAGh8NXy8FgJWfLoc6wd+Z182hHdoRemppWP7xeAT2PQsesbRYNjfN/lvZJVzrKEIJkJJb7iYnK0rlW1sjeHLttDI6B2jmIzYyE/erUmWat9dS7VGvePDBimtXWaHURB4VRTtK4QhCHKikcozWM5GHg6HSDCbdQ21/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSXLnU55; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSXLnU55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734357911; x=1765893911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4LrslpdE9aX2c1bQSRIBvG4jbsoB4bBv0RYWzKdtw8=;
  b=JSXLnU55/P/T3hbdyubE9UZg8NXQwcK5Jd2XpLagYTAel+jfiYa87icF
   lqKAtaqH7tmctw+7Kp56asKWo4N8v74MALLpBE8kNQnx3B5R6j/jZGuI+
   g7Gz2UZ++UxuuG5O/rrGsIUgSO1JasxwUWK+ZspUt2JXXzZnt/lBJYf3i
   F8VMDuujWsOzOvOE/jWyT0dTD3L4tK/tFj9hTzVvE3nIdagvVTHNd4oM2
   i6uXnn2ZWJAuyoOlGy/rXDcm5Z8ywE5intH+aVoaG5zP1QWupkTG3o5tz
   ZHTrmUzS6Ogr9bdAx0hL3PkfrKq6lj7OAJzrfUahHlDdxX1PtPfZb0Pvo
   g==;
X-CSE-ConnectionGUID: +kk2gO38Szy+TRb5N9YShg==
X-CSE-MsgGUID: Nv0IAKJVT8iBy/O66VZyWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46152729"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46152729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:05:11 -0800
X-CSE-ConnectionGUID: zT3YDEdaRoWPIyhQgIt0jw==
X-CSE-MsgGUID: 4DHDxzoRTHedPBu352s3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97256512"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Dec 2024 06:05:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNBid-000EFA-1s;
	Mon, 16 Dec 2024 14:05:07 +0000
Date: Mon, 16 Dec 2024 22:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filecmeuqH 13/29]
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c:1970:13: warning: stack frame
 size (1384) exceeds limit (1024) in 'bin_patch_mixed_packed_unpacked_random'
Message-ID: <202412162253.OPrfkMgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filecmeuqH
head:   5725bce709db1c001140d79398581e067e28c031
commit: dd0b6b1f29b92202d03a6d2dd7d65ecead27941a [13/29] firmware: cs_dsp: Add KUnit testing of bin file download
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241216/202412162253.OPrfkMgA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412162253.OPrfkMgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412162253.OPrfkMgA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/cirrus/test/cs_dsp_test_bin.c:1970:13: warning: stack frame size (1384) exceeds limit (1024) in 'bin_patch_mixed_packed_unpacked_random' [-Wframe-larger-than]
    1970 | static void bin_patch_mixed_packed_unpacked_random(struct kunit *test)
         |             ^
   1 warning generated.


vim +/bin_patch_mixed_packed_unpacked_random +1970 drivers/firmware/cirrus/test/cs_dsp_test_bin.c

  1963	
  1964	/*
  1965	 * bin file that contains a mix of packed and unpacked words.
  1966	 * payloads are in random offset order. Offsets that are on a packed boundary
  1967	 * are written as a packed block. Offsets that are not on a packed boundary
  1968	 * are written as a single unpacked word.
  1969	 */
> 1970	static void bin_patch_mixed_packed_unpacked_random(struct kunit *test)
  1971	{
  1972		struct cs_dsp_test *priv = test->priv;
  1973		const struct bin_test_param *param = test->param_value;
  1974		static const u8 offset_words[] = {
  1975			58, 68, 50, 10, 44, 17, 74, 36,  8,  7, 49, 11, 78, 57, 65, 2,
  1976			48, 38, 22, 70, 77, 21, 61, 56, 75, 34, 27,  3, 31, 20,	43, 63,
  1977			 5, 30, 32, 25, 33, 79, 29,  0,	37, 60, 69, 52, 13, 12, 24, 26,
  1978			 4, 51, 76, 72, 16,  6, 39, 62, 15, 41, 28, 73, 53, 40, 45, 54,
  1979			14, 55, 46, 66, 64, 59, 23,  9, 67, 47, 19, 71, 35, 18, 42,  1,
  1980		};
  1981		u32 packed_payload[80][3];
  1982		u32 unpacked_payload[80];
  1983		u32 readback[3];
  1984		unsigned int alg_base_words, patch_pos_words;
  1985		unsigned int alg_base_in_packed_regs, patch_pos_in_packed_regs;
  1986		unsigned int reg_addr, payload_offset;
  1987		int unpacked_mem_type = cs_dsp_mock_packed_to_unpacked_mem_type(param->mem_type);
  1988		struct firmware *fw;
  1989		int i;
  1990	
  1991		get_random_bytes(packed_payload, sizeof(packed_payload));
  1992		get_random_bytes(unpacked_payload, sizeof(unpacked_payload));
  1993	
  1994		/* Create a patch entry for every offset in offset_words[] */
  1995		for (i = 0; i < ARRAY_SIZE(offset_words); ++i) {
  1996			alg_base_words = cs_dsp_mock_xm_header_get_alg_base_in_words(priv,
  1997									bin_test_mock_algs[0].id,
  1998									param->mem_type);
  1999			/*
  2000			 * If the offset is on a packed boundary use a packed payload else
  2001			 * use an unpacked word
  2002			 */
  2003			patch_pos_words = alg_base_words + offset_words[i];
  2004			if ((patch_pos_words % 4) == 0) {
  2005				alg_base_in_packed_regs = _num_words_to_num_packed_regs(alg_base_words);
  2006				patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
  2007				payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
  2008				cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
  2009							  bin_test_mock_algs[0].id,
  2010							  bin_test_mock_algs[0].ver,
  2011							  param->mem_type,
  2012							  payload_offset,
  2013							  packed_payload[i],
  2014							  sizeof(packed_payload[i]));
  2015			} else {
  2016				payload_offset = offset_words[i] * 4;
  2017				cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
  2018							  bin_test_mock_algs[0].id,
  2019							  bin_test_mock_algs[0].ver,
  2020							  unpacked_mem_type,
  2021							  payload_offset,
  2022							  &unpacked_payload[i],
  2023							  sizeof(unpacked_payload[i]));
  2024			}
  2025		}
  2026	
  2027		fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
  2028		KUNIT_ASSERT_EQ(test,
  2029				cs_dsp_power_up(priv->dsp, priv->local->wmfw, "mock_wmfw",
  2030						fw, "mock_bin", "misc"),
  2031				0);
  2032	
  2033		/*
  2034		 * Readback the packed registers that should have been written.
  2035		 * Place the values into the expected location in readback[] so
  2036		 * that the content of readback[] should match packed_payload[]
  2037		 */
  2038		for (i = 0; i < ARRAY_SIZE(offset_words); ++i) {
  2039			alg_base_words = cs_dsp_mock_xm_header_get_alg_base_in_words(priv,
  2040									bin_test_mock_algs[0].id,
  2041									param->mem_type);
  2042			patch_pos_words = alg_base_words + offset_words[i];
  2043	
  2044			/* Skip if the offset is not on a packed boundary */
  2045			if ((patch_pos_words % 4) != 0)
  2046				continue;
  2047	
  2048			patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
  2049	
  2050			reg_addr = cs_dsp_mock_base_addr_for_mem(priv, param->mem_type) +
  2051				   (patch_pos_in_packed_regs * 4);
  2052	
  2053			memset(readback, 0, sizeof(readback));
  2054			KUNIT_EXPECT_EQ(test,
  2055					regmap_raw_read(priv->dsp->regmap, reg_addr, readback,
  2056							sizeof(readback)),
  2057					0);
  2058			KUNIT_EXPECT_MEMEQ(test, readback, packed_payload[i], sizeof(packed_payload[i]));
  2059	
  2060			/* Drop expected writes from the cache */
  2061			cs_dsp_mock_regmap_drop_bytes(priv, reg_addr, sizeof(packed_payload[i]));
  2062		}
  2063	
  2064		/*
  2065		 * Readback the unpacked registers that should have been written.
  2066		 * Place the values into the expected location in readback[] so
  2067		 * that the content of readback[] should match unpacked_payload[]
  2068		 */
  2069		for (i = 0; i < ARRAY_SIZE(offset_words); ++i) {
  2070			alg_base_words = cs_dsp_mock_xm_header_get_alg_base_in_words(priv,
  2071									bin_test_mock_algs[0].id,
  2072									unpacked_mem_type);
  2073	
  2074			patch_pos_words = alg_base_words + offset_words[i];
  2075	
  2076			/* Skip if the offset is on a packed boundary */
  2077			if ((patch_pos_words % 4) == 0)
  2078				continue;
  2079	
  2080			reg_addr = cs_dsp_mock_base_addr_for_mem(priv, unpacked_mem_type) +
  2081				   ((patch_pos_words) * 4);
  2082	
  2083			readback[0] = 0;
  2084			KUNIT_EXPECT_EQ(test,
  2085					regmap_raw_read(priv->dsp->regmap, reg_addr,
  2086							&readback[0], sizeof(readback[0])),
  2087					0);
  2088			KUNIT_EXPECT_EQ(test, readback[0], unpacked_payload[i]);
  2089	
  2090			/* Drop expected writes from the cache */
  2091			cs_dsp_mock_regmap_drop_bytes(priv, reg_addr, sizeof(unpacked_payload[i]));
  2092		}
  2093	
  2094		/* Drop expected writes and the cache should then be clean */
  2095		cs_dsp_mock_xm_header_drop_from_regmap_cache(priv);
  2096		KUNIT_EXPECT_FALSE(test, cs_dsp_mock_regmap_is_dirty(priv, true));
  2097	}
  2098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
