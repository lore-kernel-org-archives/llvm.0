Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4463D6463;
	Tue, 14 Apr 2026 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170346; cv=none; b=NkYFw03btWXfWJQk6WUgWjakfLCyyGNzrtksaQgxBDOccdE/ZUkZUvVl9xlkKbbLPJ2nsugcUjvWIMPzSDid4dr226xJJ9Z2QSlw+30N+LpP96VvIV9orRwCwzsPMcWSLK9cpyCT/qMY6IaPrXxpkIegnRUECTIMaZJDCd9XUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170346; c=relaxed/simple;
	bh=Me8XBAB6i2VtdrDmQVZxTJNroonIeTj5KpxPAmdDdvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EtAtw28cX+1vMgCZvrrsdmmgo4gM8VoVNDAUHgPqnL+2ts+apFoArTqxXlYKbvdwfKfqQ+KsruQbN2Jam88+o2hgFApu191wAxcG5JLNy/LQ2NaS+1MAba67Qw1F1gn2sXD/xWMSJHEGzN5Y95ZHP59QME6aEslS4869U6cfAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNL3O01/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNL3O01/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170344; x=1807706344;
  h=date:from:to:cc:subject:message-id;
  bh=Me8XBAB6i2VtdrDmQVZxTJNroonIeTj5KpxPAmdDdvg=;
  b=ZNL3O01/TEWJQywcNkMaUlxOl10K7BHdOz2+dQyFUOFewCy9ceXfmcjZ
   FOJ15mmVsDDPio3LjYP9Y3ETTCS8Lm0BxrGbCfSxjZenojhV1bQfqduuk
   8FSak6NsKeJIQEvzNluzxjeam3czTG5aupPdKibjZYIHpJUS3/EebdE+9
   YSFcnR3zlVb66X38hYAIDFKJensGVLfnhHBQpSniZseyEl/yDPupBYtsg
   CzuNexw0I9CZ8MYcKZJ45LWiKtEKaSWtFU+IiN+IbyXn0yrw8WfoktdXX
   ayL2LcDm7CSZCJhRuPb0A/Vt9iKJILKyawHnjE4n/oi2e/qKcWXhJWhrc
   g==;
X-CSE-ConnectionGUID: UzcDVNb4RiqxIVNwWStzsQ==
X-CSE-MsgGUID: zwBQ85u3SlWeXT9OjjVwhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87828412"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87828412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:39:03 -0700
X-CSE-ConnectionGUID: sFEq7rodTCOqa+GB0ZDuYg==
X-CSE-MsgGUID: gxl8ctolR5OJjaPHUSmHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234485885"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2026 05:39:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCd2h-000000000PJ-1QTB;
	Tue, 14 Apr 2026 12:38:59 +0000
Date: Tue, 14 Apr 2026 14:38:58 +0200
From: kernel test robot <lkp@intel.com>
To: "Pablo Martin-Gomez" <pmartin-gomez@freebox.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/mac80211/parse.c:134:28: error: too few arguments to
 function call, expected 5, have 4
