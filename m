Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575322773CB;
	Thu, 11 Dec 2025 03:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422454; cv=none; b=Hn/siHSsAbsIW99ru9S5PLdDsQkanVtpSBMdvQNvYHuyAucLNjY+5ttgSUdvGnCAGtxD3ZbF8p4OOS8pEh5LC+3agqkvg5fi93f6h7YzsXq1/onAf8iSTnfldg+U4tiEZlUH6I3LdZ5LWtq/XlbU/K5W/UQMXA56L76J670HCtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422454; c=relaxed/simple;
	bh=lmnuZYwe7bqC2tN+mipjh87OoRSTAugRjG2pVJ7PtY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqfY93NhjajP2b7zwc2sRgLqn6fWOXfSIAze/9Vqdf9oaeXo+U9wH0QQIM6Ff0fZspbFLeTlI9IpCtClcbpXwG1BbwhtMLgyKtPhc35rqJ6eCisqueQP965HBrCha2x5NRspu/mar+8YTVATNSfBP9JlmUWnswkr6507AZThx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AacWQ4JF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AacWQ4JF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765422453; x=1796958453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmnuZYwe7bqC2tN+mipjh87OoRSTAugRjG2pVJ7PtY4=;
  b=AacWQ4JFYD+2WpSXT9a9mrsh50pYmaejprs301vK6UkH6tVTaCquOOrN
   24SpLA2BdbG97t9IL6wDqyQDU2vE8C65WsMGPthBAWboOUqpXp0UiFl61
   YRwqxwTu74bhrr6J+9vobSHqR7BgcfnkfoPCtQDeyzey8UpVZmwcZDEdu
   2y/Q44t3x6dS4xixHBcfygplkieAEJHixyHKnu50+KCMTJo3B87O3Hjxl
   yoHOa8fgOazfOmeRYA9hENjEKhZTylbfsp9BD8geVgI5djRX1RUnUTFUm
   vKzuwDLdKa3SiG+lKuNxFNZhtMV358LoF5DoD0MxVhaOGOR5JpPe5inu6
   A==;
X-CSE-ConnectionGUID: y7IoYBunS0GQceLK9FVL+Q==
X-CSE-MsgGUID: mevuuGEqT4iaDCroh7oDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67337973"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67337973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:07:31 -0800
X-CSE-ConnectionGUID: HYdoxkFXT7WGaaGcEBGxiw==
X-CSE-MsgGUID: khOKHuQ4Qf6SUIj4sHcMeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201605497"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 19:07:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTX1b-0000000045V-1oZY;
	Thu, 11 Dec 2025 03:07:27 +0000
Date: Thu, 11 Dec 2025 11:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/5]
 crypto/asymmetric_keys/rsassa_parser.c:134:49: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202512111141.S4lpNMtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2
commit: 36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2 [5/5] Add RSASSA-PSS support (RFC8017)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251211/202512111141.S4lpNMtP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111141.S4lpNMtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111141.S4lpNMtP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/rsassa_parser.c:134:49: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     134 |                 pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
         |                                                               ^~~
   include/linux/printk.h:636:26: note: expanded from macro 'pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   crypto/asymmetric_keys/rsassa_parser.c:107:9: note: initialize the variable 'ret' to silence this warning
     107 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +134 crypto/asymmetric_keys/rsassa_parser.c

   102	
   103	int rsassa_note_maskgen_algo(void *context, size_t hdrlen, unsigned char tag,
   104				     const void *value, size_t vlen)
   105	{
   106		struct rsassa_parse_context *ctx = context;
   107		int ret;
   108	
   109		ctx->rsassa->maskgen_algo = ctx->last_oid;
   110		if (!ctx->params)
   111			pr_debug("MGF-ALGO %u %*phN\n",
   112				 ctx->rsassa->maskgen_algo, ctx->params_len, ctx->params);
   113		else
   114			pr_debug("MGF-ALGO %u\n",
   115				 ctx->rsassa->hash_algo);
   116	
   117		switch (ctx->rsassa->maskgen_algo) {
   118		case OID_id_mgf1:
   119			if (!vlen) {
   120				pr_debug("MGF1 missing parameters\n");
   121				return -EBADMSG;
   122			}
   123	
   124			ret = asn1_ber_decoder(&mgf1_params_decoder, ctx,
   125					       ctx->params, ctx->params_len);
   126			if (ret < 0) {
   127				pr_debug("MGF1 parse failed %d\n", ret);
   128				return ret;
   129			}
   130			ctx->rsassa->maskgen_hash = ctx->mgf1_last_oid;
   131			break;
   132	
   133		default:
 > 134			pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
   135			return -ENOPKG;
   136		}
   137	
   138		ctx->params = NULL;
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
