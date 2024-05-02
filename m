Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3C28DA5;
	Thu,  2 May 2024 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714637058; cv=fail; b=odPwyata0jDAZ6ank49gnES3R8aYZ7zML9oVpqDcCo8oPPpwz8FL1L6SdwP9Vvkr0f8cJncpbURCQvnSA1XsWkoe5/o5/qK9tHNHI6J7tlcjBAn8ilknwGtP1pr4eUZG2mcu9zV8PdeGJghS5p4waNw1rl8S2ppuCcq/j5vAvDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714637058; c=relaxed/simple;
	bh=EZWz8m4hL+Iu2jitQsRaLbcpsXo62sDQQkTetqKgyrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hBz1u/VfRNEKXI1KXemz+g83kkNgs9GIbTgQWx9Kw8FOAO/lhIBA5bqueSzzXviqOly7y3Gn3atyB8wemxq87UeyK1GXcZ8KJPrgRfsjraaa2Q6k0HK7W3Wqy8vT67rQ8cImDD8sSDgPKG0/P1LyhfupgtlYMfAG5lzsKaaI65c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com; spf=pass smtp.mailfrom=alpsalpine.com; dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b=ahjWxtpf; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpsalpine.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b="ahjWxtpf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ5AXVdpRDh0GZEobnY5giHCbpVeeFLs7aIhVFzcxNiie2wYGpsJ/W59P4iKL9HOQOEXyC6Fz8rZ6vc7jHmabgWrmFuD9FYN4mNhey1Vf+ecnE8Lato9GduviHBIF5mL4ia4b+muzaMsQqRshgRPeTFfifD741aqBXfIKnnUUCbHZDR5LCRPtv5MjmYzklcDqFm0nDz+etlnAYjrG0+M9HD27CNDEIhMvjgTmjHGTFibtNe/2nSgsUcGu3nZspwZzWd6E0CyDVZP9vuLHiPK34ttKW6kWrS7uUbVQGElMlomHaEpTov02aNCIE/Yp+72ZR34OcParK0QFdsi3QexmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkAYYaKrs3oFFhzuzMccMS395iJcUgojjlsnamcL/s8=;
 b=VeTQHhulvF0VlJwlnKumqXpc4Q15eu+LorJiPaPAoQ/d2L1EsEsaoH4SGVSiFlFrCbZlOlVrWp6LX3izjAHDWLQTuzLApLinlCnTx15aqEa+EVtlygbkOCftVy9cwsJBD98rBTGHDyY3fGHCxtJUbyWsTlSA76Kh69X5PMAIatiY4+I2ed4eOp0SmDSmwLRBlbB45f0DXW365SyAKMGE6EQsarXmaPu4B4qx15KFQQDG+wf4bX7J3Y4wNfbKSbg0iavqCJLjJ/NmHlec3La+d066/Ro/2qLKjWK/Hbil9YhirgiFIyV8GHjUTu+FJbf3BMkku+eFgZIr5n2A0LopPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alpsalpine.com; dmarc=pass action=none
 header.from=alpsalpine.com; dkim=pass header.d=alpsalpine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpsalpine.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkAYYaKrs3oFFhzuzMccMS395iJcUgojjlsnamcL/s8=;
 b=ahjWxtpfZlK/P2e1Vv22nolpjhfCmby5k/xE34RBgkSD0rTMbHWYNIZeH2IiEYWSRiDYmuPbY/4HGT1ZWr55JL80EbEaHB/mFXp46bwdmqfHtjgpYqV2P9WFK8t+YwY0OhT5hoGpZSAbN9s4M2diK15/k9B1fZMDltDmIa+QF77zygRzJQGaxxY5DlLSlZNsnLLolFvP80S6r0/Djf7Pqtm/+aUMxXmi10w9IUGbwY1uLplmCcZj1RyboBkhwkoynZ4fan/3iIS8ow7quw5grmdLujWW6s0jowU7EyErKEjE8gNh/shiuLYhgCcbtZYFEtPpdwwPoq9DMXN4u1QJLQ==
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::14) by TYYPR01MB6895.jpnprd01.prod.outlook.com
 (2603:1096:400:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 2 May
 2024 08:04:14 +0000
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::fe5b:1283:68a6:dacc]) by TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::fe5b:1283:68a6:dacc%4]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 08:04:14 +0000
From: Norihiko Hama <norihiko.hama@alpsalpine.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [usb:usb-testing 17/35] drivers/usb/storage/usb.c:141:21: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Thread-Topic: [usb:usb-testing 17/35] drivers/usb/storage/usb.c:141:21: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Thread-Index: AQHam5F1f0p9ZiVPU06SSJjgDE12SLGB8JoAgAB47YCAASsUQA==
Date: Thu, 2 May 2024 08:04:14 +0000
Message-ID:
 <TYVPR01MB1078177211401B245ED7150B290182@TYVPR01MB10781.jpnprd01.prod.outlook.com>
