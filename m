Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.148.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795329333;
	b=G+No3J1/LeRSQRpQVgLrq9LjHuD5syMG+AjVggAxk92bAGoPiL8wKuBF7lbVS7lUOCez
	 4+DTexROrQn7e0sOIo2evKJ3uXy3r/ED9ywQbNE5KhqUs41DmuS0s19pPzAP6sTHH0gfY
	 ZtSIpvknVY7TppqzLL7mPao/a7pxNl8TgJ6Rb7AXqopq7OPaY1QxFuhvbsEbKQiyDuK/P
	 CXe+4JPMLMvAtuBUz9/p5pgZAN1bqQWZMq0h/dGEE2nW67jQeDEXNvknlvLmUnZ4Ktwfo
	 EpNbKKqNPf7ZsTv5VQO6rSTewwnuNug9sdqDOrn5/LYZ0NwMGPcbcmY0euZd5BFHtrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329333;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=DNHyYMc9vHD1vdEnF03jjEpLl21EJ/s/rYS/anhGGvQ=;
	b=WnsXkeFdRJR0IxTb5BBV/8GgtvnBp14qtABoo86PO+H9Amf/wAkcsdyENzEJz1B3CJqT
	 mFHOclcTMsLcjwpnRHHh5rrKl34by71nQAukt+aQuJZGhytmFGlAsFzWo1KqTdJytihCA
	 qiGzGZFbADKNDqcYexhLl/QJnYTFcs8aAqKNTUtCyMGGHRYohi7e8s8YMX1t4BKEZ8xu6
	 BC+Sn9jp9liNihMHlb/P2ne116L+mF0Qpw4H1feqwxg43iRfMnaBNtnZZKFykPq+I1C7H
	 Piz17hrj9dzr0nioFlh5R4mnvDAu2CU8wSO9yqMQ1jjM2A1VLIPTUgW2MM7S++Lrnrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b="cqaz/yKR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.148.174
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E09606A320
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 06:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=cqaz/yKR
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM59u8v2369979;
	Sat, 21 Nov 2026 22:35:14 -0800
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022107.outbound.protection.outlook.com [40.107.200.107])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j3t0h04pw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 22:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwfukPztclSwcbDPhrAn74SSW+Va5cRXjWXNI8cqRD08PE38Ixct32n+JEkPdNXOWteaCBwUa3Mq1n25XkFgDzRc8FReK8+QCJLcakXKsIbeKDxb4H4falGrPx988ejfQ0cW5HZcfYtPbyKkYY/Cbj4Rd0boqvJddL3AjVth0EZ86r/DoZ47a5M5VzeyhhgzrZqsHoLeNlqr+SKtis+PzmqqA9BaUhBlAqaoMtRipoYsTxLQILKraaGusL2Fv2fJWKAfPrnLaPENZ728h7ppaPW1PwrZjzDTeKzyywdJ8Q76RFpHk4dSTlW16u+OFeXrnk6iCaipIzRTIeye4cfkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNHyYMc9vHD1vdEnF03jjEpLl21EJ/s/rYS/anhGGvQ=;
 b=b0v/SQ2hdydkf82FwoOVLjQWdR4xtzsIbzlW7VZQcLLH/mEfSVGuzNx98Grtzv9Tx9pqm1lxkA3IxtSzZ9edeVz8/5hA/ISZYeEeXWnPXwyzVpBm4Kf7ZakFiayDHKFQ7DmYSHEI8ALvBgzeNeXOOyA4TS2274jZLho0f9wdQBemDZp7N7EKWXM1VOGD9uYoaNMeH2KH4t+vKK9KJiMJb9/POGhRIhyTWbPGgPClwQkTe6tnSVsKqolKwyL6KC4Tl7u8/RhHpfhD7iuDSrfEns2z5jWleHqmPNDDXAiyntmDSNe5C7/k4qNeIAoRU1J0+XjAlii5zHSt8KHsG9ZUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNHyYMc9vHD1vdEnF03jjEpLl21EJ/s/rYS/anhGGvQ=;
 b=cqaz/yKRg/SN7eXOOf9BbBCPdBofKYiAbAr6UR3AsVIuSXNTxGl24Y1nyWU2BdGsWx+0d/80vhL3IcGatQiU18PrCIESjEiucBKtT1S4UbCUhnY1huizJHjaCE7zWCVFHdq8pv2o5JC9qsMpCCnwgmdrVfawHgGGRumsCj8nABQ=
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::dbb) by IA4PR18MB641219.namprd18.prod.outlook.com
 (2603:10b6:207:14b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 06:35:11 +0000
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3]) by BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3%4]) with mapi id 15.21.0615.013; Sun, 22 Nov 2026
 06:35:11 +0000
