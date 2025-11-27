Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9AA2D8DC3;
	Thu, 27 Nov 2025 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764218746; cv=none; b=D+zyI5Trq+Ixbi3MloPJXXKHLmXihj+vzEkFcfC4WSOuG7vThSbUoONYEdynFaUZLwX13ysM0uCHBx2JiSv0h/ADou1IsgNfhQ3hVQhHISYVI9BBEihCCkuFPSgf5PEzPWLCCzl/dIjCIQNAaO3h0PSIYeYXYzPOEd0NMpd62BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764218746; c=relaxed/simple;
	bh=4e4sMz2bnqizuw+OPTIyMs0kkAhZGNAZBHr1dhXHttY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTfRYcDevgiBazVGuIB1q/IHo1G4daCODBUGIRfnpRTmLLrMeyunq5WWpBJEDJUq43a8crO8xtIOD/CpCk1AeTehU9ZLsbeadMwD3iUvuMeWncSNIAx5nposcRZSiTHO8R7xHH1L/zb294exojTtGlh6n6tQJ5vLQQ7zjCl+VUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDA7THmT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDA7THmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764218742; x=1795754742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e4sMz2bnqizuw+OPTIyMs0kkAhZGNAZBHr1dhXHttY=;
  b=WDA7THmTaNnCSuGEt1Mp6jiBVr5hiSqxfg2c8XGHbqZjEI5xyiYCZZhY
   grx7OjdnAQDJWdprw4Iw2ahIDb74A9Rw+h+dMpinrFeSwFfKXWwSOlrvg
   jtf0c4UG/5Tb5veh2wOzwE6bRmSgrAzFyyVZkLep03zRCo3kDk0fnKi9g
   MWl/btnnJQ9fHR7KWm0s1pOXwZyHffLPEk9Z+3HL0iTaUtcoCDYFeKdq6
   swYR6h7MGFirF7mfsLFAA9+C8qzo/c9lk5cBwoWorJIh1lktNqxf++N2+
   0QPqheaoXVvtRoZdJqv4/rpj6Ah/wjstpYZKT/mVBlLLQ+7j/NoKgeHK9
   Q==;
X-CSE-ConnectionGUID: OJCrIN+RSB2PaQTKWSvSiQ==
X-CSE-MsgGUID: frsmxaM/Rm+fo5663qq54Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66295429"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66295429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 20:45:36 -0800
X-CSE-ConnectionGUID: QWcRPFYTTPy85Nlx4MIpxg==
X-CSE-MsgGUID: H7yOKsQATq6Q19A1+lAvAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192786005"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 20:45:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOTsq-000000001c9-0gxr;
	Thu, 27 Nov 2025 04:45:32 +0000
Date: Thu, 27 Nov 2025 05:45:20 +0100
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring7 2/3] net/core/netdev-genl.c:1133:32:
 error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did
 you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
