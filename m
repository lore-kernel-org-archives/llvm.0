Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023092.outbound.protection.outlook.com [40.107.44.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7629817555
	for <llvm@lists.linux.dev>; Tue,  3 Dec 2024 02:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733193388; cv=fail; b=juQZY98/Z+xbmyhZ3Z8BTILufBUu3p3wWm52HgWVBEdDsytsUYnEEJ1DT5WTuSgzBaF7AsgVtPFJlwOpYUhLLZJEbytEZy8j1TzUDmca3Tn1ljtfe3QomYXbBuLLQdIPTvK2U8ll2H5DNj63HApY340Ee0PllyWfWXGASk9vbhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733193388; c=relaxed/simple;
	bh=z+aCgE/vr9Q++2MmGL2m7ElnSHnEHn+3/bzvgfy6rho=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HzISjYr3fkSZCyDbdxUrTJNh1gnRzJ+f1khbnrPwhExxWJDdJUq+jokHjcKAo0kxHKWnw6zFr89lOK5bPhONRtmjLeiq0yis5H2iNFF8KTFZM30l0cXcQmc92BAKJCKGa4twni0fj/gvZhf0jelQIc3O1WtWDEys+pueGrt8Be8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=iiDqgpec; arc=fail smtp.client-ip=40.107.44.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="iiDqgpec"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGvagOEMzkLnRkUzCgbiQkD31Zh03TLHqDBZZou2/kFjgh7KdpYDejaSuKOYS2lZAaGCdXy7IX1NwMX5ei2/4H6VuVxVmmuStXymQlxGRHObIwr1hoEJMUTR1GQcGKJijhCEEMCCGKMuYbJZD5eBTB9BjRrZKqch9KHq5kPP5/v/WqA7lcuySkatThOq93w+utupCp8NQEKJBTZzqhJS3quI6O+o9yylpUiwuKkrQpayJRBQ3gY4uQJ3q/c9FN6d5b0D4QlQlzpKcQA67Rw4G3M22+ubYm/vZtTVU+aQ2U6gGKiHrT9S1tea9K/fx2L0srON0dPVGYsIshr3A/midw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NlcPSssFiT/Xbd9EZOQilwl4flvU6ARypuFSQmmKnQ=;
 b=TkXWONyb+l4svDBGXPyXvmqld2Anl2PD+SxJQcoPsxskPgBrzdgRLTpTG+nDyICORZg4X5BqOwTf86ruI93sxPTwSC/1ftuwKKqXuixV2+Yey2lBH7VciR+xOgWd3RWC04i5cZDN3uNnRbK5WhKBx6xWTb7t36eqM5oT/5bNRuC4Td5itGTvSoAwmwhC4kXa+vtH978cCJQ+SAhhFPTxfpQpBIeSyNEWo6BoghY/WvKO8PRkb24uySXLsLz2PQznuxhX6LWamK4TVu/bBdXKhC2FiAYsx8toFOFiLpGGV+n9+46ktW11B/lD+sJH2Oxf7ng/tboe7BENGYWaw5qmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NlcPSssFiT/Xbd9EZOQilwl4flvU6ARypuFSQmmKnQ=;
 b=iiDqgpecueLOmfsSslobHXWEYUepc8MXLDhBynOpPnWWNk/g+o7qBKmfcwz2I/NhPtZr+iDroNCyZDeAUXhqZmYiukrwWKDqYgYVLO/tMkHh08TvgoVMThUixjuqhjGFN+YQfik40iw1sdiWwKYR+wK0zA+XDVZTN0z5LBl/5PSIMUlJqyD2bQWZzD9Y0Ltj/34OhZDHAWm5mGAHZOetDPWF1Im2Wr2ndq1yq3SVWO8HzpJU9Yh5opa4Icl8ZJgu54zdjxIIl4DdRMbmpdNMwqMfyMUy4jxf5K9gi8RHvoOJpqJMqoVhC+MIF3hbJ+SnEB9Eu5DO8Yr2+/q1SyrXtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SEYPR06MB6756.apcprd06.prod.outlook.com (2603:1096:101:165::11)
 by SEZPR06MB5764.apcprd06.prod.outlook.com (2603:1096:101:aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.6; Tue, 3 Dec
 2024 02:36:17 +0000
Received: from SEYPR06MB6756.apcprd06.prod.outlook.com
 ([fe80::922f:a649:adbf:6634]) by SEYPR06MB6756.apcprd06.prod.outlook.com
 ([fe80::922f:a649:adbf:6634%5]) with mapi id 15.20.8230.008; Tue, 3 Dec 2024
 02:36:17 +0000
From: "Yuxue Liu yuxue.liu@jaguarmicro.com" <yuxue.liu@jaguarmicro.com>
To: llvm@lists.linux.dev
Cc: yuxue.liu@jaguarmicro.com
Subject: [PATCH v2] vdpa/vp_vdpa: implement kick_vq_with_data callback
Date: Tue,  3 Dec 2024 10:36:18 +0800
Message-Id: <20241203023618.1743-1-yuxue.liu@jaguarmicro.com>
X-Mailer: git-send-email 2.33.0.windows.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To SEYPR06MB6756.apcprd06.prod.outlook.com
 (2603:1096:101:165::11)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6756:EE_|SEZPR06MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: b34a1b68-21ff-4dcd-442d-08dd13434340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SuX0L6KtakwInBxcFAPf7DNxAUz6NqzbZXzOZeCiB7EnYi3+QzmY2CsGCTSy?=
 =?us-ascii?Q?bHYRoHk0O15q1OLqdSK5kfrZUF1MrDiVsM/0sTEZ3TcQBzzYV42LAGQZraYo?=
 =?us-ascii?Q?OjV7bQgr9UhRuTn5eybmDeHNC1K0hDvmk8F5d9MMF0emIcfimxB02ucsKGXL?=
 =?us-ascii?Q?32onXNX47jzAdmeNFa5+pEa4r8+l6iI0s6au2WIP378FImLJMnK1GRQVxs8K?=
 =?us-ascii?Q?CCgUGsqQPWdCfYaoCMFQ+b3tMhLida/e75b7cIk0DzbcH9G4xF3WQdqmjxeX?=
 =?us-ascii?Q?1S5qzw+SUy1RYIpY9S/cxqMh8siaMDRQlNVDjaVamRA0uaZqZNcKy3qwNvTn?=
 =?us-ascii?Q?63KK0BIa0+fhUEw6dGT3NRwgViNmrysHU41BfyFdAOruM7QXYaUG6ksBL+ex?=
 =?us-ascii?Q?fjFtXQyJNzH0mHPnZiJz1UTz3Sn2xVJdtXbFPldHykQzS7flPYGzgpkeOotj?=
 =?us-ascii?Q?YiNB28z+IpVlJcU2/joKsPu79y0wXzIWCZ4A2tdSH4ZtnKmwIwflN88rKLXr?=
 =?us-ascii?Q?Dpd5XP1tnzUnxlUZZMy9CNwMrG4ByOnHW1XfCr+oTPWJBgAK1syNyjxSwVk9?=
 =?us-ascii?Q?ELZIgPLup8lnaF3/XQ/2JD9hN5H2nj/piUxz86dY4GoOFc66UvBHyqE6UKSl?=
 =?us-ascii?Q?2014+1md52fDFsLzdftJVb9o6xUT7XuWixMDzTBv/ns6qZH580BvcZHl931N?=
 =?us-ascii?Q?+53SUcnkNV0CjrGfhSniV/L0DZUBKCQsLU1tqw90JvKP2kPIR6ROn9Ck4kjU?=
 =?us-ascii?Q?CuJt2ibW06dnfsxn7mwuqOCQJVCXfix6q+MEXqe9n9Ycfg16wkqUBde4LNtD?=
 =?us-ascii?Q?OGKtzJQUBhuKpi775pU/U8W3LFeBDNL6Y82dNwz7KtmJWLykNSsqmiei02qH?=
 =?us-ascii?Q?UmHNnd3K8Hbk5TOgkhQ3jGcJ5VNRots/dj/s2Hx0+J7t7lHoND+vdtTf4drb?=
 =?us-ascii?Q?i7YLBleZTeNm1GcNM5wfFCQEbpUfVgANdRC3u+txXHsEZ0ABHZQt61p2S4tf?=
 =?us-ascii?Q?5ZEfmAdWHuQEeAmCe1xy3MadcQ043yEmAQlw6rGBcz6YoqWJ2dSPD1HPE2b1?=
 =?us-ascii?Q?t9HrJ5oDMrVCFB5pTWFJ+3pYIP5C0WFf1UY9bLH9bRyczIJhckIsFs7XlqgR?=
 =?us-ascii?Q?Qchm+59d1eBcHzXaXvENhm0nekwnLvVPul22+VfxsRM2t9s8jzbdY50vaCXw?=
 =?us-ascii?Q?XX2UYNPDKRqNJqdrg4rdor1YwDi1KIqop1cH4AZVboEhRBa8/IIkquKUjFDJ?=
 =?us-ascii?Q?1qdxbZkMZi+KHMuNllbGjdrgXrMFd22JPW6BTsxrW/FcvbNUiukQJ4KtXqTK?=
 =?us-ascii?Q?b/N6TEDNAmXfRCMrF//aBhvrJIb/Zyj0N1AwFxI4BoRETnZ7Hdik2Xt6JANz?=
 =?us-ascii?Q?P+4/pP1w0ioyZc6chGtXekqa1xaT9OcZQ2wk6b0RAdNKJ5Shgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6756.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lu+3ahd1eR3xKtUDLXiY4SqMM8PbJVz/xvyMYOizuZy/mGWw3NOWUzAAn+5q?=
 =?us-ascii?Q?pUCmD/PnNUp9tL8HOokuQ6I3ZDZM+bd7VatR2eisB6qu9oNIbxCBtX/P+NvN?=
 =?us-ascii?Q?0Ijf6JAIQ2tVjW3+Mm943RBhpu77kB3GRJKh2m5NWnSF+R8kE7EPg5BElvIa?=
 =?us-ascii?Q?swQKts/dJfvHWpz4s4WnmbIKuYr9uwYAr/8qzUGusD3KvNK30W5pPxv9FUcA?=
 =?us-ascii?Q?1wAoccLwhY4J/NPkJr/wQ8RJsDyOofNHaHHy7+jAngk8mUdl400H0oyPLMwC?=
 =?us-ascii?Q?5U8X+NKtClooCFB1PAqaO5u2Sq0K7OIqtwaIk5J5NmKTUBWqIekrUhJ4KgQa?=
 =?us-ascii?Q?yz+480gAnjUBt89eWCowan3VfOf+Qa3Df+3DAs9vpDGowyO5OCZlQu5TglqQ?=
 =?us-ascii?Q?GlMW4/mkD40Dt2rH0zN7EtHVCjsCWZ2OieOsHBLBywsSkCWz/b0B/WYmllCB?=
 =?us-ascii?Q?rLvrIE/D7RP4vxFvQZEtr9S9Lo71d7JqZTIsst1Y6emTHNGQjKbI1HxiDG7b?=
 =?us-ascii?Q?laTGMG5Zj8uadv/s0EPJW9kMNJuKFTM6sKibtPBcNXHzFyZA1eLKcZ3P9gGE?=
 =?us-ascii?Q?YTE4O+I7bnQeC0hwVlS5IJTuIJAW9C7df/hgmumU4G2kVtxtlhBYsIO0xhEh?=
 =?us-ascii?Q?aa49RhlWsFqIpw2r7JzNhzric1yCcOEyMmEG94FAhkVJ4bSOLwdLZLHgkYsg?=
 =?us-ascii?Q?eBVsDr/Bq48idCLQQC7ys3M6CEIz/n3eTX6BFJhEx92pVQOjBXxj//VR7ZbH?=
 =?us-ascii?Q?3h28n9If6Nypf/Dc1MuUdAljsKpoY7ilakCV9RXhHHlvCj4Le/XjC1DLZTSZ?=
 =?us-ascii?Q?f1qkU4ZHLUSCf1YxB41d/g9MNnz5mA9yhLBJ8KC3IktE1gGl7hODFSXGMwVV?=
 =?us-ascii?Q?q8jptTgx+qSBWPkGlfUBxxYQ1pnQzAK3s6XE0x+GPbiIcBK6jRv3qdvepdTS?=
 =?us-ascii?Q?WspS0Rot9cbCf5nldZ8K2fCB/NsBmxKy7MwfolP1R/Sd/uQo4dYVpYUMhuYt?=
 =?us-ascii?Q?FPctMysTB/TAgwMTbUfitz7jw1dAV8+qNDPW7+V2qMi6g2U0bb+aA6xoz5GD?=
 =?us-ascii?Q?wC1219wbl2BHRXwX2sUFgGQuEqc1v2Zp23aBhGGRwQHtuUPs3BSyY2rqe3OG?=
 =?us-ascii?Q?Re8CLC696oBZWAZyt6GNqbeBvc9k86ZcM97wYiWKs6a5ENk2JYYArRZLKN29?=
 =?us-ascii?Q?W/UFTtMwjX8Eb4dFS44dCgzWz3YbpWnA7bbg/qBBg+MCzOG3oFVbGyD82vhp?=
 =?us-ascii?Q?4EZP82sa8jTCzz4wrxMJzc3ot3FCZAkfjjG98uONGLM1SWZOB+Oujj7M/UmV?=
 =?us-ascii?Q?s75Hw6hZN+Ugg1zjMW40T9oMWHDKyJ87GJmJAV8L+uQU6j9jTJMgbVOSG7aD?=
 =?us-ascii?Q?dwxfwBt61Ssg52N4PucR+FzijbON+ZB+8HPzOph595CLUHM5syoqVCU/HP/4?=
 =?us-ascii?Q?sQ6lU6cr+MmWZNsscpqZPYRnIVpERyJ/8xDP7nz3kNaCfdkghShe0fF3NQh4?=
 =?us-ascii?Q?OXfMVgz6qJeZkWxGhE1LQnqZaiWeOdcpmCJiBzvg2b6ubVu35Z/vValcd3fc?=
 =?us-ascii?Q?sHHylOVrnbmTEvooCyBIXYq2KlNIdCRd7wBuTl7moh98YdPPiangGriKst0v?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34a1b68-21ff-4dcd-442d-08dd13434340
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6756.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:36:17.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLIa2umoZItIcQp3Ivp91Q+0SiNs8ZGI9H4TR5DIchVHOESi5qP1E/17N+kdFG0YgJTNLtyJDt2fvck00ERz4N5Yx0r3ilhd1Z0wmdtVfqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5764

From: Yuxue Liu <yuxue.liu@jaguarmicro.com>

Implement the kick_vq_with_data vDPA callback.
On kick, we pass the next available data to the hardware by writing it in
the kick offset.

Signed-off-by: Yuxue Liu <yuxue.liu@jaguarmicro.com>
---
v2: fix build error for kernel test robot

 drivers/vdpa/virtio_pci/vp_vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index 16380764275e..8787407f75b0 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -367,6 +367,14 @@ static void vp_vdpa_kick_vq(struct vdpa_device *vdpa, u16 qid)
 	vp_iowrite16(qid, vp_vdpa->vring[qid].notify);
 }
 
+static void vp_vdpa_kick_vq_with_data(struct vdpa_device *vdpa, u32 data)
+{
+	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
+	u16 qid = data & 0xFFFF;
+
+	vp_iowrite32(data, vp_vdpa->vring[qid].notify);
+}
+
 static u32 vp_vdpa_get_generation(struct vdpa_device *vdpa)
 {
 	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
@@ -472,6 +480,7 @@ static const struct vdpa_config_ops vp_vdpa_ops = {
 	.get_vq_size	= vp_vdpa_get_vq_size,
 	.set_vq_address	= vp_vdpa_set_vq_address,
 	.kick_vq	= vp_vdpa_kick_vq,
+	.kick_vq_with_data      = vp_vdpa_kick_vq_with_data,
 	.get_generation	= vp_vdpa_get_generation,
 	.get_device_id	= vp_vdpa_get_device_id,
 	.get_vendor_id	= vp_vdpa_get_vendor_id,
-- 
2.34.1

