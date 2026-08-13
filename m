Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022115.outbound.protection.outlook.com [40.107.75.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A6430301
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603787; cv=fail; b=EEQV5Udnaojs7zDq9eQNwu2rCUjGxpSBP5zfKwb4FWiuHk07vbLjtlkm0h9BRMVaXcsLQpYDEOM85D1lKhDXf6XHCaoiaY9VDa6MlStSO0gV0c9esnqKENOcIblADiSLNCRw6Gh5WVOX8QBHUAn1OgeYMQGWNbZBHf9XBOikv0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603787; c=relaxed/simple;
	bh=Ex5G8ifONEYoe520Z9iLIwbdJ23xmnkE7++4bt04Pos=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=toLlQ1tXkksXhJQ4LPCC25ovmHIrq38l9NsbJPEwk8cAo139uc9Pjd7tgBm/NKsdfw8XLe1/B7QVLsiQxha4jORiZmi+OsN1dw8JbwrrBB7TT8P4Kdthn86tyHVqBvipcdsORrS4l+fOd/YBUAOf0zPf5RnDvEBkAMkRISdvZEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=CDRo/eBZ; arc=fail smtp.client-ip=40.107.75.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="CDRo/eBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2qGJoKMaYkU8pkQLJQKnDO0m7qgZ0Wh8FwBfQHhSC3ECYSxb6W1xQtv776IoOKmXzW+g0wPgbOf08ET9QqLfFTAaAn/xFtWALS8/np2Ma8ukVGyPdr2ObcBaUBKDOvwFEoZIrMxYmp4LKaEZHEbbB7zKk87S/oZHihCLFn1ngejJwh4hJZ42kawl4zLpovk7JRJ5LqyHsqZY/AdmFm/sPAw+pDjvjqCrIqnaqeamjVrKSp5RH7gxehpqfmeTDKHQHfLinXZHxRddDHrYaiJq48kJSJi61YfcqiuorZqRxagu+rfgHiQQHHAWZ8frR1diw2cKUnBheVWpHvwnFu51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex5G8ifONEYoe520Z9iLIwbdJ23xmnkE7++4bt04Pos=;
 b=hSHhid0WVjvyLXjYqxBZgBXBBpjBFnpXTZFzrgVGPyBnn9IRDFVRz691NTMnPZvolrD6bV06JuG1X4TIysTw+mhuO1lIgKLN6eBMqJSR0n4YN6SnHmssytEeoV59IAUQ4kjl7pQ3VzNK8jLKubyUHOaS7scekGn8dB7VmYfGgicxiTSRaxc5E/sVRuPZHipjdXYaem95cuCl29ridooahmftkMXsy+YM5msgnSHB5ga1cOIgOmStAuZfoDwBagEU+3V6B3VAO702wHC11IG0RyJmbhGS38LRDR6x5DEtxNy+r4IjJ3ZZh8YfcslRqOAiZCOTPuneovbN9hEQHyC7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex5G8ifONEYoe520Z9iLIwbdJ23xmnkE7++4bt04Pos=;
 b=CDRo/eBZ4cyCld5eCvJUJj4eyXzdJ5i17dtYJugNFgY3J1Xqeme+2AsBc2Gz+cVMev2Zy1jUIoOYCk9SXMV/Uzv9JGQGWsD30JYefp+1YCj5gjLtqKxisvO9WWAXhmwf6fImO7iyIzXpdSEw51jhN+s9puSgOdMuwEWj6RYajYM=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY8PR04MB9746.apcprd04.prod.outlook.com
 (2603:1096:405:3aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 06:49:42 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 06:49:42 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>
Subject: [RFC PATCH v2 2/4] arm64/debug: Make the Kprobe functions noinstr
Thread-Topic: [RFC PATCH v2 2/4] arm64/debug: Make the Kprobe functions
 noinstr
Thread-Index: AQHdKu/r2gm1OeYBf0erlsZmurrfnA==
Date: Thu, 13 Aug 2026 06:49:42 +0000
Message-ID:
 <f9ec50138a7022b8d83bf3ce8e55534202e17e55.1786603168.git.hongyan.xia@transsion.com>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
In-Reply-To: <cover.1786603168.git.hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|TY8PR04MB9746:EE_
x-ms-office365-filtering-correlation-id: e9a6dcde-ada6-4af3-3dbc-08def9070da3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 bRo4xgeodtucXkmV9hpkQz6ICxKk9vuVdE52FghdIemy4bj/4RVXkMgKgA5GYqp+M9gNZa2xhevn6BNbj0JDTyeehOe1FDSQmTlEeNvSY6MUGuEx9J+QDHxJy/U7sAMk2XT2V8NrZmlxcwaYrdHYqK9oLj/j+p4/ZRd9Z83WBKxadQRNIOfluQRczy+eo4RdjZWLPHaKddWjn7lu0gSgyYWzpS8B0UwTTMzjV19Gb7sqLHYF4dD2O7nOjDUjqU1y/kjsSz5qw0H3rQsbArDALVqhblKhZCwxa8EPG6EiVx9glxnVsMtzbXrRWBYlhmckzi2tjTzsESOoM+l6MPRxW22VwjPfEkyDvKuFsig91sTfBYVZbozpQG930N1Av+tt5c4AgIr58QCU5CQG5xPbZeLc5rjSL3KzwTbnqjmO93qf7Gf0L42/Q5yLgPF/EMlsO7a9iPBa2ksJQUFGHfTJ66IHSWrOoe2OHs3ro7weMNa3Us+n7Y4BFbYSBNFqXeR/gHonsrdeCq6guyyS6pHrkVNDA7NQO9fsaDn5NB/2i0HLIYBS/+r7KwgXEdAXv+EP5PTCcErXCVyFznEynpfMcTAVGOesRvFYAyX/JUZEafpbvKO2j7+iF1NjGwehh0EPwj7oj0NFi8/ot3zNCzKyOQzMOVnZCpWkul9BFcwG/y0eIQ4aCX8K5s8qMEI4uaRjoC2BZjQs5fLZs3pb7cZEJTnhBXbT/AflEwfhgHDUO5w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckl6bWRMaEluU0gxcEgySlllbW1GQko3OG1FZUpCK3E2R1oxMkJEcU1ZTmNn?=
 =?utf-8?B?WnVjcGJ6WEJyMWJLQXdLTVdEcG1Wa1l3WUpFZkhkUVNmL3FpT2RpOHpwdi9V?=
 =?utf-8?B?RWZGb00wdTFyNERqaGNiYkRGaEs1anFSaU9GOUhRQ0RlMlloaFhQNE9ja2dS?=
 =?utf-8?B?MVRlTGpFZmVHZTVOQ3o1T0lKaXhkOXMrYlJLTHBReVMzMjJxRVdaeVhnWGtY?=
 =?utf-8?B?YXpJUGNJTHdqSGY0ZWZMNWIwbEd0ZC9YNDAwazNiTlZjTE1TRXU1UGdudVhj?=
 =?utf-8?B?YWxtTjJFeXlvU0dxK0xJbmVycXFueVdMeDBUc2p5akYzUFRIZWQxTzRQRUZL?=
 =?utf-8?B?YVVuQWhmanZCaGdKRGd2eWJXTW1CcUZiRWQ1WWd4dnIvdmNlMGx6cE84SVVs?=
 =?utf-8?B?YWRNZEtKdHFSWmlPaTl0QUxLZkJsVElicllpOVhjSms5RWZXZ25SdVpJMTZw?=
 =?utf-8?B?Mk0ybEJXaExnWkJWUFNNSWNFMmF3TGtMaXROOG5rNkg1c3dlYWJGYmNueHJJ?=
 =?utf-8?B?c3piRktNL1ZlQjYwMWtIdWVKVFk5NkJaR1BCc2oyWmRjTDVQZGpTVDQvL2tq?=
 =?utf-8?B?c1kxTzE1SmZIUEhxeGpUUFhrakNBbkpxSDNOak1GdmU5cnlrclg0bldWanp4?=
 =?utf-8?B?b1pCOFhURHhhOE90UmlyOUVrSDBwdTBxQkdPYnJrYmFGOHQ4MElZaU5rSFp4?=
 =?utf-8?B?ZFRHWUc3TjFlanc5NEVybmtmU2F6WFh2V1ZEZ3FLQnNQeWN6L0M3cFl4cnlw?=
 =?utf-8?B?ck8yT1hhRjlZanhLRW91QWhFK0N6Rm41ZGowNnpWOXNZOFlJZHFSWTNDNnhM?=
 =?utf-8?B?aVl4VTU3KzNqbHFhRnVRekFiMWlQbkxQZnV2UTBTeWhBZkhKSFdjR3RZdzRR?=
 =?utf-8?B?U1JjNkwvSngvTkdoUHEvNUwwMUpMOGZOOEJWVElUeUcwVXdJc29GVlNmL2tL?=
 =?utf-8?B?VXRiQXdHQW05am0rQTU5Nk9vbXU4VEtMODJxeTQ5clNORjQwV05LcFozbTZp?=
 =?utf-8?B?Ym44T3l4Z0Q3L0pqNEZNRnM2b0hLSkdRdXpTK3Q0cDdNV1NsMDBWd3hjVGty?=
 =?utf-8?B?QWlQRXdsTWJ5VjdqL21paWRBc1I4WXkxWC9QOEtBeitiWWhMREk5K3RQa3My?=
 =?utf-8?B?Z0FtaFpQaGk5MUdtZFBaTDVqSHY0WnRpbkppdGVPRmlSZjI1eEJZMk05RUd4?=
 =?utf-8?B?LzllaVllRFFPam1uZDlnYU5RbEtTRS9jWHlzOFhGdVFjOWdPZnlEOHRWaUJ5?=
 =?utf-8?B?WUVkdjJqTWwxMTZtMmlueWtNd0JPQVF0Y3cvb0sxVXo5WGJRTzZMcTJZQnNU?=
 =?utf-8?B?elM2b1N3emxxM1hQL3NLdnZGaXdEcHV0YVByb1ovRVkzWnY3RmZnL2ZPNTdu?=
 =?utf-8?B?dTN1UGxla0xkalJJazFRVTU4TjZkSmJZcDJWYjMvQy9MNVJqZURnV2t2M3RO?=
 =?utf-8?B?U0VGRVNNRCtDdzEzb2ovTzBuVzRlTGhrSHp2V2xYWU9qejI1NW1QT0ZXS0dW?=
 =?utf-8?B?citjSFBGYlkyL0tha2E4WVo0THRndmRNWktuQ0hPSmpnWUlVU0lDYUFTQkhR?=
 =?utf-8?B?WnNOVVhXcVl6TVpKNzFZWER4djkyNlpvMWpNQkwxd0lmaFJja01SQ0dTZHN3?=
 =?utf-8?B?KzZTVzVrc1N4cm15UkdVcmF1L0FpZnJ3SWhFd0VvQjhvZDFIWUR0eWdPNjFm?=
 =?utf-8?B?SFRtU2hsbUdQZ0VJYnFTd1hLL1ZSdGM0dGFVZVFZRUNjV3lEdTlCcWNVL3pS?=
 =?utf-8?B?aWVHNEQwNjlPRC9iTkVTNjZVbjF3MktsS1BKcTZZVGhzeVlnRElpajRCWGpB?=
 =?utf-8?B?YjdDcWN1eFJ5UWdZT1Z2UW90S2pNLzV3a3c3QmxQT1JJaG12OE1WMWNtcjRy?=
 =?utf-8?B?eGVoVnBZSnRVTElYYWE5TUxGMnd5YmlPa2xEeG8yeTdwYU5ya20wR3VpZWJ3?=
 =?utf-8?B?TjdnSTFEbDZHUXNVRGV0TkluUFMweU9xdVdIRWNWb3Z3RGtLZW1IUzNsRUs2?=
 =?utf-8?B?dVY5WXNWL3RwNDRybkZIS2R0d2lQUjMweUNsU0RnemV2NllBNUpTS3RyM0x5?=
 =?utf-8?B?NjZiUzB0Rzh1aUtKeEJYRU5xVk5LOWJnZjRxL1JUc3gvRG1Fd3NqSWZ5Y0V0?=
 =?utf-8?B?d1VmWUxRTmw0MDVqeU5sMENmYnVVUzQ3ZUE1L3BRRm1RUXpIbzVYZmdmZWNt?=
 =?utf-8?B?R3ZyakJnQ090VDVjRXRnMVFQaVltV0YyVVU5VXhNcVc5Q21LYm9aTUpWVTho?=
 =?utf-8?B?bXp3OENDRFZVYTBVMGIwYWVpS1h3cDVOaHluM2psUkV2QVJ5bXdQYlYvUkor?=
 =?utf-8?B?VnJaNDJEQWhCaXpkSUtMNHA3SlRkZHA2S2hTWW96cXRwRTdNSkpHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6dcde-ada6-4af3-3dbc-08def9070da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:49:42.1899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ws0zQiG10iv9fJ8ytcohwcymem8P1vslo42k272cCrAw8Cf5HlvUUyQs77NtDieIO77yx1OYH+PDGw6KmsfnAHb12ctW7SNu2OSkP9mPx2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR04MB9746

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+CgpUaGUgS3Byb2Jl
IGRlYnVnIGV4Y2VwdGlvbiBwYXRoIG11c3QgYmUgcnVuIHdpdGggZXh0cmEgY2FyZS4gTk9LUFJP
QkUKaXNuJ3Qgc3VmZmljaWVudCwgYXMgb3RoZXIgaW5zdHJ1bWVudGF0aW9uIGxpa2UgZnRyYWNl
IHN0aWxsIG9wZW5zIGEgY2FuCm9mIHdvcm1zIHRoYXQgaXMgdmVyeSBjb21wbGV4IHRvIGRlYWwg
d2l0aC4KCk1hcmsgdGhlIHRocmVlIG1haW4gS3Byb2JlIGVudHJ5IHBvaW50cyBub2luc3RyLCBh
cyB3ZWxsIGFzIHRoZSBkZWJ1ZwpleGNlcHRpb24gcGF0aHMgdGhhdCBsZWFkIHRvIGFuZCBleGl0
IGZyb20gdGhlc2UgZW50cnkgcG9pbnRzLiBOb3RlIHRoYXQKbm9pbnN0ciBhdHRyaWJ1dGUgaXMg
c3Ryb25nZXIgYW5kIGNhbiBzYWZlbHkgcmVwbGFjZSBOT0tQUk9CRSBhbmQKX19rcHJvYmUgbW9k
aWZpZXJzLgoKQWxzbyBtYXJrIGVzcl9icmtfY29tbWVudCgpIF9fYWx3YXlzX2lubGluZSwgYXMg
Y2xhbmcgZG9lcyBub3QKcmVsaWFibHkgaW5saW5lIHBsYWluIHN0YXRpYyBpbmxpbmUgZnVuY3Rp
b25zIGludG8gbm9pbmxpbmUgKG5vaW5zdHIpCmNhbGxlcnMgc3VjaCBhcyBjYWxsX2VsMV9icmVh
a19ob29rKCkuCgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lhbi54aWFAdHJhbnNz
aW9uLmNvbT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Vzci5oICAgICAgIHwgMiArLQog
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rcHJvYmVzLmggICB8IDkgKysrLS0tLS0tCiBhcmNoL2Fy
bTY0L2tlcm5lbC9kZWJ1Zy1tb25pdG9ycy5jIHwgNiArKy0tLS0KIGFyY2gvYXJtNjQva2VybmVs
L3Byb2Jlcy9rcHJvYmVzLmMgfCA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vZXNyLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Vzci5oCmluZGV4IGY4MTZmNWQ3N2Yx
YS4uYTc1YmZkYjdlNWZlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Vzci5o
CisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZXNyLmgKQEAgLTQzNyw3ICs0MzcsNyBAQAog
I2lmbmRlZiBfX0FTU0VNQkxFUl9fCiAjaW5jbHVkZSA8YXNtL3R5cGVzLmg+CiAKLXN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBlc3JfYnJrX2NvbW1lbnQodW5zaWduZWQgbG9uZyBlc3IpCitz
dGF0aWMgX19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgZXNyX2Jya19jb21tZW50KHVuc2ln
bmVkIGxvbmcgZXNyKQogewogCXJldHVybiBlc3IgJiBFU1JfRUx4X0JSSzY0X0lTU19DT01NRU5U
X01BU0s7CiB9CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2twcm9iZXMuaCBi
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Byb2Jlcy5oCmluZGV4IDM1Y2UyYzk0MDQwZS4uYTY5
NGY3ZDM0ZjQ1IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2twcm9iZXMuaAor
KysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2twcm9iZXMuaApAQCAtNDgsMTEgKzQ4LDggQEAg
dm9pZCBfX2twcm9iZXMgKnRyYW1wb2xpbmVfcHJvYmVfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAq
cmVncyk7CiAKICNlbmRpZiAvKiBDT05GSUdfS1BST0JFUyAqLwogCi1pbnQgX19rcHJvYmVzIGtw
cm9iZV9icmtfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywKLQkJCQkgdW5zaWduZWQgbG9u
ZyBlc3IpOwotaW50IF9fa3Byb2JlcyBrcHJvYmVfc3NfYnJrX2hhbmRsZXIoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MsCi0JCQkJIHVuc2lnbmVkIGxvbmcgZXNyKTsKLWludCBfX2twcm9iZXMga3JldHBy
b2JlX2Jya19oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLAotCQkJCSB1bnNpZ25lZCBsb25n
IGVzcik7CitpbnQgbm9pbnN0ciBrcHJvYmVfYnJrX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsIHVuc2lnbmVkIGxvbmcgZXNyKTsKK2ludCBub2luc3RyIGtwcm9iZV9zc19icmtfaGFuZGxl
cihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3IpOworaW50IG5vaW5zdHIg
a3JldHByb2JlX2Jya19oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25n
IGVzcik7CiAKICNlbmRpZiAvKiBfQVJNX0tQUk9CRVNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9rZXJuZWwvZGVidWctbW9uaXRvcnMuYyBiL2FyY2gvYXJtNjQva2VybmVsL2RlYnVnLW1v
bml0b3JzLmMKaW5kZXggMjkzMDc2NDJmNGM5Li41Y2Y0ZmI4ZGRmODMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQva2VybmVsL2RlYnVnLW1vbml0b3JzLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwv
ZGVidWctbW9uaXRvcnMuYwpAQCAtMjA3LDcgKzIwNyw3IEBAIHZvaWQgZG9fZWwxX3NvZnRzdGVw
KHVuc2lnbmVkIGxvbmcgZXNyLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKIH0KIE5PS1BST0JFX1NZ
TUJPTChkb19lbDFfc29mdHN0ZXApOwogCi1zdGF0aWMgaW50IGNhbGxfZWwxX2JyZWFrX2hvb2so
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXNyKQorc3RhdGljIGludCBub2lu
c3RyIGNhbGxfZWwxX2JyZWFrX2hvb2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxv
bmcgZXNyKQogewogCWlmIChlc3JfYnJrX2NvbW1lbnQoZXNyKSA9PSBCVUdfQlJLX0lNTSkKIAkJ
cmV0dXJuIGJ1Z19icmtfaGFuZGxlcihyZWdzLCBlc3IpOwpAQCAtMjQ1LDcgKzI0NSw2IEBAIHN0
YXRpYyBpbnQgY2FsbF9lbDFfYnJlYWtfaG9vayhzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWdu
ZWQgbG9uZyBlc3IpCiAKIAlyZXR1cm4gREJHX0hPT0tfRVJST1I7CiB9Ci1OT0tQUk9CRV9TWU1C
T0woY2FsbF9lbDFfYnJlYWtfaG9vayk7CiAKIC8qCiAgKiBXZSBoYXZlIGFscmVhZHkgdW5tYXNr
ZWQgaW50ZXJydXB0cyBhbmQgZW5hYmxlZCBwcmVlbXB0aW9uCkBAIC0yNjEsMTQgKzI2MCwxMyBA
QCB2b2lkIGRvX2VsMF9icms2NCh1bnNpZ25lZCBsb25nIGVzciwgc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiAJc2VuZF91c2VyX3NpZ3RyYXAoVFJBUF9CUktQVCk7CiB9CiAKLXZvaWQgZG9fZWwxX2Jy
azY0KHVuc2lnbmVkIGxvbmcgZXNyLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3ZvaWQgbm9pbnN0
ciBkb19lbDFfYnJrNjQodW5zaWduZWQgbG9uZyBlc3IsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQog
ewogCWlmIChjYWxsX2VsMV9icmVha19ob29rKHJlZ3MsIGVzcikgPT0gREJHX0hPT0tfSEFORExF
RCkKIAkJcmV0dXJuOwogCiAJZGllKCJPb3BzIC0gQlJLIiwgcmVncywgZXNyKTsKIH0KLU5PS1BS
T0JFX1NZTUJPTChkb19lbDFfYnJrNjQpOwogCiAjaWZkZWYgQ09ORklHX0NPTVBBVAogdm9pZCBk
b19ia3B0MzIodW5zaWduZWQgbG9uZyBlc3IsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gvYXJtNjQva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMKaW5kZXggNGUwZWZhZDVjYWYyLi4wZTY2YWJmOTk1OGUgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKKysrIGIvYXJjaC9h
cm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwpAQCAtMzUwLDcgKzM1MCw3IEBAIGludCBfX2tw
cm9iZXMga3Byb2JlX2ZhdWx0X2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVk
IGludCBmc3IpCiAJcmV0dXJuIDA7CiB9CiAKLWludCBfX2twcm9iZXMKK2ludCBub2luc3RyCiBr
cHJvYmVfYnJrX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXNy
KQogewogCXN0cnVjdCBrcHJvYmUgKnAsICpjdXJfa3Byb2JlOwpAQCAtMzk0LDcgKzM5NCw3IEBA
IGtwcm9iZV9icmtfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBl
c3IpCiAJcmV0dXJuIERCR19IT09LX0hBTkRMRUQ7CiB9CiAKLWludCBfX2twcm9iZXMKK2ludCBu
b2luc3RyCiBrcHJvYmVfc3NfYnJrX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2ln
bmVkIGxvbmcgZXNyKQogewogCXN0cnVjdCBrcHJvYmVfY3RsYmxrICprY2IgPSBnZXRfa3Byb2Jl
X2N0bGJsaygpOwpAQCAtNDEzLDcgKzQxMyw3IEBAIGtwcm9iZV9zc19icmtfaGFuZGxlcihzdHJ1
Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3IpCiAJcmV0dXJuIERCR19IT09LX0VS
Uk9SOwogfQogCi1pbnQgX19rcHJvYmVzCitpbnQgbm9pbnN0cgoga3JldHByb2JlX2Jya19oYW5k
bGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVzcikKIHsKIAlpZiAocmVn
cy0+cGMgIT0gKHVuc2lnbmVkIGxvbmcpX19rcmV0cHJvYmVfdHJhbXBvbGluZSkKLS0gCjIuNDcu
MwoK
