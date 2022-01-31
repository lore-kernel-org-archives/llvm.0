Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90070.outbound.protection.outlook.com [40.107.9.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB212CA2
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 06:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4pP0KyuCl/7Ni06TNv+jH2L0SQalIuPLeqrX7SB2KN7RbmD0tRXLP60iJCpYpAmI6dEMbBicJwUgSn1AehosvpfZZ++g2qVRsdDmb1fVopDfYbQXax/QnrUVuEf9kUJLGzjohlcCu8XGljpZLYfF6bNMZ6mGsA4dBm2vyIii/EMdwBXgQc8heE9NQe68Reh9BRPY5LSghqucYJnQYuOCH12jQUd9u7ogWRWKIRLZ82z6P3WNAd6z5x7yI+JAg3lgEtRzNKndAuisoiLohnOoGtHNIRtVbb4BENpEJ3D4UJhp5UGts/W3qNENQAFt7dhFH+5thxQ0puvx3tDl+1Scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ6NYJwIBZLAOVI1ebnBYXe+QuAkaYsqz4asZcT8Ebk=;
 b=DeCZQBPoCGmS7Vm1xMU0K54Rq63mluHqs05PFV20MTLJjBmbZEAaoxerVaE24fcYriidIRDUm3WJVrnTntUUfiNLP5+Vm86kNQ2jTHfDVw07K+J8QvKMjO9NiExpbr+gDec1d+W543s8TKszxtkZjvI8KuVEFSlvzTST2/jSgqn0YfTRLMEedz+aYjAX+xR/Nj7w+WtKBDlYLlBwczbfifPGMrHFOLUtwdl8PXXTTzi9IZAsyE2CVT/733EFmamiCGYcgvGraj9wzyWOXMbJbhBYShseqdO276v2coKa5gS3njuYUWlmL9cSexmazEa78IFJuyr+IS3ahWRv4J/sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4307.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 06:30:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Mon, 31 Jan 2022
 06:30:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a
 single directory
Thread-Topic: [PATCH v4 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a
 single directory
Thread-Index: AQHYDuQyiYCJuxHqMUuJ3zj5ZmrJ7ax8l2GAgAAi/YA=
Date: Mon, 31 Jan 2022 06:30:45 +0000
Message-ID: <3dbc7151-cabf-53f0-84a8-4d450cfbe024@csgroup.eu>
References:
 <4dbe05cc130f6a0858d09ac72e436c373cb08b70.1642782130.git.christophe.leroy@csgroup.eu>
 <202201311250.d9Np2olE-lkp@intel.com>
In-Reply-To: <202201311250.d9Np2olE-lkp@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48da796d-5f3b-4049-989e-08d9e48336a5
x-ms-traffictypediagnostic: MR1P264MB4307:EE_
x-microsoft-antispam-prvs:
 <MR1P264MB4307197253328898C03D445CED259@MR1P264MB4307.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cMpemQbC2bVrRPYM+a1lVh/c+B95WiyqBEhyo3G4MKDA+5RwTyvpbLvCstvbfVZtPfHVYTimOj0QAiGBSN3xrIQZjcGx9hCfX7/0GXClO18CQ/QfrhEJEC01ozPXG7gBtXPkh2Jqe0VxY8Jl2Qm/xF+SY0B1BGHxZOAqNlAupEVSFs8+9ajHWyU8u3dSQ1BdE0DLXgZr9WYFlQLTtuGIxRWxe/l+tnRtBEq5N1QGJlgzyw5oGVen/P8kBA8s50RX1FWXFnb6HZ6QLUNef9q2D9tqKvXFfVIlfTaZN8/PCqRAmdU25zwTM+S9ZXHlVqK4MzFb7rYWrUjqG0Zgmas5tq546ZM39DopnI9chCrAN24m47BSeR/mU5vwO41gl7Czn5y8RqS8U5gUkWBHx9sL3QJJ89BmrIPEDqODMzt4EUDyaUKbJoHYu1CxDIye/Fs4VksLnWrWHv1U9h8Igpg9H0UepO/M/+Fl6sqy4QlUV0C4gkLgUZNP0JXw+3DRB/mEFx/aM5C2cD3FJbvmlZE7y6gKO8z/BpyrisMMBrgr9LiUnX+Bgz7+YybtdpTLYz9F0tU7El2NQzAEukBWPkZ6aE1dOz6orIIjXhnIbXdKvJdlYHX6gevkL927nG/ZwLN1cbnNFciUc93UhT8EKwdcAln4DFQVMjLjeWODcmLjyjs+Avv3a3UN2LbmWKCOGjfp28Wd2U+Fv85+b6RwmGNw6iPJsFib6YZEZVTgllwcOTiQ1lHaMjb9tPoQAKJYpY1qbQLQGch77v8HYMvxi2LY6LLc8EfaWr3vhwLjkG1dMm+b3EUA+dYywknUFb+MSx5hVDxFoCJSHfHmSo+szQ8ePP382gqyv5PoD1VMWTgkUmAwBhKl1KyOP66nEPu440ghpk7seQF8aMqVVyas43pLow==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(66574015)(83380400001)(186003)(26005)(2616005)(44832011)(2906002)(38100700002)(31696002)(86362001)(38070700005)(5660300002)(4326008)(6506007)(71200400001)(76116006)(8936002)(31686004)(6486002)(508600001)(966005)(8676002)(6512007)(64756008)(36756003)(66446008)(6916009)(54906003)(66946007)(316002)(66556008)(66476007)(91956017)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3dOU1BVUkZmcEhMNk5pMU1CWUsveUVNU0paS1o2eENpbEtwSVlRZVZremht?=
 =?utf-8?B?ZGxuRStOSTVmNnR2VGVVYzJGOTBBdE5id1U4UEoxVXdIaDRkVGkzdjdtTW9t?=
 =?utf-8?B?YVpBZlZCcUN4RjFCT0d4SVlDSzVoNXc1aXE5NXl3SUp4SXo4eVZzL2VQNjEy?=
 =?utf-8?B?dW5zQmFWVktHYTAwaEg5c1dzM0QvMFZwQUtNTldpeDZGOGU4TDA1L2R3amdj?=
 =?utf-8?B?ZkZrcUQzU2lFSFJyRWxzei9WMDVzbXdNeTNxUmhVUVFzNGRZN2tOR3A1SVkx?=
 =?utf-8?B?Tjd1Z0oxaklMVkZ1WlB4TjZRS1hYZ2w2MUtWQ0ZMQ2p4MU42bERkeGNpdGJw?=
 =?utf-8?B?QVJCSmlNNnJtdnZvdGNQYWUxdUUvdlR1YXpUbnV6VEhGaUZ1YnFnMGlRYXd3?=
 =?utf-8?B?WkxPY3RwblBheXRHdUZJVUQzdmg2d1pEQ1AySkpYUmNSeXlrMVEvYjBldW5L?=
 =?utf-8?B?cktpL0NjUS9yMFl2TjJKOXpiWFcrOE1vSmZ1ZTduOFoxUlh1Y2MyM3U3Unpw?=
 =?utf-8?B?cFUxUmw3c0Fkbis4NEY3OW9vOE1Ldm5VelZiVEROUUgvVFN6WkFBUWlQMjZh?=
 =?utf-8?B?L2UwYlI2OVVZcERDWFFueUUrd2thSGw3MzMrVmhIT2V4SFpYZURSVWpqbFA5?=
 =?utf-8?B?cTkybWR1Q2NtM0dEbENDVzJzUEx1WitPOUkxbEx0U3V0ZzV4QzdUei8zRnlM?=
 =?utf-8?B?dnltS3FNMmdaZ2kyQ3dPa3ZkRkJxWlhKN2hDSSttSFVGOXZmYmpZMVhnME54?=
 =?utf-8?B?Mk1uSGhpVjJDSGdjMlFHbWFBbG82Sm4vallZMzNrRGdhVXRFT0FaektxR2V2?=
 =?utf-8?B?NWJZUWxjNTkvN2JvQ3RIZTRRNlhpVVkrQ1JnWnVsVE1SRlZBM28renVHdlRh?=
 =?utf-8?B?K3Nza2tGanZsRDBFS1J6Qm9LeVQvZ1piYkY2OVVrSVJkQ2hvQ0NwY2IvZ1Zj?=
 =?utf-8?B?NjdMaXU2WmRoWXdyeVJ1U2FabTRhK1dVVVZZdDRIeXlJclF0NWRZclBqdHda?=
 =?utf-8?B?VlMxSk45eEc4VkFKQ09UcVh4QVFoQktWNnhCUDBBMVJqL0tJZSs0SStuajNB?=
 =?utf-8?B?bk02eTlnZDlmaVdDYjdKRWxNOEw4RFk5eVZCR2FSZE9DKzJWdEZEaCtBa3FH?=
 =?utf-8?B?akowM2dKbk94c0ZIVFBhVFRmNGZMTlhyK3hsdE5EcXVoNk0ybHJzWHJBOXlG?=
 =?utf-8?B?K1Nqd2c5ZFIxdUd2WTVFdDZWVE9WbDZqWm5LSTF2cnl5SjFkQ2I4dzd0NERY?=
 =?utf-8?B?Z25pUVIrTEg2VnJScktLL0VkbkZ0WVhSZ3k5WWw2ZWpXRDhaQVZoV3lwdlhj?=
 =?utf-8?B?UDgzUnE4c1I3ZllyQ1diQzdoU1Vya09PeEoxS2JjRDlQN3BzNXU5M2pJUThx?=
 =?utf-8?B?a09YL2c3ZG5vU1VDY2dUSi9HM2xlYkpSM294UlJyY2pub2xKZXBaTVN3ejNG?=
 =?utf-8?B?Tm5pLzNHY0V5OFFHTzk0VGpHcGJYQWIwa1lLQ28xTTBKVmJJaExhMGg2YTdD?=
 =?utf-8?B?UUZBanB5WVpSeEpSSVQ3OWxiQ0pyb2wycHg5SzFCdFVCQU43ZVpZeUFKSFdF?=
 =?utf-8?B?ZmIzRnJlQVpHdm5Xa0pZeHBUTzRPZXZtUW1DZnNZUjlXL2ZPVmN2bW1ESjdZ?=
 =?utf-8?B?RXNlS3JGVGQrWGtiVVV3VFJMS0kzd1JOYWwycThrSTkvQ29WRlM0UkFsOHl6?=
 =?utf-8?B?emloVGVWMDJpNllEcG1hQS9ycFRpZ3kwMzliY2hZRnpkSmlVQVNrMmovaG95?=
 =?utf-8?B?UFdtZlZDL2tlUW8rL01HRmNCbEtwZktuYk5qc0RENUNFZUtiYjJFYlhzZXpI?=
 =?utf-8?B?TzNiblhFcnhUS2RJUkQ3TUJnV1BtNDgrWFp3SWlqaDlyTTJnUHlLdDJwYnZU?=
 =?utf-8?B?dVFKVm1PR0ZVcDNIY0d5MU1vOTdTYndBVjJiL2d3SHJVWFJwVmtkSFBzUGFv?=
 =?utf-8?B?L0NYejJaRC9ndFNUWnZMT0ZDSEUxNGRYMVREMFdCLzBGNGVadzdXRjlDQzJt?=
 =?utf-8?B?YTh1ODBSeTR4NnBGc1NGNi8yTE5WL1ZQRThiQTRUMThNRWR2b3hkQm1mSGJB?=
 =?utf-8?B?RDFrM0FYajdhQjVNZkxpNXRaWmR4YVQ4bzFKOWVjUVNVRVdyeVlBZXIrUUVN?=
 =?utf-8?B?bE0yZXhCMGlzNDFtRHRUM3RKTjZkc084UXpnTVJhY0ZBZ2VjZFJTNndvUkhz?=
 =?utf-8?B?MjI4eTdPK2YrWFBGdDF4VSswbTV6T0dLSnN0UVh0NnNnUWh1UDFvUHc5UHZT?=
 =?utf-8?Q?qBiybfcaUeeYmDUcwTcKI+1U4yQJ+cyXxZ6+g35NMY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79475766373F964383286A73ED533A8D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48da796d-5f3b-4049-989e-08d9e48336a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 06:30:45.7681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0QYICC+s3DLYSsZ/T9K7BING7D9kVCUH4V2u2fjBqPcKGbiXgJfmskjUcPdg4LYG17Wu6kr4JnWNW0Rtak1RXONLqCM6aMJgBclFsKsrLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4307

DQoNCkxlIDMxLzAxLzIwMjIgw6AgMDU6MjUsIGtlcm5lbCB0ZXN0IHJvYm90IGEgw6ljcml0wqA6
DQo+IEhpIENocmlzdG9waGUsDQo+IA0KPiBJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNvbWV0aGlu
ZyB0byBpbXByb3ZlOg0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiBwb3dlcnBjL25l
eHRdDQo+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gdjUuMTctcmMyIG5leHQtMjAyMjAxMjhd
DQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5k
bHkgZHJvcCB1cyBhIG5vdGUuDQo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dl
c3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4NCj4gaHR0cHM6Ly9naXQtc2NtLmNv
bS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2hdDQo+IA0KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvQ2hyaXN0b3BoZS1MZXJveS9wb3dlcnBjLXZkc28tYXVn
bWVudC1WRFNPMzItZnVuY3Rpb25zLXRvLXN1cHBvcnQtNjQtYml0cy1idWlsZC8yMDIyMDEyMi0w
MDMxMTENCj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9wb3dlcnBjL2xpbnV4LmdpdCBuZXh0DQo+IGNvbmZpZzogcG93ZXJwYy1taWNyb3dh
dHRfZGVmY29uZmlnIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAy
MjAxMzEvMjAyMjAxMzExMjUwLmQ5TnAyb2xFLWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiBjb21w
aWxlcjogY2xhbmcgdmVyc2lvbiAxNC4wLjAgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0t
cHJvamVjdCBmMWMxOGFjYjA3YWE0MGY0MmI4N2I3MDQ2MmE2ZDFhYjc3YTQ4MjVjKQ0KPiByZXBy
b2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOg0KPiAgICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3
LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5j
cm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzDQo+ICAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2Uu
Y3Jvc3MNCj4gICAgICAgICAgIyBpbnN0YWxsIHBvd2VycGMgY3Jvc3MgY29tcGlsaW5nIHRvb2wg
Zm9yIGNsYW5nIGJ1aWxkDQo+ICAgICAgICAgICMgYXB0LWdldCBpbnN0YWxsIGJpbnV0aWxzLXBv
d2VycGMtbGludXgtZ251DQo+ICAgICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kv
bGludXgvY29tbWl0LzZhYzZjMTFjMGE1NmMyOWNjMzkzNWZiOWE2MzNiYWQ0ZTVkNTUyYjcNCj4g
ICAgICAgICAgZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4DQo+ICAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2aWV3
IENocmlzdG9waGUtTGVyb3kvcG93ZXJwYy12ZHNvLWF1Z21lbnQtVkRTTzMyLWZ1bmN0aW9ucy10
by1zdXBwb3J0LTY0LWJpdHMtYnVpbGQvMjAyMjAxMjItMDAzMTExDQo+ICAgICAgICAgIGdpdCBj
aGVja291dCA2YWM2YzExYzBhNTZjMjljYzM5MzVmYjlhNjMzYmFkNGU1ZDU1MmI3DQo+ICAgICAg
ICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUgdG8gbGludXggYnVpbGQgdHJlZQ0KPiAgICAgICAg
ICBta2RpciBidWlsZF9kaXINCj4gICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01F
LzBkYXkgQ09NUElMRVI9Y2xhbmcgbWFrZS5jcm9zcyBXPTEgTz1idWlsZF9kaXIgQVJDSD1wb3dl
cnBjIHByZXBhcmUNCj4gDQo+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxv
d2luZyB0YWcgYXMgYXBwcm9wcmlhdGUNCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPg0KPiANCj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOg0KPiANCj4+PiBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vZ2V0dGltZW9mZGF5LlM6NzU6
ODogZXJyb3I6IHVuc3VwcG9ydGVkIGRpcmVjdGl2ZSAnLnN0YWJzJw0KPiAgICAgLnN0YWJzICJf
cmVzdGdwcl8zMV94OkYtMSIsMzYsMCwwLF9yZXN0Z3ByXzMxX3g7IC5nbG9ibCBfcmVzdGdwcl8z
MV94OyBfcmVzdGdwcl8zMV94Og0KPiAgICAgICAgICAgIF4NCj4gICAgIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvdmRzby9nZXR0aW1lb2ZkYXkuUzo3Njo4OiBlcnJvcjogdW5zdXBwb3J0ZWQgZGlyZWN0
aXZlICcuc3RhYnMnDQo+ICAgICAuc3RhYnMgIl9yZXN0MzJncHJfMzFfeDpGLTEiLDM2LDAsMCxf
cmVzdDMyZ3ByXzMxX3g7IC5nbG9ibCBfcmVzdDMyZ3ByXzMxX3g7IF9yZXN0MzJncHJfMzFfeDoN
Cj4gICAgICAgICAgICBeDQo+ICAgICBtYWtlWzJdOiAqKiogW2FyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzby9NYWtlZmlsZTo3MTogYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldHRpbWVvZmRheS0z
Mi5vXSBFcnJvciAxDQo+ICAgICBtYWtlWzJdOiBUYXJnZXQgJ2luY2x1ZGUvZ2VuZXJhdGVkL3Zk
c28zMi1vZmZzZXRzLmgnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ICAgICBtYWtl
WzFdOiAqKiogW2FyY2gvcG93ZXJwYy9NYWtlZmlsZTo0MjM6IHZkc29fcHJlcGFyZV0gRXJyb3Ig
Mg0KPiAgICAgbWFrZVsxXTogVGFyZ2V0ICdwcmVwYXJlJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2Yg
ZXJyb3JzLg0KPiAgICAgbWFrZTogKioqIFtNYWtlZmlsZToyMTk6IF9fc3ViLW1ha2VdIEVycm9y
IDINCj4gICAgIG1ha2U6IFRhcmdldCAncHJlcGFyZScgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVy
cm9ycy4NCg0KDQpBIHBhdGNoIGlzIGFscmVhZHkgYXZhaWxhYmxlIGF0IA0KaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC82ODkzMmVjMmJhNmI4
NjhkMzUwMDZiOTZlOTBmMDg5MGYzZGEzYzA1LjE2MzgyNzM4NjguZ2l0LmNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldS8NCg0KQ2hyaXN0b3BoZQ==
