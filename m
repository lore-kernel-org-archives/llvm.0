Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795401041;
	b=D/6tSR76JrTkOEZbybN41brnhUIzkMd++gtC0ia6NQ9ELTKrOSd+LFhLwL8YD81dhpZS
	 6kV/yIaFwuMBZPyNCOAyrNJ0lRLkAk92bGom6UH3CSSRLaNhx49DMi08gu5xEQ4nqFxeD
	 2QQ2IwBhmGsl68A/CQub1R/NtfIpt3FXJ/Mguh9T14U7a6ioaU94Ud2pDPAOP1Z2EuQch
	 MXQsKDGP3wPmUUFEhhCue+KoRGqBrGh8dARZVwhCoALN+pR10bp74xx9PhydoSzohXhEt
	 K1zfC50AAfgA2Rrs/ouKonN3DQpb9dMKVoe5loL8sCLkIkPoHkdX3hIFzXubdeLdupQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401041;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3rMGwOVEo1qiTtwxvkHa7gZlWWM64ENrzOnMp4npICY=;
	b=1neI97BWd8ZVnebL7du30Sk9OY6hpzlnJHwGoOPj22Gjy+mYT7xnSigzeeCJdCACanmO
	 8KBBVYLB71e8gKF0u9m5at+9HEQM1DXjYaN/+UnvCC7Ah0mRiAQM5hU4erdGIzXvLBOaJ
	 TT/g96qOb3DOAPXmkTnvmRzJh0MrmM5N/Wy5Fc8WALE3AB3gsDLwXY1nbosloOpUEjiia
	 caGeCdWIzmCPo9AoRU0XbVl4ResRp/fgvmKcRna2lIhb0VUuHGRu0N23d0jt5gSiPYr/v
	 82YkNvxQ9yBYEDS4WH2q28vGA4Z7tn+KbYPSdsSBV9HOzBMaH+mla3BCldLwHfmh/1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=HO+XUMcq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.54
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA87606A31A
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 02:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=HO+XUMcq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmngUGf6ZbKan1RTKrt1JNfSL+jbMx1jlQWdLpdPVccAD1cJbY4jI6Cs2E/oaevqKghHRY5SBnKxcSeGTVAliey4j1iQoUaqJ9011SVsaIgQAsgzjkZgCzAPIiaj/8iqboQhuqKSQuel3jFwLUsfpe/xrXYQ5BAd4psLB5q82B4P3bzqh8DTyHm0mKraEdSpYNSjwjPNHHESmXcbMINcDczrZdGZGzBkNSb8r+5fJEjsZqXmabyxIc93SljF940QWtd3RLU9sMdpRhIOQtZ7LUnCihlr1H4u0fR3GWTdSkvjQM1K904ZxQAXGuyd9qZlcOlEc0ez+qqzUFFkRkJXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rMGwOVEo1qiTtwxvkHa7gZlWWM64ENrzOnMp4npICY=;
 b=ILiKDcBXVbTS7EzEJ3NpskU00VRJmD/qJ7TZpYWsNK0lufWemr2NogXU+PkZ4szBv/kVat+JRfBpzvTvN7qoF11LLgk5/JwEU3G8Ya/t7ZejgVE3+r4PnqQjC5tqNImnV5/U5VhU6/hkiLdCT9zG7XSojpzP774fl3v7akbyqRhOHUdz+veeN9oljp7foOkPi5IYSJS8Ks0TXEd+2yY8xMvGgcVPJEuyo0m3rvteJ706TPoBWGCizW4qG+uZqz9v8RwSQZKONJFDtcU1Z1b/7ha1ultYRrtgPJBfFW5UAor7pmX0n5RcL4abRArIglnUdfFNtlco2RjJvMmJPe9UHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rMGwOVEo1qiTtwxvkHa7gZlWWM64ENrzOnMp4npICY=;
 b=HO+XUMcqpfvvP7WalfSTz7bqEo32hmJlYeHMt4yz+8n4RpFB0AKhcPMFDYYphgC5CLPyf8TdEj9BSzzu+zV1cxtMkwuHrbcRINNDw/CuGTqGh/QoyYFO1UhTu9efhndUOaeU17O6k1BwhlQplVodYTe+b7kgdZqNXocVDHi1zxzI+bS506aSH60iEbT0iPWDtMQLGb07U/ZIPluMD4KaZhadNSk2/IogSJROtRwLWHNbmDPVnBPmwROBm2zG6Y+A8cQDswTVJoQemdAClDLo/vx1BY7lbChgnRnpqJXl7+0SXhxFvb0Og/j8ddBdDDT0InPJ/mCQP/pqJFlgBN9NFQ==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DU4P189MB3472.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 02:30:37 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 23 Nov 2026
 02:30:37 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Ian Rogers <irogers@google.com>
