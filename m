Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13C2472AE;
	Mon, 14 Jul 2025 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496699; cv=fail; b=llWHJYq5soGqBtveQGBNQHCfxYjUeK8PfzLnwWEZUoWCwuo9Um7tW9fUaK3TaMyJWQnChJduKDKyBaCPOEhYdufzwVzRQXzTJs+iSkdZ6IsRb1CSBjo7PO9SHUYUS7M9xf3wEnTvXxoj2d9K9485zB7iQ60rDD8mZZCkHnmviQE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496699; c=relaxed/simple;
	bh=95nxLy02OgXbHFx4suyGR2ZACLQ87xXJ74DsKi7rYoI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NZp6sra0bIqit4tnM7v9+mhHpCrMV4NEzSX9yRoJ7PmpIs1CuKkHFJadQhH7qk7axDmASK/mlIDujaCCJ1Sm9rDEQ0bDe+e76uB6OILnFK9PxvOEUPYQ/u2FOPmfHWUQ8SuOl8FohgxR0pi9ByRPVp3b5WzgKTLWvCZu8oV9Dxk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ilNa+tRB; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ilNa+tRB; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ilNa+tRB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ilNa+tRB"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aj68JAQNj2wCQFlTidU0ooHQyxXuiYPwo2w32oqkM1k3rzpTw/qcQUMizI14zPti+E/Q/MeAKkMkkmoH9H9ikVFgrZNyp90D3b+GTNtK1fWuzAQvsRgQVq59cnqMu413SWgOHJH/j/LF0IruvIQUKN2Eetv2tuS1iATgM/5LtJkbNoYBhiXEeLxF2QJwgcZOvXa9p36PSfsBHYhT+40HYTC9/nkTfInIy4l2KewjZ9imoyMh6d5dsSYz+gNY6qOYISWNr3JDbZ4piLqxUoA4KK5YESTZAnmxqjjPQ266e0hgsn0IGrDFh+5rlreoTv5fFCJfRDedVBOCwwrZU4lvsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95nxLy02OgXbHFx4suyGR2ZACLQ87xXJ74DsKi7rYoI=;
 b=rdqYfbxZe0w/NzEsyBZ556PKnLs6DHkl/BX1O+EP7h83LQkoV6yebc6oqf1E6sNkpu0v5ej+Xyo3SpXfqXO7jbp3M1le67jGFNGv3B0fScmWwEwG12T9D5PfkhTNb0Rzc/7sj4mB1jAdmsm7OCdLbd7tNWOUu261X83bQN5gRk/nVStrSLQBA9gD2HSyU67N8pgrDDnFB9bJmdpSqLSTD1CUMsyiVJW2VTsJIPbfSKKW6D7C1oxMKKFT5hoz/vr5lXHq040eGx7yaVBFu69Y35afqDESSyGkKql/rH7cXnM9rF/J3B5jS40QzffNVbTo0YKohGXjprld3LbgGnogPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95nxLy02OgXbHFx4suyGR2ZACLQ87xXJ74DsKi7rYoI=;
 b=ilNa+tRByCSadhYoGCpnIsLzSwyivZmMHL2yc56WHpyrv/Knx7BpON6b6OQ3+siU6k/AjU0j4yGOHohHbPZz/EaF2jasGWygeXhOhNWZq41ngR8yeN5yxfwMryeh9lmEM2ji4T1zJ2gwUqMIGus5IBi9kf255mCG/75YGaVXT78=
