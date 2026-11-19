Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110003;
	b=cjxRMXMnmeX2GxMR+Yps+4jFX42AQjTvcs0sFhUaJ+gTm6bn6mtzoXjKDayuggFBfVKm
	 e5guydMVxbwLI/BwqzIKaXMBOgGiMxDBeerPD0kA5vrJy2I7XieiEuGt9cK8lRsWNnPPn
	 RxHvhghx6s6CiM97SxioxUdeGDhGVxlPfKRneYEjWTRm9EmQS7FWTAhjrclaimodQzpFf
	 vfHFPOZsw/aknDY532DWrmsPZR02M8PeTiWcN6sVOz+njAhE2bQEmeRvJe2lfNkPdFo1J
	 vgB2uOdo9xTa2oq4Rpv9e80E4L02gaVDe7gBUTniAwqS58BmCPRjYKGXTTYo839lgOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110003;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=DsXua59tlZq7nsj5fgyFYBsUwKdTo/P47TRYhMUW6WU=;
	b=flW0ge4Nt2qSdcp95tqM7HmTdhYPPRfp16wbcArYMiiyeoIwZA0QNWMT0C8qYcqXTxPZ
	 HkHzldkTNBH6d88pCB0cZ5oXxOSkhWXckCDQ5opd4oLvbsuPH15iC33qwO6xDQvdXSw4o
	 908ruztZOSVm+cAaS6mjlhcGCitcvTt0Q07vw1w9PHkPZEf8xYXHtCqT7OkepNl7JYW+o
	 +SCyaUc3A0CkBwyqZ6nM+cL5ppkWfOop0Gd4JS3sstD1rhJZnR614kyJVObVB9ZyeY8gk
	 NJTnv0tfwgdVJl3eTq9uTt/FgwN5/qYWlOsRT4cCmlsKLcdzek4J0VIfclpPQY/riGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=sn1A2aB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232EB606A325
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=sn1A2aB8
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF9cEP1236808;
	Thu, 19 Nov 2026 09:39:46 -0800
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020143.outbound.protection.outlook.com [52.101.46.143])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4j1mfduyh2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvJFFbaMOGJKZXfwOsdl6HlkIObhNv6uJ4FTeodS75wdaUrEJfKsgPWMJKemCDwBznSTweMnzruXPTrQVMqQdCwSGvz5VAaYyi8DI2ItFYZ/+fIPlTF7FgmHLIRHDWnB765HKQkFJwXw/2kirpj3GO3y49r48ikrwjdjDlFpiDZXULDvtjMtO9b49CXccC/49GAr/BodXI8nhRXJDuJMj7hG/aJAyy6+0AuHYLhC/ACX8XTCxWtAnSP42AqwuM5hm209Ji/o8u05NHlCrkj4U6/7fRxXN5D9gEZZmevxnHkTFjHVaqklIXClFgV0Tqm4AjbCSMM4QyOsHVM54gYLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsXua59tlZq7nsj5fgyFYBsUwKdTo/P47TRYhMUW6WU=;
 b=EWle3Si2J1Ny9P2eTAfenblFJxr3502bLsx2ybJXYBTENFHAsXJ0lye3sCjw6eDwW4OJqswZc8ErrlZWQAFPDTN8ReelHYlZcb/21LVY0mWAZowt9UbwqXYIdEGkz6AOUU1wCpif72D+ZmlLhJxfXeb68lv/lj/VX5hi3CjTRbni/9m2r56Oe3YrC73kClL/3O80dMWEp+PSfwLG8UFSIhGoxr23Ah4bMPAUqV16Jh00TSf1mFscCWpxiroEjwgTBnhBtAeOAVFTWcF1c1DCosPT6EH9kum5A0mbEph6cLYMxIyV1F5yfXnUvxdHuLz48TbIex04+cWGjK00VTpJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsXua59tlZq7nsj5fgyFYBsUwKdTo/P47TRYhMUW6WU=;
 b=sn1A2aB8N2qWfpj7pnSyxcXQ7fhIUbJL1OymgB2JlPd51GRRahJkG0yA4HJLBue0p0vZZLbgD7hZlqZEhFXt4fxvIodWmch67rGd6h/Eebq2VX0htaxEQY77oL0bACTSV+GdX5nPun8RYBMvGfSX1T9acFstVyuRXQ8nivbyJVo=
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::dbb) by LV1PR18MB988706.namprd18.prod.outlook.com
 (2603:10b6:408:3bd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 17:39:43 +0000
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3]) by BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:39:42 +0000
From: Elad Nachman <enachman@marvell.com>
To: Ian Rogers <irogers@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        Elkin Cruz <elkin@google.com>
Subject: RE: [EXTERNAL] [PATCH net] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
Thread-Topic: [EXTERNAL] [PATCH net] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
Thread-Index: AQHdeEf7aMNYgmJ99USJaaL4kPOHrLc1pidQ
Date: Thu, 19 Nov 2026 17:39:42 +0000
Message-ID:
 <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