CC: Simon Horman <horms@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Jon Maloy <jmaloy@redhat.com>, Elkin Cruz
	<elkin@google.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
Subject: RE: [PATCH net] tipc: validate peer address attributes in
 tipc_nl_peer_rm()
Thread-Topic: [PATCH net] tipc: validate peer address attributes in
 tipc_nl_peer_rm()
Thread-Index: AQHdeEhE9NH7h0X5MEybNE+ZYLKd5rc69ESg
Date: Mon, 23 Nov 2026 02:30:37 +0000
Message-ID:
 <AM7P189MB11376E1386BB26B523A99509C6452@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261119170556.1518068-1-irogers@google.com>
In-Reply-To: <20261119170556.1518068-1-irogers@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DU4P189MB3472:EE_
x-ms-office365-filtering-correlation-id: da3da05b-c539-4f71-89a9-08df4909c248
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|38070700021|11063799006;
x-microsoft-antispam-message-info:
 Hkk6P7Xtd8R1ybRkLJiIq9shHBZUqZiiPzVRGN54hjMl0I+r2hVyumtLfkbfnHWvaDQ3Oe4g+nGx7pnazE8FyccbEt7mx0qV+CHAXlo1/dJJ4gS4a0HIzbFv4eHPI6Tx+JRQ3axNSoYNO+OreIND6lMArev7E8MNXS1E7n3nMj9FWkvQ++r94Qv00psbOeRD1jVb4Y7woTTXETWO0cUmeXXiG7PXR0goh0G5kbDWXEo0IvYVkhWgWHOQXsZeLRBkSaowDvZNqTDiuhaTm6nbAvNGM7+0aqPg6grwZCln8YiwA/T/QkrC/g5LjMSSGWVGqVrP3f1j1jejnFaSwbu14eu7V9F0ZS0w0MnGkyWhaNVZGV4303+FhFOGJgtbs7ya+OCahK679F9pRJedwsA8pEG8PJP6ieZtZ2I5Jay26ZMxJCkxdvPBaBz3zqjMA5tijWxO4wbbbvBLoLSTlBF34w43irdlFEAv3aKTzd6M51k6EHcbSopMcWYaLm5XfT1PAWTzSx0oT6+F1zERGwh0P1btN/oe7SH5xr4VZqQxNrDrM70Ef5+GDdBEqo6FYizyj5dnFBfX3VBG1+HEhd9+8w8AdK6KG2SiKQQyTFLHTAJQ5ZgREW7HR3/+ouHn+bGdxKmzd7DHKH8S/tRjlvxzCfTmy/IzIlUm6I+R3xAa24lPXmajf4hm4/0504B6df5JSBH9y519XPYtJ+aEeVBLLGHrD2YkahUnqSCpbkqJ+8c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3liQ0RBWEFkdmdsU3hxdFZwUkRoOUE5WEtoaXVVOGJ5L3E3M05JZVhnekpU?=
 =?utf-8?B?eXZWanNMYXBjZTVnV0pMbDJIbVdqMmN6elNUMkpQVy93LyswME9abnFQaW0y?=
 =?utf-8?B?bmU2ak8rRTRxQXlIZDdnVUF1RmdEaUlhQy94a1lFNmVFQ1BFQkJkeUYxejhL?=
 =?utf-8?B?R3VrQ2hLamE4dlBYVjdzRXBPcUpnRFNwazBvZks2YTRUTUdSZEFiWWV3Rk5J?=
 =?utf-8?B?QW5EZ3IvdXg3UlgxQ2hvL2VXUWpIOFdJZVV0SjB2U0RqSlpXSUszU1hVLzB5?=
 =?utf-8?B?OVgyb1QvK0plZU92RGwraGRSWUl2SVNqbW5IckNiUThsai9GK3R4bHNxdUtM?=
 =?utf-8?B?U2FzN2lxN29vUmYrUm1IbEZHeG4venA1WFJ6R0ZBZkdrWm5KaFUzV0N1Rkty?=
 =?utf-8?B?SHp0bERDUG4yQnhJaG0zWEcvT2ozclgzdmthV21qRGlEOXNJV0VzSHQxSHFW?=
 =?utf-8?B?dGd2VFBlQitlRDlsRjRobEV1aDFpQXUyQzVMUGh2K29JWGh4R3hkbVNEeUNT?=
 =?utf-8?B?bDgwTGtSbDkvaHhacmFQaTU3bC91RVYwNzRQQ3owRitEcUFNaWwxZStpejZO?=
 =?utf-8?B?ZDluRXdYMXFxdkhnZVk4UnJDcjVNSXowSFpFL05PSERjUDBkczg0MnNNVi9N?=
 =?utf-8?B?dE9VVUF1Nm9PcEUydy9yWHdYY0xJbWs3bHdETVUrNUE1UWE1Ylo5MGNvNWc5?=
 =?utf-8?B?eUk2bE9jQnN2eWNQSEFPVzQ4UnhDODhuSjU0R2hIQjBXSnc5MnB1Q2Z4bE9L?=
 =?utf-8?B?WHBXaTFudSs5ZTVtQ05Qd0t3VzhtZW1KRnFsWHY0cFhWU3FmaU85ZzROc2FO?=
 =?utf-8?B?VU92eGpSN3o0VEVjcXBrdTdVV3BZUFNZQ2JSaVZvUkRUaFJYd08walMrTHVq?=
 =?utf-8?B?VzNaQlIwZUVzUFBSZnV2QSt0aVlYeDR5Sis4d3d5a294T1hVcXZ3MnZKdE10?=
 =?utf-8?B?RlpXRUhFTU9nTWZPeDFvZ2JIcnpMcE90OUFRT1JWTVZCODRJdGE0eW9RYWNC?=
 =?utf-8?B?dkRXVHdzVGVyNHAxK09HWVpUeGw5VlI2RFR3cGlVd2g2b3pNUnV2VmQ3ZlY5?=
 =?utf-8?B?Y3hBcTM1YXQ0TldaWFFGWjhJam5TdDFCcjVOckUxUmg1ZDl3YlVsUnVnSzht?=
 =?utf-8?B?OFRKeTlDNmJFdzNJdlc1dDkyOWlKZFdiVzE5eEtaQWRrK2lhVXliQjFIeThM?=
 =?utf-8?B?TmFjbkd5MWhjZC9NaXZZZnR4NGo5THN0U0xmSzBmamRHMG9xUHlnNmM3VU9G?=
 =?utf-8?B?ZURPcnVzeFZicG1BSk1pUUE0d28xU1ZGbGdjaGRlNFZwWmVmRHJQV2R4QXVE?=
 =?utf-8?B?YkdjUGpJR1RxcjhhcEprWXFJd0NGNkpjbVlSR1RHcW0ycmNPa1paVlltd1Bm?=
 =?utf-8?B?VlJmVm8waVp4eFpuTDA4TmZ3cDRoMTUwQkhyNm1iZ0tqNEtzQ1pNOXo3ZmJW?=
 =?utf-8?B?QTRDdVJPY0dmYXVxeXpyeFYxTDBUc2lvc2RJbTJGTHRWamhQOGVQL295aDNq?=
 =?utf-8?B?dDF2K1pZczZlTzdwYjY1WHNDUml3WE84Tlg3Y1Z1dDcydTZJWDRsT1U1VWd4?=
 =?utf-8?B?bjEzSlNnU3VlZXg2QnVkUWFmTkNma0FtM3pwU25YSmFETHJtcEI0aXlncUYy?=
 =?utf-8?B?T0YrSWFwY0c2RUlUVGlJV1oyckxNMjhPTVZKSlVJVnNxbE9iTERGM1lOOXVG?=
 =?utf-8?B?UFBteTNQTXhXMWJIM3ByQ3g4RXBBakhBUkFTKzhMaW9LZTAzdGhHdW1QWWRQ?=
 =?utf-8?B?VDBUV0lkSGUyU213cldrd3UxbmdyekJLcCt5OHBWdjM4SUdxWG9Gay84UFJn?=
 =?utf-8?B?aWJjUUF6T1RubnRNSmZuYzRXVHk5K3pCaTN5STN5b3l0dDlMMXQ2QU5vb1Rl?=
 =?utf-8?B?dEJzNDM3em1rNFA2NlMyY2RkRlhRS0tKVUdEZXFBZ3c1bUNJWm1yR00vSXds?=
 =?utf-8?B?OVpwU3RoM0dWT3VIUDU3VzB0VERhMGptbnlXeUh1cVR1T1U4R0wxaTBuZFZE?=
 =?utf-8?B?RFNTR2lzUjQzTy9oc0kyamp6dGxkVHNwTkRnNy83YVNkOEdUdGYvZWhBZmU4?=
 =?utf-8?B?RzN6VXo2T1BUSnlaalB1aVlkUlZzdm5VT0NNN0FTY082cDE5QmdNSHEvbU9M?=
 =?utf-8?B?dmJremIweDlyT3RwOXRCM3cxWGJFSWxyUWh5VUNjWS9SWFY4ckFGU2tXNElD?=
 =?utf-8?B?cUl3MkM2K3M2MDlIUTZob2hjZ081UGNsOTFsNHdFRW8zSEdDQ3JFRnd6REd5?=
 =?utf-8?B?dW5HejlWNkl4MmJRaGxpeHZ4cXdpRTk2NDlQTjkvdmlWVEFNYWJjUHlsUDlP?=
 =?utf-8?B?RGVtd1htOGJOemF0UGRIejRQQzdGaHE2TWxDRm9MQXV6bkZBbUJPQT09?=
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
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da3da05b-c539-4f71-89a9-08df4909c248
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 02:30:37.2806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTHWWvmp5i3Yf4D9YOEZvT13s18aCA9kpqBb9BD9EWQPV22uAVFDEg65Zc9abIR0n4TzkpaVPnnTMGem9SCsZA4MMr+mQjAOVpVMOyBA5T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3472

