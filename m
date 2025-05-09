Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221628E576;
	Fri,  9 May 2025 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784798; cv=none; b=s52OBVIaSz4RLIVS2+s/AoNKN6GEuzkqdz75WZvPnMZT1crqJccTrlDw4QbePOD152bac0Rq65b+wYEK+EnIzsjJy/ekIs9kAmvoXwnUQSlILulUlTjvJOggNH+aFFFbOReeHn31fR0nef5TekK2W35kKJ/Se8gxbu86azyoLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784798; c=relaxed/simple;
	bh=LShhiRFXIcvNwUm+mQaBWcaa0guFdmwRR/J/HFYDPJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdMyMTeKdGyq1bUj+6cNszo+sQKBQnAGUxzus5TnoE0uNrk+c+DptCpprp9hnHLwwrI+rh4IhgXUm33Cvy73ATGYhidF+/1JYxOq89Ob2v2BH+2BjXo7V7MRRQa8QufvDXGqZoV4o46B2bRdjQOt72+zWVPC5wifFZN+sECyzik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9ZYkHed; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9ZYkHed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746784797; x=1778320797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LShhiRFXIcvNwUm+mQaBWcaa0guFdmwRR/J/HFYDPJ0=;
  b=k9ZYkHednPbGDfoMEdUpTwgoMRHAXDFzXAVdlI+alEhK+9y5iixhzxbR
   syqhA+qUlG0dbklrQcqpM9HzoaFMK9qDGHfosgp8NagYNLbL2LVFs+FbR
   7UGatE703m7u+bb0AC4k03epQyFS2J9JwGoRb8jWdy9BE6garsjcM4SgT
   dXiJqcY7fwYvZOOUTbX2rQrff2mhy3SqSSWzdm+T70l4COyElPBlKtLU0
   f87UMDP7FdRb9/gYI5Vq5hgxaisB4LdQvMEx0RvlTA3uqBP1YAc43us7d
   LirM0ytUluMCg0sVsi5FzVOTmErPT1eXfpFtNEpIwGqd1jet15lS7M2EM
   Q==;
X-CSE-ConnectionGUID: Hq4Gtc6jS26J/VGwdgYpMA==
X-CSE-MsgGUID: a3UoXX7pRE+1nmGAB4FOkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66140879"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="66140879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:59:56 -0700
X-CSE-ConnectionGUID: 60gwdfL7SzmaxgrqztiWug==
X-CSE-MsgGUID: ABf9rHPfRQmjycpCj43isQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141351939"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 02:59:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKWG-000BuH-22;
	Fri, 09 May 2025 09:59:52 +0000
Date: Fri, 9 May 2025 17:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <202505091740.BC3ad4im-lkp@intel.com>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>

Hi Ignacio,

kernel test robot noticed the following build errors:

