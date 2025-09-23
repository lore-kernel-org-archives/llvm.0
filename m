Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F20313E13;
	Tue, 23 Sep 2025 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645799; cv=none; b=ODCmf3X77z8XbNmq8SmdGNP6sI7LV3uEi04aEOBiBhWs4HVbwWbxQNk1dTsSAxqxTW5amuVH3rghXeuoURHQmE25kYkHQNjQWY9jB770y0z8IL9pW63hYY2+tcGWgEese5Aje3p52i2KntO+vWF1oH90xDKQFkpD52AHLR3Kz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645799; c=relaxed/simple;
	bh=tXIN3dMNSmyreMc6qz8c86n84Qu3pVePNXNHqmI666A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDlJ19T3aNHs//EcdGoS+fmxlcPfEhi+kc7aGXgKLkaf+Y/kqrkDNMWUTqsg0yPhMScmC3rbXwKYc/1KBqJYQsGutJy55JgkCisVaszkZmZrL4bfbYH2RgMmYjxGO9Hg+SRpzYjm/eqrYZ/OXUsGlxlVC8CVsvTtEO5fr+1bOIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw3J12Ay; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw3J12Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758645798; x=1790181798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXIN3dMNSmyreMc6qz8c86n84Qu3pVePNXNHqmI666A=;
  b=mw3J12AygQsFgJbARqICzF+BL1afGU269X9LXc3a8NVOQtcVuScocvCa
   /ws1fbeeq09WKJ3c32Il0pJw8Pw5Ri/b2djmMiCNcVpPa3wEB9o49MTWu
   EeSLZ4dkaI5cjRs6Dgp7usZfbR9fr32GL4A3K18IzGLQF3SZCRZ+0MY94
   HnTNR/aidWYaFTCb+EDE6moHaDsLh2S7cSGlz+k47/TGI2VkVwusELPJ9
   vD+0lVI4Idgkry0h38NTXKYzWXQYSO2W83Wc9gv5+zzLWX/bd83k7egTN
   aSITAH2I9dyjoLvzYkM01gAnzGJwwN6il5TdATMosJZjjpZOTgGduyQCc
   g==;
X-CSE-ConnectionGUID: nRWvApMnTxWEzd7AslFRAw==
X-CSE-MsgGUID: 2lJYldW3S+yTf9kpcG4wyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60148525"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="60148525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 09:43:17 -0700
X-CSE-ConnectionGUID: dwEW9TTnRmONx5oJSbL0/g==
X-CSE-MsgGUID: 9U4ASqWIQzGXkNKiv6TCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="200510113"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2025 09:43:13 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v166h-0003KH-2P;
	Tue, 23 Sep 2025 16:43:11 +0000
Date: Wed, 24 Sep 2025 00:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sherry Sun <sherry.sun@nxp.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shenwei.wang@nxp.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: imx: Only configure the wake register
 when device is set as wakeup source
Message-ID: <202509240009.Q4htWwxE-lkp@intel.com>
References: <20250923031613.2448073-2-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923031613.2448073-2-sherry.sun@nxp.com>

Hi Sherry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sherry-Sun/tty-serial-imx-Only-configure-the-wake-register-when-device-is-set-as-wakeup-source/20250923-111951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250923031613.2448073-2-sherry.sun%40nxp.com
patch subject: [PATCH 1/2] tty: serial: imx: Only configure the wake register when device is set as wakeup source
config: arm-randconfig-004-20250923 (https://download.01.org/0day-ci/archive/20250924/202509240009.Q4htWwxE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240009.Q4htWwxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240009.Q4htWwxE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/imx.c:2707:6: warning: variable 'may_wake' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2707 |         if (tty) {
         |             ^~~
   drivers/tty/serial/imx.c:2714:7: note: uninitialized use occurs here
    2714 |         if (!may_wake)
         |              ^~~~~~~~
   drivers/tty/serial/imx.c:2707:2: note: remove the 'if' if its condition is always true
    2707 |         if (tty) {
         |         ^~~~~~~~
   drivers/tty/serial/imx.c:2704:15: note: initialize the variable 'may_wake' to silence this warning
    2704 |         bool may_wake;
         |                      ^
         |                       = 0
   1 warning generated.


vim +2707 drivers/tty/serial/imx.c

  2696	
  2697	/* called with irq off */
  2698	static void imx_uart_enable_wakeup(struct imx_port *sport, bool on)
  2699	{
  2700		struct tty_port *port = &sport->port.state->port;
  2701		struct tty_struct *tty;
  2702		struct device *tty_dev;
  2703		u32 ucr3;
  2704		bool may_wake;
  2705	
  2706		tty = tty_port_tty_get(port);
> 2707		if (tty) {
  2708			tty_dev = tty->dev;
  2709			may_wake = tty_dev && device_may_wakeup(tty_dev);
  2710			tty_kref_put(tty);
  2711		}
  2712	
  2713		/* only configure the wake register when device set as wakeup source */
  2714		if (!may_wake)
  2715			return;
  2716	
  2717		uart_port_lock_irq(&sport->port);
  2718	
  2719		ucr3 = imx_uart_readl(sport, UCR3);
  2720		if (on) {
  2721			imx_uart_writel(sport, USR1_AWAKE, USR1);
  2722			ucr3 |= UCR3_AWAKEN;
  2723		} else {
  2724			ucr3 &= ~UCR3_AWAKEN;
  2725		}
  2726		imx_uart_writel(sport, ucr3, UCR3);
  2727	
  2728		if (sport->have_rtscts) {
  2729			u32 ucr1 = imx_uart_readl(sport, UCR1);
  2730			if (on) {
  2731				imx_uart_writel(sport, USR1_RTSD, USR1);
  2732				ucr1 |= UCR1_RTSDEN;
  2733			} else {
  2734				ucr1 &= ~UCR1_RTSDEN;
  2735			}
  2736			imx_uart_writel(sport, ucr1, UCR1);
  2737		}
  2738	
  2739		uart_port_unlock_irq(&sport->port);
  2740	}
  2741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
