Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2F1FBB;
	Tue, 31 Jan 2023 10:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675160579; x=1706696579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXu0fkS8FTZFoU1MeF5vZ4+gXFVaY+cRljoDthUtj80=;
  b=JewfLBNuVzp0xDZZV1FBdENEVgO/8fMbc4dCpKsVk38Ct7IkBxH62VDI
   6v6wn6NGJVZ/+kaxIZ6SC1AEBXK9rX5puqJjx4hE1gT1XrI1gwx5HMHNT
   sgPpRyAOSlZ3dxDH4peIz0bfzCuYbZSOoFZY7SiOAwNsH7KP0b92VCPZD
   oFW9+jI785BLy0HL0Vzq5AT7FYXzy0cxI9072v67Tof3oWbWUxObFsQvA
   zGDv3BqXEenlWL1geltiIihD5xS3/jb2z6H0qktQqLamsKYdslqy+ZiCJ
   BynR2PGTqQY7OWn0tGPaJ0jVBUNScalwxD+V111FYAekeA1WQspNx8otd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329074377"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="329074377"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 02:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="657821369"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="657821369"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2023 02:22:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMnmq-0004MY-0A;
	Tue, 31 Jan 2023 10:22:48 +0000
Date: Tue, 31 Jan 2023 18:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>
Subject: drivers/platform/chrome/cros_ec_proto_test.c:2530:13: warning: stack
 frame size (1040) exceeds limit (1024) in
 'cros_ec_proto_test_get_sensor_count_legacy'
Message-ID: <202301311846.Y75Dbssa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tzung-Bi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   22b8077d0fcec86c6ed0e0fce9f7e7e5a4c2d56a
commit: 33f0fdba6066b504ee0b5f1480b1f93b06050df6 platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
date:   7 months ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301311846.Y75Dbssa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=33f0fdba6066b504ee0b5f1480b1f93b06050df6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 33f0fdba6066b504ee0b5f1480b1f93b06050df6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/steering/ drivers/platform/chrome/ drivers/staging/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_ec_proto_test.c:2530:13: warning: stack frame size (1040) exceeds limit (1024) in 'cros_ec_proto_test_get_sensor_count_legacy' [-Wframe-larger-than]
   static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
               ^
   140/1040 (13.46%) spills, 900/1040 (86.54%) variables
   1 warning generated.


vim +/cros_ec_proto_test_get_sensor_count_legacy +2530 drivers/platform/chrome/cros_ec_proto_test.c

  2529	
> 2530	static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
  2531	{
  2532		struct cros_ec_proto_test_priv *priv = test->priv;
  2533		struct cros_ec_device *ec_dev = &priv->ec_dev;
  2534		struct ec_xfer_mock *mock;
  2535		int ret, i;
  2536		struct cros_ec_dev ec;
  2537		struct {
  2538			u8 readmem_data;
  2539			int expected_result;
  2540		} test_data[] = {
  2541			{ 0, 0 },
  2542			{ EC_MEMMAP_ACC_STATUS_PRESENCE_BIT, 2 },
  2543		};
  2544	
  2545		ec_dev->max_request = 0xff;
  2546		ec_dev->max_response = 0xee;
  2547		ec_dev->cmd_readmem = cros_kunit_readmem_mock;
  2548		ec.ec_dev = ec_dev;
  2549		ec.dev = ec_dev->dev;
  2550		ec.cmd_offset = 0;
  2551	
  2552		for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
  2553			/* For EC_CMD_MOTION_SENSE_CMD. */
  2554			{
  2555				mock = cros_kunit_ec_xfer_mock_addx(test, -EPROTO, EC_RES_SUCCESS, 0);
  2556				KUNIT_ASSERT_PTR_NE(test, mock, NULL);
  2557			}
  2558	
  2559			/* For readmem. */
  2560			{
  2561				cros_kunit_readmem_mock_data = kunit_kzalloc(test, 1, GFP_KERNEL);
  2562				KUNIT_ASSERT_PTR_NE(test, cros_kunit_readmem_mock_data, NULL);
  2563				cros_kunit_readmem_mock_data[0] = test_data[i].readmem_data;
  2564	
  2565				cros_kunit_ec_xfer_mock_default_ret = 1;
  2566			}
  2567	
  2568			ret = cros_ec_get_sensor_count(&ec);
  2569			KUNIT_EXPECT_EQ(test, ret, test_data[i].expected_result);
  2570	
  2571			/* For EC_CMD_MOTION_SENSE_CMD. */
  2572			{
  2573				struct ec_params_motion_sense *data;
  2574	
  2575				mock = cros_kunit_ec_xfer_mock_next();
  2576				KUNIT_EXPECT_PTR_NE(test, mock, NULL);
  2577	
  2578				KUNIT_EXPECT_EQ(test, mock->msg.version, 1);
  2579				KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_MOTION_SENSE_CMD);
  2580				KUNIT_EXPECT_EQ(test, mock->msg.insize,
  2581						sizeof(struct ec_response_motion_sense));
  2582				KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(*data));
  2583	
  2584				data = (struct ec_params_motion_sense *)mock->i_data;
  2585				KUNIT_EXPECT_EQ(test, data->cmd, MOTIONSENSE_CMD_DUMP);
  2586			}
  2587	
  2588			/* For readmem. */
  2589			{
  2590				KUNIT_EXPECT_EQ(test, cros_kunit_readmem_mock_offset, EC_MEMMAP_ACC_STATUS);
  2591			}
  2592		}
  2593	}
  2594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
