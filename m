Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935012B9F;
	Thu, 25 Jan 2024 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706168977; cv=none; b=J9GVRzOpXsFVKG2sA1cx2M1dNnZU5l4Bz3eP5D31CjlK3xthlb2ybx7Lob4daEjkVw3NgE3T8JvBZ/2xKxZREkbvEc5a52KkboUxRcxhMyenFAl8yZRp4ZNV20c69k0X3k86NU/hf/XsQ3Rw6+jk4QBSiG/BeJpyhqia17z69A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706168977; c=relaxed/simple;
	bh=tvVQC6bKbRYwoc6zCi3NNb3YQNwhsbnkjv3FCGZzQOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjNaahFAcXOl/PLiFewB3fnSgAMSlfPToO1hB0gOuSXdcxaMIRocn6borc321Ak5giXG5Mlql7pZ1CGIwhpgm3Wkl0nNF0oSzAhsXZah2DSDN/EEYsyqH9BMECEfdEyyKOFdn+LNL3oRO2IN0qQmLNjv/TQPxUa12/TiYskCXYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVMXGRmy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVMXGRmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706168976; x=1737704976;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tvVQC6bKbRYwoc6zCi3NNb3YQNwhsbnkjv3FCGZzQOA=;
  b=OVMXGRmy1KQsG/LzCsklUdfWUcwmFjaLM7rqKJtvMwvAKaCosIW0KEUF
   Ri5tOBsurOUH4dqzso8Gh5xrO/uNzPut2MHg0Vb2+USp4uL7s4h7jjI8M
   BbcYt+CCdetiU1EWK2IoQmDIsE7yu4Ap5XDw/07uJNSr45mKwmErWD1z1
   q0I7vrT5MyJl7BHrJJ9t46SxkCpRW4UUUujsoRzXC3PoCs1/oJYlqiox8
   IlBzG60o0pJUlxejODkyJMP2Z/VUWO9Hejr7qjSM1mwZGavbbddAXBhF4
   eNlArEn60f4lfWcEMeJkjqfWtrNo9gwuml3azCh8ZAcuzI8Jkbfj1kfiq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1931037"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1931037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 23:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2190726"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2024 23:49:31 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSuUK-0008qj-0t;
	Thu, 25 Jan 2024 07:49:28 +0000
Date: Thu, 25 Jan 2024 15:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 7/21] drivers/hid/hid-magicmouse.c:157:
 warning: Function parameter or struct member 'input_ops' not described in
 'magicmouse_sc'
Message-ID: <202401251544.xpxFx8Dj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   253645613d55bc9e62bb0b1811d009cd987f301f
commit: 991d9692ce457f94c749787fbf2d2f2bd8bb7bf1 [7/21] HID: magicmouse: use ops function pointers for input functionality
config: i386-buildonly-randconfig-005-20240124 (https://download.01.org/0day-ci/archive/20240125/202401251544.xpxFx8Dj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251544.xpxFx8Dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251544.xpxFx8Dj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or struct member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or struct member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or struct member 'battery_timer' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:157: warning: Function parameter or struct member 'input_ops' not described in 'magicmouse_sc'


vim +157 drivers/hid/hid-magicmouse.c

991d9692ce457f Janne Grunau  2021-12-16  122  
128537cea464d9 Michael Poole 2010-02-06  123  /**
128537cea464d9 Michael Poole 2010-02-06  124   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  125   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  126   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  127   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  128   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  129   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  130   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  131   * @tracking_ids: Mapping of current touch input data to @touches.
128537cea464d9 Michael Poole 2010-02-06  132   */
128537cea464d9 Michael Poole 2010-02-06  133  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  134  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  135  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  136  
128537cea464d9 Michael Poole 2010-02-06  137  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  138  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  139  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  140  
089b2bcdbc5e12 Janne Grunau  2021-12-16  141  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  142  	struct {
c04266889b5911 Chase Douglas 2010-06-20  143  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  144  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  145  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  146  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  147  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  148  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  149  		bool scroll_y_active;
8aff5a2106ccfe Janne Grunau  2021-12-16  150  	} touches[MAX_CONTACTS];
8aff5a2106ccfe Janne Grunau  2021-12-16  151  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  152  
c0dc5582812dfa John Chen     2021-03-30  153  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  154  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  155  	struct timer_list battery_timer;
991d9692ce457f Janne Grunau  2021-12-16  156  	struct magicmouse_input_ops input_ops;
128537cea464d9 Michael Poole 2010-02-06 @157  };
128537cea464d9 Michael Poole 2010-02-06  158  

:::::: The code at line 157 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
