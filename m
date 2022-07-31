Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAEF5C93
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659261905; x=1690797905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XrKGOHCWlxiIpwsRk2vK8gQ4kMzcaBdSpvmBpIOpZk=;
  b=RESlRy5yxiAX0ylVyAR79Qpy9wiHyve6EjkUg6xiokA/vxqkQuBh/LCR
   XTv9N9fMNVFBNjlK9B113jwmDkqwkBjdKSCtaOfSxPR0tKjITHcM1z7ZY
   CgiszZuX3ksooM5aBsOY+xfDPHab1V3MaeqXQl9fSltIJVJP4Iqw7ieW0
   ZN0poSaJW1TKATECzGJh08phbca4ZzIyrlLmBSWkeNT8uDR9jJ/tSqfCu
   9Zpnxw4IgqzhB8u4OBkuFV3lwCZysqON0hIDhmoTNYcVXXu86vNmykcgp
   mISfa8qQry2J/8DERrI5fKnBcwr9XXx6zmbtxId1GI9INb3YUaC+tAVxd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="286541593"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="286541593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 03:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="629893502"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2022 03:05:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oI5ok-000E1L-1l;
	Sun, 31 Jul 2022 10:05:02 +0000
Date: Sun, 31 Jul 2022 18:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: [steev:linux-v5.19.0-rc8-tests 109/182]
 drivers/interconnect/qcom/icc-rpm.c:378:16: error: use of undeclared
 identifier 'src_qn'
Message-ID: <202207311834.fM0dvTaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux linux-v5.19.0-rc8-tests
head:   171125613e081f0d0d9aeb710dc7469ce2c6a219
commit: 20386c070c2d12a74092d72aef1c8be37a5f5177 [109/182] interconnect: qcom: icc-rpm: Set bandwidth and clock for bucket values
config: arm64-buildonly-randconfig-r005-20220731 (https://download.01.org/0day-ci/archive/20220731/202207311834.fM0dvTaU-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/steev/linux/commit/20386c070c2d12a74092d72aef1c8be37a5f5177
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev linux-v5.19.0-rc8-tests
        git checkout 20386c070c2d12a74092d72aef1c8be37a5f5177
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/interconnect/qcom/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/icc-rpm.c:378:16: error: use of undeclared identifier 'src_qn'
                   do_div(rate, src_qn->buswidth);
                                ^
   1 error generated.


vim +/src_qn +378 drivers/interconnect/qcom/icc-rpm.c

   328	
   329	static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
   330	{
   331		struct qcom_icc_provider *qp;
   332		struct qcom_icc_node *qn;
   333		struct icc_provider *provider;
   334		u64 sum_bw;
   335		u64 max_peak_bw;
   336		u64 rate;
   337		u64 agg_avg[QCOM_ICC_NUM_BUCKETS], agg_peak[QCOM_ICC_NUM_BUCKETS];
   338		u64 max_agg_avg, max_agg_peak;
   339		int ret, i;
   340		int bucket;
   341	
   342		qn = src->data;
   343		provider = src->provider;
   344		qp = to_qcom_provider(provider);
   345	
   346		qcom_icc_bus_aggregate(provider, agg_avg, agg_peak, &max_agg_avg,
   347				       &max_agg_peak);
   348	
   349		sum_bw = icc_units_to_bps(max_agg_avg);
   350		max_peak_bw = icc_units_to_bps(max_agg_peak);
   351	
   352		if (!qn->qos.ap_owned) {
   353			/* send bandwidth request message to the RPM processor */
   354			ret = qcom_icc_rpm_set(qn->mas_rpm_id, qn->slv_rpm_id, sum_bw);
   355			if (ret)
   356				return ret;
   357		} else if (qn->qos.qos_mode != -1) {
   358			/* set bandwidth directly from the AP */
   359			ret = qcom_icc_qos_set(src, sum_bw);
   360			if (ret)
   361				return ret;
   362		}
   363	
   364		for (i = 0; i < qp->num_clks; i++) {
   365			/*
   366			* Use WAKE bucket for active clock, otherwise, use SLEEP bucket
   367			* for other clocks.  If a platform doesn't set interconnect
   368			* path tags, by default use sleep bucket for all clocks.
   369			*
   370			* Note, AMC bucket is not supported yet.
   371			*/
   372			if (!strcmp(qp->bus_clks[i].id, "bus_a"))
   373				bucket = QCOM_ICC_BUCKET_WAKE;
   374			else
   375				bucket = QCOM_ICC_BUCKET_SLEEP;
   376	
   377			rate = icc_units_to_bps(max(agg_avg[bucket], agg_peak[bucket]));
 > 378			do_div(rate, src_qn->buswidth);
   379			rate = min_t(u64, rate, LONG_MAX);
   380	
   381			if (qp->bus_clk_rate[i] == rate)
   382				continue;
   383	
   384			ret = clk_set_rate(qp->bus_clks[i].clk, rate);
   385			if (ret) {
   386				pr_err("%s clk_set_rate error: %d\n",
   387				       qp->bus_clks[i].id, ret);
   388				return ret;
   389			}
   390			qp->bus_clk_rate[i] = rate;
   391		}
   392	
   393		return 0;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
