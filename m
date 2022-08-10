Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23417CA
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 06:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660111762; x=1691647762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4r5i0Y6g9xMaNUs1Xqtf0YMvE9i1mgwbTQx+M/ACgz0=;
  b=nmsj6Z1aR4fMRGCq3CAx9jrMChb5uiwmZq+KpiYtR1XtTgw3NE5pozsW
   lgYLsyP63Kf4UK62MnGfvk+m3Uyd6yrccoCiDRNMxWCPjaeyFLiG00bm4
   Yq/Va8auRYg/kPV44nBV38+5hy2IIuXtPh1ptt7a+W0Mj8bTFpe6wG/Gv
   VvY5nxvb9EwywrDE0T3sRWosSN7Rv3Kjgjr2SxkD5TkQiAaYYzqkVZ5T5
   qZTITCSbtiL8vThhWhk6rwdClDYcy3eJ36IWaLQemxMKcxT4Z75o0qygO
   sGX9iK27vDj235gpKIIDI5rw0KGmJeLTQtN9d4hsj7T4Eu0Kb70FOGEsg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="292256188"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="292256188"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 23:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="673177336"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2022 23:09:12 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLetz-000NaL-1u;
	Wed, 10 Aug 2022 06:09:11 +0000
Date: Wed, 10 Aug 2022 14:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nate Yocom <nate@yocom.org>, dmitry.torokhov@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	nate@yocom.org
Subject: Re: [PATCH] Input: joystick: xpad: Add X-Box Adaptive Controller
 support
Message-ID: <202208101406.tS1Uz1FD-lkp@intel.com>
References: <20220810002024.13686-1-nate@yocom.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220810002024.13686-1-nate@yocom.org>

Hi Nate,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on hid/for-next linus/master v5.19 next-20220810]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nate-Yocom/Input-joystick-xpad-Add-X-Box-Adaptive-Controller-support/20220810-082302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220810/202208101406.tS1Uz1FD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c3757fab74082cf845405ba8d8b2d60e06572cd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nate-Yocom/Input-joystick-xpad-Add-X-Box-Adaptive-Controller-support/20220810-082302
        git checkout 4c3757fab74082cf845405ba8d8b2d60e06572cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/ drivers/input/joystick/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/joystick/xpad.c:1643:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/input/joystick/xpad.c:1643:2: note: insert '__attribute__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); 
   drivers/input/joystick/xpad.c:1643:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +1643 drivers/input/joystick/xpad.c

^1da177e4c3f41 drivers/usb/input/xpad.c      Linus Torvalds    2005-04-16  1618  
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1619  static void xpad_set_up_abs(struct input_dev *input_dev, signed short abs)
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1620  {
1a48ff81b3912b drivers/input/joystick/xpad.c Ted Mielczarek    2014-08-08  1621  	struct usb_xpad *xpad = input_get_drvdata(input_dev);
68c78d0155e379 drivers/input/joystick/xpad.c Leo Sperling      2016-08-03  1622  
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1623  	switch (abs) {
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1624  	case ABS_X:
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1625  	case ABS_Y:
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1626  	case ABS_RX:
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1627  	case ABS_RY:	/* the two sticks */
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1628  		input_set_abs_params(input_dev, abs, -32768, 32767, 16, 128);
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1629  		break;
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1630  	case ABS_Z:
b45d44e7e00c17 drivers/input/joystick/xpad.c Nicolas Léveillé  2009-12-29  1631  	case ABS_RZ:	/* the triggers (if mapped to axes) */
1a48ff81b3912b drivers/input/joystick/xpad.c Ted Mielczarek    2014-08-08  1632  		if (xpad->xtype == XTYPE_XBOXONE)
1a48ff81b3912b drivers/input/joystick/xpad.c Ted Mielczarek    2014-08-08  1633  			input_set_abs_params(input_dev, abs, 0, 1023, 0, 0);
1a48ff81b3912b drivers/input/joystick/xpad.c Ted Mielczarek    2014-08-08  1634  		else
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1635  			input_set_abs_params(input_dev, abs, 0, 255, 0, 0);
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1636  		break;
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1637  	case ABS_HAT0X:
b45d44e7e00c17 drivers/input/joystick/xpad.c Nicolas Léveillé  2009-12-29  1638  	case ABS_HAT0Y:	/* the d-pad (only if dpad is mapped to axes */
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1639  		input_set_abs_params(input_dev, abs, -1, 1, 0, 0);
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1640  		break;
4c3757fab74082 drivers/input/joystick/xpad.c Nate Yocom        2022-08-09  1641  	case ABS_MISC: /* 4 value layer button (such as on the XAC) */
4c3757fab74082 drivers/input/joystick/xpad.c Nate Yocom        2022-08-09  1642  		input_set_abs_params(input_dev, abs, 0, 4, 0, 0);
a01308031c2647 drivers/input/joystick/xpad.c Marcus Folkesson  2018-05-08 @1643  	default:
a01308031c2647 drivers/input/joystick/xpad.c Marcus Folkesson  2018-05-08  1644  		input_set_abs_params(input_dev, abs, 0, 0, 0, 0);
a01308031c2647 drivers/input/joystick/xpad.c Marcus Folkesson  2018-05-08  1645  		break;
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1646  	}
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1647  }
deb8ee43a23d48 drivers/usb/input/xpad.c      Dominic Cerquetti 2006-10-10  1648  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
