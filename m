Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B92F25
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644222620; x=1675758620;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PYZeMdMdSu4GT2M/44mRqj6XsHPRUZKGpjMG7esqwKY=;
  b=HvU6YnvgxS0p0eA4/aIXmQXJK50opQc6VdG1q88WGsQQb/H6hFDA01p3
   HVAIW+/AjxEJBnP4FHP7FWEh3yUp4SN48Kl07+vykOniNnWlpDLu5rAlj
   m+fFM2Rb2niAVYBAZ6gpwaDnu9sC9Li7A0pvgDkxSYr8SUpXP5A5+W41v
   zKzg0K2mETMx+3WVvEHHDF8YF5GYVW+BMTUI/bNIjp+082EOUlpza+syb
   vyAuRp79H0LHjSNCUxqDZx9Gs7N1NzgJXbOpqgZsWlL+351KLvK5wQh58
   GvOMASEodQz1QGQMu9dtILU6EyWZ+3Dx+8Yt38UaVQ1vKZ7uKfPhVmMxN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="232236325"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="232236325"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 00:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="484340658"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 00:30:11 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGzPX-0000Hc-A1; Mon, 07 Feb 2022 08:30:11 +0000
Date: Mon, 7 Feb 2022 16:29:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 637/4147] ld.lld: error:
 rust/built-in.a(compiler_builtins.o) is incompatible with aarch64elfb
