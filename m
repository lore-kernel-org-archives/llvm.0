Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F615AD;
	Thu, 19 Jan 2023 00:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674089787; x=1705625787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xdb5ixrOsUzWmHPydI10ogyRQlabzU6bvkXRZlEU/Q=;
  b=fgb7YbvCjdppl9kDefRUd7dQYwgYhQS4VuY++02JfzHrKypC6hPpTnAt
   2h0y1YdKVzaV/I3Ar6JO/6A5TZ6moc3XpNcdg/bBcr8q+Hu2NiOluzTmX
   XVkcaccvgoTiQYNWQUH46KJgmJ25Y8CD/EXmZKL7udE2WOBjUPWBXiiXf
   F4PASRduhYJcZVGIKDfbNIClYOZTPx4PR33pYzLsvhaZaGDfe/uzPAJ4A
   0/eeL3FRAHfA4xlSeYdAI2ne8t9WeoSGHNXZlKwnnK7YHWsCfClCWD1gO
   Oz2V06rVHO7WtgBIDAz5dlow+tKQqJd48d5732ULYXp9FdWLfYecmpv8D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323836549"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323836549"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661942528"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661942528"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 16:56:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJE6-0000tg-2K;
	Thu, 19 Jan 2023 00:56:22 +0000
Date: Thu, 19 Jan 2023 08:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [robh:dt/linus 5/5] drivers/of/platform.c:570:19: error:
 incompatible pointer types passing 'char *[14]' to parameter of type 'char
 *'
Message-ID: <202301190812.uoPlw0Uq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   2d681d6a23a14e6507e536605d83e38acfab9018
commit: 2d681d6a23a14e6507e536605d83e38acfab9018 [5/5] of: Make of framebuffer devices unique
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230119/202301190812.uoPlw0Uq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=2d681d6a23a14e6507e536605d83e38acfab9018
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/linus
        git checkout 2d681d6a23a14e6507e536605d83e38acfab9018
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/of/platform.c:570:19: error: incompatible pointer types passing 'char *[14]' to parameter of type 'char *' [-Werror,-Wincompatible-pointer-types]
                           ret = snprintf(buf, "of-display-%d", display_number++);
                                          ^~~
   include/linux/kernel.h:213:20: note: passing argument to parameter 'buf' here
   int snprintf(char *buf, size_t size, const char *fmt, ...);
                      ^
   drivers/of/platform.c:570:24: warning: incompatible pointer to integer conversion passing 'char[14]' to parameter of type 'size_t' (aka 'unsigned int') [-Wint-conversion]
                           ret = snprintf(buf, "of-display-%d", display_number++);
                                               ^~~~~~~~~~~~~~~
   include/linux/kernel.h:213:32: note: passing argument to parameter 'size' here
   int snprintf(char *buf, size_t size, const char *fmt, ...);
                                  ^
   drivers/of/platform.c:570:41: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
                           ret = snprintf(buf, "of-display-%d", display_number++);
                                                                ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:213:50: note: passing argument to parameter 'fmt' here
   int snprintf(char *buf, size_t size, const char *fmt, ...);
                                                    ^
>> drivers/of/platform.c:573:36: error: incompatible pointer types passing 'char *[14]' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
                           of_platform_device_create(node, buf, NULL);
                                                           ^~~
   drivers/of/platform.c:216:15: note: passing argument to parameter here
   EXPORT_SYMBOL(of_platform_device_create);
                 ^
   2 warnings and 2 errors generated.


vim +570 drivers/of/platform.c

   515	
   516	static int __init of_platform_default_populate_init(void)
   517	{
   518		struct device_node *node;
   519	
   520		device_links_supplier_sync_state_pause();
   521	
   522		if (!of_have_populated_dt())
   523			return -ENODEV;
   524	
   525		if (IS_ENABLED(CONFIG_PPC)) {
   526			struct device_node *boot_display = NULL;
   527			struct platform_device *dev;
   528			int display_number = 1;
   529			int ret;
   530	
   531			/* Check if we have a MacOS display without a node spec */
   532			if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
   533				/*
   534				 * The old code tried to work out which node was the MacOS
   535				 * display based on the address. I'm dropping that since the
   536				 * lack of a node spec only happens with old BootX versions
   537				 * (users can update) and with this code, they'll still get
   538				 * a display (just not the palette hacks).
   539				 */
   540				dev = platform_device_alloc("bootx-noscreen", 0);
   541				if (WARN_ON(!dev))
   542					return -ENOMEM;
   543				ret = platform_device_add(dev);
   544				if (WARN_ON(ret)) {
   545					platform_device_put(dev);
   546					return ret;
   547				}
   548			}
   549	
   550			/*
   551			 * For OF framebuffers, first create the device for the boot display,
   552			 * then for the other framebuffers. Only fail for the boot display;
   553			 * ignore errors for the rest.
   554			 */
   555			for_each_node_by_type(node, "display") {
   556				if (!of_get_property(node, "linux,opened", NULL) ||
   557				    !of_get_property(node, "linux,boot-display", NULL))
   558					continue;
   559				dev = of_platform_device_create(node, "of-display", NULL);
   560				if (WARN_ON(!dev))
   561					return -ENOMEM;
   562				boot_display = node;
   563				break;
   564			}
   565	
   566			for_each_node_by_type(node, "display") {
   567				char *buf[14];
   568				if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
   569					continue;
 > 570				ret = snprintf(buf, "of-display-%d", display_number++);
   571				if (ret >= sizeof(buf))
   572					continue;
 > 573				of_platform_device_create(node, buf, NULL);
   574			}
   575	
   576		} else {
   577			/*
   578			 * Handle certain compatibles explicitly, since we don't want to create
   579			 * platform_devices for every node in /reserved-memory with a
   580			 * "compatible",
   581			 */
   582			for_each_matching_node(node, reserved_mem_matches)
   583				of_platform_device_create(node, NULL, NULL);
   584	
   585			node = of_find_node_by_path("/firmware");
   586			if (node) {
   587				of_platform_populate(node, NULL, NULL, NULL);
   588				of_node_put(node);
   589			}
   590	
   591			node = of_get_compatible_child(of_chosen, "simple-framebuffer");
   592			of_platform_device_create(node, NULL, NULL);
   593			of_node_put(node);
   594	
   595			/* Populate everything else. */
   596			of_platform_default_populate(NULL, NULL, NULL);
   597		}
   598	
   599		return 0;
   600	}
   601	arch_initcall_sync(of_platform_default_populate_init);
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
