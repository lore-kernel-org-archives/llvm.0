Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77809134BD;
	Thu, 17 Aug 2023 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692283393; x=1723819393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3niQLi3RChLvE9HjN9h8vbrEEUxYZBePFC45LJONGCk=;
  b=TyTjuWCyn5goVt7LdaDVwhhcyEN20eWK4+/7A7kLB8ZhGhKuDrH40urM
   vmgKFSwM84rPwrUdBwbCdbCHEboHpXOuFmE3q3TA7upuGuKrTQ9KOoZqx
   AtNEgZhNzU/NmpzX9PIk6j4Ym8B5mhZLw+aEya4T5+obiTxBx2t2ZKfFy
   1aFXdwoROH+jW5gp1I4Aga3jn04Ql/f1FStpnim+2gWLGLkqhs+l7H66k
   euRtW60PMM7Qk63mKwqG9HFZR4yxzrvZ8Q0SC16E73MSFJxamNZEJ5kcz
   zqr4i/zKmafjk44CzgF5euAWD3qxYlAUK7Wa2188rPilQW04f10CavAMZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352416484"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="352416484"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908420142"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908420142"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 07:43:03 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWeDG-0001EE-2x;
	Thu, 17 Aug 2023 14:43:02 +0000
Date: Thu, 17 Aug 2023 22:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Paul <seanpaul@chromium.org>,
	Nicolas Boichat <drinkcat@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 7676/9999] drivers/opp/core.c:1891:
 warning: Function parameter or member 'src_opp' not described in
 'dev_pm_opp_xlate_opp'
Message-ID: <202308172244.5Ofh6q4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: cf108050aa250fed501fcb12fb5e077e331f549f [7676/9999] FROMLIST: OPP: Add function to look up required OPP's for a given OPP
config: x86_64-randconfig-x071-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172244.5Ofh6q4b-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172244.5Ofh6q4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172244.5Ofh6q4b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:1891: warning: Function parameter or member 'src_opp' not described in 'dev_pm_opp_xlate_opp'
>> drivers/opp/core.c:1891: warning: Excess function parameter 'pstate' description in 'dev_pm_opp_xlate_opp'


vim +1891 drivers/opp/core.c

  1873	
  1874	/**
  1875	 * dev_pm_opp_xlate_opp() - Find required OPP for src_table OPP.
  1876	 * @src_table: OPP table which has dst_table as one of its required OPP table.
  1877	 * @dst_table: Required OPP table of the src_table.
  1878	 * @pstate: OPP of the src_table.
  1879	 *
  1880	 * This function returns the OPP (present in @dst_table) pointed out by the
  1881	 * "required-opps" property of the OPP (present in @src_table).
  1882	 *
  1883	 * The callers are required to call dev_pm_opp_put() for the returned OPP after
  1884	 * use.
  1885	 *
  1886	 * Return: destination table OPP on success, otherwise NULL on errors.
  1887	 */
  1888	struct dev_pm_opp *dev_pm_opp_xlate_opp(struct opp_table *src_table,
  1889						struct opp_table *dst_table,
  1890						struct dev_pm_opp *src_opp)
> 1891	{
  1892		struct dev_pm_opp *opp, *dest_opp = NULL;
  1893		int i;
  1894	
  1895		if (!src_table || !dst_table || !src_opp)
  1896			return NULL;
  1897	
  1898		for (i = 0; i < src_table->required_opp_count; i++) {
  1899			if (src_table->required_opp_tables[i]->np == dst_table->np)
  1900				break;
  1901		}
  1902	
  1903		if (unlikely(i == src_table->required_opp_count)) {
  1904			pr_err("%s: Couldn't find matching OPP table (%p: %p)\n",
  1905			       __func__, src_table, dst_table);
  1906			return NULL;
  1907		}
  1908	
  1909		mutex_lock(&src_table->lock);
  1910	
  1911		list_for_each_entry(opp, &src_table->opp_list, node) {
  1912			if (opp == src_opp) {
  1913				dest_opp = opp->required_opps[i];
  1914				dev_pm_opp_get(dest_opp);
  1915				goto unlock;
  1916			}
  1917		}
  1918	
  1919		pr_err("%s: Couldn't find matching OPP (%p: %p)\n", __func__, src_table,
  1920		       dst_table);
  1921	
  1922	unlock:
  1923		mutex_unlock(&src_table->lock);
  1924	
  1925		return dest_opp;
  1926	}
  1927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
