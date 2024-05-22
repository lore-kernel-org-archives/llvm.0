Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CB80035;
	Wed, 22 May 2024 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373911; cv=none; b=uwVp2ij/WGzO9vvSOOEHdx2vZrVh3LtV7HZiNCCnnvZV3pRBOKgsDXRGLJ/lokeYFCekYu0QUYaDfj6bf4W876xD3vp9wl5jMQLQqmUHSS7SpZ0MqdCi5h95v5h1yTCBVnDCarNi2cgVQ8rpfzD4suq/BDEHT5XUzsWMDTqU8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373911; c=relaxed/simple;
	bh=pixxe1txm31bw+ZHQswxVqU0juUldy8SEqcfjPz8Ng8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGG7NSKB+DOi58cYMZIPJJT/eNa1zbXmZXTbDr54lPAb8Qm5KEfCxbIsMs+Ja5UAnJR7uklo7O+DKyaU2CHq2bF5cQrMQfNqj8TMMmL6fsKbUd/pz8gzSWew8INSd8Xaj61lHSvuwtaBubQUzLGpbsRjpYz71B14HXp8s1hyZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iM/St5zt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iM/St5zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716373910; x=1747909910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pixxe1txm31bw+ZHQswxVqU0juUldy8SEqcfjPz8Ng8=;
  b=iM/St5zt2jME/sswHMrDLoGb8V0oeoeXYKMM8u7uEW+6TAAxdSxvaYD3
   bD4np0hCtKkXtDSabKdQKIfUCnu8h6kPCqTP7wNgH/XPpwYPfguQ8S1x3
   LzmT44wRxsAYcg5QCMMzVGL79ofsWSbASDdf4dlA3MfaFFvQNrAgLNFur
   3FvKFUSsskdJzGIDZ8ekVxQKtlLn0o2ZNu1Yoa3AfRA8ybk2UVJv1ce++
   AiB2HE1+4gQgI5TG3YH6LcROFB2l0+Xvp3Jyxuu0ECWzHv1aTi5rqb/L2
   vzDuTxpj0s9m4cehbLpi0C4tKdlaLDYjTQWOqPKBcDMAHkAYLlL2qUyyG
   A==;
X-CSE-ConnectionGUID: SjBfmwxNQc+TcUAu3POxlw==
X-CSE-MsgGUID: 31rAL/AKR/+eSJg57xFgog==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30137425"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="30137425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 03:31:49 -0700
X-CSE-ConnectionGUID: N+yZYEobR5G8JLmpMMdHPw==
X-CSE-MsgGUID: S798NQc2Q9ynytxpHwUuFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33359137"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2024 03:31:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9jG1-0001I7-2l;
	Wed, 22 May 2024 10:31:41 +0000
Date: Wed, 22 May 2024 18:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 3/9] fdt-select-board: Add test tool for selecting
 dtbs based on board-id
Message-ID: <202405221814.0p3cU5R2-lkp@intel.com>
References: <20240521-board-ids-v3-3-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-3-e6c71d05f4d2@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on e8f897f4afef0031fe618a8e94127a0934896aba]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/libfdt-board-id-Implement-board-id-scoring/20240522-024327
base:   e8f897f4afef0031fe618a8e94127a0934896aba
patch link:    https://lore.kernel.org/r/20240521-board-ids-v3-3-e6c71d05f4d2%40quicinc.com
patch subject: [PATCH RFC v3 3/9] fdt-select-board: Add test tool for selecting dtbs based on board-id
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240522/202405221814.0p3cU5R2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221814.0p3cU5R2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221814.0p3cU5R2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/dtc/fdt-select-board.c:119:8: warning: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
     119 |                 free(fdt);
         |                      ^~~
   /usr/include/stdlib.h:687:25: note: passing argument to parameter '__ptr' here
     687 | extern void free (void *__ptr) __THROW;
         |                         ^
   1 warning generated.
--
>> scripts/dtc/fdt-select-board.c:119:8: warning: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
     119 |                 free(fdt);
         |                      ^~~
   /usr/include/stdlib.h:687:25: note: passing argument to parameter '__ptr' here
     687 | extern void free (void *__ptr) __THROW;
         |                         ^
   1 warning generated.
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.


vim +119 scripts/dtc/fdt-select-board.c

    48	
    49	int main(int argc, char *argv[])
    50	{
    51		int opt;
    52		char *input_filename = NULL;
    53		const void *fdt;
    54		const void *ref;
    55		int ref_node;
    56		int max_score = -1;
    57		const char *best_match = NULL;
    58		struct context ctx;
    59		int all = 0;
    60	
    61		while ((opt = util_getopt_long()) != EOF) {
    62			switch (opt) {
    63			case_USAGE_COMMON_FLAGS
    64	
    65			case 'a':
    66				all = 1;
    67				break;
    68			case 'r':
    69				input_filename = optarg;
    70				break;
    71			case 'v':
    72				verbose = 1;
    73				break;
    74			}
    75		}
    76	
    77		if (!input_filename)
    78			usage("missing reference file");
    79	
    80		argv += optind;
    81		argc -= optind;
    82	
    83		if (argc <= 0)
    84			usage("missing candidate dtbs");
    85	
    86		ref = utilfdt_read(input_filename, NULL);
    87		if (!ref) {
    88			fprintf(stderr, "failed to read reference %s\n", input_filename);
    89			return -1;
    90		}
    91	
    92		ref_node = fdt_path_offset(ref, "/board-id");
    93		if (ref_node < 0) {
    94			fprintf(stderr, "reference blob doesn't have a board-id\n");
    95			return -1;
    96		}
    97	
    98		ctx.fdt = ref;
    99		ctx.node = ref_node;
   100	
   101		for (; argc > 0; --argc, ++argv) {
   102			int score;
   103	
   104			fdt = utilfdt_read(*argv, NULL);
   105			if (!fdt) {
   106				fprintf(stderr, "failed to read %s\n", *argv);
   107				return -1;
   108			}
   109	
   110			score = fdt_board_id_score(fdt, get_board_id, &ctx);
   111			if (verbose || (score > 0 && all))
   112				printf("%s: %d\n", *argv, score);
   113	
   114			if (score > max_score) {
   115				max_score = score;
   116				best_match = *argv;
   117			}
   118	
 > 119			free(fdt);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
