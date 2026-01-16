Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CED321426;
	Fri, 16 Jan 2026 02:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768529142; cv=none; b=WtAQP6z91lw8M+TDxELJWEXZAJDNd1ujC0HTeHLrDtCqq9mZ3yc9S1KyJR8FM1cDPH3DZanpiuuzosTjmMlSB9V6yS1p339yv34fdlA8d2IgS3UP8gCePZB5e9WeWhh3bA3R3xGnfJUc6SkRGcrcaMtN35HPbGk7lvP9eO7Ui1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768529142; c=relaxed/simple;
	bh=MjUf3JbFNoL5mCr5D9LoItO2C5IIo7FDt0ECPQIltHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkPzSjFJoVORiwfE5TYQWcmmVI1hMgPB20z7RQY9PId5z7fduaWAecEtFRI96P/YdI5gjuk4xBlPCgQAPXFTn5b1iw5fkksFMxbS/MVQebdFzw7GxfPAbAG7HsC2+8BgBFQp935cHzBhumjw4pRDGfwtyRnqAMI9ubyVec2pLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdHT/5iG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdHT/5iG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768529139; x=1800065139;
  h=date:from:to:cc:subject:message-id;
  bh=MjUf3JbFNoL5mCr5D9LoItO2C5IIo7FDt0ECPQIltHU=;
  b=EdHT/5iGaEXHoJIuwggyCADTHnwk04K8WkMylDTCdXs/yo7VUa7N9gPZ
   Aoc53XK3sFx+Bycs8tYJ81SDIgphGSBkECd5a4TIR2tumcd5a4ElEQjm7
   Y9xkA0G/YD34irk8gyEWK1o2egFCXpDLuumnmXhuHSvsWsCRyxFKQMMNV
   1hGq4bew08pkqtMv8onxGNUGqClA/mzHVzdKzFQ/QBdJV9ClRvtIkkcuc
   yoqPhP7gEgtJvxyAbFEIBiFVbU1KAq5ldUZB8swrqyMK9akqe/cFhBfeT
   B80QU4cuL423lbYDzWwWc61YmuI00KIGz/xYOCQ9HTvxNe/FajQbTJp+v
   g==;
X-CSE-ConnectionGUID: o8Nn+oqmQXG20WXP/c4gcQ==
X-CSE-MsgGUID: lIvo6kRDSTykR/9QmCiFwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80958763"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80958763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:05:32 -0800
X-CSE-ConnectionGUID: fv6f+irdSd+nIMQ2STT54Q==
X-CSE-MsgGUID: QlSqqB5BQLewHw3w5pqpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209978777"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 18:05:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZDM-00000000KFe-1OqM;
	Fri, 16 Jan 2026 02:05:28 +0000
Date: Fri, 16 Jan 2026 10:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 8/10]
 crypto/asymmetric_keys/rsassa_parser.c:125:49: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202601161033.QPFRoZ7o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   573904dcb8c349de6c983c50f450c478decd9996
commit: 66c15603314346fe9045542103ca0cbd9381cc63 [8/10] pkcs7, x509: Add RSASSA-PSS support
config: s390-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161033.QPFRoZ7o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161033.QPFRoZ7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161033.QPFRoZ7o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/rsassa_parser.c:125:49: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     125 |                 pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
         |                                                               ^~~
   crypto/asymmetric_keys/rsassa_parser.c:103:9: note: initialize the variable 'ret' to silence this warning
     103 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +125 crypto/asymmetric_keys/rsassa_parser.c

    98	
    99	int rsassa_note_maskgen_algo(void *context, size_t hdrlen, unsigned char tag,
   100				     const void *value, size_t vlen)
   101	{
   102		struct rsassa_parse_context *ctx = context;
   103		int ret;
   104	
   105		ctx->rsassa->maskgen_algo = ctx->last_oid;
   106		pr_debug("MGF-ALGO %u %u\n", ctx->rsassa->maskgen_algo, ctx->params_len);
   107	
   108		switch (ctx->rsassa->maskgen_algo) {
   109		case OID_id_mgf1:
   110			if (!vlen) {
   111				pr_debug("MGF1 missing parameters\n");
   112				return -EBADMSG;
   113			}
   114	
   115			ret = asn1_ber_decoder(&mgf1_params_decoder, ctx,
   116					       ctx->params, ctx->params_len);
   117			if (ret < 0) {
   118				pr_debug("MGF1 parse failed %d\n", ret);
   119				return ret;
   120			}
   121			ctx->rsassa->maskgen_hash = ctx->mgf1_last_oid;
   122			break;
   123	
   124		default:
 > 125			pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
   126			return -ENOPKG;
   127		}
   128	
   129		ctx->params = NULL;
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
