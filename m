Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637251DE2D7;
	Thu, 16 Oct 2025 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760576879; cv=none; b=I65kbrwrKwOWdHJpEZrMvld/tOnqw5x6Z52rDK0DEKNZBz58QCsHpGLvAm9gCNb8aZUrhQu6/XroQGZWF/SRL4lpznkh8WabZDgCLVF6wxkBniyOKSuYPjpqOYoGnaF/cJzgAM03Da2Y6Uw1/Mbqr1A+pDU7IHJZretEL+Tyxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760576879; c=relaxed/simple;
	bh=ff3zDa/sC+9DITF6Mt1jKG016MBnK5gF+cIGd2VLpu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbcpFD6W4O2tbutmMx2Sudo4cyDi0sSIVBiE2WQCRyuQ9WbZ3xTguvsQwHDdZrV0KTGJaHvOnjzFT9d1SCq64CkWKe/FAJg9+aUMwL5A4slYZY54iZWzUWx0Gn1G4kcOnTwNV1NKbKYw4dYZh/eFylcl7cGJv8ASn5wudpu/joo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEvJtS51; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEvJtS51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760576877; x=1792112877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ff3zDa/sC+9DITF6Mt1jKG016MBnK5gF+cIGd2VLpu4=;
  b=BEvJtS515B+xC/hIVF56Gnq/Yfuc08LLOmlUEEVkDYhdUQMa54tO2xFJ
   t/TkaVy+l8kWt2VX7s378rAQ70FIYawSrwaos8CIvBQ2XLZB5UyHpPk4Z
   fMCBhmDa9jeEkaa+SQKYaQ/I49VeuDYelHrNZvJcT/SzgIJ5cnwCuhVuO
   9J4tHByp8w/qde1r/lpoLBL6qu9apix8dfd6tJqDJ9x21uCC9LO1ITPSp
   00/Tk/E2pWLAo8lvBNrhAgJ5iSiPiMBf4YTle9sJny5co3fqWG81II8An
   lcaVvEoJCPC2VFnmZBpgPSgb8aDrNE4FIHKSM8eUGGyc4oKKGP3YKEsmM
   A==;
X-CSE-ConnectionGUID: en7jYRdiTIu1GwpYFlSsBw==
X-CSE-MsgGUID: IHZwgfD8SNmQhbYqIb9TlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66412431"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66412431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 18:07:54 -0700
X-CSE-ConnectionGUID: ZwNmyg6rQZWqqrT7XllD3A==
X-CSE-MsgGUID: mTLgniuTRsWgXMQ+s+9qTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="186721818"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2025 18:07:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9CT8-0004L3-0q;
	Thu, 16 Oct 2025 01:07:50 +0000
Date: Thu, 16 Oct 2025 09:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid 60/64] kernel/sched/sched.h:3595:30: error:
 expected expression
Message-ID: <202510160847.giQBj835-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid
head:   e196d67a03daa4beb27afc2961845664ac3ef3d5
commit: a430e9c31893c17c9c13bcef7dfbdad1aa857761 [60/64] sched/mmcid: Provide new scheduler CID mechanism
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510160847.giQBj835-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160847.giQBj835-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160847.giQBj835-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:89:
>> kernel/sched/sched.h:3595:30: error: expected expression
    3595 |         for (; cid == MM_CID_UNSET; cpu_relax())
         |                                     ^
   arch/s390/include/asm/processor.h:291:21: note: expanded from macro 'cpu_relax'
     291 | #define cpu_relax() barrier()
         |                     ^
   include/linux/compiler.h:85:20: note: expanded from macro 'barrier'
      85 | # define barrier() __asm__ __volatile__("": : :"memory")
         |                    ^
   In file included from kernel/sched/core.c:89:
>> kernel/sched/sched.h:3595:30: error: expected ')'
   arch/s390/include/asm/processor.h:291:21: note: expanded from macro 'cpu_relax'
     291 | #define cpu_relax() barrier()
         |                     ^
   include/linux/compiler.h:85:20: note: expanded from macro 'barrier'
      85 | # define barrier() __asm__ __volatile__("": : :"memory")
         |                    ^
   kernel/sched/sched.h:3595:6: note: to match this '('
    3595 |         for (; cid == MM_CID_UNSET; cpu_relax())
         |             ^
   2 errors generated.


vim +3595 kernel/sched/sched.h

  3590	
  3591	static inline unsigned int mm_get_cid(struct mm_struct *mm)
  3592	{
  3593		unsigned int cid = __mm_get_cid(mm, READ_ONCE(mm->mm_cid.max_cids));
  3594	
> 3595		for (; cid == MM_CID_UNSET; cpu_relax())
  3596			cid = __mm_get_cid(mm, nr_cpu_ids);
  3597	
  3598		return cid;
  3599	}
  3600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
