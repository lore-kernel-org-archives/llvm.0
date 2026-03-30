Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E13BC66B;
	Mon, 30 Mar 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868764; cv=none; b=ZbQ8sdHaUqOcfwXb7sWIY9lH7Qd7lAzQZehAOM9d/Jsd5mdLbik+Eneya8I6Serdga25Am5KcTMMeeqjXWfqmZ0dFPIZXBYLP7qcUcM3SGQb8eCaYM64sDIonP0CGjpsghF1j0bBUOXf6vft9Ua7ywG1cPnpep0ZCsjA2KCq0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868764; c=relaxed/simple;
	bh=Wrvx/aC2P/JsEbXbwcTRWh4liWmjYQf4blrvQ1ox2RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP9cri2iNlh6eVrlF8igG0F11fZJWFvF2Wg6Aa7O4HoMgXlKT21MrDHXi3WXZckWkmO/Woznaw8liEf5pX+3lHIFuYZndxgp5huPrjYnwlla7RWfcJ+ILoxqjHIIDg6YcffuVktZKnLqB+SprCk7ACxYpuR6aySL29qplD6y3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng6TNnnD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng6TNnnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774868758; x=1806404758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wrvx/aC2P/JsEbXbwcTRWh4liWmjYQf4blrvQ1ox2RE=;
  b=ng6TNnnDpnAbu5n/Bv8F6sFkHqog4XVOCi1sNrl70U11HmivYWgN029L
   l/EOC2McDUrV2NQASXNq6FMP50MCTUJtRauWFfPMz9Jyp5uDU6PsSPsd0
   hNL8C2k3cictZ0Ra1MR5mAFyRp8DeCxc2hMQWDXCgRu3cu0QQs8XcFTb8
   XygSsERvBDznbxcNzfUfxM/SVXRvWS40c0zPWy9wiQlbX49eGKycdv9JR
   z3npy1KGNHlq7PdpxChSugwjvceU2PTqqm3RUyFVf+V1LI+4pFutdVeTF
   hzXsxJbKDbsm0ViSvqHxsNhiklUw7W5pgL1QCeooKUQXza5HuzYudxNLW
   w==;
X-CSE-ConnectionGUID: sBSN454hQEScufbROWIcGA==
X-CSE-MsgGUID: 8Pml5mNqR96AIIe/sMgo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76049451"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76049451"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:05:57 -0700
X-CSE-ConnectionGUID: xCbKxCOETtSdVCDnZ5xjog==
X-CSE-MsgGUID: Pm8VE/SsRkmXSU7JUbltqw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 04:05:55 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ARN-000000000zw-0EZm;
	Mon, 30 Mar 2026 11:05:53 +0000
Date: Mon, 30 Mar 2026 19:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/19] wifi: cfg80211: move AP HT/VHT/... operation
 to beacon info
