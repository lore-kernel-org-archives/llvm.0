Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6F19DFB4;
	Mon, 23 Dec 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734957698; cv=none; b=ZEbAcvMzW1AFD3qs33CaRsHe05hRtazTk7jxZBO9oC20ovN22X4whPTE23qs0I3rQ2xETjRYQGQBieDV50gztl2iUZ0cslzgXrLSruLrUuEdFwh6rnwIu5T0jHm3EUwSwT1L91kuEvH4Q8kp/MHd+3hEwcSSIkzCt0huKkggiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734957698; c=relaxed/simple;
	bh=L+YxQcEOgXNHxMddVjNfSi3hx+4G5NNjAUaqSfVyCpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEP0wdNYh5CJS1cyR068AriB7GUUBbG22wuNF8kvoa6rLxVr3RBPVCotsT6LySoQwPmcebBPb0nVlb25M3qzXPsgze7zYPJQ+VGHViIJjs1izrK1lUuJaOWjEL77WABXXd7KAfzX7+A+uh6IaP/iikOMuOieaOASIWZDylsDqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASmir0OI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASmir0OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734957696; x=1766493696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+YxQcEOgXNHxMddVjNfSi3hx+4G5NNjAUaqSfVyCpQ=;
  b=ASmir0OIvHBpAZfNCjLNCs0T8XCb4fAgkx06JX97th+KwSBD6JKvEqSH
   0Zq3j2SEZNpBBVRNxl9IcnsQpQpb7Pg0xW7cYUvFrHNi67psEGj+Yi7Kb
   N9NJGEI3+Xrsbr/hOmVS+zcz00qOd3R2c6vJVa9w4paz2jUTcDAvG/teG
   8GcI7URJv9+yz0VVJa67Y1QYW70dLNFwtimKhqQsmswWhwk8zwTUFG89j
   HN/WoqId0tvRR90BgD5HzPlEiO2aVER+KOvXtG3ygDwNnVAv+TLyNXZA0
   iojsvrF0wUv4n/9ecf5c7Lb51V1aQNlYJurhHhS1BtYMnbfCw9s2mj+b+
   g==;
X-CSE-ConnectionGUID: 4uSKpBSNQFKxUwTjNTD+DQ==
X-CSE-MsgGUID: jq12t1sNQTSltgaM7zqJ9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="23008526"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="23008526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 04:41:35 -0800
X-CSE-ConnectionGUID: 7uffrvwjQtefBERyCCjFhg==
X-CSE-MsgGUID: 02RzGsxqQJi2m11SdTmWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99716687"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 04:41:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPhkY-0003ad-0K;
	Mon, 23 Dec 2024 12:41:30 +0000
Date: Mon, 23 Dec 2024 20:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
	jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@redhat.com, airlied@gmail.com,
	daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
Message-ID: <202412232014.2tGzY28v-lkp@intel.com>
References: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>

Hi Jammy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/drm-ast-Support-timings-1280x720-1280x960-1600x900/20241223-161735
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241223081044.4139167-1-jammy_huang%40aspeedtech.com
patch subject: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
config: i386-buildonly-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232014.2tGzY28v-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412232014.2tGzY28v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412232014.2tGzY28v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_mode.c:481:31: error: use of undeclared identifier 'AST_IO_SEQ_PORT'
     481 |                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
         |                                             ^
   drivers/gpu/drm/ast/ast_mode.c:483:31: error: use of undeclared identifier 'AST_IO_SEQ_PORT'
     483 |                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xf7, 0x00);
         |                                             ^
   2 errors generated.


vim +/AST_IO_SEQ_PORT +481 drivers/gpu/drm/ast/ast_mode.c

   461	
   462	static void ast_set_dclk_reg(struct ast_device *ast,
   463				     struct drm_display_mode *mode,
   464				     struct ast_vbios_mode_info *vbios_mode)
   465	{
   466		const struct ast_vbios_dclk_info *clk_info;
   467	
   468		if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
   469			clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
   470		else
   471			clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
   472	
   473		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
   474		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
   475		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
   476				       (clk_info->param3 & 0xc0) |
   477				       ((clk_info->param3 & 0x3) << 4));
   478	
   479		/* Set SEQ; Half dclk for this timing */
   480		if (vbios_mode->enh_table->flags & HalfDCLK)
 > 481			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
   482		else
   483			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xf7, 0x00);
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
