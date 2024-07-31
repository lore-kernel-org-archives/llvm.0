Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B71B3749;
	Wed, 31 Jul 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435227; cv=none; b=MlDpw+rQtl+tnEZHC2Bd+1tIEPmN0aqK7O1PCrAF8tE1U5aexmTOnFKM8i11OC9e574sBkFkP2KZQBlQew7n6uW2o9tarMCkzSx4shtkt5EXsZo78QOa+ne9KK57vrmzyHjCXNtuSKtJGyw1KcE6gY3yPyTCIZg13Djmszpx1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435227; c=relaxed/simple;
	bh=PsZ7vZbtm6qZyG0nHh+ujBlh/HQ25NrLbIHOdDMREow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F//0tHF9HKNGbuzqMEmFTjvX+aFHO/e0iaUnSs9Dm0Fvet7Qn7TJ7pD+hZsIgrnaMXDYdvVUQ5J7BE16CcMmVewPmxyRLYv7oeDF2puv8493L3Wnl2dcm97+/XZvyRNwsRrnB9VBriUZNNO7duWB8U2VO5FXOl08n+70oXEmbSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjC8UgQ2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjC8UgQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722435224; x=1753971224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsZ7vZbtm6qZyG0nHh+ujBlh/HQ25NrLbIHOdDMREow=;
  b=jjC8UgQ2eM2Lwz+LX5y/AMmEbddZcnaX9K9vyqg3j1VZXDUZY2sYd+At
   ngt/CWzcgGERHmJNm6OlyJISJ5RXQAvNyzFx1I0wLC5icqlIz//kouKo/
   2Xx0PnmJkeUTH4RJvFCzPmjtrwFPGc+p6BqazRPwdgU3tnQvyBr/zz82v
   M3x8AnOn9qd5uy1qMFEYzne/V1RBkpLHuP1r1P/cr2BU+jUR0mtcTYwQk
   Oyuv5IHVBbzLQnJq6dM4n9/zST7oVs7j0ehz+EDqcD6SQTvd3YPC5gy9o
   T+SUgco5/TLbwo2aFxlpPYR9P4jYvQwDJF9mrF55suxK1Zf6a/DwH4od6
   Q==;
X-CSE-ConnectionGUID: MwPncxMJQOOvTMvd4uBBFA==
X-CSE-MsgGUID: ZfDTPrw/SNukJWJkKTi34A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30899325"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30899325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:13:43 -0700
X-CSE-ConnectionGUID: 7hvZbxjQTP2MR4C1o+DkNw==
X-CSE-MsgGUID: 7hDysihvRIyNzIlnuqHv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="85333005"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2024 07:13:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZA5C-000uPL-38;
	Wed, 31 Jul 2024 14:13:38 +0000
Date: Wed, 31 Jul 2024 22:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240729-cbc-2 8/9]
 ./usr/include/scsi/fc/fc_els.h:1130:53: error: use of undeclared identifier
 'desc_tags'
Message-ID: <202407312216.neWTKzbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240729-cbc-2
head:   7028047dd569cc1fc6fcda22626a7c85347fadbd
commit: 06621fb3befe6bcfd46d10a14ea18b22b9daa740 [8/9] scsi: fc: Avoid -Wflex-array-member-not-at-end warnings
config: i386-buildonly-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407312216.neWTKzbG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312216.neWTKzbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312216.neWTKzbG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/scsi/fc/fc_els.h:1130:16: error: implicit declaration of function 'offsetof' [-Werror,-Wimplicit-function-declaration]
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                ^
>> ./usr/include/scsi/fc/fc_els.h:1130:25: error: expected expression
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                         ^
>> ./usr/include/scsi/fc/fc_els.h:1130:53: error: use of undeclared identifier 'desc_tags'
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                                                     ^
   ./usr/include/scsi/fc/fc_els.h:1148:25: error: expected expression
    1148 | _Static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |                         ^
>> ./usr/include/scsi/fc/fc_els.h:1148:44: error: use of undeclared identifier 'desc'
    1148 | _Static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |                                            ^
   5 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
