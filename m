Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69692100;
	Tue,  8 Aug 2023 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691484917; x=1723020917;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=v9PrjBx+zKaPkKLcXFkbP1e8PUj1PHOklqyI72KUWuQ=;
  b=dI6nCRHiuboWFJZyvnkoMuNbY3bzWhs/C1vXFq96PyFxmHKksJU6BUAR
   JSAmwSYEyGC0kqfE/gdppD0mGT4TUW2x8BCrpKK3srv1idMhD1JZppvfq
   1NB243YF1BaVF3w6A5DCob8g7qXynuIwW2kH6uei/O0dzd08NoeBrSCiD
   1BBYcKKR1zCUDFJd/38Qiy8rFn3H3vjioa53CpoqKkxTIftgKvVJr1jxv
   v3vDrcy3A7K1b6SohlbvVS1PTsaFXuoBZgQp7gfa+hAyshUYjbkDQhD1c
   KJWBgEHJmcK+TNSyLaufwGROcdr4fCjE9znuZXWLF4ESdPp4r6lOPSpoG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360855304"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360855304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 01:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681169250"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681169250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 01:55:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 01:55:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 01:55:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 01:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTo7UOKZ8LF5di7+M89iDVwK6zY7i8CmWIIxOWgSbpA2tj53Ia0bMoUIzsh6p0qO10wpcYjCweG87m15pqv4vwL/Eash8oIt7Y2zrxu0S1zmVs4PWug3rD4DDLdUqCgcGSbyZfYzpyN+uXaHH0BkoNEoByXXSRxigoAxaudUxiT8E9X8CpN9/+riGSv3AyNlWyaQPJWsDoHL/kBiH+eSbacx74aufxrAW6w+7FyvXSxKGGj7vD4QmhoWMNChZY5y5BfgIiYgE3WnqNkIyve1+Gp6HFhUbihdP9+V2FtgHCCjmb5U+WbKySlRU8vYTiT351M37sGifzD720yKM6MN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9PrjBx+zKaPkKLcXFkbP1e8PUj1PHOklqyI72KUWuQ=;
 b=heTwFrIDKIYmKSjedEnPg/oPMgmYbCy03nqoii8RBvZQU5t85zB6dJr0b1e38akc3iKOhi7/YiOnf2rsZNhAOE8SZgaEO7kSXpWSjG8TiZ1xYx3g7IK5Yg5iXByBqrrUQaZ0QE+AHtArMKxUp/kKbFbCkZDmSF9D63VA1oNAhdQJSJHbmbUMlevOwmYtvzKd1N4NRi4tzMmBp4XifmZJTuuOKX+OyFtgZsei0YR59tDOhhTvhN535dDt8mZUPRW4H+dTh1PUWEeOt8Kmhj/pzjfnm+BlIbmKqZO+vO6h3t7PshpFwKqD1fa7vYlw3/Y0R12eD6Uz7en0J+06VLUT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 08:55:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:55:14 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "ndesaulniers@google.com" <ndesaulniers@google.com>
CC: "nathan@kernel.org" <nathan@kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20: error:
 invalid use of a cast in a inline asm context requiring an lvalue: remove the
 cast or build with -fheinous-gnu-extensions
Thread-Topic: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20:
 error: invalid use of a cast in a inline asm context requiring an lvalue:
 remove the cast or build with -fheinous-gnu-extensions
Thread-Index: AQHZxlJLdgAv5bMx5EWWsfqxNIVrJ6/aRpqAgAABJACABCHXgIAAn50AgAEVJQA=
Date: Tue, 8 Aug 2023 08:55:14 +0000
Message-ID: <e6aa932c7b8512637e02b63d3e2c0122086a45d8.camel@intel.com>
References: <202308040553.nMR9oB8v-lkp@intel.com>
	 <20230804153749.GA2148888@dev-arch.thelio-3990X>
	 <CAKwvOdk7VrGMy95heyyLhdhgNWb1LyV48WmzvhpNUrqaYBin_A@mail.gmail.com>
	 <2a1061fb250905545c4a514b5328e3d36ab6f8f7.camel@intel.com>
	 <CAKwvOd=LMeeeA68ydcQtFgzd1vv0F4i=DJYCxEiHahN7+OP5_A@mail.gmail.com>