From: Elad Nachman <enachman@marvell.com>
To: Ian Rogers <irogers@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        Elkin Cruz <elkin@google.com>
Subject: RE: [EXTERNAL] [PATCH net v2] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
Thread-Topic: [EXTERNAL] [PATCH net v2] net: marvell: prestera: Fix skb leak
 on error in prestera_rxtx_xmit()
Thread-Index: AQHdej1iUHh03UYfxkar90npjrAOprc5oNgA
Date: Sun, 22 Nov 2026 06:35:11 +0000
Message-ID:
 <BL1PPFB0715B38B24E65E36EDB38D1A4E4FDB462@BL1PPFB0715B38B.namprd18.prod.outlook.com>
References: <20261122045305.17511-1-irogers@google.com>
In-Reply-To: <20261122045305.17511-1-irogers@google.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=marvell.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PPFB0715B38B:EE_|IA4PR18MB641219:EE_
x-ms-office365-filtering-correlation-id: 6fd9b6cb-386b-41b0-0c37-08df4862c264
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|7416014|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261022113327099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261102123227099003|38070700021|11063799006|5023799004|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003|4133799003;
x-microsoft-antispam-message-info:
 UUe2n1mLoAnK3JoNd+KJXRI5zDWsvMjtmLSMOVybSdHIrgXeL6EaIlsvwT8DqBimyNVUSvxFJg+E2E618uxH42ttjTXSg3a01qpF7yyaYYZwHxpZBQ8iWZ2RSrfd1PekxSYs32Js9cRHOaG2A9H78VLSfTb4uGGUcgRoVW7nqkSWiD6nuwzohrZz8QpinrR3omo3d+I7Z3nbrfiOB19/m7XHLY9aA4btupmXzWGZmPpct95HAa47ELySQezxGj57bhhhhx0/avB8UFIDdgyqvFuNZTHiWHV2NyjmAsaF98dsGGV9HHqV6S+M/C4/wIdjfQtcaBM7o2iCuhq2e4SG+BUf86nYB0064ONFJqv1oQIAQ3TyVNI/66SSs6MT6BFve9Rq4mx+garrAXg73k55BPhLBnbPRmNrJKHenJVzSzCFn3ZotU826WtRDhLwApf0gBu4JPgRh3R1U0YhbFsflnvtPeqDiU2ljgZ1QsMnc0whwBZYxOMw/fyNhj7xqAes87cTrOMQ1v3Ona8w9HLIVeFa+QnDCm88dBX8Bzh2gi4REr4mJVSmL6kBH42TaUNG4JpQJFK6IdBJ6qUUv/gH3YGkRy3nFBw1SoEf9w+yYlr9Vin0RIdxx1Cv1j0h91cVQ1p99Uk+fc9ItL6A/CiLZ4bbRS9fAW9t2XUl7WZauy8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPFB0715B38B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(7416014)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022113327099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261102123227099003)(38070700021)(11063799006)(5023799004)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(4133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVYwejJqbUprVDlja2NnSkhUcjFmNWtWQUZZZFZHVGFpNStERkl3c3VzditR?=
 =?utf-8?B?andHc1B5U3lOZzJZcS9Qc0xKbzU2eTRnUjJuVGt3ZExycmEzbG1Qcm92RGkv?=
 =?utf-8?B?THdyb2xNLzBRN3hhak5YNGhHVVpFVUlZdWlHZjlJUTkrOFgyMm90MjBtK1ZL?=
 =?utf-8?B?MWVRcnhVUlh3cFdKREFYMzQwVFdycE5RUEY1RlQ4V2VMYW1WRjNoamhBamFR?=
 =?utf-8?B?d2VyMytmdy9mTElXU0Z5ZHAvNXVXWUJtWllmTWZvUllFSVFrc1ZLc3FrZGNB?=
 =?utf-8?B?UXdaaytKZi9Pc0RBNW5vcUpUa0pVRGJKMGxSSXpwcmREb3hNc3Y0bkxHQk0v?=
 =?utf-8?B?UVdGcmNJZWlRbmRPaUlHQmh4OXlVUXRsbk1lMXZOc251NU1wTG1IZFhacSta?=
 =?utf-8?B?cXRXaktSQWhJd205UUpTMzhIS1M2ZWlGaHhaR1Z6czJPZVdBQ3FlSEJGZ0Zv?=
 =?utf-8?B?QVJMOWd0dEdENXBmdHlkMTZtdTRRYlMvSXk0UUplVlY2dm5DZWR6ei9pTjN2?=
 =?utf-8?B?a2pvL2pVYlhzRnlPSTZTdjR4VHV2ZUJ3RzdXRVZmckYxVzRyOXM2eEFoUmhj?=
 =?utf-8?B?cmZIaERFbmxFZ0U4YTdGRyt4Vk5UV3YxSEtTN2UyM2FsZXhFV3hEZzZmVkpi?=
 =?utf-8?B?UjkxdkkxZWdaUTVMdElYTmJuTXU2bkNxSUV0aEV4c3plSm5PRlFhMmptYjU5?=
 =?utf-8?B?K2RTbHVIUkFabDFsckRWazgvWktzS0wrZXhlYXNnalVBYTNBRGVWazhEekpP?=
 =?utf-8?B?TGFuVHVISmpJZ2FDTzRQMmJ4U2NSaisyOVJueWt3YTlPNVN2M2hTWTVyMUN0?=
 =?utf-8?B?NU9SckI4a2M3ZFllTSthWisyUFBZQldQMmM4Y2pURE52aWFNV0sydXZHNXVL?=
 =?utf-8?B?elVSdFZMeVZPQUd4ZFV1NFk4c0NYajFwUGFDeFFmL1h5WllWelNxR3k0blo0?=
 =?utf-8?B?SzRrNHQxZ2ttVDg2d0hKelVQL0RuUGZwZVNpeFhnaGdWRDFwOUgvc2JQZ3E2?=
 =?utf-8?B?aEErcnJUNEh3TklpZUtvL3BiY1VoZE45eENJdTUxT0xCQ294RWIwQ0lQT0I0?=
 =?utf-8?B?NWNueDBOcnpwSEhzVnpZQTVOTnNVSVRCc0xRNHlFMm0reTJ4WWdPTVQycVh5?=
 =?utf-8?B?ZytrMjhNMEExd08xV1NCc1lISWVXZ1VUcTR3V2dnME0zcHd1SndwYjhrNWhy?=
 =?utf-8?B?Y0VKVkpEMTNWbE5wV3hDczdDNkRGKzFhbUdiaVpjc2wrSXpERkVPQ3ZxVWlm?=
 =?utf-8?B?TS94aVdlSCt5Q1lYZHljVWdvRTRPNTZDVjJWWkRyNzlKUUxyb3hCU2o2bzBr?=
 =?utf-8?B?eHcrS3UwSGVkcEFQQ2dacGt1NXhiR2ROQ0sxT3FHN1N3VGlHVEtkbVZ4Wmlj?=
 =?utf-8?B?TnZDNVkwNDE0MnovRTgvTjg1NDRJTWpiWEpwOUU1OEIySyt6cC8rc09jWlJm?=
 =?utf-8?B?a3JkTWxJRWwraUNHcGFmLzR1WjBZMTdOQ1hhZjVzNzdtdE5tQWFVbUYvV1lp?=
 =?utf-8?B?UlB2dVd1ak5pdHU0OFh5cWlib0doV1U4blF0WjM2azg4djRrUFc0MjJJNUhr?=
 =?utf-8?B?ZmZ1ZVp2RVdhamx3SG5oZUZBQytXeUg4QnozcCtlS1ZCZVVLSTIxMmxyLzhF?=
 =?utf-8?B?bUhJWXlQM0I4eDRFMXJ2MDAvbWZmQWpHZ2RVSGRibVNTSyt2c09BaTFvZUx0?=
 =?utf-8?B?RFY3N2xQWVBvcjczKzh2dmFVeWVOdy85cDRld2YrYlZPSVNScVErVEh0di9P?=
 =?utf-8?B?cngrb1ROZlp1aml1cmtKTm5UdElQRmx6cm5wakRwVVo0Y01Ja1Jwb28zdTRC?=
 =?utf-8?B?RVlWOVhmOG5rL3JBdXBDUG8rU3REdEZwMTJ2M2VBU0hUZ2JlWmlVMUNSSlBR?=
 =?utf-8?B?NkdGaXkzSVB4TlBTOU1DQ2ovbEgySUJQTngwWENvQmxGVkU0NUhJVWhMcEVT?=
 =?utf-8?B?bGMvQk12d2Q2WGttMldHVUNMZXRkVzN6OUErTGJmOW9mRmFFd3ZMd3VINlVG?=
 =?utf-8?B?TytqWnBMQVBuRWdEbFhZY29hWlp0VkpjS2xBMm9BbmFYUW9RTTNHc2wxZFdU?=
 =?utf-8?B?b0w3bWs2cHhFUHFueWQwN2w0VHVTcmtSazlqL1psWnc3WXEzZDNtdFNFOHJo?=
 =?utf-8?B?ZHc4UXN5VjRIQllBekdJSm1UMXNuZ2Q3UmJGNG5YVFlVams5bldERlJCTkJs?=
 =?utf-8?B?MDlpclNTUWpBbGZPRkN1TDg1VkhBS2RhMmI3a2N1YXI0YXIrdWhpNFJzZ05V?=
 =?utf-8?B?ajlMUkpyUnBrV1gxVmg4SXVMTXFKTUFRUThtVzgxRUhMbS9wOS9GUE9JRDlF?=
 =?utf-8?B?THh5ZnB6VHBUK2ZUZmhNU0pSRTBENm05L2ZOWXY3aDNuWTlmTTQ1S1ZqTDc5?=
 =?utf-8?Q?Q/QPTYLWJL/03qx9q1WqeLr1YvLevH3rItjx63yHNyXSj?=
x-ms-exchange-antispam-messagedata-1: Zq4OBZyOI9FFFg==
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
	pWJPTAyRZbAHY/OCRnWqgIhD0EWkoDEGY6EKZ/VfiIVm3+xexZvFQ+ER0W1/oqEQXOTiONWQqezi0iCpgqH1Mb6xJnDrbsX/QVoctH1swT0AdfUcttvNZfypFfiAZ4OgZUcEv+Xd7UImM2x8AfPiwucssvkNJNeQ3MydwdJwycN7fo+yxfjBd0IQDSSedeg2t8CyehBi/kWq/53JkA6DEkT3ex6ALInabD1Ul6pFauDf8PaI6P6cckycTAKjwOjZGeF6syuEt8srvQQ2fC2ybe+Aj7mA9l6H9Bz/ZnNms/acd77lP6Kt6baQ4aM3bs+R1ncPL8ldUYjMefRDvGRl+g==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PPFB0715B38B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd9b6cb-386b-41b0-0c37-08df4862c264
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 06:35:11.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wVxmMBaxrPwYKeM0gKDFlu5A9hzYgf8GvHQWPnIy+cXIokaLlfh7FKPRtqrQKQ9vxCJX0GE3vnZxYR+R7fmWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR18MB641219
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNSBTYWx0ZWRfX8aXzms5g9lpD
 O3DHDqrMcBE0etj6a78nV09eH7aqayTD+mY1j0gQX7fnA2mf2wxm2wkmD10wq5lJoeRM1BQjW9t
 Rw7bx3xY4NPxmWzHiIodUHI8hHxRGSmq/1mqTOpBd5Vbw03pVrlxesqtUxwEJUmGA6XwJbH65RL
 dGr66oFA1igz5P6eU8+YIGS+1jCXsc0Ze2pEJDIDX9DnbyJjQQ58+W5V9PY+la51DgzS0OeNtyo
 fQAkj8uMLz2gZY9JaORs3mB8vFOCLUsU02DyAKU0gYDXBBp1XB2ZI+opRK4zGJfSBZVD2MNPunu
 9soVh35ItBuCbPsgTczQoYhXGIo8kTsZ4cnZo1yyLDUY+epPt0TCQhRuLg0aoV7Kr3pS0oSCLDo
 CkNhCpYFSSs6ncjKC2yaw511ua8cHPSmJZNwYQMLPHEtowAW9tuaYtS+w7P9hsUIel5dB+MKqvX
 yFUMqc/s4hDWgwKiOcA==
X-Proofpoint-ORIG-GUID: uxCvI3TRceMxhz5mSIwy4VtDU-GizxgM
X-Proofpoint-GUID: uxCvI3TRceMxhz5mSIwy4VtDU-GizxgM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNSBTYWx0ZWRfXyJ8XcgriIljF
 AuVDDEkd9xLQp0daDcDCoqXIVY1dMxneVLeFcuVqb7W8z8h3iN0UDW7wJqO8LPDbZWrbIYJ3b/C
 /MJrvFLJWw2j1+hZRvDlUgnZ3M0sWtI=
X-Authority-Analysis: v=2.4 cv=aO9lOr9m c=1 sm=1 tr=0 ts=6b028d22 cx=c_pps
 a=TrU/2LxE+ZX2LRvKjn0IHQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=-AAbraWEqlQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=EAYMVhzMl8SCOHhVQcBL:22 a=1XWaLZrsAAAA:8
 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=xRccjw1Ftl68BvmghbUA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01

Pg0KPiBwcmVzdGVyYV9yeHR4X3htaXQoKSBpcyBpbnZva2VkIGRpcmVjdGx5IGZyb20gcHJlc3Rl
cmFfcG9ydF94bWl0KCksIHRoZQ0KPiBkcml2ZXIncyAubmRvX3N0YXJ0X3htaXQoKSBjYWxsYmFj
aywgd2hvc2UgcmV0dXJuIHR5cGUgaXMgbmV0ZGV2X3R4X3QuDQo+IFdoZW4gc2tiX2Nvd19oZWFk
KCkgb3IgcHJlc3RlcmFfZHNhX2J1aWxkKCkgZmFpbHMsIHByZXN0ZXJhX3J4dHhfeG1pdCgpDQo+
IHJldHVybnMgTkVUX1hNSVRfRFJPUCAoMHgwMSkgd2l0aG91dCBmcmVlaW5nIHNrYi4NCj4NCj4g
QmVjYXVzZSBORVRfWE1JVF9EUk9QICgweDAxKSBpcyBsZXNzIHRoYW4gTkVUX1hNSVRfTUFTSyAo
MHgwZiksDQo+IGRldl94bWl0X2NvbXBsZXRlKCkgcmV0dXJucyB0cnVlIGFuZCBkZXZfaGFyZF9z
dGFydF94bWl0KCkgYXNzdW1lcyB0aGUNCj4gZHJpdmVyIGhhcyBhbHJlYWR5IGNvbnN1bWVkIG9y
IGZyZWVkIHRoZSBza2IsIGxlYWtpbmcgdGhlIHBhY2tldCBidWZmZXIuDQo+DQo+IEZyZWUgdGhl
IHNrYiB3aXRoIGRldl9rZnJlZV9za2JfYW55KCksIGluY3JlbWVudCB0aGUgY29yZSB0eF9kcm9w
cGVkDQo+IGNvdW50ZXIgdmlhIGRldl9jb3JlX3N0YXRzX3R4X2Ryb3BwZWRfaW5jKCkgKHNvIC5u
ZG9fZ2V0X3N0YXRzNjQgcmVwb3J0cw0KPiB0aGUgc29mdHdhcmUgZHJvcCksIGFuZCByZXR1cm4g
TkVUX1hNSVRfRFJPUC4NCj4NCj4gRm91bmQgYnkgZW5hYmxpbmcgQ2xhbmcncyAtV2Fzc2lnbi1l
bnVtIG9uIGFuIHg4Nl82NCBhbGx5ZXNjb25maWcgYnVpbGQsDQo+IHdpdGggQUkgY29kaW5nIGFz
c2lzdGFudCBoZWxwIHRvIGF1ZGl0IHRoZSB3YXJuaW5nIGFuZCBwcmVwYXJlIHRoZSBmaXguDQo+
IEJ1aWxkLXRlc3RlZCB3aXRoIExMVk09MSBXPTEgKC1XZXJyb3IpOyBub3QgcnVudGltZS10ZXN0
ZWQgb24gUHJlc3RlcmENCj4gc3dpdGNoIGhhcmR3YXJlLg0KPg0KPiBGaXhlczogNTAxZWYzMDY2
Yzg5ICgibmV0OiBtYXJ2ZWxsOiBwcmVzdGVyYTogQWRkIGRyaXZlciBmb3IgUHJlc3RlcmEgZmFt
aWx5IEFTSUMgZGV2aWNlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPG1haWx0bzpp
cm9nZXJzQGdvb2dsZS5jb20+DQo+IC0tLQ0KPg0KPiBOb3RlczoNCj4gICAgIHYyOg0KPiAgICAg
ICAtIEtlZXAgcmV0dXJuaW5nIE5FVF9YTUlUX0RST1AgYXQgZHJvcF9za2IgYW5kIGZpeCB0aGUg
Y29tbWl0IG1lc3NhZ2UNCj4gICAgICAgICBkZXNjcmlwdGlvbiBvZiBkZXZfeG1pdF9jb21wbGV0
ZSgpIC8gZGV2X2hhcmRfc3RhcnRfeG1pdCgpIChFbGFkDQo+ICAgICAgICAgTmFjaG1hbikuDQo+
DQo+ICAgICB2MTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjExMTkxNzAzNTQuMTUwOTU4OS0xLWlyb2dlcnNAZ29vZ2xlLmNvbV9fOyEh
Q1JWbVhrcVchVVZ1QXJqcU9kX3NIa256YzAxYzV1T1VzM3QwSzA1eWpjM3IyazlLMGk4Y1hMZnYx
ZDVwYVN6c3JIa0pMQnNDQXdNMjZma1JpU3hFUExaYyQNCj4NCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L21hcnZlbGwvcHJlc3RlcmEvcHJlc3RlcmFfcnh0eC5jIHwgOSArKysrKysrLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3J4
dHguYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvcHJlc3RlcmEvcHJlc3RlcmFfcnh0
eC5jDQo+IGluZGV4IGM0ZWEyNDdkMjQ3MC4uZTYyMzc4YWJjZmZjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3J4dHguYw0KPiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3J4dHgu
Yw0KPiBAQCAtODE3LDEzICs4MTcsMTggQEAgbmV0ZGV2X3R4X3QgcHJlc3RlcmFfcnh0eF94bWl0
KHN0cnVjdCBwcmVzdGVyYV9wb3J0ICpwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KPiAgICAg
ICBkc2EucG9ydF9udW0gPSBwb3J0LT5od19pZDsNCj4NCj4gICAgICAgaWYgKHNrYl9jb3dfaGVh
ZChza2IsIFBSRVNURVJBX0RTQV9ITEVOKSA8IDApDQo+IC0gICAgICAgICAgICAgcmV0dXJuIE5F
VF9YTUlUX0RST1A7DQo+ICsgICAgICAgICAgICAgZ290byBkcm9wX3NrYjsNCj4NCj4gICAgICAg
c2tiX3B1c2goc2tiLCBQUkVTVEVSQV9EU0FfSExFTik7DQo+ICAgICAgIG1lbW1vdmUoc2tiLT5k
YXRhLCBza2ItPmRhdGEgKyBQUkVTVEVSQV9EU0FfSExFTiwgMiAqIEVUSF9BTEVOKTsNCj4NCj4g
ICAgICAgaWYgKHByZXN0ZXJhX2RzYV9idWlsZCgmZHNhLCBza2ItPmRhdGEgKyAyICogRVRIX0FM
RU4pICE9IDApDQo+IC0gICAgICAgICAgICAgcmV0dXJuIE5FVF9YTUlUX0RST1A7DQo+ICsgICAg
ICAgICAgICAgZ290byBkcm9wX3NrYjsNCj4NCj4gICAgICAgcmV0dXJuIHByZXN0ZXJhX3NkbWFf
eG1pdCgmcG9ydC0+c3ctPnJ4dHgtPnNkbWEsIHNrYik7DQo+ICsNCj4gK2Ryb3Bfc2tiOg0KPiAr
ICAgICBkZXZfa2ZyZWVfc2tiX2FueShza2IpOw0KPiArICAgICBkZXZfY29yZV9zdGF0c190eF9k
cm9wcGVkX2luYyhwb3J0LT5kZXYpOw0KPiArICAgICByZXR1cm4gTkVUX1hNSVRfRFJPUDsNCj4g
IH0NCj4gLS0NCj4gMi41Ni4xLjc1MC5nZjcwZGM2ODJjZi1nb29nDQo+DQoNClJldmlld2VkLWJ5
OiBFbGFkIE5hY2htYW4gPGVuYWNobWFuQG1hcnZlbGwuY29tPg0K
