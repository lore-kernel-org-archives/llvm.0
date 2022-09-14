Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378B3D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663158517; x=1694694517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cbqKuDwgq7imC2RMrFTFvefI+y7/4GZ34hNysO63eek=;
  b=QeZrBb1UIIHvk0huKOk1l1ezab3TTuu2cce2leOpBd2QpW2mZA0dXvhu
   r1z1exFLEhkgFhpG35CF1+Ta1q+r9wtbuFG4hgbb4rQMg/EQ/YeZwy9UE
   xpf/56NQH4QIE1ynhC0jUfWCaAiB9LOk8W3vCR+1fh34pVEiJMZFq1qsq
   eWIaT8HwLZqcgK2CRtTNPb/l5JtucQGkeBhLvfoavvMYTIyD93U5+sBOg
   n+CGHhoFMHArWQGFsQFfk/b71i8iRIgZspRMD7Ouv0fXdAk8QYh5VXg26
   UQJvlvZxJ583A5WgNDYx55YfJ66VQv1wsplxHg5GsKa1MvsdvXu0HBLdA
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="113622015"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Sep 2022 05:27:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 14 Sep 2022 05:27:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 14 Sep 2022 05:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8+A1w3lasL91IIc4Ro2TxCyUwQhEmX0/t+sS2RSB8PRDFX6CQlWGEYlZLviLvsQGYTv0AZO+u8S9KDXARxr3i+F73V5r3xCaiFCnoY6VhBeDi5vi1w1Hu9Shb9BMfssowxVvG5HWMIXn61YF41ZFV7nBjXjDadwPqG3VGiF5+g1TtP3ztqG3kcmad0flJVqBKREAFHV0L0WEN5yWd/8M9/lg/NhKl+W/Kfa2JrWRchQwp4MvPlpGvuWcNe2xvhcu+K2tjkudKybMhd67t4kbwiEJ6dq7vnUcS1N8ZJfeXoQudO5MyBcQRsJyMfXVnwv1Jpjwt2rlFcGDW4KEKWAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbqKuDwgq7imC2RMrFTFvefI+y7/4GZ34hNysO63eek=;
 b=WQnSVWORm2eLEE2ZdinUALH3sEfajFv5HwNCAgBcl/N6Jp3wiYuqynjdsiit3+Z5+ViRvbCLnMLnw6vEeZiGs3n/aAwrtXl326sUlPDV2hVAbL6VxynB702VJyZiyXnxOaIIl3602Yx4nVOMA2O/1OT9c7QH5Ow4st423yNCXV7ecpJWABo/fvsIPwxOy6Yq6+DLxRFWrafByT/lVmhVTpKKvhqoTt/v55dkWWdvteNz2/rCBZmqyAImoeKYKlhtOlZfkf5uiONDHnb3Ozu52JCPoEt01XM2xbcgu9xCJ/bkMoNYY73dxKCrXAU1ydJEIolsy6H5woEqmZSYhQEsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbqKuDwgq7imC2RMrFTFvefI+y7/4GZ34hNysO63eek=;
 b=Vd1hRCLVO7hM0w8bv9O4Em0GpqcI0HdaxxeocLReqrYUD2ZwYSDhMAe6Xl/whBz65yWrbJRD3/VC7SNk/tX9zlQm52F8Hm8XqeIwn1ALRLCLhWAOi4FYcPRoCBtcDXsmpPQo/cguN0OulA7g8v8IFfCVxcxgg5QVkFwq0ncMZkE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 12:27:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 12:27:19 +0000
From: <Conor.Dooley@microchip.com>
To: <lkp@intel.com>, <palmer@rivosinc.com>, <heiko@sntech.de>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6256/7172]
 arch/riscv/errata/thead/errata.c:40:2: error: use of undeclared identifier
 'riscv_cbom_block_size'
Thread-Topic: [linux-next:master 6256/7172]
 arch/riscv/errata/thead/errata.c:40:2: error: use of undeclared identifier
 'riscv_cbom_block_size'
