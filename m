Received: from mx0b-009ae801.pphosted.com (mx0b-009ae801.pphosted.com [208.56.12.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBC328267;
	Wed,  2 Sep 2026 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.56.12.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321246; cv=fail; b=UVAOOxhi3O1xTciUIRw/TgK+aynNK0DhJHNrRTZ20ZGZldVHCsYD8W6RjmRmqZZNChHU9qitHJ3ddbeWl/hSBO1mqhDogHBqYvRgpcbHbszIpsTpt4Zig8KXulU/GxzugA+rF+6T3SMiJlf/f2k2z1kTUqQzrSjtKSrLgbD6pKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321246; c=relaxed/simple;
	bh=opiTLe5ZaJKTJhaPyo291qpVykXdzNa9wSFWT7UEcJM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K+T80XjNC/+VnHhUsj0f2QNrf+7exGfDzLsI+/WgzUCvCLeGT4o14DJrJp+bnaN5RScn5mGL58A2HY1nvAEC8kx5rYuCBHBy1fRdLTnjJIUdtC0jcnnK+C8NIZFJsPO108OFsjfX/hCGaeCrSVCT5mPxIESkfqB8zsuLVDH7VOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=issi.com; spf=pass smtp.mailfrom=issi.com; dkim=pass (2048-bit key) header.d=issi.com header.i=@issi.com header.b=KaiY8hvW; dkim=pass (1024-bit key) header.d=issi.com header.i=@issi.com header.b=FAltUu7Q; arc=fail smtp.client-ip=208.56.12.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=issi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=issi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=issi.com header.i=@issi.com header.b="KaiY8hvW";
	dkim=pass (1024-bit key) header.d=issi.com header.i=@issi.com header.b="FAltUu7Q"
Received: from pps.filterd (m0495960.ppops.net [127.0.0.1])
	by mx0b-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681MYSIF644600;
	Wed, 2 Sep 2026 11:20:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=BwiJMa3SSVrXj750j0J8xmG
	Ro32y4GPWSL2zKxXju7A=; b=KaiY8hvWyiTEfOisnbo38xREMDRje9bR8Pv1Eqk
	/PBkHTU8h8a/UgD5NVRcS6644iS4hA5sPzb9ga8vRtbR1WawP9pVk/n0kjD3D2s4
	xv/LJrQJiCpflKeYKLdCv9CSxN+qdhA8K2La5LjlKBfpTjYx8Wdtpb3SSmAI85/1
	e02SRpghOnLwJoz6QaAd9WxgWMGqp8F/HTP2HLzxv8aP5F76JZY77q/XZw7t0mdL
	4oTNOMEXfVao1N2hh3ukofMWMVQDQ5LtMX9T9LUK1RxBaFFprwAmJDA9g70tZnck
	IrH9+WtvUkue+YWwsT/kP/t4pPVZvT7uACUWMsxd7uWwYbw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020072.outbound.protection.outlook.com [52.101.193.72])
	by mx0b-009ae801.pphosted.com (PPS) with ESMTPS id 4gc38r2chc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 11:20:19 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeDy/5QsY50oDja5n8e/t1+kU8VYjlUbJv600VBj2CG0OyoHpiPacbJjODvtYv8bUTic7MR7MIDDsR4o7PY8dGASuAbI/eePv0zp6lggRKZIPMZVmhTmse9ToH25KQKsq7uYwl2x1qlxBLW5AUBAlfIFWdOb6B7WLSnXNuKpWVR5oc2k/oKvY7fP3e0Z/9lUr6e6bfI4O1T6cxWk/5bT9NEm9Yx0Vwn4Cskpx0iDEcZ5WE5hlPrwpbe5whBZOZxamIPSJGlpogq93w0c+cfDBCDiJQmlWs0vRBE/GRGgy653v3xZoBP3hjmq7xKTVkI1EaoxIW7Gyd4FzL5w/XSluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwiJMa3SSVrXj750j0J8xmGRo32y4GPWSL2zKxXju7A=;
 b=tNd9tq/dqVcltetH5o/H7q1NMz04yIEAfWv43gT2BouFwOLYBxBdIuQKZvluBxtHB32PFlwSSzvminLQUu9A52ilnKJ6JV2FnBFvQYkF85Ghu/kLKibB0op2TAi4jNnPxw/EOB9Ax3kG0ffbMUT6T0PiV/3b6mhoLLsoNm8lcgYiTIgCbURf9wTUh2FEFG3z2F2R1bmR9xtO1qZHwLoPdtvHIPFrG8zXDb3uoynzgNIcWjvJcDF0TTCBSYnc5IoXc3Nb8aIwhqt400sZVEA3xgavUaSCzEOrrMY34WLJfSIX4e+ComoYt0EFen0xxvnJlQVwXj3+NyvIIo8oBvl8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwiJMa3SSVrXj750j0J8xmGRo32y4GPWSL2zKxXju7A=;
 b=FAltUu7QFNvPZHv4QbkUGdwd+PVt6QRsVD+aEZfdkW2qRQXILb+eD5NrRSU/j68ZR9X50TlSzlnwDjqfV3YkOs1Hx3XEKYqT2F4VVtGWwQSMywe0RPHnTUsIW+K7FCNRZOkYIV+yZEpGopFGgf6y5QvMaMyl9qLnld809tUk9bE=
Received: from SN4PR19MB5424.namprd19.prod.outlook.com (2603:10b6:806:20f::17)
 by SJ1PR19MB6235.namprd19.prod.outlook.com (2603:10b6:a03:45a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:20:16 +0000
Received: from SN4PR19MB5424.namprd19.prod.outlook.com
 ([fe80::a330:824b:6f5:98bf]) by SN4PR19MB5424.namprd19.prod.outlook.com
 ([fe80::a330:824b:6f5:98bf%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 03:20:16 +0000
From: Jeffrey Yu <jeyu@issi.com>
To: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com"
	<computersforpeace@gmail.com>,
        "bbrezillon@kernel.org"
	<bbrezillon@kernel.org>,
        "richard@nod.at" <richard@nod.at>,
        open list
	<linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] ISSI Octal SPI-NOR device support. PATCH v2
Thread-Topic: [PATCH] ISSI Octal SPI-NOR device support. PATCH v2
Thread-Index: AQHdOomdWJvC+T51oEebcOUJVrt82Q==
Date: Wed, 2 Sep 2026 03:20:15 +0000
Message-ID:
 <SN4PR19MB5424FD0059A9EE3C41FB7D79B6B72@SN4PR19MB5424.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR19MB5424:EE_|SJ1PR19MB6235:EE_
x-ms-office365-filtering-correlation-id: f1450c4e-caf8-4719-4f28-08df08a11bd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|18002099003|56012099006|13003099007|38070700021|10067099003;
x-microsoft-antispam-message-info:
 pzfXMb7p8z5S7PBulOwCWZaT45WHqjBiyfWroPTFbHucbmWnrwCf96SukXVx4fvwywyoL0rGYqyAAmE6AxPdBfNqulLJSo1YRDqf8MFWHAZXCP+F6ddSNasaE95Ilfjg4IRI2wPQVzbmjN/78+SMsmmmWoQCqkeSRL/h3j17/C3zCf7MIogp3Bb4DCnHZnl7rnavlikPRD6BOuhCvMQM2ML93QGEe3UFr+yCnfYuulC5j/8g1wSMNg6oYGQQoWTKaP6hx70YNyuH+TlrESdDBKzzwA65NjI1X31bekUx37SZu/zoS1VtrlUwVMLbBEnXVXSq69PM7mp6+XIG5tFZl4UjJV3byLv1QBh6DsGhXyie4eLulsU0lpVPGrA5Rnywq14lfZPSXZhSOigAR4XqoDxOufXYvv1+FFNc11CXt36QOTwQqMxEa+hH8hcmNxeJZAwyGuFhodfxWi8TJ0S+K2OPswMvjGYp8+xV+3hwLWA12VSbpfvRcl6+uN7Wy7+GWH5it0Zx/7S6C5TSVWlflsBmjaO1F824qw6POxqeCgZp3b+anKm/uKBo0sGH4R1wPZ5N+DOUT45h7koR79igq1QdpVRkHFot66gu2nJ9LGDvzUQcyZ6cWGi1ShQftvTqRUhl/SBa6h+L6onbxA5go9lyvi3qNBI2LR8VsChPxLdaFsB9JslPG/eVLYy5jcmr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR19MB5424.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(18002099003)(56012099006)(13003099007)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HdcYBL/8npOd2z42r14UBUujwM5kBHNm44alumjMTk9o2+pEBzPceTja53?=
 =?iso-8859-1?Q?HrxGjDH26D8d9kwN0iBQgyIORI1t0BWMMlNgPtB2NUIw8Sb8X447+/cfT1?=
 =?iso-8859-1?Q?j/Rnk8OVzKgTSVqBq6FI70Yr89zPpstoLoMNSphuNgDCRl2Yugv6bGcqfi?=
 =?iso-8859-1?Q?elIrBkQuK6Uqaki+ibvCwLLZFaVLVQkitdMcHq/nP3FxHvPBfAdaVadkUW?=
 =?iso-8859-1?Q?ijo6m5fFIXk9i3wHbcD0Eq3t4Baz8Opw1ba6/sE0hfCD9Mnzz8UHOalgUA?=
 =?iso-8859-1?Q?29TsIDJPu69l/f3szP8jBKOEJrkqpoBV/FyFOZFQcj/LW6q7ydiaauNPzB?=
 =?iso-8859-1?Q?Fkbks4XFwPnuz68KZN9LhVFQ2BlBzTDikODweynT/P/4JftbMCkeYorMyf?=
 =?iso-8859-1?Q?BeXAZNlk87R/Cxcmsg5NcdonJjXo5L2K0e0RBRV1hWpK3L9YeCksadoqIV?=
 =?iso-8859-1?Q?iSfxitUwtcltlCnOQ/CmhiWq5htg5T+cZl3JKXHP9sifvEd3UJ0UsmauVd?=
 =?iso-8859-1?Q?CaVVFoTiTNVnpnK39BEXWj7rJz8FoWd9LLxTrW5oAMOp0qx/x5F4YIsHvv?=
 =?iso-8859-1?Q?IsNmH5/ZHj+mFrBX/3rWXyY5SPbOy8tivhJjgVIEv83Zh/Hw1nunX7gDY/?=
 =?iso-8859-1?Q?5awwsTNJCQjWL2TnRLPAaJofGnXSiMsmTDIhDcrh47pcvWqx3xobacIomY?=
 =?iso-8859-1?Q?y1z+wuPPGigc3EHcOTclM1uFSZ74U9FE+q/kADL7ywk264FLyQCbe3q7Zh?=
 =?iso-8859-1?Q?JxaJ0mNv9NDb/OZheK1Ck9azgBK1zd9v3FY+ltzMLm+6JGxkCI1yBpeHK1?=
 =?iso-8859-1?Q?1wl5/dZEErx1E4i5NkygCVqpSt1wjP/U/bBGBmRFB/0c1E+7vmEh5vS5Ir?=
 =?iso-8859-1?Q?gWylCgwO5w/KxcHea0MLwRzGByZ1fW0H+PsuyqHq6EN1XbdpB855Q/H9Il?=
 =?iso-8859-1?Q?hlgI3Mdgai4DnYXSu3ujO4Uyl5LVDamd4CHtLRoKX+aw4or2FSKTddXLjD?=
 =?iso-8859-1?Q?tjfz/ItgOIvfa68OzYMbH7w6E+ncNr4OQiz/0OcUNSr7vsDwCTTnJokZMS?=
 =?iso-8859-1?Q?9g8SSSgvPcDhxzwSKhhdV91FDauJEznP5l7MNQfrvXXhLlcIouD34IouwK?=
 =?iso-8859-1?Q?mj6nWM2DIitmJ+b933fk4Ck7Y7DQttFJVHcUo4Lc5tPvyxRgZumaIuSOuG?=
 =?iso-8859-1?Q?0EnIN231YdD7YFXbTPnyO7TEj29XuK7ZFkFSPVyP2PvqbjsIND123/RXG/?=
 =?iso-8859-1?Q?z0F9Quz0rgHJ56KrVoLRi5XjRo9ohPMl2IlNnUoGWIxZpX2DNT6aGCCdz0?=
 =?iso-8859-1?Q?JYq1TQkngxOs77aA9KqYdVruQ03HwW3Kt4Fz91xaC5LI5eG7piEIOsi4tT?=
 =?iso-8859-1?Q?3vIi4oji45UDObirKqGt9HGtP6BxZv77ibGYZJ3ZtkUedj1uJ8XKkfV80U?=
 =?iso-8859-1?Q?olMaCdcNPJmilQbterOH5LzP883jJSTgVQuHgoydKPzIcemWfT43ueA30r?=
 =?iso-8859-1?Q?6o9lGKbQY/WpNaFmdMFyisERYGvLOFEvrcj4H7MvqCCZE9/6/u4zcCUTLL?=
 =?iso-8859-1?Q?x6pwy127vQoEG4HmWo4coms5wj4kmZcZO7RO+6NoC/3AuPmz3H5lZNQUWn?=
 =?iso-8859-1?Q?JvaMfgM9/FsY8aggSeqnQNCebXqjLrEGyz4zjgfDlNy7INSbnirdTTQPJF?=
 =?iso-8859-1?Q?9QfAIfzdLlNFAuhyD2UcItCX6C0g85E9LPRJbLTwH5KT4n3pU7oUNjkIMb?=
 =?iso-8859-1?Q?UDSNH9rxaVMdlY54Ox2Ptw1tc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	2idGhadkmu0AOR4Yl5Rdv/f4ryBR2kjoqEeF3NxgArs0LgGXPBcr2IhUn7C8MJ/z2em6tFku7gbd23yhWmsZYp0QIfuGF+YJOUXznSxKlH2t9BcQM9xCZzyHf43ZyYvpo9PU3RkHOV8+zkq1p1oCNmkOddu/fP+evmHlcoqJp9sFu2v1IRff92bospeUUYuBqO5EUd9Z5n3kQHruIWbVf3gIoR632QOjsoDZwX7+fA/+8KlLD/xDJCrEi8m+kXMBC8mSzY5sGHz769Sg8HcKuAFU6elbE4+uDfOtrvPlsUAO6u5jhAr4WErVa58RLvw0kfGVba6tVmtm/CvSF6y96A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3WOp76s9UNFUeTcNCwezd2DZfEu1J/SPP7XiTTMsGIy+AP0XoGuNDceuDNFeZ/MmmV1DRi880XemMAKLWOaoJ1h5OBUsRAUH09+RlL+RUg/ltJyM7FoIe3wzRIc2A54IXGpNV7aZ5MidhA/tZ0wUFXY/wZO/l9LdVRRYppy37jE9dEtpqzcbE44EWuLU1/KHntiLDLLuVEJIMNlDSwQOmKDAled1mr10qBAAok/kKV2/nuTMHSAItE2bpOt2wFhxD9wOxukr6CdGdK8Ky91AeJCwSaaImy6gYZwZGFbWgvjXiXJnzulEbX/kI7oovqDjBqM633Hy+qsc6LtvwGjQQEFnqC/IQnEWocQImc198CF04NFRnePPF2dWS8o/DlrhJNTDYmKcqQ60UXjbItDvaHp9/ZWbeR+TLwQ8X4fM1Q79aQSgeK8D+6uKEf8rIVOlNDkF+qWcStd3om3QGplPJ7fOt1xjkFmV+JBYiSA4HpUkZUkXamF1bEJ9do93yPhNc7aHql3gNDt8gplO/2tD2duHI8dOi5qA9r4EGcJM0HjOUxXqBOTCAUS1fsIz6ceC6XBxy1QfL9Q3JQYT4CMMZUYNBvWvRjMK9cA9el3go9eyeXodivACmgrlx45FMD4l
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR19MB5424.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1450c4e-caf8-4719-4f28-08df08a11bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 03:20:15.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nS76yd6uSTDsu02SgPVmof2W1L/sPokHEiRYvBSWCL3dEZ33YHs+OTcbKlrfRp+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6235
X-Proofpoint-ORIG-GUID: YI69XSNKtoOhtAZQzgupYWYilkd6ZbFB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAyNiBTYWx0ZWRfX3wPECm1P5yzV
 yalewtW39PcWG3jfjECDogLwGl0W1aEbvsQp8aHtezWKPJQuqGO7kpaub9Iu+NeRLXirvPQ95m/
 6irhpobPespQEst1Fq7PzbMbsXB3/IY=
X-Authority-Analysis: v=2.4 cv=QfhWeMbv c=1 sm=1 tr=0 ts=6a9795f3 cx=c_pps
 a=Zdr5CJPvojCt9J1NFubJrA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=US3Q6AVWkkt9IXfmMOXc:22 a=DUnRZS7UAAAA:8
 a=sKAcNKw0jNAmvty-Qg4A:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-GUID: YI69XSNKtoOhtAZQzgupYWYilkd6ZbFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAyNiBTYWx0ZWRfX2YlLzb16ELka
 RXP2etodu2HUNeB/iBCPa8YeDcRmJXnR07Bebz0JZqwSEz5qvROoamJDFSYUaKT0akB2UMaOHD/
 NWdG2AGKcCvd67iVevNXdPO9w0GP3VWMMyoO1KC+ge4mvawMV85A9CGXm+jR8wbBDv4w4bxqaHi
 SDKbr5oiS8QHO9ihpPA7yximuzRqqwf94rqRzEkNzWD5Pjf9G5f+osu/2tLLWxpvXEavi+aYOVw
 gzTq+277OnAzx6qF2YL3PK0qszgexJCTmJZOvyHNqg8sPxK8ySrV3uWTrSqsUWVStBnfzUvFDC/
 K5Ei/5nY2qbmSuPvKtHci/6p765iPXqedePOO6XEd6k5oyd4y8S7Tnc/DKLJz+ZXQELrtsJ1FS/
 xlbmIOVhKvRie8TN83Zihh7MyNZ5/ttjt3UzvDMUAFZpjAOscw/XoaPslMaruEibGz+80P8Ht8B
 M18NfqhDxOPg62lJufA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020026

This patch revision fixes issues reported by kernel test robot.=0A=
Newly added devices include:=0A=
  - IS25WX256  (JEDEC 0x9d5b19)=0A=
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf=0A=
  - IS25LX256  (JEDEC 0x9d5a19)=0A=
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf=0A=
  - IS25WX512M   (JEDEC 0x9d5b1a)=0A=
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf=0A=
  - IS25LX512M   (JEDEC 0x9d5a1a)=0A=
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf=0A=
  - IS25WX01G   (JEDEC 0x9d5b1b)=0A=
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf=0A=
  - IS25LX01G   (JEDEC 0x9d5a1b)=0A=
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf=0A=
=0A=
Signed-off-by: Jeffrey Y <jeyu@issi.com>=0A=
---=0A=
 drivers/mtd/spi-nor/issi.c | 24 ++++++++++++++++++++++++=0A=
 1 file changed, 24 insertions(+)=0A=
=0A=
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c=0A=
index 18d9a00aa22e..08d83f0b5413 100644=0A=
--- a/drivers/mtd/spi-nor/issi.c=0A=
+++ b/drivers/mtd/spi-nor/issi.c=0A=
@@ -126,6 +126,30 @@ static const struct flash_info issi_nor_parts[] =3D {=
=0A=
 		.flags =3D SPI_NOR_QUAD_PP,=0A=
 		.fixups =3D &is25lp256_fixups,=0A=
 		.fixup_flags =3D SPI_NOR_4B_OPCODES,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5b, 0x19),=0A=
+		.name =3D "is25wx256",=0A=
+		.size =3D SZ_256M,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5a, 0x19),=0A=
+		.name =3D "is25lx256",=0A=
+		.size =3D SZ_256M,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5b, 0x1a),=0A=
+		.name =3D "is25wx512m",=0A=
+		.size =3D SZ_512M,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5a, 0x1a),=0A=
+		.name =3D "is25lx512m",=0A=
+		.size =3D SZ_512M,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5b, 0x1b),=0A=
+		.name =3D "is25wx01g",=0A=
+		.size =3D SZ_1G,=0A=
+	}, {=0A=
+		.id =3D SNOR_ID(0x9d, 0x5a, 0x1b),=0A=
+		.name =3D "is25lx01g",=0A=
+		.size =3D SZ_1G,=0A=
 	}=0A=
 };=0A=
 =0A=
-- =0A=
2.43.0=0A=
=0A=
