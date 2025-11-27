Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF01319860;
	Thu, 27 Nov 2025 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228221; cv=none; b=n4q4T8BWNsbA+ko8Is4rTQA+krgmuLf4cb9D3feOawbqM+lCtwMHi2uT4/cdlmzpHV6E9jbXTrfXveAIG2ADTkEI158iuXC37pqKZgaOtZM557BE27s6WyaEGteOTxoI0s4OpbiGzap5DqABSxZ4ZmnVyyMyO5wL9iKflROu0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228221; c=relaxed/simple;
	bh=CWJpvD81htkYAKE+CLKcdyYRnveIIHJb3WiVrdNMmNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aw9VSy0BxhETkTXcJ13u8sFXPFxg5dlMR8+VP7vy+h8Z2L/otDT0TCKzLNvw+8594gFPYzpz4uZ7rrFPBJqMcbYcjRkTkTUvwZ5LsjugKrCqMBbihbfmhfTRsbZaydkGBYuIB8O2lkQ5EHm8efZQaw9SDEOeUfMP8r0mBjccxds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDdojZ2s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDdojZ2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764228219; x=1795764219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWJpvD81htkYAKE+CLKcdyYRnveIIHJb3WiVrdNMmNE=;
  b=KDdojZ2sPmveWgiqplVh69j0cOtmmb3Gk36vgyeXEv3wnNUzb1bHwpKr
   szzoEyD+04vd9Rb54w4gK2H9szJi++6Qr1HO6T+F9jzEFTPaDQ4pRiUdW
   rr2VO7E+q/zBWF5JQDGgszqVjSx2t9YUrQcXLBXaSb1aQio65X5OB9dcV
   3HuLrmPlztXR2FmoeO24KZbDXr3hzBpGsen/LMEQMpC9lm7SfT4gm54x/
   qWgU5d+Ph+xNuHIcFSOKDTpwlfVcx46CiaXl2BhU17MPC5SSsOoAOiuWJ
   AVx5xBBaE+2UX03s2eBWGKtukXu/kX5hbqt9nfzXMf1iB+GjBDLh0zTAR
   g==;
X-CSE-ConnectionGUID: nPf7/GGqQFe/Upm+/O1E2g==
X-CSE-MsgGUID: 79WNHG2pSqa0x3jbptmv3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68863696"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="68863696"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 23:23:38 -0800
X-CSE-ConnectionGUID: d4NaVSK6QIGmn0Y+X5Stew==
X-CSE-MsgGUID: K+73votSQKeE5MbgUuJVew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197316929"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2025 23:23:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOWLl-000000001ej-3zp6;
	Thu, 27 Nov 2025 07:23:33 +0000
Date: Thu, 27 Nov 2025 08:23:20 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring7 3/3] net/core/netdev-genl.c:1149:2:
 error: use of undeclared identifier 'ifindex'
Message-ID: <202511270850.haY5QS5X-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251127/202511270850.haY5QS5X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270850.haY5QS5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270850.haY5QS5X-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/netdev-genl.c:1143:30: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1143 |         if (nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]) !=
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     NETDEV_A_QSTATS_QUEUE_TYPE
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
>> net/core/netdev-genl.c:1149:2: error: use of undeclared identifier 'ifindex'
    1149 |         ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |         ^
   net/core/netdev-genl.c:1149:36: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1149 |         ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
>> net/core/netdev-genl.c:1151:6: error: array type 'struct nlattr *[4]' is not assignable
    1151 |         ltb = info->attrs[NETDEV_A_QUEUE_LEASE];
         |         ~~~ ^
>> net/core/netdev-genl.c:1164:2: error: use of undeclared identifier 'ifindex_lease'
    1164 |         ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
         |         ^
>> net/core/netdev-genl.c:1164:30: error: passing 'struct nlattr' to parameter of incompatible type 'const struct nlattr *'; take the address with &
    1164 |         ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     &
   include/net/netlink.h:1732:52: note: passing argument to parameter 'nla' here
    1732 | static inline u32 nla_get_u32(const struct nlattr *nla)
         |                                                    ^
   net/core/netdev-genl.c:1166:6: error: array type 'struct nlattr *[4]' is not assignable
    1166 |         qtb = info->attrs[NETDEV_A_LEASE_QUEUE];
         |         ~~~ ^