Received: from DU2PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:10:2b0::31)
 by DU2PR08MB7326.eurprd08.prod.outlook.com (2603:10a6:10:2e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 12:38:09 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::3e) by DU2PR04CA0176.outlook.office365.com
 (2603:10a6:10:2b0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 12:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Mon, 14 Jul 2025 12:38:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIF37BM1wCyEyjE8ICMlTXtd1h06wIqYZDfcOiIbnxgTgwgzBT0qA8JcFTfJHzagXqW/IunAg4dP1smTHdxIqtviLwk8yVaBkPu3FO/wy+RmGAIUlQHfMC+H2mnzuh8VK+G0Up79dt2tSjtj3aeJO1gBO0GLQGVgLElpzB9G7JgofMJObQabfu/3PIS0mtA6G68VhVdxC/2pHlORI+aBsXh/Ig8EfqB+qH+pvBaxI3WPUp/Aoef0XJR3EJ+ymogd3i1KDmAmCHofJoV87RcEbhc9ZhJ2YR5kbleSYvojqGvdqGMpcvufJ9Wb5QfmZ/Jb9tyKsd4v/4pHBy6UmwAzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95nxLy02OgXbHFx4suyGR2ZACLQ87xXJ74DsKi7rYoI=;
 b=teSuW4Ju/8eGUmOZgDO1U6Bfp54DXB9iMXYjQbk0NReSwieosx/De+LPwQYT3UkeSD69SD88KWXXQIKdZwMOOlJQ/gwtffragZqI2hhBgsHmiLeEftGI1qysssmIskJasM9ZHQwfff4BBnTUIeZihQg4Gr9dO6Rc0ED2i8vT8DflsoVb1Ke5HFhGeDq9azuG7GGS4sU4YWHZudNZ79aq1nqw31dQNg0jEf+vqdT4NdlV0UzAgpElPMr0V6SfXV2/nhORJzzN7Dp6bhgEXR6tRNdDrGrDHp2om5hcA7eyObdV2Biwq10sICwbRKR363ZYOCHnQtXXNoz9MT9dWP86UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95nxLy02OgXbHFx4suyGR2ZACLQ87xXJ74DsKi7rYoI=;
 b=ilNa+tRByCSadhYoGCpnIsLzSwyivZmMHL2yc56WHpyrv/Knx7BpON6b6OQ3+siU6k/AjU0j4yGOHohHbPZz/EaF2jasGWygeXhOhNWZq41ngR8yeN5yxfwMryeh9lmEM2ji4T1zJ2gwUqMIGus5IBi9kf255mCG/75YGaVXT78=
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com (2603:10a6:10:46e::5)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 12:37:36 +0000
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31]) by DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31%3]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 12:37:36 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "lkp@intel.com" <lkp@intel.com>
CC: Timothy Hayes <Timothy.Hayes@arm.com>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, nd <nd@arm.com>
Subject: Re: [linux-next:master 7731/9053]
 arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used
 uninitialized whenever 'if' condition is false
Thread-Topic: [linux-next:master 7731/9053]
 arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used
 uninitialized whenever 'if' condition is false
