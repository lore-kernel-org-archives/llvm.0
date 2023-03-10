Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49E2582;
	Fri, 10 Mar 2023 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678443736; x=1709979736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hFC9pTwu5PZi7Br7ooyqOBFsKIiq4TZjUtPGFtZWhwI=;
  b=OZ0isQU8yUKDhG6QhYuWP50JDc+0XQSWmFq+qwO3mFcExngkEasQzHEV
   EmOECg++bEdabjRGJzF7NlKFs0nKAnuG6DawrmOx/ua5AXF0hBcq6Tk87
   GruQ7R1Pr4PiWPRq/73UMrkDEfjzLtU6g5xo+daLUysyrIEirYEypJxru
   FF6+YXyz1kC3ukbV1znnB+XNA0XSsb5zQ9QInyfNB4aiRMyflxLxf40rL
   Nj/ViBurhwlFIoj8lcwCUU+iKUI4GV5AyjJbXKcvzaUP7JAFW46LWGv8s
   EOTjcVMEMFYj0Ck8blpJQfshs9RzkyufKLW7n6rzcV3fz0qjdpmbL66QS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364352212"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="364352212"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851859585"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="851859585"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 02:22:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZt7-0003kZ-0W;
	Fri, 10 Mar 2023 10:22:13 +0000
Date: Fri, 10 Mar 2023 18:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 25/89]
 drivers/platform/x86/socperf/socperfdrv.c:203:13: warning: no previous
 prototype for function 'SOCPERF_Read_Data3'
Message-ID: <202303101836.eJUpUUhe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

FYI, the error/warning still remains.

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   2bbe949bea3cbc139c5dd26decd5023b84779d86
commit: e65547c5a9bb37e907edecece4da7cb12dadea96 [25/89] platform/x86: Use $(srctree) instead of $(src) to adapt to kbuild regression
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230310/202303101836.eJUpUUhe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/mchinth/linux/commit/e65547c5a9bb37e907edecece4da7cb12dadea96
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout e65547c5a9bb37e907edecece4da7cb12dadea96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101836.eJUpUUhe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/socperf/socperfdrv.c:203:13: warning: no previous prototype for function 'SOCPERF_Read_Data3' [-Wmissing-prototypes]
   extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
               ^
   drivers/platform/x86/socperf/socperfdrv.c:203:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
          ^
>> drivers/platform/x86/socperf/socperfdrv.c:885:1: warning: no previous prototype for function 'SOCPERF_Switch_Group3' [-Wmissing-prototypes]
   SOCPERF_Switch_Group3(VOID)
   ^
   drivers/platform/x86/socperf/socperfdrv.c:884:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   extern OS_STATUS
          ^
   drivers/platform/x86/socperf/include/lwpmudrv_defines.h:372:19: note: expanded from macro 'OS_STATUS'
   #define OS_STATUS int
                     ^
>> drivers/platform/x86/socperf/socperfdrv.c:1070:6: warning: no previous prototype for function 'lwpmudrv_Stop_Mem' [-Wmissing-prototypes]
   VOID lwpmudrv_Stop_Mem(VOID)
        ^
   drivers/platform/x86/socperf/socperfdrv.c:1070:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   VOID lwpmudrv_Stop_Mem(VOID)
   ^
   static 
