Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C7199FC5;
	Thu, 10 Oct 2024 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728597519; cv=none; b=sECNpoRdjWsaZGkNBHtZKUsgjr4FVG93bT1eYAVcZigY6vxuPyKhT4U5Tv0QwLkabtRQYV6bVJdP1wNkPn0srkV7AwO4QHJnA2VS01juJFQ/zsSWE/q8UdZuOslbmrV+MoGbeUs5/dMk3oWq0j7r/CChYBTJrSCfU9tZKxov53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728597519; c=relaxed/simple;
	bh=ataDdnS0+FI3Z1CQ2RvtbFVgCVGF7FU9SJ8W8mNF1Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTB1KwbvOyobOaDcGFYB8EzhcOJw7nE1nnNg4Nzi7WctE6JJkmEh7X3DNCOfoEbYtFP5ChAF1mzwgW7SznzFX5Krw+qR9xtIEDAejLuLuf00howHERHRKqZ/lxr8cIGTjvZw++zHRm+EuhXFSAMf8T34YYdUDR1e544r8xJs+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOT0Q2zi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOT0Q2zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728597518; x=1760133518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ataDdnS0+FI3Z1CQ2RvtbFVgCVGF7FU9SJ8W8mNF1Aw=;
  b=DOT0Q2ziXSxNrlaOpmdbzQm+5vbRT7o6f1acUB/l+h/LODDfqyyjcA4+
   POGNtyIEZR2LAWyNFlRD5BdhOBffqtPHVq2a66bsch5b9ygaxnoynMJQl
   XIHtONBqj6xaAO1RTw0vETjnuQZv+bFrycAS0JG6bMkChmSBfu3Fg0QR/
   t3lWAXKEbyNVwcIOE9fKPFmsOScn5bu3LxJxjMx7d2t4h7VuYyNvOK/1v
   GO9P/vcarcpTkAccI8CbBHyfzroUao5S1ywRNVBnRf6zOLHVM/LOu8fnS
   57GaN9+dE6ZJ9lXm4Ib2ci/ppX0E/Xb3Nwom09xG9bj4h+YSYlIq9wE/s
   g==;
X-CSE-ConnectionGUID: 02ZUXjAlTcKcauWzxzpepA==
X-CSE-MsgGUID: 7EpP3SzQSLS36PrUDWro1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38627917"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="38627917"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 14:58:37 -0700
X-CSE-ConnectionGUID: 2VFkMRGMS6+6bbjHX+E6hA==
X-CSE-MsgGUID: Z4HmlcvkToqqoQpxOn2MlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="77542934"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Oct 2024 14:58:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz1B3-000BKF-2X;
	Thu, 10 Oct 2024 21:58:33 +0000
Date: Fri, 11 Oct 2024 05:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:for-usb-linus 4/4]
 drivers/usb/host/xhci-dbgtty.c:239:6: warning: variable 'written' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202410110551.Ko5PYzs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-linus
head:   76f70639f29bc75f4e16748b0b5ee0e74ac01b4a
commit: 76f70639f29bc75f4e16748b0b5ee0e74ac01b4a [4/4] xhci: dbc: honor usb transfer size boundaries.
config: i386-randconfig-002-20241011 (https://download.01.org/0day-ci/archive/20241011/202410110551.Ko5PYzs9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110551.Ko5PYzs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110551.Ko5PYzs9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-dbgtty.c:239:6: warning: variable 'written' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     239 |         if (count) {
         |             ^~~~~
   drivers/usb/host/xhci-dbgtty.c:250:9: note: uninitialized use occurs here
     250 |         return written;
         |                ^~~~~~~
   drivers/usb/host/xhci-dbgtty.c:239:2: note: remove the 'if' if its condition is always true
     239 |         if (count) {
         |         ^~~~~~~~~~
   drivers/usb/host/xhci-dbgtty.c:225:18: note: initialize the variable 'written' to silence this warning
     225 |         size_t                  written;
         |                                        ^
         |                                         = 0
   1 warning generated.


vim +239 drivers/usb/host/xhci-dbgtty.c

   219	
   220	static ssize_t dbc_tty_write(struct tty_struct *tty, const u8 *buf,
   221				     size_t count)
   222	{
   223		struct dbc_port		*port = tty->driver_data;
   224		unsigned long		flags;
   225		size_t			written;
   226	
   227		spin_lock_irqsave(&port->port_lock, flags);
   228	
   229		/*
   230		 * Treat tty write as one usb transfer. Make sure the writes are turned
   231		 * into TRB request having the same size boundaries as the tty writes.
   232		 * Don't add data to kfifo before previous write is turned into TRBs
   233		 */
   234		if (port->tx_boundary) {
   235			spin_unlock_irqrestore(&port->port_lock, flags);
   236			return 0;
   237		}
   238	
 > 239		if (count) {
   240			written = kfifo_in(&port->port.xmit_fifo, buf, count);
   241	
   242			if (written == count)
   243				port->tx_boundary = kfifo_len(&port->port.xmit_fifo);
   244	
   245			dbc_start_tx(port);
   246		}
   247	
   248		spin_unlock_irqrestore(&port->port_lock, flags);
   249	
   250		return written;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
