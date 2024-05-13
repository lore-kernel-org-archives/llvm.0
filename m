Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256431E4AF;
	Mon, 13 May 2024 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715586372; cv=none; b=DUH/dpRVI/NlvtjMy0zPvZNDSGDXdmzGaL8oE5aZTsz1140aYPxB29ogGDPi1dnfrvCbfvqBsjihpilEZHabKbvX6MKzcRhuR6ZoSUVI0yb9XsbzcMkKbMLY3wTM0ku55e39FIKOiJxTxfYX73jXVfCX58Oz+Xb+esOqHiOU7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715586372; c=relaxed/simple;
	bh=lR+C7s7HwnYnKAmPx95XYMqfKCU00/OKsUG9hCF4Pgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7jdRRaaJwFfL+R0juZmVeVfkcwAJOXhWEAbBTVs6QY3soK2GYDv3j383OUHA9fDwC0fjvs58gMHopqv4k7+1k7tBNawUlem5BJ6urBcm+VBbl7SEnKTVCUuw5+yYXhXYEvGKjhGW+Oh1+wWnn0RWLgTlgo2S/LQSTuwHEffofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKNVXhDX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKNVXhDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715586370; x=1747122370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lR+C7s7HwnYnKAmPx95XYMqfKCU00/OKsUG9hCF4Pgg=;
  b=YKNVXhDXsTrAavVAGzVLiPK9Q5JJuNgymYGJLKHDkTk1ABUSn5lh8a9h
   AstiEJDrdn2mwGxEpJqATiWA8HF6/DHCevR8ieM1JFEgx5SmrIUVORWms
   TFjFzDlUb11usIIteeIfiQiTdzUb4s5S5ltgzUStc4BXQkNl8M9OHGaLU
   8rM8U2sIGcLqwOoT7pSFc2ZTR/11OKecG09niXd4xR+b7kZJLycPaa6Qv
   NV7p1CywoqNw5FL8LAwPlUUQydwV6M4jGgru8CjUGwFTQXIR95lRMYaK2
   85++xTMiZ4VX1f/YHEC7hd2gX/AlJwC6w55nOJ3wVmXo0pKgcM7pZluEX
   A==;
X-CSE-ConnectionGUID: MSMUt2CZQRS1U6gscfl+tg==
X-CSE-MsgGUID: mSNseHomRA+xRnhgNKn2Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11682614"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11682614"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 00:46:10 -0700
X-CSE-ConnectionGUID: Jewwb5JmTkiQalfTf1FOaA==
X-CSE-MsgGUID: 32AoXclqSf+i7pO3sLU36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30246531"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2024 00:46:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6QNq-0009gj-01;
	Mon, 13 May 2024 07:46:06 +0000
Date: Mon, 13 May 2024 15:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: michael.nemanov@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into
 wireless/ti folder
Message-ID: <202405131504.6hyKgXZr-lkp@intel.com>
References: <20240512183247.2190242-18-michael.nemanov@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512183247.2190242-18-michael.nemanov@ti.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 83127ecada257e27f4740dbca9644dd0e838bc36]

