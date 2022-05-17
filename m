Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB010F8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 04:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1652761078; x=1653365878;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PuV3usiLssSybTu4j9FRTZvEKND67MRdqXoM2qs8+tc=;
  b=Ckd/peOIwO/9OHi657bsuLapwDS8hjE7SJMrVlX6aZaDbGTN7jd9zsnZ
   lAO9Hp4EXFN3u0g10vAkOlibyW9EgjiP2NZVpL4+KEgfLtFhaW5lzZA8v
   dXI/fQWQWWoTWxF3RCS7yKmY9glbjafVprj8LhpYVLMrVZNi7oo8JzBg3
   E=;
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 04:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9wE5rsqZqY3IYCFOE+dsJ6doWI4dZrXMLs4/pHZjxHxORIP2zROLTUSKIc3IydTjO8zVzEWs5TQ4pepQDSzVGeWolsggOAAPGX4U3z9sFfIxTABbDpxRqQFo1uV8fA95zMTNuaxOrwO5mGb+iBUNq18Y33MEKtH+Vgfi3+UFDq1gwwgonE9mti4Ogk4d+BmIBJ5vdVi4yYOyE34zav6CditSiclU6ZfIZNx3M2a5Ft9JxGE3jWqzF3CbMm3vfsbXtGOb40s7NsHvGd/TdpTxdE8FOH6EdGPCxcdGpiXziNqw2IiVdQOvs4SwcDu5iiWulfcPUW1zrEecD84iaQ+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuV3usiLssSybTu4j9FRTZvEKND67MRdqXoM2qs8+tc=;
 b=GXlyPPF6ukHPEZtFs7Bl6LhRrzkLnd5BhJMeZYdX1qjQW88U58QMXbnbl7dNyeESR7M14qLWrsh0xy33pmk0k+WgKi3KM+4bMAZmneLKAC5qU2+KBhnuowyMPoO7rk8WB0ZLdGqBq9a2yLtsPvd8r/I1RL6eIfMoWcd1XlAewkBRWjwjKTAJSjU6KlGPQPb87/qsjUyQBui+GKWGWxB/FEXgP/HXKAxMzLwhhMjL5l8sWapYvzRELX3P0YWhzZx1GiazK4h23C1XxsrwtG5Cs0EOtOgkswUm7lp1JrGJAofzoNxzns7bapSB8BP9CQdxa0NayLxXBZoiqQyo4id0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by CH2PR02MB6934.namprd02.prod.outlook.com (2603:10b6:610:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 04:16:45 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 04:16:45 +0000
From: Brian Cain <bcain@quicinc.com>
To: Nathan Chancellor <nathan@kernel.org>, Matthew Wilcox
	<willy@infradead.org>
CC: kernel test robot <lkp@intel.com>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, Sid Manning
	<sidneym@quicinc.com>
Subject: RE: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning: stack
 frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Thread-Topic: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Thread-Index: AQHYZ92anN/kImR+tUuF+dxlHp1BCK0ieL4g
Date: Tue, 17 May 2022 04:16:45 +0000
Message-ID:
 <SN6PR02MB4205A0695B4B2543A9B981FCB8CE9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
 <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
In-Reply-To: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 968fe002-f2a5-4270-8116-08da37bc0dd1
x-ms-traffictypediagnostic: CH2PR02MB6934:EE_
x-microsoft-antispam-prvs:
 <CH2PR02MB69346A0FB06A7998020262D0B8CE9@CH2PR02MB6934.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xpzDntPLDFjx1xgjtS9SO8mLafUJUIRdD01wDg1/dqgKBP8EhtqAa93CbW48cO15CIiRefVLFzHzwXmXqUPHinGYwMAujTnmmL2boVCFAUqZOTgjnAIKyY2akoNMZT9nUKF1T78KeOUpU4TfZmws8TdJ9CKb7yeFJ1N++XGZPu+Wv0NnvphDbX8jSfvC0R0qhPjl/WbiWESZuImGW3BKwT6SfTO5Pw8CxcOr7QOJwemdmp1zj/26v0+Oxn+bWGowpAWTsYCLk5qFcZ+KiFqbaKG52GD2kdr3J7esK8xUWJyOhh0767qE+rUuNog9BV0hosTFZQjny67RHwJAJansc+/+vbNErz0te+qSQz/dvVNKXI/XsAA4eZIfX2Iugha3JujgY494CPlomU7JfCOI4okoy17ko3fOY079SSjwJ7FiuxP4qJUYdHe92ODEkpjHCcDjQ+ZWJUonNpow5ar1+XgjoWWOnNgvZgHaXVugwiXxmB+zoLYCwyHZCr0tiFjdTPSjJ7yHi2K1fCtho8bBZOzkCP7nru01qQXbt40Sz3iSGHLQPd8aiBgquuf7HEqACPGGsFHO3q+GNMmt+X+lx8aw6k+NnO3npA2HMp6cJswkBOpzzq/WoX+aX2iofK9K7TeiCURhpWSYcEyHc8Cm2mzUu95/le1GSoomxbq14l29xyo/Y7aGeyWXJbiu1OrAgzIgGXfqsgi/KICKkzqrxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4205.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(508600001)(5660300002)(4744005)(4326008)(8936002)(66446008)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(33656002)(86362001)(71200400001)(6506007)(26005)(55016003)(107886003)(54906003)(38100700002)(9686003)(2906002)(122000001)(38070700005)(83380400001)(186003)(110136005)(316002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXFzdXEyUXFuN0hJU1VDU2tDRGU5MU4wSnNhWjRlUGw5YlM3R3FoeTFKbkNP?=
 =?utf-8?B?SkhRUG94WEtPN2gvS1RxR3RucGRCOFo3QXA5UnRqSkMwcjJMbFZBZDVzZDFQ?=
 =?utf-8?B?ZXg4ZmRwamdORTBrVitqVk14bUlSWkUrMlVScHgzVGxpNjVtL2RVVnAraVhX?=
 =?utf-8?B?aCs4SFl1N3hQYm03RUlING1GTXpGUTBtblJtY3ViQjlZeU01TENsWWVHdThs?=
 =?utf-8?B?NGt2RXBIamw0Q2oyTldXNTB3NUZNdi9FNG13Yk04L2ZaNDJUK0FXNHVpQk9H?=
 =?utf-8?B?ZnNyWm5kZ0FFWjlzdVBWSGRWL1BOSXV4ZWZMOUtHSlVxUDBGMllYeUtuRTBW?=
 =?utf-8?B?elZkQ29rRlhsOHpVbnRXdUYzTGoyVU5WVjdrUXBRT1VOM1lQSEM3ZDZWNUZ6?=
 =?utf-8?B?R3grN1NOamc4eGpUSUlaeXI5bVhkcEFxai82Sm1LeXN3bWE1WkF5d2pnblZD?=
 =?utf-8?B?emRMZGtrd0hqZ25FcUJwOUg2VGxYcU5Kd3lWcDlFN2FUai9LMDZUa1FUMjZ2?=
 =?utf-8?B?dVJMVzU1eUxDM3FJdE5LWTNMUEhzZ0Uwc2EwM05FT3dmZy9TeG1heVNwS2I1?=
 =?utf-8?B?VFhCellpSDhZWXFNY1FlYTZ4VTRNRXZrL0ZFRDF4TXFyTWs2WVpwZ3NxMWZX?=
 =?utf-8?B?MjJLTkg3bWNoTUV3QUlPVGluYTFMK2lDZURUbGtuNi8wclgzN01oMlZXM3c3?=
 =?utf-8?B?NVBuNEZHUDgyT3hvYVN0R0FNY1VnVzdqaERSOERzbFA5emxGdHBxSk1mNVJv?=
 =?utf-8?B?RW9xMkZzd1ZrRldIak5CSmNoSmlZeGJoclhjSmlmRU5yWUY0ZDhwU0FwMkQ4?=
 =?utf-8?B?dGQ0N09RWkxyS3Fmby9ONUhBOFkxYTNRWFd1aWh5TGtLTGMrZUpVMHBqSXNE?=
 =?utf-8?B?V1VnNXhKQysyT2tFblVObU1yYXN3cWV4Y3hLRnV2SjNuL3ZmbzVXZS9zSFlV?=
 =?utf-8?B?b1J0MmV6VE52VDFDYWRjbUJ2ZWhyNTkvVnRvUXRLOHZacUVrbGpsVzhOWTQ0?=
 =?utf-8?B?NUF6dCtkZ2tyUUlxQkJiaEJtQldta3NkV2tUOG1tK2VSZnpVQlNrdFhNUDFo?=
 =?utf-8?B?T2RaY3drZzFrN0dHMnRiQWlKY1pyM3VjVHYrLzBVeFNWSGREbW4yUWZteC8r?=
 =?utf-8?B?R1BtQXNTdFhwcldlTFFZS01GV1RObnU5ZnpoY1I0ekprWlVTKzIwRDNnMXdN?=
 =?utf-8?B?aHlJR2ZiUmRtVVRCSTZ2ZGlDQjMyeFNnZFJjT3B0M3B1NFg5Sjl2Q1RJZjJY?=
 =?utf-8?B?ZjhHcWhJU1VLbjlKM0xxWmdqeDFSeU5mdUJ3Tlo0ckZETVc1cU43dXFyeW85?=
 =?utf-8?B?UEpudUNPalZHZnRwZjN1MjM4Wm1uMzVhVXpVQnlNdVlYNXJsR1lITEtzN2dQ?=
 =?utf-8?B?SGVjYkpWc0xNR0FTbWZBTEdjWkFHR3R3OE1jNDdvR3Nld1lldzJSVjEyclBN?=
 =?utf-8?B?dnJpa1oyRlV1TlptbHdHaXVxcVRKbjROb2pTRDZGNk1hTDZlZ1B6M05Bc2JH?=
 =?utf-8?B?TGRrNTh0ZU9vaUs0Y3U2cCthQk1kQjRFRlVEd1hOTzBUc0RqNXFLQVlkalVk?=
 =?utf-8?B?OVpKdVdFWFdHWGtkNTZKb256WkhiZ055MkxqNmRRZ21RZFZDY2xQUnk3bXpY?=
 =?utf-8?B?N3dXRlVFaHdSVDROYjhPTk5CV0V1d2NGT1NSbWZYSDRjb1E1YUlCem82djB4?=
 =?utf-8?B?OWlnWlZrU0pCUE1PbjJBQkI3MHdpSXpjc0ZzcGJLRnlZTmJsKzV4Vnd2M1RV?=
 =?utf-8?B?UTJ6d1ZCcjhRcXkwWmNQVE5vaU1WNWNhd2JaYU42NmtjUFc5YVZkN3EzMWQy?=
 =?utf-8?B?dXJvdDNidllxNzZoQ20vY3UyYmI4ZEQwR3haQnc4Tk5Ha1ZkaVoxblN5RThV?=
 =?utf-8?B?UUd3MEc4d0VPT1hiVVNDaXNIT1N4cGZOZUc2eTZvZTN6dHFTNk1HSEx2d21J?=
 =?utf-8?B?MzJaeXJMa1gzbFZNNkhXcnNXaWNUUTcrazAxNUtGSGUxUHU5MFB3ZXMzUUlJ?=
 =?utf-8?B?ZVcvZEcrbDJCVWhJUWY5OWRMNXNjcnBDakl2OTRnLzg3ZXJ3cGh5dzNYaERm?=
 =?utf-8?B?dDV3SGxZYjh6dlFXSldRVnh3eTFJS3Qza1NPRzYxNnIvU1pwMzI4MUZtVHZn?=
 =?utf-8?B?dFBlNHpST3F1ZkcycGZhTWMwTjFaU1ViS25NcXM0WTN2T0NvTjc2NFU1UUx5?=
 =?utf-8?B?WHh1L2djYmlUTUJLUVAxK0QrS2NaUWxRUUFrOTR0RkJ4Z3NrT2RqRm1Yai9a?=
 =?utf-8?B?TDI3Snp0R1hXdDdQbXdCZWlZaWJZUzlLTXhoYnhxc3NCdWozMUxUcHM0TGFF?=
 =?utf-8?B?OXJncXZmVWJ6b1hja2FHZlE3NG1IU0cwMER6VzVnemNJckdjdkpLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968fe002-f2a5-4270-8116-08da37bc0dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 04:16:45.1403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HC3MKeb6lOxESXSKorpTUWgNZqhBEhVjK8Hfp0leAXAqe5slnpGer/9lOzjUWSSBSbETLGW0tAT0yx4il40uHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6934

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0aGFuQGtlcm5lbC5vcmc+DQouLi4NCj4gQXMgYSBzaWRlIG5vdGUuLi4gQnJpYW4sIGlzIHRo
ZXJlIGFueSByZWFzb24gZm9yIDI1NksgcGFnZXMgdG8gZXhpc3QgZm9yDQo+IEhleGFnb24/IFRo
aXMgaGFzIGJlZW4gYW4gb3B0aW9uIHNpbmNlIEhleGFnb24ncyBpbnRyb2R1Y3Rpb24gYnV0IGlz
IGl0DQo+IGFjdHVhbGx5IHVzZWQ/IDRLIHBhZ2VzIGlzIHRoZSBkZWZhdWx0IGFuZCB0aGUgaGVs
cCB0ZXh0IHNheXMgInVzZSB3aXRoDQo+IGNhdXRpb24iLiBQZXJoYXBzIHRoZSBjaG9pY2Ugc2hv
dWxkIGJlIHR1cm5lZCBvZmYgYWx0b2dldGhlciBmb3INCj4gQ09ORklHX0NPTVBJTEVfVEVTVCBz
byB0aGF0IHdlIGNhbm5vdCBzZWxlY3QgdGhpcyBjb25maWd1cmF0aW9uIGFuZA0KPiBib3RoZXIg
ZGV2ZWxvcGVycyB3aXRoIHRoZXNlIHJlcG9ydHMuDQoNCkl0J3Mgbm90IHRoZSBtb3N0IGNvbW1v
bmx5IHVzZWQgcGFnZSBzaXplLCB5ZWFoLiAgT2ssIHdlIHdpbGwgZGlzYWJsZSBpdCBmb3IgQ09O
RklHX0NPTVBJTEVfVEVTVC4NCg0KLUJyaWFuDQo=
