Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795491133;
	b=yI5EiBiox3I4J5l3MdEg+DeUZy6WQURk1e+qa36zu/kVorFS81+qcGH2imUGqOSTvSMu
	 M6SIaU6Gittzhmg6j7u2igUG9fsO5IhEqnxspk/jfdYddIucEXCZSltbJzCJVvGN0ERX0
	 NIir0HaqBak4wlvS5lgyB6Zsil4Y1rnrRt8LMwHMEd+/c4N98fkKQ34V8MCvwMTOEWMAg
	 4J+N56swUKf8dV2FioUwyDS7yIUnJg/XpywnD2pI/Ik0NLlhGlbkiLS+xGNOfvWpXHian
	 T4zc6awQj8CT3JciQNecy7p6VB6yQM8iUHgxf3okWUI1SjNidIzADLm4IovFlD4gcQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491133;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=4tdc5fz+TTIUyqhd/sX0yYcf2CBTakNh6VSLCJZIsfY=;
	b=1Alv7Kvc7ZQiy9LCoUFgtbPFymJyPkFWheZJLHGQAuFoDjSAR7b0bnEwBZK88ReB8tbK
	 aEM9unaQ50twu601egwaUj+HG3tVrhQIBdglE6SfuAyvEvveT2fSe7d9ctGpXljOiq/aN
	 JfBi1/Og47hVe2Z7tuan3hbyyyWhEeQ8ekmb6ZBS8eVR77EyBzXn2/vjH9iKV/t1DIJM8
	 XzESniT5rixmsaPqtDZO2oPqQUJaITu4Y689uYFLW1MXIMsxGR/6mTED/QATUkny6OC+g
	 cEDuuXbOubsYMwIlduQEs2ONvdzXaquuhg64DoigYwWxmv25uQDGs5NR4o4Q8yVOPfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=MNIx8ObF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD38606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 03:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=MNIx8ObF
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2mjwW604337;
	Mon, 23 Nov 2026 19:31:55 -0800
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021141.outbound.protection.outlook.com [52.101.62.141])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4j4jtvvjns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 19:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK1OaxAhg1qkSNHhSvBx4o1lTBfjhFDvTvkgqkiqeqDwopvvKxszyggSBM01aZwi5d8QIf9hfkKLoMUU9aZ8uQBHKr80HIojeFMPhTrSRj5DR85MgGgcLS0kPTO6W4mNDX/3SEDBkuT6nbHV/rKBcW+dFRWUiny1AMedhJulkDTmI40PheHv++XMiCwKGPVnn6Djb75/KHdiW7iXtju3PHNfIiTo+yeE96RctVec7iKDbjgsO5jV1KomZL2sN7ms/W/q3sGsQAHYaV/Y/TELDQnZzpJcKu2Sq0cVmQcwGiu5R4KBPeOZKcBUkzF/5obCwwn8Gj4IX1ByqUL2+Mo2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tdc5fz+TTIUyqhd/sX0yYcf2CBTakNh6VSLCJZIsfY=;
 b=N+n60qzm4zTTxYGpMXygqqOtH/BFIcjq79FKqJqXpUklgNNrfyxY1o+CfRQfRSUUoWoRP4nfLZA33Lvu1GoNgmt1gF4/7yvoJI5TvyJ/DccvHviaC1p/UXmjy+GUgXWfGnlsAok7vQBznq798JPPs6VAgmP/tztWEyTpn+DO0qq4GmBmS+WoYAAqm6+cKWyk5ZGTng6iGe9dUD0ID4x/Qb++71TQPOdYn3PrfsFbXi7URpfjFzxihA7kgF6EHH3zLkX/vmSxnEMRPqrSCDlgyJESXkPalr7IeSzVQOJnxGoBjDdoHvG/J7sHZEZ2m8DTMJTMJBJ2QEAu5KEcxPBtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tdc5fz+TTIUyqhd/sX0yYcf2CBTakNh6VSLCJZIsfY=;
 b=MNIx8ObFKqUZuo7NCP6zz37tHczR+c+8EvurdjQrWbh8fMYTzsrdL+7OGVDkPUrkIz5SslfDqMo71pDpX8h0CFVV7o0rli/CM8P5mPxFuLQ4A496NKagF7BDBYm6x/gC4dyflZVj6A+08GV1vnWHCG35DhYWVue59JpURRmN4U0=
