Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F22F26
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643761042; x=1675297042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x69L74wpKng7UPK7o8mXeH4JmdePgfeMK1+Epz8rQPA=;
  b=d/o8RCfOFaQMI2rDpyV0Khr1m6EvG+Vg374LvBAAvy1uXlvobYmuAI7B
   6lHpepqY+l9GgBs8fNYCIR/hKQxVgvK1kkKAkm0X88+4+5PdlODuSjVtN
   fE7nlOCNGwJVXhWmzzRXZTZXYUo7YsgG8dSrIvxc0j0I/zX/kqN6FFf6K
   W3//7gqaEIC6VhBGTRMSy6v3XYfqW+EMgDCut0LZPbX1sseeutOstxKyU
   Wpt5Sjk0v5Ulp+xTH7PjUewaYbHc/r/qDLRTfnC73Onds0OgPtsWcYgoM
   LllbBUwfhZsyDQZhVLvfUwRXGBygUebGQjHbXxrs+HWQMJRTo590ePUm6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248044973"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="248044973"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 16:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="630695562"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2022 16:17:19 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF3Ko-000Trg-RA; Wed, 02 Feb 2022 00:17:18 +0000
Date: Wed, 2 Feb 2022 08:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 3/4] printk: Avoid livelock with heavy printk during
 panic
