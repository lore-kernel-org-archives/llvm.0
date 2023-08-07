Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C22106;
	Mon,  7 Aug 2023 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691391125; x=1722927125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/SbtkK/Zdd8CNXFI3t4T0sCyttY0y1ei9eCa6AHB+GM=;
  b=l01F0D0PHCRfCEPut4K37tAdqxH6mrGLfmJ47GcpEgdlbBI9A+oe1Qc6
   Mq5LZKA69+/7/Mo1qWpcdfrL8oMUDQDLQ043PF6FyWM7/95V5AUaFXLzB
   9T+cKAlECjBokHEJjQN9+qe4J8FTItjki45CYFnDpSlaWaSag6wOXXCBf
   NcJCHUy0C/zI0QpWiLYe+zUZGy01DlIcyddfENd8GgtWQqepXp6lGruiZ
   BELVB1tjC7yrUPlHzYZzlFG5Tvn/wWG+QUlIiyaBxOjaupj+HjFmovTeS
   J2Akxin9cUeCB25118D911KgFizT1GHhyJ08PN1yr8Tvc3RVDqmfTxF9U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436799628"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="436799628"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 23:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="733986556"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="733986556"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2023 23:52:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 23:52:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 23:52:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 23:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5HUK+b6RBGDaJSiw+nuQy2vcHVTcYOHA4Nkf9w/wzdWoDZjrJQnY1a/w+OLxxEEYyBKVRXUngAodE2dqFZrkKBL0cmw7UwrxG3ndTZYUyJttqKTX+mAUkE8vGrag0OHQX8K/LLKLoCaheYP85aQPWEnu2WOgdWR8dvqV1ZICFNOuoOHoq3xP3mMVw4Dy4khe8pYKQwfn49r8bzh9lbHMCnc4s5jVwU7D2ZmKWDVKkDzPuP3xXr9l36elgtMKljRy4dKJ8imMED10U1yODq8XXnK9D9snIBl+fu1O3g4yGlxOqx9KoMjVx+3klMCMYpK3PPIvtyhCDSwj52VJjmBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SbtkK/Zdd8CNXFI3t4T0sCyttY0y1ei9eCa6AHB+GM=;
 b=HpQ911olvn5MiswlpnTqa3e0f2ABY+tCdR93SvmgL7ciP4aGt4o6ZDeZUZjE0tWiAl8D/STM3mSCEiNUtDB0qR5TGBMany5wGM1eRwOD37fBlcYdm4nIAA/Y8cbnQf6+1hMqQAg1xfCWSjAgNdh3o4t9k6aOjy9Z57MnEY0TNiauIgLV6lOdGBew2hT37T50GUoeCz/411TYbKTi1YOMD/o1GpotX2kZNl+7CEN2LaQqISTgNeMxPCqyFt2dH3mSNuIrZ17cqH1UpOPE9XPh5xEz33g8EaHYIOVG2mLgangBKf+LhqgFh4IgLCzpHsV8L+QVlb326FCe2GbEaXSv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 06:52:00 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 06:52:00 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>, lkp <lkp@intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>, "maskray@google.com"
	<maskray@google.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"natechancellor@gmail.com" <natechancellor@gmail.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20: error:
 invalid use of a cast in a inline asm context requiring an lvalue: remove the
 cast or build with -fheinous-gnu-extensions
Thread-Topic: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20:
 error: invalid use of a cast in a inline asm context requiring an lvalue:
 remove the cast or build with -fheinous-gnu-extensions
Thread-Index: AQHZxlJLdgAv5bMx5EWWsfqxNIVrJ6/aRpqAgAABJACABCHXgA==
Date: Mon, 7 Aug 2023 06:52:00 +0000
Message-ID: <2a1061fb250905545c4a514b5328e3d36ab6f8f7.camel@intel.com>
References: <202308040553.nMR9oB8v-lkp@intel.com>
	 <20230804153749.GA2148888@dev-arch.thelio-3990X>
	 <CAKwvOdk7VrGMy95heyyLhdhgNWb1LyV48WmzvhpNUrqaYBin_A@mail.gmail.com>
