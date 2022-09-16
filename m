Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C353A7
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663335661; x=1694871661;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cgv4Vc5HuwHfCd3RJrlmb+46Mu1Bz687nKLIlSbB3Sk=;
  b=I6Pqz1YrkYrMBfQEipH9Hd4fWivJeHJrP4uAu4roWsmtgr6kYhFS8Q0J
   jS1z67Lw3lhPfvGa+/atSk9Aeq2pO2DAXiG6fSGyP3e92+/k744o3cJyJ
   JF3jFdgplpADlO/3CbM+1dMnYgthnnEmnTl9ac8pROG7umZ4VAiF8rEYC
   9q4VhdX7+3UlO9hgP9n9kUMQT9k2JEi9pF60l1hdree0rafUOVqncTyzx
   LhilLIDxKaomyahPMdAL/Y+3IbhrctGUVgEPYhzkeL5Gvg8UCcnfVIxf7
   lPCYP/0MHL/kP+D70O2YqnV9E6fi+W2/yoxQn+lNVBFpXkM8Tqct3J1xc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282019066"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="282019066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 06:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="760053206"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2022 06:40:56 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZBaR-0001oQ-10;
	Fri, 16 Sep 2022 13:40:55 +0000
Date: Fri, 16 Sep 2022 21:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Crt Mori <cmo@melexis.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Petr Machata <petrm@nvidia.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ajay Gupta <ajayg@nvidia.com>, Jean Delvare <jdelvare@suse.de>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [linux-next:master 891/7639] drivers/macintosh/ams/ams-i2c.c:74:20:
 error: incompatible function pointer types initializing 'void (*)(struct
 i2c_client *)' with an expression of type 'int (struct i2c_client *)'
