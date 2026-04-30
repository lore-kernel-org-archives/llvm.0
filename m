Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E723EA89;
	Thu, 30 Apr 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547002; cv=none; b=KY8+Icm9pBf3fMlub8no/vQyeIpwJRn6NIsXDGXPacx3v5sdoa+Vrkr1S5EyUOzEGO/ZNReTIUgnw56QUkIjwRZiI6mGQmcgkF4fXe6q94DWMe9OQGudYnwfDzHcikc5eyFtBq4OEp1fVqXJoRAbe7ANvs9cunYEPqJ36XAKZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547002; c=relaxed/simple;
	bh=af2+WqaBOJjzYGkvScqHKYvdj2nIXZyrjYBxCdj8d04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs4DebK7WjIQdl+cIDH3U8X5puc3ESUfAx4oMGDzFfwDX5+4NJbx50IHFxSODWHHfBT933nSDNj2edQmaT1OPO8YzvldBtru2gbR7hvMUEPIdK/fLG+h9umnarUHWjbi71J0YqoUnnl0cUTX1JsN/8ufwOxf9uppX9SFSIedB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNqf1OPh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNqf1OPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777547001; x=1809083001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=af2+WqaBOJjzYGkvScqHKYvdj2nIXZyrjYBxCdj8d04=;
  b=nNqf1OPhxYruLP/veW/0CXqJ52rHDYMJxNfKXnERW/WOOEPQghnDAt8t
   GQKoypPf/zeF9g5lLfnrC2FYoCo1QSBkTZMGbeebEKPUqc7wQcQlLS5o7
   I7/oMmxd+v7rs0yO4lL47d/o4m4KooT/avDNUP1qtEI7sg4/pe42E+EAZ
   MiZKXG3DjFSSZ+0w6I6RIQrOwCAPf/Ld+YhFjJNJMYiy7Q0A6B96EMgUq
   fb7k08SwgDwlFD1MzLMETzL6sBITrKF4tQ1NUFsvYrXGQX9Agwz+bBJPF
   1uusEoXN33c2TcdMKxHwc2YIPLHE/XfF9lzmer4XXG0lfW5xNXEmUPKPZ
   Q==;
X-CSE-ConnectionGUID: KrAlIApoTlCRsEvGyHk39g==
X-CSE-MsgGUID: P4GTg9/vRAKJ9hxHPUkN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101157246"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="101157246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:03:20 -0700
X-CSE-ConnectionGUID: aTS84OxKQq6GwrgGHg6yNA==
X-CSE-MsgGUID: uLbIXbbnQmyWSstGjibosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234592287"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Apr 2026 04:03:18 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIPAo-00000000CJ2-3pne;
	Thu, 30 Apr 2026 11:03:14 +0000
Date: Thu, 30 Apr 2026 19:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>,
	syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, tiwai@suse.com,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] sound: usb: caiaq: fix reference leak in probe error
Message-ID: <202604301817.kEsyTIz2-lkp@intel.com>
References: <20260429104527.19927-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429104527.19927-1-oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus usb/usb-testing usb/usb-next usb/usb-linus westeri-thunderbolt/next peter-chen-usb/for-usb-next linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/sound-usb-caiaq-fix-reference-leak-in-probe-error/20260429-205539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260429104527.19927-1-oneukum%40suse.com
patch subject: [PATCH] sound: usb: caiaq: fix reference leak in probe error
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260430/202604301817.kEsyTIz2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301817.kEsyTIz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301817.kEsyTIz2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/usb/caiaq/device.c:446:8: error: use of undeclared label 'dev_err_put'
     446 |                 goto dev_err_put;
         |                      ^
