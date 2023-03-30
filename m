Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A898D10E7;
	Thu, 30 Mar 2023 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680212812; x=1711748812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZCqAmoMFRKnYwZbFPgIYU69+UqejEtrX/iSC+il3byg=;
  b=URNbRWLVcWeNeRJeMX0BLAIk4ojq8qkr5503M7RMvxTcq+PGsyab7UI4
   tx1Vpk7M+Jl1HHEKmah+vlP1Vea1rWCWr0prkU1joG+WY/c8pW0mB9ZpL
   2KDo/d7pYD73bKoA2JFnDyU1ID/bNGrcBb5PEbNxyEd0fL5D4SXcsXX+7
   xmXbSQBX0aQ7DD/ONcn9sySM7YrLXkBac654LlGSIswA0zIsMX0RlHseh
   uB4Y0sHtGwKuuzhKIDDSycKecNkeUEf3cYyfWkXGKmxkqnx4ZYwtqdLY+
   tdLo/7jXs86F4WDheMpBDcqrjj+JERindZxblY4H+l6oUiFqX448bmoRG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403991594"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="403991594"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="717481227"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="717481227"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 14:46:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi05z-000LEm-1F;
	Thu, 30 Mar 2023 21:46:11 +0000
Date: Fri, 31 Mar 2023 05:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/24]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:857:18: warning: format
 specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <202303310531.8mOnSTQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   5bd8e50b4bbf53074e71cfe9cee1e70831d7573f