Received: from DM3PPF7732E70AE.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::6af) by SN7PR18MB3806.namprd18.prod.outlook.com
 (2603:10b6:806:109::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:31:24 +0000
Received: from DM3PPF7732E70AE.namprd18.prod.outlook.com
 ([fe80::9472:810a:2b91:9607]) by DM3PPF7732E70AE.namprd18.prod.outlook.com
 ([fe80::9472:810a:2b91:9607%8]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:31:24 +0000
From: Geethasowjanya Akula <gakula@marvell.com>
To: Elkin Cruz <elkin@google.com>,
        Sunil Kovvuri Goutham
	<sgoutham@marvell.com>,
        Ratheesh Kannoth <rkannoth@marvell.com>,
        Subbaraya
 Sundeep Bhatta <sbhatta@marvell.com>,
        Bharat Bhushan <bbhushan2@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "irogers@google.com"
	<irogers@google.com>
Subject: RE: [EXTERNAL] [PATCH net] octeontx2-pf: handle
 cn20k_pfvf_mbox_alloc() failure in otx2_pfvf_mbox_init()
Thread-Topic: [EXTERNAL] [PATCH net] octeontx2-pf: handle
 cn20k_pfvf_mbox_alloc() failure in otx2_pfvf_mbox_init()
Thread-Index: AQHdeSTJ0U4wpuBB0UGuWx9hOgx+9Lc8laTQ
Date: Tue, 24 Nov 2026 03:31:23 +0000
Message-ID:
 <DM3PPF7732E70AE5CABA87FF0D18D941780CD442@DM3PPF7732E70AE.namprd18.prod.outlook.com>
References: <20261120192408.2872793-1-elkin@google.com>
In-Reply-To: <20261120192408.2872793-1-elkin@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=marvell.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF7732E70AE:EE_|SN7PR18MB3806:EE_
x-ms-office365-filtering-correlation-id: b7ab99cf-24a9-4b93-cf64-08df49db6a63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|366016|1800799024|921020|38070700021|10067099003|5023799004|11063799006|56012099006|261022105027099003|261021123027099003|261009223027099003|261021121427099003|261026140227099003|261022075727099003|261021135927099003|261102123227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 O19iSy+lhL8Q6xXzuZQCdwCRincskSsQyHwVQkUbgRvyYhig9AAa1yJtMxGO7hcSRNKRpb7w8uA3/nUNeaJwU4VDOEF0O4+oMR1zsoSDxYdw9Mq8jIeI2AaeoBHc+EJ2hfFv2eRkRSrdVHg5bTTH+OMKCfMisly0wauxPIU8/OXUAfOU4YYdVntM/eT/QKTd9q2dYZWrMGKPTt8ONwuFj4m1l62D7Mf6wYFL1JDsazSuLP0qLElRDzuhtpy7JTzWoui2Xm8JNg1BlxaY0bhz1qHdVGLsl+vC23h7lLYk4hDvkspbfFIi+KMg6IdLKVq8Eab49HIYV984nqhHPelBhy4tUYUgBc2FCSOG1mEzKoCzl84M4zdt2LGDIuNrdd0IQPehpBnRJxla4ueUZhicmlUkYi0T7A5kersI3paDvDFcb2s5WqjE13VkkIenI5S51aYboikZI8z3pGXB5Y/NBDsdIMU49MI4nfOFqSK/3VnBQaqnsRnGiv7IyA2OCQuz8QGjyhHaV4Q7M0wBHCWB9NCbDF4ILfBwlhdWoNpINNtYV8jFg6/HLgSHuPcd/qc+X26q0ibeAEIR2a2K+0ucogYD2o0h9QmHikqzM3eDpV96Tl8eGgXBOs06jMHw6/TlIrcNfKxIouaE+THzv9epgaHQs/sXHPolOyhQX1kha/4lzEQ1Xr+wAuXDcjCBqP21VSsFtzpZaqVKRQzQQxiik+D5AEyXFuAIUQr/RQ313Qk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF7732E70AE.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(366016)(1800799024)(921020)(38070700021)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261021135927099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmZzc2ZoeWpmand0dHNlN1pORFMvc0tpd1MzWlpjejBsWDFDYWZBOTh2NXRC?=
 =?utf-8?B?RUxUNW00dnUxdXN2c0J3V1VDK1ppcDg3NC8ybmpaMXFCUzhwcVhWQndvTTBq?=
 =?utf-8?B?andLUENWQzduT1dGNU1sUHE5NmxZT2JNM0hIQjNIQmFQd2dCY2ltWGxqQldk?=
 =?utf-8?B?a1FiN1FNS3d2ZUdpd3REMGtLL3RaY3dUdWFQbW5YSUFhYW9rRDdkQVVQTmtq?=
 =?utf-8?B?a1FuNThHUm54b3ZTYzRYeDhKTGlVMTQ0VXRJemxHRlhRYlM5T1QrdVBVL1c3?=
 =?utf-8?B?VUpuN0dQRWxDZVNKQm9HK25IN3c0M29Oa1FxeWtTbUJmUUhzVVpsV1h6Yk1n?=
 =?utf-8?B?QkdKbHM2RXEzVU42N09ZQXBvdzNQdjM5THdZeEFyOThWRCtZWEd5a2VEOUNn?=
 =?utf-8?B?clAzWEZZZW5ubENBaVhkUHgrRFRPWGttdHZ4WTQxQVd3aXh0VjdsQlhMM1Jk?=
 =?utf-8?B?SVdXYnhNTi9yUENweHZjOWdmS0tkcjYzUzVHeEdTY1RrOFpOYUdDeWl1TVJH?=
 =?utf-8?B?K00wNlN6SUszS2RQSHRKNHJpdlZDcGE2N0RRSjdGNTI2NHM0SU5WODZEOE8v?=
 =?utf-8?B?SFVjd0UvZEhUWE9YaHBRNXFTeG1NSHRxbmNiM3ZVWlE2c0VMWnNwTmd3MGRL?=
 =?utf-8?B?ZE1MTTNkRFNaVnBaT05nMDFkMm92YTBwb3ZYbytFWHRwbG9wL0RsU0IxaXBQ?=
 =?utf-8?B?TDBNbnJzb3FJdXRYeDNhRnZHSXNLQmZFUzcwZTVOazd2VDFqRlp6N09YNkZz?=
 =?utf-8?B?RWNJRThCbytIVTRsdC9OYzlOSUhvcmZRWldkOUhqTVNtRGNNbDZnWmt3cEJh?=
 =?utf-8?B?RnpZMjQ4aStlUFZOVW1tM3B1Mm0wblRMWVJUaWNPR29CWk9ucXpRREx5UE5q?=
 =?utf-8?B?eDVJa0tXY0FkQlJWSDd3TkJsMUhiWDhBelR4RHVJUWpHZUVKWlczTXVSQlpX?=
 =?utf-8?B?dXdXSWdOdmtjbXg5aFlTZkdQOHZMdzFyQ0Fldm1GOEd4SWI1em9YZUZjbTVr?=
 =?utf-8?B?VnhYRVpwWllXY0RtbDBLdlFuLy9pMlRUeFhPK3h4RUZKVlNvQ2MzaHdVeFlJ?=
 =?utf-8?B?cGU3TVZkdDdiVU93UkR2OEp6Q1VEZDRFNTZCQXhrYW5IbWtaamFIL3UxVlg1?=
 =?utf-8?B?VklZaVovanZ6aEZEM0VacEMzcjBKTkRrYWhvclBTcVNFWnlWZUMzeVE0MWpv?=
 =?utf-8?B?NmRhTW55T01vdktpN1JBTk1jd2R6bzR0ZkRXcEk3WTlBTGkwM3oxSFBQdVJy?=
 =?utf-8?B?TWtDWjZFVkxNWFVUY2c1aW55cWRic3ovaHdqK3YzNTVQZEpEdFpoZnVsNm5z?=
 =?utf-8?B?andGeTB3VThLTUY1bXNmTXJ0MkRKazZOb3U2aFQ0aTdYeWFnNytHd1ZGNmtZ?=
 =?utf-8?B?eEUzdmloNWV6YzlJZFF6Q2hGTVVOM1lGNUk2UG5weHkwVTFWYlZGbFRlODNS?=
 =?utf-8?B?MmhVZ0JMeUFiZm5UVjZLNEpsTEpvakF3YmZMV0liTGV4ZVZvUGlFa1o1SitH?=
 =?utf-8?B?eFhxMm04SUFKTlY3S2gyVEsrRVM0Q25FM0ZUNmxRWkFNWXArYnJ6K0tFeVJm?=
 =?utf-8?B?NlJycUtmdzVqbld5ZlBNTFJGVDJwV3BzNFdxTlpKZlJ2NC9LRVk2NDVKNlZ0?=
 =?utf-8?B?cnRNZEJ0U2NFMVgzc2UwWGU2RWowUVBzN0RJMWtibFhuWkRVRjFQYmRvMUo2?=
 =?utf-8?B?SnZyaWYrWUpMZTh1bWtrMWJ0K2E0cnljUTVlSVhUeXZjR29PRStrYnljSU9l?=
 =?utf-8?B?b3J0eTBNQ0JSczJBQ211K2luZkVzV1doMFQ3SkFOVUU1RFowaWdtSlFKZ2JL?=
 =?utf-8?B?aUlGTjBNcHpqeUwxMGo5L0phZ2dMU05LZDBTVC9hQ2xGZDRxLzluQ2dBODNN?=
 =?utf-8?B?aGdnMnczZXFNWE5ia2g5NnVvMVU5cEIrcDc0WnpTdW1FVTdXUEtsejRudFB3?=
 =?utf-8?B?TitEN3lDT01yR1pUMlVDZVcvRGhsaE1hL0s2YWVSTG1ITHVHY3U2TGp1MWxq?=
 =?utf-8?B?RXRYcUZvanh6NkNDb29GTmxMZVRvenpwYldYeUI5YllIMkREZlgwbEpEZGp4?=
 =?utf-8?B?OTluRHpIL3JFZ0NMN204MmVxbkxTL1ZoSzRTMmFmdVIzTmZKUHRtWkNQVFQ3?=
 =?utf-8?B?eENBNEdNaHY0L1hFYmpQOENBSmFTSHhyZ0h6eHBkbyt0WEhoQktGc1BXampS?=
 =?utf-8?B?Y2tzZUx2cGVBQXV0bk8rbmhsdDMwZVBwUW1QYUZKT3NBZUVwcllFYk5xT2dJ?=
 =?utf-8?B?Ky9wWElLTGZnVG1ZM083aVd4Um5CZ2haNC9rOTQ1bFJqcUt3QjI5MWNqeDJ5?=
 =?utf-8?B?R2YyUmxvNnFIRWJJN0pidGFxK01id0R0VEFXM21nQnVoZ2ZyZm9jbW9aUDdO?=
 =?utf-8?Q?f0QjmQuVEiCZCqcBBf5uasDN/SbOvcs4yZVre?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TNDJGGzs0Q3V9R68rx6Eg8sgGXnsRZ4fEU1594w533e1qo2RWhD86taFlmDDEg3O+argerqoFGcnmOHiQtN2cE0+hicBF394Kqq1hZGzznGMFPYCYCPqNe1Nnw/oBXrNAQpBG8wUH2iNDn6PfZTpNV3qKS0fhiEQe2u0VabCSXE47p6HoSj1043E71mmEtNxducnCtl+FUcbfAxCoOLxjf3TvjoKKl2L2taaRFBD1lUJLWTVUNZ+fCX2aboFDZ/vOdgGkbgUeudxt5rwshWlDbkl+xei8rjTowBM1A4RV4HY+mShFp+zWrlYLybUrSsXNttsY3tryTpIzVKSGKBRyA==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF7732E70AE.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ab99cf-24a9-4b93-cf64-08df49db6a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 03:31:24.1076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pd0WxolG2P1bUTF2MwiF+yeHlTNmMUMGKkvU6g/uqml+EvwUl5lJ1khT200po/ovKLkiGeDiC8gVgrdqnpJqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB3806
X-Proofpoint-GUID: 3jbnN4MA2hhvioP6PfR0dRRUX4a3g0SG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMyBTYWx0ZWRfXzV2ZUJ+Vm3rN
 eVvwYf2StI3ZqH0xTn7PZN4oxd9Sx5/elPogKSOgPeCbaA4wRMc7xEXqjmdg+A6iFBXMmuPlNRJ
 prs80jczThpw6Cog4PYTI1y4aKx4oaA=
X-Proofpoint-ORIG-GUID: 3jbnN4MA2hhvioP6PfR0dRRUX4a3g0SG
X-Authority-Analysis: v=2.4 cv=HY2B3SE8 c=1 sm=1 tr=0 ts=6b05052b cx=c_pps
 a=YwNxXrBOkeX2Yvw65jHa0Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=-AAbraWEqlQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=qit2iCtTFQkLgVSMPQTB:22 a=1XWaLZrsAAAA:8
 a=M5GUcnROAAAA:8 a=J1Y8HTJGAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=EPARX849G8MDnL3lJu0A:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMyBTYWx0ZWRfX1gplZ1hKIqer
 7X19eSqJmeHuAmSoV/GrQterISU4CGBWERtcgIYxZQc9TgcIcGfJjHjIJ56XN+NfniYQnju+F4O
 Q6UOD9XofrTc44IiYT79ta1ttUP3CwcrqJWRoOX3yf6Xui5GrdYSRXyhJQWJid0fbd2x/pgLf7t
 +t37Z9S3PhBILrAxKZ5SIkd60buIpxbo5RaE32W/dw1sOj6gSu3od8u0P9W5CkD2JGiAxiXq2M7
 HG4yavqb7MFeaKNm/O7jVPAMGxD8pr1Ld3TRzS1Js5IqDdvVDogh9WitQibwCWHxzCmHmV2SyYA
 0DTA7OkOIwfYOH6nNn4N52bFeLEqMeNWz2nx941zvipuk1nHBeXnD7KdTp0qYeiIsQGm7ZBcEvd
 DpE8CxBQJ+56c5ETcaIbfuLivDa250lWbpPHgFL160AMfl8Vj8Ef0ndbS7M9jwpluM+1sVZdw1n
 15KPWeNL5Q0ezlg1YjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVsa2luIENydXogPGVsa2lu
QGdvb2dsZS5jb20+DQo+U2VudDogU2F0dXJkYXksIE5vdmVtYmVyIDIxLCAyMDI2IDEyOjU0IEFN
DQo+VG86IFN1bmlsIEtvdnZ1cmkgR291dGhhbSA8c2dvdXRoYW1AbWFydmVsbC5jb20+OyBHZWV0
aGFzb3dqYW55YSBBa3VsYQ0KPjxnYWt1bGFAbWFydmVsbC5jb20+OyBSYXRoZWVzaCBLYW5ub3Ro
IDxya2Fubm90aEBtYXJ2ZWxsLmNvbT47DQo+U3ViYmFyYXlhIFN1bmRlZXAgQmhhdHRhIDxzYmhh
dHRhQG1hcnZlbGwuY29tPjsgQmhhcmF0IEJodXNoYW4NCj48YmJodXNoYW4yQG1hcnZlbGwuY29t
PjsgQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZAbHVubi5jaD47IERhdmlkDQo+Uy4gTWlsbGVy
IDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgRXJpYyBEdW1hemV0IDxlZHVtYXpldEBrZXJuZWwub3Jn
PjsNCj5KYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVu
aUByZWRoYXQuY29tPg0KPkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPmxsdm1AbGlzdHMubGludXguZGV2OyBpcm9nZXJzQGdvb2dsZS5j
b207IEVsa2luIENydXogPGVsa2luQGdvb2dsZS5jb20+DQo+U3ViamVjdDogW0VYVEVSTkFMXSBb
UEFUQ0ggbmV0XSBvY3Rlb250eDItcGY6IGhhbmRsZQ0KPmNuMjBrX3BmdmZfbWJveF9hbGxvYygp
IGZhaWx1cmUgaW4gb3R4Ml9wZnZmX21ib3hfaW5pdCgpDQo+DQo+T24gQ04yMEssIGNuMjBrX3Bm
dmZfbWJveF9hbGxvYygpIHJldHVybnMgRVJSX1BUUigtRU5PTUVNKSB3aGVuDQo+cW1lbV9hbGxv
YygpIGZhaWxzLCBidXQgb3R4Ml9wZnZmX21ib3hfaW5pdCgpIGFzc2lnbnMgaHdiYXNlIHdpdGhv
dXQNCj5jaGVja2luZyBJU19FUlIoaHdiYXNlKS4gT24gYWxsb2NhdGlvbiBmYWlsdXJlLCB0aGUg
ZXJyb3IgcG9pbnRlciBpcyBwYXNzZWQNCj5kaXJlY3RseSBpbnRvIG90eDJfbWJveF9pbml0KCks
IHdoaWNoIHdyaXRlcyByZXNldCBoZWFkZXJzIHRvIGh3YmFzZSArIGRldmlkICoNCj5NQk9YX1NJ
WkUgYW5kIGNyYXNoZXMgdGhlIGtlcm5lbC4NCj4NCj5JbiBhZGRpdGlvbiwgaWYgb3R4Ml9tYm94
X2luaXQoKSBmYWlscyBvbiBDTjIwSyBhZnRlcg0KPmNuMjBrX3BmdmZfbWJveF9hbGxvYygpIHN1
Y2NlZWRlZCwgZnJlZV9pb21lbTogc2tpcHMgcW1lbV9mcmVlKCZwZi0NCj4+cGRldi0+ZGV2LCBw
Zi0+cGZ2Zl9tYm94X2FkZHIpLCBsZWFraW5nIHRoZSBETUEgbWFpbGJveCBhbGxvY2F0aW9uLCBh
bmQgaWYNCj50aGUgc2Vjb25kIG90eDJfbWJveF9pbml0KCZtYm94LT5tYm94X3VwLCAuLi4pIGNh
bGwgZmFpbHMsICZtYm94LT5tYm94IGlzDQo+bm90IGRlc3Ryb3llZC4NCj4NCj5DaGVjayBJU19F
UlIoaHdiYXNlKSBhbmQgdXBkYXRlIGVycm9yIHVud2luZCBpbiBvdHgyX3BmdmZfbWJveF9pbml0
KCkgdG8NCj5wcm9wZXJseSBjbGVhbiB1cCAmbWJveC0+bWJveCwgZnJlZSBtYWlsYm94IG1lbW9y
eSBvbiBDTjIwSywgYW5kIGNsZWFyDQo+cGYtPm1ib3hfcGZ2Zl93cS4NCj4NCj5GaXhlczogNzBm
ODk4NmVjZWYxICgib2N0ZW9udHgyLXBmOiBDTjIwSyBtYm94IGltcGxlbWVudGF0aW9uIGJldHdl
ZW4gUEYtDQo+VkYiKQ0KPlNpZ25lZC1vZmYtYnk6IEVsa2luIENydXogPGVsa2luQGdvb2dsZS5j
b20+DQo+LS0tDQo+SSBhbSB0cnlpbmcgb3V0IGEgbmV3IENsYW5nIHN0YXRpYyBhbmFseXNpcyBs
aW50ZXIgZm9yIEVSUl9QVFIvTlVMTCBoYW5kbGluZywNCj5hbmQgaXQgZmxhZ2dlZCB0aGlzIGNv
ZGUgYXMgcG9zc2libHkgYnVnZ3kuIFRoZSBmaW5kaW5ncyB3ZXJlIHRyaWFnZWQgYW5kIGZpeGVk
DQo+d2l0aCBhbiBBSSBjb2RpbmcgYXNzaXN0YW50LCB0aGVuIGNoZWNrZWQgYWdhaW5zdCBsaW51
eC1uZXh0IChub3QgcnVudGltZS0NCj50ZXN0ZWQgb24gaGFyZHdhcmUpLg0KPg0KPlRoYW5rcywN
Cj5FbGtpbg0KPg0KPiAuLi4vbmV0L2V0aGVybmV0L21hcnZlbGwvb2N0ZW9udHgyL25pYy9vdHgy
X3BmLmMgIHwgMTUgKysrKysrKysrKysrKy0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9tYXJ2ZWxsL29jdGVvbnR4Mi9uaWMvb3R4Ml9wZi5jDQo+Yi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9tYXJ2ZWxsL29jdGVvbnR4Mi9uaWMvb3R4Ml9wZi5jDQo+aW5kZXggY2I2MDJhNGFkY2Zi
Li5lNjcyMjc1MWRlN2IgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVs
bC9vY3Rlb250eDIvbmljL290eDJfcGYuYw0KPisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21h
cnZlbGwvb2N0ZW9udHgyL25pYy9vdHgyX3BmLmMNCj5AQCAtNjE4LDYgKzYxOCwxMCBAQCBzdGF0
aWMgaW50IG90eDJfcGZ2Zl9tYm94X2luaXQoc3RydWN0IG90eDJfbmljICpwZiwgaW50DQo+bnVt
dmZzKQ0KPiAJICovDQo+IAlpZiAoaXNfY24yMGsocGYtPnBkZXYpKSB7DQo+IAkJaHdiYXNlID0g
KHZvaWQgX19pb21lbSAqKWNuMjBrX3BmdmZfbWJveF9hbGxvYyhwZiwNCj5udW12ZnMpOw0KPisJ
CWlmIChJU19FUlIoaHdiYXNlKSkgew0KPisJCQllcnIgPSBQVFJfRVJSKGh3YmFzZSk7DQo+KwkJ
CWdvdG8gZnJlZV93cTsNCj4rCQl9DQo+IAl9IGVsc2Ugew0KPiAJCS8qIE9uIENOMTBLIHBsYXRm
b3JtLCBQRiA8LT4gVkYgbWFpbGJveCByZWdpb24gZm9sbG93cyBhZnRlcg0KPiAJCSAqIFBGIDwt
PiBBRiBtYWlsYm94IHJlZ2lvbi4NCj5AQCAtNjQ0LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQgb3R4
Ml9wZnZmX21ib3hfaW5pdChzdHJ1Y3Qgb3R4Ml9uaWMgKnBmLCBpbnQNCj5udW12ZnMpDQo+IAll
cnIgPSBvdHgyX21ib3hfaW5pdCgmbWJveC0+bWJveF91cCwgaHdiYXNlLCBwZi0+cGRldiwgcGYt
DQo+PnJlZ19iYXNlLA0KPiAJCQkgICAgIE1CT1hfRElSX1BGVkZfVVAsIG51bXZmcyk7DQo+IAlp
ZiAoZXJyKQ0KPi0JCWdvdG8gZnJlZV9pb21lbTsNCj4rCQlnb3RvIGRlc3Ryb3lfbWJveDsNCj4N
Cj4gCWZvciAodmYgPSAwOyB2ZiA8IG51bXZmczsgdmYrKykgew0KPiAJCW1ib3gtPnBmdmYgPSBw
ZjsNCj5AQCAtNjU1LDExICs2NTksMTggQEAgc3RhdGljIGludCBvdHgyX3BmdmZfbWJveF9pbml0
KHN0cnVjdCBvdHgyX25pYyAqcGYsIGludA0KPm51bXZmcykNCj4NCj4gCXJldHVybiAwOw0KPg0K
PitkZXN0cm95X21ib3g6DQo+KwlvdHgyX21ib3hfZGVzdHJveSgmbWJveC0+bWJveCk7DQo+IGZy
ZWVfaW9tZW06DQo+LQlpZiAoaHdiYXNlICYmICEoaXNfY24yMGsocGYtPnBkZXYpKSkNCj4rCWlm
IChpc19jbjIwayhwZi0+cGRldikpIHsNCj4rCQlxbWVtX2ZyZWUoJnBmLT5wZGV2LT5kZXYsIHBm
LT5wZnZmX21ib3hfYWRkcik7DQo+KwkJcGYtPnBmdmZfbWJveF9hZGRyID0gTlVMTDsNCj4rCX0g
ZWxzZSBpZiAoaHdiYXNlKSB7DQo+IAkJaW91bm1hcChod2Jhc2UpOw0KPisJfQ0KPiBmcmVlX3dx
Og0KPiAJZGVzdHJveV93b3JrcXVldWUocGYtPm1ib3hfcGZ2Zl93cSk7DQo+KwlwZi0+bWJveF9w
ZnZmX3dxID0gTlVMTDsNCj4gCXJldHVybiBlcnI7DQo+IH0NCj4NCj4tLQ0KPjIuNTYuMS43NTAu
Z2Y3MGRjNjgyY2YtZ29vZw0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NClJldmlld2VkLWJ5OiBH
ZWV0aGEgc293amFueWEgPGdha3VsYUBtYXJ2ZWxsLmNvbT4NCg==