References: <202405011431.PvaZHpRK-lkp@intel.com>
 <2024050141-remote-mockup-f933@gregkh>
 <3e2a7570-0704-4453-ad0b-68c5806157e5@rowland.harvard.edu>
In-Reply-To: <3e2a7570-0704-4453-ad0b-68c5806157e5@rowland.harvard.edu>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=alpsalpine.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB10781:EE_|TYYPR01MB6895:EE_
x-ms-office365-filtering-correlation-id: 7f85a195-5683-4131-2c06-08dc6a7e7514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?utf-7?B?RW1XendiUGZiVXp3bUFVTSstUlZyMHZyWHlRemlMeWFQL3BLT0l1S2dxejlR?=
 =?utf-7?B?RWJsbXFVbFNzeTIveDc4NTh3WFM5akhDQ09iWWExZWVUNnJXQUZQVWUrLVBE?=
 =?utf-7?B?QUpBWnlxclpMUystZE8wN0h6QTVUS0dFTmxzZEtSVGo3aDh4aUtyOUc2RDUy?=
 =?utf-7?B?bHNMOFhhdFUxRnVWb01lbSstQ3ZYRWx3MEMvWE8vcGlOVXV1clBEcFM2eXA=?=
 =?utf-7?B?NCstY3RSbi9hSXRtaTZUL2VqZHlJNEt4dDhEblMxNEg5b0xzZm0xSVFhbVBh?=
 =?utf-7?B?RmN0bkJORW54SmRFc1R4UEZ4SjNTMkswTmxqYmtoSm9lRXowMlYxbHdpczQ2?=
 =?utf-7?B?cTU0TndMQzNYaFZObUFaMystbmZzMGwwNWhncDdDZmlDWlFzWld5ZistMXJ2?=
 =?utf-7?B?amlYcmRIbDFWNjVjS1NMU1AxWjFPTHlxVGk4U2JlSjhVUzhYUjNVVVkrLWM3?=
 =?utf-7?B?Z3VuUUN4VmhnQmRETUhCMG1CaElJMGpNRXZ3QlhzTXlxRjkrLTlXWndWWHlJ?=
 =?utf-7?B?QVBoeU9IWFVmQzJ3eHlnSjE4ZGpjMmpYcVhBazYrLWxRQS9RVGowcjBiSzhr?=
 =?utf-7?B?b1RmL2NvMXdtY092dWg2ZnhzVFhOVXdpd09OQ2NSN2VWTXJrMlFYWXA3ek1I?=
 =?utf-7?B?TzJVUHYxcHVUZkkrLWFqRUZMNmZLaFhKQWxvNmFaVXN1WGhxMG9jWGoxWVVr?=
 =?utf-7?B?QmpaUmNNVDR6N1pXa2lMR2lzUlFhYlBEd25WclNYSistTzJmS1c3R2ZVS1lF?=
 =?utf-7?B?VnhwZnZqa2lwT1pURnE4NWtuL1NXYmFld2RIKy1ucUozczJ6R1B5N01TVjFH?=
 =?utf-7?B?YVlIOU1mTXV2b1F2N3N0di96SkF6ek9zN3RYV1FqRUQ2c3N6OER0Vkh4aG5U?=
 =?utf-7?B?aEFXN09zUHprNWRhVnRmRktTWmRwQ3M1S29nRkJKM1lCNVY2dkQzekNOTG9U?=
 =?utf-7?B?UmhIa09tVkt1ZXEvOCstdWoyd2I3eTJzQWIrLVdSdE8vRHNaYzBLWkVuN2hO?=
 =?utf-7?B?VGRNd2JVTFNMNzNXaVhDWWFReEl0S3BCc0dhdlNKVFRrV0lySXppMkMxclhX?=
 =?utf-7?B?WEI5WldMNjBoV1JoMFdjZlhibmxkdUFiQkM3a1F4MlVrSzloNEF1M0xWeWw2?=
 =?utf-7?B?NnIyT21ESHA1QkNXYWpxUkJVUzZCbG04UDRtakVJeXVZNnpTcVpDSTdYRy9K?=
 =?utf-7?B?empOdUhpS1NxMUV3TFZmZ21uWmcwVjJwRnUrLXBiUi9PKy1uTE9vV2RxWFVB?=
 =?utf-7?B?UE9TSkFMYUxWdDAxYTFxT3FHREU0aGZwNUFCbzNpYXBjRXNUTDB2bnNaTkd1?=
 =?utf-7?B?WEtBZ3pidGFkOWZUbkVDWE9SckwwVDIvRUZQUEdOREtqMDA1elRaM1FWL2RT?=
 =?utf-7?B?QXlRMjRkMFd1T0ExbXBneVE4OXYwZWQ4TVcrLXY3NEtFRDZWNDhQekdhZkwx?=
 =?utf-7?B?djQ0MGFSWnpSaENsZW9lM0lpWTRXR01UWHltOUZ1dnpsNUxDSkRLWGlJa3o3?=
 =?utf-7?B?NSstZHZrdWtpYXZwMGRWQzRraXE4U2ptTlc2NHM2N3J1ZlhLcjZvbEZOTWIz?=
 =?utf-7?B?Z1NtRHUycy92U20ycXRjTGFndkNIMTlCazhiQ25GbTFuV3dwTHJZZVRkU1lZ?=
 =?utf-7?B?OW0xNDZuMGFHdzRLeWNWQWpWc3RFNzZweklPbnZCZ3JKNHJQSGhOQVp0c25m?=
 =?utf-7?B?QnB4ckVpVWJxeHN2eVpicVI0SWp2OTBNSmtsZnV6aURVRGpvcWdMNlREYk5o?=
 =?utf-7?B?c1h0VndVeTVWU0x2WU50U0dzVmd3YWxkVndJVlNxMWZFdlE1UldMeVR4YVFa?=
 =?utf-7?B?RWlkMUpUZWxURmlMR1JiSTRrRENNZklXVTd2c1gySWFYcGxRK0FEMEFQUS0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB10781.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?YWszQUN5dnNQazBVeEFnTUNmT3NLRXdlSlgxTUtkam9tRmthOGNUaUNDZFJp?=
 =?utf-7?B?ZmRWUjFXc3VnV2FBVHduTVg0ekt1RVZyek9kQVdTQ2ZKTFc5WXFtdGVHeDZF?=
 =?utf-7?B?dnN2d1pCOUVtenpiZ0hIQTIrLU1ybWM1L1NpUGhReGhHY05ZRkdCb2x5eURQ?=
 =?utf-7?B?ZHNna1lhUmZ2V0tYVTRLVmVyNUdpZXdFajZFSjR3L3NUbmdTYistTXU5TnJF?=
 =?utf-7?B?eFhLRm9VcmE0ZDBFY1dPZFhrQWY0TTNpMjJGWFRtRmdKT1ZEMnB3ZG14QVVV?=
 =?utf-7?B?bUFiOFMrLXVsbjZWb0JwcTJ0Y1VUeEdudFVyY3NZWlhpTE4yaHBHNUY0d0hE?=
 =?utf-7?B?VEpCaXlacC9jRFdmRkh4MVNIbDBocDJlejRJZGJIeHZmSmRVekRBT0xpTGVM?=
 =?utf-7?B?QnZrRUJZb01BZUVCdXJnV3hNZW1iM2hmMnNmbWRJaDduMzdZTTlZbHM2bCst?=
 =?utf-7?B?MEhKYmNYNkc5OHpRdkYxSTV3NXkybjN6UlRlc1hwMEZwSGJkUVAwRkhhWWp3?=
 =?utf-7?B?Vms1U0taTlRicE9PQ1FnTGNGMUQwRGhxaHlwYnFvYzFURHorLS8zQWVoNzJP?=
 =?utf-7?B?eWN4YnRBRzZLbEJMdXoxKy05LzRSKy1WWnF6b3dvcDVMNXFaejh2cVRvVGtx?=
 =?utf-7?B?OVBLd1VQMnpHdFdLOFdUbmp1VEZQc3NpR1NsSlpKcHZkVjQzSEpuTjRYRlo=?=
 =?utf-7?B?Ky1MTXJwZEdqOVovckpsT1hrelRvUHBVSm9qVXF2N1lkV05lcVY3Rk5nUVpZ?=
 =?utf-7?B?a3hEWm1TZ1E1S2VwakhWN2p1WnkxVFNmUDJiUVV1bWN2TkVEN0tkMHJmb3RK?=
 =?utf-7?B?YmFFblM1aTByY2pXbEo0U0N3V1ZUNE9PWGNDbUNta0FGT2xYUXZpdmVLZ3hx?=
 =?utf-7?B?WEFpZld6YnZiRFYzbEd3VENmYUR5Wm9vaUV1SjdBWnA5cWdENFdoNTE0cUZh?=
 =?utf-7?B?NmlwNk9NMjM5dlNtb2FIRTBjdnM4M0ZpNm9XTW9jY2ZucUl4SGlHUSstMzZV?=
 =?utf-7?B?UXg0ZWsvVXNCdTRwSTZqeGxheWxSM0NybWhscU9HbktiRC9jNGpDR04wbFA0?=
 =?utf-7?B?S1MxQVpINGJoM0FCKy0xT3RBVWpIa3pTa3UwZnNFb1ZTR1o1SkdWdXdnb2pZ?=
 =?utf-7?B?ZXV2MmVpMVcwUkZGVVhIbnJXclAyWlBLbkFzS1FXQUNLcEErLVNDZVVZKy1P?=
 =?utf-7?B?RHl1T2dXTmlMdGNjQmhMRUNiNS9NSi9mZ1FqVistWG9QMDdyRGZZcmUyRmdR?=
 =?utf-7?B?ekh4NUd5ejRmUWp4NGFrTWtqVFpaNFFKcjNVOHBDUkJha1VCeG9PUm5PY09U?=
 =?utf-7?B?Rk1GUzEzMnlqNDdPOC95ZXZHWmtwWEtHdkpoR2laY1lRc1VORGxET0tGQ0J1?=
 =?utf-7?B?aHF1QlJ1eHFtUDFPV1ZaMi9adWp3azV5OVBzMVlzdjArLXJZUTYzaXkwbGhv?=
 =?utf-7?B?OGRNMXVjNTh6bHJ1dkpaRGVUdWV3MWJXYXV1b28xRk1hZFk1U1JUL0dabVQy?=
 =?utf-7?B?OXlvU2xOQkVScklvY1ZvR3Y3djg4ZFpTdHBUMkRHdFgxMVRjdXhITjRNM2o4?=
 =?utf-7?B?aktodno2RFppWVZkKy1zb0wxZDJiTTlSa0FpOFVKYzVMTGt5TjhFVERtTEx1?=
 =?utf-7?B?WjNKVEZCWGhBemNvWmRLdistZmthWHBacDBaa2QyRlVlMlNBMkh1MTliWVpN?=
 =?utf-7?B?bzJXZ1RwMnZtZlBkNHBIVW9TNGU1TXI2dGplVHRvME9RMFVVTVJJdlk5dlFh?=
 =?utf-7?B?WnNGVks1Ny81MmhkVy9wUW41VjhVOVVrcHBFaDl4M3FWcE5QdlA1aWhwVEh2?=
 =?utf-7?B?aFZLeXVlVjR2cDJpQ1E0alBRQXl3eHo4QWcwMU1EWFRBbHUxNU1RZVF6MWV2?=
 =?utf-7?B?UE1KQlBnb3JkeGlFcTlyMkk1WkRJalVjWXpjcENWKy1oRVU5WThnVVMzekRw?=
 =?utf-7?B?ZHNOWnJnUEVKQnJ0ODFwM3YzQzduanQ1NWlGV1FPUmZHQ2doYXhKN203MDh6?=
 =?utf-7?B?WXl2VjlQS0s1djVuR0lhVEEva0Q3Z0xvWWFwS2tPTkVCTmU2Smo5OFR2MUpB?=
 =?utf-7?B?UTVsTUhnZ3hYcjgrLTNpRTR0em03alEybElqZk8yOWVDZXBhSzU2a25UaGtC?=
 =?utf-7?B?OUYrLS9mbnhwRXg3TWlDOXUrLU54ZmlDQ09RaHE1NFR0NWhyanA3NWRBSC8z?=
 =?utf-7?B?ZA==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: alpsalpine.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10781.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f85a195-5683-4131-2c06-08dc6a7e7514
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 08:04:14.2253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2k9GAp5h6t8Rk//l3um3CfvS2+8yTA9NaOb+h2ffcWpApeZW4kg/NmHzv/yE37BTy+KUxnGEVwV0dRHAtDVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6895

