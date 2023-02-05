Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC433C1;
	Sun,  5 Feb 2023 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675620508; x=1707156508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNXvUsNzlxPbwMH9iAFHroesTRVd4kViUtSziSeoNdU=;
  b=J9WYKkbZUx9r58y4imhIxwoivDX0QAXOzg3sVg12I/ZYoFYpfRo6zQhq
   l/pEIYDqmT/G0LCE435bEMQXla7/U59lZp/ELFPr127NjFEwqe5996jp2
   FRp3QwGLLjpi+GcScRYyIRJXQ582V7seclG6tqQo2CARqoaa8Nzyd6CIq
   WmvLRvdbNXvaE7F7kbz1LRummq4gvu6+cVReEEnpy4djYr0Zp1lXKlWDU
   hVhOOjTxQnf6eCVcUqV13B5fqhjAXSwFvFS+9R8ecHdyy75znhbY+P4p0
   7VCu3M9b898+mKjWg86ygNAxcZQHRzGss0QWes8LlN3MYgG/tS+f8PZNG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="331206769"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="331206769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698634229"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698634229"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 10:08:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOjRB-00028m-29;
	Sun, 05 Feb 2023 18:08:25 +0000
Date: Mon, 6 Feb 2023 02:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [jic23-iio:testing 3/5] drivers/iio/proximity/sx_common.c:437:48:
 warning: format specifies type 'char *' but the argument has type 'int'
Message-ID: <202302060207.khEkxAUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   1693e893f058e96fdaccbdb4bb42970811ac9ec6
commit: fef38680d38d39f6f574db2c77df3de215f08e7d [3/5] iio: proximity: sx_common: Add old register mapping
config: hexagon-randconfig-r045-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060207.khEkxAUF-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=fef38680d38d39f6f574db2c77df3de215f08e7d
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout fef38680d38d39f6f574db2c77df3de215f08e7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/proximity/sx_common.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/iio/proximity/sx_common.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/iio/proximity/sx_common.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   drivers/iio/proximity/sx_common.c:437:48: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
                                                         ^
>> drivers/iio/proximity/sx_common.c:437:48: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
           snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
                                             ~~          ^~~~~~~~~~~~~~~~~~~~~
                                             %d
   7 warnings and 1 error generated.


vim +437 drivers/iio/proximity/sx_common.c

   426	
   427	void sx_common_get_raw_register_config(struct device *dev,
   428					       struct sx_common_reg_default *reg_def)
   429	{
   430		struct acpi_device *adev = ACPI_COMPANION(dev);
   431		u32 raw = 0, ret;
   432		char prop[80];
   433	
   434		if (!reg_def->property || !adev)
   435			return;
   436	
 > 437		snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
   438		ret = device_property_read_u32(dev, prop, &raw);
   439		if (ret)
   440			return;
   441	
   442		reg_def->def = raw;
   443	}
   444	EXPORT_SYMBOL_NS_GPL(sx_common_get_raw_register_config, SEMTECH_PROX);
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
