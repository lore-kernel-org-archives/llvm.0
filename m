Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2741B37D;
	Wed, 29 Jul 2026 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310563; cv=none; b=d+y7OOHKtqvBDCKGxF54V2Dk3LVmjvW+TupzpV5itlwGZfllSmPbUUpmMnQj0R0dKdcUWNP3b32kSd66mjO6vUdg3mJxAihdaaBxZAsYGkcoFYST84rd9C+i0JPZj2pzqYHqieUhAm6C3E88mIrCPZUnVBCWegG1bDcj7A2ABG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310563; c=relaxed/simple;
	bh=TsjGW0UuMUcn5jkr82soNCNPgOetVobgpzQlm6cDbDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTMeWqSU6gaY+Vv60VDyQA/ZOew9K3JS+nq2iDR0h4a9POBdzGEAoc1LW4OfKeCU6HvEhbvPLZhy6zmJiW6yB9pa86LIuBPCgPXEIbNuX/l9SYtJ2eh01o7c4sR6MC8Eh5Z5/4k8Rls/DZeZ1Wox/kqEADk3VIDD9s3dHrPmx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjCTzEn3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjCTzEn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785310534; x=1816846534;
  h=date:from:to:cc:subject:message-id;
  bh=TsjGW0UuMUcn5jkr82soNCNPgOetVobgpzQlm6cDbDk=;
  b=jjCTzEn3Z2lr89SbxQk+33nfIubz0nJaSeMAwKBfRhOM/q1/q9e8hrhm
   MbuMWsYldLHYXQ2lKDWWV9gIRamesd3AcyaRksAPVT7RiHQ0cRTFfGadE
   JRQdvol1qilax+JzXmrZx+GWv+hITpPJB+ojt6Bilkxv9N3lCOTrHEOOO
   /Bdoh2douGRiWIGFM58WkmGf8vjQmGtp77npg22InFyFt3KIEmGCMp4ha
   +uEjvVcKI6CpQ025PWhmzM0674NVef4Yu7kcd5eAnZ4qiSzQku0PdriZE
   fALOkX1/sHmK7NaEfAvPfP5J/K2hAQy3yCybOZ6VnSkfed/XTk0C7QSLG
   g==;
X-CSE-ConnectionGUID: xcRySan2SoSL5srQENkrxQ==
X-CSE-MsgGUID: ngc1Y/wKSp6aci5MDZs+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97420289"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="97420289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:35:29 -0700
X-CSE-ConnectionGUID: CHnG8Hs4Rmejx/ISVeq/+A==
X-CSE-MsgGUID: 9mD7SVvgTnC6DAzcSCKnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="264217244"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2026 00:35:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woyp2-0000000026o-0cX1;
	Wed, 29 Jul 2026 07:35:24 +0000
Date: Wed, 29 Jul 2026 09:34:41 +0200
From: kernel test robot <lkp@intel.com>
To: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Rohan G Thomas <rohan.g.thomas@altera.com>
Subject: include/linux/bitfield.h:221:3: error: call to '__bad_mask'
 declared with 'error' attribute: bad bitfield mask
Message-ID: <202607290915.ZeI9TCug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/muhammad-nazim-amirul-nazle-asmade-altera-com/net-stmmac-fpe-Enforce-pmac_enabled-in-set_mm-and-keep-it-on-at-init/20260729-100008
head:   8a04b4757aed73457fdc91c3f61946a624832ba6
commit: 8a04b4757aed73457fdc91c3f61946a624832ba6 net: stmmac: fpe: Move fprq configuration to stmmac_fpe_configure_pmac()
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260729/202607290915.ZeI9TCug-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290915.ZeI9TCug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290915.ZeI9TCug-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:6:
   In file included from drivers/net/ethernet/stmicro/stmmac/stmmac.h:17:
   In file included from include/linux/stmmac.h:16:
   In file included from include/linux/phylink.h:4:
   In file included from include/linux/phy.h:20:
   In file included from include/linux/mdio.h:10:
>> include/linux/bitfield.h:221:3: error: call to '__bad_mask' declared with 'error' attribute: bad bitfield mask
     221 |                 __bad_mask();
         |                 ^
>> include/linux/bitfield.h:221:3: error: call to '__bad_mask' declared with 'error' attribute: bad bitfield mask
   2 errors generated.


vim +221 include/linux/bitfield.h