Message-ID: <202603301818.nXdwbUFE-lkp@intel.com>
References: <20260327103659.1cdda25b617f.I0d21120b41eed661eefc61d5417dadaae7145845@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327103659.1cdda25b617f.I0d21120b41eed661eefc61d5417dadaae7145845@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20260327]
[cannot apply to wireless/main linus/master v7.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-mac80211-set-cur_max_bandwidth-to-maximum/20260330-102406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260327103659.1cdda25b617f.I0d21120b41eed661eefc61d5417dadaae7145845%40changeid
patch subject: [RFC PATCH 14/19] wifi: cfg80211: move AP HT/VHT/... operation to beacon info
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603301818.nXdwbUFE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301818.nXdwbUFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301818.nXdwbUFE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/quantenna/qtnfmac/commands.c:264:24: error: no member named 'ht_required' in 'struct cfg80211_ap_settings'
     264 |         cmd->ht_required = s->ht_required;
         |                            ~  ^
>> drivers/net/wireless/quantenna/qtnfmac/commands.c:265:25: error: no member named 'vht_required' in 'struct cfg80211_ap_settings'
     265 |         cmd->vht_required = s->vht_required;
         |                             ~  ^
   2 errors generated.


vim +264 drivers/net/wireless/quantenna/qtnfmac/commands.c

df0af4c7bac470 Mikhail Karpenko     2019-11-18  235  
17011da0b8f079 Igor Mitsyanko       2017-10-30  236  int qtnf_cmd_send_start_ap(struct qtnf_vif *vif,
9b692df1e66ff6 Igor Mitsyanko       2017-10-04  237  			   const struct cfg80211_ap_settings *s)
98f44cb0655cbe Igor Mitsyanko       2017-05-11  238  {
98f44cb0655cbe Igor Mitsyanko       2017-05-11  239  	struct sk_buff *cmd_skb;
17011da0b8f079 Igor Mitsyanko       2017-10-30  240  	struct qlink_cmd_start_ap *cmd;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  241  	struct qlink_auth_encr *aen;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  242  	int ret;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  243  	int i;
ecad3b0b99bff7 Veerendranath Jakkam 2022-05-23  244  	int n;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  245  
17011da0b8f079 Igor Mitsyanko       2017-10-30  246  	if (!qtnf_cmd_start_ap_can_fit(vif, s))
17011da0b8f079 Igor Mitsyanko       2017-10-30  247  		return -E2BIG;
17011da0b8f079 Igor Mitsyanko       2017-10-30  248  
98f44cb0655cbe Igor Mitsyanko       2017-05-11  249  	cmd_skb = qtnf_cmd_alloc_new_cmdskb(vif->mac->macid, vif->vifid,
17011da0b8f079 Igor Mitsyanko       2017-10-30  250  					    QLINK_CMD_START_AP,
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  251  					    sizeof(*cmd));
c93fe71c91d0ae Sergey Matyukevich   2018-01-22  252  	if (!cmd_skb)
98f44cb0655cbe Igor Mitsyanko       2017-05-11  253  		return -ENOMEM;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  254  
17011da0b8f079 Igor Mitsyanko       2017-10-30  255  	cmd = (struct qlink_cmd_start_ap *)cmd_skb->data;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  256  	cmd->dtim_period = s->dtim_period;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  257  	cmd->beacon_interval = cpu_to_le16(s->beacon_interval);
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  258  	cmd->hidden_ssid = qlink_hidden_ssid_nl2q(s->hidden_ssid);
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  259  	cmd->inactivity_timeout = cpu_to_le16(s->inactivity_timeout);
62262dd00c3191 Johannes Berg        2024-10-07  260  	cmd->smps_mode = NL80211_SMPS_OFF;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  261  	cmd->p2p_ctwindow = s->p2p_ctwindow;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  262  	cmd->p2p_opp_ps = s->p2p_opp_ps;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  263  	cmd->pbss = s->pbss;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04 @264  	cmd->ht_required = s->ht_required;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04 @265  	cmd->vht_required = s->vht_required;
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  266  	cmd->twt_responder = s->twt_responder;
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  267  	if (s->he_obss_pd.enable) {
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  268  		cmd->sr_params.sr_control |= QLINK_SR_SRG_INFORMATION_PRESENT;
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  269  		cmd->sr_params.srg_obss_pd_min_offset =
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  270  			s->he_obss_pd.min_offset;
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  271  		cmd->sr_params.srg_obss_pd_max_offset =
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  272  			s->he_obss_pd.max_offset;
ed7791d9d0abc7 Mikhail Karpenko     2020-01-09  273  	}
98f44cb0655cbe Igor Mitsyanko       2017-05-11  274  
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  275  	aen = &cmd->aen;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  276  	aen->auth_type = s->auth_type;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  277  	aen->privacy = !!s->privacy;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  278  	aen->wpa_versions = cpu_to_le32(s->crypto.wpa_versions);
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  279  	aen->cipher_group = cpu_to_le32(s->crypto.cipher_group);
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  280  	aen->n_ciphers_pairwise = cpu_to_le32(s->crypto.n_ciphers_pairwise);
98f44cb0655cbe Igor Mitsyanko       2017-05-11  281  	for (i = 0; i < QLINK_MAX_NR_CIPHER_SUITES; i++)
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  282  		aen->ciphers_pairwise[i] =
9b692df1e66ff6 Igor Mitsyanko       2017-10-04  283  				cpu_to_le32(s->crypto.ciphers_pairwise[i]);
ecad3b0b99bff7 Veerendranath Jakkam 2022-05-23  284  	n = min(QLINK_MAX_NR_AKM_SUITES, s->crypto.n_akm_suites);
ecad3b0b99bff7 Veerendranath Jakkam 2022-05-23  285  	aen->n_akm_suites = cpu_to_le32(n);
ecad3b0b99bff7 Veerendranath Jakkam 2022-05-23  286  	for (i = 0; i < n; i++)
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  287  		aen->akm_suites[i] = cpu_to_le32(s->crypto.akm_suites[i]);
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  288  	aen->control_port = s->crypto.control_port;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  289  	aen->control_port_no_encrypt = s->crypto.control_port_no_encrypt;
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  290  	aen->control_port_ethertype =
9b692df1e66ff6 Igor Mitsyanko       2017-10-04  291  		cpu_to_le16(be16_to_cpu(s->crypto.control_port_ethertype));
98f44cb0655cbe Igor Mitsyanko       2017-05-11  292  
f99201cb084df1 Igor Mitsyanko       2017-10-04  293  	if (s->ssid && s->ssid_len > 0 && s->ssid_len <= IEEE80211_MAX_SSID_LEN)
f99201cb084df1 Igor Mitsyanko       2017-10-04  294  		qtnf_cmd_skb_put_tlv_arr(cmd_skb, WLAN_EID_SSID, s->ssid,
f99201cb084df1 Igor Mitsyanko       2017-10-04  295  					 s->ssid_len);
f99201cb084df1 Igor Mitsyanko       2017-10-04  296  
f99201cb084df1 Igor Mitsyanko       2017-10-04  297  	if (cfg80211_chandef_valid(&s->chandef)) {
f99201cb084df1 Igor Mitsyanko       2017-10-04  298  		struct qlink_tlv_chandef *chtlv =
f99201cb084df1 Igor Mitsyanko       2017-10-04  299  			(struct qlink_tlv_chandef *)skb_put(cmd_skb,
f99201cb084df1 Igor Mitsyanko       2017-10-04  300  							    sizeof(*chtlv));
f99201cb084df1 Igor Mitsyanko       2017-10-04  301  
f99201cb084df1 Igor Mitsyanko       2017-10-04  302  		chtlv->hdr.type = cpu_to_le16(QTN_TLV_ID_CHANDEF);
f99201cb084df1 Igor Mitsyanko       2017-10-04  303  		chtlv->hdr.len = cpu_to_le16(sizeof(*chtlv) -
f99201cb084df1 Igor Mitsyanko       2017-10-04  304  					     sizeof(chtlv->hdr));
5bf374ab91ad36 Sergey Matyukevich   2017-12-19  305  		qlink_chandef_cfg2q(&s->chandef, &chtlv->chdef);
f99201cb084df1 Igor Mitsyanko       2017-10-04  306  	}
f99201cb084df1 Igor Mitsyanko       2017-10-04  307  
17011da0b8f079 Igor Mitsyanko       2017-10-30  308  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_BEACON_HEAD,
17011da0b8f079 Igor Mitsyanko       2017-10-30  309  				s->beacon.head, s->beacon.head_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  310  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_BEACON_TAIL,
17011da0b8f079 Igor Mitsyanko       2017-10-30  311  				s->beacon.tail, s->beacon.tail_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  312  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_BEACON_IES,
17011da0b8f079 Igor Mitsyanko       2017-10-30  313  				s->beacon.beacon_ies, s->beacon.beacon_ies_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  314  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_PROBE_RESP,
17011da0b8f079 Igor Mitsyanko       2017-10-30  315  				s->beacon.probe_resp, s->beacon.probe_resp_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  316  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_PROBE_RESP_IES,
17011da0b8f079 Igor Mitsyanko       2017-10-30  317  				s->beacon.proberesp_ies,
17011da0b8f079 Igor Mitsyanko       2017-10-30  318  				s->beacon.proberesp_ies_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  319  	qtnf_cmd_tlv_ie_set_add(cmd_skb, QLINK_IE_SET_ASSOC_RESP,
17011da0b8f079 Igor Mitsyanko       2017-10-30  320  				s->beacon.assocresp_ies,
17011da0b8f079 Igor Mitsyanko       2017-10-30  321  				s->beacon.assocresp_ies_len);
17011da0b8f079 Igor Mitsyanko       2017-10-30  322  
a3945f43761c3e Igor Mitsyanko       2017-10-30  323  	if (s->ht_cap) {
a3945f43761c3e Igor Mitsyanko       2017-10-30  324  		struct qlink_tlv_hdr *tlv = (struct qlink_tlv_hdr *)
8b0b5f1ba9e021 Igor Mitsyanko       2020-01-27  325  			skb_put(cmd_skb, sizeof(*tlv) +
8b0b5f1ba9e021 Igor Mitsyanko       2020-01-27  326  				round_up(sizeof(*s->ht_cap), QLINK_ALIGN));
a3945f43761c3e Igor Mitsyanko       2017-10-30  327  
a3945f43761c3e Igor Mitsyanko       2017-10-30  328  		tlv->type = cpu_to_le16(WLAN_EID_HT_CAPABILITY);
a3945f43761c3e Igor Mitsyanko       2017-10-30  329  		tlv->len = cpu_to_le16(sizeof(*s->ht_cap));
a3945f43761c3e Igor Mitsyanko       2017-10-30  330  		memcpy(tlv->val, s->ht_cap, sizeof(*s->ht_cap));
a3945f43761c3e Igor Mitsyanko       2017-10-30  331  	}
a3945f43761c3e Igor Mitsyanko       2017-10-30  332  
a3945f43761c3e Igor Mitsyanko       2017-10-30  333  	if (s->vht_cap) {
a3945f43761c3e Igor Mitsyanko       2017-10-30  334  		struct qlink_tlv_hdr *tlv = (struct qlink_tlv_hdr *)
a3945f43761c3e Igor Mitsyanko       2017-10-30  335  			skb_put(cmd_skb, sizeof(*tlv) + sizeof(*s->vht_cap));
a3945f43761c3e Igor Mitsyanko       2017-10-30  336  
a3945f43761c3e Igor Mitsyanko       2017-10-30  337  		tlv->type = cpu_to_le16(WLAN_EID_VHT_CAPABILITY);
a3945f43761c3e Igor Mitsyanko       2017-10-30  338  		tlv->len = cpu_to_le16(sizeof(*s->vht_cap));
a3945f43761c3e Igor Mitsyanko       2017-10-30  339  		memcpy(tlv->val, s->vht_cap, sizeof(*s->vht_cap));
a3945f43761c3e Igor Mitsyanko       2017-10-30  340  	}
a3945f43761c3e Igor Mitsyanko       2017-10-30  341  
df0af4c7bac470 Mikhail Karpenko     2019-11-18  342  	if (s->he_cap)
df0af4c7bac470 Mikhail Karpenko     2019-11-18  343  		qtnf_cmd_tlv_ie_ext_add(cmd_skb, WLAN_EID_EXT_HE_CAPABILITY,
df0af4c7bac470 Mikhail Karpenko     2019-11-18  344  					s->he_cap, sizeof(*s->he_cap));
df0af4c7bac470 Mikhail Karpenko     2019-11-18  345  
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  346  	if (s->acl) {
95336d4cb58886 Gustavo A. R. Silva  2019-04-03  347  		size_t acl_size = struct_size(s->acl, mac_addrs,
95336d4cb58886 Gustavo A. R. Silva  2019-04-03  348  					      s->acl->n_acl_entries);
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  349  		struct qlink_tlv_hdr *tlv =
8b0b5f1ba9e021 Igor Mitsyanko       2020-01-27  350  			skb_put(cmd_skb,
8b0b5f1ba9e021 Igor Mitsyanko       2020-01-27  351  				sizeof(*tlv) + round_up(acl_size, QLINK_ALIGN));
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  352  
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  353  		tlv->type = cpu_to_le16(QTN_TLV_ID_ACL_DATA);
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  354  		tlv->len = cpu_to_le16(acl_size);
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  355  		qlink_acl_data_cfg2q(s->acl, (struct qlink_acl_data *)tlv->val);
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  356  	}
f1398fd2dd8c77 Vasily Ulyanov       2017-12-19  357  
8b5f4aa7340a4e Igor Mitsyanko       2017-10-04  358  	qtnf_bus_lock(vif->mac->bus);
c6ed298ffe09fb Sergey Matyukevich   2018-10-05  359  	ret = qtnf_cmd_send(vif->mac->bus, cmd_skb);
c6ed298ffe09fb Sergey Matyukevich   2018-10-05  360  	if (ret)
98f44cb0655cbe Igor Mitsyanko       2017-05-11  361  		goto out;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  362  
17011da0b8f079 Igor Mitsyanko       2017-10-30  363  	netif_carrier_on(vif->netdev);
17011da0b8f079 Igor Mitsyanko       2017-10-30  364  
98f44cb0655cbe Igor Mitsyanko       2017-05-11  365  out:
98f44cb0655cbe Igor Mitsyanko       2017-05-11  366  	qtnf_bus_unlock(vif->mac->bus);
c6ed298ffe09fb Sergey Matyukevich   2018-10-05  367  
98f44cb0655cbe Igor Mitsyanko       2017-05-11  368  	return ret;
98f44cb0655cbe Igor Mitsyanko       2017-05-11  369  }
98f44cb0655cbe Igor Mitsyanko       2017-05-11  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
