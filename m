Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD620FB;
	Sat, 29 Apr 2023 05:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682745181; x=1714281181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJtELllSMQaeYZN9wgESweSqYrQ88TzfHZVKS9zPNiE=;
  b=S7LtfVoj8X1rOpj8SinwpZOVadwdhpPuZg0lC4bJGM1MQepIT71L/oU0
   rZsLRSEBdBqMcIuHrk+ATayRWxzSq2mM0+xzBu/Eblq670fxugkIzKTVI
   Xqmx3Xar/wWjuS56Mcxe6rVmEbwmvoZswkODWE4HMZezPHtfsycti4lxb
   1MFgMNstTHlbvlfeDzfmm4bTa/mBpw+DuZ8pfzMNZv9SrB5XetvLSST7E
   y1jJ2jnaIOj2I/lwbafUmVO1SFSIAgRmbPJG2EDWE0oPjktIM2zKSHFa3
   BtRycj8o0zhOyrDSfKeHUXzgwTtpl9P8X1aS4O7oaZjUmvdph2F7WUJbd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346687391"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="346687391"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="839132607"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="839132607"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 22:12:59 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psctB-0000uX-1j;
	Sat, 29 Apr 2023 05:12:53 +0000
Date: Sat, 29 Apr 2023 13:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/20]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:974:18: warning: format
 specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <202304291349.W0pmcLBq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   9da6a1ef462a428f24cbc085fa49d4cbed5b56f5
commit: 20143b87e3745940ddaa384b5e1112be1ef9df0b [15/20] hid: Add Apple DockChannel HID transport driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304291349.W0pmcLBq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/20143b87e3745940ddaa384b5e1112be1ef9df0b
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout 20143b87e3745940ddaa384b5e1112be1ef9df0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bluetooth/ drivers/firmware/ drivers/hid/dockchannel-hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291349.W0pmcLBq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:12:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:12:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:12:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:974:18: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
                           shdr->length, hdr->length - sizeof(*shdr));
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   7 warnings generated.


vim +974 drivers/hid/dockchannel-hid/dockchannel-hid.c

   966	
   967	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   968	{
   969		struct dchid_subhdr *shdr = (void *)data;
   970		u8 *payload = data + sizeof(*shdr);
   971	
   972		if (shdr->length + sizeof(*shdr) > hdr->length) {
   973			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
 > 974				shdr->length, hdr->length - sizeof(*shdr));
   975			return;
   976		}
   977		if (shdr->flags != iface->out_flags) {
   978			dev_err(iface->dchid->dev,
   979				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   980				shdr->flags, iface->out_flags);
   981			return;
   982		}
   983	
   984		if (shdr->length < 1) {
   985			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   986			return;
   987		}
   988		if (iface->tx_seq != hdr->seq) {
   989			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
   990				iface->tx_seq, hdr->seq);
   991			return;
   992		}
   993		if (iface->out_report != payload[0]) {
   994			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
   995				iface->out_report, payload[0]);
   996			return;
   997		}
   998	
   999		if (iface->resp_buf && iface->resp_size)
  1000			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1001	
  1002		iface->resp_size = shdr->length;
  1003		iface->out_report = -1;
  1004		iface->retcode = shdr->retcode;
  1005		complete(&iface->out_complete);
  1006	}
  1007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
