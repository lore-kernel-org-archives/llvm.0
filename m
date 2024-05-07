Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430464A0C;
	Tue,  7 May 2024 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715047669; cv=none; b=QdfFWNJGT4zzw7OeV0w1jeLWXPF7y4G0kwy6j8Jpz+sdMRwx88/EsHMYlWPB7gX8ljQprBsU5gaoQMR+dC/Nx5VYqxlXAslZlf3xq/n6JoGXW8qbUiPywFGQ4QanNiRyLqUDJCQwEFYMnCudSifG/1vJon5js7TrGDgsswsU2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715047669; c=relaxed/simple;
	bh=SdL+ZHJrA51V6KwSDn2n9sqWbviofW8UtyIV7vTj9/g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpKFdylwaLJIHf9w4zz3sunRGYRUelb0Ej+K4zVgGetMWAvl3xy2psHDA7UV41zZWEiW3PDNw2KEXgnFL/ce3pw5i3Gonw/278ObCLb8wPbekcpH5mFcrHNKBsgveoDzyZLaUa3RbVk3BRx+b8tg/RVtCEn5CZ79wju2My5JNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnIFx3Op; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnIFx3Op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715047668; x=1746583668;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SdL+ZHJrA51V6KwSDn2n9sqWbviofW8UtyIV7vTj9/g=;
  b=OnIFx3Op0wc8RWSuynCa8yaH6ER3JYTJjNA1I2qwiyioYxc+omk//Gcm
   noQxagpM4NYMnQ3UDMzaTZks2VVKL6pWpns93h9keNBl/vKN5kBD3H9iv
   DE7DcSeVV8cheA9rbSyztcKsQs6eTVaR5VEFLeQMuEaC5Ofmz9przQ/5s
   qEms7af/EBptvJ6NkIxjEjl0jRuoweWVkEL3YvDAtIe93WzUDZeeFHb0m
   b+mJjftjEthK5uUVwSHG7jMx8e2v2ygqLN+FzPH8hJ14OVtUjcPfKsn/4
   HcS9InO5l5u3lIfKUssAQgyWXw5SmqldPv9fjknnv6xzoJw3zObiSyPug
   w==;
X-CSE-ConnectionGUID: kldy8IKEQ7i8THyXjBbKmw==
X-CSE-MsgGUID: AIqLai0qSOirw0oYMeoWZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11359564"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="11359564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:07:16 -0700
X-CSE-ConnectionGUID: Hyv64H8GSUqYPXZ9jwjk5g==
X-CSE-MsgGUID: 5dxVQNwEQoayK1dVLJiuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28751311"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2024 19:07:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4AEZ-0001Dz-0A;
	Tue, 07 May 2024 02:07:11 +0000
Date: Tue, 7 May 2024 10:07:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 5/5] mm/memcontrol-v1.c:1875:48: warning:
 arithmetic between different enumeration types ('enum node_stat_item' and
 'enum lru_list')
Message-ID: <202405071035.tUhz0N6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   9b269ef160d984dc9ed844151a21384b4ad60fdc
commit: 9b269ef160d984dc9ed844151a21384b4ad60fdc [5/5] mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240507/202405071035.tUhz0N6s-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405071035.tUhz0N6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405071035.tUhz0N6s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memcontrol-v1.c:3:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol-v1.c:10:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memcontrol-v1.c:1875:48: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    1875 |                         nr += lruvec_page_state(lruvec, NR_LRU_BASE + lru);
         |                                                         ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol-v1.c:1877:54: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    1877 |                         nr += lruvec_page_state_local(lruvec, NR_LRU_BASE + lru);
         |                                                               ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol-v1.c:1893:46: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    1893 |                         nr += memcg_page_state(memcg, NR_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol-v1.c:1895:52: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    1895 |                         nr += memcg_page_state_local(memcg, NR_LRU_BASE + lru);
         |                                                             ~~~~~~~~~~~ ^ ~~~
   11 warnings generated.


vim +1875 mm/memcontrol-v1.c

  1861	
  1862	static unsigned long mem_cgroup_node_nr_lru_pages(struct mem_cgroup *memcg,
  1863					int nid, unsigned int lru_mask, bool tree)
  1864	{
  1865		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
  1866		unsigned long nr = 0;
  1867		enum lru_list lru;
  1868	
  1869		VM_BUG_ON((unsigned)nid >= nr_node_ids);
  1870	
  1871		for_each_lru(lru) {
  1872			if (!(BIT(lru) & lru_mask))
  1873				continue;
  1874			if (tree)
> 1875				nr += lruvec_page_state(lruvec, NR_LRU_BASE + lru);
  1876			else
  1877				nr += lruvec_page_state_local(lruvec, NR_LRU_BASE + lru);
  1878		}
  1879		return nr;
  1880	}
  1881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