>> drivers/platform/x86/socperf/socperfdrv.c:1155:15: warning: no previous prototype for function 'socperf_Service_IOCTL' [-Wmissing-prototypes]
   IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
                 ^
   drivers/platform/x86/socperf/socperfdrv.c:1155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
   ^
   static 
   drivers/platform/x86/socperf/inc/control.h:84:23: note: expanded from macro 'IOCTL_OP_TYPE'
   #define IOCTL_OP_TYPE S32
                         ^
   drivers/platform/x86/socperf/socperfdrv.c:1299:33: error: expected expression
           status = socperf_Service_IOCTL(IOCTL_USE_INODE filp, _IOC_NR(cmd),
                                          ^
   drivers/platform/x86/socperf/inc/control.h:85:25: note: expanded from macro 'IOCTL_USE_INODE'
   #define IOCTL_USE_INODE struct inode *inode,
                           ^
>> drivers/platform/x86/socperf/socperfdrv.c:1274:6: warning: no previous prototype for function 'socperf_Device_Control' [-Wmissing-prototypes]
   long socperf_Device_Control(IOCTL_USE_INODE struct file *filp,
        ^
   drivers/platform/x86/socperf/socperfdrv.c:1274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long socperf_Device_Control(IOCTL_USE_INODE struct file *filp,
   ^
   static 
   drivers/platform/x86/socperf/socperfdrv.c:1336:63: error: too few arguments to function call, expected 4, have 3
           status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
                    ~~~~~~~~~~~~~~~~~~~~~                               ^
   drivers/platform/x86/socperf/socperfdrv.c:1155:15: note: 'socperf_Service_IOCTL' declared here
   IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
                 ^
>> drivers/platform/x86/socperf/socperfdrv.c:1307:6: warning: no previous prototype for function 'socperf_Device_Control_Compat' [-Wmissing-prototypes]
   long socperf_Device_Control_Compat(struct file *filp, unsigned int cmd,
        ^
   drivers/platform/x86/socperf/socperfdrv.c:1307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long socperf_Device_Control_Compat(struct file *filp, unsigned int cmd,
   ^
   static 
>> drivers/platform/x86/socperf/socperfdrv.c:1358:5: warning: no previous prototype for function 'SOCPERF_Abnormal_Terminate' [-Wmissing-prototypes]
   int SOCPERF_Abnormal_Terminate(void)
       ^
   drivers/platform/x86/socperf/socperfdrv.c:1358:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int SOCPERF_Abnormal_Terminate(void)
   ^
   static 
   drivers/platform/x86/socperf/socperfdrv.c:1389:2: error: field designator 'ioctl' does not refer to any field in type 'struct file_operations'
           IOCTL_OP = socperf_Device_Control,
           ^
   drivers/platform/x86/socperf/inc/control.h:83:19: note: expanded from macro 'IOCTL_OP'
   #define IOCTL_OP .ioctl
                     ^
   7 warnings and 3 errors generated.
--
   drivers/platform/x86/socwatch/sw_output_buffer.c:301:7: warning: variable 'wrapped' set but not used [-Wunused-but-set-variable]
           bool wrapped = false;
                ^
   drivers/platform/x86/socwatch/sw_output_buffer.c:299:25: warning: variable 'write_index' set but not used [-Wunused-but-set-variable]
           size_t read_index = 0, write_index = 0, dst_index = 0;
                                  ^
>> drivers/platform/x86/socwatch/sw_output_buffer.c:398:6: warning: no previous prototype for function 'reset_output_buffers' [-Wmissing-prototypes]
   void reset_output_buffers(void)
        ^
   drivers/platform/x86/socwatch/sw_output_buffer.c:398:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void reset_output_buffers(void)
   ^
   static 
   3 warnings generated.
--
>> drivers/platform/x86/socwatch/sw_collector.c:86:1: warning: no previous prototype for function 'sw_copy_driver_interface_info_i' [-Wmissing-prototypes]
   sw_copy_driver_interface_info_i(const struct sw_driver_interface_info *info)
   ^
   drivers/platform/x86/socwatch/sw_collector.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sw_driver_interface_info *
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:116:5: warning: no previous prototype for function 'sw_init_driver_interface_info_i' [-Wmissing-prototypes]
   int sw_init_driver_interface_info_i(struct sw_driver_interface_info *info)
       ^
   drivers/platform/x86/socwatch/sw_collector.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sw_init_driver_interface_info_i(struct sw_driver_interface_info *info)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:138:5: warning: no previous prototype for function 'sw_init_ops_i' [-Wmissing-prototypes]
   int sw_init_ops_i(const struct sw_hw_ops **ops,
       ^
   drivers/platform/x86/socwatch/sw_collector.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sw_init_ops_i(const struct sw_hw_ops **ops,
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:157:8: warning: no previous prototype for function 'sw_get_payload_size_i' [-Wmissing-prototypes]
   size_t sw_get_payload_size_i(const struct sw_driver_interface_info *info)
          ^
   drivers/platform/x86/socwatch/sw_collector.c:157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t sw_get_payload_size_i(const struct sw_driver_interface_info *info)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:175:1: warning: no previous prototype for function 'sw_alloc_collector_msg_i' [-Wmissing-prototypes]
   sw_alloc_collector_msg_i(const struct sw_driver_interface_info *info,
   ^
   drivers/platform/x86/socwatch/sw_collector.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   sw_driver_msg_t *
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:211:26: warning: no previous prototype for function 'sw_alloc_ops_i' [-Wmissing-prototypes]
   const struct sw_hw_ops **sw_alloc_ops_i(pw_u16_t num_io_descriptors)
                            ^
   drivers/platform/x86/socwatch/sw_collector.c:211:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const struct sw_hw_ops **sw_alloc_ops_i(pw_u16_t num_io_descriptors)
         ^
         static 
>> drivers/platform/x86/socwatch/sw_collector.c:323:6: warning: no previous prototype for function 'sw_free_driver_interface_info_i' [-Wmissing-prototypes]
   void sw_free_driver_interface_info_i(struct sw_driver_interface_info *info)
        ^
   drivers/platform/x86/socwatch/sw_collector.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sw_free_driver_interface_info_i(struct sw_driver_interface_info *info)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:329:6: warning: no previous prototype for function 'sw_free_ops_i' [-Wmissing-prototypes]
   void sw_free_ops_i(const struct sw_hw_ops **ops)
        ^
   drivers/platform/x86/socwatch/sw_collector.c:329:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sw_free_ops_i(const struct sw_hw_ops **ops)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:335:5: warning: no previous prototype for function 'sw_reset_driver_interface_info_i' [-Wmissing-prototypes]
   int sw_reset_driver_interface_info_i(struct sw_driver_interface_info *info)
       ^
   drivers/platform/x86/socwatch/sw_collector.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sw_reset_driver_interface_info_i(struct sw_driver_interface_info *info)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:453:6: warning: no previous prototype for function 'sw_free_collector_msg_i' [-Wmissing-prototypes]
   void sw_free_collector_msg_i(sw_driver_msg_t *msg)
        ^
   drivers/platform/x86/socwatch/sw_collector.c:453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sw_free_collector_msg_i(sw_driver_msg_t *msg)
   ^
   static 
>> drivers/platform/x86/socwatch/sw_collector.c:459:6: warning: no previous prototype for function 'sw_handle_per_cpu_msg_i' [-Wmissing-prototypes]
   void sw_handle_per_cpu_msg_i(void *info, enum sw_wakeup_action action)
        ^
   drivers/platform/x86/socwatch/sw_collector.c:459:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sw_handle_per_cpu_msg_i(void *info, enum sw_wakeup_action action)
   ^
   static 
   11 warnings generated.
--
   drivers/platform/x86/socwatch/sw_telem.c:239:32: error: implicit declaration of function 'ioremap_nocache' [-Werror,-Wimplicit-function-declaration]
           s_punitInterfaceAddr = (u64 *)ioremap_nocache(
                                         ^
   drivers/platform/x86/socwatch/sw_telem.c:239:32: note: did you mean 'ioremap_cache'?
   arch/x86/include/asm/io.h:185:22: note: 'ioremap_cache' declared here
   extern void __iomem *ioremap_cache(resource_size_t offset, unsigned long size);
                        ^
   drivers/platform/x86/socwatch/sw_telem.c:239:25: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_punitInterfaceAddr = (u64 *)ioremap_nocache(
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:242:20: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_punitDataAddr = (u64 *)ioremap_nocache(
                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:245:50: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr = (u64 *)ioremap_nocache(
                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:280:27: error: implicit declaration of function 'ioremap_nocache' [-Werror,-Wimplicit-function-declaration]
           s_pmcIPCCmdAddr = (u64 *)ioremap_nocache(
                                    ^
   drivers/platform/x86/socwatch/sw_telem.c:280:20: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_pmcIPCCmdAddr = (u64 *)ioremap_nocache(
                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:283:20: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_pmcIPCStsAddr = (u64 *)ioremap_nocache(
                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:286:21: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_pmcIPCWBufAddr = (u64 *)ioremap_nocache(
                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:289:21: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_pmcIPCRBufAddr = (u64 *)ioremap_nocache(
                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c:292:48: warning: cast to 'u64 *' (aka 'unsigned long long *') from smaller integer type 'int' [-Wint-to-pointer-cast]
           s_telemEventInfo[TELEM_PMC].ssram_virt_addr = (u64 *)ioremap_nocache(
                                                         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_telem.c:671:5: warning: no previous prototype for function 'read_telem' [-Wmissing-prototypes]
   int read_telem(u64 *dst, enum telemetry_unit unit, bool should_retry)
       ^
   drivers/platform/x86/socwatch/sw_telem.c:671:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int read_telem(u64 *dst, enum telemetry_unit unit, bool should_retry)
   ^
   static 
   9 warnings and 2 errors generated.


vim +/SOCPERF_Read_Data3 +203 drivers/platform/x86/socperf/socperfdrv.c

f57492d07625dd Manisha Chinthapally 2019-05-01  189  
f57492d07625dd Manisha Chinthapally 2019-05-01  190  /* ------------------------------------------------------------------------- */
f57492d07625dd Manisha Chinthapally 2019-05-01  191  /*!
f57492d07625dd Manisha Chinthapally 2019-05-01  192   * @fn       VOID SOCPERF_Read_Data
f57492d07625dd Manisha Chinthapally 2019-05-01  193   *
f57492d07625dd Manisha Chinthapally 2019-05-01  194   * @brief    Reads counter data
f57492d07625dd Manisha Chinthapally 2019-05-01  195   *
f57492d07625dd Manisha Chinthapally 2019-05-01  196   * @param    param   data_buffer - buffer for reading counter data.
f57492d07625dd Manisha Chinthapally 2019-05-01  197   *
f57492d07625dd Manisha Chinthapally 2019-05-01  198   * @return  None
f57492d07625dd Manisha Chinthapally 2019-05-01  199   *
f57492d07625dd Manisha Chinthapally 2019-05-01  200   * <I>Special Notes:</I>
f57492d07625dd Manisha Chinthapally 2019-05-01  201   *              <NONE>
f57492d07625dd Manisha Chinthapally 2019-05-01  202   */
f57492d07625dd Manisha Chinthapally 2019-05-01 @203  extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
f57492d07625dd Manisha Chinthapally 2019-05-01  204  {
f57492d07625dd Manisha Chinthapally 2019-05-01  205  	if (dispatch_uncore && dispatch_uncore->read_current_data) {
f57492d07625dd Manisha Chinthapally 2019-05-01  206  		dispatch_uncore->read_current_data(data_buffer);
f57492d07625dd Manisha Chinthapally 2019-05-01  207  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  208  	SOCPERF_PRINT_DEBUG("%s called\n", __func__);
f57492d07625dd Manisha Chinthapally 2019-05-01  209  }
f57492d07625dd Manisha Chinthapally 2019-05-01  210  EXPORT_SYMBOL(SOCPERF_Read_Data3);
f57492d07625dd Manisha Chinthapally 2019-05-01  211  

:::::: The code at line 203 was first introduced by commit
:::::: f57492d07625dddac7920eccdb5be08c55ee16fa platform/x86: SOCPERF3 support for sep & socwatch

:::::: TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