Message-ID: <202202071609.olqHkRrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Finn Behrens <me@kloenk.de>
CC: "Adam Bratschi-Kaye" <ark.email@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Sven Van Asbroeck <thesven73@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: "Boris-Chengbiao Zhou" <bobo1239@web.de>
CC: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef6b35306dd8f15a7e5e5a2532e665917a43c5d9
commit: 5d287d7e9c9bd455f8eb9abf80f320927433e168 [637/4147] Kbuild: add Rust support
config: arm64-randconfig-r031-20220207 (https://download.01.org/0day-ci/archive/20220207/202202071609.olqHkRrY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5d287d7e9c9bd455f8eb9abf80f320927433e168
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5d287d7e9c9bd455f8eb9abf80f320927433e168
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> ld.lld: error: rust/built-in.a(core.o) is incompatible with aarch64elfb
>> ld.lld: error: rust/built-in.a(compiler_builtins.o) is incompatible with aarch64elfb
>> ld.lld: error: rust/built-in.a(alloc.o) is incompatible with aarch64elfb
>> ld.lld: error: rust/built-in.a(kernel.o) is incompatible with aarch64elfb
>> ld.lld: error: rust/built-in.a(build_error.o) is incompatible with aarch64elfb
--
   rust/helpers.c:22:17: warning: no previous prototype for function 'rust_helper_BUG' [-Wmissing-prototypes], err: false
   rust/helpers.c:27:6: warning: no previous prototype for function 'rust_helper_clk_disable_unprepare' [-Wmissing-prototypes], err: false
   rust/helpers.c:33:5: warning: no previous prototype for function 'rust_helper_clk_prepare_enable' [-Wmissing-prototypes], err: false
   rust/helpers.c:39:15: warning: no previous prototype for function 'rust_helper_copy_from_user' [-Wmissing-prototypes], err: false
   rust/helpers.c:44:15: warning: no previous prototype for function 'rust_helper_copy_to_user' [-Wmissing-prototypes], err: false
   rust/helpers.c:49:15: warning: no previous prototype for function 'rust_helper_clear_user' [-Wmissing-prototypes], err: false
   rust/helpers.c:54:15: warning: no previous prototype for function 'rust_helper_ioremap' [-Wmissing-prototypes], err: false
   rust/helpers.c:60:4: warning: no previous prototype for function 'rust_helper_readb' [-Wmissing-prototypes], err: false
   rust/helpers.c:66:5: warning: no previous prototype for function 'rust_helper_readw' [-Wmissing-prototypes], err: false
   rust/helpers.c:72:5: warning: no previous prototype for function 'rust_helper_readl' [-Wmissing-prototypes], err: false
   rust/helpers.c:79:5: warning: no previous prototype for function 'rust_helper_readq' [-Wmissing-prototypes], err: false
   rust/helpers.c:86:6: warning: no previous prototype for function 'rust_helper_writeb' [-Wmissing-prototypes], err: false
   rust/helpers.c:92:6: warning: no previous prototype for function 'rust_helper_writew' [-Wmissing-prototypes], err: false
   rust/helpers.c:98:6: warning: no previous prototype for function 'rust_helper_writel' [-Wmissing-prototypes], err: false
   rust/helpers.c:105:6: warning: no previous prototype for function 'rust_helper_writeq' [-Wmissing-prototypes], err: false
   rust/helpers.c:112:4: warning: no previous prototype for function 'rust_helper_readb_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:118:5: warning: no previous prototype for function 'rust_helper_readw_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:124:5: warning: no previous prototype for function 'rust_helper_readl_relaxed' [-Wmissing-prototypes], err: false
>> rust/helpers.c:131:5: warning: no previous prototype for function 'rust_helper_readq_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:138:6: warning: no previous prototype for function 'rust_helper_writeb_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:144:6: warning: no previous prototype for function 'rust_helper_writew_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:150:6: warning: no previous prototype for function 'rust_helper_writel_relaxed' [-Wmissing-prototypes], err: false
>> rust/helpers.c:157:6: warning: no previous prototype for function 'rust_helper_writeq_relaxed' [-Wmissing-prototypes], err: false
   rust/helpers.c:163:6: warning: no previous prototype for function 'rust_helper___spin_lock_init' [-Wmissing-prototypes], err: false
   rust/helpers.c:174:6: warning: no previous prototype for function 'rust_helper_spin_lock' [-Wmissing-prototypes], err: false
   rust/helpers.c:180:6: warning: no previous prototype for function 'rust_helper_spin_unlock' [-Wmissing-prototypes], err: false
   rust/helpers.c:186:15: warning: no previous prototype for function 'rust_helper_spin_lock_irqsave' [-Wmissing-prototypes], err: false
   rust/helpers.c:194:6: warning: no previous prototype for function 'rust_helper_spin_unlock_irqrestore' [-Wmissing-prototypes], err: false
   rust/helpers.c:200:6: warning: no previous prototype for function 'rust_helper_init_wait' [-Wmissing-prototypes], err: false
   rust/helpers.c:206:5: warning: no previous prototype for function 'rust_helper_signal_pending' [-Wmissing-prototypes], err: false
   rust/helpers.c:212:14: warning: no previous prototype for function 'rust_helper_alloc_pages' [-Wmissing-prototypes], err: false
   rust/helpers.c:218:7: warning: no previous prototype for function 'rust_helper_kmap' [-Wmissing-prototypes], err: false
   rust/helpers.c:224:6: warning: no previous prototype for function 'rust_helper_kunmap' [-Wmissing-prototypes], err: false
   rust/helpers.c:230:5: warning: no previous prototype for function 'rust_helper_cond_resched' [-Wmissing-prototypes], err: false
   rust/helpers.c:236:8: warning: no previous prototype for function 'rust_helper_copy_from_iter' [-Wmissing-prototypes], err: false
   rust/helpers.c:242:8: warning: no previous prototype for function 'rust_helper_copy_to_iter' [-Wmissing-prototypes], err: false
   rust/helpers.c:248:6: warning: no previous prototype for function 'rust_helper_IS_ERR' [-Wmissing-prototypes], err: false
   rust/helpers.c:254:6: warning: no previous prototype for function 'rust_helper_PTR_ERR' [-Wmissing-prototypes], err: false
   rust/helpers.c:260:13: warning: no previous prototype for function 'rust_helper_errname' [-Wmissing-prototypes], err: false
   rust/helpers.c:266:6: warning: no previous prototype for function 'rust_helper_mutex_lock' [-Wmissing-prototypes], err: false
   rust/helpers.c:272:6: warning: no previous prototype for function 'rust_helper_amba_set_drvdata' [-Wmissing-prototypes], err: false
   rust/helpers.c:278:7: warning: no previous prototype for function 'rust_helper_amba_get_drvdata' [-Wmissing-prototypes], err: false
   rust/helpers.c:285:1: warning: no previous prototype for function 'rust_helper_platform_get_drvdata' [-Wmissing-prototypes], err: false
   rust/helpers.c:292:1: warning: no previous prototype for function 'rust_helper_platform_set_drvdata' [-Wmissing-prototypes], err: false
   rust/helpers.c:299:12: warning: no previous prototype for function 'rust_helper_REFCOUNT_INIT' [-Wmissing-prototypes], err: false
   rust/helpers.c:305:6: warning: no previous prototype for function 'rust_helper_refcount_inc' [-Wmissing-prototypes], err: false
   rust/helpers.c:311:6: warning: no previous prototype for function 'rust_helper_refcount_dec_and_test' [-Wmissing-prototypes], err: false
   rust/helpers.c:317:6: warning: no previous prototype for function 'rust_helper_rb_link_node' [-Wmissing-prototypes], err: false
   rust/helpers.c:324:21: warning: no previous prototype for function 'rust_helper_get_current' [-Wmissing-prototypes], err: false
   rust/helpers.c:330:6: warning: no previous prototype for function 'rust_helper_get_task_struct' [-Wmissing-prototypes], err: false
   rust/helpers.c:336:6: warning: no previous prototype for function 'rust_helper_put_task_struct' [-Wmissing-prototypes], err: false
   rust/helpers.c:342:5: warning: no previous prototype for function 'rust_helper_security_binder_set_context_mgr' [-Wmissing-prototypes], err: false
   rust/helpers.c:348:5: warning: no previous prototype for function 'rust_helper_security_binder_transaction' [-Wmissing-prototypes], err: false
   rust/helpers.c:355:5: warning: no previous prototype for function 'rust_helper_security_binder_transfer_binder' [-Wmissing-prototypes], err: false
   rust/helpers.c:362:5: warning: no previous prototype for function 'rust_helper_security_binder_transfer_file' [-Wmissing-prototypes], err: false
   rust/helpers.c:370:6: warning: no previous prototype for function 'rust_helper_rcu_read_lock' [-Wmissing-prototypes], err: false
   rust/helpers.c:376:6: warning: no previous prototype for function 'rust_helper_rcu_read_unlock' [-Wmissing-prototypes], err: false
   rust/helpers.c:382:6: warning: no previous prototype for function 'rust_helper_synchronize_rcu' [-Wmissing-prototypes], err: false
   rust/helpers.c:388:7: warning: no previous prototype for function 'rust_helper_dev_get_drvdata' [-Wmissing-prototypes], err: false
   rust/helpers.c:394:13: warning: no previous prototype for function 'rust_helper_dev_name' [-Wmissing-prototypes], err: false
   rust/helpers.c:400:6: warning: no previous prototype for function 'rust_helper___seqcount_init' [-Wmissing-prototypes], err: false
   rust/helpers.c:407:10: warning: no previous prototype for function 'rust_helper_read_seqcount_begin' [-Wmissing-prototypes], err: false
   rust/helpers.c:413:5: warning: no previous prototype for function 'rust_helper_read_seqcount_retry' [-Wmissing-prototypes], err: false
   rust/helpers.c:419:6: warning: no previous prototype for function 'rust_helper_write_seqcount_begin' [-Wmissing-prototypes], err: false
   rust/helpers.c:425:6: warning: no previous prototype for function 'rust_helper_write_seqcount_end' [-Wmissing-prototypes], err: false
   rust/helpers.c:431:6: warning: no previous prototype for function 'rust_helper_irq_set_handler_locked' [-Wmissing-prototypes], err: false
   rust/helpers.c:438:7: warning: no previous prototype for function 'rust_helper_irq_data_get_irq_chip_data' [-Wmissing-prototypes], err: false
   rust/helpers.c:444:18: warning: no previous prototype for function 'rust_helper_irq_desc_get_chip' [-Wmissing-prototypes], err: false
   rust/helpers.c:450:7: warning: no previous prototype for function 'rust_helper_irq_desc_get_handler_data' [-Wmissing-prototypes], err: false
   rust/helpers.c:456:6: warning: no previous prototype for function 'rust_helper_chained_irq_enter' [-Wmissing-prototypes], err: false
   rust/helpers.c:463:6: warning: no previous prototype for function 'rust_helper_chained_irq_exit' [-Wmissing-prototypes], err: false
   rust/helpers.c:470:20: warning: no previous prototype for function 'rust_helper_get_cred' [-Wmissing-prototypes], err: false
   rust/helpers.c:476:6: warning: no previous prototype for function 'rust_helper_put_cred' [-Wmissing-prototypes], err: false
   rust/helpers.c:481:28: warning: no previous prototype for function 'rust_helper_of_match_device' [-Wmissing-prototypes], err: false
--
   ^
   static 
   rust/helpers.c:44:15: warning: no previous prototype for function 'rust_helper_copy_to_user' [-Wmissing-prototypes]
   unsigned long rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
                 ^
   rust/helpers.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
   ^
   static 
   rust/helpers.c:49:15: warning: no previous prototype for function 'rust_helper_clear_user' [-Wmissing-prototypes]
   unsigned long rust_helper_clear_user(void __user *to, unsigned long n)
                 ^
   rust/helpers.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rust_helper_clear_user(void __user *to, unsigned long n)
   ^
   static 
   rust/helpers.c:54:15: warning: no previous prototype for function 'rust_helper_ioremap' [-Wmissing-prototypes]
   void __iomem *rust_helper_ioremap(resource_size_t offset, unsigned long size)
                 ^
   rust/helpers.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __iomem *rust_helper_ioremap(resource_size_t offset, unsigned long size)
   ^
   static 
   rust/helpers.c:60:4: warning: no previous prototype for function 'rust_helper_readb' [-Wmissing-prototypes]
   u8 rust_helper_readb(const volatile void __iomem *addr)
      ^
   rust/helpers.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u8 rust_helper_readb(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:66:5: warning: no previous prototype for function 'rust_helper_readw' [-Wmissing-prototypes]
   u16 rust_helper_readw(const volatile void __iomem *addr)
       ^
   rust/helpers.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u16 rust_helper_readw(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:72:5: warning: no previous prototype for function 'rust_helper_readl' [-Wmissing-prototypes]
   u32 rust_helper_readl(const volatile void __iomem *addr)
       ^
   rust/helpers.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 rust_helper_readl(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:79:5: warning: no previous prototype for function 'rust_helper_readq' [-Wmissing-prototypes]
   u64 rust_helper_readq(const volatile void __iomem *addr)
       ^
   rust/helpers.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 rust_helper_readq(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:86:6: warning: no previous prototype for function 'rust_helper_writeb' [-Wmissing-prototypes]
   void rust_helper_writeb(u8 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writeb(u8 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:92:6: warning: no previous prototype for function 'rust_helper_writew' [-Wmissing-prototypes]
   void rust_helper_writew(u16 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writew(u16 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:98:6: warning: no previous prototype for function 'rust_helper_writel' [-Wmissing-prototypes]
   void rust_helper_writel(u32 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writel(u32 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:105:6: warning: no previous prototype for function 'rust_helper_writeq' [-Wmissing-prototypes]
   void rust_helper_writeq(u64 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writeq(u64 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:112:4: warning: no previous prototype for function 'rust_helper_readb_relaxed' [-Wmissing-prototypes]
   u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
      ^
   rust/helpers.c:112:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:118:5: warning: no previous prototype for function 'rust_helper_readw_relaxed' [-Wmissing-prototypes]
   u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
       ^
   rust/helpers.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:124:5: warning: no previous prototype for function 'rust_helper_readl_relaxed' [-Wmissing-prototypes]
   u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
       ^
   rust/helpers.c:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
   ^
   static 
>> rust/helpers.c:131:5: warning: no previous prototype for function 'rust_helper_readq_relaxed' [-Wmissing-prototypes]
   u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
       ^
   rust/helpers.c:131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:138:6: warning: no previous prototype for function 'rust_helper_writeb_relaxed' [-Wmissing-prototypes]
   void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:144:6: warning: no previous prototype for function 'rust_helper_writew_relaxed' [-Wmissing-prototypes]
   void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:150:6: warning: no previous prototype for function 'rust_helper_writel_relaxed' [-Wmissing-prototypes]
   void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:150:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
   ^
   static 
>> rust/helpers.c:157:6: warning: no previous prototype for function 'rust_helper_writeq_relaxed' [-Wmissing-prototypes]
   void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
        ^
   rust/helpers.c:157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
   ^
   static 
   rust/helpers.c:163:6: warning: no previous prototype for function 'rust_helper___spin_lock_init' [-Wmissing-prototypes]
   void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
        ^
   rust/helpers.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
   ^
   static 
   rust/helpers.c:174:6: warning: no previous prototype for function 'rust_helper_spin_lock' [-Wmissing-prototypes]
   void rust_helper_spin_lock(spinlock_t *lock)
        ^
   rust/helpers.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_spin_lock(spinlock_t *lock)
   ^
   static 
   rust/helpers.c:180:6: warning: no previous prototype for function 'rust_helper_spin_unlock' [-Wmissing-prototypes]
   void rust_helper_spin_unlock(spinlock_t *lock)
        ^
   rust/helpers.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_spin_unlock(spinlock_t *lock)
   ^
   static 
   rust/helpers.c:186:15: warning: no previous prototype for function 'rust_helper_spin_lock_irqsave' [-Wmissing-prototypes]
   unsigned long rust_helper_spin_lock_irqsave(spinlock_t *lock)
                 ^
   rust/helpers.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rust_helper_spin_lock_irqsave(spinlock_t *lock)
   ^
   static 
   rust/helpers.c:194:6: warning: no previous prototype for function 'rust_helper_spin_unlock_irqrestore' [-Wmissing-prototypes]
   void rust_helper_spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
        ^
   rust/helpers.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
   ^
   static 
   rust/helpers.c:200:6: warning: no previous prototype for function 'rust_helper_init_wait' [-Wmissing-prototypes]
   void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
        ^
   rust/helpers.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
   ^
   static 
   rust/helpers.c:206:5: warning: no previous prototype for function 'rust_helper_signal_pending' [-Wmissing-prototypes]
   int rust_helper_signal_pending(struct task_struct *t)
       ^
   rust/helpers.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rust_helper_signal_pending(struct task_struct *t)
   ^
   static 
   rust/helpers.c:212:14: warning: no previous prototype for function 'rust_helper_alloc_pages' [-Wmissing-prototypes]
   struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
                ^
   rust/helpers.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
   ^
   static 
   rust/helpers.c:218:7: warning: no previous prototype for function 'rust_helper_kmap' [-Wmissing-prototypes]
   void *rust_helper_kmap(struct page *page)
         ^
   rust/helpers.c:218:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *rust_helper_kmap(struct page *page)
   ^
   static 
   rust/helpers.c:224:6: warning: no previous prototype for function 'rust_helper_kunmap' [-Wmissing-prototypes]
   void rust_helper_kunmap(struct page *page)
        ^
   rust/helpers.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rust_helper_kunmap(struct page *page)
   ^
   static 
   rust/helpers.c:230:5: warning: no previous prototype for function 'rust_helper_cond_resched' [-Wmissing-prototypes]
   int rust_helper_cond_resched(void)
       ^
   rust/helpers.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rust_helper_cond_resched(void)
   ^
   static 
   rust/helpers.c:236:8: warning: no previous prototype for function 'rust_helper_copy_from_iter' [-Wmissing-prototypes]
   size_t rust_helper_copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
          ^
   rust/helpers.c:236:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t rust_helper_copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
   ^
   static 
   rust/helpers.c:242:8: warning: no previous prototype for function 'rust_helper_copy_to_iter' [-Wmissing-prototypes]
   size_t rust_helper_copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
          ^
   rust/helpers.c:242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t rust_helper_copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
   ^
   static 
   rust/helpers.c:248:6: warning: no previous prototype for function 'rust_helper_IS_ERR' [-Wmissing-prototypes]
   bool rust_helper_IS_ERR(__force const void *ptr)
        ^
..

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