>> net/core/netdev-genl.c:1174:18: error: use of undeclared identifier 'tb'
    1174 |         if (nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {
         |                         ^
>> net/core/netdev-genl.c:1181:6: error: use of undeclared identifier 'dst_ifidx'
    1181 |         if (dst_ifidx == src_ifidx) {
         |             ^
>> net/core/netdev-genl.c:1181:19: error: use of undeclared identifier 'src_ifidx'
    1181 |         if (dst_ifidx == src_ifidx) {
         |                          ^
   net/core/netdev-genl.c:1201:58: error: use of undeclared identifier 'dst_ifidx'
    1201 |         dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
         |                                                                 ^
   net/core/netdev-genl.c:1202:7: warning: address of function 'dst_dev' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1202 |         if (!dst_dev) {
         |             ~^~~~~~~
   net/core/netdev-genl.c:1202:7: note: prefix with the address-of operator to silence this warning
    1202 |         if (!dst_dev) {
         |              ^
         |              &
>> net/core/netdev-genl.c:1206:13: error: member reference base type 'struct net_device *(const struct dst_entry *)' is not a structure or union
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
>> net/core/netdev-genl.c:1226:2: error: use of undeclared identifier 'src_dev'
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


vim +/ifindex +1149 net/core/netdev-genl.c

  1122	
  1123	int netdev_nl_queue_create_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		//struct netdev_rx_queue *src_rxq, *dst_rxq, *tmp_rxq;
  1126		//u32 src_ifidx, src_qid, dst_ifidx, dst_qid, q_type;
  1127		//struct net_device *src_dev, *dst_dev;
  1128	
  1129		const int qmaxtype = ARRAY_SIZE(netdev_queue_id_nl_policy) - 1;
  1130		const int lmaxtype = ARRAY_SIZE(netdev_lease_nl_policy) - 1;
  1131		struct nlattr *qtb[ARRAY_SIZE(netdev_queue_id_nl_policy)];
  1132		struct nlattr *ltb[ARRAY_SIZE(netdev_lease_nl_policy)];
  1133		netdevice_tracker dev_tracker;
  1134		struct nlattr *attr;
  1135		struct sk_buff *rsp;
  1136		void *hdr;
  1137		int err;
  1138	
  1139		if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_IFINDEX) ||
  1140		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_TYPE) ||
  1141		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_LEASE))
  1142			return -EINVAL;
> 1143		if (nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]) !=
  1144		    NETDEV_QUEUE_TYPE_RX) {
  1145			NL_SET_ERR_MSG(info->extack, "Only creation of RX queue currently supported");
  1146			return -EINVAL;
  1147		}
  1148	
> 1149		ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
  1150	
> 1151		ltb = info->attrs[NETDEV_A_QUEUE_LEASE];
  1152		err = nla_parse_nested(ltb, lmaxtype, attr,
  1153				       netdev_queue_id_nl_policy, info->extack);
  1154		if (err < 0)
  1155			return err;
  1156		if (NL_REQ_ATTR_CHECK(info->extack, attr, ltb, NETDEV_A_LEASE_IFINDEX) ||
  1157		    NL_REQ_ATTR_CHECK(info->extack, attr, ltb, NETDEV_A_LEASE_QUEUE))
  1158			return -EINVAL;
  1159		if (ltb[NETDEV_A_LEASE_NETNS_ID]) {
  1160			NL_SET_BAD_ATTR(info->extack, ltb[NETDEV_A_LEASE_NETNS_ID]);
  1161			return -EINVAL;
  1162		}
  1163	
> 1164		ifindex_lease = nla_get_u32(attr[NETDEV_A_LEASE_IFINDEX]);
  1165	
> 1166		qtb = info->attrs[NETDEV_A_LEASE_QUEUE];
  1167		err = nla_parse_nested(qtb, qmaxtype, attr,
  1168				       netdev_queue_id_nl_policy, info->extack);
  1169		if (err < 0)
  1170			return err;
  1171		if (NL_REQ_ATTR_CHECK(info->extack, attr, qtb, NETDEV_A_QUEUE_ID) ||
  1172		    NL_REQ_ATTR_CHECK(info->extack, attr, qtb, NETDEV_A_QUEUE_TYPE))
  1173			return -EINVAL;