url:    https://github.com/intel-lab-lkp/linux/commits/michael-nemanov-ti-com/Add-cc33xx-h-cc33xx_i-h/20240513-023728
base:   83127ecada257e27f4740dbca9644dd0e838bc36
patch link:    https://lore.kernel.org/r/20240512183247.2190242-18-michael.nemanov%40ti.com
patch subject: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into wireless/ti folder
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240513/202405131504.6hyKgXZr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131504.6hyKgXZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131504.6hyKgXZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ti/cc33xx/main.c:562:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     562 |         if (ret < 0) {
         |             ^~~
   drivers/net/wireless/ti/cc33xx/main.c:552:9: note: initialize the variable 'ret' to silence this warning
     552 |         int ret;
         |                ^
         |                 = 0
>> drivers/net/wireless/ti/cc33xx/main.c:858:9: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     857 |                         WARN(1, "Error processing device message @ offset %x",
         |                                                                           ~~
         |                                                                           %zx
     858 |                              (size_t)(buffer - start_of_payload));
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
   drivers/net/wireless/ti/cc33xx/main.c:1287:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1287 |         if (plt_mode != PLT_CHIP_AWAKE) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:1302:9: note: uninitialized use occurs here
    1302 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:1287:2: note: remove the 'if' if its condition is always true
    1287 |         if (plt_mode != PLT_CHIP_AWAKE) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:1275:9: note: initialize the variable 'ret' to silence this warning
    1275 |         int ret;
         |                ^
         |                 = 0
   drivers/net/wireless/ti/cc33xx/main.c:2938:36: warning: variable 'wlvif' is uninitialized when used here [-Wuninitialized]
    2938 |                 cc33xx_acx_group_address_tbl(cc, wlvif, false, NULL, 0);
         |                                                  ^~~~~
   drivers/net/wireless/ti/cc33xx/main.c:2924:26: note: initialize the variable 'wlvif' to silence this warning
    2924 |         struct cc33xx_vif *wlvif;
         |                                 ^
         |                                  = NULL
   drivers/net/wireless/ti/cc33xx/main.c:5594:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    5594 |         if (!cc->core_status)
         |             ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5619:17: note: uninitialized use occurs here
    5619 |         return ERR_PTR(ret);
         |                        ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5594:2: note: remove the 'if' if its condition is always false
    5594 |         if (!cc->core_status)
         |         ^~~~~~~~~~~~~~~~~~~~~
    5595 |                 goto err_buf32;
         |                 ~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5492:15: note: initialize the variable 'ret' to silence this warning
    5492 |         int i, j, ret;
         |                      ^
         |                       = 0
   drivers/net/wireless/ti/cc33xx/main.c:5952:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5967:9: note: uninitialized use occurs here
    5967 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5952:2: note: remove the 'if' if its condition is always true
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5953 |                 nvs_name = pdev_data->family->nvs_name;
    5954 |                 ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
    5955 |                                               nvs_name, &pdev->dev, GFP_KERNEL,
    5956 |                                               cc, cc33xx_nvs_cb);
    5957 |                 if (ret < 0) {
    5958 |                         cc33xx_error("request_firmware_nowait failed for %s: %d",
    5959 |                                      nvs_name, ret);
    5960 |                         complete_all(&cc->nvs_loading_complete);
    5961 |                 }
    5962 |         } else {
         |           ~~~~~~
    5963 |                 cc33xx_nvs_cb(NULL, cc);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
    5964 |         }
         |         ~
   drivers/net/wireless/ti/cc33xx/main.c:5952:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5967:9: note: uninitialized use occurs here
    5967 |         return ret;
         |                ^~~
   drivers/net/wireless/ti/cc33xx/main.c:5952:6: note: remove the '&&' if its condition is always true
    5952 |         if (pdev_data->family && pdev_data->family->nvs_name) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:5932:9: note: initialize the variable 'ret' to silence this warning
    5932 |         int ret;
         |                ^
         |                 = 0
   drivers/net/wireless/ti/cc33xx/main.c:187:36: warning: unused variable 'cc33xx_clk_table_coex' [-Wunused-const-variable]
     187 | static const struct cc33xx_clk_cfg cc33xx_clk_table_coex[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/main.c:199:36: warning: unused variable 'cc33xx_clk_table' [-Wunused-const-variable]
     199 | static const struct cc33xx_clk_cfg cc33xx_clk_table[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~
   9 warnings generated.
--
>> drivers/net/wireless/ti/cc33xx/cmd.c:114:28: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     113 |                              "Response len %d, allocated buffer len %d",
         |                                                                     ~~
         |                                                                     %zu
     114 |                              cc->result_length, res_len);
         |                                                 ^~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:47: note: expanded from macro 'cc33xx_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                                        ~~~         ^~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/cmd.c:146:54: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     146 |         cc33xx_debug(DEBUG_TESTMODE, "CMD# %d, len=%d", id, len);
         |                                                    ~~       ^~~
         |                                                    %zu
   drivers/net/wireless/ti/cc33xx/debug.h:60:47: note: expanded from macro 'cc33xx_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                                        ~~~         ^~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 warnings generated.
--
   drivers/net/wireless/ti/cc33xx/init.c:109:22: warning: variable 'conf_tid' set but not used [-Wunused-but-set-variable]
     109 |         struct conf_tx_tid *conf_tid;
         |                             ^
   drivers/net/wireless/ti/cc33xx/init.c:196:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     196 |         int ret = 0;
         |             ^
>> drivers/net/wireless/ti/cc33xx/init.c:216:8: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
     215 |                      "Downloading INI configurations to FW, payload Length: %d",
         |                                                                             ~~
         |                                                                             %lu
     216 |                      sizeof(cc->conf));
         |                      ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:47: note: expanded from macro 'cc33xx_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                                        ~~~         ^~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   3 warnings generated.
