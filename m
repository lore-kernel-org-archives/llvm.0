Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F74AEFA;
	Fri, 10 May 2024 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335385; cv=none; b=SY7SMNxsjb03o+Csk7hIWduEcjYVTnHcgbVf5B4rKO74pFPnr+0FLCt+5jWsR2rjn8Q1p3tjKQUN+cdCIYb+nw+hds+n+gIJlrd6MTQs2uIxpmcxL9b+yyFQQ4FO9nxdFF9j0DiJmlsCBHmyzyAc/M2QKFeXu4f7C8kXr5bbQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335385; c=relaxed/simple;
	bh=dKt6lGbr/pIHiBmKA2PhqxjGCN/RRqklM6Q3uOQ3CC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXuea4G4dQehU193IXftfVSfqBtrrIsKiiGmJBLHlJoLRE6YPEbunJqWzMioQa5gKNR4CB3XH5r24dXXk05tTzgjJlaNTpSiDnFNwBXotvU2IyppWOI/b86F96UmsjcDmEjum1OvoqY9JVPciKbReCqGJ9NS5CTEUz5D9HGHs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWiGEl1Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWiGEl1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715335383; x=1746871383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dKt6lGbr/pIHiBmKA2PhqxjGCN/RRqklM6Q3uOQ3CC4=;
  b=UWiGEl1Yl5S8OFM/R+xKUkoJ/Ex53WNRjCfmiUP9KrzvLcnx0FcW5dHw
   9XEflkpo5LYWSSWq5VFRqK+/FFyJGHnzrkvbS8Xf/CFaAl7rJ5r/5Frxf
   Yg7GCvyIb1qTjgFwYJGlw/GvSClI99nCr5Ypv00LyoISpT4K3E41Yifp1
   lgfSNSldO3N9lagaWhNnVzZ+biSHW7S0TqgXqXxbzU+nKhuU2jgF7gs8x
   8s80+iL9Jz3H7iY7gr5I+se9W+9eFCVmfff9WmQPjoZ8GhFHLyDL/4YPF
   5aqX0RRU2zn+CoXXVhbXpy+Zvy0ZpXBIemvd2fJkvmNtBp2ghHc+R9Gbq
   A==;
X-CSE-ConnectionGUID: 53tTIcIKQ1OLwIzDeulj5Q==
X-CSE-MsgGUID: V+gCNYqRSnSWuzYW/B4hfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11144425"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11144425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:03:03 -0700
X-CSE-ConnectionGUID: 8nczeQBTR3GodM0sMTXrcg==
X-CSE-MsgGUID: 6JcBGryoTIu20feRDyIM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29587018"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2024 03:03:00 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5N5d-0005yh-2i;
	Fri, 10 May 2024 10:02:57 +0000
Date: Fri, 10 May 2024 18:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update
 existing connection
Message-ID: <202405101700.NwHcUWrt-lkp@intel.com>
References: <20240509225043.1357933-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509225043.1357933-1-luiz.dentz@gmail.com>