PlN1YmplY3Q6IFtQQVRDSCBuZXRdIHRpcGM6IHZhbGlkYXRlIHBlZXIgYWRkcmVzcyBhdHRyaWJ1
dGVzIGluIHRpcGNfbmxfcGVlcl9ybSgpDQo+DQo+dGlwY19ubF9wZWVyX3JtKCkgZG9jdW1lbnRz
IFRJUENfTkxBX05FVF9BRERSIGFuZA0KPlRJUENfTkxBX05FVF9OT0RFSUQgYXMgbXV0dWFsbHkg
ZXhjbHVzaXZlIHdheXMgdG8gaWRlbnRpZnkgdGhlIHBlZXIgdG8NCj5yZW1vdmUsIGJ1dCBpbXBs
ZW1lbnRzIHRoZW0gYXMgdHdvIGluZGVwZW5kZW50IGlmLWJsb2NrcyB3aXRoIG5vIGZhbGxiYWNr
DQo+Y2hlY2suIElmIGEgVElQQ19OTF9QRUVSX1JFTU9WRSBuZXRsaW5rIHJlcXVlc3QgcHJvdmlk
ZXMgYW4gZW1wdHkgbmVzdGVkDQo+VElQQ19OTEFfTkVUIGF0dHJpYnV0ZSAob3Igb25seSB1bnJl
bGF0ZWQgVElQQ19OTEFfTkVUXyogYXR0cmlidXRlcyksICdhZGRyJw0KPnJlbWFpbnMgdW5pbml0
aWFsaXplZCBvbiB0aGUgc3RhY2sgYW5kIGlzIHBhc3NlZCBpbnRvIGluX293bl9ub2RlKCkgYW5k
DQo+dGlwY19ub2RlX2ZpbmQoKS4gQ29udmVyc2VseSwgaWYgYm90aCBhdHRyaWJ1dGVzIGFyZSBz
dXBwbGllZCwgdGhlIHNlY29uZA0KPnNpbGVudGx5IG92ZXJ3cml0ZXMgdGhlIGZpcnN0Lg0KPg0K
PlJldHVybiAtRUlOVkFMIHdoZW4gYm90aCBhdHRyaWJ1dGVzIGFyZSBwcmVzZW50IG9yIHdoZW4g
bmVpdGhlciBpcyBwcmVzZW50Lg0KDQpSZXZpZXdlZC1ieTogVHVuZyBOZ3V5ZW4gPHR1bmcucXVh
bmcubmd1eWVuQGVzdC50ZWNoPg0K
