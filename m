Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB691E4A6;
	Fri,  7 Jun 2024 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764316; cv=none; b=UDRo82MEoQJAttWECPnOfc0LIKannO/MR+QMHEs8O0RYxVO3EnTpsvFNiT5BCGzwycXf7zCi/x9zQ4Gk4kVlJhOEVpvxdnGCqBJaBU4gcGxhpCoNt6TNdhtCrovjyMrh7bOFmo/13LADXXqf3sEOEvGCNV2GsI3anAIweiKaUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764316; c=relaxed/simple;
	bh=2m8wiZgocVqrLlJ36YJsRc0pxN+0/UFhhpWT0HefT4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drLqmvJ9RSVQhj0TzrORusU7uiIPBV9tdhrCB8CwCDqpvglh6yCZc63QzXjn0PE4mS0YmLjdCy0I7VhUR2KsMzhMMOAVMJSPTJTjBCG1AMRlEtjf7bUonXbMfpJVImzyuH/uGyE+fsD1rp1Rjfq9tBO1dAiVUyvuS23C28SD1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+z5oNWP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+z5oNWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764314; x=1749300314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2m8wiZgocVqrLlJ36YJsRc0pxN+0/UFhhpWT0HefT4U=;
  b=f+z5oNWPBdjs2r89/LwJBz1Qw57TY+PzY6UvlW0dUhAU+BAf5JlmIDMK
   9qVTorNGm77lydXiqwFlwl2HRO9hPDA9UQVpPgPwFB0HRHv/mFm2MbQgE
   ajUHlTDiIuwgDqfjeHZtTYZEALXBZRBhya8CQV+HEaSvznmmlSMa38mC+
   22hxK6gQnFWb9AGNRzCmDKzJWyisls4Jn5kXu86swS3yiFmx4GXFSfg0T
   aVb1QK9fIHJhHmZTkRNoe4nUL7xCOWmc8FD6g8/zHSoJeZBEOUuRTrDwj
   bG24jOWQF942H/qQVyamCKzwJiEUOdnJOe3VjJT1H7xu7eNDYFus7Zo99
   w==;
X-CSE-ConnectionGUID: HqRf0zGNSt+PJSgfqJlFeQ==
X-CSE-MsgGUID: uaf5B660TYmaEEvUOTuXtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25109936"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25109936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:12 -0700
X-CSE-ConnectionGUID: fJ3k+DuxSPeVI/I35/rJrA==
X-CSE-MsgGUID: NZlfPJDwSb2OohGAJTp7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38234203"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jun 2024 05:45:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFYxw-0004n6-0z;
	Fri, 07 Jun 2024 12:45:08 +0000
Date: Fri, 7 Jun 2024 20:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [rostedt-trace:trace/persistent-ring-buf-reserve-mem-v5.15 3/30]
 kernel/trace/trace_events_trigger.c:728:6: warning: no previous prototype
 for function 'event_trigger_check_remove'
Message-ID: <202406072011.qIGK19NC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/persistent-ring-buf-reserve-mem-v5.15
head:   06c8dd8d86240bdfbab979b2a24e357380c2d742
commit: 2bb09cf6b93ab46a61eef92eef4d6b68e4bbabe1 [3/30] tracing: Add snapshot refcount
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240607/202406072011.qIGK19NC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072011.qIGK19NC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072011.qIGK19NC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace_events_trigger.c:8:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace_events_trigger.c:15:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/trace/trace_events_trigger.c:15:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/trace/trace_events_trigger.c:15:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/trace/trace_events_trigger.c:728:6: warning: no previous prototype for function 'event_trigger_check_remove' [-Wmissing-prototypes]
     728 | bool event_trigger_check_remove(const char *glob)
         |      ^
   kernel/trace/trace_events_trigger.c:728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     728 | bool event_trigger_check_remove(const char *glob)
         | ^
         | static 
   18 warnings generated.