Hi Luiz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Make-MGMT_OP_LOAD_CONN_PARAM-update-existing-connection/20240510-065108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240509225043.1357933-1-luiz.dentz%40gmail.com
patch subject: [RFC v2] Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update existing connection
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240510/202405101700.NwHcUWrt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101700.NwHcUWrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101700.NwHcUWrt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/bluetooth/mgmt.c:7881:2: error: use of undeclared identifier 'conn'
           conn = hci_conn_hash_lookup_le(hdev, params->addr.bdaddr,
           ^
>> net/bluetooth/mgmt.c:7881:52: error: no member named 'bdaddr' in 'bdaddr_t'
           conn = hci_conn_hash_lookup_le(hdev, params->addr.bdaddr,
                                                ~~~~~~~~~~~~ ^
   net/bluetooth/mgmt.c:7883:7: error: use of undeclared identifier 'conn'; did you mean 'down'?
           if (!conn)
                ^~~~
                down
   include/linux/semaphore.h:44:13: note: 'down' declared here
   extern void down(struct semaphore *sem);
               ^
>> net/bluetooth/mgmt.c:7883:7: warning: address of function 'down' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (!conn)
               ~^~~~
   net/bluetooth/mgmt.c:7883:7: note: prefix with the address-of operator to silence this warning
           if (!conn)
                ^
                &
>> net/bluetooth/mgmt.c:7884:20: error: expected ';' after return statement
                   return -ECANCELED
                                    ^
                                    ;
>> net/bluetooth/mgmt.c:7960:13: error: use of undeclared identifier 'params'; did you mean 'param'?
                   if (!i && params == 1) {
                             ^~~~~~
                             param
   net/bluetooth/mgmt.c:7926:27: note: 'param' declared here
                   struct mgmt_conn_param *param = &cp->params[i];
                                           ^
   net/bluetooth/mgmt.c:7986:14: error: use of undeclared identifier 'params'
                                                          params->addr.bdaddr,
                                                          ^
>> net/bluetooth/mgmt.c:7992:15: error: no member named 'le_supervision_timeout' in 'struct hci_conn'; did you mean 'le_supv_timeout'?
                                conn->le_supervision_timeout != timeout))
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      le_supv_timeout
   include/net/bluetooth/hci_core.h:712:9: note: 'le_supv_timeout' declared here
           __u16           le_supv_timeout;
                           ^
>> net/bluetooth/mgmt.c:7994:10: error: use of undeclared identifier 'hci_params'; did you mean 'hci_param'?
                                                      hci_params, NULL);
                                                      ^~~~~~~~~~
                                                      hci_param
   net/bluetooth/mgmt.c:7927:27: note: 'hci_param' declared here
                   struct hci_conn_params *hci_param;
                                           ^
>> net/bluetooth/mgmt.c:7999:2: error: expected parameter declarator
           hci_dev_unlock(hdev);
           ^
   include/net/bluetooth/hci_core.h:1615:40: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                                ^
>> net/bluetooth/mgmt.c:7999:2: error: expected ')'
   include/net/bluetooth/hci_core.h:1615:40: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                                ^
   net/bluetooth/mgmt.c:7999:2: note: to match this '('
   include/net/bluetooth/hci_core.h:1615:39: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                               ^
>> net/bluetooth/mgmt.c:7999:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           hci_dev_unlock(hdev);
           ^
   include/net/bluetooth/hci_core.h:1615:27: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                   ^
>> net/bluetooth/mgmt.c:7999:2: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
   include/net/bluetooth/hci_core.h:1615:39: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                               ^
>> net/bluetooth/mgmt.c:7999:2: error: conflicting types for 'mutex_unlock'
   include/net/bluetooth/hci_core.h:1615:27: note: expanded from macro 'hci_dev_unlock'
   #define hci_dev_unlock(d)       mutex_unlock(&d->lock)
                                   ^
   include/linux/mutex.h:165:13: note: previous declaration is here
   extern void mutex_unlock(struct mutex *lock);
               ^
>> net/bluetooth/mgmt.c:8001:2: error: expected identifier or '('
           return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM, 0,
           ^
>> net/bluetooth/mgmt.c:8003:1: error: extraneous closing brace ('}')
   }
   ^
   1 warning and 15 errors generated.
