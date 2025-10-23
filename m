Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D230B539;
	Thu, 23 Oct 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222462; cv=none; b=WJq+tgM7ivvyBRXjOEHedENLUqpyLvlBwUJ0TV8jTm0Cwsm+sqqGS3oULFRcCyZB4JTEtxq+OA9IRuZ4T1UHYfDBYTcYSUvaWQtKeGQnZ0cNO/qB6GcdBOEkcMpx9evOdvlEacyAiiGMCGoPLr4y3kE+LhA2djEgPCc952672oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222462; c=relaxed/simple;
	bh=ObNHrIX28wo1bGKUr3dtuwFtHur4dA6nLToeSsDfBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inp1CwVCzbLx26+hSpgVHS0wezLNRfiNPQ6+at3BIHps8h/n+W0mAOIhQzToPPI5qCv2EyiYyfn8HuGzBG8fbPGkK5kUTmJv6jf/b+MdO5/8knJg0e/M0dSQKUn5+YIsBpthLvT7LDrMT/JzYosAli0QwlUS3umGy/N50ACXpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwyNGdj1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwyNGdj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222460; x=1792758460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObNHrIX28wo1bGKUr3dtuwFtHur4dA6nLToeSsDfBA8=;
  b=XwyNGdj1VoqzTav77ubE1d0jMI/9lsYA31mvPaLqAMBUjZlHZFOpV4xP
   Dw7MhCHFIX1EaSlfIEME/DxbUbKjYCDQx9GfYGesYDuAvK+4AZrUnAHLT
   7EnSWgLnlujkF/1rxq/RTSrWUor2ALoFsnDw859gGMPdCXMhTxMTe4FTW
   auEMs0Aon5TqA1JoaztB/5DVpQ/K9qt40vfgn8KXrk6qdD+bZf9MzE6oh
   g1LgxFCp65JM2AMKvK6fvK6ErIQ7TXjF07BRjk0unJH+K4O/TDwNLHHHE
   eVvY08yEgmg/fQBanO3eM5j0zqlclrvTnE5CRX7Ve5fe1LqotxG8+FZWl
   w==;
X-CSE-ConnectionGUID: 0D9jPCNjTsCxZ3pzN7SZrA==
X-CSE-MsgGUID: sK6H2IbaRtejuwOmQg2Omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67034926"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="67034926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:40 -0700
X-CSE-ConnectionGUID: AM/KTNvrTlWCaQXqNUTSzQ==
X-CSE-MsgGUID: S81wb57FSeW6vgFaPgIsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="214802729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2025 05:27:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBuPo-000DUH-01;
	Thu, 23 Oct 2025 12:27:36 +0000
Date: Thu, 23 Oct 2025 20:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 6/6] drivers/gpio/gpio-ljca.c:289:9: warning:
 unused variable 'irq'
Message-ID: <202510232205.La2t2fR7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   7d168362aedeca451ac22724f90040296dccca14
commit: 7d168362aedeca451ac22724f90040296dccca14 [6/6] gpio: ljca: Fix duplicated IRQ mapping
config: x86_64-buildonly-randconfig-005-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232205.La2t2fR7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ljca.c:289:9: warning: unused variable 'irq' [-Wunused-variable]
     289 |         int i, irq;
         |                ^~~
   1 warning generated.


vim +/irq +289 drivers/gpio/gpio-ljca.c

c5a4b6fd31e8cb Ye Xiang      2023-02-25  283  
1034cc423f1b4a Wentong Wu    2023-10-09  284  static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
1034cc423f1b4a Wentong Wu    2023-10-09  285  			       int len)
c5a4b6fd31e8cb Ye Xiang      2023-02-25  286  {
1034cc423f1b4a Wentong Wu    2023-10-09  287  	const struct ljca_gpio_packet *packet = evt_data;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  288  	struct ljca_gpio_dev *ljca_gpio = context;
1034cc423f1b4a Wentong Wu    2023-10-09 @289  	int i, irq;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  290  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  291  	if (cmd != LJCA_GPIO_INT_EVENT)
c5a4b6fd31e8cb Ye Xiang      2023-02-25  292  		return;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  293  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  294  	for (i = 0; i < packet->num; i++) {
7d168362aedeca Haotian Zhang 2025-10-23  295  		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,
1034cc423f1b4a Wentong Wu    2023-10-09  296  					packet->item[i].index);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  297  		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  298  	}
c5a4b6fd31e8cb Ye Xiang      2023-02-25  299  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  300  	schedule_work(&ljca_gpio->work);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  301  }
c5a4b6fd31e8cb Ye Xiang      2023-02-25  302  

:::::: The code at line 289 was first introduced by commit
:::::: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d gpio: update Intel LJCA USB GPIO driver

:::::: TO: Wentong Wu <wentong.wu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
