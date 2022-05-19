Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAC23AC
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 04:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652935750; x=1684471750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPsxXhJSxt6pMmsvGL5f7uVJgkE+z1dAhVvSCC45p1Q=;
  b=FErFt7z0Uo+TUBDFBq0joVAIw62/PZ7B8gXdm8HYEeGFoiMLkplLpHVS
   4ozMZucmgrx3AWgZb3DP5EdPgscaYLUQbla0YQy9zhbmahw2/fXxEprTT
   InSAJbnhwnnOolxlcp397rIwYO+l8cEBWG/sqJsjx9SieE+k/7qG50xWm
   JHAYfvSLd2583itJvwj3m4EXG7rdDaAA4ryW6DNWEOJ0KbFNX940RpgvF
   lVhU8SXKJ8TsJlZ1SH1dqso3PhcKNugGC84EOHjaP/kEPKErXB0u7sDJr
   lrT4gw0Fntb3EAFVzwSf5uYaOCPKYfhNPONFCoub5uLbW//cBkT5ObXAq
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358421536"
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="358421536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 21:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="661507598"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2022 21:49:08 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrY5z-000352-Lm;
	Thu, 19 May 2022 04:49:07 +0000
Date: Thu, 19 May 2022 12:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Down <chris@chrisdown.name>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] printk: console: Allow each console to have its own
 loglevel
Message-ID: <202205191232.w7IUp9LS-lkp@intel.com>
References: <YoUBh5BSsURDO71Z@chrisdown.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoUBh5BSsURDO71Z@chrisdown.name>

