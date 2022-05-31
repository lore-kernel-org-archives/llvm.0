Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FA18D
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653978722; x=1685514722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GlZMiryq20PHVIOwKQIJ2kXn5tZS7yxCLfxDhxlPJU=;
  b=I6+x8XbJKVnWohiBX2743qFYjgaHZrBF2fEcY7ETry1cjUz2MvsX8Ki2
   RmnAth4pvsjkDBhakf0cAzg7gyfJSDb09JBud3r/ngFzno1zuPZTx5B2e
   RZxKUu+ov1ff5JxpGvxS45UppJkq+CVRCi0LNoxcbJbjc7Lo4OYhBsqzT
   B5f2YYe9cXGo+k8ta3lSYsHkppbeVR0dqmjZnoJfLiY0dt8WRMJw6Sq94
   KiWRXIHFYC8WymKpztAUO5j50V6vpsWuhf+PW/0XxQy5Q+H/lPx9s0AfA
   A4vy5TRY50P6P+94MlKZNAopwiYCr2jGd0x66q5nv91iQVV5cEAW+ukBn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="273963337"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="273963337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 23:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="754468071"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2022 23:31:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvvQ6-0002QI-I0;
	Tue, 31 May 2022 06:31:58 +0000
Date: Tue, 31 May 2022 14:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guangbin Huang <huangguangbin2@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:949:12:
 warning: stack frame size (1048) exceeds limit (1024) in
 'hclge_dbg_dump_tm_pri'