--
>> drivers/net/wireless/ti/cc33xx/sdio.c:110:10: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     109 |                 dev_dbg(child->parent, "cc33xx_sdio: WRITE to 0x%04x length 0x%x (first 64 Bytes):\n",
         |                                                                               ~~
         |                                                                               %zx
     110 |                         addr, len);
         |                               ^~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 warning generated.


vim +858 drivers/net/wireless/ti/cc33xx/main.c

53500b0b54c6a1 Michael Nemanov 2024-05-12  802  
53500b0b54c6a1 Michael Nemanov 2024-05-12  803  static int parse_control_message(struct cc33xx *cc,
53500b0b54c6a1 Michael Nemanov 2024-05-12  804  				 const u8 *buffer, size_t buffer_length)
53500b0b54c6a1 Michael Nemanov 2024-05-12  805  {
53500b0b54c6a1 Michael Nemanov 2024-05-12  806  	u8 *const end_of_payload = (u8 *const)buffer + buffer_length;
53500b0b54c6a1 Michael Nemanov 2024-05-12  807  	u8 *const start_of_payload = (u8 *const)buffer;
53500b0b54c6a1 Michael Nemanov 2024-05-12  808  	struct control_info_descriptor *control_info_descriptor;
53500b0b54c6a1 Michael Nemanov 2024-05-12  809  	const u8 *event_data, *cmd_result_data;
53500b0b54c6a1 Michael Nemanov 2024-05-12  810  	int ctrl_info_type, ctrl_info_length;
53500b0b54c6a1 Michael Nemanov 2024-05-12  811  
53500b0b54c6a1 Michael Nemanov 2024-05-12  812  	while (buffer < end_of_payload) {
53500b0b54c6a1 Michael Nemanov 2024-05-12  813  		control_info_descriptor =
53500b0b54c6a1 Michael Nemanov 2024-05-12  814  				(struct control_info_descriptor *)buffer;
53500b0b54c6a1 Michael Nemanov 2024-05-12  815  
53500b0b54c6a1 Michael Nemanov 2024-05-12  816  		ctrl_info_type = get_type(control_info_descriptor);
53500b0b54c6a1 Michael Nemanov 2024-05-12  817  		ctrl_info_length = get_length(control_info_descriptor);
53500b0b54c6a1 Michael Nemanov 2024-05-12  818  
53500b0b54c6a1 Michael Nemanov 2024-05-12  819  		cc33xx_debug(DEBUG_CMD, "Processing message type %d, len %d",
53500b0b54c6a1 Michael Nemanov 2024-05-12  820  			     ctrl_info_type, ctrl_info_length);
53500b0b54c6a1 Michael Nemanov 2024-05-12  821  
53500b0b54c6a1 Michael Nemanov 2024-05-12  822  		switch (ctrl_info_type) {
53500b0b54c6a1 Michael Nemanov 2024-05-12  823  		case CTRL_MSG_EVENT:
53500b0b54c6a1 Michael Nemanov 2024-05-12  824  			event_data = buffer + sizeof(*control_info_descriptor);
53500b0b54c6a1 Michael Nemanov 2024-05-12  825  
53500b0b54c6a1 Michael Nemanov 2024-05-12  826  			deffer_event(cc, event_data, ctrl_info_length);
53500b0b54c6a1 Michael Nemanov 2024-05-12  827  			break;
53500b0b54c6a1 Michael Nemanov 2024-05-12  828  
53500b0b54c6a1 Michael Nemanov 2024-05-12  829  		case CTRL_MSG_COMMND_COMPLETE:
53500b0b54c6a1 Michael Nemanov 2024-05-12  830  			cmd_result_data = buffer;
53500b0b54c6a1 Michael Nemanov 2024-05-12  831  			cmd_result_data += sizeof(*control_info_descriptor);
53500b0b54c6a1 Michael Nemanov 2024-05-12  832  
53500b0b54c6a1 Michael Nemanov 2024-05-12  833  			if (ctrl_info_length > sizeof(cc->command_result)) {
53500b0b54c6a1 Michael Nemanov 2024-05-12  834  				print_hex_dump(KERN_DEBUG, "message dump:",
53500b0b54c6a1 Michael Nemanov 2024-05-12  835  					       DUMP_PREFIX_OFFSET, 16, 1,
53500b0b54c6a1 Michael Nemanov 2024-05-12  836  					       cmd_result_data,
53500b0b54c6a1 Michael Nemanov 2024-05-12  837  					       ctrl_info_length, false);
53500b0b54c6a1 Michael Nemanov 2024-05-12  838  
53500b0b54c6a1 Michael Nemanov 2024-05-12  839  				WARN(1, "Error device response exceeds result buffer size");
53500b0b54c6a1 Michael Nemanov 2024-05-12  840  
53500b0b54c6a1 Michael Nemanov 2024-05-12  841  				goto message_parse_error;
53500b0b54c6a1 Michael Nemanov 2024-05-12  842  			}
53500b0b54c6a1 Michael Nemanov 2024-05-12  843  
53500b0b54c6a1 Michael Nemanov 2024-05-12  844  			memcpy(cc->command_result,
53500b0b54c6a1 Michael Nemanov 2024-05-12  845  			       cmd_result_data, ctrl_info_length);
53500b0b54c6a1 Michael Nemanov 2024-05-12  846  
53500b0b54c6a1 Michael Nemanov 2024-05-12  847  			cc->result_length = ctrl_info_length;
53500b0b54c6a1 Michael Nemanov 2024-05-12  848  
53500b0b54c6a1 Michael Nemanov 2024-05-12  849  			complete(&cc->command_complete);
53500b0b54c6a1 Michael Nemanov 2024-05-12  850  			break;
53500b0b54c6a1 Michael Nemanov 2024-05-12  851  
53500b0b54c6a1 Michael Nemanov 2024-05-12  852  		default:
53500b0b54c6a1 Michael Nemanov 2024-05-12  853  			print_hex_dump(KERN_DEBUG, "message dump:",
53500b0b54c6a1 Michael Nemanov 2024-05-12  854  				       DUMP_PREFIX_OFFSET, 16, 1,
53500b0b54c6a1 Michael Nemanov 2024-05-12  855  				start_of_payload, buffer_length, false);
53500b0b54c6a1 Michael Nemanov 2024-05-12  856  
53500b0b54c6a1 Michael Nemanov 2024-05-12  857  			WARN(1, "Error processing device message @ offset %x",
53500b0b54c6a1 Michael Nemanov 2024-05-12 @858  			     (size_t)(buffer - start_of_payload));
53500b0b54c6a1 Michael Nemanov 2024-05-12  859  
53500b0b54c6a1 Michael Nemanov 2024-05-12  860  			goto message_parse_error;
53500b0b54c6a1 Michael Nemanov 2024-05-12  861  		}
53500b0b54c6a1 Michael Nemanov 2024-05-12  862  
53500b0b54c6a1 Michael Nemanov 2024-05-12  863  		buffer += sizeof(*control_info_descriptor);
53500b0b54c6a1 Michael Nemanov 2024-05-12  864  		buffer += ctrl_info_length;
53500b0b54c6a1 Michael Nemanov 2024-05-12  865  	}
53500b0b54c6a1 Michael Nemanov 2024-05-12  866  
53500b0b54c6a1 Michael Nemanov 2024-05-12  867  	return 0;
53500b0b54c6a1 Michael Nemanov 2024-05-12  868  
53500b0b54c6a1 Michael Nemanov 2024-05-12  869  message_parse_error:
53500b0b54c6a1 Michael Nemanov 2024-05-12  870  	return -EIO;
53500b0b54c6a1 Michael Nemanov 2024-05-12  871  }
53500b0b54c6a1 Michael Nemanov 2024-05-12  872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