e2192de59e457a Johannes Berg      2023-01-18  142  
e2192de59e457a Johannes Berg      2023-01-18  143  /**
e2192de59e457a Johannes Berg      2023-01-18  144   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457a Johannes Berg      2023-01-18  145   * @_mask: shifted mask defining the field's length and position
e2192de59e457a Johannes Berg      2023-01-18  146   * @_val:  value to put in the field
e2192de59e457a Johannes Berg      2023-01-18  147   *
e2192de59e457a Johannes Berg      2023-01-18  148   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457a Johannes Berg      2023-01-18  149   * be combined with other fields of the bitfield using logical OR.
e2192de59e457a Johannes Berg      2023-01-18  150   *
e2192de59e457a Johannes Berg      2023-01-18  151   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457a Johannes Berg      2023-01-18  152   * be used in initializers. Error checking is less comfortable for this
e2192de59e457a Johannes Berg      2023-01-18  153   * version, and non-constant masks cannot be used.
e2192de59e457a Johannes Berg      2023-01-18  154   */
e2192de59e457a Johannes Berg      2023-01-18  155  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457a Johannes Berg      2023-01-18  156  	(								\
e2192de59e457a Johannes Berg      2023-01-18  157  		/* mask must be non-zero */				\
e2192de59e457a Johannes Berg      2023-01-18  158  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457a Johannes Berg      2023-01-18  159  		/* check if value fits */				\
e2192de59e457a Johannes Berg      2023-01-18  160  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457a Johannes Berg      2023-01-18  161  		/* check if mask is contiguous */			\
e2192de59e457a Johannes Berg      2023-01-18  162  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457a Johannes Berg      2023-01-18  163  		/* and create the value */				\
e2192de59e457a Johannes Berg      2023-01-18  164  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457a Johannes Berg      2023-01-18  165  	)
e2192de59e457a Johannes Berg      2023-01-18  166  
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  167  /**
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  168   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  169   * @_mask: shifted mask defining the field's length and position
7240767450d6d8 Masahiro Yamada    2017-10-03  170   * @_reg:  value of entire bitfield
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  171   *
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  172   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  173   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  174   */
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  175  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  176  	({								\
2a6c045640c38a Geert Uytterhoeven 2025-11-06  177  		__BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");	\
2a6c045640c38a Geert Uytterhoeven 2025-11-06  178  		__FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  179  	})
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  180  
2c3f0541b99c60 Yury Norov         2026-04-27  181  /**
2c3f0541b99c60 Yury Norov         2026-04-27  182   * FIELD_GET_SIGNED() - extract a signed bitfield element
2c3f0541b99c60 Yury Norov         2026-04-27  183   * @mask: shifted mask defining the field's length and position
2c3f0541b99c60 Yury Norov         2026-04-27  184   * @reg:  value of entire bitfield
2c3f0541b99c60 Yury Norov         2026-04-27  185   *
2c3f0541b99c60 Yury Norov         2026-04-27  186   * Returns the sign-extended field specified by @_mask from the
2c3f0541b99c60 Yury Norov         2026-04-27  187   * bitfield passed in as @reg by masking and shifting it down.
2c3f0541b99c60 Yury Norov         2026-04-27  188   */
2c3f0541b99c60 Yury Norov         2026-04-27  189  #define FIELD_GET_SIGNED(mask, reg)					\
2c3f0541b99c60 Yury Norov         2026-04-27  190  	({								\
2c3f0541b99c60 Yury Norov         2026-04-27  191  		__BF_FIELD_CHECK(mask, reg, 0U, "FIELD_GET_SIGNED: ");	\
2c3f0541b99c60 Yury Norov         2026-04-27  192  		 ((__signed_scalar_typeof(mask))			\
2c3f0541b99c60 Yury Norov         2026-04-27  193  		  (((long long)(reg) << __builtin_clzll(mask)) >>	\
2c3f0541b99c60 Yury Norov         2026-04-27  194  		   (__builtin_clzll(mask) + __builtin_ctzll(mask))));	\
2c3f0541b99c60 Yury Norov         2026-04-27  195  	})
2c3f0541b99c60 Yury Norov         2026-04-27  196  
a256ae22570ee4 Luo Jie            2025-04-17  197  /**
a256ae22570ee4 Luo Jie            2025-04-17  198   * FIELD_MODIFY() - modify a bitfield element
a256ae22570ee4 Luo Jie            2025-04-17  199   * @_mask: shifted mask defining the field's length and position
a256ae22570ee4 Luo Jie            2025-04-17  200   * @_reg_p: pointer to the memory that should be updated
a256ae22570ee4 Luo Jie            2025-04-17  201   * @_val: value to store in the bitfield
a256ae22570ee4 Luo Jie            2025-04-17  202   *
a256ae22570ee4 Luo Jie            2025-04-17  203   * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
a256ae22570ee4 Luo Jie            2025-04-17  204   * by replacing them with the bitfield value passed in as @_val.
a256ae22570ee4 Luo Jie            2025-04-17  205   */
a256ae22570ee4 Luo Jie            2025-04-17  206  #define FIELD_MODIFY(_mask, _reg_p, _val)						\
a256ae22570ee4 Luo Jie            2025-04-17  207  	({										\
a256ae22570ee4 Luo Jie            2025-04-17  208  		typecheck_pointer(_reg_p);						\
a256ae22570ee4 Luo Jie            2025-04-17  209  		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
a256ae22570ee4 Luo Jie            2025-04-17  210  		*(_reg_p) &= ~(_mask);							\
a256ae22570ee4 Luo Jie            2025-04-17  211  		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
a256ae22570ee4 Luo Jie            2025-04-17  212  	})
a256ae22570ee4 Luo Jie            2025-04-17  213  
e7d4a95da86e0b Johannes Berg      2018-06-20  214  extern void __compiletime_error("value doesn't fit into mask")
00b0c9b82663ac Al Viro            2017-12-14  215  __field_overflow(void);
00b0c9b82663ac Al Viro            2017-12-14  216  extern void __compiletime_error("bad bitfield mask")
00b0c9b82663ac Al Viro            2017-12-14  217  __bad_mask(void);
00b0c9b82663ac Al Viro            2017-12-14  218  static __always_inline u64 field_multiplier(u64 field)
00b0c9b82663ac Al Viro            2017-12-14  219  {
00b0c9b82663ac Al Viro            2017-12-14  220  	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
00b0c9b82663ac Al Viro            2017-12-14 @221  		__bad_mask();
00b0c9b82663ac Al Viro            2017-12-14  222  	return field & -field;
00b0c9b82663ac Al Viro            2017-12-14  223  }
00b0c9b82663ac Al Viro            2017-12-14  224  static __always_inline u64 field_mask(u64 field)
00b0c9b82663ac Al Viro            2017-12-14  225  {
00b0c9b82663ac Al Viro            2017-12-14  226  	return field / field_multiplier(field);
00b0c9b82663ac Al Viro            2017-12-14  227  }
e31a50162feb35 Alex Elder         2020-03-12  228  #define field_max(field)	((typeof(field))field_mask(field))
00b0c9b82663ac Al Viro            2017-12-14  229  #define ____MAKE_OP(type,base,to,from)					\
e2b02d382ae0cb Ben Horgan         2025-07-09  230  static __always_inline __##type __must_check type##_encode_bits(base v, base field)	\
00b0c9b82663ac Al Viro            2017-12-14  231  {									\
e7d4a95da86e0b Johannes Berg      2018-06-20  232  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
00b0c9b82663ac Al Viro            2017-12-14  233  		__field_overflow();					\
00b0c9b82663ac Al Viro            2017-12-14  234  	return to((v & field_mask(field)) * field_multiplier(field));	\
00b0c9b82663ac Al Viro            2017-12-14  235  }									\
e2b02d382ae0cb Ben Horgan         2025-07-09  236  static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
00b0c9b82663ac Al Viro            2017-12-14  237  							base val, base field)	\
00b0c9b82663ac Al Viro            2017-12-14  238  {									\
00b0c9b82663ac Al Viro            2017-12-14  239  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac Al Viro            2017-12-14  240  }									\
00b0c9b82663ac Al Viro            2017-12-14  241  static __always_inline void type##p_replace_bits(__##type *p,		\
00b0c9b82663ac Al Viro            2017-12-14  242  					base val, base field)		\
00b0c9b82663ac Al Viro            2017-12-14  243  {									\
00b0c9b82663ac Al Viro            2017-12-14  244  	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac Al Viro            2017-12-14  245  }									\
e2b02d382ae0cb Ben Horgan         2025-07-09  246  static __always_inline base __must_check type##_get_bits(__##type v, base field)	\
00b0c9b82663ac Al Viro            2017-12-14  247  {									\
00b0c9b82663ac Al Viro            2017-12-14  248  	return (from(v) & field)/field_multiplier(field);		\
00b0c9b82663ac Al Viro            2017-12-14  249  }
00b0c9b82663ac Al Viro            2017-12-14  250  #define __MAKE_OP(size)							\
00b0c9b82663ac Al Viro            2017-12-14  251  	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
00b0c9b82663ac Al Viro            2017-12-14  252  	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
00b0c9b82663ac Al Viro            2017-12-14  253  	____MAKE_OP(u##size,u##size,,)
37a3862e123826 Johannes Berg      2018-06-20  254  ____MAKE_OP(u8,u8,,)
00b0c9b82663ac Al Viro            2017-12-14  255  __MAKE_OP(16)
00b0c9b82663ac Al Viro            2017-12-14  256  __MAKE_OP(32)
00b0c9b82663ac Al Viro            2017-12-14  257  __MAKE_OP(64)
00b0c9b82663ac Al Viro            2017-12-14  258  #undef __MAKE_OP
00b0c9b82663ac Al Viro            2017-12-14  259  #undef ____MAKE_OP
00b0c9b82663ac Al Viro            2017-12-14  260  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