Message-ID: <202205311418.t6cRf5o7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: 04d96139ddb32dd15e5941c303f511a92759a5be net: hns3: refine function hclge_dbg_dump_tm_pri()
date:   9 months ago
config: mips-randconfig-r001-20220530 (https://download.01.org/0day-ci/archive/20220531/202205311418.t6cRf5o7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04d96139ddb32dd15e5941c303f511a92759a5be
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04d96139ddb32dd15e5941c303f511a92759a5be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/ethernet/hisilicon/hns3/hns3pf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:949:12: warning: stack frame size (1048) exceeds limit (1024) in 'hclge_dbg_dump_tm_pri' [-Wframe-larger-than]
   static int hclge_dbg_dump_tm_pri(struct hclge_dev *hdev, char *buf, int len)
              ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:722:12: warning: stack frame size (1088) exceeds limit (1024) in 'hclge_dbg_dump_tm_pg' [-Wframe-larger-than]
   static int hclge_dbg_dump_tm_pg(struct hclge_dev *hdev, char *buf, int len)
              ^
   2 warnings generated.


vim +/hclge_dbg_dump_tm_pri +949 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c

04d96139ddb32d Guangbin Huang 2021-08-30   948  
04987ca1b9b684 Guangbin Huang 2021-01-28  @949  static int hclge_dbg_dump_tm_pri(struct hclge_dev *hdev, char *buf, int len)
04987ca1b9b684 Guangbin Huang 2021-01-28   950  {
04d96139ddb32d Guangbin Huang 2021-08-30   951  	char data_str[ARRAY_SIZE(tm_pri_items)][HCLGE_DBG_DATA_STR_LEN];
04d96139ddb32d Guangbin Huang 2021-08-30   952  	struct hclge_tm_shaper_para c_shaper_para, p_shaper_para;
04d96139ddb32d Guangbin Huang 2021-08-30   953  	char *result[ARRAY_SIZE(tm_pri_items)], *sch_mode_str;
04d96139ddb32d Guangbin Huang 2021-08-30   954  	char content[HCLGE_DBG_TM_INFO_LEN];
04d96139ddb32d Guangbin Huang 2021-08-30   955  	u8 pri_num, sch_mode, weight, i, j;
04d96139ddb32d Guangbin Huang 2021-08-30   956  	int pos, ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   957  
04987ca1b9b684 Guangbin Huang 2021-01-28   958  	ret = hclge_tm_get_pri_num(hdev, &pri_num);
04987ca1b9b684 Guangbin Huang 2021-01-28   959  	if (ret)
04987ca1b9b684 Guangbin Huang 2021-01-28   960  		return ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   961  
04d96139ddb32d Guangbin Huang 2021-08-30   962  	for (i = 0; i < ARRAY_SIZE(tm_pri_items); i++)
04d96139ddb32d Guangbin Huang 2021-08-30   963  		result[i] = &data_str[i][0];
04d96139ddb32d Guangbin Huang 2021-08-30   964  
04d96139ddb32d Guangbin Huang 2021-08-30   965  	hclge_dbg_fill_content(content, sizeof(content), tm_pri_items,
04d96139ddb32d Guangbin Huang 2021-08-30   966  			       NULL, ARRAY_SIZE(tm_pri_items));
04d96139ddb32d Guangbin Huang 2021-08-30   967  	pos = scnprintf(buf, len, "%s", content);
04987ca1b9b684 Guangbin Huang 2021-01-28   968  
04987ca1b9b684 Guangbin Huang 2021-01-28   969  	for (i = 0; i < pri_num; i++) {
04987ca1b9b684 Guangbin Huang 2021-01-28   970  		ret = hclge_tm_get_pri_sch_mode(hdev, i, &sch_mode);
04987ca1b9b684 Guangbin Huang 2021-01-28   971  		if (ret)
04987ca1b9b684 Guangbin Huang 2021-01-28   972  			return ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   973  
04987ca1b9b684 Guangbin Huang 2021-01-28   974  		ret = hclge_tm_get_pri_weight(hdev, i, &weight);
04987ca1b9b684 Guangbin Huang 2021-01-28   975  		if (ret)
04987ca1b9b684 Guangbin Huang 2021-01-28   976  			return ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   977  
04987ca1b9b684 Guangbin Huang 2021-01-28   978  		ret = hclge_tm_get_pri_shaper(hdev, i,
04987ca1b9b684 Guangbin Huang 2021-01-28   979  					      HCLGE_OPC_TM_PRI_C_SHAPPING,
04987ca1b9b684 Guangbin Huang 2021-01-28   980  					      &c_shaper_para);
04987ca1b9b684 Guangbin Huang 2021-01-28   981  		if (ret)
04987ca1b9b684 Guangbin Huang 2021-01-28   982  			return ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   983  
04987ca1b9b684 Guangbin Huang 2021-01-28   984  		ret = hclge_tm_get_pri_shaper(hdev, i,
04987ca1b9b684 Guangbin Huang 2021-01-28   985  					      HCLGE_OPC_TM_PRI_P_SHAPPING,
04987ca1b9b684 Guangbin Huang 2021-01-28   986  					      &p_shaper_para);
04987ca1b9b684 Guangbin Huang 2021-01-28   987  		if (ret)
04987ca1b9b684 Guangbin Huang 2021-01-28   988  			return ret;
04987ca1b9b684 Guangbin Huang 2021-01-28   989  
04987ca1b9b684 Guangbin Huang 2021-01-28   990  		sch_mode_str = sch_mode & HCLGE_TM_TX_SCHD_DWRR_MSK ? "dwrr" :
04987ca1b9b684 Guangbin Huang 2021-01-28   991  			       "sp";
04987ca1b9b684 Guangbin Huang 2021-01-28   992  
04d96139ddb32d Guangbin Huang 2021-08-30   993  		j = 0;
04d96139ddb32d Guangbin Huang 2021-08-30   994  		sprintf(result[j++], "%04u", i);
04d96139ddb32d Guangbin Huang 2021-08-30   995  		sprintf(result[j++], "%4s", sch_mode_str);
04d96139ddb32d Guangbin Huang 2021-08-30   996  		sprintf(result[j++], "%3u", weight);
04d96139ddb32d Guangbin Huang 2021-08-30   997  		hclge_dbg_fill_shaper_content(&c_shaper_para, result, &j);
04d96139ddb32d Guangbin Huang 2021-08-30   998  		hclge_dbg_fill_shaper_content(&p_shaper_para, result, &j);
04d96139ddb32d Guangbin Huang 2021-08-30   999  		hclge_dbg_fill_content(content, sizeof(content), tm_pri_items,
04d96139ddb32d Guangbin Huang 2021-08-30  1000  				       (const char **)result,
04d96139ddb32d Guangbin Huang 2021-08-30  1001  				       ARRAY_SIZE(tm_pri_items));
04d96139ddb32d Guangbin Huang 2021-08-30  1002  		pos += scnprintf(buf + pos, len - pos, "%s", content);
04987ca1b9b684 Guangbin Huang 2021-01-28  1003  	}
04987ca1b9b684 Guangbin Huang 2021-01-28  1004  
04987ca1b9b684 Guangbin Huang 2021-01-28  1005  	return 0;
04987ca1b9b684 Guangbin Huang 2021-01-28  1006  }
04987ca1b9b684 Guangbin Huang 2021-01-28  1007  

:::::: The code at line 949 was first introduced by commit
:::::: 04987ca1b9b6841cfa5f9b459c5a270b75c89345 net: hns3: add debugfs support for tm nodes, priority and qset info

:::::: TO: Guangbin Huang <huangguangbin2@huawei.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
