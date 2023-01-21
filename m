Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3E62F;
	Sat, 21 Jan 2023 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674280560; x=1705816560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYCnjQ4jVjtj2SK4L6Bb3eiiLTZHYITEPxiU1b6txH8=;
  b=HjsmhqVsK8TxqQzwrhF7s2xCoNwCW/e8cMMpYwjYEjeL9T3IDob3SWdo
   N9cVLwpUSw4BKxEDOuhMj+8wXmQlg0hbFUwKzTfVLdgaRBfsUm7ehoB+H
   3ULDLUeQHEQ6kr5vrGYFbeDqUBXcD7QIbudKlXZLIybir+bg6BvAwEfnf
   W1f5OsCOkPq8qnmeByDmfC3nppfvRUqfHn/Zj2wjuiP+OiKgTEyQqFyWY
   O6DBFJiixPsfe3zHfUjpABkd/ah0WWOrPnR8vrCQq8EMXn15s4OMrFnp5
   GoJtkHB2lqlDlO+9s3ckAF8q9XW6mCtVcd4ONQ4Zfc6LXL4j+0KT6tKBj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313651681"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="313651681"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="638394394"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="638394394"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 21:55:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6r7-0003cS-12;
	Sat, 21 Jan 2023 05:55:57 +0000
Date: Sat, 21 Jan 2023 13:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: [coresight:next 21/28]
 drivers/hwtracing/coresight/coresight-core.c:1176:7: warning: variable
 'hash' is used uninitialized whenever switch case is taken
Message-ID: <202301211339.9mU0dccO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   758d638667d474ff6b0a9052a8298f04c7ddf62f
commit: 5c0016d7b343e453e38752ca58bc18394ece310a [21/28] coresight: core: Use IDR for non-cpu bound sources' paths.
config: arm64-randconfig-r012-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211339.9mU0dccO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/commit/?id=5c0016d7b343e453e38752ca58bc18394ece310a
        git remote add coresight https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
        git fetch --no-tags coresight next
        git checkout 5c0016d7b343e453e38752ca58bc18394ece310a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/ drivers/hwtracing/coresight/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-core.c:1176:7: warning: variable 'hash' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1195:24: note: uninitialized use occurs here
           idr_remove(&path_idr, hash);
                                 ^~~~
>> drivers/hwtracing/coresight/coresight-core.c:1190:2: warning: variable 'hash' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1195:24: note: uninitialized use occurs here
           idr_remove(&path_idr, hash);
                                 ^~~~
   drivers/hwtracing/coresight/coresight-core.c:1164:10: note: initialize the variable 'hash' to silence this warning
           u32 hash;
                   ^
                    = 0
   2 warnings generated.


vim +/hash +1176 drivers/hwtracing/coresight/coresight-core.c

a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1159  
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1160  void coresight_disable(struct coresight_device *csdev)
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1161  {
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1162  	int cpu, ret;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1163  	struct list_head *path = NULL;
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1164  	u32 hash;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1165  
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1166  	mutex_lock(&coresight_mutex);
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1167  
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1168  	ret = coresight_validate_source(csdev, __func__);
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1169  	if (ret)
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1170  		goto out;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1171  
f73f20e1fcc9fc drivers/hwtracing/coresight/coresight.c      Suzuki K Poulose 2017-06-05  1172  	if (!csdev->enable || !coresight_disable_source(csdev))
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1173  		goto out;
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1174  
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1175  	switch (csdev->subtype.source_subtype) {
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03 @1176  	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  1177  		cpu = source_ops(csdev)->cpu_id(csdev);
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1178  		path = per_cpu(tracer_path, cpu);
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1179  		per_cpu(tracer_path, cpu) = NULL;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1180  		break;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1181  	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1182  		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1183  		/* Find the path by the hash. */
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1184  		path = idr_find(&path_idr, hash);
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1185  		if (path == NULL) {
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1186  			pr_err("Path is not found for %s\n", dev_name(&csdev->dev));
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1187  			goto out;
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1188  		}
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1189  		break;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03 @1190  	default:
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1191  		/* We can't be here */
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1192  		break;
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1193  	}
a685d68328f145 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-05-03  1194  
5c0016d7b343e4 drivers/hwtracing/coresight/coresight-core.c Mao Jinlong      2023-01-17  1195  	idr_remove(&path_idr, hash);
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  1196  	coresight_disable_path(path);
b3e94405941e69 drivers/hwtracing/coresight/coresight.c      Mathieu Poirier  2016-02-17  1197  	coresight_release_path(path);
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1198  
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1199  out:
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1200  	mutex_unlock(&coresight_mutex);
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1201  }
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1202  EXPORT_SYMBOL_GPL(coresight_disable);
a06ae8609b3dd0 drivers/coresight/coresight.c                Pratik Patel     2014-11-03  1203  

:::::: The code at line 1176 was first introduced by commit
:::::: a685d68328f14579b2e68d6a3a2066089cffbf98 coresight: adding path for STM device

:::::: TO: Mathieu Poirier <mathieu.poirier@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