References: <20261119170354.1509589-1-irogers@google.com>
In-Reply-To: <20261119170354.1509589-1-irogers@google.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=marvell.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PPFB0715B38B:EE_|LV1PR18MB988706:EE_
x-ms-office365-filtering-correlation-id: 5a038f72-56a8-4bd3-8a53-08df46641849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|261022105027099003|5023799004|38070700021|261026140227099003|261028144727099003|261021123027099003|56012099006|11063799006|261021121427099003|10067099003|261009223027099003|261102123227099003|22082099003|18002099003|261026121527099003|6133799003;
x-microsoft-antispam-message-info:
 SbGCQlSLI8QwlikgH4VTkOckcE3xr602N5IKUxDH9vcNnRu0nuhA0KlRnbY9R6MTEDTcg+HcyendjVJOoIG4khQIxU+xsBxcM3lsZ5KQk4sHcvnrLNYQ/ftfx9bizGc8StEoJGLeFgRILCoVTeHxgyrtQyCWWUX/gV45qdZYx4pUa6drTfr8puc8mWbQtBh2ZTCY8CbFpC4NIPzh+ikLF38wzE3Yc8pcL1cjtrIXxPZTtKZLZHIafUv9YyIOff88I9QCcikFY954c/Xms1QTLAx41agCdQDpPKPnhtKLCAFEuZFqgkdD2y+x1sBN1BVOSXx4oi2G33MTr03DIQxFtJwGaoBDISEh0iY9lITjXqbyGp5pZxK06dIBX8NpdwBp2TM+ps8Eu2IN/Ixxx5xC3paIxN0CdugodnAmEaRqcWuK8JKe4x6d2Hb3NlM7W1DLp8wGNFYqemT9z1hSCeyKpBQjkut4Q9BWmZ8vmT+ytR3kK2Q0qsJyAyvIcpU1EL06SQUDi5U2U+naSzffxmj7yEdfauI17is7MHLAJu090jD2Pe5TdeK2fIh1wCEgm3LnOdVWs44i6I6y7jcW65EDIJVAePq0l84YJt+W7K/um+slpsJwEFQMteInbXM/F4Y4OxulYvfhnIPSbTYoHbRaxAIpFk07JSV/tjGCeFOuE7I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPFB0715B38B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(261022105027099003)(5023799004)(38070700021)(261026140227099003)(261028144727099003)(261021123027099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003)(261026121527099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akI2STJDWTkvZHM0eWlvSlAxNEd2VnczQU5jNEYwajNRMjU2Zk12dEN5OC93?=
 =?utf-8?B?SWl2ZVBhM0Z1RzlqRitYTjA2YVdpR2Q2dVN0eHJ4MWhJMjlwYmlGSWdKY0ZN?=
 =?utf-8?B?Yko5Sys0MUtQU2F6Yi8ydTVrYXNrNWVMbDdHKzdtaWVxc3g3c2VkUVpWalNW?=
 =?utf-8?B?dyttTEREd0J4emZLck12QUtEb0FBUUdOQnRDNVhDRVY0djl2UmV2YXB2NURR?=
 =?utf-8?B?ZXd6RVZiQUpNK09zRWVNbUhxUHFwWFVFR2txZ3lhdlJyaVdmSStueFd2Q3Yy?=
 =?utf-8?B?clV2OGFUdldmWG1UR0JySkJGRDUzTTkyUFM2UlJ2QnhNNkxIZklGTE9OS0VV?=
 =?utf-8?B?S25oSk0zeU1BSWxRL2V3dGx3QVlUa0JacFJKVjdSdGcyazJZLzE5dUVzY1VB?=
 =?utf-8?B?Zmx6bU1xclhCL2hlelkyM24xbTNObmxXaXdicVRkcUFzN0tLYXlUTHUzRXQ0?=
 =?utf-8?B?YktRck1iekVVZFY5UTZ6amc3Z2lBVzN3L01qc25ZUkl3Q3JCRlU2M0xvZlhI?=
 =?utf-8?B?N1RBSXhENzZjZnpINlFOK1NESHIzZG9qUDZSaDczUVUyU2V3aWRxdzBQdEJq?=
 =?utf-8?B?eVlTYVZZREdBckluQ3MzSkMwLzlJZHp6TVlyRWY2NDdYZ2NtVldBWVVzN2po?=
 =?utf-8?B?dms4ckJMNmNyR0k5WmFZaUFhR2Zlbi8wNUk1SUtia0wycWx4L2IxeDdhd3lL?=
 =?utf-8?B?b1Z3OW9jY1VMUEJUTTJ5Q3N4ZldSQVFRdEh0UmpqQU83YjdsOFJqa0xINVJF?=
 =?utf-8?B?Z0FsZFM2d21YKzVjbk5MeTBkVVVPcGVFRHU2RHJicEhBL2pNOEJ6VzRuS0lE?=
 =?utf-8?B?RXg0KzdxWHExbzNNbWRqUHZ3bDFiOXBVMzVaRXZmMnl0RTNGbzVhMmQwRmNM?=
 =?utf-8?B?dnFiZ0xUMTE2K3dFYmV0SFFMeGtXSDFwY2FNYkUxMkYxRWQ1SU5PN0ZQWEdL?=
 =?utf-8?B?L2FsbkVKc1haV2dTK2ZXbjkxK3hvelVNSGV1MFp6ZmRVdTlkakFJLzUyK2xP?=
 =?utf-8?B?TmJCWkVrNm43MW81NytvUDdZd2c2RHlRQmxPTmlQcGxjbjV2cDR6Q3FPeFZ2?=
 =?utf-8?B?UFRBZG45Q0dnQ0xEYkNMdkRFYTFha1JQc2Vzd280c3dVaGRkYVNhcGI2QVB6?=
 =?utf-8?B?S05LazFlaXU4YnRTN3ZVbWpzVDBOS2cyZnphOFR1TE10dmdrK0hZdjVQNkg0?=
 =?utf-8?B?ZHBldHpvU3VNZ3lMYk5TS3JkK24zUnh4NWFseVFyb21XVXFCRHlHWFZ3bHFv?=
 =?utf-8?B?ZURtTEFLRHVkdnhPSWNVdjVSa1RnL1pzVXM0UnFObzRsWVJvSzZ0TTM4WU9O?=
 =?utf-8?B?dTBJV0NYbWFDMngwT1R5blBjdk5wYThHRFhWakllRmZLaWtvY3lsbXd0ZVp4?=
 =?utf-8?B?dlNNbWNlL0RWYWhJSy9oMHp1dGFSWWh5WmxKSy9QUDBaVzd1bDQyTTNpMDBr?=
 =?utf-8?B?Q2lQM3duOHdBbDZ2cGxJcEk0ZXUwcGhvMXJaZ0xITTZSZjM1d1JJSTF3VWVE?=
 =?utf-8?B?SnJJRlcwdUVjVXBXYWNqbFN4cUoyd1llNkRSbVRmb0Q2SWgrbW9zbE5wT3du?=
 =?utf-8?B?bmczOUJNRnNGZEI2NE5EQVhVZjRYc09ROVJrSmJZdS96a3JiVUZMZGcreHRV?=
 =?utf-8?B?d2VkK0hnWmNZdUFnWGxHL1hVS1pXWFhDRmNlb0ovY3VMOTFTL3hyZ3RxQm9i?=
 =?utf-8?B?UCtEWHZVYitZalE2N2pCME5XTUtBNS9QU1FnYy9yNG4wV3dGTDlwS3ZHM3lm?=
 =?utf-8?B?QnRKNWdSbGs5QUZOdlNESVJsVXpYZjhkbm9jaTEzeHFCZDA3aWJXb0RpalIw?=
 =?utf-8?B?cmJwUjJycjFjU0VDdXlPTGlKWk0xLzRXQVMvcGxwVmZiU3hLRW13OW9zVTVV?=
 =?utf-8?B?S1JhTW5oZnFZbkh4TDRnVzhycXRUZytLaHUrVmw3cVBjR3BUZFcyM090RmxB?=
 =?utf-8?B?MkdpdVhwM1NvQXVoZmhUOGRUcDdpenA0enREQmQzemRmdXhYK2JpUUdGSVFi?=
 =?utf-8?B?WFB6ZFdhalZCakZzRStJczBrdlJHbWU2RktPampvUGtXbCtmaWcxN05qUXR4?=
 =?utf-8?B?L3Y2TVRYemdTODRmSjNkVENXaFVaT1JZc1RESTBSVlNLbXdrajZ0cTdNSXlh?=
 =?utf-8?B?OXBON1ZENDlGMGFvMm9IanNTU3pLR0NQejJmL1R0SmJKdWZPMXdZaVVzT1pS?=
 =?utf-8?B?UGVjM25uSTJwVjZqZjBpRGJrZ2NVaVd5anJVT2pZQzBYNmorTWJEeGw1ZlBF?=
 =?utf-8?B?RjZWcGhkTVNkOTN6dXM4T2RHTmtDLzNFZFF0NENMMWhON3FsazhtZ1JUK25W?=
 =?utf-8?B?NFFWdEtIZDU5YjBoZVo2U2lKbzVwa1ZEU1ZJTmRPUUY0VG9iVWY2UT09?=
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
	VBdWv2JGOoJlrEinaPAgXrAICHSC6hAvvqqXr3QqkSNbFjMULcDA5ZpgHKnyfRJhSrTZSXICpb3/4OQ3GVp3sX5xCZW+SxFM/mw+5/3GSxWLQi0ealZFrxNQnpZ7B2YW43e3UBRfIg7wObyhwKbecf4mdMDxsKL5JXUQ8qIC6eytvGjjhg+vpGMzPiNO8a124p1hjfRUxEB48NG0e+H+YTX1ne9Gx0TeC0KkD008Cs1LbEpFLBKkLZ/OnGdLxc+e5T1/UIxBfS6A4PINY6ra73lpdXfepI8jLhXeVV2hppJRggjEohgEYPANawbtKjSpFuScy/0JaM2ajvLkdjYEZw==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PPFB0715B38B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a038f72-56a8-4bd3-8a53-08df46641849
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 17:39:42.8023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxg9FQVJzbdqVp2VXv3rWYKA0Tf+goAE5w/94FTLwA4zNzFyTxEbHie8rrIiXC7CMhOLa1E4pARrvAqAF/fxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR18MB988706
X-Proofpoint-ORIG-GUID: jiwfzKZGF7eAXgRX9RQDM8vnJqouuiB6
X-Authority-Analysis: v=2.4 cv=Ma35KJ/f c=1 sm=1 tr=0 ts=6aff3461 cx=c_pps
 a=XSy6xVanZX0hR9uvxkBJyg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=om52sd6CQkzxaZdv:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=-AAbraWEqlQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22 a=qit2iCtTFQkLgVSMPQTB:22
 a=P-IC7800AAAA:8 a=1XWaLZrsAAAA:8 a=bBGoXdvshR22MKVOy6AA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MCBTYWx0ZWRfX/Kdm2F34C/Fa
 qH16wUysO6Zt3/PuVo3NBySLWrrpwrYlJ5Gp9qmOrUL0jXiPl1MR9SFXKBbjwxIt6MYIO6f2mX2
 6pk36pzlwK/DdXDH/cUDOamBrg3lQuQ=
X-Proofpoint-GUID: jiwfzKZGF7eAXgRX9RQDM8vnJqouuiB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MCBTYWx0ZWRfX/9433+LTwMnO
 VH9u+4NFsjpCE4+EnLruiR2CoVr5I59rN0q52klajJE1k86A9xe5/IQaYMlrHD3rtHM0FsZwky+
 ZmZfd3dh3OvNmraV8gUrPjp2rWigqa1kdXcAuohlHIR5RKhZ3kPKqm5ebd5qvkmfVeM693iOsN3
 5rRuC/ugi/3SHE7D/MGo1tJkHPnAhoA3ie9Z1MCSlkD7nB/K+VvQC4LaeQ4w8Bxl0k4bVot5XBu
 mEzMzBGPuyt0FHshlL+Lod/2O/ed6q4AxYAVhjGg2iTNITVLyNVsukb3DXe+tcS0B1yTK9pWWvH
 rPmnTRqZEcPN8xKvwEUuwJJEWHa091If9Sg+uTjMUSbEkxTiTjGHHgeLs0FOMCg3yE5NlzTzT20
 AQ+FzHo3eEqb3C8Y84xnvho/Dhc9IULIleYhfFzqfRrneyES5HeqbrdMmsMO4XT8NEyW9XeC9IF
 6/lRwPvFpIzV2J287TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01

PiBwcmVzdGVyYV9yeHR4X3htaXQoKSBpcyBpbnZva2VkIGRpcmVjdGx5IGZyb20gcHJlc3RlcmFf
cG9ydF94bWl0KCksIHRoZQ0KPiBkcml2ZXIncyAubmRvX3N0YXJ0X3htaXQoKSBjYWxsYmFjaywg
d2hvc2UgcmV0dXJuIHR5cGUgaXMgbmV0ZGV2X3R4X3QuDQo+IFdoZW4gc2tiX2Nvd19oZWFkKCkg
b3IgcHJlc3RlcmFfZHNhX2J1aWxkKCkgZmFpbHMsIHByZXN0ZXJhX3J4dHhfeG1pdCgpDQo+IHJl
dHVybnMgTkVUX1hNSVRfRFJPUCAoMHgwMSwgYSBxZGlzYyBjb25nZXN0aW9uIGNvZGUgcmF0aGVy
IHRoYW4gYQ0KPiBuZXRkZXZfdHhfdCB2YWx1ZSkgd2l0aG91dCBmcmVlaW5nIHNrYi4NCj4NCj4g
SW4gZGV2X2hhcmRfc3RhcnRfeG1pdCgpLCBhbnkgcmV0dXJuIGNvZGUgb3RoZXIgdGhhbiBORVRE
RVZfVFhfT0sgKDB4MDApDQo+IGlzIHRyZWF0ZWQgYXMgYSBidXN5L3JlcXVldWUgY29uZGl0aW9u
IHVubGVzcyBkZXZfeG1pdF9jb21wbGV0ZSgpIGhvbGRzOw0KPiBmb3IgYW4gdW5yZWNvZ25pemVk
IHBvc2l0aXZlIHZhbHVlIGxpa2UgMHgwMSwgdGhlIGNvcmUgbmVpdGhlciBmcmVlcyBub3INCj4g
cmVxdWV1ZXMgdGhlIHNrYiAob3IgaGl0cyB0aGUgdW5yZWNvZ25pemVkLXJldHVybiBXQVJOIHBh
dGgpLCBsZWFraW5nDQo+IHRoZSBwYWNrZXQgYnVmZmVyLg0KDQpEaWQgeW91IGNoZWNrIGl0IHlv
dXJzZWxmIG9yIHdhcyB0aGlzIHNlbnRlbmNlIEFJIGdlbmVyYXRlZD8NCg0KUGxlYXNlIGNoZWNr
IGhlcmU6DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny40LXJjMS9zb3VyY2Uv
aW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaCNMMTIyDQoNCmFuZCBoZXJlOg0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjcuNC1yYzEvc291cmNlL2luY2x1ZGUvbGludXgvbmV0ZGV2
aWNlLmgjTDE0NA0KDQpZb3UgaW5kZWVkIG5lZWQgdG8gZnJlZSB0aGUgU0tCLCBidXQgYXMgbG9u
ZyBhcyByYyA8IDB4ZiAod2hpY2ggaXMgdHJ1ZSBmb3IgYm90aCB0aGUgDQpORVRfWE1JVF9EUk9Q
IGFuZCB0aGUgTkVUREVWX1RYX09LIGNhc2VzKSwgdGhlIGJlaGF2aW9yIG9mIGRldl9oYXJkX3N0
YXJ0X3htaXQoKSBpcyB0aGUgc2FtZToNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y3LjQtcmMxL3NvdXJjZS9uZXQvY29yZS9kZXYuYyNMNDA3NA0KDQo+DQo+IEZyZWUgdGhlIHNr
YiB3aXRoIGRldl9rZnJlZV9za2JfYW55KCksIGluY3JlbWVudCB0aGUgY29yZSB0eF9kcm9wcGVk
DQo+IGNvdW50ZXIgdmlhIGRldl9jb3JlX3N0YXRzX3R4X2Ryb3BwZWRfaW5jKCkgKHNvIC5uZG9f
Z2V0X3N0YXRzNjQgcmVwb3J0cw0KPiB0aGUgc29mdHdhcmUgZHJvcCksIGFuZCByZXR1cm4gTkVU
REVWX1RYX09LLg0KPg0KPiBGb3VuZCBieSBlbmFibGluZyBDbGFuZydzIC1XYXNzaWduLWVudW0g
b24gYW4geDg2XzY0IGFsbHllc2NvbmZpZyBidWlsZCwNCj4gd2l0aCBBSSBjb2RpbmcgYXNzaXN0
YW50IGhlbHAgdG8gYXVkaXQgdGhlIHdhcm5pbmcgYW5kIHByZXBhcmUgdGhlIGZpeC4NCj4gQnVp
bGQtdGVzdGVkIHdpdGggQ2xhbmc7IG5vdCBydW50aW1lLXRlc3RlZCBvbiBQcmVzdGVyYSBzd2l0
Y2ggaGFyZHdhcmUuDQo+DQo+IEZpeGVzOiA1MDFlZjMwNjZjODkgKCJuZXQ6IG1hcnZlbGw6IHBy
ZXN0ZXJhOiBBZGQgZHJpdmVyIGZvciBQcmVzdGVyYSBmYW1pbHkgQVNJQyBkZXZpY2VzIikNCj4g
U2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8bWFpbHRvOmlyb2dlcnNAZ29vZ2xlLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3J4
dHguYyB8IDkgKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFy
dmVsbC9wcmVzdGVyYS9wcmVzdGVyYV9yeHR4LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2
ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3J4dHguYw0KPiBpbmRleCBjNGVhMjQ3ZDI0NzAuLjdhYzky
MjBkMzNjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9wcmVz
dGVyYS9wcmVzdGVyYV9yeHR4LmMNCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVs
bC9wcmVzdGVyYS9wcmVzdGVyYV9yeHR4LmMNCj4gQEAgLTgxNywxMyArODE3LDE4IEBAIG5ldGRl
dl90eF90IHByZXN0ZXJhX3J4dHhfeG1pdChzdHJ1Y3QgcHJlc3RlcmFfcG9ydCAqcG9ydCwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikNCj4gICAgICAgZHNhLnBvcnRfbnVtID0gcG9ydC0+aHdfaWQ7DQo+
DQo+ICAgICAgIGlmIChza2JfY293X2hlYWQoc2tiLCBQUkVTVEVSQV9EU0FfSExFTikgPCAwKQ0K
PiAtICAgICAgICAgICAgIHJldHVybiBORVRfWE1JVF9EUk9QOw0KPiArICAgICAgICAgICAgIGdv
dG8gZHJvcF9za2I7DQo+DQo+ICAgICAgIHNrYl9wdXNoKHNrYiwgUFJFU1RFUkFfRFNBX0hMRU4p
Ow0KPiAgICAgICBtZW1tb3ZlKHNrYi0+ZGF0YSwgc2tiLT5kYXRhICsgUFJFU1RFUkFfRFNBX0hM
RU4sIDIgKiBFVEhfQUxFTik7DQo+DQo+ICAgICAgIGlmIChwcmVzdGVyYV9kc2FfYnVpbGQoJmRz
YSwgc2tiLT5kYXRhICsgMiAqIEVUSF9BTEVOKSAhPSAwKQ0KPiAtICAgICAgICAgICAgIHJldHVy
biBORVRfWE1JVF9EUk9QOw0KPiArICAgICAgICAgICAgIGdvdG8gZHJvcF9za2I7DQo+DQo+ICAg
ICAgIHJldHVybiBwcmVzdGVyYV9zZG1hX3htaXQoJnBvcnQtPnN3LT5yeHR4LT5zZG1hLCBza2Ip
Ow0KPiArDQo+ICtkcm9wX3NrYjoNCj4gKyAgICAgZGV2X2tmcmVlX3NrYl9hbnkoc2tiKTsNCj4g
KyAgICAgZGV2X2NvcmVfc3RhdHNfdHhfZHJvcHBlZF9pbmMocG9ydC0+ZGV2KTsNCj4gKyAgICAg
cmV0dXJuIE5FVERFVl9UWF9PSzsNCg0KRm9yIHRoZSBzYWtlIG9mIGNsYXJpdHkgSSB3b3VsZCBy
ZXR1cm4gaGVyZSBORVRfWE1JVF9EUk9QIC4gVGhlIGJlaGF2aW9yIGluIGRldl9oYXJkX3N0YXJ0
X3htaXQoKSB3b3VsZCBiZSB0aGUgc2FtZS4NClRoZXJlIGFyZSA1MyBkcml2ZXJzIHdoaWNoIGN1
cnJlbnRseSByZXR1cm4gdGhpcyB2YWx1ZSwgdGhpcyBpcyBub3QgYW4gaXNvbGF0ZWQgY2FzZSBv
ZiBqdXN0IHRoZSBwcmVzdGVyYSBzd2l0Y2hkZXYgb25lOg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjcuNC1yYzEvQy9pZGVudC9ORVRfWE1JVF9EUk9QDQoNClRoZSByZXN0IG9m
IHRoZSBwYXRjaCBpcyBmaW5lLg0KDQo+ICB9DQo+IC0tDQo+IDIuNTYuMS43MDguZzc3NTcwYTZh
MWQtZ29vZw0KPg0KDQpFbGFkLg0K
