Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257818C001;
	Fri, 30 Aug 2024 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725024794; cv=none; b=gNE+zq5QSn6mSL0eaSBJHrGVleMfqqVEhdkRSmERSD8GbAErGR4Hq4igT6iXqBeKAUlEgJPhkBxi9mAXUJ++0RyaK9Z6YQZswpP24glrbQi31NKsj552TBds25yJtPJyK9ZszrPX9L46+Bxm3Snvpm0/5oPk+NK9Kj8zXyUecxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725024794; c=relaxed/simple;
	bh=19ejD/e3OSsdC132ZJv9HbROxKBTDgAdLb4mAcHnXEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsjPaSQOODWTxUtB9YvN7h0VYupxkVZIywsB1yo+v3YIa+gBH29YKTsQkUKTPqTh/ibYXZJx4FGT5CDequky9YDtmhvzkeQkQqTtvQOXsm8BDmvH9lN77zMOLeFTNRXbSxtR2LwdMtu7s8mw45ZR/B3y4e/Qmr/dlHL+bjql2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpExSolL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpExSolL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725024792; x=1756560792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19ejD/e3OSsdC132ZJv9HbROxKBTDgAdLb4mAcHnXEE=;
  b=DpExSolLkOm4gvRH4FG2nIJZnJOOCO7V9fo5PnQkX+ydP6rJ72ZIBFHp
   uH8r/EHoNh5ui+a8tcLRtkytRJDCwlm5qgztbgCgmY9A/nbdhxjXi5f5j
   WW4Tta0YJ3lXcBW6iJQxYOdpE9NWPaEP1LtpXshVQ4YfHCXll6a4tEYhi
   lFrnIBVgWw+hNAckLc4PJW7IjIUAYuD1LDeEU3Hb/wt7t/YerFBrLVG3x
   /ux0fkEfDim+chhtkyvqtGt/jFnZ86GbeKbQLrmSDmM25EUJM/AbxmGYp
   MKlvXWrUcZL/WQ9vTopPedr5LJ72Ot5FIKbqgE7nHJaQyHcXLCQTPel5j
   w==;
X-CSE-ConnectionGUID: +VWT1+zuSc+z+ZwyLFvsyg==
X-CSE-MsgGUID: BcSAn8NoRlGO+uQaaSFkRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23793500"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23793500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 06:33:12 -0700
X-CSE-ConnectionGUID: OzVNlHknTgaTlp0PoarvJA==
X-CSE-MsgGUID: pY3Wi2MIR8eNLg7Z+PTf9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64649808"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Aug 2024 06:33:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk1kS-0001VC-13;
	Fri, 30 Aug 2024 13:33:08 +0000
Date: Fri, 30 Aug 2024 21:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] Bluetooth: MGMT: Ignore keys being loaded with
 invalid type
Message-ID: <202408302140.1IwYywEV-lkp@intel.com>
References: <20240828181051.876598-2-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828181051.876598-2-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Ignore-keys-being-loaded-with-invalid-type/20240829-021403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240828181051.876598-2-luiz.dentz%40gmail.com
patch subject: [PATCH v2 2/2] Bluetooth: MGMT: Ignore keys being loaded with invalid type
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240830/202408302140.1IwYywEV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302140.1IwYywEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302140.1IwYywEV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/mgmt.c:2860:9: warning: format specifies type 'unsigned int' but the argument has type '__u8 *' (aka 'unsigned char *') [-Wformat]
    2859 |                                     "Invalid link address type %u for %pMR",
         |                                                                ~~
         |                                                                %s
    2860 |                                     &key->addr.type);
         |                                     ^~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:276:43: note: expanded from macro 'bt_dev_warn'
     276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
         |                        ~~~                       ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:262:47: note: expanded from macro 'BT_WARN'
     262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
         |                                         ~~~         ^~~~~~~~~~~
>> net/bluetooth/mgmt.c:2859:44: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
    2859 |                                     "Invalid link address type %u for %pMR",
         |                                                                       ~^
   include/net/bluetooth/bluetooth.h:276:17: note: expanded from macro 'bt_dev_warn'
     276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
         |                        ^~~
   include/net/bluetooth/bluetooth.h:262:35: note: expanded from macro 'BT_WARN'
     262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
         |                                         ^~~
   2 warnings generated.


