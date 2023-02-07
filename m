Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01617211C;
	Tue,  7 Feb 2023 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675772343; x=1707308343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65Zile9WdO0Mi8LCaNFiWxLs0lzNOXy7iShOpkhjyz8=;
  b=VAokhZCKuCZrIaQ2alPfszB+DgnSKrw9ih6a/BWbv/nf9jx3KuQyxzXy
   H5jHmbt26AXoECEwRNgQrIjSOBP6hP4k+AbDq0+6/T4fDubtW3b94OjQW
   1+u7lVAhycr8P9QEKxmnYNqwmakYTjWmibRp76MwmlDuAiAqoFrLdwT/d
   C38yPvusOLWOzx3hq8wWFVwqhp+3NfJpUVfvYiHFWuTecvl2VsVdrEPyn
   b2+0M9wtoJYjN9aiQgWqgiCZQ95rQu4Q7IlFs+EOvtt1GpX/Cy2px/r8P
   ZiNMkcfZdxDI6ve2ePjjdRxu+LH8qt3hIutKFpNOCnesBs+sAwEBD2HXS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="415709735"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415709735"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 04:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="912309570"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="912309570"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2023 04:19:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPMw8-0003XG-0j;
	Tue, 07 Feb 2023 12:19:00 +0000
Date: Tue, 7 Feb 2023 20:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 34/39] drivers/usb/gadget/configfs.c:824:6:
 warning: variable 'ret' set but not used
Message-ID: <202302072028.rI3pAivq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   cf13d6e4a9aa6639c173fd630d82d586a2322ff9
commit: 15a7cf8caabee4613764abe7814dd3162cb64137 [34/39] usb: gadget: configfs: Support arbitrary string descriptors
config: i386-randconfig-a004-20230206 (https://download.01.org/0day-ci/archive/20230207/202302072028.rI3pAivq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=15a7cf8caabee4613764abe7814dd3162cb64137
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 15a7cf8caabee4613764abe7814dd3162cb64137
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:824:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +824 drivers/usb/gadget/configfs.c

   818	
   819	static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
   820					     size_t len)
   821	{
   822		struct gadget_string *string = to_gadget_string(item);
   823		int size = min(sizeof(string->string), len + 1);
 > 824		int ret;
   825	
   826		if (len > USB_MAX_STRING_LEN)
   827			return -EINVAL;
   828	
   829		ret = strscpy(string->string, page, size);
   830		return len;
   831	}
   832	CONFIGFS_ATTR(gadget_string_, s);
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