Thread-Index: AQHb82Nqz+6yOnj01ku5qvWJCo7PlrQxkV4A
Date: Mon, 14 Jul 2025 12:37:35 +0000
Message-ID: <06b16fee8f7a1d60e6723e5dafb12158d6797c7d.camel@arm.com>
References: <202507130334.ddFcXn4N-lkp@intel.com>
In-Reply-To: <202507130334.ddFcXn4N-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB10202:EE_|DU0PR08MB8279:EE_|DB1PEPF00039231:EE_|DU2PR08MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d2ad85-b433-4cbb-b039-08ddc2d349e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b1pWaFdRRnIwRENaVUpSeFpPU3VwN0FQby9wa3BNOUZUOXpIYWRyQlRzdnZX?=
 =?utf-8?B?cmNwYkMrUWxpMHlwRlVKcWVwWkNEYm1GU09ObGxRcHRjcHd4Vi9KYkZFVG94?=
 =?utf-8?B?eXZhUlJJUUtBTmJlWmlLenJ2RXhGMGtkSS9zYXI3aEJBeGdpU3RCa3N2OTNv?=
 =?utf-8?B?SWVyWlR5WGJBN29ra0dteHVTYnNHNm1YRWsxMTFCQUFRQy9VZ0pkeGtWWUdN?=
 =?utf-8?B?SXhOTXBHdU1ON05pVXNMdGVvYkc5eUUyaHl1b0cwai9FUERjbnFJM3hveStS?=
 =?utf-8?B?aE90cFNtRmU2czJkTVZqdDR2STRFVHk3QWtFckQ5QjFFckNmR1hPaDVDbWJJ?=
 =?utf-8?B?V2lwYm9KS0JiQmlGa1VzZGZnNGNQSjgwYkE2d1UxYWJlajhCdHBTVzR1QmJo?=
 =?utf-8?B?NlhSWXRqbmNWZHlCRUgxWkh0ZkZxcnU4V0lqYTBrOTlONnc4Wko4NHRmMTJD?=
 =?utf-8?B?L1VHOHYyank1L3RkZWNBZnJNSEpFejRFQUJlUjN5VnBoR3M3MERwMy90aXpO?=
 =?utf-8?B?amVPVjdvUGd1T2xVUzQwYlNCR1l3WEJzclZNSG1Qdi9mdmJoSDBWTXhheWZw?=
 =?utf-8?B?dHFKaG92WHdub1dGVTB2YXBBbzgxblR1d0x5TEdaUDJxUmlHSkJONC9MMnpv?=
 =?utf-8?B?ZWl2alI5Nk0xb0l1QkJaeTQvZERBRHVLUzNQU0xSODRiblorNyt2cHVYT1hF?=
 =?utf-8?B?amhsdm9GaC9zK0d2TVUrejNnWGpMSnlKenBZUzNCdDNvSFNIRWZUWVlLZ01I?=
 =?utf-8?B?THVpMVVtU0xIOXUvTmtMbGZjY2pJOXJSY2JveWd3d2pRWFVucnQzSzlBRDky?=
 =?utf-8?B?bHJTa3Jha0JCQnFLK2M0dXMxQndXVnlud2s2dVJpN1Iyb1c3ZWxXTEhHczdG?=
 =?utf-8?B?ZHVzeXplUWtGaHdUMjg0bU5tU3JzNmZ4Q0puWGRzMSt2QnJOS2JjdTBXNHpM?=
 =?utf-8?B?SVN0ckRrenI4MTh6azNXbnI4UnNVazVHUFdLd3YvMHJkVzJHU2tQbTNPN1JX?=
 =?utf-8?B?bWJ5VVpMRURwMGRPZjU4a2JxSUVYVmttOCtqdTRmTlNPSUtzeXZIK215aGZx?=
 =?utf-8?B?aFpUS01qWlRkaEoyUkxHSHNheUdyWVF6Y3NpSDVXRE9wL3ZJV1VuYlNlb1NZ?=
 =?utf-8?B?WnkrbWliSlkzYlRpd2NmS2xvdkEyTEdCWm1DOWFJMTVWL2hiVndqZVV5VU93?=
 =?utf-8?B?RmV2VHNBdkJBY2lzUllOc2lGenpVNnVnT0ZhUzY4eWRCMWk2UEx0cHl2MUp4?=
 =?utf-8?B?aWxpZzdoamVRMHptT2R4NmVRbDlEVEw4Zk5qY01yd2NhVU5qSDJrWStIZXZT?=
 =?utf-8?B?TWd4TGxyRDFGWnhSekYwK3JCdElKZUd0U2J6MGwxNjdHR0NWU3pIaDF0ZUJZ?=
 =?utf-8?B?clFTbThpSUNLUWphVXZ1SEJHN0FjYjdCdTQwUENCUGRyb2V0dEZBYU9VTWZ4?=
 =?utf-8?B?K2F3UjFJekkvalR1Nkp0VStia09hOXkzSndZTkNCQW5CKzIyeGJmeUkvK0R3?=
 =?utf-8?B?UHRFTXdZUVdZQ01Jdml0SUVMT1BvWTBYSmFpTzh0TDZMZE1xeUZkUVpxV2VD?=
 =?utf-8?B?dFQ4eXloVDg3aWNyUGJBVGlNUzRSdUZNZVNlbDRjdkRkMXpxTUFFVTBkMDAw?=
 =?utf-8?B?ZVBOVlJvR0dQN2J3MnZtNGVOWTBmbTVuMWpNbEd1ckVxZDBRWWFGR3ZUVjly?=
 =?utf-8?B?WjJ0V2trbmwwZ20vRmRBUE82Zy8yOFU3MjMxOUduclNuMVozVk9wbVBQdVda?=
 =?utf-8?B?eTFUNGptTVFSc0pRM3RkQ2F2WHBIMVZsd0dBdVJDSVEyaUpyYVFXS2NUT2V3?=
 =?utf-8?B?cUM5RWp6eDF2RDBoUkdJWVNOOWdxbXpyMW80UWVDNnNSU09sUGVYbjFiTDRY?=
 =?utf-8?B?UFpRUEl0cVJIL2lUVjhFcHhCTXZoc1pEekZ6OHhoc2FrNTloSEE1MitNRDZl?=
 =?utf-8?Q?1NuS/O7xL+p0nviO2li2WRkYsSZ1ak/n?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10202.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <93DACD5C40F6D141BF64E9079B0A7EBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a004e1b-9c6e-43d8-1a77-08ddc2d33612
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|36860700013|82310400026|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a09Ec0M4KzZ2NS9TS01tQ0xSMGdadWpVaDNqeWdEUUZzZ3FwSkRjMHhGTG55?=
 =?utf-8?B?SUZhRFhPdHk1NmlOSm92TDUwNWNOMjk1UU5nbVNGRVNOdmdGVVNZNGdIZWJh?=
 =?utf-8?B?elpNcWcrazdoUThieExvR20xaEZsNXRmL2hyU1ZXZFFHU1hJeXBRbzZHZkJa?=
 =?utf-8?B?VkhvTnZhc21odDNRcS91Tm95dTNydmhtcHNQbGFGTEhrc3ZFVTFsSmkreE1Y?=
 =?utf-8?B?dkZCNnU0L2RCMTZRaVJUVkdxNzdVZnRoMmxNVCtKQXRrdnd3TFZGZ3JjZkJS?=
 =?utf-8?B?MFBudUkwVXBsQ3JaNkkzT0xtdnIxaFliRzFhTit2aWNXM3djWldVY3hDSnJ5?=
 =?utf-8?B?QWE0aW1NTnhrcGZJbTBPdVpLazF3dUZSRmdJeXpZSEJzOWNoenU0SEVKUWhF?=
 =?utf-8?B?a2tGZ3FSRkpiUDEwZ2dPMXozODZFN1l0LzVSY2E0Nyt4MmZ3MGlSWkNycm44?=
 =?utf-8?B?WFp3NkNEOVg5enEzOEx4aFNoaXMwZnNpem5KelNJMVN2ZVFrb3JhQmlJTWxR?=
 =?utf-8?B?cWU4ODQwSEZKZ1Rwc2JNTVhiakxzSFFCZ3Z2T01OQlZQMEhLWUpOU3dWd0tE?=
 =?utf-8?B?SFc4dzUvQTNJa0JINHFaM0xZajAvY1BsS1doSWZHYjhHdWhGUksySUFHSDdL?=
 =?utf-8?B?aWFJUERDUW10enQ5UnBNS2VFMG5BZW8vZmlONmZPLzczWTRRQzZ0TjEwd3Zp?=
 =?utf-8?B?K1pHUy9SZ2VVZEFoK25TS3V2WVVDS0s4RTdGcUF3UHkxdnNVbWtKL1VzSFd6?=
 =?utf-8?B?aHJLN2lMNmx2TW5oN2JXMTVVTFZZNkJoRk1RbGNSOWpVNmV4R085UjRsK1V6?=
 =?utf-8?B?ek5xYmJMV3p6WEVHVWtCTEhwKzAvbk5DaVZEWkJRYkxDMVh5TWFYYlZuUlpu?=
 =?utf-8?B?Tjl3UkJMVVUwOUpSUFlROWh2NzhoT2tXUC9uMTE5Vi9NbGhRWnZBQXpoODlV?=
 =?utf-8?B?MkhQTk9pc0xVSEkwdk9vaCtFTkJvTm5FYjZ1Q2tlWkRpSDF6SkZseVh0TTFm?=
 =?utf-8?B?VUtKRDU3cGVac21Fb0JDOVpqNUpLZ1RUTDB0V3pqZVpVZTFjL29tKzVUUGlk?=
 =?utf-8?B?NW1uOHhQU25VUit2dXJ2RWNwaFI3S2VXa2UwUjhyeDROczFZdERVSS9tL3JV?=
 =?utf-8?B?Y0k2RkxhRm8rdm92dmQwQkdoL2N3RTRuS3c1Z2Y2YXg1ekRzcVY1TmlKNzUz?=
 =?utf-8?B?Z0NId0VvOWNaM214MVMzK2hSSEY3SFgrWVNybDVhaTNIMHB6SFRmN3J3cmlS?=
 =?utf-8?B?VVlKd0Jrd3NjaFRZODhZN21FVFRwYzJnbTFMZlppTW4rNnB2UFZMaDdlVXJq?=
 =?utf-8?B?MytlYmk4SUlrSDBQSVI1blpLR25xcDFOR3ovTlE4SEdMTlI5U1BGSUhmY0c3?=
 =?utf-8?B?bnF5ZzdueGYwZUhVby9IOWVuVndiMmRva1h1RFlmVUI3SGJabzRmNHErbFV6?=
 =?utf-8?B?TWtpTFdmU0taY0F3RjY0Z1FmeDdPQVgzdUNuNHZkeU5RbmJmV25TZitRT29q?=
 =?utf-8?B?ekRha0V5NXFoa0Z3UjRRYWxGRjhvMW9JV0RzRHJ1UmRRZWNlYkk2TVdrWnVD?=
 =?utf-8?B?cytTaUMwc21ySS81WkwxL0pvTGVEN1Q2R2N4RS9YcVZpSGU5UWVMbStQVHBX?=
 =?utf-8?B?bi91M1dqSGt3YmFhSnpWSG5OVXBMQ1ZBNFhLWndDb2phK2xMbHpRNlZoMTMz?=
 =?utf-8?B?OUlIdjU1dC9jeXVtaG1RZ2RabEUzQTNVS0tjYmlHdkpIVy9EdkJMT3R1YVVQ?=
 =?utf-8?B?ZWRmdU50bFNFQWN2blFGdmVpQXlFWnh0YlYyYmxQSHhreG1EZjV2d3lidFo5?=
 =?utf-8?B?OEtZY015aGI1WWZpZUxQb1pEelRsaU1QNWp4dG9iSWdndlBPc1ZxT0EyS3Vi?=
 =?utf-8?B?bTR3OUw3aVh6cnE2djhLU3hUNVlHeVRBNDczZ2lGKytoYTh3QzRsVlplREho?=
 =?utf-8?B?TTdUZ01aSmxoaGhVZVZreVBBN3dtRzVseVJSNXdLa3RORG5vRU5rZFhwV1k1?=
 =?utf-8?Q?Z6UcoLYiAADTLUcrf0VU9xmxxj9Mg0=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(36860700013)(82310400026)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 12:38:08.8811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d2ad85-b433-4cbb-b039-08ddc2d349e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7326

