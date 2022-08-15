Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8D7E
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 09:55:54 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-101-4cQNWSDENwOhApAiFPs4uQ-1; Mon, 15 Aug 2022 10:55:51 +0100
X-MC-Unique: 4cQNWSDENwOhApAiFPs4uQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.38; Mon, 15 Aug 2022 10:55:50 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.040; Mon, 15 Aug 2022 10:55:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nick Desaulniers' <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>
CC: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Tom Rix <trix@redhat.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Thread-Topic: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Thread-Index: AQHYrP4xySyJ4QyXg0+0Vu0cOV8HAa2vv+Uw
Date: Mon, 15 Aug 2022 09:55:50 +0000
Message-ID: <24087aa311e84df3a3df3c0e15151580@AcuMS.aculab.com>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <CAKwvOdmZvB_=JTeLg08uMFhEMpWga4FJey50QHjzCv_jMVpwkg@mail.gmail.com>
In-Reply-To: <CAKwvOdmZvB_=JTeLg08uMFhEMpWga4FJey50QHjzCv_jMVpwkg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTmljayBEZXNhdWxuaWVycw0KPiBTZW50OiAxMCBBdWd1c3QgMjAyMiAyMjoxNA0KPiAN
Cj4gT24gVHVlLCBBdWcgOSwgMjAyMiBhdCA2OjA4IFBNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBBIHJlY2VudCBjaGFuZ2UgaW4gY2xhbmcg
c3RyZW5ndGhlbmVkIGl0cyAtV2JpdGZpZWxkLWNvbnN0YW50LWNvbnZlcnNpb24NCj4gPiB0byB3
YXJuIHdoZW4gMSBpcyBhc3NpZ25lZCB0byBhIDEtYml0IHNpZ25lZCBpbnRlZ2VyIGJpdGZpZWxk
LCBhcyBpdCBjYW4NCj4gPiBvbmx5IGJlIDAgb3IgLTEsIG5vdCAxOg0KDQpJcyB0aGVyZSBhIC1X
c2lnbmVkLWJpdGZpZWxkID8NCllvdSBwcm9iYWJseSBkb24ndCBldmVyIHdhbnQgdGhlIGNvbXBp
bGVyIHRvIGJlIGdlbmVyYXRpbmcNCnRoZSBjb2RlIHRvIHNpZ24tcHJvcGFnYXRlIGEgYml0Zmll
bGQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkg
Um9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlv
biBObzogMTM5NzM4NiAoV2FsZXMpDQo=