> 1174		if (nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {
  1175			NL_SET_BAD_ATTR(info->extack, qtb[NETDEV_A_QUEUE_TYPE]);
  1176			return -EINVAL;
  1177		}
  1178	
  1179	
  1180	
> 1181		if (dst_ifidx == src_ifidx) {
  1182			NL_SET_ERR_MSG(info->extack,
  1183				       "Destination driver cannot be same as source driver");
  1184			return -EINVAL;
  1185		}
  1186	
  1187		rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
  1188		if (!rsp)
  1189			return -ENOMEM;
  1190	
  1191		hdr = genlmsg_iput(rsp, info);
  1192		if (!hdr) {
  1193			err = -EMSGSIZE;
  1194			goto err_genlmsg_free;
  1195		}
  1196	
  1197		/* Locking order is always from the virtual to the physical device
  1198		 * since this is also the same order when applications open the
  1199		 * memory provider later on.
  1200		 */
  1201		dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
> 1202		if (!dst_dev) {
  1203			err = -ENODEV;
  1204			goto err_genlmsg_free;
  1205		}
> 1206		if (dst_dev->dev.parent) {
  1207			err = -EINVAL;
  1208			NL_SET_ERR_MSG(info->extack,
  1209				       "Destination device is not a virtual device");
  1210			goto err_unlock_dst_dev;
  1211		}
> 1212		if (!dst_dev->queue_mgmt_ops ||
  1213		    !dst_dev->queue_mgmt_ops->ndo_queue_create) {
  1214			err = -EOPNOTSUPP;
  1215			NL_SET_ERR_MSG(info->extack,
  1216				       "Destination driver does not support queue management operations");
  1217			goto err_unlock_dst_dev;
  1218		}
  1219		if (dst_dev->real_num_rx_queues < 1) {
  1220			err = -EINVAL;
  1221			NL_SET_ERR_MSG(info->extack,
  1222				       "Destination device must have at least one real RX queue");
  1223			goto err_unlock_dst_dev;
  1224		}
  1225	
> 1226		src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
  1227					      &dev_tracker, GFP_KERNEL);
  1228		if (!src_dev) {
  1229			err = -ENODEV;
  1230			goto err_unlock_dst_dev;
  1231		}
  1232		if (!src_dev->dev.parent) {
  1233			err = -EINVAL;
  1234			NL_SET_ERR_MSG(info->extack,
  1235				       "Source device is a virtual device");
  1236			goto err_unlock_dst_dev_src_dev_put;
  1237		}
  1238		if (!netif_device_present(src_dev)) {
  1239			err = -ENODEV;
  1240			NL_SET_ERR_MSG(info->extack,
  1241				       "Source device has been removed from the system");
  1242			goto err_unlock_dst_dev_src_dev_put;
  1243		}
  1244		if (!src_dev->queue_mgmt_ops) {
  1245			err = -EOPNOTSUPP;
  1246			NL_SET_ERR_MSG(info->extack,
  1247				       "Source driver does not support queue management operations");
  1248			goto err_unlock_dst_dev_src_dev_put;
  1249		}
  1250	
  1251		src_dev = netdev_put_lock(src_dev, &dev_tracker);
  1252		if (!src_dev) {
  1253			err = -ENODEV;
  1254			goto err_unlock_dst_dev;
  1255		}
  1256		if (src_qid >= src_dev->real_num_rx_queues) {
  1257			err = -ERANGE;
  1258			NL_SET_BAD_ATTR(info->extack,
  1259					info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
  1260			goto err_unlock_src_dev;
  1261		}
  1262	
  1263		src_rxq = __netif_get_rx_queue(src_dev, src_qid);
  1264		if (src_rxq->peer) {
  1265			err = -EBUSY;
  1266			NL_SET_ERR_MSG(info->extack,
  1267				       "Source device queue is already bound");
  1268			goto err_unlock_src_dev;
  1269		}
  1270	
  1271		tmp_rxq = __netif_get_rx_queue(dst_dev, dst_dev->real_num_rx_queues - 1);
  1272		if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
  1273			err = -EOPNOTSUPP;
  1274			NL_SET_ERR_MSG(info->extack,
  1275				       "Binding multiple queues from different source devices not supported");
  1276			goto err_unlock_src_dev;
  1277		}
  1278	
  1279		err = dst_dev->queue_mgmt_ops->ndo_queue_create(dst_dev, &dst_qid);
  1280		if (err) {
  1281			NL_SET_ERR_MSG(info->extack,
  1282				       "Destination device is unable to create a new queue");
  1283			goto err_unlock_src_dev;
  1284		}
  1285	
  1286		dst_rxq = __netif_get_rx_queue(dst_dev, dst_qid);
  1287		netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
  1288	
  1289		nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
  1290		genlmsg_end(rsp, hdr);
  1291	
  1292		netdev_unlock(src_dev);
  1293		netdev_unlock(dst_dev);
  1294	
  1295		return genlmsg_reply(rsp, info);
  1296	
  1297	err_unlock_dst_dev_src_dev_put:
  1298		netdev_put(src_dev, &dev_tracker);
  1299		goto err_unlock_dst_dev;
  1300	err_unlock_src_dev:
  1301		netdev_unlock(src_dev);
  1302	err_unlock_dst_dev:
  1303		netdev_unlock(dst_dev);
  1304	err_genlmsg_free:
  1305		nlmsg_free(rsp);
  1306		return err;
  1307	}
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
