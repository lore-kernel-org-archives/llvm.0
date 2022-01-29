Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447D2C9D
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643450098; x=1674986098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZhaOVweVScer33wJ4pCMjYFtSJDvhcTtpiEpiRE9KCE=;
  b=FkHYlmgogYV2FwIGIs6M1RaQUZOnnhI5BP4ezsF0vjJjZJhCbhCVzmcP
   e41sLFyja4jedznUy4bMR7Q9bQyXkPs5cJbe8T0Qh/i58D+EBzvjY9Z4U
   efaA5jzpV39Toe1ipBmg5LIGszQWaGpRHX9Naw9ZRC+5yhSk7aPPEYa1O
   oMaoZjQ5ckneFKttUTCXz03AeCKXva+FanG75R9iBsiahGUWf8GzSbbQR
   utUzNGCW7rWOqFAQDOx850i9sx1KY0x9YJIb74FSi2/5zG3bzbRJ9mskm
   GAXg9ozA+DhVpXWmcST2nr0o606k6rh2HgABcuLvw7PLwcv4xMwmBJ2Jl
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="247208098"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="247208098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 01:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="478537438"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2022 01:54:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDkRZ-000P1q-Fr; Sat, 29 Jan 2022 09:54:53 +0000
Date: Sat, 29 Jan 2022 17:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Mark-YW.Chen@mediatek.com, sean.wang@mediatek.com,
	Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
	Deren.Wu@mediatek.com, km.lin@mediatek.com
Subject: Re: [PATCH 2/2] Bluetooth: mediatek: fix the conflict between mtk
 and msft vendor event