Message-ID: <202511270549.5KXYjtmP-lkp@intel.com>
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
commit: 6218b42846f66ccd2de5a208da7fc61390e7d15c [2/3] net: Implement netdev_nl_queue_create_doit
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251127/202511270549.5KXYjtmP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270549.5KXYjtmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270549.5KXYjtmP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/netdev-genl.c:1133:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1133 |         if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QSTATS_QUEUE_TYPE
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
>> net/core/netdev-genl.c:1134:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1134 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QUEUE_IFINDEX
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1135:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1135 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QSTATS_QUEUE_ID
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
   net/core/netdev-genl.c:1136:32: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1136 |             GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       NETDEV_A_QUEUE_IFINDEX
   include/net/genetlink.h:170:58: note: expanded from macro 'GENL_REQ_ATTR_CHECK'
     170 |         NL_REQ_ATTR_CHECK(__info->extack, NULL, __info->attrs, (attr)); \
         |                                                                 ^
   include/linux/netlink.h:201:16: note: expanded from macro 'NL_REQ_ATTR_CHECK'
     201 |         u32 __attr = (type);                                    \
         |                       ^
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1139:38: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1139 |         src_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1140:36: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1140 |         src_qid = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           NETDEV_A_QSTATS_QUEUE_ID
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
   net/core/netdev-genl.c:1141:38: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_IFINDEX'; did you mean 'NETDEV_A_QUEUE_IFINDEX'?
    1141 |         dst_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_DST_IFINDEX]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QUEUE_IFINDEX
   include/uapi/linux/netdev.h:156:2: note: 'NETDEV_A_QUEUE_IFINDEX' declared here
     156 |         NETDEV_A_QUEUE_IFINDEX,
         |         ^
   net/core/netdev-genl.c:1142:35: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_QUEUE_TYPE'; did you mean 'NETDEV_A_QSTATS_QUEUE_TYPE'?
    1142 |         q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          NETDEV_A_QSTATS_QUEUE_TYPE
   include/uapi/linux/netdev.h:170:2: note: 'NETDEV_A_QSTATS_QUEUE_TYPE' declared here
     170 |         NETDEV_A_QSTATS_QUEUE_TYPE,
         |         ^
   net/core/netdev-genl.c:1226:17: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1226 |                                 info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             NETDEV_A_QSTATS_QUEUE_ID
   include/linux/netlink.h:150:70: note: expanded from macro 'NL_SET_BAD_ATTR'
     150 | #define NL_SET_BAD_ATTR(extack, attr) NL_SET_BAD_ATTR_POLICY(extack, attr, NULL)
         |                                                                      ^
   include/linux/netlink.h:145:25: note: expanded from macro 'NL_SET_BAD_ATTR_POLICY'
     145 |                 (extack)->bad_attr = (attr);            \
         |                                       ^
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
         |         ^
   net/core/netdev-genl.c:1231:15: error: no member named 'peer' in 'struct netdev_rx_queue'
    1231 |         if (src_rxq->peer) {
         |             ~~~~~~~  ^
   net/core/netdev-genl.c:1239:15: error: no member named 'peer' in 'struct netdev_rx_queue'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |             ~~~~~~~  ^
   net/core/netdev-genl.c:1239:32: error: no member named 'peer' in 'struct netdev_rx_queue'
    1239 |         if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
         |                              ~~~~~~~  ^
   net/core/netdev-genl.c:1246:59: error: too many arguments to function call, expected 1, have 2
    1246 |         err = dst_dev->queue_mgmt_ops->ndo_queue_create(dst_dev, &dst_qid);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          ^~~~~~~~
   net/core/netdev-genl.c:1254:2: error: call to undeclared function 'netdev_rx_queue_peer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1254 |         netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
         |         ^
   net/core/netdev-genl.c:1256:19: error: use of undeclared identifier 'NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID'; did you mean 'NETDEV_A_QSTATS_QUEUE_ID'?
    1256 |         nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          NETDEV_A_QSTATS_QUEUE_ID
   include/uapi/linux/netdev.h:171:2: note: 'NETDEV_A_QSTATS_QUEUE_ID' declared here
     171 |         NETDEV_A_QSTATS_QUEUE_ID,
--
>> net/core/netdev_queues.c:30:9: error: call to undeclared function 'netdev_rx_queue_leased'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         return netdev_rx_queue_leased(dev, idx) ||
         |                ^
>> net/core/netdev_queues.c:31:9: error: call to undeclared function 'xsk_get_pool_from_qid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      31 |                xsk_get_pool_from_qid(dev, idx);
         |                ^
   2 errors generated.


vim +1133 net/core/netdev-genl.c

  1122	
  1123	int netdev_nl_queue_create_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		struct netdev_rx_queue *src_rxq, *dst_rxq, *tmp_rxq;
  1126		u32 src_ifidx, src_qid, dst_ifidx, dst_qid, q_type;
  1127		struct net_device *src_dev, *dst_dev;
  1128		netdevice_tracker dev_tracker;
  1129		struct sk_buff *rsp;
  1130		int err = 0;
  1131		void *hdr;
  1132	
> 1133		if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_QUEUE_TYPE) ||
> 1134		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_IFINDEX) ||
  1135		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID) ||
  1136		    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_PAIR_DST_IFINDEX))
  1137			return -EINVAL;
  1138	
  1139		src_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_IFINDEX]);
  1140		src_qid = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
  1141		dst_ifidx = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_DST_IFINDEX]);
  1142		q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_PAIR_QUEUE_TYPE]);
  1143	
  1144		if (q_type != NETDEV_QUEUE_TYPE_RX) {
  1145			NL_SET_ERR_MSG(info->extack, "Only binding of RX queue supported");
  1146			return -EINVAL;
  1147		}
  1148		if (dst_ifidx == src_ifidx) {
  1149			NL_SET_ERR_MSG(info->extack,
  1150				       "Destination driver cannot be same as source driver");
  1151			return -EINVAL;
  1152		}
  1153	
  1154		rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
  1155		if (!rsp)
  1156			return -ENOMEM;
  1157	
  1158		hdr = genlmsg_iput(rsp, info);
  1159		if (!hdr) {
  1160			err = -EMSGSIZE;
  1161			goto err_genlmsg_free;
  1162		}
  1163	
  1164		/* Locking order is always from the virtual to the physical device
  1165		 * since this is also the same order when applications open the
  1166		 * memory provider later on.
  1167		 */
  1168		dst_dev = netdev_get_by_index_lock(genl_info_net(info), dst_ifidx);
  1169		if (!dst_dev) {
  1170			err = -ENODEV;
  1171			goto err_genlmsg_free;
  1172		}
  1173		if (dst_dev->dev.parent) {
  1174			err = -EINVAL;
  1175			NL_SET_ERR_MSG(info->extack,
  1176				       "Destination device is not a virtual device");
  1177			goto err_unlock_dst_dev;
  1178		}
  1179		if (!dst_dev->queue_mgmt_ops ||
  1180		    !dst_dev->queue_mgmt_ops->ndo_queue_create) {
  1181			err = -EOPNOTSUPP;
  1182			NL_SET_ERR_MSG(info->extack,
  1183				       "Destination driver does not support queue management operations");
  1184			goto err_unlock_dst_dev;
  1185		}
  1186		if (dst_dev->real_num_rx_queues < 1) {
  1187			err = -EINVAL;
  1188			NL_SET_ERR_MSG(info->extack,
  1189				       "Destination device must have at least one real RX queue");
  1190			goto err_unlock_dst_dev;
  1191		}
  1192	
  1193		src_dev = netdev_get_by_index(genl_info_net(info), src_ifidx,
  1194					      &dev_tracker, GFP_KERNEL);
  1195		if (!src_dev) {
  1196			err = -ENODEV;
  1197			goto err_unlock_dst_dev;
  1198		}
  1199		if (!src_dev->dev.parent) {
  1200			err = -EINVAL;
  1201			NL_SET_ERR_MSG(info->extack,
  1202				       "Source device is a virtual device");
  1203			goto err_unlock_dst_dev_src_dev_put;
  1204		}
  1205		if (!netif_device_present(src_dev)) {
  1206			err = -ENODEV;
  1207			NL_SET_ERR_MSG(info->extack,
  1208				       "Source device has been removed from the system");
  1209			goto err_unlock_dst_dev_src_dev_put;
  1210		}
  1211		if (!src_dev->queue_mgmt_ops) {
  1212			err = -EOPNOTSUPP;
  1213			NL_SET_ERR_MSG(info->extack,
  1214				       "Source driver does not support queue management operations");
  1215			goto err_unlock_dst_dev_src_dev_put;
  1216		}
  1217	
  1218		src_dev = netdev_put_lock(src_dev, &dev_tracker);
  1219		if (!src_dev) {
  1220			err = -ENODEV;
  1221			goto err_unlock_dst_dev;
  1222		}
  1223		if (src_qid >= src_dev->real_num_rx_queues) {
  1224			err = -ERANGE;
  1225			NL_SET_BAD_ATTR(info->extack,
  1226					info->attrs[NETDEV_A_QUEUE_PAIR_SRC_QUEUE_ID]);
  1227			goto err_unlock_src_dev;
  1228		}
  1229	
  1230		src_rxq = __netif_get_rx_queue(src_dev, src_qid);
  1231		if (src_rxq->peer) {
  1232			err = -EBUSY;
  1233			NL_SET_ERR_MSG(info->extack,
  1234				       "Source device queue is already bound");
  1235			goto err_unlock_src_dev;
  1236		}
  1237	
  1238		tmp_rxq = __netif_get_rx_queue(dst_dev, dst_dev->real_num_rx_queues - 1);
  1239		if (tmp_rxq->peer && tmp_rxq->peer->dev != src_dev) {
  1240			err = -EOPNOTSUPP;
  1241			NL_SET_ERR_MSG(info->extack,
  1242				       "Binding multiple queues from different source devices not supported");
  1243			goto err_unlock_src_dev;
  1244		}
  1245	
  1246		err = dst_dev->queue_mgmt_ops->ndo_queue_create(dst_dev, &dst_qid);
  1247		if (err) {
  1248			NL_SET_ERR_MSG(info->extack,
  1249				       "Destination device is unable to create a new queue");
  1250			goto err_unlock_src_dev;
  1251		}
  1252	
  1253		dst_rxq = __netif_get_rx_queue(dst_dev, dst_qid);
  1254		netdev_rx_queue_peer(src_dev, src_rxq, dst_rxq);
  1255	
  1256		nla_put_u32(rsp, NETDEV_A_QUEUE_PAIR_DST_QUEUE_ID, dst_qid);
  1257		genlmsg_end(rsp, hdr);
  1258	
  1259		netdev_unlock(src_dev);
  1260		netdev_unlock(dst_dev);
  1261	
  1262		return genlmsg_reply(rsp, info);
  1263	
  1264	err_unlock_dst_dev_src_dev_put:
  1265		netdev_put(src_dev, &dev_tracker);
  1266		goto err_unlock_dst_dev;
  1267	err_unlock_src_dev:
  1268		netdev_unlock(src_dev);
  1269	err_unlock_dst_dev:
  1270		netdev_unlock(dst_dev);
  1271	err_genlmsg_free:
  1272		nlmsg_free(rsp);
  1273		return err;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