>> sound/usb/caiaq/device.c:534:2: warning: unused label 'err_dev_put' [-Wunused-label]
     534 |  err_dev_put:
         |  ^~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/dev_err_put +446 sound/usb/caiaq/device.c

   434	
   435	static int init_card(struct snd_usb_caiaqdev *cdev)
   436	{
   437		char *c, usbpath[32];
   438		struct usb_device *usb_dev = cdev->chip.dev;
   439		struct snd_card *card = cdev->chip.card;
   440		struct device *dev = caiaqdev_to_dev(cdev);
   441		int err, len;
   442	
   443		if (usb_set_interface(usb_dev, 0, 1) != 0) {
   444			dev_err(dev, "can't set alt interface.\n");
   445			err = -EIO;
 > 446			goto dev_err_put;
   447		}
   448	
   449		usb_init_urb(&cdev->ep1_in_urb);
   450		usb_init_urb(&cdev->midi_out_urb);
   451	
   452		usb_fill_bulk_urb(&cdev->ep1_in_urb, usb_dev,
   453				  usb_rcvbulkpipe(usb_dev, 0x1),
   454				  cdev->ep1_in_buf, EP1_BUFSIZE,
   455				  usb_ep1_command_reply_dispatch, cdev);
   456	
   457		usb_fill_bulk_urb(&cdev->midi_out_urb, usb_dev,
   458				  usb_sndbulkpipe(usb_dev, 0x1),
   459				  cdev->midi_out_buf, EP1_BUFSIZE,
   460				  snd_usb_caiaq_midi_output_done, cdev);
   461	
   462		/* sanity checks of EPs before actually submitting */
   463		if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
   464		    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
   465			dev_err(dev, "invalid EPs\n");
   466			err = -EINVAL;
   467			goto dev_err_put;
   468		}
   469	
   470		init_waitqueue_head(&cdev->ep1_wait_queue);
   471		init_waitqueue_head(&cdev->prepare_wait_queue);
   472	
   473		if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0) {
   474			err = -EIO;
   475			goto dev_err_put;
   476		}
   477	
   478	
   479		err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
   480		if (err)
   481			goto err_kill_urb;
   482	
   483		if (!wait_event_timeout(cdev->ep1_wait_queue, cdev->spec_received, HZ)) {
   484			err = -ENODEV;
   485			goto err_kill_urb;
   486		}
   487	
   488		usb_string(usb_dev, usb_dev->descriptor.iManufacturer,
   489			   cdev->vendor_name, CAIAQ_USB_STR_LEN);
   490	
   491		usb_string(usb_dev, usb_dev->descriptor.iProduct,
   492			   cdev->product_name, CAIAQ_USB_STR_LEN);
   493	
   494		strscpy(card->driver, MODNAME, sizeof(card->driver));
   495		strscpy(card->shortname, cdev->product_name, sizeof(card->shortname));
   496		strscpy(card->mixername, cdev->product_name, sizeof(card->mixername));
   497	
   498		/* if the id was not passed as module option, fill it with a shortened
   499		 * version of the product string which does not contain any
   500		 * whitespaces */
   501	
   502		if (*card->id == '\0') {
   503			char id[sizeof(card->id)];
   504	
   505			memset(id, 0, sizeof(id));
   506	
   507			for (c = card->shortname, len = 0;
   508				*c && len < sizeof(card->id) - 1; c++)
   509				if (*c != ' ')
   510					id[len++] = *c;
   511	
   512			snd_card_set_id(card, id);
   513		}
   514	
   515		usb_make_path(usb_dev, usbpath, sizeof(usbpath));
   516		scnprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
   517			       cdev->vendor_name, cdev->product_name, usbpath);
   518	
   519		card->private_free = card_free;
   520		err = setup_card(cdev);
   521		if (err < 0)
   522			return err;
   523	
   524		return 0;
   525	
   526	 err_kill_urb:
   527		usb_kill_urb(&cdev->ep1_in_urb);
   528	
   529		/*
   530	 	 * private_free has not been set.
   531		 * Undoing the usb_get_dev() from
   532		 * create_card()
   533		 */
 > 534	 err_dev_put:
   535		usb_put_dev(usb_dev);
   536		return err;
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