In-Reply-To: <CAKwvOd=LMeeeA68ydcQtFgzd1vv0F4i=DJYCxEiHahN7+OP5_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB8164:EE_
x-ms-office365-filtering-correlation-id: 714fcaaf-20f4-4458-5b1d-08db97ed2e43
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QeLgfzgcg5qnEaagKbficyTKIJJEGCzcXmbqI67kNJy+tVPSErahaKNKy+gMfCbHVYdASgpBH7NTVyQaGKc8C8/pRmWnp/fmU5xLvQ7VlW6wZ1vsW9+vEm+KN3LR4wg9jB7LudZ2EgMNeCsbhYV66e4SoxggbqbZ4SOFOJw7bbg7cusYsQz8YJLoEwN4v0OIz5UDNEJogaf9FUU36kJjARIXK9efmdyatP3KsrAf9e3EIpQnmwowpoY9sRvgJ24fQr6yuHGkj3rJRUBOLD10q3M5Q+5MUNXbVb+NZOVtw07WnBysYmK7LY6gl/+mFe57kcb9T4bLL2BWy3AvYhQmk0hslwnyZGkAxA0LiFMKokIZfE0gi38/WsuaLL/Xf37E3sm2Tx4eEXFSkqRWbyDy2Ow5CWftiMUGNEr+ejIxlk/6oTtNivdQXM+FtSInR/YIkhPneMmgJQ2i2ClSJ0lbYyUs1tBqUueKrr1gy+OJoQvXXyMqP5djmveegW+1U2WIEBdbL0tuADUu9emKJSvzHOMhyGNaTPgIuoob7HOs+9JFvqArouWWwSH6ufq6iOhjY1QwiZc+8/lvMzxD7XmvpXAsZHs7ZMqJTvmpTJyAqsnrPZlVUyvoDZTG8ezfrsCRt7Dtuv8ESBknQXdxyzp8DA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(186006)(1800799003)(451199021)(38070700005)(26005)(2906002)(5660300002)(83380400001)(8676002)(41300700001)(8936002)(2616005)(122000001)(6916009)(82960400001)(316002)(53546011)(54906003)(6506007)(76116006)(66446008)(38100700002)(478600001)(64756008)(66476007)(66556008)(6486002)(91956017)(71200400001)(86362001)(66946007)(6512007)(4326008)(966005)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0lHTUg1dU9LOWZ1a2lESVF5ekdiUGF5c2NJZVVJRXZyK093WTRJeVJMTUh5?=
 =?utf-8?B?MzRBbk1DclprSEUxR2FaSFFnWVM1djN6eGV5alVvZmRldjJTOUl0S3pUTTQ5?=
 =?utf-8?B?eFRqNWVjaDlCTlg0eHZlRmxhTXA2Y3VrbG1YK0gzOXJXR1JnL0hZL0VTclNL?=
 =?utf-8?B?eER5OUkra2tTSEhZSjlnYnRUN0c5MlVua01CelZXT1dtOGJBbWllMmNWWWNE?=
 =?utf-8?B?SjlZSWRrYUZzOVU1U2IzSEk3THdBeDBib2tDZ3RPRHFiaUVzd1RSY3g4Z1Ez?=
 =?utf-8?B?eC9qeXRjVHBVbWp6VER4YVRUbERIVk14WUpMWkZNMk9MQkFlRzZxSXZEOWxH?=
 =?utf-8?B?cXprNU9sSnBKUHRRVGpRN1ByWHhRTkRqSzdFcDhab1lwczhrS2xXcmFBT3FF?=
 =?utf-8?B?NW10TU84TDJKR2pybUtQb1E2SnZLOFNIRVIxdUp5YThuc0ZSZWxJWktCNnJR?=
 =?utf-8?B?TU91Z3l5RE13V1VEZm1oZGxsaE1UYWlhYkZSRzJ3MVZsZ2xYZEhORS94RnlN?=
 =?utf-8?B?R2diUHFkOE1Nb2MxWUhHb2RCd0RPdXoyWStxY1VONXNLTWZJSWQzeWNqaFcr?=
 =?utf-8?B?NUFQY2ZwQnRaU282YnZtRTZ5ai9idnRadHU3UUIzN0d4ZnI0Z1RETEVEUld3?=
 =?utf-8?B?ME5VZWp5NVBFK1UvWHlkNExIaUJQVlZqaU0rK0QweWdjQjhFZkRTQlQ2R0V4?=
 =?utf-8?B?NEYxMmdrYjFlTG9SdUcvT3EzejZCSWV5K3YrSnpQVDV5SXd4ZGF1NXRrWWR5?=
 =?utf-8?B?OG1PV2NBZ2FlRk5XT3Z2dGF3ZlptU2hmY0dtbjNtQmpWTjBJY2JLcFVTVFpW?=
 =?utf-8?B?RndrbllGWVR4TWdNSGtIbXlVOW8zOFZGUW13U1dmSVdaR2YwYlUzUDBMb0Iz?=
 =?utf-8?B?aFN1MEtxYk9ZREJTd1Q2UzVtQ01tQ2hiQWFoZWNOMHMrUmI4S1Z1ZW5oOHBk?=
 =?utf-8?B?YXo3OTVZN3NnMnVjWDY1VFVmTjI4aUVHdEZrODNaejhPRTdnREFQMEc3TmFi?=
 =?utf-8?B?d0R6ZmxyYTRDNWhZc1Y2UDNoR3d1L1RvaW1vb253T1RvRGFKNWxsdnFPL3kx?=
 =?utf-8?B?TFV4MmtEOStwRk15aitkaWt1Tk95Z2ZNMjBRSzJjallHOE9rbk5IdTR1eG1Z?=
 =?utf-8?B?OS9HQ0tCM2JMT3dSN05EdGNId1ljalNKUXd4YkpvRG9rSVFmdGs2SS94QUdj?=
 =?utf-8?B?cFBJcFcvSWd0VEdOaEpUd0VIdUZXWE1oSVRlSG1mVUU1aEhwZnlyME53aVBi?=
 =?utf-8?B?YjlHOE5rZm9VenE0ZmR6YldIVXd5aWFxei93dmtjYkMvUnBQL3NZakgveEYv?=
 =?utf-8?B?VHp5NFNWVzRhdG03T3ErdkpLa0cwR2RUOXlEaGdEWUx4T1R5emI0ZWxnQ1E4?=
 =?utf-8?B?R1ZCQzFER1hhTTFZeWNyL2NUQVhNRnRpWnpxV3ZLY2xUektzTktka213akJZ?=
 =?utf-8?B?RVFrNjlpU1NVaXluelRqWU9BcExLbml3UTNsbkJpd29XN0hNMUVxWUYrUlBq?=
 =?utf-8?B?eStFMnlxTE81UDVaS0N3WWxoamtWYUQ1Ui9JbmIvWW1QdkF4aEU2QUpKTE4v?=
 =?utf-8?B?S1FaOWtNTGp3MXNBYmRFMU9DK1ZuNXJwVFVuZ0dkV1FMWDUxZTAzVWMvc2R3?=
 =?utf-8?B?QnpJQUtZRjViU0NrMFNSK1ZGM05lUmpQVExYZ3F1Z0RHK0xZaWxPMlU5Vk9V?=
 =?utf-8?B?RXhMWG9YWUxycTNvTWRPQkszMlN5VUhOaVkybGJXVFRZcytvaXd4SGFyUkcr?=
 =?utf-8?B?WnJoa3BxUnJrZnk1R0xPazhJVXltU1NOaTFFc3JqOWRHai9CSGRwTTVpNDM0?=
 =?utf-8?B?NW5lZ09ZYmsyeWtzVDNvbVV6ZmhyV2luWEFnK2drcFl5ZHRZMktKamVDYjdn?=
 =?utf-8?B?WnRXOC9rWWs1UjA3MmZzUU9uTHloemdVKzZQVjVLN1ljdHlqYTJDN2xlQ3RC?=
 =?utf-8?B?R3dxVDErSnRwWEY2US9HY3hlSm9CN1V3YVp3RE14M0paajV3T3JvUmI0OU5n?=
 =?utf-8?B?RGw0L3R4cHhrNTdCNU5IUzZvZXN3UzZoZUhZK3RORjlCSmp3OEZESC9qOG1I?=
 =?utf-8?B?b1grdWdORWN2TVlWWWpDeThxa0NHQXpiREo4KytDNTNMZnlKK2VibHFPVFRj?=
 =?utf-8?B?blNGK2FlQkJZeGlZcHE4U0JORDBwZDVlM01wVkRVY2JBdlpyM1R1MkxtbzNr?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46B7B5795DBACC44BA34F4C4ADE34A1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714fcaaf-20f4-4458-5b1d-08db97ed2e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:55:14.2181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPL/YuHJQL+JDs9TbLsREa5XupMVXbk5HYrkyFu0owL5kwnfHS70VFxZ+P+HuQ0eDzVHkHNGehAzX+WCNWv/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDIzLTA4LTA3IGF0IDA5OjE5IC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Og0KPiBPbiBTdW4sIEF1ZyA2LCAyMDIzIGF0IDExOjUy4oCvUE0gTGl1LCBZdWppZSA8eXVqaWUu
