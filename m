Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FA1FB8;
	Fri, 30 Jun 2023 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688116883; x=1719652883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bmomT27I0zqHjHtqcdMPLO/YYB1lfOp8mwImTK4BGI=;
  b=PC12zPhtGld5pPA3UxsVs4gXvRM6UQz6J4vbEfB1NngCWMN6aksxhiCS
   yr/Z3b6PyrQNFZh/psQFFlOwa8uE5kj7TfL6EkE1MsANn+uSjUJJMX4E6
   ELeM6DXh9Uw0cZzUIlWZa6XDNlNJMq4KmNypRk+L+nQYFgqBPjVbWtgqi
   NJwEu/8+qfOYLkX++CjIUFrr9K+GcZJ2iUTP628aMi4zzwhxW8ayKr34V
   uD5RnYJ1a6jFWtrPORgxzY3KwhJLIEfZPMmTzOBwc1wSI8YpRwdov6h+E
   4DkxaoOG0SxxgiaHLGgCOBMBOI13zD/Z3Z/RvT5wvS2DlS1/7/px3NjzC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365838969"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="365838969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 02:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694960821"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="694960821"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2023 02:21:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFAJb-000Eqf-0b;
	Fri, 30 Jun 2023 09:21:19 +0000
Date: Fri, 30 Jun 2023 17:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Cai <jing.cai@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [linux-next:master 12628/12815] drivers/bluetooth/btmtk.c:386:32:
 error: no member named 'dump' in 'struct hci_dev'
Message-ID: <202306301709.lvrxzyCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6352a698ca5bf26a9199202666b16cf741f579f6
commit: 872f8c253cb9e84cb3e7f381dd81c7791c64a05a [12628/12815] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: x86_64-randconfig-r023-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301709.lvrxzyCj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301709.lvrxzyCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301709.lvrxzyCj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btmtk.c:386:32: error: no member named 'dump' in 'struct hci_dev'
                   schedule_delayed_work(&hdev->dump.dump_timeout,
                                          ~~~~  ^
   1 error generated.


vim +386 drivers/bluetooth/btmtk.c

   369	
   370	int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
   371	{
   372		struct btmediatek_data *data = hci_get_priv(hdev);
   373		int err;
   374	
   375		if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
   376			return 0;
   377	
   378		switch (data->cd_info.state) {
   379		case HCI_DEVCOREDUMP_IDLE:
   380			err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
   381			if (err < 0)
   382				break;
   383			data->cd_info.cnt = 0;
   384	
   385			/* It is supposed coredump can be done within 5 seconds */
 > 386			schedule_delayed_work(&hdev->dump.dump_timeout,
   387					      msecs_to_jiffies(5000));
   388			fallthrough;
   389		case HCI_DEVCOREDUMP_ACTIVE:
   390		default:
   391			err = hci_devcd_append(hdev, skb);
   392			if (err < 0)
   393				break;
   394			data->cd_info.cnt++;
   395	
   396			/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
   397			if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
   398			    skb->len > sizeof(MTK_COREDUMP_END) &&
   399			    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
   400				    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
   401				bt_dev_info(hdev, "Mediatek coredump end");
   402				hci_devcd_complete(hdev);
   403			}
   404	
   405			break;
   406		}
   407	
   408		if (err < 0)
   409			kfree_skb(skb);
   410	
   411		return err;
   412	}
   413	EXPORT_SYMBOL_GPL(btmtk_process_coredump);
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
