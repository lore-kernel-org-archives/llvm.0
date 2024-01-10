Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC75F364A6;
	Wed, 10 Jan 2024 06:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BinQMVjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704867245; x=1736403245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmEXBAjv1CgYLmVPEhHdU4v/yaPdz4DdrZhO74RMhEI=;
  b=BinQMVjMUMD10hcniRWvKye6HeTVsQcdSrje8ZqfssfiSfRse9T2zqzv
   dcItYfK7pT/jcVSZJ93LY12IH1hCHYYw8OLtxAObuZwGxUvNIY01wZJlk
   vNNqOEBlwFymApBp+Qbs5wbbnEFmaQAZ47PBDIU8/SQnGN7cbDN5+W2Qj
   HHlvRTzPmkUntc8ccc0SeZjgl9la0jxc6rO7V9rC2hBDBsNcC8MIHLZny
   naicTJf79zmGAI4CWLgnXFrISurgQkbcnoGBXwBAa9vSyJJUZ6bz80vUm
   cCwCdYTnW/9vRIRvnjMMylkTOdwkCdnPfnC6nqjSBbr/KUyueAcWDOGY3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462705406"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="462705406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 22:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="758263104"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="758263104"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Jan 2024 22:14:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNRom-0006gI-2m;
	Wed, 10 Jan 2024 06:12:50 +0000
Date: Wed, 10 Jan 2024 14:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 70/73] net/wireless/scan.c:307:25:
 warning: no previous prototype for function 'cfg80211_gen_new_ie'
Message-ID: <202401101438.tPY5cmKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   62c3c8b5f77cbdf3d8f5cabf61afc9e8be0cfedf
commit: 5955fac6fe1c30c7fc4fa0e46b7bd35b5360264f [70/73] CFG80211
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240110/202401101438.tPY5cmKL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101438.tPY5cmKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101438.tPY5cmKL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/scan.c:307:25: warning: no previous prototype for function 'cfg80211_gen_new_ie' [-Wmissing-prototypes]
   VISIBLE_IF_KUNIT size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
                           ^
   net/wireless/scan.c:307:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
   VISIBLE_IF_KUNIT size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
                    ^
                    static 
   1 warning generated.


vim +/cfg80211_gen_new_ie +307 net/wireless/scan.c

   306	
 > 307	VISIBLE_IF_KUNIT size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
   308						    const u8 *subie, size_t subie_len,
   309						    u8 *new_ie, size_t new_ie_len)
   310	{
   311		const struct element *non_inherit_elem, *parent, *sub;
   312		u8 *pos = new_ie;
   313		u8 id, ext_id;
   314		unsigned int match_len;
   315	
   316		non_inherit_elem = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
   317							  subie, subie_len);
   318	
   319		/*
   320		 * We copy the elements one by one from the parent to the generated
   321		 * elements.
   322		 * If they are not inherited (included in subie or in the non
   323		 * inheritance element), then we copy all occurrences the first time
   324		 * we see this element type.
   325		 */
   326		for_each_element(parent, ie, ielen) {
   327			if (parent->id == WLAN_EID_FRAGMENT)
   328				continue;
   329	
   330			if (parent->id == WLAN_EID_EXTENSION) {
   331				if (parent->datalen < 1)
   332					continue;
   333	
   334				id = WLAN_EID_EXTENSION;
   335				ext_id = parent->data[0];
   336				match_len = 1;
   337			} else {
   338				id = parent->id;
   339				match_len = 0;
   340			}
   341	
   342			/* Find first occurrence in subie */
   343			sub = cfg80211_find_elem_match(id, subie, subie_len,
   344						       &ext_id, match_len, 0);
   345	
   346			/* Copy from parent if not in subie and inherited */
   347			if (!sub &&
   348			    cfg80211_is_element_inherited(parent, non_inherit_elem)) {
   349				if (!cfg80211_copy_elem_with_frags(parent,
   350								   ie, ielen,
   351								   &pos, new_ie,
   352								   new_ie_len))
   353					return 0;
   354	
   355				continue;
   356			}
   357	
   358			/* Already copied if an earlier element had the same type */
   359			if (cfg80211_find_elem_match(id, ie, (u8 *)parent - ie,
   360						     &ext_id, match_len, 0))
   361				continue;
   362	
   363			/* Not inheriting, copy all similar elements from subie */
   364			while (sub) {
   365				if (!cfg80211_copy_elem_with_frags(sub,
   366								   subie, subie_len,
   367								   &pos, new_ie,
   368								   new_ie_len))
   369					return 0;
   370	
   371				sub = cfg80211_find_elem_match(id,
   372							       sub->data + sub->datalen,
   373							       subie_len + subie -
   374							       (sub->data +
   375								sub->datalen),
   376							       &ext_id, match_len, 0);
   377			}
   378		}
   379	
   380		/*
   381		 * The above misses elements that are included in subie but not in the
   382		 * parent, so do a pass over subie and append those.
   383		 * Skip the non-tx BSSID caps and non-inheritance element.
   384		 */
   385		for_each_element(sub, subie, subie_len) {
   386			if (sub->id == WLAN_EID_NON_TX_BSSID_CAP)
   387				continue;
   388	
   389			if (sub->id == WLAN_EID_FRAGMENT)
   390				continue;
   391	
   392			if (sub->id == WLAN_EID_EXTENSION) {
   393				if (sub->datalen < 1)
   394					continue;
   395	
   396				id = WLAN_EID_EXTENSION;
   397				ext_id = sub->data[0];
   398				match_len = 1;
   399	
   400				if (ext_id == WLAN_EID_EXT_NON_INHERITANCE)
   401					continue;
   402			} else {
   403				id = sub->id;
   404				match_len = 0;
   405			}
   406	
   407			/* Processed if one was included in the parent */
   408			if (cfg80211_find_elem_match(id, ie, ielen,
   409						     &ext_id, match_len, 0))
   410				continue;
   411	
   412			if (!cfg80211_copy_elem_with_frags(sub, subie, subie_len,
   413							   &pos, new_ie, new_ie_len))
   414				return 0;
   415		}
   416	
   417		return pos - new_ie;
   418	}
   419	EXPORT_SYMBOL_IF_KUNIT(cfg80211_gen_new_ie);
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