--
>> net/bluetooth/hci_sync.c:6716:5: warning: no previous prototype for function 'hci_le_conn_update_sync' [-Wmissing-prototypes]
   int hci_le_conn_update_sync(struct hci_dev *hdev, struct hci_conn *conn,
       ^
   net/bluetooth/hci_sync.c:6716:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int hci_le_conn_update_sync(struct hci_dev *hdev, struct hci_conn *conn,
   ^
   static 
   1 warning generated.


vim +/conn +7881 net/bluetooth/mgmt.c

  7876	
  7877	static int conn_update_sync(struct hci_dev *hdev, void *data)
  7878	{
  7879		struct hci_conn_params *params = data;
  7880	
> 7881		conn = hci_conn_hash_lookup_le(hdev, params->addr.bdaddr,
  7882					       params->addr_type);
> 7883		if (!conn)
> 7884			return -ECANCELED
  7885	
  7886		return hci_le_conn_update_sync(hdev, conn, params);
  7887	}
  7888	
  7889	static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
  7890				   u16 len)
  7891	{
  7892		struct mgmt_cp_load_conn_param *cp = data;
  7893		const u16 max_param_count = ((U16_MAX - sizeof(*cp)) /
  7894					     sizeof(struct mgmt_conn_param));
  7895		u16 param_count, expected_len;
  7896		int i;
  7897	
  7898		if (!lmp_le_capable(hdev))
  7899			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
  7900					       MGMT_STATUS_NOT_SUPPORTED);
  7901	
  7902		param_count = __le16_to_cpu(cp->param_count);
  7903		if (param_count > max_param_count) {
  7904			bt_dev_err(hdev, "load_conn_param: too big param_count value %u",
  7905				   param_count);
  7906			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
  7907					       MGMT_STATUS_INVALID_PARAMS);
  7908		}
  7909	
  7910		expected_len = struct_size(cp, params, param_count);
  7911		if (expected_len != len) {
  7912			bt_dev_err(hdev, "load_conn_param: expected %u bytes, got %u bytes",
  7913				   expected_len, len);
  7914			return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
  7915					       MGMT_STATUS_INVALID_PARAMS);
  7916		}
  7917	
  7918		bt_dev_dbg(hdev, "param_count %u", param_count);
  7919	
  7920		hci_dev_lock(hdev);
  7921	
  7922		if (i > 1)
  7923			hci_conn_params_clear_disabled(hdev);
  7924	
  7925		for (i = 0; i < param_count; i++) {
  7926			struct mgmt_conn_param *param = &cp->params[i];
  7927			struct hci_conn_params *hci_param;
  7928			u16 min, max, latency, timeout;
  7929			u8 addr_type;
  7930			bool update;
  7931	
  7932			bt_dev_dbg(hdev, "Adding %pMR (type %u)", &param->addr.bdaddr,
  7933				   param->addr.type);
  7934	
  7935			if (param->addr.type == BDADDR_LE_PUBLIC) {
  7936				addr_type = ADDR_LE_DEV_PUBLIC;
  7937			} else if (param->addr.type == BDADDR_LE_RANDOM) {
  7938				addr_type = ADDR_LE_DEV_RANDOM;
  7939			} else {
  7940				bt_dev_err(hdev, "ignoring invalid connection parameters");
  7941				continue;
  7942			}
  7943	
  7944			min = le16_to_cpu(param->min_interval);
  7945			max = le16_to_cpu(param->max_interval);
  7946			latency = le16_to_cpu(param->latency);
  7947			timeout = le16_to_cpu(param->timeout);
  7948	
  7949			bt_dev_dbg(hdev, "min 0x%04x max 0x%04x latency 0x%04x timeout 0x%04x",
  7950				   min, max, latency, timeout);
  7951	
  7952			if (hci_check_conn_params(min, max, latency, timeout) < 0) {
  7953				bt_dev_err(hdev, "ignoring invalid connection parameters");
  7954				continue;
  7955			}
  7956	
  7957			/* Detect when the loading is for an existing parameter then
  7958			 * attempt to trigger the connection update procedure.
  7959			 */
> 7960			if (!i && params == 1) {
  7961				hci_param = hci_conn_params_lookup(hdev,
  7962								   &param->addr.bdaddr,
  7963								   addr_type);
  7964				if (hci_param)
  7965					update = true;
  7966				else
  7967					hci_conn_params_clear_disabled(hdev);
  7968			}
  7969	
  7970			hci_param = hci_conn_params_add(hdev, &param->addr.bdaddr,
  7971							addr_type);
  7972			if (!hci_param) {
  7973				bt_dev_err(hdev, "failed to add connection parameters");
  7974				continue;
  7975			}
  7976	
  7977			hci_param->conn_min_interval = min;
  7978			hci_param->conn_max_interval = max;
  7979			hci_param->conn_latency = latency;
  7980			hci_param->supervision_timeout = timeout;
  7981	
  7982			if (update) {
  7983				struct hci_conn *conn;
  7984	
  7985				conn = hci_conn_hash_lookup_le(hdev,
  7986							       params->addr.bdaddr,
  7987							       addr_type);
  7988				if (conn && conn->role == HCI_ROLE_MASTER &&
  7989				    (conn->le_conn_min_interval != min ||
  7990				     conn->le_conn_max_interval != max ||
  7991				     conn->le_conn_latency != latency ||
> 7992				     conn->le_supervision_timeout != timeout))
  7993					hci_cmd_sync_queue(hdev, conn_update_sync,
> 7994							   hci_params, NULL);
  7995				}
  7996			}
  7997		}
  7998	
> 7999		hci_dev_unlock(hdev);
  8000	
> 8001		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM, 0,
  8002					 NULL, 0);
> 8003	}
  8004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