On Wed, May 011, 2024 at 11:03 PM +-0900, Alan Stern wrote:
+AD4- On Wed, May 01, 2024 at 08:50:36AM +-0200, Greg Kroah-Hartman wrote:
+AD4- +AD4- On Wed, May 01, 2024 at 02:32:56PM +-0800, kernel test robot wr=
ote:
+AD4- +AD4- +AD4- tree:   https://git.kernel.org/pub/scm/linux/kernel/git/g=
regkh/usb.git
+AD4- usb-testing
+AD4- +AD4- +AD4- head:   ac6a205c5bef39d65ecd9f5dd2c1d75652c35405
+AD4- +AD4- +AD4- commit: 70d66b8e47e6fa031f541291e9dd3d7f0c44b41e +AFs-17/=
35+AF0-
+AD4- +AD4- +AD4- usb-storage: Optimize scan delay more precisely
+AD4- +AD4-
+AD4- Norihiko, another possibility is to use ordinary integers but have us=
ers add an
+AD4- +ACI-m+ACI- or +ACI-ms+ACI- suffix when they want the value to be int=
erpreted in milliseconds.
+AD4- So +ACI-5+ACI- means 5 seconds, but +ACI-500ms+ACI- means
+AD4- 500 milliseconds.

Greg, I'm sorry for my problem.
Alan, thank you for your proposal.
I'll change the code based on it although I'm not sure if it's acceptable o=
r not.
I'll use only suffix as +ACI-ms+ACI- so that it could be also shown as 'del=
ay+AF8-use' with unique suffix.
