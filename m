Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA191A9F8C;
	Sun, 19 Oct 2025 23:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760915825; cv=none; b=IoHxAzXMcItrPVsgzv/Q9Sc0GSAmxGiarhHFR3+gPAbKwPld4GrezLp4ASivczPdsxVi2F+gFQIAqo/EMEjZOnBI1O5jdBhY51BOUi9/HQgV9QHUSN6NWxVw7s53gjayhmushqe8azXCeyQSx6ZfSQGZMYjp7sFOc6v1s6eNu1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760915825; c=relaxed/simple;
	bh=JDGyt5LGpimf++qaghsDjwTVgfx9lO+B/Bxh3WeGCcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XcTOaMR9doLN191lByZEjzzc8ARjPzPA7DzZ7AEQVgHFnric+6jBbrOv+nngDM8sUjbAwJ8SCoAF9wuGHb0IcjiwAbjPJcwwtFCmbAq5nnq88gc43q4r9kFoDKUR1OykARfkYQtioldXV8U3CzUeg9++hMjf8nk4YSL7qyi9ZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj5/vyVJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj5/vyVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760915823; x=1792451823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDGyt5LGpimf++qaghsDjwTVgfx9lO+B/Bxh3WeGCcw=;
  b=Mj5/vyVJT83rirOAfZU40SdomvcTW18+SAcFiOw+uEAc1E0NGD7dufHR
   sbLsx7btfC4uSejTkwU8y3O5JYYN+yObuJDX7O4l3rQzQp2u4jJI1Clcv
   as4L520qS991RXLsbvRTfgiHDVX8VOj4je9wfCaxrRtdXcy5qK2QkGh6O
   3pepwVLYmKzsH5W8TRdXYICJ+fmC90WhOwQktiptYI7Mk7CruopdpMIis
   4AIpwN2y2y3LqXKnWtqqawEKbddc3t0ZQZX5oUfrl5wNqlOrr+4+PsriM
   FmrIvonNXvwXBuu3d1EjzcoFiTZ/Wy3A63r0G4nUS+grCOG7gbo3yAP7J
   g==;
X-CSE-ConnectionGUID: OYzndx/mTFWtfh7egErddw==
X-CSE-MsgGUID: b1TJB1p8TZi1zIYhmr6Www==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73643998"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="73643998"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 16:17:02 -0700
X-CSE-ConnectionGUID: 6tynOH2lQuKrnrbHUE5aJg==
X-CSE-MsgGUID: q4mEEW8vSOq0wgDGJuB1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182336072"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2025 16:17:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAce2-0009Ls-0z;
	Sun, 19 Oct 2025 23:16:58 +0000
Date: Mon, 20 Oct 2025 07:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 4/5]
 kernel/time/timer_migration.c:1660:9: warning: variable 'child' is
 uninitialized when used here
Message-ID: <202510200754.gXS16VRx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   08f04e40c010549208f054cf3328d91a04465325
commit: 85f5e0057b5becd7ce71c122d8209c0ee9160c1f [4/5] timers/migration: Fix NUMA tree above 64 CPUs
config: hexagon-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510200754.gXS16VRx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200754.gXS16VRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200754.gXS16VRx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timer_migration.c:1660:9: warning: variable 'child' is uninitialized when used here [-Wuninitialized]
    1660 |                 stack[child->level] = start;
         |                       ^~~~~
   kernel/time/timer_migration.c:1651:35: note: initialize the variable 'child' to silence this warning
    1651 |         struct tmigr_group *group, *child, **stack;
         |                                          ^
         |                                           = NULL
   1 warning generated.


vim +/child +1660 kernel/time/timer_migration.c

  1646	
  1647	/* returns an error or the new top level */
  1648	static int tmigr_setup_groups(unsigned int cpu, unsigned int node,
  1649				      struct tmigr_group *start, bool activate)
  1650	{
  1651		struct tmigr_group *group, *child, **stack;
  1652		int i, top = 0, err = 0, start_lvl = 0;
  1653		bool root_mismatch = false;
  1654	
  1655		stack = kcalloc(tmigr_hierarchy_levels, sizeof(*stack), GFP_KERNEL);
  1656		if (!stack)
  1657			return -ENOMEM;
  1658	
  1659		if (start) {
> 1660			stack[child->level] = start;
  1661			start_lvl = child->level + 1;
  1662		}
  1663	
  1664		if (tmigr_root)
  1665			root_mismatch = tmigr_root->numa_node != node;
  1666	
  1667		for (i = start_lvl; i < tmigr_hierarchy_levels; i++) {
  1668			group = tmigr_get_group(cpu, node, i);
  1669			if (IS_ERR(group)) {
  1670				err = PTR_ERR(group);
  1671				i--;
  1672				break;
  1673			}
  1674	
  1675			top = i;
  1676			stack[i] = group;
  1677	
  1678			/*
  1679			 * When booting only less CPUs of a system than CPUs are
  1680			 * available, not all calculated hierarchy levels are required,
  1681			 * unless a node mismatch is detected.
  1682			 *
  1683			 * The loop is aborted as soon as the highest level, which might
  1684			 * be different from tmigr_hierarchy_levels, contains only a
  1685			 * single group, unless the nodes mismatch below tmigr_crossnode_level
  1686			 */
  1687			if (group->parent)
  1688				break;
  1689			if ((!root_mismatch || i >= tmigr_crossnode_level) &&
  1690			    list_is_singular(&tmigr_level_list[i]))
  1691				break;
  1692		}
  1693	
  1694		/* Assert single root without parent */
  1695		if (WARN_ON_ONCE(i >= tmigr_hierarchy_levels))
  1696			return -EINVAL;
  1697	
  1698		for (; i >= start_lvl; i--) {
  1699			group = stack[i];
  1700	
  1701			if (err < 0) {
  1702				list_del(&group->list);
  1703				kfree(group);
  1704				continue;
  1705			}
  1706	
  1707			WARN_ON_ONCE(i != group->level);
  1708	
  1709			/*
  1710			 * Update tmc -> group / child -> group connection
  1711			 */
  1712			if (i == 0) {
  1713				struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
  1714	
  1715				tmc->tmgroup = group;
  1716				tmc->groupmask = BIT(group->num_children++);
  1717	
  1718				tmigr_init_root(group, activate);
  1719	
  1720				trace_tmigr_connect_cpu_parent(tmc);
  1721	
  1722				/* There are no children that need to be connected */
  1723				continue;
  1724			} else {
  1725				child = stack[i - 1];
  1726				tmigr_connect_child_parent(child, group, activate);
  1727			}
  1728		}
  1729	
  1730		kfree(stack);
  1731	
  1732		/* Root update */
  1733		if (err >= 0) {
  1734			if (list_is_singular(&tmigr_level_list[top])) {
  1735				group = list_first_entry(&tmigr_level_list[top],
  1736							 typeof(*group), list);
  1737				WARN_ON_ONCE(group->parent);
  1738				if (tmigr_root) {
  1739					/* Old root should be the same or below */
  1740					WARN_ON_ONCE(tmigr_root->level > top);
  1741				}
  1742				tmigr_root = group;
  1743			}
  1744		}
  1745	
  1746		return err;
  1747	}
  1748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
