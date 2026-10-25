Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931890;
	b=kPv6Bjt6T7x5/szwwyBlfHSnjzYLceHORkJKui+rKsSWxGfIOJJXrLN0p+uCD5DA10wE
	 3kguJNrlu16yK+4QRL1l89oj/Nz7do8YFpibmGcxtY0Wxqag2wDPIka0C57drCR28oiAZ
	 idccIlIPKcA5xkyubwmqkznYG6f8/3C3YoKGPgVcNhXSSThyrWyp1BYe7I8QvaymeiQzm
	 Kns0eIC/dRlJpNCcX86toFkvKpNB5MWYg7NfkmqDvkhQJOU/s3MYLHQLz2Q6LMgo6jooF
	 plr9gADEbzp2ONYXHemQxEZ/2n3rhARdeBFWmpFV9ZKWWoNR3xydJ5zfg70z+xVqvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931890;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=z1SpQxB5Ess7dALeSWN+4SAMzldkGG6Z/Hgr02jRRfE=;
	b=p/ESvtQ28lOyVAeGHoBFtG3ZjNjDKtbNVOreg4vb3czaPPFLYxGcf6iWN+u6WDusON78
	 q/8Tp6VKCPbTNQPIfeOEDttoGDc8zMsMtoPX8Uf4Qwajr475nbe0E0G6uNmxxFql9vtpT
	 2PE1sP1zFxhOkhGO6EToaTSnGG9xu+eta/6u3ryCHXHhyGQn0gUJTxF3+J7vtb3nUoSAT
	 2mGbuNNfInuKLF6VHzM1WYMxi+K3Ehv93OBNb0478mx7aNv7jMoOQZONdmBP3ytDzYbzK
	 R4Gblibc7BKEYxIar0gSq8A3LSuaO6D8qf+2jPhT+ICBZp981VSLl4PELbd/a4DOVKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tly1JwI2;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41A606A31A;
	Sun, 25 Oct 2026 12:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A41A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tly1JwI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792931889; x=1824467889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skIGnWUAUpC6Z7NNMtPWZU6rkNUUSmPTq5BdQ4vTsOo=;
  b=Tly1JwI2oUzPK/Pp8s983hDPznFVMsJeVX+IdD50zR4O3RgJ9ZcePbJC
   47ApaqSAagjsY9XpSWkg9F3YKkh9SetmNxlI9wT4gdaaPS7iQah+9kLsl
   2spOJ8qNsZl4+aidsbcWhHV3OT3CkPC9EPxlMJUL4+u2KK61TFoovU83X
   vIa/oNG0hAYpADZRS4B5DGJGp3nYFViIsuaheFRE2oqfMUC68+g1xN/Ml
   qkQudieASMIXhxidSn1i0vyG4Jw0NS6YWhzcLzNIJRwIUmKUfPyrRoeuY
   esOe1+LksiopUheCtGVbdEcJ5ih+9gGQrXIALST3wNv3VbrmalUY1ZAEL
   w==;
X-CSE-ConnectionGUID: keL8m82RQMeOcOyivZS6Rw==
X-CSE-MsgGUID: FUMFvrwkT+Sch8Gi+/GANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1605108"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1605108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 05:38:08 -0700
X-CSE-ConnectionGUID: k+gHluimRfeABcsMa3XqGQ==
X-CSE-MsgGUID: /PczsrsqTh+AxzZoqgctsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3981230"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2026 05:38:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKxU6-00000000UmU-1LTn;
	Sun, 25 Oct 2026 12:37:58 +0000
Date: Sun, 25 Oct 2026 20:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, chrisl@kernel.org,
	kasong@tencent.com, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, yosry@kernel.org,
	david@kernel.org, muchun.song@linux.dev, shikemeng@huaweicloud.com,
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com,
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, riel@surriel.com, gourry@gourry.net,
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com,
	baolin.wang@linux.alibaba.com
Subject: Re: [PATCH v6 04/12] mm, swap: support physical swap as a vswap
 backend
Message-ID: <202610252016.SuCWXL35-lkp@intel.com>
References: <20261021060323.553433-5-nphamcs@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021060323.553433-5-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4dbe24720eb3811563cd56b35d87ddf3f9beed2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/mm-swap-add-virtual-swap-device-infrastructure/20261020-230312
base:   4dbe24720eb3811563cd56b35d87ddf3f9beed2a
patch link:    https://lore.kernel.org/r/20261021060323.553433-5-nphamcs%40gmail.com
patch subject: [PATCH v6 04/12] mm, swap: support physical swap as a vswap backend
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610252016.SuCWXL35-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610252016.SuCWXL35-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252016.SuCWXL35-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/workingset.c:19:
>> mm/swap_table.h:418:10: error: call to undeclared function 'swp_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     418 |         return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) | SWP_TB_VSWAP_MARK;
         |                 ^
>> mm/swap_table.h:427:9: error: call to undeclared function 'swp_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     427 |         return swp_entry(vswap_si->type, offset);
         |                ^
>> mm/swap_table.h:427:9: error: returning 'int' from a function with incompatible result type 'swp_entry_t'
     427 |         return swp_entry(vswap_si->type, offset);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/swp_offset +418 mm/swap_table.h

   415	
   416	static inline unsigned long swp_entry_to_swp_tb_vswap(swp_entry_t entry)
   417	{
 > 418		return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) | SWP_TB_VSWAP_MARK;
   419	}
   420	
   421	static inline swp_entry_t swp_tb_vswap_to_swp_entry(unsigned long swp_tb)
   422	{
   423		unsigned long offset;
   424	
   425		VM_WARN_ON(!swp_tb_is_vswap(swp_tb));
   426		offset = (swp_tb & SWP_RMAP_ENTRY_MASK) >> SWP_TB_VSWAP_MARK_BITS;
 > 427		return swp_entry(vswap_si->type, offset);
   428	}
   429	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
