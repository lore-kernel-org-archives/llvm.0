Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6E258EFB;
	Thu, 27 Nov 2025 05:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764222579; cv=none; b=FrgcMbznqWJmC5bbFfgS863ka2pEP3f5OyvESRNGgAafGMckwJMMwlUDKwkoT9NmvV5I+wd7nZ3smoOThY/KwJgvlxnisl7J5hya4ReO9sEC3pxqOsI8zE7Q6WHP29XsBUECnR5Nrn6/KU/OR8ipV+/SAqcL3CNgVhHQyBfT9gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764222579; c=relaxed/simple;
	bh=7v+GcXV/QHiG97BP+9aiF8SnEWtO2/cANeVAc/qb0nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eovUd5xntJkhkRuxIHlfld6rAbQgMbed0Wnvb4X8KJNIYI6quwvz/u2pYjEDYgOZQiGg644T7zK6qKeLYHIsIoEYmz9EmtQWIiQcAqNOA83TUBOWHGQujiKToYQP98x1loP8mOqbahbKNK8FwH/CrOiASW/EuoTQ7jwjLQCFnw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSi/rvJ/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSi/rvJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764222578; x=1795758578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v+GcXV/QHiG97BP+9aiF8SnEWtO2/cANeVAc/qb0nE=;
  b=NSi/rvJ/BFnUgrcaOXGC9oQCgTcXpQcdWTUm/deNGIhGiHV0KdMFfNtg
   UnMhpZmA/LxB5bGhugyH1NnbFNhjJbtH/ZEsnZG7loI4VUJe1Un4ApktU
   qpzXr6Lt7onN7RcdKq4Ao+A/wfDXyUqWpSJf9IFGLudrDQpHbg5P5HmzK
   pIA4ufvW2BAo7fjEyVxmWxNKRi18NYxyE/4czLJYSli/EwZEXmJciaQMH
   /4myGg6L5s2Yv+77Q2U0U6Cojn4I7x6JG86tNuge2+3mMXgRbeDRhDGpx
   SwLr7lkel8gF045FXI5WOxYKNPLYqX2A2Yw0fbYz3NsIAmdVnfu8nEUmN
   w==;
X-CSE-ConnectionGUID: EccsN9kFQHKK520j+A6pwg==
X-CSE-MsgGUID: r+LNGGdCT02V3sNlyUALSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69887251"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="69887251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 21:49:37 -0800
X-CSE-ConnectionGUID: XRW9NcwTRBOTPuYeD3TKDw==
X-CSE-MsgGUID: zkw4HFNfRLSuvozgB/ao5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197292586"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2025 21:49:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOUsm-000000001cz-3Bbv;
	Thu, 27 Nov 2025 05:49:32 +0000
Date: Thu, 27 Nov 2025 06:48:36 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring7 3/3] net/core/netdev-genl.c:1202:7:
 warning: address of function 'dst_dev' will always evaluate to 'true'