T24gU3VuLCAyMDI1LTA3LTEzIGF0IDAzOjI5ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gdHJlZTrCoMKgDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXTCoG0NCj4gYXN0ZXINCj4gaGVhZDrCoMKgIGE2
MmI3YTM3ZTZmY2Y0YTY3NWIxNTQ4ZTdjMTY4Yjk2ZWM4MzY0NDINCj4gY29tbWl0OiBjMDE3ZTQ5
ZWQxMzgxMDAxYmE3YTY1MjFkYWFlOGY5NjhiMTFjZjA5IFs3NzMxLzkwNTNdIEtWTToNCj4gYXJt
NjQ6IGdpYy12NTogU3VwcG9ydCBHSUN2MyBjb21wYXQNCj4gY29uZmlnOiBhcm02NC1yYW5kY29u
ZmlnLTAwNC0yMDI1MDcxMw0KPiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNo
aXZlLzIwMjUwNzEzLzIwMjUwNzEzMDMzNC5kZEZjWG4NCj4gNE4tbGtwQGludGVsLmNvbS9jb25m
aWcpDQo+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDIxLjAuMGdpdA0KPiAoaHR0cHM6Ly9naXRo
dWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0wqAwMWM5N2I0OTUzZTg3YWU0NTViZDRjNDFlM2RlM2Yw
DQo+IGYwZjI5YzYxYykNCj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKToNCj4gKGh0
dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MDcxMy8yMDI1MDcxMzAz
MzQuZGRGY1huDQo+IDROLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQ0KPiANCj4gSWYgeW91IGZp
eCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBu
ZXcNCj4gdmVyc2lvbiBvZg0KPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZv
bGxvd2luZyB0YWdzDQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPg0KPiA+IENsb3NlczoNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVp
bGQtYWxsLzIwMjUwNzEzMDMzNC5kZEZjWG40Ti1sa3BAaW50ZWwuY29tLw0KPiANCj4gQWxsIHdh
cm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+ID4gYXJjaC9hcm02NC9r
dm0vdmdpYy92Z2ljLW1taW8uYzoxMDk0OjM6IHdhcm5pbmc6IHZhcmlhYmxlICdsZW4nDQo+ID4g
PiBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJ2lmJyBjb25kaXRpb24gaXMgZmFsc2Ug
Wy0NCj4gPiA+IFdzb21ldGltZXMtdW5pbml0aWFsaXplZF0NCj4gwqDCoMKgIDEwOTQgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJVR19PTigxKTsNCj4gwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+DQo+IMKgwqAgaW5j
bHVkZS9hc20tZ2VuZXJpYy9idWcuaDo3MTozNjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybw0K
PiAnQlVHX09OJw0KPiDCoMKgwqDCoMKgIDcxIHwgI2RlZmluZSBCVUdfT04oY29uZGl0aW9uKSBk
byB7IGlmICh1bmxpa2VseShjb25kaXRpb24pKQ0KPiBCVUcoKTsgfSB3aGlsZSAoMCkNCj4gwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+DQo+IMKgwqAg
aW5jbHVkZS9saW51eC9jb21waWxlci5oOjQ3OjIzOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3Jv
DQo+ICd1bmxpa2VseScNCj4gwqDCoMKgwqDCoCA0NyB8ICPCoCBkZWZpbmUgdW5saWtlbHkoeCnC
oMKgIChfX2JyYW5jaF9jaGVja19fKHgsIDAsDQo+IF9fYnVpbHRpbl9jb25zdGFudF9wKHgpKSkN
Cj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgDQo+IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4gwqDCoCBhcmNoL2FybTY0L2t2bS92Z2ljL3ZnaWMtbW1pby5jOjExMDI6MTI6
IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNlDQo+IG9jY3VycyBoZXJlDQo+IMKgwqDCoCAxMTAyIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuLCAmaW9fZGV2aWNlLQ0KPiA+ZGV2KTsNCj4gwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fg0KPiDCoMKgIGFyY2gvYXJtNjQv
a3ZtL3ZnaWMvdmdpYy1tbWlvLmM6MTA5NDozOiBub3RlOiByZW1vdmUgdGhlICdpZicgaWYNCj4g
aXRzIGNvbmRpdGlvbiBpcyBhbHdheXMgdHJ1ZQ0KPiDCoMKgwqAgMTA5NCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQlVHX09OKDEpOw0KPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+IMKgwqAgaW5jbHVkZS9hc20tZ2VuZXJp
Yy9idWcuaDo3MTozMjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybw0KPiAnQlVHX09OJw0KPiDC
oMKgwqDCoMKgIDcxIHwgI2RlZmluZSBCVUdfT04oY29uZGl0aW9uKSBkbyB7IGlmICh1bmxpa2Vs
eShjb25kaXRpb24pKQ0KPiBCVUcoKTsgfSB3aGlsZSAoMCkNCj4gwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXg0KPiDCoMKgIGFyY2gvYXJtNjQva3ZtL3ZnaWMvdmdpYy1tbWlvLmM6MTA4NDoxODog
bm90ZTogaW5pdGlhbGl6ZSB0aGUNCj4gdmFyaWFibGUgJ2xlbicgdG8gc2lsZW5jZSB0aGlzIHdh
cm5pbmcNCj4gwqDCoMKgIDEwODQgfMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGxlbjsN
Cj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF4NCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAwDQo+IMKgwqAgMSB3YXJuaW5nIGdlbmVy
YXRlZC4NCj4gDQo+IA0KPiB2aW0gKzEwOTQgYXJjaC9hcm02NC9rdm0vdmdpYy92Z2ljLW1taW8u
Yw0KPiANCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMgQW5k
cmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjbCoCAxMDc5wqAgDQo+IGZiODQ4ZGIzOTY2MWExIHZp
cnQva3ZtL2FybS92Z2ljL3ZnaWMtbW1pby5jIEFuZHJlIFByenl3YXJhIDIwMTYtMDQtDQo+IDI2
wqAgMTA4MMKgIGludCB2Z2ljX3JlZ2lzdGVyX2Rpc3RfaW9kZXYoc3RydWN0IGt2bSAqa3ZtLCBn
cGFfdA0KPiBkaXN0X2Jhc2VfYWRkcmVzcywNCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJt
L3ZnaWMvdmdpYy1tbWlvLmMgQW5kcmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjbCoCAxMDgxwqDC
oAkJCcKgwqDCoMKgIGVudW0gdmdpY190eXBlIHR5cGUpDQo+IGZiODQ4ZGIzOTY2MWExIHZpcnQv
a3ZtL2FybS92Z2ljL3ZnaWMtbW1pby5jIEFuZHJlIFByenl3YXJhIDIwMTYtMDQtDQo+IDI2wqAg
MTA4MsKgIHsNCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMg
QW5kcmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjbCoCAxMDgzwqDCoAlzdHJ1Y3QgdmdpY19pb19k
ZXZpY2UgKmlvX2RldmljZSA9ICZrdm0tDQo+ID5hcmNoLnZnaWMuZGlzdF9pb2RldjsNCj4gZmI4
NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMgQW5kcmUgUHJ6eXdhcmEg
MjAxNi0wNC0NCj4gMjbCoCAxMDg0wqDCoAl1bnNpZ25lZCBpbnQgbGVuOw0KPiBmYjg0OGRiMzk2
NjFhMSB2aXJ0L2t2bS9hcm0vdmdpYy92Z2ljLW1taW8uYyBBbmRyZSBQcnp5d2FyYSAyMDE2LTA0
LQ0KPiAyNsKgIDEwODXCoCANCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJtL3ZnaWMvdmdp
Yy1tbWlvLmMgQW5kcmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjbCoCAxMDg2wqDCoAlzd2l0Y2gg
KHR5cGUpIHsNCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMg
QW5kcmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjbCoCAxMDg3wqDCoAljYXNlIFZHSUNfVjI6DQo+
IGZiODQ4ZGIzOTY2MWExIHZpcnQva3ZtL2FybS92Z2ljL3ZnaWMtbW1pby5jIEFuZHJlIFByenl3
YXJhIDIwMTYtMDQtDQo+IDI2wqAgMTA4OMKgwqAJCWxlbiA9IHZnaWNfdjJfaW5pdF9kaXN0X2lv
ZGV2KGlvX2RldmljZSk7DQo+IGZiODQ4ZGIzOTY2MWExIHZpcnQva3ZtL2FybS92Z2ljL3ZnaWMt
bW1pby5jIEFuZHJlIFByenl3YXJhIDIwMTYtMDQtDQo+IDI2wqAgMTA4OcKgwqAJCWJyZWFrOw0K
PiBlZDliOGNlZmE5MTY5NSB2aXJ0L2t2bS9hcm0vdmdpYy92Z2ljLW1taW8uYyBBbmRyZSBQcnp5
d2FyYSAyMDE1LTEyLQ0KPiAwMcKgIDEwOTDCoMKgCWNhc2UgVkdJQ19WMzoNCj4gZWQ5YjhjZWZh
OTE2OTUgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMgQW5kcmUgUHJ6eXdhcmEgMjAxNS0x
Mi0NCj4gMDHCoCAxMDkxwqDCoAkJbGVuID0gdmdpY192M19pbml0X2Rpc3RfaW9kZXYoaW9fZGV2
aWNlKTsNCj4gZWQ5YjhjZWZhOTE2OTUgdmlydC9rdm0vYXJtL3ZnaWMvdmdpYy1tbWlvLmMgQW5k
cmUgUHJ6eXdhcmEgMjAxNS0xMi0NCj4gMDHCoCAxMDkywqDCoAkJYnJlYWs7DQo+IGZiODQ4ZGIz
OTY2MWExIHZpcnQva3ZtL2FybS92Z2ljL3ZnaWMtbW1pby5jIEFuZHJlIFByenl3YXJhIDIwMTYt
MDQtDQo+IDI2wqAgMTA5M8KgwqAJZGVmYXVsdDoNCj4gZmI4NDhkYjM5NjYxYTEgdmlydC9rdm0v
YXJtL3ZnaWMvdmdpYy1tbWlvLmMgQW5kcmUgUHJ6eXdhcmEgMjAxNi0wNC0NCj4gMjYgQDEwOTTC
oMKgCQlCVUdfT04oMSk7DQo+IA0KPiA6Ojo6OjogVGhlIGNvZGUgYXQgbGluZSAxMDk0IHdhcyBm
aXJzdCBpbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiA6Ojo6OjogZmI4NDhkYjM5NjYxYTEyNDNmNmFl
OTM5ZWY3ZTkyNTFhNzY1Yjk3MiBLVk06IGFybS9hcm02NDogdmdpYy0NCj4gbmV3OiBBZGQgR0lD
djIgTU1JTyBoYW5kbGluZyBmcmFtZXdvcmsNCj4gDQo+IDo6Ojo6OiBUTzogQW5kcmUgUHJ6eXdh
cmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+DQo+IDo6Ojo6OiBDQzogQ2hyaXN0b2ZmZXIgRGFs
bCA8Y2hyaXN0b2ZmZXIuZGFsbEBsaW5hcm8ub3JnPg0KPiANCg0KSGksDQoNClRoZXJlIGlzIG5v
IGFjdHVhbCB1bmluaXRpYWxpemVkIHVzZSBvZiBsZW4gb2NjdXJyaW5nIGhlcmUuIEl0IGlzDQpl
eHBsaWNpdGx5IGluaXRpYWxpemVkIGluIGJvdGggdGhlIFZHSUNfVjIgYW5kIFZHSUNfVjMgY2Fz
ZXMuIFRoZSBvbmx5DQpvdGhlciBwYXRoIGlzIHRoZSBkZWZhdWx0IGNhc2UsIHdoaWNoIHRyaWdn
ZXJzIEJVR19PTigxKS4NCg0KRm9yIGFybTY0LCBCVUcoKSBpdHNlbGYgaXMgZGVmaW5lZCBhczoN
Cg0KI2RlZmluZSBCVUcoKSBkbyB7CQkJCQlcDQoJX19CVUdfRkxBR1MoMCk7CQkJCQlcDQoJdW5y
ZWFjaGFibGUoKTsJCQkJCVwNCn0gd2hpbGUgKDApDQoNClNpbmNlIF9fQlVHX0ZMQUdTKDApIGlz
IGZvbGxvd2VkIGJ5IHVucmVhY2hhYmxlKCksIHRoZSBjb21waWxlciBzaG91bGQNCmlkZWFsbHkg
cmVjb2duaXplIHRoYXQgY29kZSBwYXRocyBiZXlvbmQgdGhpcyBwb2ludCBhcmUgZGVhZC4gDQpU
aGUgZmFjdCB0aGF0IHRoaXMgd2FybmluZyBpcyBzdGlsbCBiZWluZyBlbWl0dGVkIHN1Z2dlc3Rz
IHRoZSBjb21waWxlcg0KaXNu4oCZdCBjb3JyZWN0bHkgcHJvcGFnYXRpbmcgdGhlIHVucmVhY2hh
YmxlKCkgaW5mb3JtYXRpb24gaW4gdGhpcw0KY29udGV4dC4NCg0KR2l2ZW4gdGhhdCwgdGhpcyBz
ZWVtcyBsaWtlIGFuIGlzc3VlIG9uIHRoZSBjb21waWxlciBzaWRlLCBvciBwb3NzaWJseQ0KYSBj
YXNlIHdoZXJlIEJVR19PTigpIGNvdWxkIGJlIHJlc3RydWN0dXJlZCB0byBtb3JlIGV4cGxpY2l0
bHkgY29udmV5DQpjb250cm9sLWZsb3cgdGVybWluYXRpb24gdG8gdGhlIGNvbXBpbGVyLg0KDQpU
aGFua3MsDQpTYXNjaGENCg==
