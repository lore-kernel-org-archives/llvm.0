Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D0768FD;
	Thu,  9 Jan 2025 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460030; cv=none; b=n9HP3zpPyesIdewdWZS/w+Vdt6XXio2mOX+WxbrCJ8Zd3s0y36ezcizPIgEp/GNPwqo2ERtQAuTWARyIfLVVsjcm3qKTod1H5DdsQwYdBMUcEwPFM3E2fDSw9iiQORpmA977bwavlIfdxAxtmiwdA+BT9Mvr+t9jbkLV9/TVpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460030; c=relaxed/simple;
	bh=koOgnjWIAmY7MFWmurOEexQFRVJeIfVcYVtNmcJyqdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASepEyDAaSdOnRjVYlFPzHUUTZ6nx/Qwgew2gYhOGAU2rXTNoHDdzEkSkA/KoegxBJAHYLPITBMqbPNQ+kc0R8206LDkXAhUk29APSEMOdlpN5SLJ6kEY6QRwckMVawARRsfCig1l33dyCMwsiEVKuYpDLSMm8K7dNlT/pJNTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATyMM06X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATyMM06X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736460029; x=1767996029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koOgnjWIAmY7MFWmurOEexQFRVJeIfVcYVtNmcJyqdQ=;
  b=ATyMM06XjJmEUQkXc7/qN1b+77UZI4WSx4n63VC4+6433FRPxlBQkuC3
   INQTiD0k2YFlqaRX5mgZZ6SDN6Dnmc2aPHZVqbMTUpUSe6z54K2JnCQyt
   q+Okw7TIG1FiLx/uj+0AT4Ufa+w73HJRCzjVzmuOzTdtj0M0secYabP0u
   EB6aiyfc+lVv/JLSBJ02huxZdgIOnloAqXslC+ttHr+B8yvhGMX3WYFIY
   ZGD16pkHkHlxpIshdgcIHmhie/NM7wDHpa34YT+Ak3/ldn7PlileYv41K
   sL4xiu2SkaeoNk+6LO2zJlRTYhkJIten9j7lYHwmuYISmMkU6ky6yTSl3
   Q==;
X-CSE-ConnectionGUID: iSflfCQnRyKZUNI+s1UgDQ==
X-CSE-MsgGUID: S0+Bn8kgQAimS5ptjSsS+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="24346895"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="24346895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 14:00:28 -0800
X-CSE-ConnectionGUID: L+axyo8iStyTv2ULPPaY+Q==
X-CSE-MsgGUID: kAT7r3GnRGmIbLJxzTYkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="108446786"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 14:00:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0Zk-000IBP-2h;
	Thu, 09 Jan 2025 22:00:24 +0000
Date: Fri, 10 Jan 2025 06:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/fixes 3/3]
 kernel/time/timer_migration.c:1586:2: error: assigning to 'volatile typeof
 (*child->parent)' (aka 'volatile struct tmigr_group') from incompatible type
 'struct tmigr_group *'; dereference with *
Message-ID: <202501100553.dWuk3ztY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/fixes
head:   b825dd98da4f6861a12aa88cda4cf28ffb51d151
commit: b825dd98da4f6861a12aa88cda4cf28ffb51d151 [3/3] The following commit:
config: riscv-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100553.dWuk3ztY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100553.dWuk3ztY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100553.dWuk3ztY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer_migration.c:1586:2: error: assigning to 'volatile typeof (*child->parent)' (aka 'volatile struct tmigr_group') from incompatible type 'struct tmigr_group *'; dereference with *
    1586 |         smp_store_release(child->parent, parent);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:63:2: note: expanded from macro '__smp_store_release'
      63 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                     ^ ~~~~~
   1 error generated.


vim +1586 kernel/time/timer_migration.c

  1558	
  1559	static void tmigr_connect_child_parent(struct tmigr_group *child,
  1560					       struct tmigr_group *parent,
  1561					       bool activate)
  1562	{
  1563		struct tmigr_walk data;
  1564	
  1565		raw_spin_lock_irq(&child->lock);
  1566		raw_spin_lock_nested(&parent->lock, SINGLE_DEPTH_NESTING);
  1567	
  1568		if (activate) {
  1569			/*
  1570			 * @child is the old top and @parent the new one. In this
  1571			 * case groupmask is pre-initialized and @child already
  1572			 * accounted, along with its new sibling corresponding to the
  1573			 * CPU going up.
  1574			 */
  1575			WARN_ON_ONCE(child->groupmask != BIT(0) || parent->num_children != 2);
  1576		} else {
  1577			/* Adding @child for the CPU going up to @parent. */
  1578			child->groupmask = BIT(parent->num_children++);
  1579		}
  1580	
  1581		/*
  1582		 * Make sure parent initialization is visible before publishing it to a
  1583		 * racing CPU entering/exiting idle. This RELEASE barrier enforces an
  1584		 * address dependency that pairs with the bare atomic_read() in __walk_groups().
  1585		 */
> 1586		smp_store_release(child->parent, parent);
  1587	
  1588		raw_spin_unlock(&parent->lock);
  1589		raw_spin_unlock_irq(&child->lock);
  1590	
  1591		trace_tmigr_connect_child_parent(child);
  1592	
  1593		if (!activate)
  1594			return;
  1595	
  1596		/*
  1597		 * To prevent inconsistent states, active children need to be active in
  1598		 * the new parent as well. Inactive children are already marked inactive
  1599		 * in the parent group:
  1600		 *
  1601		 * * When new groups were created by tmigr_setup_groups() starting from
  1602		 *   the lowest level (and not higher then one level below the current
  1603		 *   top level), then they are not active. They will be set active when
  1604		 *   the new online CPU comes active.
  1605		 *
  1606		 * * But if a new group above the current top level is required, it is
  1607		 *   mandatory to propagate the active state of the already existing
  1608		 *   child to the new parent. So tmigr_connect_child_parent() is
  1609		 *   executed with the formerly top level group (child) and the newly
  1610		 *   created group (parent).
  1611		 *
  1612		 * * It is ensured that the child is active, as this setup path is
  1613		 *   executed in hotplug prepare callback. This is exectued by an
  1614		 *   already connected and !idle CPU. Even if all other CPUs go idle,
  1615		 *   the CPU executing the setup will be responsible up to current top
  1616		 *   level group. And the next time it goes inactive, it will release
  1617		 *   the new childmask and parent to subsequent walkers through this
  1618		 *   @child. Therefore propagate active state unconditionally.
  1619		 */
  1620		data.childmask = child->groupmask;
  1621	
  1622		/*
  1623		 * There is only one new level per time (which is protected by
  1624		 * tmigr_mutex). When connecting the child and the parent and set the
  1625		 * child active when the parent is inactive, the parent needs to be the
  1626		 * uppermost level. Otherwise there went something wrong!
  1627		 */
  1628		WARN_ON(!tmigr_active_up(parent, child, &data) && parent->parent);
  1629	}
  1630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