[auto build test ERROR on fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Ignacio-Moreno-Gonzalez-via-B4-Relay/mm-madvise-make-MADV_NOHUGEPAGE-a-no-op-if-THP/20250508-182107
base:   fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
patch link:    https://lore.kernel.org/r/20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3%40kuka.com
patch subject: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
config: s390-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091740.BC3ad4im-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091740.BC3ad4im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091740.BC3ad4im-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kvm/gaccess.c:321:2: error: expected identifier
     321 |         PROT_NONE,
         |         ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^
>> arch/s390/kvm/gaccess.c:344:8: error: duplicate case value: '0' and 'PROT_TYPE_LA' both equal '0'
     344 |                 case PROT_TYPE_LA:
         |                      ^
   arch/s390/kvm/gaccess.c:337:8: note: previous case defined here
     337 |                 case PROT_NONE:
         |                      ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^
   2 errors generated.


vim +321 arch/s390/kvm/gaccess.c

664b49735370684 Alexander Yarygin        2015-03-09  313  
d03193de30e6d99 David Hildenbrand        2016-05-31  314  enum prot_type {
d03193de30e6d99 David Hildenbrand        2016-05-31  315  	PROT_TYPE_LA   = 0,
d03193de30e6d99 David Hildenbrand        2016-05-31  316  	PROT_TYPE_KEYC = 1,
d03193de30e6d99 David Hildenbrand        2016-05-31  317  	PROT_TYPE_ALC  = 2,
d03193de30e6d99 David Hildenbrand        2016-05-31  318  	PROT_TYPE_DAT  = 3,
6ae1574c2a24eec Christian Borntraeger    2017-06-07  319  	PROT_TYPE_IEP  = 4,
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25  320  	/* Dummy value for passing an initialized value when code != PGM_PROTECTION */
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25 @321  	PROT_NONE,
d03193de30e6d99 David Hildenbrand        2016-05-31  322  };
d03193de30e6d99 David Hildenbrand        2016-05-31  323  
c783631b0bffe60 Janis Schoetterl-Glausch 2022-05-12  324  static int trans_exc_ending(struct kvm_vcpu *vcpu, int code, unsigned long gva, u8 ar,
c783631b0bffe60 Janis Schoetterl-Glausch 2022-05-12  325  			    enum gacc_mode mode, enum prot_type prot, bool terminate)
d03193de30e6d99 David Hildenbrand        2016-05-31  326  {
d03193de30e6d99 David Hildenbrand        2016-05-31  327  	struct kvm_s390_pgm_info *pgm = &vcpu->arch.pgm;
44ae766353af6eb Heiko Carstens           2023-10-12  328  	union teid *teid;
d03193de30e6d99 David Hildenbrand        2016-05-31  329  
d03193de30e6d99 David Hildenbrand        2016-05-31  330  	memset(pgm, 0, sizeof(*pgm));
d03193de30e6d99 David Hildenbrand        2016-05-31  331  	pgm->code = code;
44ae766353af6eb Heiko Carstens           2023-10-12  332  	teid = (union teid *)&pgm->trans_exc_code;
d03193de30e6d99 David Hildenbrand        2016-05-31  333  
d03193de30e6d99 David Hildenbrand        2016-05-31  334  	switch (code) {
c14b88d76624e02 Janosch Frank            2016-07-29  335  	case PGM_PROTECTION:
c14b88d76624e02 Janosch Frank            2016-07-29  336  		switch (prot) {
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25  337  		case PROT_NONE:
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25  338  			/* We should never get here, acts like termination */
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25  339  			WARN_ON_ONCE(1);
b3cefd6bf16e723 Janis Schoetterl-Glausch 2022-08-25  340  			break;
6ae1574c2a24eec Christian Borntraeger    2017-06-07  341  		case PROT_TYPE_IEP:
44ae766353af6eb Heiko Carstens           2023-10-12  342  			teid->b61 = 1;
3b684a420bd8a26 Joe Perches              2020-03-10  343  			fallthrough;
a679c547d19ded9 Christian Borntraeger    2016-12-15 @344  		case PROT_TYPE_LA:
44ae766353af6eb Heiko Carstens           2023-10-12  345  			teid->b56 = 1;
a679c547d19ded9 Christian Borntraeger    2016-12-15  346  			break;
a679c547d19ded9 Christian Borntraeger    2016-12-15  347  		case PROT_TYPE_KEYC:
44ae766353af6eb Heiko Carstens           2023-10-12  348  			teid->b60 = 1;
a679c547d19ded9 Christian Borntraeger    2016-12-15  349  			break;
c14b88d76624e02 Janosch Frank            2016-07-29  350  		case PROT_TYPE_ALC:
44ae766353af6eb Heiko Carstens           2023-10-12  351  			teid->b60 = 1;
3b684a420bd8a26 Joe Perches              2020-03-10  352  			fallthrough;
c14b88d76624e02 Janosch Frank            2016-07-29  353  		case PROT_TYPE_DAT:
44ae766353af6eb Heiko Carstens           2023-10-12  354  			teid->b61 = 1;
c14b88d76624e02 Janosch Frank            2016-07-29  355  			break;
c14b88d76624e02 Janosch Frank            2016-07-29  356  		}
c783631b0bffe60 Janis Schoetterl-Glausch 2022-05-12  357  		if (terminate) {
44ae766353af6eb Heiko Carstens           2023-10-12  358  			teid->b56 = 0;
44ae766353af6eb Heiko Carstens           2023-10-12  359  			teid->b60 = 0;
44ae766353af6eb Heiko Carstens           2023-10-12  360  			teid->b61 = 0;
c783631b0bffe60 Janis Schoetterl-Glausch 2022-05-12  361  		}
3b684a420bd8a26 Joe Perches              2020-03-10  362  		fallthrough;
d03193de30e6d99 David Hildenbrand        2016-05-31  363  	case PGM_ASCE_TYPE:
d03193de30e6d99 David Hildenbrand        2016-05-31  364  	case PGM_PAGE_TRANSLATION:
d03193de30e6d99 David Hildenbrand        2016-05-31  365  	case PGM_REGION_FIRST_TRANS:
d03193de30e6d99 David Hildenbrand        2016-05-31  366  	case PGM_REGION_SECOND_TRANS:
d03193de30e6d99 David Hildenbrand        2016-05-31  367  	case PGM_REGION_THIRD_TRANS:
d03193de30e6d99 David Hildenbrand        2016-05-31  368  	case PGM_SEGMENT_TRANSLATION:
d03193de30e6d99 David Hildenbrand        2016-05-31  369  		/*
d03193de30e6d99 David Hildenbrand        2016-05-31  370  		 * op_access_id only applies to MOVE_PAGE -> set bit 61
d03193de30e6d99 David Hildenbrand        2016-05-31  371  		 * exc_access_id has to be set to 0 for some instructions. Both
c14b88d76624e02 Janosch Frank            2016-07-29  372  		 * cases have to be handled by the caller.
d03193de30e6d99 David Hildenbrand        2016-05-31  373  		 */
44ae766353af6eb Heiko Carstens           2023-10-12  374  		teid->addr = gva >> PAGE_SHIFT;
44ae766353af6eb Heiko Carstens           2023-10-12  375  		teid->fsi = mode == GACC_STORE ? TEID_FSI_STORE : TEID_FSI_FETCH;
44ae766353af6eb Heiko Carstens           2023-10-12  376  		teid->as = psw_bits(vcpu->arch.sie_block->gpsw).as;
3b684a420bd8a26 Joe Perches              2020-03-10  377  		fallthrough;
d03193de30e6d99 David Hildenbrand        2016-05-31  378  	case PGM_ALEN_TRANSLATION:
d03193de30e6d99 David Hildenbrand        2016-05-31  379  	case PGM_ALE_SEQUENCE:
d03193de30e6d99 David Hildenbrand        2016-05-31  380  	case PGM_ASTE_VALIDITY:
d03193de30e6d99 David Hildenbrand        2016-05-31  381  	case PGM_ASTE_SEQUENCE:
d03193de30e6d99 David Hildenbrand        2016-05-31  382  	case PGM_EXTENDED_AUTHORITY:
c14b88d76624e02 Janosch Frank            2016-07-29  383  		/*
c14b88d76624e02 Janosch Frank            2016-07-29  384  		 * We can always store exc_access_id, as it is
c14b88d76624e02 Janosch Frank            2016-07-29  385  		 * undefined for non-ar cases. It is undefined for
c14b88d76624e02 Janosch Frank            2016-07-29  386  		 * most DAT protection exceptions.
c14b88d76624e02 Janosch Frank            2016-07-29  387  		 */
d03193de30e6d99 David Hildenbrand        2016-05-31  388  		pgm->exc_access_id = ar;
d03193de30e6d99 David Hildenbrand        2016-05-31  389  		break;
d03193de30e6d99 David Hildenbrand        2016-05-31  390  	}
d03193de30e6d99 David Hildenbrand        2016-05-31  391  	return code;
d03193de30e6d99 David Hildenbrand        2016-05-31  392  }
d03193de30e6d99 David Hildenbrand        2016-05-31  393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
