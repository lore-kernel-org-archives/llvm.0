Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF11A23B0
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 21:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384239; cv=fail; b=SCEDvgp/T8mhYGE2Szlg86SlEA+w9J6oyFAVyIY1ZG2D4LpRkIWkVQQf/dLed0QQkQlrd1X86S7KEMXm9vKG9U9+v1XODZwDemWaIfgpF50RXYTUatnJ2wyDXNPrtj2K+7ew3VUBmJEndKSopmyyba6zqioEZTkwrR1pgwK/0vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384239; c=relaxed/simple;
	bh=abqLKj1RQrqrx/gJ4+6Gqx3Qt/l2BRARgPzJZC4+EDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DMJMRty9NrwFPu8YuJKDan02jVuxfn5hheNvrXfAzkQ7flDP3AxX5fSe38p+VSOsrpYOvzulaApmahb2eEvxpjUMT8r1MbkyCJY3ADUHhqnQyJG2ddM67+Pz2Y0at3ZzI5DkBhhVKT9o75RV2kpOeyFb3qchhO/STSjeOt/BJsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com; spf=pass smtp.mailfrom=sap.com; dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b=nXI4gaaV; arc=fail smtp.client-ip=40.107.249.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sap.com header.i=@sap.com header.b="nXI4gaaV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8J8x3A1FoyUlrl2QpvSiKhX22NR5j0RFgrouBAbRu/Wry+BgvtmHRUSxE4rxOL4MakFzGVs70aNKoqEuC4VYepLAJ0b8a2dA6FQkcLYm7WHr5aZNWSsYt4ENMau5HfsPqZNwsIJtVUpO03uRMm4F3VDg7OLiNERaJBZ3T3tB3FvS6j2VVo9GPt71rgIQ/eo5ii6Gn0T26oqwKkM/wzHclWzODRl8XQfTT76aFBMXTBHQ4vasDEfAoYyJWtPwo91gNm7UgK73K9kCnoeNktvGUamSgQSvJQmWv/IzuXg/Q09azcNksnunk+huySUjm+4+FuYJjsWszIGMp57XE3ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abqLKj1RQrqrx/gJ4+6Gqx3Qt/l2BRARgPzJZC4+EDk=;
 b=k8l3hYE/I0Rbo0brh0CbC4i0b/iQKr3H542RQOows7UThs2uBVyT4aimpmd6HVBx2wAGgEbXmVF3+txbqyp4hGDb9Pb4s+7iVIIwDKkl0VibzSmczNuYXfNwb8yc+myFQOsR4QD1tqX1P1xHiHK6pqgLbIAeZqWLCMOlYyKyin2qqffF70rxmYn2nya3GQsWq3B8opzQJqJP1S+Zv10P5WnYusL6H0+r6O4cE7ejpJDrTrSOYYDdK9tsYMg/C7yNrF47nWe7Vx7DG2MBkky2onXoJOyttivERA0MljwYBev/GSItbOe4GqzH4yH82rI8thl7tQDUHvW0P2eMQ0KCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abqLKj1RQrqrx/gJ4+6Gqx3Qt/l2BRARgPzJZC4+EDk=;
 b=nXI4gaaVgaJD93QniBAwFNl0kuLwyBNW62Ok+hCiDGkTK26sx/xfJPf3oo26YQ+xpw8gwP/dG8hPwQWDgQqRtttSQF6uloxSYcrQrqXmQlxGPDqX9VjYF/v6UswtdeEajv4lDLhN22boTzARZZpf+wGAGRfeyc30cKmHNmyIrekSauh0CkGVxrxNiMgHzStQBynnBtMhKPnKpLi/hrhwkP8H+P92gXcHm+LrXsktVqsz9eg1pX6c5tKX4h6PzbxnOQQXI4kJIkAkG3pdysEbm+L3QnALhrQM3vIHaeAGWS9VwoSQLRdqQcAlNQZ3m+gmudDo6o3A+2r3x7ASjBMvfw==
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com (2603:10a6:5:2::21) by
 PAVPR02MB9521.eurprd02.prod.outlook.com (2603:10a6:102:305::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Fri, 7 Mar
 2025 21:50:32 +0000
Received: from DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766]) by DB7PR02MB3626.eurprd02.prod.outlook.com
 ([fe80::26c8:11bf:1fc7:7766%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 21:50:32 +0000
From: "Puchert, Aaron" <aaron.puchert@sap.com>
To: Bart Van Assche <bvanassche@acm.org>, Peter Zijlstra
	<peterz@infradead.org>
CC: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "Paul E. McKenney"
	<paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Subject: RE: Thread Safety Analysis and the Linux kernel
Thread-Topic: Thread Safety Analysis and the Linux kernel
Thread-Index: AQHbjcR3BpDJv5ufIEK0rDgdN08Y7rNkw8mggAEaVQCAAG0tgIAB7GIQ
Date: Fri, 7 Mar 2025 21:50:32 +0000
Message-ID:
 <DB7PR02MB3626A82ABAEAF7F357FCD1A7E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>
References:
 <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306094752.GC16878@noisy.programming.kicks-ass.net>
 <c5e6c203-aa4e-4208-9783-83146c9d49e9@acm.org>
In-Reply-To: <c5e6c203-aa4e-4208-9783-83146c9d49e9@acm.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR02MB3626:EE_|PAVPR02MB9521:EE_
x-ms-office365-filtering-correlation-id: aa6212a5-ad71-415d-12f9-08dd5dc215be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UkRwczYzTnBBcUxQTGVLd0NrOXd5KzhQWmhKdjhXUXlBZkNGMnZHZzZIeGkv?=
 =?utf-8?B?RFVJY3NweWxXZWVZM3kydVhMYU9Db2NtR0IxNzBtc2lLWU9meDh0UWErZWdu?=
 =?utf-8?B?bGM3TDZHSkVXakR6WDhibHVkeTZIcHFUdURNYnQ4ZHc0dW04b2RHVWR3NTFI?=
 =?utf-8?B?VkpNZzBtVVdrSS9sdjdiT2VGM0RuaGpMWWZxbXA2eW9sTUFvcDRkZ3piemND?=
 =?utf-8?B?VG92WS9UOVBta3lJQndmdWtpSEVRUkxGNHVDRzVZZ1hVZ0tGMCtlQUVTKy9Q?=
 =?utf-8?B?Nk5LVXozT3d1cUNvVXpVT1hPZFdDamhLQkZxT2JUQkgybW5tYVJRQnkrNUVT?=
 =?utf-8?B?ZHk3a1VYR3NKaGhTM0toVDVKU0tmRHp4bU1pclQ4ZFNIamtPaDdlK29pYUdl?=
 =?utf-8?B?R1pJZkErMGhXRG5rbVZUcVFhNnhHdzhpVUFLUU9KbE16Qi9ObVFyZy9rWDNp?=
 =?utf-8?B?UFhVcnQ2eHIxTVJqR3IzRk5Dc3dMZm9lUjVDdXFZRlhQbmsvTmlEZjhZeU1w?=
 =?utf-8?B?Q2M4N2pHQWptSHV3eDhOcDhvTkg3K1ZuazF0TFNEaUNMUU82V29idFBSelpB?=
 =?utf-8?B?QzlJYjJvK1dnUEdIbDR4V2ZTTzZOb2R0UDQ3MFIvYjZyckxyOFZzOXppeUJy?=
 =?utf-8?B?cTFaSk5tVkRLNEt2dkpmSEhPOVJzcUErYnJ5bnkxTkxMVk5ITzBLSVFzOC9t?=
 =?utf-8?B?ZGNmczRzNE1yUGRvZlJ1aEh6YjJaWTl0Q09XRm9lRnI5OVRleGNpZ2lpUVBK?=
 =?utf-8?B?Zks5eW1Gd0lMMENndVBsN2RnL0tTS3pYbkdyM1NURVRTRm43Y3QxWjFGSjVG?=
 =?utf-8?B?cFVtckhEYWVLSnlJZnRHQnU5U0lKUGkyMzRKWDVNaTdSUUNBYm0wOE1DaVBY?=
 =?utf-8?B?K3lCODBWZ0FkSm12TlJ1Yi9uNGI0Wi9McGgzM0J5emduRXF4VEtSLzBONkla?=
 =?utf-8?B?aWRPeDhESFV4cDVUWGZ2T0Q0Z0ozOVhWYkxGVHVMSXdRckdRaGVTRUphaTdV?=
 =?utf-8?B?cURvb29qTm1zTVFuV2ZQTlB6SGNRQnlaREZDWm50a1l6Y3ZRTXFJVkcrdkli?=
 =?utf-8?B?L2E1bkl6cTFsZ1pTR1l3UnAwNFFTL3BCMllDd3MwNzNsZktwcTdoUTE4WFk0?=
 =?utf-8?B?amRzVW1qU0tIQ3BjYzhBbWltT3dvYkxyQXR1eXFNTTkyTWZDSkxXL3B0bTZv?=
 =?utf-8?B?NnRSMXRFTXFyTmxiT0JUTUsrVXJSUVErZHV0UXJMZlFnWXBJd2JMUzZlN3FD?=
 =?utf-8?B?dmtwc0FIYVBJekFLMmNiMVBnZnAzS1NOallLWEpQYW1FN05IbFE1bmhlVjhO?=
 =?utf-8?B?VDhsZHNycHBYWFdjOVVranl2RWpIQkJPQzQvVmpEc2kwWGhCbnBNOFhVMWdt?=
 =?utf-8?B?ZG9scHVWTnhJQ29wTHVUbWQ2blE3UTd2cExjRWhFZkZXS0dRbDFqL1B5R3M5?=
 =?utf-8?B?SmN6MEVydWJSWVpnZ0NTWlB1ZUZIRS9LTW9BQ2ZtRUc4cU9UUWt2azcyTE9J?=
 =?utf-8?B?YUh5SnhxMXRVTkt1SDRHSFhMbEpGT2JJWjlWNUU3cG9WeDl1bjZ3MjVUTzJC?=
 =?utf-8?B?OUFoYW1JWk85L1dEUmNrL2dqYVJUVFhpYUtvMG5PL2M3WTV5eExZbUxielVt?=
 =?utf-8?B?djA5QmQvRzIzQVNKUEkxZ2dPbWJHdnB3QVZNVXZRaEZDYmUxWVNCOVpHN1NC?=
 =?utf-8?B?QVNsT3lWY3F6bWJVOEYyWmkrWjFaT0UxS0dvaStTUTBBVHRRQkNsRWhBREV6?=
 =?utf-8?B?K3RVb2VRYlpUVnQ4OTNwRW1oQ3BRazdNZHFpQTgxMmJhWmZIVm9Zc2hCaTdG?=
 =?utf-8?B?Y2c1VEJUdUhKR1Q5MSs0L3dXeTFPMVprSXRSTHlyMXRubVlEbS80SU9vMTFm?=
 =?utf-8?B?Z0U4SSt2M2RHYW50TjhXRXc0bnk4U29WRVBPYnpSV09JaUtEaXFqbC9nV29E?=
 =?utf-8?Q?/qxIaKz97nQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR02MB3626.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUxVRjBGMklvcFloaHVCUEpOd29YU3pDSm1UaDJBQk55RGYzVVZjTGFSYWZ2?=
 =?utf-8?B?WVBTeEk4RGdNNjJXeXcwa2oxOFRzQmJwNno1ajBwVWMzaVFOdVNmaEIzWDNJ?=
 =?utf-8?B?U3RWald4RFA2RHk4T0J6T3AzT2pTcmV6YVNZTlg1dURjcmtUd1F4M01ZUm1O?=
 =?utf-8?B?enh3ZW1UenB5M2hvMC9GOWxsdHk0WWZsZkg3K1AzY3c3SVE4VWVPZjNWME1G?=
 =?utf-8?B?Y3kveCtiK3YxZEJ0TWZFWDdtdXQ3RXBEUlRld0s4cjdtQ3BxeFo1OWtnb0tQ?=
 =?utf-8?B?ak5sNm1lQkFPZHVNSGN6bWs2c01xei9FYUVtRTRaa0VyWjh5SjIzQTBEMVVS?=
 =?utf-8?B?MmNWY0U2V1RsMHRsQ3c4cXJxRVNuZjRaMmhhQUEycXFlR1duM2lIRExPblpk?=
 =?utf-8?B?WGxDT3J1MDgyNDlTV21DZ1V0TWRQc1pwcktQeWJuSjNOTE1vaE5PSVFSQUxk?=
 =?utf-8?B?dzNKRmlPbWJBMWhRckNmTWphRGUyMEh6V0krQUVnY2d1N3NXN01CcnhIcENV?=
 =?utf-8?B?cURxR0JVUDhDOWkxUEFISFQ1cGt5U2pFZDRjLzlSSnRkQmU0UXFRZGdDMFBI?=
 =?utf-8?B?V3BlL0ZUY3VMYlVCVlV3RkwxQVpXbFJqTzVQVU5nQitOUkdmQ1dvNHgwdUty?=
 =?utf-8?B?SDh0RkdFKzJLL2lFcnZaZjJZZFhjSC9nTkxodmxJSHlOZ2R0RHlVOWlHdEp6?=
 =?utf-8?B?QnR0T1VjZnBTUnY5d0N0ZHpmZjZUYW1NQmJXazNXT2RrMVUwZEF0NU43OGZH?=
 =?utf-8?B?VHpsMTdyMERXaHVVTEdobUVuTklLWVlVUXRHb2ZZOXl2Mkc2a0d3dGNZV1My?=
 =?utf-8?B?WHpHODJhdkJ2cFhMak1EVE5DMm1uZFArM3pJcVJpbXVKV3Nva25tUmJVdUF1?=
 =?utf-8?B?bDFpRlVxK0c2NlFxSTNFdytwb2N6SHpjN1J5TWh1dUg4bW5NK0FjVmVLQzRS?=
 =?utf-8?B?VkU0aW52UlBwZTJBQ0Z3VU1lR0lWZmRSajQ4bDY1R010eFE0MFdpd0JISThR?=
 =?utf-8?B?VnFGUmhiQWtVODBuVTBIMlRFMGFmekJhNUQxcVNyQ0RWTjIyMDZOVG1ySFJW?=
 =?utf-8?B?elpKRC81OXlYTlFhMkhLWS9GZlJKQjZjbDR0Ti9ma2pDZHRZdEF2WWhKWXgr?=
 =?utf-8?B?bnZzWGkzb3Faa2J2VW5QeHI5Wm1lTGFJYnNpc3hkdDFmN2thZjJsWmNCUlZJ?=
 =?utf-8?B?TlQ5S2VubXkzL05kcDBJd3JrazJqak1GU0xNZGJ3TTlUeCtVcmcvVTRSSWRS?=
 =?utf-8?B?MDNqMW1CQ3prdmRuaFRZT21UbU0rcEdBRjNBZmN0cytEWmV1V0xhaWplTWhB?=
 =?utf-8?B?a2IxQ1BYU29RZjBoMlBuWE03QWVRckE5SVQ3dTMvYi9Zams3Q0xZWjcwUS91?=
 =?utf-8?B?M3dtSGhzV0M0TGF6WGEzbXlhNlMxeHByVWh1RXBJVXZMeHc4VlVUaWprRCty?=
 =?utf-8?B?VEpYOFBiTS9nTjJxdGp5MXhsK3lsVTd4N29INnFhUlNyVzVkSjU3N1pKcEky?=
 =?utf-8?B?WEtUYlovMFlHV3MwcnpZR0VIUnRyZjc5SE1pbXFLN01MRkUrajN6ZHNtZ0M3?=
 =?utf-8?B?MW93blEyZWlsSkdzVTVuUnlQdXlLY3p3QVpUYUllTjBobnpPelloL3g2NUFa?=
 =?utf-8?B?OW8zUzUvcHJ4SEYweXIrT2FMV2Nrc0xCK2psQ0NzK3d1NExmRFRBdDVUeXJD?=
 =?utf-8?B?WW9WdU9wTjMyVUlieS80ZHJBWVYwenJ0Q1Q1d1hmcy9xQkplSWhBQWhtMWZF?=
 =?utf-8?B?YktxUktUQktwbnFJMUlERFd0eWRVSjZPYXNBWFQ0VFZ6UWtMVVpCSWFqNGUy?=
 =?utf-8?B?eFNmRUhJMkdySWpmTVVWUkVNRFBLcER3ejQxR0ZzNk5BMjQ3bU4wVzE4alJL?=
 =?utf-8?B?K0JWVVlEd0JwVmhNQ3Yzdkc4Zk1QcGNnWTVaQUlsRHVDUkl6R1J1MW5wN2lY?=
 =?utf-8?B?bFFIVWZnTFVhNkxKSHNtZzFDSHJvNUZ1a1FjNWZXSWlmeUN0VkJtT0owVE16?=
 =?utf-8?B?WFpOQ3ZpNEFaaWN3bEY4VDVNM2N1MXV2UTgrTXB6N0FsK0RrT0pUMm5FTzZq?=
 =?utf-8?B?VkhnY1lHQndIbEJ5UG9RK1FMeHJrT3lRMlFyRWtGMUFVSCtYeEljdWcyNUJv?=
 =?utf-8?Q?0WsBLhEmwxj2bswXepkew58l4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR02MB3626.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6212a5-ad71-415d-12f9-08dd5dc215be
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 21:50:32.6157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqCZyASxY2TLSxntw38sA9jpTdVZw1nh9zsi24rRCIJb0yyMYwQc/38KgMLJVMwsBei+jV4u+uKSs9V6ncE/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9521

PiBGcm9tOiBCYXJ0IFZhbiBBc3NjaGUgPGJ2YW5hc3NjaGVAYWNtLm9yZz4NCj4gV291bGQgaXQg
YmUgYWNjZXB0YWJsZSB0byBpbnRyb2R1Y2UgdmFyaWFudHMgb2YgdGhlIGNvbmRpdGlvbmFsIGxv
Y2tpbmcNCj4gZnVuY3Rpb25zIHRoYXQgcmV0dXJuIHRoZSBtdXRleCBwb2ludGVyIGluc3RlYWQg
b2YgYSBib29sZWFuIHRvIGluZGljYXRlDQo+IHdoZXRoZXIgb3Igbm90IGxvY2tpbmcgc3VjY2Vl
ZGVkPyBXb3VsZCB0aGF0IGJlIHN1ZmZpY2llbnQgdG8gY2hhbmdlIHRoZQ0KPiB0eXBlIG9mICd0
JyBhYm92ZSBmcm9tICdzdHJ1Y3QgbXV0ZXggKicgaW50byAnc3RydWN0IG11dGV4ICpjb25zdCc/
IFR3bw0KPiBleGFtcGxlcyBvZiB3aGF0IHN1Y2ggZnVuY3Rpb25zIGNvdWxkIGxvb2sgbGlrZToN
Cj4gDQo+IHN0cnVjdCBtdXRleCAqbXV0ZXhfdHJ5bG9ja19wdHIoc3RydWN0IG11dGV4ICptdXRl
eCkNCj4gCV9fY29uZF9hY3F1aXJlcyhub25udWxsLCBtdXRleCkNCj4gew0KPiAJcmV0dXJuIG11
dGV4X3RyeWxvY2sobXV0ZXgpID8gbXV0ZXggOiBOVUxMOw0KPiB9DQo+IA0KPiBzdHJ1Y3QgbXV0
ZXggKm11dGV4X2xvY2tfaW50ZXJydXB0aWJsZV9wdHIoc3RydWN0IG11dGV4ICptdXRleCwgaW50
ICpyZXMpDQo+IAlfX2NvbmRfYWNxdWlyZXMobm9ubnVsbCwgbXV0ZXgpDQo+IHsNCj4gCWludCBy
ZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUobXV0ZXgpOw0KPiANCj4gCWlmIChyZXMpDQo+
IAkJKnJlcyA9IHJldDsNCj4gDQo+IAlyZXR1cm4gcmV0ID09IDAgPyBtdXRleCA6IE5VTEw7DQo+
IH0NCg0KQXNzdW1pbmcgdGhhdCBfX2NvbmRfYWNxdWlyZXMgaXMgeW91ciBtYWNybyBmb3IgX19h
dHRyaWJ1dGVfXygodHJ5X2FjcXVpcmVfY2FwYWJpbGl0eSkpLCB0aGlzIHNob3VsZG4ndCBiZSBh
biBpc3N1ZS4gV2UgZG9uJ3QgbG9vayBpbnRvIHRyeS1hY3F1aXJlIGFubm90YXRlZCBmdW5jdGlv
biBib2RpZXMsIGFuZCB3ZSBjYW4ndCBiZWNhdXNlIHRoZXkncmUgcHJvYmFibHkgZG9pbmcgY29u
ZGl0aW9uYWwgbG9ja2luZyBpbnRlcm5hbGx5LCB3aGljaCB3ZSBkb24ndCBzdXBwb3J0LiAoWWV0
IHNvbWVob3cgd2Ugc3VwcG9ydCB0cnktYWNxdWlyZS4uLiBidXQgd2UgZG8gc28gYnkgZGVsYXlp
bmcgYWNxdWlzaXRpb24gdG8gYSBicmFuY2ggb24gdGhlIHJldHVybiB2YWx1ZS4pDQoNCkJ1dCBl
dmVuIGlmIHdlIGRpZCwgYWRkaW5nIG5vX3RocmVhZF9zYWZldHlfYW5hbHlzaXMgdG8gc29tZSBp
bnRlcm5hbCBmdW5jdGlvbnMgc2hvdWxkIG5vdCBiZSBhbiBpc3N1ZS4gVGhlIHZhbHVlIG9mIHRo
ZSB3YXJuaW5nIGNvbWVzIGZyb20gYW5hbHl6aW5nIGxhcmdlIHBhcnRzIG9mIHRoZSBjb2RlIGJh
c2UuIElmIHlvdSBleGNsdWRlIHNvbWUgbG9ja2luZyBpbnRlcm5hbHMgeW91J3JlIG5vdCBsb3Np
bmcgbXVjaC4NCg0KSnVzdCBpbiBjYXNlIHRoaXMgaXNuJ3QgY2xlYXI6IHRoZSBhdHRyaWJ1dGUg
ZG9lc24ndCBhZmZlY3QgY2FsbGVycywgYW5kIHdlIGRvbid0IGRvIGlubGluaW5nLiBJdCBzaW1w
bHkgdHVybnMgb2ZmIHRoZSBhbmFseXNpcyBmb3IgdGhpcyBvbmUgZnVuY3Rpb24gYm9keS4NCg0K
QWFyb24NCg==