Message-ID: <202202020859.21684oMh-lkp@intel.com>
References: <20220201185802.98345-4-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201185802.98345-4-stephen.s.brennan@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stephen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc2 next-20220201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephen-Brennan/printk-reduce-deadlocks-during-panic/20220202-030025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 26291c54e111ff6ba87a164d85d4a4e134b7315c
config: hexagon-buildonly-randconfig-r006-20220130 (https://download.01.org/0day-ci/archive/20220202/202202020859.21684oMh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f8bc56f0cf3ba4bdd9948d9743b42927f8415345
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephen-Brennan/printk-reduce-deadlocks-during-panic/20220202-030025
        git checkout f8bc56f0cf3ba4bdd9948d9743b42927f8415345
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/printk/printk.c:2686:8: error: implicit declaration of function 'panic_in_progress' [-Werror,-Wimplicit-function-declaration]
                           if (panic_in_progress() && panic_console_dropped++ > 10) {
                               ^
   1 error generated.


vim +/panic_in_progress +2686 kernel/printk/printk.c

  2612	
  2613	/**
  2614	 * console_unlock - unlock the console system
  2615	 *
  2616	 * Releases the console_lock which the caller holds on the console system
  2617	 * and the console driver list.
  2618	 *
  2619	 * While the console_lock was held, console output may have been buffered
  2620	 * by printk().  If this is the case, console_unlock(); emits
  2621	 * the output prior to releasing the lock.
  2622	 *
  2623	 * If there is output waiting, we wake /dev/kmsg and syslog() users.
  2624	 *
  2625	 * console_unlock(); may be called from any context.
  2626	 */
  2627	void console_unlock(void)
  2628	{
  2629		static char ext_text[CONSOLE_EXT_LOG_MAX];
  2630		static char text[CONSOLE_LOG_MAX];
  2631		static int panic_console_dropped;
  2632		unsigned long flags;
  2633		bool do_cond_resched, retry;
  2634		struct printk_info info;
  2635		struct printk_record r;
  2636		u64 __maybe_unused next_seq;
  2637	
  2638		if (console_suspended) {
  2639			up_console_sem();
  2640			return;
  2641		}
  2642	
  2643		prb_rec_init_rd(&r, &info, text, sizeof(text));
  2644	
  2645		/*
  2646		 * Console drivers are called with interrupts disabled, so
  2647		 * @console_may_schedule should be cleared before; however, we may
  2648		 * end up dumping a lot of lines, for example, if called from
  2649		 * console registration path, and should invoke cond_resched()
  2650		 * between lines if allowable.  Not doing so can cause a very long
  2651		 * scheduling stall on a slow console leading to RCU stall and
  2652		 * softlockup warnings which exacerbate the issue with more
  2653		 * messages practically incapacitating the system.
  2654		 *
  2655		 * console_trylock() is not able to detect the preemptive
  2656		 * context reliably. Therefore the value must be stored before
  2657		 * and cleared after the "again" goto label.
  2658		 */
  2659		do_cond_resched = console_may_schedule;
  2660	again:
  2661		console_may_schedule = 0;
  2662	
  2663		/*
  2664		 * We released the console_sem lock, so we need to recheck if
  2665		 * cpu is online and (if not) is there at least one CON_ANYTIME
  2666		 * console.
  2667		 */
  2668		if (!can_use_console()) {
  2669			console_locked = 0;
  2670			up_console_sem();
  2671			return;
  2672		}
  2673	
  2674		for (;;) {
  2675			size_t ext_len = 0;
  2676			int handover;
  2677			size_t len;
  2678	
  2679	skip:
  2680			if (!prb_read_valid(prb, console_seq, &r))
  2681				break;
  2682	
  2683			if (console_seq != r.info->seq) {
  2684				console_dropped += r.info->seq - console_seq;
  2685				console_seq = r.info->seq;
> 2686				if (panic_in_progress() && panic_console_dropped++ > 10) {
  2687					suppress_panic_printk = 1;
  2688					pr_warn_once("Too many dropped messages. Supress messages on non-panic CPUs to prevent livelock.\n");
  2689				}
  2690			}
  2691	
  2692			if (suppress_message_printing(r.info->level)) {
  2693				/*
  2694				 * Skip record we have buffered and already printed
  2695				 * directly to the console when we received it, and
  2696				 * record that has level above the console loglevel.
  2697				 */
  2698				console_seq++;
  2699				goto skip;
  2700			}
  2701	
  2702			/* Output to all consoles once old messages replayed. */
  2703			if (unlikely(exclusive_console &&
  2704				     console_seq >= exclusive_console_stop_seq)) {
  2705				exclusive_console = NULL;
  2706			}
  2707	
  2708			/*
  2709			 * Handle extended console text first because later
  2710			 * record_print_text() will modify the record buffer in-place.
  2711			 */
  2712			if (nr_ext_console_drivers) {
  2713				ext_len = info_print_ext_header(ext_text,
  2714							sizeof(ext_text),
  2715							r.info);
  2716				ext_len += msg_print_ext_body(ext_text + ext_len,
  2717							sizeof(ext_text) - ext_len,
  2718							&r.text_buf[0],
  2719							r.info->text_len,
  2720							&r.info->dev_info);
  2721			}
  2722			len = record_print_text(&r,
  2723					console_msg_format & MSG_FORMAT_SYSLOG,
  2724					printk_time);
  2725			console_seq++;
  2726	
  2727			/*
  2728			 * While actively printing out messages, if another printk()
  2729			 * were to occur on another CPU, it may wait for this one to
  2730			 * finish. This task can not be preempted if there is a
  2731			 * waiter waiting to take over.
  2732			 *
  2733			 * Interrupts are disabled because the hand over to a waiter
  2734			 * must not be interrupted until the hand over is completed
  2735			 * (@console_waiter is cleared).
  2736			 */
  2737			printk_safe_enter_irqsave(flags);
  2738			console_lock_spinning_enable();
  2739	
  2740			stop_critical_timings();	/* don't trace print latency */
  2741			call_console_drivers(ext_text, ext_len, text, len);
  2742			start_critical_timings();
  2743	
  2744			handover = console_lock_spinning_disable_and_check();
  2745			printk_safe_exit_irqrestore(flags);
  2746			if (handover)
  2747				return;
  2748	
  2749			if (do_cond_resched)
  2750				cond_resched();
  2751		}
  2752	
  2753		/* Get consistent value of the next-to-be-used sequence number. */
  2754		next_seq = console_seq;
  2755	
  2756		console_locked = 0;
  2757		up_console_sem();
  2758	
  2759		/*
  2760		 * Someone could have filled up the buffer again, so re-check if there's
  2761		 * something to flush. In case we cannot trylock the console_sem again,
  2762		 * there's a new owner and the console_unlock() from them will do the
  2763		 * flush, no worries.
  2764		 */
  2765		retry = prb_read_valid(prb, next_seq, NULL);
  2766		if (retry && console_trylock())
  2767			goto again;
  2768	}
  2769	EXPORT_SYMBOL(console_unlock);
  2770	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