Message-ID: <202511270605.lOWxsa6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring7
head:   b0485a3422c57df789879678c6373976fb2bd3e0
commit: b0485a3422c57df789879678c6373976fb2bd3e0 [3/3] foo
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251127/202511270605.lOWxsa6u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270605.lOWxsa6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270605.lOWxsa6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netdev-genl.c:1143:30: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1143 |         if (nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]) !=
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     NETDEV_A_QSTATS_QUEUE_TYPE
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
   net/core/netdev-genl.c:1149:2: error: use of undeclared identifier 'ifindex'
    1149 |         ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |         ^
   net/core/netdev-genl.c:1149:36: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1149 |         ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1151:6: error: array type 'struct nlattr *[4]' is not assignable
    1151 |         ltb = info->attrs[NETDEV_A_QUEUE_LEASE];
         |         ~~~ ^
   net/core/netdev-genl.c:1164:2: error: use of undeclared identifier 'ifindex_lease'
    1164 |         ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
         |         ^
   net/core/netdev-genl.c:1164:30: error: passing 'struct nlattr' to parameter of incompatible type 'const struct nlattr *'; take the address with &
    1164 |         ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     &
   include/net/netlink.h:1732:52: note: passing argument to parameter 'nla' here
    1732 | static inline u32 nla_get_u32(const struct nlattr *nla)
         |                                                    ^
   net/core/netdev-genl.c:1166:6: error: array type 'struct nlattr *[4]' is not assignable
    1166 |         qtb = info->attrs[NETDEV_A_LEASE_QUEUE];
         |         ~~~ ^
   net/core/netdev-genl.c:1174:18: error: use of undeclared identifier 'tb'
    1174 |         if (nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {
         |                         ^
   net/core/netdev-genl.c:1181:6: error: use of undeclared identifier 'dst_ifidx'
    1181 |         if (dst_ifidx == src_ifidx) {
         |             ^
   net/core/netdev-genl.c:1181:19: error: use of undeclared identifier 'src_ifidx'
    1181 |         if (dst_ifidx == src_ifidx) {
         |                          ^
   net/core/netdev-genl.c:1201:58: error: use of undeclared identifier 'dst_ifidx'
    1201 |         dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
         |                                                                 ^
>> net/core/netdev-genl.c:1202:7: warning: address of function 'dst_dev' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1202 |         if (!dst_dev) {
         |             ~^~~~~~~
   net/core/netdev-genl.c:1202:7: note: prefix with the address-of operator to silence this warning
    1202 |         if (!dst_dev) {
         |              ^
         |              &
   net/core/netdev-genl.c:1206:13: error: member reference base type 'struct net_device *(const struct dst_entry *)' is not a structure or union
    1206 |         if (dst_dev->dev.parent) {
         |             ~~~~~~~^ ~~~
   net/core/netdev-genl.c:1212:14: error: member reference base type 'struct net_device *(const struct dst_entry *)' is not a structure or union
    1212 |         if (!dst_dev->queue_mgmt_ops ||
         |              ~~~~~~~^ ~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1213:14: error: member reference base type 'struct net_device *(const struct dst_entry *)' is not a structure or union
    1213 |             !dst_dev->queue_mgmt_ops->ndo_queue_create) {
         |              ~~~~~~~^ ~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1219:13: error: member reference base type 'struct net_device *(const struct dst_entry *)' is not a structure or union
    1219 |         if (dst_dev->real_num_rx_queues < 1) {
         |             ~~~~~~~^ ~~~~~~~~~~~~~~~~~~
   net/core/netdev-genl.c:1226:2: error: use of undeclared identifier 'src_dev'
    1226 |         src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
         |         ^
   net/core/netdev-genl.c:1226:53: error: use of undeclared identifier 'src_ifidx'
    1226 |         src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
         |                                                            ^
   net/core/netdev-genl.c:1228:7: error: use of undeclared identifier 'src_dev'
    1228 |         if (!src_dev) {
         |              ^
   net/core/netdev-genl.c:1232:7: error: use of undeclared identifier 'src_dev'
    1232 |         if (!src_dev->dev.parent) {
         |              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +1202 net/core/netdev-genl.c

8802087d20c0e1 Stanislav Fomichev 2025-05-08  1122  
d7ab39540fa2d0 Daniel Borkmann    2025-10-31  1123  int netdev_nl_queue_create_doit(struct sk_buff *skb, struct genl_info *info)
d7ab39540fa2d0 Daniel Borkmann    2025-10-31  1124  {
b0485a3422c57d Daniel Borkmann    2025-11-26  1125  	//struct netdev_rx_queue *src_rxq, *dst_rxq, *tmp_rxq;
b0485a3422c57d Daniel Borkmann    2025-11-26  1126  	//u32 src_ifidx, src_qid, dst_ifidx, dst_qid, q_type;
b0485a3422c57d Daniel Borkmann    2025-11-26  1127  	//struct net_device *src_dev, *dst_dev;
b0485a3422c57d Daniel Borkmann    2025-11-26  1128  
b0485a3422c57d Daniel Borkmann    2025-11-26  1129  	const int qmaxtype = ARRAY_SIZE(netdev_queue_id_nl_policy) - 1;
b0485a3422c57d Daniel Borkmann    2025-11-26  1130  	const int lmaxtype = ARRAY_SIZE(netdev_lease_nl_policy) - 1;
b0485a3422c57d Daniel Borkmann    2025-11-26  1131  	struct nlattr *qtb[ARRAY_SIZE(netdev_queue_id_nl_policy)];
b0485a3422c57d Daniel Borkmann    2025-11-26  1132  	struct nlattr *ltb[ARRAY_SIZE(netdev_lease_nl_policy)];
6218b42846f66c David Wei          2025-10-31  1133  	netdevice_tracker dev_tracker;
b0485a3422c57d Daniel Borkmann    2025-11-26  1134  	struct nlattr *attr;
6218b42846f66c David Wei          2025-10-31  1135  	struct sk_buff *rsp;
6218b42846f66c David Wei          2025-10-31  1136  	void *hdr;
b0485a3422c57d Daniel Borkmann    2025-11-26  1137  	int err;
6218b42846f66c David Wei          2025-10-31  1138  
b0485a3422c57d Daniel Borkmann    2025-11-26  1139  	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_IFINDEX) ||
b0485a3422c57d Daniel Borkmann    2025-11-26  1140  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_TYPE) ||
b0485a3422c57d Daniel Borkmann    2025-11-26  1141  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_LEASE))
b0485a3422c57d Daniel Borkmann    2025-11-26  1142  		return -EINVAL;
b0485a3422c57d Daniel Borkmann    2025-11-26  1143  	if (nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]) !=
b0485a3422c57d Daniel Borkmann    2025-11-26  1144  	    NETDEV_QUEUE_TYPE_RX) {
b0485a3422c57d Daniel Borkmann    2025-11-26  1145  		NL_SET_ERR_MSG(info->extack, "Only creation of RX queue currently supported");
b0485a3422c57d Daniel Borkmann    2025-11-26  1146  		return -EINVAL;
b0485a3422c57d Daniel Borkmann    2025-11-26  1147  	}
b0485a3422c57d Daniel Borkmann    2025-11-26  1148  
b0485a3422c57d Daniel Borkmann    2025-11-26  1149  	ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
b0485a3422c57d Daniel Borkmann    2025-11-26  1150  
b0485a3422c57d Daniel Borkmann    2025-11-26  1151  	ltb = info->attrs[NETDEV_A_QUEUE_LEASE];
b0485a3422c57d Daniel Borkmann    2025-11-26  1152  	err = nla_parse_nested(ltb, lmaxtype, attr,
b0485a3422c57d Daniel Borkmann    2025-11-26  1153  			       netdev_queue_id_nl_policy, info->extack);
b0485a3422c57d Daniel Borkmann    2025-11-26  1154  	if (err < 0)
b0485a3422c57d Daniel Borkmann    2025-11-26  1155  		return err;
b0485a3422c57d Daniel Borkmann    2025-11-26  1156  	if (NL_REQ_ATTR_CHECK(info->extack, attr, ltb, NETDEV_A_LEASE_IFINDEX) ||
b0485a3422c57d Daniel Borkmann    2025-11-26  1157  	    NL_REQ_ATTR_CHECK(info->extack, attr, ltb, NETDEV_A_LEASE_QUEUE))
b0485a3422c57d Daniel Borkmann    2025-11-26  1158  		return -EINVAL;
b0485a3422c57d Daniel Borkmann    2025-11-26  1159  	if (ltb[NETDEV_A_LEASE_NETNS_ID]) {
b0485a3422c57d Daniel Borkmann    2025-11-26  1160  		NL_SET_BAD_ATTR(info->extack, ltb[NETDEV_A_LEASE_NETNS_ID]);
6218b42846f66c David Wei          2025-10-31  1161  		return -EINVAL;
b0485a3422c57d Daniel Borkmann    2025-11-26  1162  	}
6218b42846f66c David Wei          2025-10-31  1163  
b0485a3422c57d Daniel Borkmann    2025-11-26  1164  	ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
6218b42846f66c David Wei          2025-10-31  1165  
b0485a3422c57d Daniel Borkmann    2025-11-26  1166  	qtb = info->attrs[NETDEV_A_LEASE_QUEUE];
b0485a3422c57d Daniel Borkmann    2025-11-26  1167  	err = nla_parse_nested(qtb, qmaxtype, attr,
b0485a3422c57d Daniel Borkmann    2025-11-26  1168  			       netdev_queue_id_nl_policy, info->extack);
b0485a3422c57d Daniel Borkmann    2025-11-26  1169  	if (err < 0)
b0485a3422c57d Daniel Borkmann    2025-11-26  1170  		return err;
b0485a3422c57d Daniel Borkmann    2025-11-26  1171  	if (NL_REQ_ATTR_CHECK(info->extack, attr, qtb, NETDEV_A_QUEUE_ID) ||
b0485a3422c57d Daniel Borkmann    2025-11-26  1172  	    NL_REQ_ATTR_CHECK(info->extack, attr, qtb, NETDEV_A_QUEUE_TYPE))
b0485a3422c57d Daniel Borkmann    2025-11-26  1173  		return -EINVAL;
b0485a3422c57d Daniel Borkmann    2025-11-26  1174  	if (nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {
b0485a3422c57d Daniel Borkmann    2025-11-26  1175  		NL_SET_BAD_ATTR(info->extack, qtb[NETDEV_A_QUEUE_TYPE]);
6218b42846f66c David Wei          2025-10-31  1176  		return -EINVAL;
6218b42846f66c David Wei          2025-10-31  1177  	}
b0485a3422c57d Daniel Borkmann    2025-11-26  1178  
b0485a3422c57d Daniel Borkmann    2025-11-26  1179  
b0485a3422c57d Daniel Borkmann    2025-11-26  1180  
6218b42846f66c David Wei          2025-10-31 @1181  	if (dst_ifidx == src_ifidx) {
6218b42846f66c David Wei          2025-10-31  1182  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1183  			       "Destination driver cannot be same as source driver");
6218b42846f66c David Wei          2025-10-31  1184  		return -EINVAL;
6218b42846f66c David Wei          2025-10-31  1185  	}
6218b42846f66c David Wei          2025-10-31  1186  
6218b42846f66c David Wei          2025-10-31  1187  	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
6218b42846f66c David Wei          2025-10-31  1188  	if (!rsp)
6218b42846f66c David Wei          2025-10-31  1189  		return -ENOMEM;
6218b42846f66c David Wei          2025-10-31  1190  
6218b42846f66c David Wei          2025-10-31  1191  	hdr = genlmsg_iput(rsp, info);
6218b42846f66c David Wei          2025-10-31  1192  	if (!hdr) {
6218b42846f66c David Wei          2025-10-31  1193  		err = -EMSGSIZE;
6218b42846f66c David Wei          2025-10-31  1194  		goto err_genlmsg_free;
6218b42846f66c David Wei          2025-10-31  1195  	}
6218b42846f66c David Wei          2025-10-31  1196  
6218b42846f66c David Wei          2025-10-31  1197  	/* Locking order is always from the virtual to the physical device
6218b42846f66c David Wei          2025-10-31  1198  	 * since this is also the same order when applications open the
6218b42846f66c David Wei          2025-10-31  1199  	 * memory provider later on.
6218b42846f66c David Wei          2025-10-31  1200  	 */
6218b42846f66c David Wei          2025-10-31  1201  	dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
6218b42846f66c David Wei          2025-10-31 @1202  	if (!dst_dev) {
6218b42846f66c David Wei          2025-10-31  1203  		err = -ENODEV;
6218b42846f66c David Wei          2025-10-31  1204  		goto err_genlmsg_free;
6218b42846f66c David Wei          2025-10-31  1205  	}
6218b42846f66c David Wei          2025-10-31  1206  	if (dst_dev->dev.parent) {
6218b42846f66c David Wei          2025-10-31  1207  		err = -EINVAL;
6218b42846f66c David Wei          2025-10-31  1208  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1209  			       "Destination device is not a virtual device");
6218b42846f66c David Wei          2025-10-31  1210  		goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1211  	}
6218b42846f66c David Wei          2025-10-31  1212  	if (!dst_dev->queue_mgmt_ops ||
6218b42846f66c David Wei          2025-10-31  1213  	    !dst_dev->queue_mgmt_ops->ndo_queue_create) {
6218b42846f66c David Wei          2025-10-31  1214  		err = -EOPNOTSUPP;
6218b42846f66c David Wei          2025-10-31  1215  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1216  			       "Destination driver does not support queue management operations");
6218b42846f66c David Wei          2025-10-31  1217  		goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1218  	}
6218b42846f66c David Wei          2025-10-31  1219  	if (dst_dev->real_num_rx_queues < 1) {
6218b42846f66c David Wei          2025-10-31  1220  		err = -EINVAL;
6218b42846f66c David Wei          2025-10-31  1221  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1222  			       "Destination device must have at least one real RX queue");
6218b42846f66c David Wei          2025-10-31  1223  		goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1224  	}
6218b42846f66c David Wei          2025-10-31  1225  
6218b42846f66c David Wei          2025-10-31  1226  	src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
6218b42846f66c David Wei          2025-10-31  1227  				      &dev_tracker, GFP_KERNEL);
6218b42846f66c David Wei          2025-10-31  1228  	if (!src_dev) {
6218b42846f66c David Wei          2025-10-31  1229  		err = -ENODEV;
6218b42846f66c David Wei          2025-10-31  1230  		goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1231  	}
6218b42846f66c David Wei          2025-10-31  1232  	if (!src_dev->dev.parent) {
6218b42846f66c David Wei          2025-10-31  1233  		err = -EINVAL;
6218b42846f66c David Wei          2025-10-31  1234  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1235  			       "Source device is a virtual device");
6218b42846f66c David Wei          2025-10-31  1236  		goto err_unlock_dst_dev_src_dev_put;
6218b42846f66c David Wei          2025-10-31  1237  	}
6218b42846f66c David Wei          2025-10-31  1238  	if (!netif_device_present(src_dev)) {
6218b42846f66c David Wei          2025-10-31  1239  		err = -ENODEV;
6218b42846f66c David Wei          2025-10-31  1240  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1241  			       "Source device has been removed from the system");
6218b42846f66c David Wei          2025-10-31  1242  		goto err_unlock_dst_dev_src_dev_put;
6218b42846f66c David Wei          2025-10-31  1243  	}
6218b42846f66c David Wei          2025-10-31  1244  	if (!src_dev->queue_mgmt_ops) {
6218b42846f66c David Wei          2025-10-31  1245  		err = -EOPNOTSUPP;
6218b42846f66c David Wei          2025-10-31  1246  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1247  			       "Source driver does not support queue management operations");
6218b42846f66c David Wei          2025-10-31  1248  		goto err_unlock_dst_dev_src_dev_put;
6218b42846f66c David Wei          2025-10-31  1249  	}
6218b42846f66c David Wei          2025-10-31  1250  
6218b42846f66c David Wei          2025-10-31  1251  	src_dev = netdev_put_lock(src_dev, &dev_tracker);
6218b42846f66c David Wei          2025-10-31  1252  	if (!src_dev) {
6218b42846f66c David Wei          2025-10-31  1253  		err = -ENODEV;
6218b42846f66c David Wei          2025-10-31  1254  		goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1255  	}
6218b42846f66c David Wei          2025-10-31  1256  	if (src_qid >= src_dev->real_num_rx_queues) {
6218b42846f66c David Wei          2025-10-31  1257  		err = -ERANGE;
6218b42846f66c David Wei          2025-10-31  1258  		NL_SET_BAD_ATTR(info->extack,
6218b42846f66c David Wei          2025-10-31  1259  				info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
6218b42846f66c David Wei          2025-10-31  1260  		goto err_unlock_src_dev;
6218b42846f66c David Wei          2025-10-31  1261  	}
6218b42846f66c David Wei          2025-10-31  1262  
6218b42846f66c David Wei          2025-10-31  1263  	src_rxq = __netif_get_rx_queue(src_dev, src_qid);
6218b42846f66c David Wei          2025-10-31  1264  	if (src_rxq->peer) {
6218b42846f66c David Wei          2025-10-31  1265  		err = -EBUSY;
6218b42846f66c David Wei          2025-10-31  1266  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1267  			       "Source device queue is already bound");
6218b42846f66c David Wei          2025-10-31  1268  		goto err_unlock_src_dev;
6218b42846f66c David Wei          2025-10-31  1269  	}
6218b42846f66c David Wei          2025-10-31  1270  
6218b42846f66c David Wei          2025-10-31  1271  	tmp_rxq = __netif_get_rx_queue(dst_dev, dst_dev->real_num_rx_queues - 1);
6218b42846f66c David Wei          2025-10-31  1272  	if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
6218b42846f66c David Wei          2025-10-31  1273  		err = -EOPNOTSUPP;
6218b42846f66c David Wei          2025-10-31  1274  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1275  			       "Binding multiple queues from different source devices not supported");
6218b42846f66c David Wei          2025-10-31  1276  		goto err_unlock_src_dev;
6218b42846f66c David Wei          2025-10-31  1277  	}
6218b42846f66c David Wei          2025-10-31  1278  
6218b42846f66c David Wei          2025-10-31  1279  	err = dst_dev->queue_mgmt_ops->ndo_queue_create(dst_dev, &dst_qid);
6218b42846f66c David Wei          2025-10-31  1280  	if (err) {
6218b42846f66c David Wei          2025-10-31  1281  		NL_SET_ERR_MSG(info->extack,
6218b42846f66c David Wei          2025-10-31  1282  			       "Destination device is unable to create a new queue");
6218b42846f66c David Wei          2025-10-31  1283  		goto err_unlock_src_dev;
6218b42846f66c David Wei          2025-10-31  1284  	}
6218b42846f66c David Wei          2025-10-31  1285  
6218b42846f66c David Wei          2025-10-31  1286  	dst_rxq = __netif_get_rx_queue(dst_dev, dst_qid);
6218b42846f66c David Wei          2025-10-31  1287  	netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
6218b42846f66c David Wei          2025-10-31  1288  
6218b42846f66c David Wei          2025-10-31  1289  	nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
6218b42846f66c David Wei          2025-10-31  1290  	genlmsg_end(rsp, hdr);
6218b42846f66c David Wei          2025-10-31  1291  
6218b42846f66c David Wei          2025-10-31  1292  	netdev_unlock(src_dev);
6218b42846f66c David Wei          2025-10-31  1293  	netdev_unlock(dst_dev);
6218b42846f66c David Wei          2025-10-31  1294  
6218b42846f66c David Wei          2025-10-31  1295  	return genlmsg_reply(rsp, info);
6218b42846f66c David Wei          2025-10-31  1296  
6218b42846f66c David Wei          2025-10-31  1297  err_unlock_dst_dev_src_dev_put:
6218b42846f66c David Wei          2025-10-31  1298  	netdev_put(src_dev, &dev_tracker);
6218b42846f66c David Wei          2025-10-31  1299  	goto err_unlock_dst_dev;
6218b42846f66c David Wei          2025-10-31  1300  err_unlock_src_dev:
6218b42846f66c David Wei          2025-10-31  1301  	netdev_unlock(src_dev);
6218b42846f66c David Wei          2025-10-31  1302  err_unlock_dst_dev:
6218b42846f66c David Wei          2025-10-31  1303  	netdev_unlock(dst_dev);
6218b42846f66c David Wei          2025-10-31  1304  err_genlmsg_free:
6218b42846f66c David Wei          2025-10-31  1305  	nlmsg_free(rsp);
6218b42846f66c David Wei          2025-10-31  1306  	return err;
d7ab39540fa2d0 Daniel Borkmann    2025-10-31  1307  }
d7ab39540fa2d0 Daniel Borkmann    2025-10-31  1308  

:::::: The code at line 1202 was first introduced by commit
:::::: 6218b42846f66ccd2de5a208da7fc61390e7d15c net: Implement netdev_nl_queue_create_doit

:::::: TO: David Wei <dw@davidwei.uk>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