vim +2860 net/bluetooth/mgmt.c

  2793	
  2794	static int load_link_keys(struct sock *sk, struct hci_dev *hdev, void *data,
  2795				  u16 len)
  2796	{
  2797		struct mgmt_cp_load_link_keys *cp = data;
  2798		const u16 max_key_count = ((U16_MAX - sizeof(*cp)) /
  2799					   sizeof(struct mgmt_link_key_info));
  2800		u16 key_count, expected_len;
  2801		bool changed;
  2802		int i;
  2803	
  2804		bt_dev_dbg(hdev, "sock %p", sk);
  2805	
  2806		if (!lmp_bredr_capable(hdev))
  2807			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
  2808					       MGMT_STATUS_NOT_SUPPORTED);
  2809	
  2810		key_count = __le16_to_cpu(cp->key_count);
  2811		if (key_count > max_key_count) {
  2812			bt_dev_err(hdev, "load_link_keys: too big key_count value %u",
  2813				   key_count);
  2814			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
  2815					       MGMT_STATUS_INVALID_PARAMS);
  2816		}
  2817	
  2818		expected_len = struct_size(cp, keys, key_count);
  2819		if (expected_len != len) {
  2820			bt_dev_err(hdev, "load_link_keys: expected %u bytes, got %u bytes",
  2821				   expected_len, len);
  2822			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
  2823					       MGMT_STATUS_INVALID_PARAMS);
  2824		}
  2825	
  2826		if (cp->debug_keys != 0x00 && cp->debug_keys != 0x01)
  2827			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
  2828					       MGMT_STATUS_INVALID_PARAMS);
  2829	
  2830		bt_dev_dbg(hdev, "debug_keys %u key_count %u", cp->debug_keys,
  2831			   key_count);
  2832	
  2833		hci_dev_lock(hdev);
  2834	
  2835		hci_link_keys_clear(hdev);
  2836	
  2837		if (cp->debug_keys)
  2838			changed = !hci_dev_test_and_set_flag(hdev, HCI_KEEP_DEBUG_KEYS);
  2839		else
  2840			changed = hci_dev_test_and_clear_flag(hdev,
  2841							      HCI_KEEP_DEBUG_KEYS);
  2842	
  2843		if (changed)
  2844			new_settings(hdev, NULL);
  2845	
  2846		for (i = 0; i < key_count; i++) {
  2847			struct mgmt_link_key_info *key = &cp->keys[i];
  2848	
  2849			if (hci_is_blocked_key(hdev,
  2850					       HCI_BLOCKED_KEY_TYPE_LINKKEY,
  2851					       key->val)) {
  2852				bt_dev_warn(hdev, "Skipping blocked link key for %pMR",
  2853					    &key->addr.bdaddr);
  2854				continue;
  2855			}
  2856	
  2857			if (key->addr.type != BDADDR_BREDR) {
  2858				bt_dev_warn(hdev,
> 2859					    "Invalid link address type %u for %pMR",
> 2860					    &key->addr.type);
  2861				continue;
  2862			}
  2863	
  2864			if (key->type > 0x08) {
  2865				bt_dev_warn(hdev, "Invalid link key type %u for %pMR",
  2866					    key->type, &key->addr.bdaddr);
  2867				continue;
  2868			}
  2869	
  2870			/* Always ignore debug keys and require a new pairing if
  2871			 * the user wants to use them.
  2872			 */
  2873			if (key->type == HCI_LK_DEBUG_COMBINATION)
  2874				continue;
  2875	
  2876			hci_add_link_key(hdev, NULL, &key->addr.bdaddr, key->val,
  2877					 key->type, key->pin_len, NULL);
  2878		}
  2879	
  2880		mgmt_cmd_complete(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS, 0, NULL, 0);
  2881	
  2882		hci_dev_unlock(hdev);
  2883	
  2884		return 0;
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
