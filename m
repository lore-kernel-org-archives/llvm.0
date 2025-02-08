Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461E2475D7;
	Sat,  8 Feb 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739018581; cv=none; b=X/+ziSahqwgpeo1xgKy4WywtLpc1/kBxkmfI1+HwkygS4eFqafIrlE3JCu6G5/IOX5mSDZtMdPyFYzBrAi/TIoRXaMO53RsFMZ6Y41u6ZWK2ODHbnJVo+drxNqOO/o/zaHSRFnTuD0Mdv2a631Qf8EvEJ5PD0MKybnRtlhNYYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739018581; c=relaxed/simple;
	bh=YVy+IfFJ5cAi8fhZw1+Db4yy3YSBlt1NusOQ50IFpc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejZ4/2hHTcqWCbn04aghFCanNFPvz3nJGz7H/dlEj5rPExDaICvsqKwebO2hE1pOkBtGE+si727vqAYvIlAGhzUq0gS1unINZP2KCFSq5Z3eMnbhTosl8EvuK2JsnqGxHNdsqtmCs2MC/Rb1z2rYXIw2GO56I6o35vU7x4MX/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrYl1pvu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrYl1pvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739018580; x=1770554580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YVy+IfFJ5cAi8fhZw1+Db4yy3YSBlt1NusOQ50IFpc0=;
  b=YrYl1pvu6AhDEnMnaljyC9+43TXwvVSamA3h73KATIU54HNi1QY9uNkI
   4LeyqAfb6NvCWzNLk013FV949ZxBsJMX9IGbLKrybMF20RziveYZUPdrW
   cjfsaNcbabbM9UzUzuCBS/QNNtbuh4kz9flXOsG9VILaXfizuO5s27/2g
   P8+zhgLpT9nYQUDXk2uq8GHvfBYCEgbTy9HfoQueN5AKufdCj7QZJbu+x
   OgS9VNlZ8mXcgQWNUOY/wmk71fn4Ki8Vsqe1ThIUtLJGVmaX6I7hIjr/a
   4KD7tt/PoL0ZYQAKzxhWWYd56qLGQQpI99Yktwb/R5cr5Gn5EyNiECX/J
   A==;
X-CSE-ConnectionGUID: TwQowPzAQUmVogVaWRFo8Q==
X-CSE-MsgGUID: IwfsGajKR/26qd9g1Ye7MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62128324"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="62128324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:42:55 -0800
X-CSE-ConnectionGUID: l3YTQ+M0RiSMtzD13TC+sQ==
X-CSE-MsgGUID: OZ9hKCmnSWOjjnRpgIVSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116368381"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 04:42:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgkAd-000zyN-0y;
	Sat, 08 Feb 2025 12:42:51 +0000
Date: Sat, 8 Feb 2025 20:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jill Donahue <jilliandonahue58@gmail.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jill Donahue <jilliandonahue58@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] f_midi_complete to call tasklet_hi_schedule
Message-ID: <202502082022.ILQXjseT-lkp@intel.com>
References: <20250207203441.945196-1-jilliandonahue58@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207203441.945196-1-jilliandonahue58@gmail.com>

Hi Jill,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jill-Donahue/f_midi_complete-to-call-tasklet_hi_schedule/20250208-043845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250207203441.945196-1-jilliandonahue58%40gmail.com
patch subject: [PATCH v3] f_midi_complete to call tasklet_hi_schedule
config: arm-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082022.ILQXjseT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082022.ILQXjseT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082022.ILQXjseT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_midi.c:286:31: error: no member named 'tasklet' in 'struct f_midi'
     286 |                         tasklet_hi_schedule(&midi->tasklet);
         |                                              ~~~~  ^
   1 error generated.


vim +286 drivers/usb/gadget/function/f_midi.c

   269	
   270	static void
   271	f_midi_complete(struct usb_ep *ep, struct usb_request *req)
   272	{
   273		struct f_midi *midi = ep->driver_data;
   274		struct usb_composite_dev *cdev = midi->func.config->cdev;
   275		int status = req->status;
   276	
   277		switch (status) {
   278		case 0:			 /* normal completion */
   279			if (ep == midi->out_ep) {
   280				/* We received stuff. req is queued again, below */
   281				f_midi_handle_out_data(ep, req);
   282			} else if (ep == midi->in_ep) {
   283				/* Our transmit completed. See if there's more to go.
   284				 * f_midi_transmit eats req, don't queue it again. */
   285				req->length = 0;
 > 286				tasklet_hi_schedule(&midi->tasklet);
   287				return;
   288			}
   289			break;
   290	
   291		/* this endpoint is normally active while we're configured */
   292		case -ECONNABORTED:	/* hardware forced ep reset */
   293		case -ECONNRESET:	/* request dequeued */
   294		case -ESHUTDOWN:	/* disconnect from host */
   295			VDBG(cdev, "%s gone (%d), %d/%d\n", ep->name, status,
   296					req->actual, req->length);
   297			if (ep == midi->out_ep) {
   298				f_midi_handle_out_data(ep, req);
   299				/* We don't need to free IN requests because it's handled
   300				 * by the midi->in_req_fifo. */
   301				free_ep_req(ep, req);
   302			}
   303			return;
   304	
   305		case -EOVERFLOW:	/* buffer overrun on read means that
   306					 * we didn't provide a big enough buffer.
   307					 */
   308		default:
   309			DBG(cdev, "%s complete --> %d, %d/%d\n", ep->name,
   310					status, req->actual, req->length);
   311			break;
   312		case -EREMOTEIO:	/* short read */
   313			break;
   314		}
   315	
   316		status = usb_ep_queue(ep, req, GFP_ATOMIC);
   317		if (status) {
   318			ERROR(cdev, "kill %s:  resubmit %d bytes --> %d\n",
   319					ep->name, req->length, status);
   320			usb_ep_set_halt(ep);
   321			/* FIXME recover later ... somehow */
   322		}
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