Thread-Index: AQHYyC550UWLZMPP902K2KHBq009jq3e2kiA
Date: Wed, 14 Sep 2022 12:27:19 +0000
Message-ID: <2d0d917d-9bc8-a1e4-1569-af3921a18139@microchip.com>
References: <202209141913.Nxzv3hwM-lkp@intel.com>
In-Reply-To: <202209141913.Nxzv3hwM-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BN9PR11MB5452:EE_
x-ms-office365-filtering-correlation-id: f5ca95db-bf0f-496a-1247-08da964c77cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vbRJe3DUpX29h1TPwuoQvhY76Z07de6mrePDCNmvhEc7z/mIq6fEu1pu11p8ZXVn1N6y6jyAOu0a67quJRxXK070t4hpVd4I9xsSAmnIwO8AUHTVFNB1pb5oXC8nuN2mbkH65t13xTFbHyH88ryVLHRn7MSshtSM+s6yD0wymtrk3vx6BtBOkFHMrZ3/nbMp+3WzNA2agjyulb9cAbvBw5v1n2F73DRyThofDN1TY6+fCdFOk4z7duTXdFZkJCrLI7cI5OOspOGKbXpZlhwQrpB80AHmeXaCUHwAsZ8wlITQpqFXkq+Ex2XYaIXruVc5cZiaiz2WIzmtYJIspjGIJuuuBXtcXLW1MvXZpeEz7VaZwojnDnoB5G0DI68uSbp5UJ8Jk7nfRd6HwwT9uDdy540WaK7y4ZvAPOpocvb+BeN8CWU576tYz4HJ1+ngmFQGXAkx8coitz9Ioe3644Di6foO84Gihz7lpQhPL5toqk1tnSvdkUgvfOQeM4JRQSZcXduXFxQsRLC4vAXbvtbK1HGSb9aSegykC2PV22IlQvyC4tKw7etwlRGQkCEzf9gp+ZCE6N/WmiyzWChuqYPpF4t0+LgaQMV67nVSN/WwKa0Eqlr+npObw5hpHtJl/zOoGxljvXzd0oOEd75M8YJm3n2byhEZ5AloJrdRS0nBOG0QiCuIJQScsuhLRsBdjR2FHk6Ql4Kq7sb88RpnKY0DCrV3Oya1BuQudc6FEKkRvglUa3xAJyhlkXUz048EykU0w2ct3djwEhbHBDCOTL4AJeexaTsK0ana4M+W+13TyIRrK+pL/lP/O76mCL7YLemq6JGg+7aSyJXv7MstRdLu/FCKs2CuxxVkUlx8DYaA2RSuSBzfqu66DWCsXiaMWfbclqnPg9JI/YYrc3flCChVuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199015)(6506007)(966005)(110136005)(316002)(2906002)(41300700001)(53546011)(5660300002)(6486002)(64756008)(66556008)(2616005)(6512007)(478600001)(8676002)(38100700002)(26005)(71200400001)(8936002)(66476007)(66446008)(38070700005)(186003)(31696002)(76116006)(83380400001)(66946007)(36756003)(54906003)(91956017)(31686004)(4326008)(86362001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU9IZVBEWld2VWRtYnJMb202NnNGeHFNY2ZtOHg3ZllqUW02RERMSnVYSXY2?=
 =?utf-8?B?RnBPenZqVGJqOEw4WkQrUXlqT2svVEFPcFJXV0lyOGV3Nm9GY1crZnpjeW1U?=
 =?utf-8?B?L1U0YitPVU1qQjVNdWRnb0JrNTB6NEVvY1UzVmtOL09mM2sxcEhqNUNXNXQ3?=
 =?utf-8?B?U015UkFXY3pXTGxWVksvTTVGWXRzK1pxOFRUN3RlaTE0VFc3RHNBb0ovZFZJ?=
 =?utf-8?B?VTdlSDhLeUNBcmRNNWhVYlNOM040OVQrQmxLZnhrNC9DK0FHeENvRUpkZkQw?=
 =?utf-8?B?V09PSEloVFpqNTNmREJURVh2MjNnL1AwYkE3WGlacDE2b0doUmRiM3pySm1I?=
 =?utf-8?B?SjhUZ055eVNGTnhxcTEyV2dXa2tCTzYrK2RzWWtkM0xoNTVNa2paUzNvVzNU?=
 =?utf-8?B?M1RnRUJvZFA5QzNOb1JybndwRUp3R0tYN3NLVlFHQVdGUjh2a29Ed0NhSzcx?=
 =?utf-8?B?OEx1aVZGemJ5Qms4eHI5dlNxbCt1NWhtNE85azRYdFlWTTY0bUZ6UTZta21s?=
 =?utf-8?B?ZGRBMW1sdnRuR1hvUEIvVzNYcEJ3ZytRT0lRSklzNFpVN3lQT3pMaGVBejVZ?=
 =?utf-8?B?eGpFQ2ZMdTRGL002WTUwSWFRZU10YjdaOVhBUFJVam41NHhVQ1Q0c0pzejF0?=
 =?utf-8?B?a0pKYnJVSXE5TmZjUjA5cDhDUmFvWllFMmx6UnR2TVdrc21VYjZtMXlzZ2Z0?=
 =?utf-8?B?V3d6dWNiNENGVGt6Q2h2a3hwTnRFSlo3TVh1VWp1UUQ0OHJERGRVelhuMElZ?=
 =?utf-8?B?UWRDRFFncWhBNENlblVyU0tNTW81cjROa3dpMmNSdVpzcCsvcGF2MnNNeVpn?=
 =?utf-8?B?ZS9PaGpRNFB4ZFo5SmtGQU9PdnJxTnhMaVY5NlYxbWlRcjN4YlFDMmhCcUZG?=
 =?utf-8?B?ZTYzc2lHL0d4MTRjNzlYb01TWS9PZ3YvZWJOb1JFMGtYbjB4MW4zQnpDT2xw?=
 =?utf-8?B?Zng0dFM4VndNWm9WSkc4bk9JaURyWE15TTBKLzFIbjEveUJ5ZFRsVDBPZEhz?=
 =?utf-8?B?Q1pUdlZMbG1CRklieTUwR0toK2FNVktxSk94cXc5b1lER3pYRnF5T1pZNitH?=
 =?utf-8?B?RUk1STlIdURMZGwwK2h2VHl1YVc2MlZnMU05N3VtK0lYVVJmdU9uc3JOa0M1?=
 =?utf-8?B?U1FZb2R1NzQvbWJXcmxZWEZobytqWFdCa1dIT2NXb01pYjl2MUZoelZjeTBt?=
 =?utf-8?B?dGZsV2FVNldLSFhJbUFORGlRZFJSNE9NelJqbW1XQ0lUeUR4STRtLzRmZWRV?=
 =?utf-8?B?VnE2WVF3MjgzQUN1aHVaUmhNUGwxZVBMVVVaQlRGdEpJa3dORnZiZE82eWxL?=
 =?utf-8?B?TjU4YlY4WTUzeGZra2k1clBYa3dVdkJvcjJ6WElLQjRDQmlUMWx4b0pONTdR?=
 =?utf-8?B?ZkNNVXNrNjZld3BNWEhmVTFyVG5vemQvc0djc2xCMzdyMnl2RkdHSDlyR2F6?=
 =?utf-8?B?bUVoYW9ha0l0WlFjdDN1TWFYbnpSRERkREU3STBiN1ArOHFWTEs5TnFyUEJM?=
 =?utf-8?B?T1RLWVdoM2NCcHlFYkMrUTJBR3JxSWZRZDNvbEZaRGlxTUhqaTFxdkxwZ0pK?=
 =?utf-8?B?dWpnMWRtWkg0WVlIY2RzZlIwekNOV0Voc2pCQmRobFl2YjJjT3JNemZyQWdh?=
 =?utf-8?B?Zlp3b29FTVlaZUlGdFdaUmFHYlpMUEVqaXNJaU5BQ0hkU0hKUXRqYldubFh3?=
 =?utf-8?B?Qk5melFrakQrODVRZFBiVmpXSUtxRmdoRVcvdkxVV0Z1QUhNZnRsZFJLUWtY?=
 =?utf-8?B?S1NmQTB1WkZza3JpRlpHU2hNVURUK1NVRDI4dzcxOFBEc1hKRlVZcGZaSjly?=
 =?utf-8?B?bHJlQm5MZ2pmVzlpRXhhckxjZ0FvZHJaWDU4ZVBERVlUN0xtdy9pelRXbjNR?=
 =?utf-8?B?T0RTbWRicW5Gd3JtejFKK0hON1A3c3dkK1BCSnV4Z3ZiTCtoZDlrRHg4eUJy?=
 =?utf-8?B?L09SL2x4dnNsRis1Uzg2NVhSR3o3RjB2QTgrZ1licUJpajllYnk3am51R1Rw?=
 =?utf-8?B?V1VCSXBVWVIrVmE1YlJTRkRHdk9jcVVneEVwZkNkOVRRWTR6UjgvQUo5Y0sv?=
 =?utf-8?B?R24zMTY2dmFHVmkrbHpURElwdGRxeUdvZ3h5UU13N0dCdFRVQk5nTVBjL095?=
 =?utf-8?B?SGE3QzN6SkN2aFlvQlBiZEVVZGR6c1RoNGhUWWplaU9yYU9jYjFEeTcxQ0xs?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3469E480FEC55C48AB347EB1C6CAC3BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ca95db-bf0f-496a-1247-08da964c77cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 12:27:19.7577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+iFOx2p/ZO7QpqvYXvmzAieuxWWqvHEug6plxuhiQ1I6B4CbdfVDkt84URMVx0zaV/mg4wdncjy8Goj+k0ZOaIScTi3tga3gut1RwVOH1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5452

QEhlaWtvIGlzIHRoaXMgdGhlIHNhbWUgaXNzdWUgdGhhdCBMS1AgcHJldmlvdXNseSBjb21wbGFp
bmVkIGFib3V0DQp0aGF0IHlvdSBoYXZlIGEgZml4IGZvciwgb3Igc2hvdWxkIEkgc2VudCBhIGZp
eCBmb3IgaXQgdG9uaWdodD8NCg0KT24gMTQvMDkvMjAyMiAxMjozNywga2VybmVsIHRlc3Qgcm9i
b3Qgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gdHJl
ZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0
L2xpbnV4LW5leHQuZ2l0IG1hc3Rlcg0KPiBoZWFkOiAgIGYxMTdjMDExODczMDFhMDg3NDEyYmQ2
Njk3ZmNmNTQ2M2NiNDI3ZDgNCj4gY29tbWl0OiA4ZjdlMDAxZTAzMjVkZTYzYTQyZjIzMzQyYWMz
YjgxMzkxNTBjNWNmIFs2MjU2LzcxNzJdIFJJU0MtVjogQ2xlYW4gdXAgdGhlIFppY2JvbSBibG9j
ayBzaXplIHByb2JpbmcNCj4gY29uZmlnOiByaXNjdi1yYW5kY29uZmlnLXIwNDItMjAyMjA5MTQg
KGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIyMDkxNC8yMDIyMDkx
NDE5MTMuTnh6djNod00tbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBpbGVyOiBjbGFuZyB2
ZXJzaW9uIDE2LjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IDE1NDZk
ZjQ5ZjVhNmQwOWRmNzhmNTY5ZTQxMzdkZGIzNjVhM2U4MjcpDQo+IHJlcHJvZHVjZSAodGhpcyBp
cyBhIFc9MSBidWlsZCk6DQo+ICAgICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNv
bnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmlu
L21ha2UuY3Jvc3MNCj4gICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zcw0KPiAgICAg
ICAgICAjIGluc3RhbGwgcmlzY3YgY3Jvc3MgY29tcGlsaW5nIHRvb2wgZm9yIGNsYW5nIGJ1aWxk
DQo+ICAgICAgICAgICMgYXB0LWdldCBpbnN0YWxsIGJpbnV0aWxzLXJpc2N2NjQtbGludXgtZ251
DQo+ICAgICAgICAgICMgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPThmN2UwMDFlMDMyNWRlNjNhNDJm
MjMzNDJhYzNiODEzOTE1MGM1Y2YNCj4gICAgICAgICAgZ2l0IHJlbW90ZSBhZGQgbGludXgtbmV4
dCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQuZ2l0DQo+ICAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtbmV4dCBt
YXN0ZXINCj4gICAgICAgICAgZ2l0IGNoZWNrb3V0IDhmN2UwMDFlMDMyNWRlNjNhNDJmMjMzNDJh
YzNiODEzOTE1MGM1Y2YNCj4gICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZQ0KPiAgICAg
ICAgICBta2RpciBidWlsZF9kaXIgJiYgY3AgY29uZmlnIGJ1aWxkX2Rpci8uY29uZmlnDQo+ICAg
ICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWNsYW5nIG1h
a2UuY3Jvc3MgVz0xIE89YnVpbGRfZGlyIEFSQ0g9cmlzY3YgU0hFTEw9L2Jpbi9iYXNoIGFyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkLw0KPiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZyB3aGVyZSBhcHBsaWNhYmxlDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gDQo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHBy
ZWZpeGVkIGJ5ID4+KToNCj4gDQo+Pj4gYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6
NDA6MjogZXJyb3I6IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ3Jpc2N2X2Nib21fYmxv
Y2tfc2l6ZScNCj4gICAgICAgICAgICAgcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gTDFfQ0FDSEVf
QllURVM7DQo+ICAgICAgICAgICAgIF4NCj4gICAgIDEgZXJyb3IgZ2VuZXJhdGVkLg0KPiANCj4g
DQo+IHZpbSArL3Jpc2N2X2Nib21fYmxvY2tfc2l6ZSArNDAgYXJjaC9yaXNjdi9lcnJhdGEvdGhl
YWQvZXJyYXRhLmMNCj4gDQo+ICAgICAgMjkNCj4gICAgICAzMCAgc3RhdGljIGJvb2wgZXJyYXRh
X3Byb2JlX2Ntbyh1bnNpZ25lZCBpbnQgc3RhZ2UsDQo+ICAgICAgMzEgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlk
KQ0KPiAgICAgIDMyICB7DQo+ICAgICAgMzMgICNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFEX0NN
Tw0KPiAgICAgIDM0ICAgICAgICAgIGlmIChhcmNoX2lkICE9IDAgfHwgaW1waWQgIT0gMCkNCj4g
ICAgICAzNSAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAgICAzNg0KPiAgICAg
IDM3ICAgICAgICAgIGlmIChzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9PVCkN
Cj4gICAgICAzOCAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAgICAzOQ0KPiAg
ICA+IDQwICAgICAgICAgIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSA9IEwxX0NBQ0hFX0JZVEVTOw0K
PiAgICAgIDQxICAgICAgICAgIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpOw0KPiAgICAg
IDQyICAgICAgICAgIHJldHVybiB0cnVlOw0KPiAgICAgIDQzICAjZWxzZQ0KPiAgICAgIDQ0ICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAgICA0NSAgI2VuZGlmDQo+ICAgICAgNDYgIH0NCj4g
ICAgICA0Nw0KPiANCj4gLS0NCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiBodHRw
czovLzAxLm9yZy9sa3ANCg0K