commit: 5e1fd4994fddb7721afdaf619b84fda97c16575c [15/24] hid: Add Apple DockChannel HID transport driver
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310531.8mOnSTQj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/5e1fd4994fddb7721afdaf619b84fda97c16575c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout 5e1fd4994fddb7721afdaf619b84fda97c16575c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/hid/dockchannel-hid/ drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310531.8mOnSTQj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/dockchannel-hid/dockchannel-hid.c:679:16: error: call to undeclared function 'devm_gpiod_get_from_of_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           iface->gpio = devm_gpiod_get_from_of_node(iface->dchid->dev,
                         ^
   drivers/hid/dockchannel-hid/dockchannel-hid.c:679:14: error: incompatible integer to pointer conversion assigning to 'struct gpio_desc *' from 'int' [-Wint-conversion]
           iface->gpio = devm_gpiod_get_from_of_node(iface->dchid->dev,
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:857:18: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
                           shdr->length, hdr->length - sizeof(*shdr));
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:992:11: error: call to undeclared function 'gpiod_get_from_of_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           gpio = gpiod_get_from_of_node(child, prop->name, 0, GPIOD_ASIS,
                                  ^
   drivers/hid/dockchannel-hid/dockchannel-hid.c:992:9: error: incompatible integer to pointer conversion assigning to 'struct gpio_desc *' from 'int' [-Wint-conversion]
                           gpio = gpiod_get_from_of_node(child, prop->name, 0, GPIOD_ASIS,
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


vim +857 drivers/hid/dockchannel-hid/dockchannel-hid.c

   665	
   666	static void dchid_request_gpio(struct dchid_iface *iface, int id, const char *name)
   667	{
   668		char prop_name[MAX_GPIO_NAME + 16];
   669	
   670		dev_info(iface->dchid->dev, "Requesting GPIO %s#%d: %s\n", iface->name, id, name);
   671	
   672		if (iface->gpio) {
   673			dev_err(iface->dchid->dev, "Cannot request more than one GPIO per interface!\n");
   674			return;
   675		}
   676	
   677		snprintf(prop_name, sizeof(prop_name), "apple,%s-gpios", name);
   678	
 > 679		iface->gpio = devm_gpiod_get_from_of_node(iface->dchid->dev,
   680							  iface->of_node, prop_name, 0,
   681							  GPIOD_OUT_LOW, name);
   682	
   683		if (IS_ERR_OR_NULL(iface->gpio)) {
   684			dev_err(iface->dchid->dev, "Failed to request GPIO %s\n", prop_name);
   685			iface->gpio = NULL;
   686			return;
   687		}
   688	
   689		iface->gpio_id = id;
   690	}
   691	
   692	static void dchid_handle_init(struct dockchannel_hid *dchid, void *data, size_t length)
   693	{
   694		struct dchid_init_hdr *hdr = data;
   695		struct dchid_iface *iface;
   696		struct dchid_init_block_hdr *blk;
   697	
   698		if (length < sizeof(*hdr))
   699			return;
   700	
   701		iface = dchid_get_interface(dchid, hdr->iface, hdr->name);
   702		if (!iface)
   703			return;
   704	
   705		data += sizeof(*hdr);
   706		length -= sizeof(*hdr);
   707	
   708		while (length > sizeof(*blk)) {
   709			blk = data;
   710			data += sizeof(*blk);
   711			length -= sizeof(*blk);
   712	
   713			if (blk->length > length)
   714				return;
   715			switch (blk->type) {
   716			case INIT_HID_DESCRIPTOR:
   717				dchid_handle_descriptor(iface, data, blk->length);
   718				break;
   719	
   720			case INIT_GPIO_REQUEST: {
   721				struct dchid_gpio_request *req = data;
   722	
   723				if (sizeof(*req) > length)
   724					return;
   725				dchid_request_gpio(iface, req->id, req->name);
   726				break;
   727			}
   728	
   729			case INIT_TERMINATOR:
   730				return;
   731			}
   732	
   733			data += blk->length + sizeof(*blk);
   734			length -= blk->length + sizeof(*blk);
   735		}
   736	}
   737	
   738	static void dchid_handle_gpio(struct dockchannel_hid *dchid, void *data, size_t length)
   739	{
   740		struct dchid_gpio_cmd *cmd = data;
   741		struct dchid_iface *iface;
   742		u32 retcode = 0xe000f00d; /* Give it a random Apple-style error code */
   743		struct dchid_gpio_ack *ack;
   744	
   745		if (length < sizeof(*cmd))
   746			return;
   747	
   748		if (cmd->iface >= MAX_INTERFACES || !(iface = dchid->ifaces[cmd->iface])) {
   749			dev_err(dchid->dev, "Got GPIO command for bad inteface %d\n", cmd->iface);
   750			goto err;
   751		}
   752	
   753		if (!iface->gpio || cmd->gpio != iface->gpio_id) {
   754			dev_err(dchid->dev, "Got GPIO command for bad GPIO %s#%d\n",
   755				iface->name, cmd->gpio);
   756			goto err;
   757		}
   758	
   759		dev_info(dchid->dev, "GPIO command: %s#%d: %d\n", iface->name, cmd->gpio, cmd->cmd);
   760	
   761		switch (cmd->cmd) {
   762		case 3:
   763			/* Pulse.  */
   764			gpiod_set_value_cansleep(iface->gpio, 1);
   765			msleep(10); /* Random guess... */
   766			gpiod_set_value_cansleep(iface->gpio, 0);
   767			retcode = 0;
   768			break;
   769		default:
   770			dev_err(dchid->dev, "Unknown GPIO command %d\n", cmd->cmd	);
   771			break;
   772		}
   773	
   774	err:
   775		/* Ack it */
   776		ack = kzalloc(sizeof(*ack) + length, GFP_KERNEL);
   777		if (!ack)
   778			return;
   779	
   780		ack->type = CMD_ACK_GPIO_CMD;
   781		ack->retcode = retcode;
   782		memcpy(ack->cmd, data, length);
   783	
   784		if (dchid_comm_cmd(dchid, ack, sizeof(*ack) + length) < 0)
   785			dev_err(dchid->dev, "Failed to ACK GPIO command\n");
   786	
   787		kfree(ack);
   788	}
   789	
   790	static void dchid_handle_event(struct dockchannel_hid *dchid, void *data, size_t length)
   791	{
   792		u8 *p = data;
   793		switch (*p) {
   794		case EVENT_INIT:
   795			dchid_handle_init(dchid, data, length);
   796			break;
   797		case EVENT_READY:
   798			dchid_handle_ready(dchid, data, length);
   799			break;
   800		case EVENT_GPIO_CMD:
   801			dchid_handle_gpio(dchid, data, length);
   802			break;
   803		}
   804	}
   805	
   806	static void dchid_handle_report(struct dchid_iface *iface, void *data, size_t length)
   807	{
   808		struct dockchannel_hid *dchid = iface->dchid;
   809	
   810		if (!iface->hid) {
   811			dev_warn(dchid->dev, "Report received but %s is not initialized!\n", iface->name);
   812			return;
   813		}
   814	
   815		if (!iface->open)
   816			return;
   817	
   818		hid_input_report(iface->hid, HID_INPUT_REPORT, data, length, 1);
   819	}
   820	
   821	static void dchid_packet_work(struct work_struct *ws)
   822	{
   823		struct dchid_work *work = container_of(ws, struct dchid_work, work);
   824		struct dchid_subhdr *shdr = (void *)work->data;
   825		struct dockchannel_hid *dchid = work->iface->dchid;
   826		int type = FIELD_GET(FLAGS_GROUP, shdr->flags);
   827		u8 *payload = work->data + sizeof(*shdr);
   828	
   829		if (shdr->length + sizeof(*shdr) > work->hdr.length) {
   830			dev_err(dchid->dev, "Bad sub header length (%d > %zu)\n",
   831				shdr->length, work->hdr.length - sizeof(*shdr));
   832			return;
   833		}
   834	
   835		switch (type) {
   836		case GROUP_INPUT:
   837			if (work->hdr.iface == IFACE_COMM)
   838				dchid_handle_event(dchid, payload, shdr->length);
   839			else
   840				dchid_handle_report(work->iface, payload, shdr->length);
   841			break;
   842		default:
   843			dev_err(dchid->dev, "Received unknown packet type %d\n", type);
   844			break;
   845		}
   846	
   847		kfree(work);
   848	}
   849	
   850	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   851	{
   852		struct dchid_subhdr *shdr = (void *)data;
   853		u8 *payload = data + sizeof(*shdr);
   854	
   855		if (shdr->length + sizeof(*shdr) > hdr->length) {
   856			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
 > 857				shdr->length, hdr->length - sizeof(*shdr));
   858			return;
   859		}
   860		if (shdr->flags != iface->out_flags) {
   861			dev_err(iface->dchid->dev,
   862				"Received unexpected flags 0x%x on ACK channel (expected 0x%x)\n",
   863				shdr->flags, iface->out_flags);
   864			return;
   865		}
   866	
   867		if (shdr->length < 1) {
   868			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   869			return;
   870		}
   871		if (iface->tx_seq != hdr->seq) {
   872			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
   873				iface->rx_seq, hdr->seq);
   874			return;
   875		}
   876		if (iface->out_report != payload[0]) {
   877			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
   878				iface->out_report, payload[0]);
   879			return;
   880		}
   881	
   882		if (iface->resp_buf && iface->resp_size)
   883			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
   884	
   885		iface->resp_size = shdr->length;
   886		iface->out_report = -1;
   887		iface->retcode = shdr->retcode;
   888		complete(&iface->out_complete);
   889	}
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
