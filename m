Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162FA93E
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 16:57:09 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-7-Xt_pxTPqPzWXxw5s3Xw5rw-1; Thu, 19 Jan 2023 16:57:01 +0000
X-MC-Unique: Xt_pxTPqPzWXxw5s3Xw5rw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 16:57:00 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Thu, 19 Jan 2023 16:57:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Gal Pressman' <gal@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: .clang-format vs. checkpatch: Lines should not end with a '('
Thread-Topic: .clang-format vs. checkpatch: Lines should not end with a '('
Thread-Index: AQHZLBCrAQXDWDit5ESKvtkqnPaxVa6l9ZpQ
Date: Thu, 19 Jan 2023 16:57:00 +0000
Message-ID: <4337ebe4b5d2456385fa026a72e67d15@AcuMS.aculab.com>
References: <88d82daa-811a-0cb7-8b83-7eb828b4fae8@nvidia.com>
In-Reply-To: <88d82daa-811a-0cb7-8b83-7eb828b4fae8@nvidia.com>
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

RnJvbTogR2FsIFByZXNzbWFuDQo+IFNlbnQ6IDE5IEphbnVhcnkgMjAyMyAxNDoxNw0KPiANCj4g
SSB1c2UgY2xhbmctZm9ybWF0IHRvIGF1dG9tYXRpY2FsbHkgZm9ybWF0IG15IHBhdGNoZXMsIGJ1
dCBjaGVja3BhdGNoDQo+IGxpa2VzIHRvIGNvbXBsYWluIGFib3V0Og0KPiBDSEVDSzogTGluZXMg
c2hvdWxkIG5vdCBlbmQgd2l0aCBhICcoJw0KPiANCj4gSSB0aG91Z2h0IG1heWJlIGFkZGluZyBh
ICdBbGxvd0FsbEFyZ3VtZW50c09uTmV4dExpbmU6IGZhbHNlJyB3b3VsZCBtYWtlDQo+IGl0IGhh
cHB5IGJ1dCB0aGF0IGRpZG4ndCByZWFsbHkgc2VlbSB0byB3b3JrLg0KPiANCj4gQW55b25lIGVs
c2UgYSBiaXQgYW5ub3llZCBieSB0aGlzPyBNYXliZSB0aGVyZSdzIGFub3RoZXIgc29sdXRpb24g
SSdtDQo+IGZhaWxpbmcgdG8gc2VlPw0KDQpSZWR1Y2UgdGhlIGxlbmd0aCBvZiB2ZXJ5IGxvbmcg
bmFtZXMgYW5kIHJlZmFjdG9yIHRoZSBjb2RlIHRvDQpyZW1vdmUgdGhlIG1hc3NpdmUgbnVtYmVy
IG9mIGluZGVudHMgYW5kIHlvdSB3b24ndCBoYXZlIGEgcHJvYmxlbSA6LSkNCg0KCURhdmlkDQoN
Ci0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJt
LCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChX
YWxlcykNCg==

