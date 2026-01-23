Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B034A76D;
	Fri, 23 Jan 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149259; cv=none; b=W+ifHI1jq2TZZJAwPv/4se3ektN8omR86ayuTfCqs+iyXzEX8XP1q2sQYuyeneKY7TuyaztFYo/94QqrkOdCC5wISkLmU0qHah1A/JYkfxBeQGxu+3zW+uFMbrHtqNw5hQg/i44ixMQmPtfst0xe/TyPH/Vr1H1yRb/40BUUNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149259; c=relaxed/simple;
	bh=iG/N/ZNQA0Kc2l1lMStQOMjs7VKHOG7llLouDwJBAKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hA9fS+jr/deHZKTCIEvasSeg/ffLSkzUffLi6J6jO3+m5sxixU6Bo1PX1LkW5txIcpy/gsonKDeBzOpZ5J+8+ZdyIysIMKqq421SxPrJUeM/Qw0PCHx5xP4gIhdY9IN9DCps+FvVvc/LOa666qP7XzqZkXRzugZF+kjjwp2sZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SasmE0H6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SasmE0H6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769149250; x=1800685250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iG/N/ZNQA0Kc2l1lMStQOMjs7VKHOG7llLouDwJBAKU=;
  b=SasmE0H6c4eAAorjs6um95iZjwN52gC2vDQHzHfWNuXOCKY8DcH1120k
   DMz211BE/0aIhR77WExwF37D7koggmbbT+JNKBtjFeXqm++uS5SdSMY2W
   cvGnYnysLEPFKH6lAJ0tWtXzWYnjv+1xKyA5gwL0C1KE9vbyJK1RKMzAO
   khsZB5G99ri9UmqfDxattqkL9x3q3ei7HqkVh7EnYeoO9ZowsTGE0SEcN
   CB3HnP3OxzWvJYzsscZn62MnPvYPlUA8h1VCuShph5KoAtW2eSVO1465W
   naXZK910TdilN9MCt4m3gcFMWKB4Dpl+N/2CMjvsYdg+GvjUSPfeNrP7D
   A==;
X-CSE-ConnectionGUID: rTziorp2SPyJkeXcL73cRw==
X-CSE-MsgGUID: 8uNLT9rqRdCPIcRlSKlv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74261098"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="74261098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:20:46 -0800
X-CSE-ConnectionGUID: ry4NvkB0RiCnhLLb0KLooA==
X-CSE-MsgGUID: +c0E7gX0TIqktXlje5SZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="206060250"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Jan 2026 22:20:44 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjAXA-000000000ft-14WC;
	Fri, 23 Jan 2026 06:20:40 +0000
Date: Fri, 23 Jan 2026 07:20:05 +0100
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, rafael@kernel.org, dakr@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pavel@kernel.org,
	lenb@kernel.org, neelx@suse.com, atomlin@atomlin.com, sean@ashe.io,
	mproche@gmail.com, chjohnst@gmail.com, nick.lange@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] PM: QoS: Introduce boot parameter
 pm_qos_resume_latency_us
Message-ID: <202601230729.fH9djzc0-lkp@intel.com>
References: <20260123010024.3301276-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123010024.3301276-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master amd-pstate/linux-next amd-pstate/bleeding-edge v6.16-rc1 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/PM-QoS-Introduce-boot-parameter-pm_qos_resume_latency_us/20260123-090409
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20260123010024.3301276-1-atomlin%40atomlin.com
patch subject: [PATCH] PM: QoS: Introduce boot parameter pm_qos_resume_latency_us
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260123/202601230729.fH9djzc0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230729.fH9djzc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230729.fH9djzc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/qos.c:339:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     339 |         return ret;
         |                ^~~
   kernel/power/qos.c:266:9: note: initialize the variable 'ret' to silence this warning
     266 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +339 kernel/power/qos.c

   245	
   246	/* init_pm_qos_latency_us_setup - Parse the pm_qos_latency_us boot parameter.
   247	 *
   248	 * Parses the kernel command line option "pm_qos_resume_latency_us=" to establish
   249	 * per-CPU resume latency constraints. These constraints are applied
   250	 * immediately when a CPU is registered.
   251	 *
   252	 * Syntax: pm_qos_resume_latency_us=<cpu-list>:<value>[,<cpu-list>:<value>...]
   253	 * Example: pm_qos_resume_latency_us=0-3:0,4-7:20
   254	 *
   255	 * The parsing logic enforces a "First Match Wins" policy. If a CPU is
   256	 * covered by multiple entries in the list, only the first valid entry
   257	 * applies. Any subsequent overlapping ranges for that CPU are ignored.
   258	 *
   259	 * Return: 0 on success, or a negative error code on failure.
   260	 */
   261	static int __init init_pm_qos_latency_us_setup(void)
   262	{
   263		char *token, *cmd = pm_qos_resume_latency_cmdline;
   264		struct pm_qos_boot_entry *entry, *tentry;
   265		cpumask_var_t covered;
   266		int ret;
   267	
   268		if (boot_option_idle_override == IDLE_POLL) {
   269			pr_warn("pm_qos: Cannot be used with idle=poll\n");
   270			return -EINVAL;
   271		}
   272	
   273		if (!zalloc_cpumask_var(&covered, GFP_KERNEL)) {
   274			pr_warn("pm_qos: Failed to allocate memory for parsing boot parameter\n");
   275			return -ENOMEM;
   276		}
   277	
   278		while ((token = strsep(&cmd, ",")) != NULL) {
   279			char *str_range, *str_val;
   280	
   281			str_range = strsep(&token, ":");
   282			str_val = token;
   283	
   284			if (!str_val) {
   285				pr_warn("pm_qos: Missing value range %s\n",
   286					str_range);
   287				continue;
   288			}
   289	
   290			entry = kzalloc(sizeof(*entry), GFP_KERNEL);
   291			if (!entry) {
   292				pr_warn("pm_qos: Failed to allocate memory for boot entry\n");
   293				goto cleanup;
   294			}
   295	
   296			if (cpulist_parse(str_range, &entry->mask)) {
   297				pr_warn("pm_qos: Failed to parse cpulist range %s\n",
   298					str_range);
   299				kfree(entry);
   300				continue;
   301			}
   302	
   303			cpumask_andnot(&entry->mask, &entry->mask, covered);
   304			if (cpumask_empty(&entry->mask)) {
   305				pr_warn("pm_qos: Entry %s already covered, ignoring\n",
   306					str_range);
   307				kfree(entry);
   308				continue;
   309			}
   310			cpumask_or(covered, covered, &entry->mask);
   311	
   312			if (kstrtos32(str_val, 0, &entry->latency)) {
   313				pr_warn("pm_qos: Invalid latency requirement value %s\n",
   314					str_val);
   315				kfree(entry);
   316				continue;
   317			}
   318	
   319			if (entry->latency < 0) {
   320				pr_warn("pm_qos: Latency requirement cannot be negative: %d\n",
   321					entry->latency);
   322				kfree(entry);
   323				continue;
   324			}
   325	
   326			list_add_tail(&entry->node, &pm_qos_boot_list);
   327		}
   328	
   329		free_cpumask_var(covered);
   330		return 0;
   331	
   332	cleanup:
   333		list_for_each_entry_safe(entry, tentry, &pm_qos_boot_list, node) {
   334			list_del(&entry->node);
   335			kfree(entry);
   336		}
   337	
   338		free_cpumask_var(covered);
 > 339		return ret;
   340	}
   341	early_initcall(init_pm_qos_latency_us_setup);
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