Message-ID: <202201291757.gh2GX6y1-lkp@intel.com>
References: <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objelf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objelf@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20220128]
[cannot apply to v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/Bluetooth-mt7921s-support-bluetooth-reset-mechanism/20220129-140313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: x86_64-randconfig-a012-20220124 (https://download.01.org/0day-ci/archive/20220129/202201291757.gh2GX6y1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/33092fd43b74594bae07555a6fdf15133cc8ec54
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-mt7921s-support-bluetooth-reset-mechanism/20220129-140313
        git checkout 33092fd43b74594bae07555a6fdf15133cc8ec54
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btusb.c:2253:24: warning: variable 'hdr' set but not used [-Wunused-but-set-variable]
           struct hci_event_hdr *hdr;
                                 ^
   1 warning generated.


vim +/hdr +2253 drivers/bluetooth/btusb.c

5a87679ffd4436 mark-yw.chen 2021-09-01  2248  
a1c49c434e1505 Sean Wang    2019-06-02  2249  static void btusb_mtk_wmt_recv(struct urb *urb)
a1c49c434e1505 Sean Wang    2019-06-02  2250  {
a1c49c434e1505 Sean Wang    2019-06-02  2251  	struct hci_dev *hdev = urb->context;
a1c49c434e1505 Sean Wang    2019-06-02  2252  	struct btusb_data *data = hci_get_drvdata(hdev);
a1c49c434e1505 Sean Wang    2019-06-02 @2253  	struct hci_event_hdr *hdr;
a1c49c434e1505 Sean Wang    2019-06-02  2254  	struct sk_buff *skb;
a1c49c434e1505 Sean Wang    2019-06-02  2255  	int err;
a1c49c434e1505 Sean Wang    2019-06-02  2256  
a1c49c434e1505 Sean Wang    2019-06-02  2257  	if (urb->status == 0 && urb->actual_length > 0) {
a1c49c434e1505 Sean Wang    2019-06-02  2258  		hdev->stat.byte_rx += urb->actual_length;
a1c49c434e1505 Sean Wang    2019-06-02  2259  
a1c49c434e1505 Sean Wang    2019-06-02  2260  		/* WMT event shouldn't be fragmented and the size should be
a1c49c434e1505 Sean Wang    2019-06-02  2261  		 * less than HCI_WMT_MAX_EVENT_SIZE.
a1c49c434e1505 Sean Wang    2019-06-02  2262  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2263  		skb = bt_skb_alloc(HCI_WMT_MAX_EVENT_SIZE, GFP_ATOMIC);
a1c49c434e1505 Sean Wang    2019-06-02  2264  		if (!skb) {
a1c49c434e1505 Sean Wang    2019-06-02  2265  			hdev->stat.err_rx++;
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2266  			kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2267  			return;
a1c49c434e1505 Sean Wang    2019-06-02  2268  		}
a1c49c434e1505 Sean Wang    2019-06-02  2269  
a1c49c434e1505 Sean Wang    2019-06-02  2270  		hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
a1c49c434e1505 Sean Wang    2019-06-02  2271  		skb_put_data(skb, urb->transfer_buffer, urb->actual_length);
a1c49c434e1505 Sean Wang    2019-06-02  2272  
a1c49c434e1505 Sean Wang    2019-06-02  2273  		hdr = (void *)skb->data;
a1c49c434e1505 Sean Wang    2019-06-02  2274  
a1c49c434e1505 Sean Wang    2019-06-02  2275  		/* When someone waits for the WMT event, the skb is being cloned
a1c49c434e1505 Sean Wang    2019-06-02  2276  		 * and being processed the events from there then.
a1c49c434e1505 Sean Wang    2019-06-02  2277  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2278  		if (test_bit(BTUSB_TX_WAIT_VND_EVT, &data->flags)) {
22cc6b7a1dbb58 Johan Hovold 2019-11-28  2279  			data->evt_skb = skb_clone(skb, GFP_ATOMIC);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2280  			if (!data->evt_skb) {
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2281  				kfree_skb(skb);
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2282  				kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2283  				return;
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2284  			}
a1c49c434e1505 Sean Wang    2019-06-02  2285  		}
a1c49c434e1505 Sean Wang    2019-06-02  2286  
a1c49c434e1505 Sean Wang    2019-06-02  2287  		err = hci_recv_frame(hdev, skb);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2288  		if (err < 0) {
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2289  			kfree_skb(data->evt_skb);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2290  			data->evt_skb = NULL;
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2291  			kfree(urb->setup_packet);
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2292  			return;
de71a6cb4bf24d Jupeng Zhong 2021-02-02  2293  		}
a1c49c434e1505 Sean Wang    2019-06-02  2294  
a1c49c434e1505 Sean Wang    2019-06-02  2295  		if (test_and_clear_bit(BTUSB_TX_WAIT_VND_EVT,
a1c49c434e1505 Sean Wang    2019-06-02  2296  				       &data->flags)) {
a1c49c434e1505 Sean Wang    2019-06-02  2297  			/* Barrier to sync with other CPUs */
a1c49c434e1505 Sean Wang    2019-06-02  2298  			smp_mb__after_atomic();
a1c49c434e1505 Sean Wang    2019-06-02  2299  			wake_up_bit(&data->flags,
a1c49c434e1505 Sean Wang    2019-06-02  2300  				    BTUSB_TX_WAIT_VND_EVT);
a1c49c434e1505 Sean Wang    2019-06-02  2301  		}
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2302  		kfree(urb->setup_packet);
a1c49c434e1505 Sean Wang    2019-06-02  2303  		return;
a1c49c434e1505 Sean Wang    2019-06-02  2304  	} else if (urb->status == -ENOENT) {
a1c49c434e1505 Sean Wang    2019-06-02  2305  		/* Avoid suspend failed when usb_kill_urb */
a1c49c434e1505 Sean Wang    2019-06-02  2306  		return;
a1c49c434e1505 Sean Wang    2019-06-02  2307  	}
a1c49c434e1505 Sean Wang    2019-06-02  2308  
a1c49c434e1505 Sean Wang    2019-06-02  2309  	usb_mark_last_busy(data->udev);
a1c49c434e1505 Sean Wang    2019-06-02  2310  
a1c49c434e1505 Sean Wang    2019-06-02  2311  	/* The URB complete handler is still called with urb->actual_length = 0
a1c49c434e1505 Sean Wang    2019-06-02  2312  	 * when the event is not available, so we should keep re-submitting
a1c49c434e1505 Sean Wang    2019-06-02  2313  	 * URB until WMT event returns, Also, It's necessary to wait some time
a1c49c434e1505 Sean Wang    2019-06-02  2314  	 * between the two consecutive control URBs to relax the target device
a1c49c434e1505 Sean Wang    2019-06-02  2315  	 * to generate the event. Otherwise, the WMT event cannot return from
a1c49c434e1505 Sean Wang    2019-06-02  2316  	 * the device successfully.
a1c49c434e1505 Sean Wang    2019-06-02  2317  	 */
48c13301e6baba Mark Chen    2021-02-02  2318  	udelay(500);
a1c49c434e1505 Sean Wang    2019-06-02  2319  
a1c49c434e1505 Sean Wang    2019-06-02  2320  	usb_anchor_urb(urb, &data->ctrl_anchor);
a1c49c434e1505 Sean Wang    2019-06-02  2321  	err = usb_submit_urb(urb, GFP_ATOMIC);
a1c49c434e1505 Sean Wang    2019-06-02  2322  	if (err < 0) {
60c6a63a3d3080 Mark-YW.Chen 2021-10-14  2323  		kfree(urb->setup_packet);
a1c49c434e1505 Sean Wang    2019-06-02  2324  		/* -EPERM: urb is being killed;
a1c49c434e1505 Sean Wang    2019-06-02  2325  		 * -ENODEV: device got disconnected
a1c49c434e1505 Sean Wang    2019-06-02  2326  		 */
a1c49c434e1505 Sean Wang    2019-06-02  2327  		if (err != -EPERM && err != -ENODEV)
a1c49c434e1505 Sean Wang    2019-06-02  2328  			bt_dev_err(hdev, "urb %p failed to resubmit (%d)",
a1c49c434e1505 Sean Wang    2019-06-02  2329  				   urb, -err);
a1c49c434e1505 Sean Wang    2019-06-02  2330  		usb_unanchor_urb(urb);
a1c49c434e1505 Sean Wang    2019-06-02  2331  	}
a1c49c434e1505 Sean Wang    2019-06-02  2332  }
a1c49c434e1505 Sean Wang    2019-06-02  2333  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
