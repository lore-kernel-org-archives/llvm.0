Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCDE7E
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654019986; x=1685555986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b6mwshQJi0+lvKDxPFp5xJiYo27cGUYqQ874eJ6J3JA=;
  b=fbBHNrhmHf24OXGAqqhhYIVA8A3YYEzIBA09XV7GgUDkAgTz9QDTcjZT
   dK5+7CMWpCrKzfwAXKb1CXmfZ88IQyP00QAQF3DK6lB1nBYHNXOcNKaxy
   3NNxjQx6M8iv6MKF8KSnrGjDbAp9bfnQ3kCY6fA+xhoZuhVgr+FwPPzmK
   gBuxdHX3LtcNfHvn6zHPXgNZ5ez61+tBMeurGGigo2jvBgfQF/y3afzwe
   e1HatZ2Wps3qHrV4qgIiEWRDDeMwGwoI+1A7Zhtgs9OEbTq4Oio3857lL
   QHJlss5UzHNl0W7aDeIYPTivoWD19hjTXzgtMRz24U9AUTu5vTq5lVuJ7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274143863"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="274143863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 10:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="605802463"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 May 2022 10:59:20 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nw69H-0002w6-VR;
	Tue, 31 May 2022 17:59:19 +0000
Date: Wed, 1 Jun 2022 01:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH 4/4] serial: max310x: implement I2C support
Message-ID: <202206010102.px37QPmH-lkp@intel.com>
References: <20220530221429.1248083-4-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530221429.1248083-4-demonsingur@gmail.com>

Hi Cosmin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing v5.18 next-20220531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/serial-max310x-use-regmap-methods-for-SPI-batch-operations/20220531-061619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220601/202206010102.px37QPmH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6c293b95fc5654df5353ba273a9bbd08f1cd3f3a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cosmin-Tanislav/serial-max310x-use-regmap-methods-for-SPI-batch-operations/20220531-061619
        git checkout 6c293b95fc5654df5353ba273a9bbd08f1cd3f3a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/max310x.c:1658:1: warning: unused label 'err_i2c_register' [-Wunused-label]
   err_i2c_register:
   ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_i2c_register +1658 drivers/tty/serial/max310x.c

  1652	
  1653		return 0;
  1654	
  1655	err_spi_register:
  1656		spi_unregister_driver(&max310x_spi_driver);
  1657	
> 1658	err_i2c_register:
  1659		uart_unregister_driver(&max310x_uart);
  1660	
  1661		return ret;
  1662	}
  1663	module_init(max310x_uart_init);
  1664	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