Hi Chris,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on 3ef4ea3d84ca568dcd57816b9521e82e3bd94f08]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Down/printk-console-Allow-each-console-to-have-its-own-loglevel/20220518-222756
base:   3ef4ea3d84ca568dcd57816b9521e82e3bd94f08
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/archive/20220519/202205191232.w7IUp9LS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6f922c8d53bf824736b3e481e7b80e8b31d84678
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chris-Down/printk-console-Allow-each-console-to-have-its-own-loglevel/20220518-222756
        git checkout 6f922c8d53bf824736b3e481e7b80e8b31d84678
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:35:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/printk/printk.c:35:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/printk/printk.c:35:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/printk/printk.c:2878:50: error: too many arguments to function call, expected single argument 'level', have 2 arguments
                           if (!suppress_message_printing(r.info->level, con)) {
                                ~~~~~~~~~~~~~~~~~~~~~~~~~                ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   kernel/printk/printk.c:2457:13: note: 'suppress_message_printing' declared here
   static bool suppress_message_printing(int level) { return false; }
               ^
>> kernel/printk/printk.c:2878:50: error: too many arguments to function call, expected single argument 'level', have 2 arguments
                           if (!suppress_message_printing(r.info->level, con)) {
                                ~~~~~~~~~~~~~~~~~~~~~~~~~                ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   kernel/printk/printk.c:2457:13: note: 'suppress_message_printing' declared here
   static bool suppress_message_printing(int level) { return false; }
               ^
>> kernel/printk/printk.c:2878:50: error: too many arguments to function call, expected single argument 'level', have 2 arguments
                           if (!suppress_message_printing(r.info->level, con)) {
                                ~~~~~~~~~~~~~~~~~~~~~~~~~                ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   kernel/printk/printk.c:2457:13: note: 'suppress_message_printing' declared here
   static bool suppress_message_printing(int level) { return false; }
               ^
>> kernel/printk/printk.c:3119:23: error: variable has incomplete type 'enum loglevel_source'
           enum loglevel_source source;
                                ^
   kernel/printk/printk.c:3119:7: note: forward declaration of 'enum loglevel_source'
           enum loglevel_source source;
                ^
   kernel/printk/printk.c:3121:2: error: implicit declaration of function 'console_effective_loglevel' [-Werror,-Wimplicit-function-declaration]
           console_effective_loglevel(con, &source);
           ^
>> kernel/printk/printk.c:3122:30: error: use of undeclared identifier 'loglevel_source_names'
           return sprintf(buf, "%s\n", loglevel_source_names[source]);
                                       ^
   kernel/printk/printk.c:3132:23: error: variable has incomplete type 'enum loglevel_source'
           enum loglevel_source source;
                                ^
   kernel/printk/printk.c:3132:7: note: forward declaration of 'enum loglevel_source'
           enum loglevel_source source;
                ^
   kernel/printk/printk.c:3134:30: error: implicit declaration of function 'console_effective_loglevel' [-Werror,-Wimplicit-function-declaration]
           return sprintf(buf, "%d\n", console_effective_loglevel(con, &source));
                                       ^
   12 warnings and 8 errors generated.


vim +/level +2878 kernel/printk/printk.c

  2790	
  2791	/**
  2792	 * console_unlock - unlock the console system
  2793	 *
  2794	 * Releases the console_lock which the caller holds on the console system
  2795	 * and the console driver list.
  2796	 *
  2797	 * While the console_lock was held, console output may have been buffered
  2798	 * by printk().  If this is the case, console_unlock(); emits
  2799	 * the output prior to releasing the lock.
  2800	 *
  2801	 * If there is output waiting, we wake /dev/kmsg and syslog() users.
  2802	 *
  2803	 * console_unlock(); may be called from any context.
  2804	 */
  2805	void console_unlock(void)
  2806	{
  2807		static char ext_text[CONSOLE_EXT_LOG_MAX];
  2808		static char text[CONSOLE_LOG_MAX];
  2809		static int panic_console_dropped;
  2810		unsigned long flags;
  2811		bool do_cond_resched, retry;
  2812		struct printk_info info;
  2813		struct printk_record r;
  2814		u64 __maybe_unused next_seq;
  2815	
  2816		if (console_suspended) {
  2817			up_console_sem();
  2818			return;
  2819		}
  2820	
  2821		prb_rec_init_rd(&r, &info, text, sizeof(text));
  2822	
  2823		/*
  2824		 * Console drivers are called with interrupts disabled, so
  2825		 * @console_may_schedule should be cleared before; however, we may
  2826		 * end up dumping a lot of lines, for example, if called from
  2827		 * console registration path, and should invoke cond_resched()
  2828		 * between lines if allowable.  Not doing so can cause a very long
  2829		 * scheduling stall on a slow console leading to RCU stall and
  2830		 * softlockup warnings which exacerbate the issue with more
  2831		 * messages practically incapacitating the system.
  2832		 *
  2833		 * console_trylock() is not able to detect the preemptive
  2834		 * context reliably. Therefore the value must be stored before
  2835		 * and cleared after the "again" goto label.
  2836		 */
  2837		do_cond_resched = console_may_schedule;
  2838	again:
  2839		console_may_schedule = 0;
  2840	
  2841		/*
  2842		 * We released the console_sem lock, so we need to recheck if
  2843		 * cpu is online and (if not) is there at least one CON_ANYTIME
  2844		 * console.
  2845		 */
  2846		if (!can_use_console()) {
  2847			console_locked = 0;
  2848			up_console_sem();
  2849			return;
  2850		}
  2851	
  2852		for (;;) {
  2853			size_t ext_len = 0;
  2854			bool solicited = false;
  2855			int handover;
  2856			size_t len;
  2857			struct console *con;
  2858	
  2859	skip:
  2860			if (!prb_read_valid(prb, console_seq, &r))
  2861				break;
  2862	
  2863			if (console_seq != r.info->seq) {
  2864				console_dropped += r.info->seq - console_seq;
  2865				console_seq = r.info->seq;
  2866				if (panic_in_progress() && panic_console_dropped++ > 10) {
  2867					suppress_panic_printk = 1;
  2868					pr_warn_once("Too many dropped messages. Suppress messages on non-panic CPUs to prevent livelock.\n");
  2869				}
  2870			}
  2871	
  2872			/*
  2873			 * Already checked per-console in call_console_drivers(), but
  2874			 * we should avoid spending time formatting the text at all if
  2875			 * no console wants the message in the first place.
  2876			 */
  2877			for_each_console(con) {
> 2878				if (!suppress_message_printing(r.info->level, con)) {
  2879					solicited = true;
  2880					break;
  2881				}
  2882			}
  2883			if (!solicited) {
  2884				console_seq++;
  2885				goto skip;
  2886			}
  2887	
  2888			/* Output to all consoles once old messages replayed. */
  2889			if (unlikely(exclusive_console &&
  2890				     console_seq >= exclusive_console_stop_seq)) {
  2891				exclusive_console = NULL;
  2892			}
  2893	
  2894			/*
  2895			 * Handle extended console text first because later
  2896			 * record_print_text() will modify the record buffer in-place.
  2897			 */
  2898			if (nr_ext_console_drivers) {
  2899				ext_len = info_print_ext_header(ext_text,
  2900							sizeof(ext_text),
  2901							r.info);
  2902				ext_len += msg_print_ext_body(ext_text + ext_len,
  2903							sizeof(ext_text) - ext_len,
  2904							&r.text_buf[0],
  2905							r.info->text_len,
  2906							&r.info->dev_info);
  2907			}
  2908			len = record_print_text(&r,
  2909					console_msg_format & MSG_FORMAT_SYSLOG,
  2910					printk_time);
  2911			console_seq++;
  2912	
  2913			/*
  2914			 * While actively printing out messages, if another printk()
  2915			 * were to occur on another CPU, it may wait for this one to
  2916			 * finish. This task can not be preempted if there is a
  2917			 * waiter waiting to take over.
  2918			 *
  2919			 * Interrupts are disabled because the hand over to a waiter
  2920			 * must not be interrupted until the hand over is completed
  2921			 * (@console_waiter is cleared).
  2922			 */
  2923			printk_safe_enter_irqsave(flags);
  2924			console_lock_spinning_enable();
  2925	
  2926			stop_critical_timings();	/* don't trace print latency */
  2927			call_console_drivers(ext_text, ext_len, text, len,
  2928					     r.info->level);
  2929			start_critical_timings();
  2930	
  2931			handover = console_lock_spinning_disable_and_check();
  2932			printk_safe_exit_irqrestore(flags);
  2933			if (handover)
  2934				return;
  2935	
  2936			/* Allow panic_cpu to take over the consoles safely */
  2937			if (abandon_console_lock_in_panic())
  2938				break;
  2939	
  2940			if (do_cond_resched)
  2941				cond_resched();
  2942		}
  2943	
  2944		/* Get consistent value of the next-to-be-used sequence number. */
  2945		next_seq = console_seq;
  2946	
  2947		console_locked = 0;
  2948		up_console_sem();
  2949	
  2950		/*
  2951		 * Someone could have filled up the buffer again, so re-check if there's
  2952		 * something to flush. In case we cannot trylock the console_sem again,
  2953		 * there's a new owner and the console_unlock() from them will do the
  2954		 * flush, no worries.
  2955		 */
  2956		retry = prb_read_valid(prb, next_seq, NULL);
  2957		if (retry && !abandon_console_lock_in_panic() && console_trylock())
  2958			goto again;
  2959	}
  2960	EXPORT_SYMBOL(console_unlock);
  2961	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