Message-ID: <202604141419.BVAQCnN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Martin-Gomez/wifi-nl80211-remove-EHT-IE-size-validation/20260414-014056
head:   27802dfbd9cea5146c1de2ae0dae896fb8e15a40
commit: 8a5d1b438dca787968156272f9bf7d0a9260bc58 wifi: make EHT capa size check not read reserved bits
date:   19 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141419.BVAQCnN1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141419.BVAQCnN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141419.BVAQCnN1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mac80211/parse.c:134:28: error: too few arguments to function call, expected 5, have 4
     132 |                 if (ieee80211_eht_capa_size_ok(elems->he_cap,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                                                data, len,
     134 |                                                params->from_ap)) {
         |                                                               ^
   include/linux/ieee80211-eht.h:357:1: note: 'ieee80211_eht_capa_size_ok' declared here
     357 | ieee80211_eht_capa_size_ok(const u8 *he_capa, const u8 *data, u8 len,
         | ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                            bool from_ap, enum nl80211_band band)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +134 net/mac80211/parse.c

5a21f0eae13515 Johannes Berg 2024-02-28   61  
9d0480a7c05b64 Johannes Berg 2024-01-29   62  static void
9d0480a7c05b64 Johannes Berg 2024-01-29   63  ieee80211_parse_extension_element(u32 *crc,
9d0480a7c05b64 Johannes Berg 2024-01-29   64  				  const struct element *elem,
5a21f0eae13515 Johannes Berg 2024-02-28   65  				  struct ieee80211_elems_parse *elems_parse,
9d0480a7c05b64 Johannes Berg 2024-01-29   66  				  struct ieee80211_elems_parse_params *params)
9d0480a7c05b64 Johannes Berg 2024-01-29   67  {
5a21f0eae13515 Johannes Berg 2024-02-28   68  	struct ieee802_11_elems *elems = &elems_parse->elems;
9d0480a7c05b64 Johannes Berg 2024-01-29   69  	const void *data = elem->data + 1;
9d0480a7c05b64 Johannes Berg 2024-01-29   70  	bool calc_crc = false;
9d0480a7c05b64 Johannes Berg 2024-01-29   71  	u8 len;
9d0480a7c05b64 Johannes Berg 2024-01-29   72  
9d0480a7c05b64 Johannes Berg 2024-01-29   73  	if (!elem->datalen)
9d0480a7c05b64 Johannes Berg 2024-01-29   74  		return;
9d0480a7c05b64 Johannes Berg 2024-01-29   75  
9d0480a7c05b64 Johannes Berg 2024-01-29   76  	len = elem->datalen - 1;
9d0480a7c05b64 Johannes Berg 2024-01-29   77  
9d0480a7c05b64 Johannes Berg 2024-01-29   78  	switch (elem->data[0]) {
9d0480a7c05b64 Johannes Berg 2024-01-29   79  	case WLAN_EID_EXT_HE_MU_EDCA:
9d0480a7c05b64 Johannes Berg 2024-01-29   80  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29   81  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29   82  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29   83  		if (len >= sizeof(*elems->mu_edca_param_set))
9d0480a7c05b64 Johannes Berg 2024-01-29   84  			elems->mu_edca_param_set = data;
9d0480a7c05b64 Johannes Berg 2024-01-29   85  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29   86  	case WLAN_EID_EXT_HE_CAPABILITY:
9d0480a7c05b64 Johannes Berg 2024-01-29   87  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29   88  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29   89  		if (ieee80211_he_capa_size_ok(data, len)) {
9d0480a7c05b64 Johannes Berg 2024-01-29   90  			elems->he_cap = data;
9d0480a7c05b64 Johannes Berg 2024-01-29   91  			elems->he_cap_len = len;
9d0480a7c05b64 Johannes Berg 2024-01-29   92  		}
9d0480a7c05b64 Johannes Berg 2024-01-29   93  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29   94  	case WLAN_EID_EXT_HE_OPERATION:
9d0480a7c05b64 Johannes Berg 2024-01-29   95  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29   96  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29   97  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29   98  		if (len >= sizeof(*elems->he_operation) &&
9d0480a7c05b64 Johannes Berg 2024-01-29   99  		    len >= ieee80211_he_oper_size(data) - 1)
9d0480a7c05b64 Johannes Berg 2024-01-29  100  			elems->he_operation = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  101  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  102  	case WLAN_EID_EXT_UORA:
9d0480a7c05b64 Johannes Berg 2024-01-29  103  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29  104  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  105  		if (len >= 1)
9d0480a7c05b64 Johannes Berg 2024-01-29  106  			elems->uora_element = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  107  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  108  	case WLAN_EID_EXT_MAX_CHANNEL_SWITCH_TIME:
9d0480a7c05b64 Johannes Berg 2024-01-29  109  		if (len == 3)
9d0480a7c05b64 Johannes Berg 2024-01-29  110  			elems->max_channel_switch_time = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  111  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  112  	case WLAN_EID_EXT_MULTIPLE_BSSID_CONFIGURATION:
9d0480a7c05b64 Johannes Berg 2024-01-29  113  		if (len >= sizeof(*elems->mbssid_config_ie))
9d0480a7c05b64 Johannes Berg 2024-01-29  114  			elems->mbssid_config_ie = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  115  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  116  	case WLAN_EID_EXT_HE_SPR:
9d0480a7c05b64 Johannes Berg 2024-01-29  117  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29  118  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  119  		if (len >= sizeof(*elems->he_spr) &&
0c2fd18f7ec552 Lingbo Kong   2024-05-16  120  		    len >= ieee80211_he_spr_size(data) - 1)
9d0480a7c05b64 Johannes Berg 2024-01-29  121  			elems->he_spr = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  122  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  123  	case WLAN_EID_EXT_HE_6GHZ_CAPA:
9d0480a7c05b64 Johannes Berg 2024-01-29  124  		if (params->mode < IEEE80211_CONN_MODE_HE)
9d0480a7c05b64 Johannes Berg 2024-01-29  125  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  126  		if (len >= sizeof(*elems->he_6ghz_capa))
9d0480a7c05b64 Johannes Berg 2024-01-29  127  			elems->he_6ghz_capa = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  128  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  129  	case WLAN_EID_EXT_EHT_CAPABILITY:
9d0480a7c05b64 Johannes Berg 2024-01-29  130  		if (params->mode < IEEE80211_CONN_MODE_EHT)
9d0480a7c05b64 Johannes Berg 2024-01-29  131  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  132  		if (ieee80211_eht_capa_size_ok(elems->he_cap,
9d0480a7c05b64 Johannes Berg 2024-01-29  133  					       data, len,
9d0480a7c05b64 Johannes Berg 2024-01-29 @134  					       params->from_ap)) {
9d0480a7c05b64 Johannes Berg 2024-01-29  135  			elems->eht_cap = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  136  			elems->eht_cap_len = len;
9d0480a7c05b64 Johannes Berg 2024-01-29  137  		}
9d0480a7c05b64 Johannes Berg 2024-01-29  138  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  139  	case WLAN_EID_EXT_EHT_OPERATION:
9d0480a7c05b64 Johannes Berg 2024-01-29  140  		if (params->mode < IEEE80211_CONN_MODE_EHT)
9d0480a7c05b64 Johannes Berg 2024-01-29  141  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  142  		if (ieee80211_eht_oper_size_ok(data, len))
9d0480a7c05b64 Johannes Berg 2024-01-29  143  			elems->eht_operation = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  144  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29  145  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  146  	case WLAN_EID_EXT_EHT_MULTI_LINK:
9d0480a7c05b64 Johannes Berg 2024-01-29  147  		if (params->mode < IEEE80211_CONN_MODE_EHT)
9d0480a7c05b64 Johannes Berg 2024-01-29  148  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  149  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29  150  
9d0480a7c05b64 Johannes Berg 2024-01-29  151  		if (ieee80211_mle_size_ok(data, len)) {
9d0480a7c05b64 Johannes Berg 2024-01-29  152  			const struct ieee80211_multi_link_elem *mle =
9d0480a7c05b64 Johannes Berg 2024-01-29  153  				(void *)data;
9d0480a7c05b64 Johannes Berg 2024-01-29  154  
9d0480a7c05b64 Johannes Berg 2024-01-29  155  			switch (le16_get_bits(mle->control,
9d0480a7c05b64 Johannes Berg 2024-01-29  156  					      IEEE80211_ML_CONTROL_TYPE)) {
9d0480a7c05b64 Johannes Berg 2024-01-29  157  			case IEEE80211_ML_CONTROL_TYPE_BASIC:
99ca2c28e6b680 Johannes Berg 2025-02-21  158  				if (elems_parse->multi_link_inner) {
9d0480a7c05b64 Johannes Berg 2024-01-29  159  					elems->parse_error |=
9d0480a7c05b64 Johannes Berg 2024-01-29  160  						IEEE80211_PARSE_ERR_DUP_NEST_ML_BASIC;
9d0480a7c05b64 Johannes Berg 2024-01-29  161  					break;
9d0480a7c05b64 Johannes Berg 2024-01-29  162  				}
9d0480a7c05b64 Johannes Berg 2024-01-29  163  				break;
9d0480a7c05b64 Johannes Berg 2024-01-29  164  			case IEEE80211_ML_CONTROL_TYPE_RECONF:
5a21f0eae13515 Johannes Berg 2024-02-28  165  				elems_parse->ml_reconf_elem = elem;
9d0480a7c05b64 Johannes Berg 2024-01-29  166  				break;
24711d60f8492a Ilan Peer     2025-01-02  167  			case IEEE80211_ML_CONTROL_TYPE_PRIO_ACCESS:
24711d60f8492a Ilan Peer     2025-01-02  168  				elems_parse->ml_epcs_elem = elem;
24711d60f8492a Ilan Peer     2025-01-02  169  				break;
9d0480a7c05b64 Johannes Berg 2024-01-29  170  			default:
9d0480a7c05b64 Johannes Berg 2024-01-29  171  				break;
9d0480a7c05b64 Johannes Berg 2024-01-29  172  			}
9d0480a7c05b64 Johannes Berg 2024-01-29  173  		}
9d0480a7c05b64 Johannes Berg 2024-01-29  174  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  175  	case WLAN_EID_EXT_BANDWIDTH_INDICATION:
9d0480a7c05b64 Johannes Berg 2024-01-29  176  		if (params->mode < IEEE80211_CONN_MODE_EHT)
9d0480a7c05b64 Johannes Berg 2024-01-29  177  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  178  		if (ieee80211_bandwidth_indication_size_ok(data, len))
9d0480a7c05b64 Johannes Berg 2024-01-29  179  			elems->bandwidth_indication = data;
9d0480a7c05b64 Johannes Berg 2024-01-29  180  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29  181  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  182  	case WLAN_EID_EXT_TID_TO_LINK_MAPPING:
9d0480a7c05b64 Johannes Berg 2024-01-29  183  		if (params->mode < IEEE80211_CONN_MODE_EHT)
9d0480a7c05b64 Johannes Berg 2024-01-29  184  			break;
9d0480a7c05b64 Johannes Berg 2024-01-29  185  		calc_crc = true;
9d0480a7c05b64 Johannes Berg 2024-01-29  186  		if (ieee80211_tid_to_link_map_size_ok(data, len) &&
9d0480a7c05b64 Johannes Berg 2024-01-29  187  		    elems->ttlm_num < ARRAY_SIZE(elems->ttlm)) {
9d0480a7c05b64 Johannes Berg 2024-01-29  188  			elems->ttlm[elems->ttlm_num] = (void *)data;
9d0480a7c05b64 Johannes Berg 2024-01-29  189  			elems->ttlm_num++;
9d0480a7c05b64 Johannes Berg 2024-01-29  190  		}
9d0480a7c05b64 Johannes Berg 2024-01-29  191  		break;
a1085114715ee9 Johannes Berg 2026-01-30  192  	case WLAN_EID_EXT_UHR_OPER:
a1085114715ee9 Johannes Berg 2026-01-30  193  		if (params->mode < IEEE80211_CONN_MODE_UHR)
a1085114715ee9 Johannes Berg 2026-01-30  194  			break;
a1085114715ee9 Johannes Berg 2026-01-30  195  		calc_crc = true;
a1085114715ee9 Johannes Berg 2026-01-30  196  		if (ieee80211_uhr_oper_size_ok(data, len,
a1085114715ee9 Johannes Berg 2026-01-30  197  					       params->type == (IEEE80211_FTYPE_MGMT |
a1085114715ee9 Johannes Berg 2026-01-30  198  								IEEE80211_STYPE_BEACON))) {
a1085114715ee9 Johannes Berg 2026-01-30  199  			elems->uhr_operation = data;
a1085114715ee9 Johannes Berg 2026-01-30  200  			elems->uhr_operation_len = len;
a1085114715ee9 Johannes Berg 2026-01-30  201  		}
a1085114715ee9 Johannes Berg 2026-01-30  202  		break;
a1085114715ee9 Johannes Berg 2026-01-30  203  	case WLAN_EID_EXT_UHR_CAPA:
a1085114715ee9 Johannes Berg 2026-01-30  204  		if (params->mode < IEEE80211_CONN_MODE_UHR)
a1085114715ee9 Johannes Berg 2026-01-30  205  			break;
a1085114715ee9 Johannes Berg 2026-01-30  206  		calc_crc = true;
a1085114715ee9 Johannes Berg 2026-01-30  207  		if (ieee80211_uhr_capa_size_ok(data, len, true)) {
a1085114715ee9 Johannes Berg 2026-01-30  208  			elems->uhr_cap = data;
a1085114715ee9 Johannes Berg 2026-01-30  209  			elems->uhr_cap_len = len;
a1085114715ee9 Johannes Berg 2026-01-30  210  		}
a1085114715ee9 Johannes Berg 2026-01-30  211  		break;
9d0480a7c05b64 Johannes Berg 2024-01-29  212  	}
9d0480a7c05b64 Johannes Berg 2024-01-29  213  
9d0480a7c05b64 Johannes Berg 2024-01-29  214  	if (crc && calc_crc)
9d0480a7c05b64 Johannes Berg 2024-01-29  215  		*crc = crc32_be(*crc, (void *)elem, elem->datalen + 2);
9d0480a7c05b64 Johannes Berg 2024-01-29  216  }
9d0480a7c05b64 Johannes Berg 2024-01-29  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