vim +/event_trigger_check_remove +728 kernel/trace/trace_events_trigger.c

   640	
   641	/*
   642	 * Event trigger parsing helper functions.
   643	 *
   644	 * These functions help make it easier to write an event trigger
   645	 * parsing function i.e. the struct event_command.parse() callback
   646	 * function responsible for parsing and registering a trigger command
   647	 * written to the 'trigger' file.
   648	 *
   649	 * A trigger command (or just 'trigger' for short) takes the form:
   650	 *   [trigger] [if filter]
   651	 *
   652	 * The struct event_command.parse() callback (and other struct
   653	 * event_command functions) refer to several components of a trigger
   654	 * command.  Those same components are referenced by the event trigger
   655	 * parsing helper functions defined below.  These components are:
   656	 *
   657	 *   cmd               - the trigger command name
   658	 *   glob              - the trigger command name optionally prefaced with '!'
   659	 *   param_and_filter  - text following cmd and ':'
   660	 *   param             - text following cmd and ':' and stripped of filter
   661	 *   filter            - the optional filter text following (and including) 'if'
   662	 *
   663	 * To illustrate the use of these componenents, here are some concrete
   664	 * examples. For the following triggers:
   665	 *
   666	 *   echo 'traceon:5 if pid == 0' > trigger
   667	 *     - 'traceon' is both cmd and glob
   668	 *     - '5 if pid == 0' is the param_and_filter
   669	 *     - '5' is the param
   670	 *     - 'if pid == 0' is the filter
   671	 *
   672	 *   echo 'enable_event:sys:event:n' > trigger
   673	 *     - 'enable_event' is both cmd and glob
   674	 *     - 'sys:event:n' is the param_and_filter
   675	 *     - 'sys:event:n' is the param
   676	 *     - there is no filter
   677	 *
   678	 *   echo 'hist:keys=pid if prio > 50' > trigger
   679	 *     - 'hist' is both cmd and glob
   680	 *     - 'keys=pid if prio > 50' is the param_and_filter
   681	 *     - 'keys=pid' is the param
   682	 *     - 'if prio > 50' is the filter
   683	 *
   684	 *   echo '!enable_event:sys:event:n' > trigger
   685	 *     - 'enable_event' the cmd
   686	 *     - '!enable_event' is the glob
   687	 *     - 'sys:event:n' is the param_and_filter
   688	 *     - 'sys:event:n' is the param
   689	 *     - there is no filter
   690	 *
   691	 *   echo 'traceoff' > trigger
   692	 *     - 'traceoff' is both cmd and glob
   693	 *     - there is no param_and_filter
   694	 *     - there is no param
   695	 *     - there is no filter
   696	 *
   697	 * There are a few different categories of event trigger covered by
   698	 * these helpers:
   699	 *
   700	 *  - triggers that don't require a parameter e.g. traceon
   701	 *  - triggers that do require a parameter e.g. enable_event and hist
   702	 *  - triggers that though they may not require a param may support an
   703	 *    optional 'n' param (n = number of times the trigger should fire)
   704	 *    e.g.: traceon:5 or enable_event:sys:event:n
   705	 *  - triggers that do not support an 'n' param e.g. hist
   706	 *
   707	 * These functions can be used or ignored as necessary - it all
   708	 * depends on the complexity of the trigger, and the granularity of
   709	 * the functions supported reflects the fact that some implementations
   710	 * may need to customize certain aspects of their implementations and
   711	 * won't need certain functions.  For instance, the hist trigger
   712	 * implementation doesn't use event_trigger_separate_filter() because
   713	 * it has special requirements for handling the filter.
   714	 */
   715	
   716	/**
   717	 * event_trigger_check_remove - check whether an event trigger specifies remove
   718	 * @glob: The trigger command string, with optional remove(!) operator
   719	 *
   720	 * The event trigger callback implementations pass in 'glob' as a
   721	 * parameter.  This is the command name either with or without a
   722	 * remove(!)  operator.  This function simply parses the glob and
   723	 * determines whether the command corresponds to a trigger removal or
   724	 * a trigger addition.
   725	 *
   726	 * Return: true if this is a remove command, false otherwise
   727	 */
 > 728	bool event_trigger_check_remove(const char *glob)
   729	{
   730		return (glob && glob[0] == '!') ? true : false;
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
