Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587E210E4;
	Wed, 22 Nov 2023 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hz4LE2DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640541; x=1732176541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=saKsTFGqOFh0rMvwxkMXGv3wGqhwAOvjL/iDuN8bPEU=;
  b=Hz4LE2DY9258HULCxB8N34Mpoh520Duypt/sL8ovw2ldN2VaTmLzcOWh
   jncm5jYtD5d6XNJHHu69PQMUo6flnmu+QFiVEmdObRFK/du6IezKrygfI
   k0Pm7G0LnBLEOpl+pwWqvkUpVv9ATmvU9jCsjCjem21xM02BAOyAiPxHx
   IluXEsS2pS0fiY5/BTnmKTYNf+lWQQOQUqnlr29cBxnEsjpKXls1wwrdb
   kv8PTiedGlzG+SqZDfJCr62U3a8RRASe6r1OBAx47CIJCYxlIxHBsbOsz
   rSJHTk+9a5z9yTssanQLXsFFAyWbKZBfCOWIeS2YQJ7FgnJF3/dCoFYhH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390867926"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="390867926"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="716763255"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="716763255"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 00:08:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5iI2-0000Fs-1T;
	Wed, 22 Nov 2023 08:08:54 +0000
Date: Wed, 22 Nov 2023 16:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 129/145]
 drivers/gpu/drm/apple/parser.c:592:5: warning: no previous prototype for
 function 'parse_sample_rate_bit'
Message-ID: <202311221347.9jon3WGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   e3a82f03cd81edb4608ab6dde0e073ac91e2fdb8
commit: 2d782b0d007dd3837c2e8e69964fd751ba6d8a9f [129/145] gpu: drm: apple: Add sound mode parsing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221347.9jon3WGr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221347.9jon3WGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221347.9jon3WGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/parser.c:592:5: warning: no previous prototype for function 'parse_sample_rate_bit' [-Wmissing-prototypes]
     592 | int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
         |     ^
   drivers/gpu/drm/apple/parser.c:592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     592 | int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
         | ^
         | static 
>> drivers/gpu/drm/apple/parser.c:613:5: warning: no previous prototype for function 'parse_sample_fmtbit' [-Wmissing-prototypes]
     613 | int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
         |     ^
   drivers/gpu/drm/apple/parser.c:613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     613 | int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
         | ^
         | static 
   2 warnings generated.


vim +/parse_sample_rate_bit +592 drivers/gpu/drm/apple/parser.c

   591	
 > 592	int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
   593	{
   594		s64 rate;
   595		int ret = parse_int(handle, &rate);
   596	
   597		if (ret)
   598			return ret;
   599	
   600		*ratebit = snd_pcm_rate_to_rate_bit(rate);
   601		if (*ratebit == SNDRV_PCM_RATE_KNOT) {
   602			/*
   603			 * The rate wasn't recognized, and unless we supply
   604			 * a supplementary constraint, the SNDRV_PCM_RATE_KNOT bit
   605			 * will allow any rate. So clear it.
   606			 */
   607			*ratebit = 0;
   608		}
   609	
   610		return 0;
   611	}
   612	
 > 613	int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
   614	{
   615		s64 sample_size;
   616		int ret = parse_int(handle, &sample_size);
   617	
   618		if (ret)
   619			return ret;
   620	
   621		switch (sample_size) {
   622		case 16:
   623			*fmtbit = SNDRV_PCM_FMTBIT_S16;
   624			break;
   625		case 20:
   626			*fmtbit = SNDRV_PCM_FMTBIT_S20;
   627			break;
   628		case 24:
   629			*fmtbit = SNDRV_PCM_FMTBIT_S24;
   630			break;
   631		case 32:
   632			*fmtbit = SNDRV_PCM_FMTBIT_S32;
   633			break;
   634		default:
   635			*fmtbit = 0;
   636			break;
   637		}
   638	
   639		return 0;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
