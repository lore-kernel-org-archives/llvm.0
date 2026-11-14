Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641405;
	b=YZN5gX3vLOvWyKMyFKYsoF1A4v2NxqQbAep+SZFqgxer+OpRi6dYZAvLZT151tfhpHYf
	 UJ8icSQZGN5eSe28bOqod4qfA5O06sHlphuk1Ay4KkSpWA17+ELZzUkM2dVscUK5fHAoh
	 RCdXUDngYSCCc+xztqMEXwt/AmIxX/lKCmyRhbFDWpbwkMVB3425WV6PMgSeX7j90awqw
	 HrBBE20sbTzh9MMWo1eoWqsllRFNA6p6FzP3DPTJH1pnC/PUq2mEmReq1UdOFP4jlFr7S
	 Zptj+AiC/KF4nUJXfRNoRuRuNfVd3M2SOgdNqHuL6dmWwq6eKWkntGMfFw6lTYZECyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641405;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SOxV9gWxcelbH4hLfP0QpC3+Z3ja0CyXlMq5J4ZxgCw=;
	b=Xy6pQdv/ivmSdfUInyESRjQBJkvCRh9Hbsz17aQ7Vbn1XgUGvlIKWNdbvLFQq7/8IBYV
	 cWniav2O6B+esiPSwlL54g5yUyo1yWe23zNlb3yIKLXcYBGbbLurjrETu52Jdw8E8ShQL
	 D44Q7tlGz6BCT71qygHphMcutGKHlbdtv9xtbPosEdqlIOYZR34i6s9bf+SrsJD1wG+Wk
	 /PM4dmvRx+z9l7kaWPWu2iOfJz72HE4H7U7PvXn4P28AiZkkU9wHmwyUmcBE6DsbyNIKN
	 Mm2F2SNN7V5UsDs5p4P22edg33sbMy1EoA9Oz3i4tUHidpebjr4T3yPaWCvtuFE9RXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6wRsCdm;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9E606A327;
	Sat, 14 Nov 2026 07:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE9E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6wRsCdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794641405; x=1826177405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jtBq9+EiJWNmieGYq6I71zFt7YpP0HRvAchRg22hg6M=;
  b=G6wRsCdm0KYYgzup0Su8GXgOCtUTQJj1a75LJ5+rbm3ylx3ks1RlBapC
   xTJKtbPsBe8Z+A566XMplwBEuIlYcw4qZA3CQ5+oWiaSuDY5tlwsLt7MY
   7GeMmhT7BS7t4X06S6IEg6ad2J1KTm4d9NZ7aqqZZYwMomSUH1YBMI78F
   Yg0su+Ws+PlT5xwa0eX6BiQgmWrxHs1yCgHVJM7tNiXxwfs7woVzI/ML+
   NLFM3VR0FOelCVSMlwAzhstrZVCa8X6/qbHiwUogwHoI6Kj3rsU50hpC6
   fMPq1p3jG5rpt7Lmx9VtZl3k9rwweMYDyl03chY1SNRdGULpBlNwBbCkm
   A==;
X-CSE-ConnectionGUID: 08Dxh13AQL6LUV9ngOp1mQ==
X-CSE-MsgGUID: CPCAqseGQcaqHdcH+fH0CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3303343"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3303343"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 23:30:04 -0800
X-CSE-ConnectionGUID: TUfNe519Q/CkIvW4UvGnKQ==
X-CSE-MsgGUID: SXjkN1z4Q2q+4o3j3GnYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="11011097"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 13 Nov 2026 23:29:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS8Cv-0000000154q-0ykP;
	Sat, 14 Nov 2026 07:29:53 +0000
Date: Sat, 14 Nov 2026 15:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <202611141531.Yu2Xl6F2-lkp@intel.com>
References: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>
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
In-Reply-To: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on drm-misc/drm-misc-next ath/ath-next linus/master v7.4-rc2 next-20261112]
[cannot apply to linux-review/Mukesh-Ojha/remoteproc-qcom_wcnss-migrate-to-qcom_mdt_pas_load-and-qcom_pas_prepare_and_auth_reset/20260925-212730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom-pas-add-qcom_pas_context_init-for-pre-allocated-context/20261114-002001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20261113185009.157893-3-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261114/202611141531.Yu2Xl6F2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141531.Yu2Xl6F2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141531.Yu2Xl6F2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/qcom_wcnss.c:161:63: error: incompatible integer to pointer conversion passing 'phys_addr_t' (aka 'unsigned int') to parameter of type 'phys_addr_t *' (aka 'unsigned int *'); take the address with & [-Wint-conversion]
     161 |         ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
         |                                                                      ^~~~~~~~~~~~~~~~
         |                                                                      &
   include/linux/soc/qcom/mdt_loader.h:24:44: note: passing argument to parameter 'reloc_base' here
      24 |                       const char *firmware, phys_addr_t *reloc_base);
         |                                                          ^
   1 error generated.


vim +161 drivers/remoteproc/qcom_wcnss.c

   155	
   156	static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
   157	{
   158		struct qcom_wcnss *wcnss = rproc->priv;
   159		int ret;
   160	
 > 161		ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
   162		if (ret)
   163			return ret;
   164	
   165		qcom_pil_info_store("wcnss", wcnss->mem_phys, wcnss->mem_size);
   166	
   167		return 0;
   168	}
   169	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
