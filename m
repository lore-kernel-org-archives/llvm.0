Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905F4C9E1C;
	Sun, 18 Oct 2026 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335130; cv=none; b=VzyTrZx29lX9wYHzaIVXRoMBeRwLt4Wyf68ZfjAqt+Yk0pNVQOaFIjlxnO0J9osKBnX3krPxc/YxbeziLmvjDmXnel2aByph5CAPlUGqyPXzBewFl6ftcF1otx1iDDWAGmtNUqg8R8yyZIDJ2jJ1/tY2ZjM+BasGldu8JKMVtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335130; c=relaxed/simple;
	bh=8JK5n4UiR2sk70NeOsm9MCvRPii9PmbkUF055TEG2WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh/r9ZEZpwb136k2agg5PKjIlay2vGk+svvQjJZ1W7Lxz5iNco8r8Tbluhah3xvw4S3ZdGC4D80HfpC+lWf2IlkieZFf04dxRUJnQt/YCzhgdfnaOE1A63W5i5mM1vQpybeJRr7g+HENZuyShZTiDkt+7lglUGqR0bg4sfngz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPsiTVjt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPsiTVjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792335127; x=1823871127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8JK5n4UiR2sk70NeOsm9MCvRPii9PmbkUF055TEG2WY=;
  b=BPsiTVjtowA22KqkSPKq9tod7ri1tKuIUNckD17eZXa/o54YQ/TSRUhA
   tFwY5/v86NMOyDUfR1u0TmBi1/y2rL5MKggI8pOmG8JAQbd+/XQo7boNn
   wpoDEQ3mdT7ClGqcYfSJlvbrisBbG74N3OifoyGhyxGZlFXCkZaZ+joK0
   5FvFEQ2YaZaBLAOPpNoTSBX//qZ6Xhi+EeBFh3Imq54CqCkKaL98omLrS
   puhJDNarYYaZbyiFkIMfrKDfXDk35lr79OSpKoWGt2BsmtWzEKhtuuuzh
   aAy5ldEetftCHhNAhOl1SVIPh81TOCA1m7WUJRStjyTA5dXEfNVrPyV/N
   A==;
X-CSE-ConnectionGUID: ESD5r3fRRZ2mmOy2/8lxNA==
X-CSE-MsgGUID: vuuMN9+2RnS2gb9msBk7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="936963"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="936963"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 07:52:06 -0700
X-CSE-ConnectionGUID: T39agZ+KQRWe8mTPsVjnmQ==
X-CSE-MsgGUID: pGfObVT1RNKr7BCe1edcsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4123360"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 18 Oct 2026 07:52:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xISEy-00000000KV8-1qki;
	Sun, 18 Oct 2026 14:52:00 +0000
Date: Sun, 18 Oct 2026 22:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata
 buffer for ROI delta QP
Message-ID: <202610182259.q2CvO4TK-lkp@intel.com>
References: <20261016-enc_roi_enable-v10-5-bc5bd37b6f3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-enc_roi_enable-v10-5-bc5bd37b6f3e@oss.qualcomm.com>

Hi Deepa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 64f76d5d9fd17a5661d7e5eab2aa99218db60d0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-v4l2-core-add-new-control-type-V4L2_CTRL_TYPE_S8/20261016-160032
base:   64f76d5d9fd17a5661d7e5eab2aa99218db60d0b
patch link:    https://lore.kernel.org/r/20261016-enc_roi_enable-v10-5-bc5bd37b6f3e%40oss.qualcomm.com
patch subject: [PATCH v10 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP
config: hexagon-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261018/202610182259.q2CvO4TK-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182259.q2CvO4TK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182259.q2CvO4TK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_buffer.c:955:22: warning: unused variable 'f' [-Wunused-variable]
     955 |         struct v4l2_format *f = inst->fmt_src;
         |                             ^
   1 warning generated.


vim +/f +955 drivers/media/platform/qcom/iris/iris_buffer.c

   947	
   948	static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
   949	{
   950		s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
   951		u32 payload_offset, lcu_width, lcu_height, row_size;
   952		u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
   953		struct metabuf_header *mbuf_hdr = buffer->kvaddr;
   954		struct metapayload_header *mbuf_payload_hdr;
 > 955		struct v4l2_format *f = inst->fmt_src;
   956		s16 *p_16, *p_temp;
   957	
   958		memset(mbuf_hdr, 0, sizeof(struct metabuf_header) +
   959			sizeof(struct metapayload_header));
   960		mbuf_hdr->count = 1;
   961		mbuf_hdr->size = sizeof(struct metabuf_header) +
   962				 sizeof(struct metapayload_header);
   963		mbuf_hdr->version = BIT(16);
   964		mbuf_hdr++;
   965		mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
   966		payload_offset = sizeof(struct metabuf_header) +
   967				 sizeof(struct metapayload_header);
   968	
   969		mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
   970		mbuf_payload_hdr->version = BIT(16);
   971		mbuf_payload_hdr->offset = ALIGN(payload_offset, 256);
   972	
   973		if (inst->codec == V4L2_PIX_FMT_HEVC) {
   974			lcu_width = DIV_ROUND_UP(inst->enc_raw_width, 32);
   975			lcu_height = DIV_ROUND_UP(inst->enc_raw_height, 32);
   976		} else {
   977			lcu_width = DIV_ROUND_UP(inst->enc_raw_width, 16);
   978			lcu_height = DIV_ROUND_UP(inst->enc_raw_height, 16);
   979		}
   980		/* Firmware expects each row to align to 8 LCU */
   981		row_size = ALIGN(lcu_width, 8);
   982		mbuf_payload_hdr->size = row_size * lcu_height * sizeof(s16) + 256;
   983	
   984		if (array_size != (lcu_width * lcu_height))
   985			return -EINVAL;
   986	
   987		/* Firmware expects 2bytes of delta_Qp, int16_t */
   988		p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
   989		for (int j = 0; j < lcu_height; j++) {
   990			p_temp = p_16 + j * row_size;
   991			for (int i = 0; i < lcu_width; i++)
   992				*p_temp++ = BIT(11) | ((p_array[j * lcu_width + i]
   993							   & 0x3F) << 4);
   994		}
   995	
   996		return 0;
   997	}
   998	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