In-Reply-To: <CAKwvOdk7VrGMy95heyyLhdhgNWb1LyV48WmzvhpNUrqaYBin_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ1PR11MB6105:EE_
x-ms-office365-filtering-correlation-id: 5dfca75b-a370-4554-aa75-08db9712ccc9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MZEbT42Cepsct2EtQmG4a1IMQ7zgwPmdizqkdluhk3yYmeaubhmQKML9RjwcNC2SQ9Ue8x4w0JeJY2zTklPijkZCsQSQX4/3FiMPUj8fcvbO6X8cIQ667x5sydbEjhmTyiEzyIKDvBU8XscIn5ezn0Yf5yppqtsRiief+aZLEbZbyZbKdUoiIF+3EOX0xWRGveLBir3zdM7PYRS1ASbus4bBl1atj04RwMN3MtBdRCHydsnADELUK9nlWdAJpjRDzDqkrGVbt8YCYAokv4trhVD+Z38i4v/FkCvF/LuG9Fk/sDdpE1E1J33tTj5E/1Nt1z1UP0ExHtgGKWnu2mf6iuiWi1rBpFrS5mzQ3ymY87QwECRw8i/oy76kscfC/tdQyMGBRw1f6Junjtp4TskHP9y/JuLbJU60klwTCgUwSuZHQ7DGNFYVKdnOvAlHq/4zxlYjWkCin7w2qjsMG8Xj/uChKo0FVeAAQsqwr6eP/MO8q6pRenAeH1qxA8UgHFNyd73rF6O+iJ7w1gH/RUbaHN+5tV/JIMb1WcXSSEh3Qm1bgwc1MxTcsXfhvOsErq/TM93exBrZ0QhulZkk5nPHxBLaQFOocQN4nFZGzwlarhMuSW8DtkhEP7mwXcU4v7I3AhUfYqyzFkxpgDaG5isrdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(1800799003)(186006)(451199021)(83380400001)(2616005)(54906003)(110136005)(2906002)(4326008)(6636002)(316002)(5660300002)(8936002)(38070700005)(8676002)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(91956017)(38100700002)(86362001)(966005)(6512007)(478600001)(82960400001)(122000001)(71200400001)(6486002)(41300700001)(36756003)(6506007)(26005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTJJNkFlRzVRazlOaVpRS0t6c2dWTzFyNkZFcWhsb3JTQ2NmT0wvUDgwS3J4?=
 =?utf-8?B?NUUwUGFYZjZHemhGZ3RLUERJR3ZGOVhLMWwwbWRVRHhEU21SalQzRlpxa1F6?=
 =?utf-8?B?MVN4dm8wUDlUeSttZGU4UVlXdmdxWnUvaE8waGhIclpGMkZUajFPNzFURy9y?=
 =?utf-8?B?clN0NG1QOGIwTTZnMERkMmtLVk9jUDJCamtzNEl4clJiZVNzYlEwQm5Md3dt?=
 =?utf-8?B?SHNXVzBrbGM5RjRCbWsvOFNaZDhscVlKSURPKzl6bndZemhBN1dyU1Z2bTJU?=
 =?utf-8?B?OFhib3RSNnBrZTdOcTdGSnVXQVpjdUNIM29MOHpJNG1qV3Iwb2ptTS9ONm1o?=
 =?utf-8?B?eWllaEU5ZjF2a2dibE1pTXlKWGNNbzROc21YVUlMZHFsOS8vVXpRcVFtaDZM?=
 =?utf-8?B?Z29BaDVmajllQ2xZRnNKNHFHa01XNm9NRy9scEdRY0t1Mlg3ZEVGTDhSa1hC?=
 =?utf-8?B?cURFdVFJdElFSlNFcG93UW1jdG42eUdQVXRrN3hyRFRyOTVkWVRwSzVsODhE?=
 =?utf-8?B?VWJ4cGhOOEdkcElBSkpWVW1LRFA3VThOdFU2eEtBMmdSVXdoalYrbHZoemJ1?=
 =?utf-8?B?b25maXFPcjltWVFXbmk3UmRyYUw1cVBxUnNGWG5HSE1FZmwrZlN0ZnYwTnpk?=
 =?utf-8?B?UG16aUR1bldudm5wSGo3VlRPaTN4MG5ZT1NhNm9OMENvRzlvMVhsMEEyL1Bu?=
 =?utf-8?B?YWFZSlgzMVJZVFVXNThmUENwK1pCNnJpcW43cGZETy9WbThRM2dHRzh5bjVD?=
 =?utf-8?B?eG91NFNVc3pUOXRyOE5QU1k2OWxsZyt2dXdhTTh2OGVxTFhhQk9OV1QyeWt1?=
 =?utf-8?B?NFd4ZU9jV0tQOS9pNExmdUtVUENrb09uUWZZQnN4dUJVTXEyZW5IQmZoUEFm?=
 =?utf-8?B?a0JheldTeFZvOHlXQmxoN3VudEMvcFlINWpmcVB0dVpLaG1lL3ZULzdWUFc5?=
 =?utf-8?B?Zm9qenFlRFE4bG13VVlLTHdkUU96aUR6NG5ZQW1TMjdybWNpQm1NQnlWTEhl?=
 =?utf-8?B?WmZkbGlGNFFzTW14ZU1jbTVsa081dkFWemRzZE9wMGNaZTQrYU1KYTczL2Nn?=
 =?utf-8?B?Q0RPbEgyaWJFdXpiZXY0bzAwZHdGMExCZjVyZ0taUGdtbFdZV1FObGdPdHNq?=
 =?utf-8?B?ZGhaTFZ4ZThjbVhIZVFhN2cvMk12RDJHaWRUTU80dUpKOW5iQ0J3Y2Yrcm5T?=
 =?utf-8?B?UkFRU0xuWWdxM0ZQelFtYnZwemVub0RrK0h3cHhwSTZQTnBOUkdvaXREcm41?=
 =?utf-8?B?cDBaYVgxRHRvcU1hSVFTM1pPNWlOMmFuT2pQMUx0NThpNldiN21ZMXNERW9q?=
 =?utf-8?B?YklyQUtEcmJNVmFpUE0zd0pGWU1ETzMrTmRRUnFTUzlUT0NxY2hNdXU0aHA0?=
 =?utf-8?B?L01wZXVZbUprbVo4dkpnU0lwQkVrcmc4Vk1SNkdYOThlSlpXQzl0ejBrMVB3?=
 =?utf-8?B?ckJCL1IxM2hFYmM3RWhkUFhUL0lmei9xR1dMc0RPc0FzelJuOWh2N0dYbDNo?=
 =?utf-8?B?a3hjN1BaYi9VcldOM3JiT0Y0S1Bqa1B6UE5QZ1YyT3R6bFhhUWdvVW55RS9P?=
 =?utf-8?B?Z3ZVbUZHb3JMYTZxcUl5VzdmdzN4a25WNkY1MHphYjhRYXNLakFFOXlpSFFu?=
 =?utf-8?B?QXBmOVk5Y1h3YXdRVklveTFXQ2JNeE1LcTAvY3VtbjZROUY5MjlRRnN5U3Rz?=
 =?utf-8?B?c2x5cHdkdjQzdEVQSnFkdEZCREIxakI0bE9PRllZR3lyb3VIemtPcVN4Mktu?=
 =?utf-8?B?a1ZDOWVFUjIyYzVGRXNjeSswT3Nid0ZJZFJweWpmRjhUNExWa3NsUlcyN3NM?=
 =?utf-8?B?VTA3L0pCN1ZKQVk2U3o1SDZJeFRlM3dhbmJDVVMwWGxlRXpKaVBSOXJpSWIr?=
 =?utf-8?B?QjN6NkxpUkVpbi9DUm9qTEdEZldCUEFqamhkeCt2ODNOTzIwT2RabDZTb1lP?=
 =?utf-8?B?QmRYQkswVVRyVDdWeGRDZ3A5QTY0U3h0YjJIbmJQUVcra28vR1NWVmJHMDcw?=
 =?utf-8?B?L2lvaUFVY0o5QmdFK0VudkJ0LzhvSEpRdUhyK01wV0xTTW5uQnlvV2Q1SFk5?=
 =?utf-8?B?aUlaZkNDa2lnVzUxenpvdVBCZ2xSeE1hNUFVQXdtMVl2ZG84TkxiTUFXdyt4?=
 =?utf-8?B?SDdkbEpqZm5jbzlaZkM5dDRpaVRCb1JNMHYrWXFxbnQ2TEtjd2hEY2pvbnc5?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E23815118D7D84693E340483FB17D0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfca75b-a370-4554-aa75-08db9712ccc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 06:52:00.3819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: la0HeczyrskH2GTc7Dy6JapFXJwzIbKt300C4LxMpPmGU3oEZz2y+SLMC8kcM/EksiEPY8f0GXqujtlrSqwLAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDIzLTA4LTA0IGF0IDA4OjQxIC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Og0KPiBPbiBGcmksIEF1ZyA0LCAyMDIzIGF0IDg6MzfigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0aGFuQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIEZyaSwgQXVnIDA0LCAy
MDIzIGF0IDA1OjMyOjU1QU0gKzA4MDAsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiA+ID4g
SGkgRmFuZ3J1aSwNCj4gPiA+IA0KPiA+ID4gRmlyc3QgYmFkIGNvbW1pdCAobWF5YmUgIT0gcm9v
dCBjYXVzZSk6DQo+ID4gPiANCj4gPiA+IHRyZWU6wqDCoA0KPiA+ID4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQN
Cj4gPiA+IMKgbGludXgtNC4xNC55DQo+ID4gPiBoZWFkOsKgwqAgNjBhNmUzMDQzY2M4YjkxOGM5
ODk3MDdhNWViYTVmZDY4MzBhMDhhNA0KPiA+ID4gY29tbWl0OiA3MTc0OWIxMTgxZWNhMTJhZjk2
NjU0YTc4MWNhYmNkMDU4YzM3YzhmIFs0NDU5Lzk5OTldDQo+ID4gPiBNYWtlZmlsZTogRml4IEdD
Q19UT09MQ0hBSU5fRElSIHByZWZpeCBmb3IgQ2xhbmcgY3Jvc3MNCj4gPiA+IGNvbXBpbGF0aW9u
DQo+ID4gPiBjb25maWc6IG1pcHMtcmFuZGNvbmZpZy1yMDM1LTIwMjMwNzMxDQo+ID4gPiAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMwODA0LzIwMjMwODA0MDU1
My5uTQ0KPiA+ID4gUjlvQjh2LWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiA+ID4gY29tcGlsZXI6
IGNsYW5nIHZlcnNpb24gMTcuMC4wDQo+ID4gPiAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2
bS1wcm9qZWN0LmdpdMKgNGE1YWMxNGVlOTY4ZmYwYWQ1ZDJjYzENCj4gPiA+IGZmYTAyOTkwNDhk
YjRjODhhKQ0KPiA+ID4gcmVwcm9kdWNlOg0KPiA+ID4gKGh0dHBzOi8vZG93bmxvYWQuMDEub3Jn
LzBkYXktY2kvYXJjaGl2ZS8yMDIzMDgwNC8yMDIzMDgwNDA1NTMubk0NCj4gPiA+IFI5b0I4di1s
a3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4gPiA+IA0KPiA+ID4gSWYgeW91IGZpeCB0aGUgaXNz
dWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYQ0KPiA+ID4gbmV3
IHZlcnNpb24gb2YNCj4gPiA+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9s
bG93aW5nIHRhZ3MNCj4gPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPg0KPiA+ID4gPiBDbG9zZXM6DQo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MDQwNTUzLm5NUjlvQjh2LWxrcEBpbnRlbC5jb20vDQo+
ID4gPiANCj4gPiA+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gPiA+
IA0KPiA+ID4gPiA+IGxpYi9tcGkvbXBpaC1kaXYuYzoxNDI6MjA6IGVycm9yOiBpbnZhbGlkIHVz
ZSBvZiBhIGNhc3QgaW4gYQ0KPiA+ID4gPiA+IGlubGluZSBhc20gY29udGV4dCByZXF1aXJpbmcg
YW4gbHZhbHVlOiByZW1vdmUgdGhlIGNhc3Qgb3INCj4gPiA+ID4gPiBidWlsZCB3aXRoIC1maGVp
bm91cy1nbnUtZXh0ZW5zaW9ucw0KPiA+ID4gwqDCoMKgwqAgMTQyIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bXVsX3BwbW0objEsDQo+ID4gPiBuMCwgZDAsIHEpOw0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiA+IH5+fn5+fn5+fn5+fn5+Xn5+
fn5+fn5+fg0KPiA+ID4gwqDCoCBsaWIvbXBpL2xvbmdsb25nLmg6NjUyOjIwOiBub3RlOiBleHBh
bmRlZCBmcm9tIG1hY3JvDQo+ID4gPiAndW11bF9wcG1tJw0KPiA+ID4gwqDCoMKgwqAgNjUyIHzC
oMKgwqDCoMKgwqDCoMKgIDogIj1sIiAoKFVTSXR5cGUpKHcwKSksIFwNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH5+fn5+fn5+fn5efn4N
Cj4gPiANCj4gPiBUaGlzIGlzIHRoZSBzYW1lIGFzIFsxXSBidXQgdGhlIHVwc3RyZWFtIHNvbHV0
aW9uIChiMGMwOTFhZTA0ZjYpDQo+ID4gY291bGQNCj4gPiBjYXVzZSBicmVha2FnZSBpbiA0LjE0
IGZvciBjb21waWxlcnMgb2xkZXIgdGhhbiBHQ0MgNC40OyA0LjE0DQo+ID4gY2xhaW1zIHRvDQo+
ID4gc3VwcG9ydCBHQ0MgMy4yIGFzIGEgbWluaW11bSB2ZXJzaW9uLiBBbiBhbHRlcm5hdGl2ZSBz
b2x1dGlvbiBpZiB3ZQ0KPiA+IGNhcmUNCj4gPiBhYm91dCBmaXhpbmcgdGhpcyBpc3N1ZSBpbiA0
LjE0IHdpdGhvdXQgYW55IHJlZ3Jlc3Npb24gcG9zc2libGl0eQ0KPiA+IHdvdWxkDQo+ID4gYmUg
c29tZXRoaW5nIGxpa2U6DQo+IA0KPiBJbiBvdXIgb3duIENJLCB3ZSBkb24ndCB0ZXN0IG1pcHMg
dW50aWwgNS40Lg0KPiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2NvbnRpbnVv
dXMtaW50ZWdyYXRpb24yL2Jsb2IvbWFpbi9nZW5lcmF0b3IueW1sI0wxNjkxLUwxNjk4DQo+IA0K
PiBBbm90aGVyIHNvbHV0aW9uIGlzIHBlcmhhcHMgdG8gYXNrIGtpbmRseSB0aGF0IHRoZSBrZXJu
ZWwgdGVzdCByb2JvdA0KPiB0ZWFtIG5vdCB0ZXN0IGJyYW5jaGVzIG9mIHN0YWJsZSB3LyBjbGFu
ZyBmb3IgQVJDSD1taXBzLg0KDQpUaGFua3MgZm9yIHRoaXMgaW5mby4gV2UndmUgY29uZmlndXJl
ZCB0aGUga2VybmVsIHRlc3Qgcm9ib3QgdG8gZG8gc28uDQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpZ
dWppZQ0KDQo+IA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saWIvbXBpL2xvbmdsb25nLmggYi9s
aWIvbXBpL2xvbmdsb25nLmgNCj4gPiBpbmRleCA2YzUyMjlmOThjOWUuLjQyMDc2YzEyNGUyMyAx
MDA2NDQNCj4gPiAtLS0gYS9saWIvbXBpL2xvbmdsb25nLmgNCj4gPiArKysgYi9saWIvbXBpL2xv
bmdsb25nLmgNCj4gPiBAQCAtNjM5LDcgKzYzOSw3IEBAIGRvIHsgXA0KPiA+IMKgwqDCoMKgwqDC
oMKgICoqKioqKioqKioqKioqwqAgTUlQU8KgICoqKioqKioqKioqKioqKioqDQo+ID4gwqDCoMKg
wqDCoMKgwqAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLw0KPiA+IMKg
I2lmIGRlZmluZWQoX19taXBzX18pICYmIFdfVFlQRV9TSVpFID09IDMyDQo+ID4gLSNpZiAoX19H
TlVDX18gPj0gNSkgfHwgKF9fR05VQ19fID49IDQgJiYgX19HTlVDX01JTk9SX18gPj0gNCkNCj4g
PiArI2lmIChfX0dOVUNfXyA+PSA1KSB8fCAoX19HTlVDX18gPj0gNCAmJiBfX0dOVUNfTUlOT1Jf
XyA+PSA0KSB8fA0KPiA+IGRlZmluZWQoX19jbGFuZ19fKQ0KPiA+IMKgI2RlZmluZSB1bXVsX3Bw
bW0odzEsIHcwLCB1LCB2KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPiA+IMKgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ID4gwqDC
oMKgwqDCoMKgwqAgVURJdHlwZSBfX2xsID0gKFVESXR5cGUpKHUpICogKHYpO8KgwqDCoMKgwqAg
XA0KPiA+IA0KPiA+IFsxXToNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy8yMDIzMDgwMTIw
MjYwMi5HQTI1ODk3MTBAZGV2LWFyY2gudGhlbGlvLTM5OTBYLw0KPiA+IA0KPiA+IENoZWVycywN
Cj4gPiBOYXRoYW4NCj4gPiANCj4gDQo+IA0KDQo=