bGl1QGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gT24gRnJpLCAyMDIzLTA4LTA0IGF0
IDA4OjQxIC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBBdWcg
NCwgMjAyMyBhdCA4OjM34oCvQU0gTmF0aGFuIENoYW5jZWxsb3INCj4gPiA+IDxuYXRoYW5Aa2Vy
bmVsLm9yZz4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gT24gRnJpLCBBdWcgMDQs
IDIwMjMgYXQgMDU6MzI6NTVBTSArMDgwMCwga2VybmVsIHRlc3Qgcm9ib3QNCj4gPiA+ID4gd3Jv
dGU6DQo+ID4gPiA+ID4gSGkgRmFuZ3J1aSwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBGaXJzdCBi
YWQgY29tbWl0IChtYXliZSAhPSByb290IGNhdXNlKToNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiB0
cmVlOg0KPiA+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUuZ2l0DQo+ID4gPiA+ID4gwqBsaW51eC00LjE0LnkN
Cj4gPiA+ID4gPiBoZWFkOsKgwqAgNjBhNmUzMDQzY2M4YjkxOGM5ODk3MDdhNWViYTVmZDY4MzBh
MDhhNA0KPiA+ID4gPiA+IGNvbW1pdDogNzE3NDliMTE4MWVjYTEyYWY5NjY1NGE3ODFjYWJjZDA1
OGMzN2M4ZiBbNDQ1OS85OTk5XQ0KPiA+ID4gPiA+IE1ha2VmaWxlOiBGaXggR0NDX1RPT0xDSEFJ
Tl9ESVIgcHJlZml4IGZvciBDbGFuZyBjcm9zcw0KPiA+ID4gPiA+IGNvbXBpbGF0aW9uDQo+ID4g
PiA+ID4gY29uZmlnOiBtaXBzLXJhbmRjb25maWctcjAzNS0yMDIzMDczMQ0KPiA+ID4gPiA+ICgN
Cj4gPiA+ID4gPiBodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyMzA4
MDQvMjAyMzA4MDQwNTUzLg0KPiA+ID4gPiA+IG5NDQo+ID4gPiA+ID4gUjlvQjh2LWxrcEBpbnRl
bC5jb20vY29uZmlnKQ0KPiA+ID4gPiA+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDE3LjAuMA0K
PiA+ID4gPiA+ICgNCj4gPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2pl
Y3QuZ2l0wqA0YTVhYzE0ZWU5NjhmZjBhZDVkMmMNCj4gPiA+ID4gPiBjMQ0KPiA+ID4gPiA+IGZm
YTAyOTkwNDhkYjRjODhhKQ0KPiA+ID4gPiA+IHJlcHJvZHVjZToNCj4gPiA+ID4gPiAoDQo+ID4g
PiA+ID4gaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMwODA0LzIw
MjMwODA0MDU1My4NCj4gPiA+ID4gPiBuTQ0KPiA+ID4gPiA+IFI5b0I4di1sa3BAaW50ZWwuY29t
L3JlcHJvZHVjZSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBp
biBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QNCj4gPiA+ID4gPiBqdXN0IGENCj4g
PiA+ID4gPiBuZXcgdmVyc2lvbiBvZg0KPiA+ID4gPiA+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCks
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IENsb3NlczoNCj4gPiA+
ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MDQwNTUz
Lm5NUjlvQjh2LWxrcEBpbnRlbC5jb20vDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQWxsIGVycm9y
cyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBs
aWIvbXBpL21waWgtZGl2LmM6MTQyOjIwOiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgYSBjYXN0DQo+
ID4gPiA+ID4gPiA+IGluIGENCj4gPiA+ID4gPiA+ID4gaW5saW5lIGFzbSBjb250ZXh0IHJlcXVp
cmluZyBhbiBsdmFsdWU6IHJlbW92ZSB0aGUgY2FzdA0KPiA+ID4gPiA+ID4gPiBvcg0KPiA+ID4g
PiA+ID4gPiBidWlsZCB3aXRoIC1maGVpbm91cy1nbnUtZXh0ZW5zaW9ucw0KPiA+ID4gPiA+IMKg
wqDCoMKgIDE0MiB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiA+ID4gPiB1bXVsX3BwbW0o
bjEsDQo+ID4gPiA+ID4gbjAsIGQwLCBxKTsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4gPiA+ID4gPiB+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn4NCj4gPiA+ID4gPiDCoMKgIGxpYi9t
cGkvbG9uZ2xvbmcuaDo2NTI6MjA6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8NCj4gPiA+ID4g
PiAndW11bF9wcG1tJw0KPiA+ID4gPiA+IMKgwqDCoMKgIDY1MiB8wqDCoMKgwqDCoMKgwqDCoCA6
ICI9bCIgKChVU0l0eXBlKSh3MCkpLCBcDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5+fl5+fg0KPiA+ID4gPiANCj4g
PiA+ID4gVGhpcyBpcyB0aGUgc2FtZSBhcyBbMV0gYnV0IHRoZSB1cHN0cmVhbSBzb2x1dGlvbg0K
PiA+ID4gPiAoYjBjMDkxYWUwNGY2KQ0KPiA+ID4gPiBjb3VsZA0KPiA+ID4gPiBjYXVzZSBicmVh
a2FnZSBpbiA0LjE0IGZvciBjb21waWxlcnMgb2xkZXIgdGhhbiBHQ0MgNC40OyA0LjE0DQo+ID4g
PiA+IGNsYWltcyB0bw0KPiA+ID4gPiBzdXBwb3J0IEdDQyAzLjIgYXMgYSBtaW5pbXVtIHZlcnNp
b24uIEFuIGFsdGVybmF0aXZlIHNvbHV0aW9uDQo+ID4gPiA+IGlmIHdlDQo+ID4gPiA+IGNhcmUN
Cj4gPiA+ID4gYWJvdXQgZml4aW5nIHRoaXMgaXNzdWUgaW4gNC4xNCB3aXRob3V0IGFueSByZWdy
ZXNzaW9uDQo+ID4gPiA+IHBvc3NpYmxpdHkNCj4gPiA+ID4gd291bGQNCj4gPiA+ID4gYmUgc29t
ZXRoaW5nIGxpa2U6DQo+ID4gPiANCj4gPiA+IEluIG91ciBvd24gQ0ksIHdlIGRvbid0IHRlc3Qg
bWlwcyB1bnRpbCA1LjQuDQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4
L2NvbnRpbnVvdXMtaW50ZWdyYXRpb24yL2Jsb2IvbWFpbi9nZW5lcmF0b3IueW1sI0wxNjkxLUwx
Njk4DQo+ID4gPiANCj4gPiA+IEFub3RoZXIgc29sdXRpb24gaXMgcGVyaGFwcyB0byBhc2sga2lu
ZGx5IHRoYXQgdGhlIGtlcm5lbCB0ZXN0DQo+ID4gPiByb2JvdA0KPiA+ID4gdGVhbSBub3QgdGVz
dCBicmFuY2hlcyBvZiBzdGFibGUgdy8gY2xhbmcgZm9yIEFSQ0g9bWlwcy4NCj4gDQo+IF4gc3Bl
Y2lmaWNhbGx5IGJyYW5jaGVzIGxpbnV4LTQuMTkueSBhbmQgbGludXgtNC4xNC55LsKgIE5ld2Vy
DQo+IGJyYW5jaGVzDQo+IHNob3VsZCBiZSB0ZXN0ZWQgZm9yIEFSQ0g9bWlwcyBMTFZNPTEuDQoN
ClRoYW5rcywgd2UndmUgdXBkYXRlZCB0aGUgYm90J3MgY29uZmlndXJhdGlvbiBhcyBzdWdnZXN0
ZWQgYWJvdmUuDQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpZdWppZQ0KDQo+ID4gDQo+ID4gVGhhbmtz
IGZvciB0aGlzIGluZm8uIFdlJ3ZlIGNvbmZpZ3VyZWQgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IHRv
IGRvDQo+ID4gc28uDQo+ID4gDQo+ID4gLS0NCj4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gWXVqaWUN
Cj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9tcGkvbG9u
Z2xvbmcuaCBiL2xpYi9tcGkvbG9uZ2xvbmcuaA0KPiA+ID4gPiBpbmRleCA2YzUyMjlmOThjOWUu
LjQyMDc2YzEyNGUyMyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbGliL21waS9sb25nbG9uZy5oDQo+
ID4gPiA+ICsrKyBiL2xpYi9tcGkvbG9uZ2xvbmcuaA0KPiA+ID4gPiBAQCAtNjM5LDcgKzYzOSw3
IEBAIGRvIHsgXA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCAqKioqKioqKioqKioqKsKgIE1JUFPC
oCAqKioqKioqKioqKioqKioqKg0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovDQo+ID4gPiA+IMKgI2lmIGRlZmluZWQoX19taXBz
X18pICYmIFdfVFlQRV9TSVpFID09IDMyDQo+ID4gPiA+IC0jaWYgKF9fR05VQ19fID49IDUpIHx8
IChfX0dOVUNfXyA+PSA0ICYmIF9fR05VQ19NSU5PUl9fID49IDQpDQo+ID4gPiA+ICsjaWYgKF9f
R05VQ19fID49IDUpIHx8IChfX0dOVUNfXyA+PSA0ICYmIF9fR05VQ19NSU5PUl9fID49IDQpDQo+
ID4gPiA+IHx8DQo+ID4gPiA+IGRlZmluZWQoX19jbGFuZ19fKQ0KPiA+ID4gPiDCoCNkZWZpbmUg
dW11bF9wcG1tKHcxLCB3MCwgdSwgdinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwNCj4gPiA+ID4gwqBkbyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgVURJdHlwZSBfX2xsID0gKFVESXR5cGUpKHUpICog
KHYpO8KgwqDCoMKgwqAgXA0KPiA+ID4gPiANCj4gPiA+ID4gWzFdOg0KPiA+ID4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy8yMDIzMDgwMTIwMjYwMi5HQTI1ODk3MTBAZGV2LWFyY2gudGhlbGlv
LTM5OTBYLw0KPiA+ID4gPiANCj4gPiA+ID4gQ2hlZXJzLA0KPiA+ID4gPiBOYXRoYW4NCj4gPiA+
ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+IA0KPiANCj4gDQoNCg==
