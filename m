Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151710E9;
	Wed, 23 Aug 2023 01:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692754582; x=1724290582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3VidKf/oV/xeJfywrfMmJnZGabtP4bZ552VU4txec74=;
  b=QpkFfBwyrkDVTZCROyl5xpQwULZW3yZ9+yDD6FUGu1CGxli+mgpYBomU
   H1umy4ZGFdiUJzF91tir5l2BuSTf5EIjhqAXsHZFbbdLP5GazdWabuQpJ
   Z5asIb3s/Om8ezJUBTzFIMcXOYLh4jXeeRUM145GDDHuR0JPAtIZp/nzA
   oWwScKBJ/qd68ZLfHcclRjMUN/pHMHwx9UcZhiiZPnBkhl/SGkdyyHvNq
   6Gv25P256RdDOAOBeLpL1k9BOnEeziT5Bvhp9W5JFAxjfs+EkSyA5chNh
   0SLs9OnXzVldj6kOUIM02BUIOomlPYCBJgdch98fdv8iKPnwq4iB/ypJL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="364218624"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364218624"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 18:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="806496697"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806496697"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 18:36:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYcn9-0000iP-1O;
	Wed, 23 Aug 2023 01:36:15 +0000
Date: Wed, 23 Aug 2023 09:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Zhang <quic_taozha@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tao Zhang <quic_taozha@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	Leo Yan <leo.yan@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Hao Zhang <quic_hazha@quicinc.com>, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Subject: Re: [PATCH v8 04/13] coresight-tpda: Add DSB dataset support
Message-ID: <202308230927.JBX1uKOE-lkp@intel.com>
References: <1692681973-20764-5-git-send-email-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692681973-20764-5-git-send-email-quic_taozha@quicinc.com>

Hi Tao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Zhang/coresight-tpdm-Remove-the-unnecessary-lock/20230822-132946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1692681973-20764-5-git-send-email-quic_taozha%40quicinc.com
patch subject: [PATCH v8 04/13] coresight-tpda: Add DSB dataset support
config: arm64-randconfig-r031-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230927.JBX1uKOE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230927.JBX1uKOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230927.JBX1uKOE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-tpda.c:168:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (atomic_read(&in->dest_refcnt) == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-tpda.c:177:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/hwtracing/coresight/coresight-tpda.c:168:2: note: remove the 'if' if its condition is always true
           if (atomic_read(&in->dest_refcnt) == 0) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-tpda.c:165:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +168 drivers/hwtracing/coresight/coresight-tpda.c

   159	
   160	static int tpda_enable(struct coresight_device *csdev,
   161			       struct coresight_connection *in,
   162			       struct coresight_connection *out)
   163	{
   164		struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
   165		int ret;
   166	
   167		spin_lock(&drvdata->spinlock);
 > 168		if (atomic_read(&in->dest_refcnt) == 0) {
   169			ret = __tpda_enable(drvdata, in->dest_port);
   170			if (!ret) {
   171				atomic_inc(&in->dest_refcnt);
   172				dev_dbg(drvdata->dev, "TPDA inport %d enabled.\n", in->dest_port);
   173			}
   174		}
   175	
   176		spin_unlock(&drvdata->spinlock);
   177		return ret;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