Message-ID: <202209162131.7zTgVw6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: ed5c2f5fd10dda07263f79f338a512c0f49f76f5 [891/7639] i2c: Make remove callback return void
config: powerpc-buildonly-randconfig-r005-20220916 (https://download.01.org/0day-ci/archive/20220916/202209162131.7zTgVw6y-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ed5c2f5fd10dda07263f79f338a512c0f49f76f5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ed5c2f5fd10dda07263f79f338a512c0f49f76f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/macintosh/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/macintosh/ams/ams-i2c.c:74:20: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *)' [-Wincompatible-function-pointer-types]
           .remove         = ams_i2c_remove,
                             ^~~~~~~~~~~~~~
>> drivers/macintosh/ams/ams-i2c.c:233:13: error: conflicting types for 'ams_i2c_remove'
   static void ams_i2c_remove(struct i2c_client *client)
               ^
   drivers/macintosh/ams/ams-i2c.c:61:12: note: previous declaration is here
   static int ams_i2c_remove(struct i2c_client *client);
              ^
   2 errors generated.


vim +74 drivers/macintosh/ams/ams-i2c.c

dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   68  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   69  static struct i2c_driver ams_i2c_driver = {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   70  	.driver = {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   71  		.name   = "ams",
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   72  	},
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17   73  	.probe          = ams_i2c_probe,
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17  @74  	.remove         = ams_i2c_remove,
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17   75  	.id_table       = ams_id,
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   76  };
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   77  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   78  static s32 ams_i2c_read(u8 reg)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   79  {
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17   80  	return i2c_smbus_read_byte_data(ams_info.i2c_client, reg);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   81  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   82  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   83  static int ams_i2c_write(u8 reg, u8 value)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   84  {
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17   85  	return i2c_smbus_write_byte_data(ams_info.i2c_client, reg, value);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   86  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   87  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   88  static int ams_i2c_cmd(enum ams_i2c_cmd cmd)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   89  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   90  	s32 result;
63232dcd555d60 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2007-05-08   91  	int count = 3;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   92  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   93  	ams_i2c_write(AMS_COMMAND, cmd);
63232dcd555d60 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2007-05-08   94  	msleep(5);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   95  
63232dcd555d60 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2007-05-08   96  	while (count--) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   97  		result = ams_i2c_read(AMS_COMMAND);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   98  		if (result == 0 || result & 0x80)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12   99  			return 0;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  100  
63232dcd555d60 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2007-05-08  101  		schedule_timeout_uninterruptible(HZ / 20);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  102  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  103  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  104  	return -1;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  105  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  106  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  107  static void ams_i2c_set_irq(enum ams_irq reg, char enable)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  108  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  109  	if (reg & AMS_IRQ_FREEFALL) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  110  		u8 val = ams_i2c_read(AMS_CTRLX);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  111  		if (enable)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  112  			val |= 0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  113  		else
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  114  			val &= ~0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  115  		ams_i2c_write(AMS_CTRLX, val);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  116  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  117  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  118  	if (reg & AMS_IRQ_SHOCK) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  119  		u8 val = ams_i2c_read(AMS_CTRLY);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  120  		if (enable)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  121  			val |= 0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  122  		else
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  123  			val &= ~0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  124  		ams_i2c_write(AMS_CTRLY, val);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  125  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  126  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  127  	if (reg & AMS_IRQ_GLOBAL) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  128  		u8 val = ams_i2c_read(AMS_CTRLZ);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  129  		if (enable)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  130  			val |= 0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  131  		else
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  132  			val &= ~0x80;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  133  		ams_i2c_write(AMS_CTRLZ, val);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  134  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  135  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  136  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  137  static void ams_i2c_clear_irq(enum ams_irq reg)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  138  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  139  	if (reg & AMS_IRQ_FREEFALL)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  140  		ams_i2c_write(AMS_FREEFALL, 0);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  141  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  142  	if (reg & AMS_IRQ_SHOCK)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  143  		ams_i2c_write(AMS_SHOCK, 0);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  144  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  145  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  146  static u8 ams_i2c_get_vendor(void)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  147  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  148  	return ams_i2c_read(AMS_VENDOR);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  149  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  150  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  151  static void ams_i2c_get_xyz(s8 *x, s8 *y, s8 *z)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  152  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  153  	*x = ams_i2c_read(AMS_DATAX);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  154  	*y = ams_i2c_read(AMS_DATAY);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  155  	*z = ams_i2c_read(AMS_DATAZ);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  156  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  157  
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17  158  static int ams_i2c_probe(struct i2c_client *client,
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17  159  			 const struct i2c_device_id *id)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  160  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  161  	int vmaj, vmin;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  162  	int result;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  163  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  164  	/* There can be only one */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  165  	if (unlikely(ams_info.has_device))
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  166  		return -ENODEV;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  167  
810ad7b62c0f07 drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2008-10-17  168  	ams_info.i2c_client = client;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  169  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  170  	if (ams_i2c_cmd(AMS_CMD_RESET)) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  171  		printk(KERN_INFO "ams: Failed to reset the device\n");
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  172  		return -ENODEV;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  173  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  174  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  175  	if (ams_i2c_cmd(AMS_CMD_START)) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  176  		printk(KERN_INFO "ams: Failed to start the device\n");
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  177  		return -ENODEV;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  178  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  179  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  180  	/* get version/vendor information */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  181  	ams_i2c_write(AMS_CTRL1, 0x02);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  182  	ams_i2c_write(AMS_CTRL2, 0x85);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  183  	ams_i2c_write(AMS_CTRL3, 0x01);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  184  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  185  	ams_i2c_cmd(AMS_CMD_READMEM);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  186  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  187  	vmaj = ams_i2c_read(AMS_DATA1);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  188  	vmin = ams_i2c_read(AMS_DATA2);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  189  	if (vmaj != 1 || vmin != 52) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  190  		printk(KERN_INFO "ams: Incorrect device version (%d.%d)\n",
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  191  			vmaj, vmin);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  192  		return -ENODEV;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  193  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  194  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  195  	ams_i2c_cmd(AMS_CMD_VERSION);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  196  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  197  	vmaj = ams_i2c_read(AMS_DATA1);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  198  	vmin = ams_i2c_read(AMS_DATA2);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  199  	if (vmaj != 0 || vmin != 1) {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  200  		printk(KERN_INFO "ams: Incorrect firmware version (%d.%d)\n",
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  201  			vmaj, vmin);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  202  		return -ENODEV;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  203  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  204  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  205  	/* Disable interrupts */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  206  	ams_i2c_set_irq(AMS_IRQ_ALL, 0);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  207  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  208  	result = ams_sensor_attach();
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  209  	if (result < 0)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  210  		return result;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  211  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  212  	/* Set default values */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  213  	ams_i2c_write(AMS_SENSLOW, 0x15);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  214  	ams_i2c_write(AMS_SENSHIGH, 0x60);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  215  	ams_i2c_write(AMS_CTRLX, 0x08);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  216  	ams_i2c_write(AMS_CTRLY, 0x0F);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  217  	ams_i2c_write(AMS_CTRLZ, 0x4F);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  218  	ams_i2c_write(AMS_UNKNOWN1, 0x14);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  219  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  220  	/* Clear interrupts */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  221  	ams_i2c_clear_irq(AMS_IRQ_ALL);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  222  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  223  	ams_info.has_device = 1;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  224  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  225  	/* Enable interrupts */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  226  	ams_i2c_set_irq(AMS_IRQ_ALL, 1);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  227  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  228  	printk(KERN_INFO "ams: Found I2C based motion sensor\n");
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  229  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  230  	return 0;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  231  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  232  
ed5c2f5fd10dda drivers/macintosh/ams/ams-i2c.c Uwe Kleine-König 2022-08-15 @233  static void ams_i2c_remove(struct i2c_client *client)
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  234  {
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  235  	if (ams_info.has_device) {
98ceb75c7c14ea drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2010-01-31  236  		ams_sensor_detach();
98ceb75c7c14ea drivers/hwmon/ams/ams-i2c.c     Jean Delvare     2010-01-31  237  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  238  		/* Disable interrupts */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  239  		ams_i2c_set_irq(AMS_IRQ_ALL, 0);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  240  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  241  		/* Clear interrupts */
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  242  		ams_i2c_clear_irq(AMS_IRQ_ALL);
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  243  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  244  		printk(KERN_INFO "ams: Unloading\n");
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  245  
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  246  		ams_info.has_device = 0;
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  247  	}
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  248  }
dcb69dd010c182 drivers/hwmon/ams/ams-i2c.c     Stelian Pop      2006-12-12  249  

:::::: The code at line 74 was first introduced by commit
:::::: 810ad7b62c0f075dc44ecc781b24c7f6ba388da5 hwmon: (ams) Convert to a new-style i2c driver

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@mahadeva.delvare>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
