Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EFA10EE
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 04:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645761647; x=1677297647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUio7+OjU5jH0xfbFmSRXspu58YEyW4TxMOe3rFSEo4=;
  b=dkvBZz9QsjhMFZTEPcAxlXeX3VzTeIQYBkVjlRG4Zq2i2bPbRk84TBnr
   3IJd2oXawn/jNSWZNCrp9Ju1HvI93U6Qep81A06Z18GZs84kEmLCY38u0
   M6UxxdB/MDna6BWKozbv2SjRLhfMww+b+t/51oK0UQI7VAlEQD0cvTEAQ
   PN7x0ctvSWk72K/641t9oGgs/xLnSJfpVZaCzzOo2sBlqA3fJDIb70Iha
   XvpLmjMy4uwdg3nf7qOfBnbhvi0U5BvGM/MwzIuYs4rvmOmL0GfPLiC9L
   0dYHUQyaqCsVFWp1gGwZ8CYtDUA6BS0OPZSSoHQxiK8c7xlf21CbPbhVF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338851795"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; 
   d="scan'208";a="338851795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 20:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; 
   d="scan'208";a="707723685"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2022 20:00:44 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNRmd-0003ox-VW; Fri, 25 Feb 2022 04:00:43 +0000
Date: Fri, 25 Feb 2022 12:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-codina-v5.17-rc1 6/12]
 drivers/input/touchscreen/zinitix.c:338:7: warning: logical not is only
 applied to the left hand side of this bitwise operator
Message-ID: <202202251155.D2cRSiJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-codina-v5.17-rc1
head:   55196848adbcea2ea36561a056bb610bf3ab40bf
commit: 727f5e5be135b8f1f94922093b5c88565fdadcb0 [6/12] Input: zinitix - Do not report shadow fingers
config: hexagon-randconfig-r045-20220224 (https://download.01.org/0day-ci/archive/20220225/202202251155.D2cRSiJR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=727f5e5be135b8f1f94922093b5c88565fdadcb0
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-codina-v5.17-rc1
        git checkout 727f5e5be135b8f1f94922093b5c88565fdadcb0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/zinitix.c:338:7: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
                   if (!p->sub_status & SUB_BIT_EXIST)
                       ^              ~
   drivers/input/touchscreen/zinitix.c:338:7: note: add parentheses after the '!' to evaluate the bitwise operator first
                   if (!p->sub_status & SUB_BIT_EXIST)
                       ^
                        (                            )
   drivers/input/touchscreen/zinitix.c:338:7: note: add parentheses around left hand side expression to silence this warning
                   if (!p->sub_status & SUB_BIT_EXIST)
                       ^
                       (             )
   1 warning generated.


vim +338 drivers/input/touchscreen/zinitix.c

   321	
   322	static void zinitix_report_fingers(struct bt541_ts_data *bt541, struct touch_event *te)
   323	{
   324		struct point_coord *p;
   325		u16 x, y;
   326		unsigned long fmask;
   327		int i;
   328	
   329		/*
   330		 * If the corresponding finger is not active, do not report
   331		 * what is happening on it.
   332		 */
   333		fmask = te->finger_mask;
   334		for_each_set_bit(i, &fmask, MAX_SUPPORTED_FINGER_NUM) {
   335			p = &te->point_coord[i];
   336	
   337			/* Skip nonexisting fingers */
 > 338			if (!p->sub_status & SUB_BIT_EXIST)
   339				continue;
   340	
   341			x = le16_to_cpu(p->x);
   342			y = le16_to_cpu(p->y);
   343	
   344			input_mt_slot(bt541->input_dev, i);
   345	
   346			if (p->sub_status & BIT_DOWN) {
   347				/* Finger down */
   348				input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
   349				touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
   350				input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
   351				dev_dbg(&bt541->client->dev, "finger %d down (%u, %u)\n", i, x, y);
   352			} else if (p->sub_status & BIT_UP) {
   353				/* Release finger */
   354				input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, false);
   355				touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
   356				input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, 0);
   357				dev_dbg(&bt541->client->dev, "finger %d up (%u, %u)\n", i, x, y);
   358			} else if (p->sub_status & BIT_MOVE) {
   359				/* Finger moves while pressed down */
   360				input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
   361				touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
   362				input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
   363				dev_dbg(&bt541->client->dev, "finger %d move (%u, %u)\n", i, x, y);
   364			} else {
   365				dev_dbg(&bt541->client->dev, "unknown finger event\n");
   366			}
   367		}
   368	}
   369	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
