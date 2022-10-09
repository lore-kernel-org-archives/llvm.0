Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652D7E
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 10:49:55 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-32-AZdfbNVcP-2xXHI9wdH94Q-1; Sun, 09 Oct 2022 11:49:53 +0100
X-MC-Unique: AZdfbNVcP-2xXHI9wdH94Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Sun, 9 Oct
 2022 11:49:52 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Sun, 9 Oct 2022 11:49:52 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nick Desaulniers' <ndesaulniers@google.com>, Arnd Bergmann
	<arnd@arndb.de>, Kees Cook <keescook@chromium.org>
CC: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"Alexander Viro" <viro@zeniv.linux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Christoph
 Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, "Darrick J. Wong"
	<darrick.wong@oracle.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Paul Kirth
	<paulkirth@google.com>
Subject: RE: [PATCH] fs/select: avoid clang stack usage warning
Thread-Topic: [PATCH] fs/select: avoid clang stack usage warning
Thread-Index: AQHY2n+hcGcBonK1M0KmZt3TrrNRoK4F47gg
Date: Sun, 9 Oct 2022 10:49:52 +0000
Message-ID: <b211e3a2549844fa957ca84b9257872d@AcuMS.aculab.com>
References: <20190307090146.1874906-1-arnd@arndb.de>
 <20221006222124.aabaemy7ofop7ccz@google.com>
 <c646ea1e-c860-41cf-9a8e-9abe541034ff@app.fastmail.com>
 <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com>
In-Reply-To: <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com>
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

RnJvbTogTmljayBEZXNhdWxuaWVycw0KPiBTZW50OiAwNyBPY3RvYmVyIDIwMjIgMjA6MDQNCi4u
Lg0KPiBJdCBsb29rcyBsaWtlIGZvciBhcnJheXMgSU5JVF9TVEFDS19BTExfUEFUVEVSTiB1c2Vz
IG1lbXNldCB0byBmaWxsDQo+IHRoZSBhcnJheSB3aXRoIDB4RkYgcmF0aGVyIHRoYW4gMHgwMCB1
c2VkIGJ5IElOSVRfU1RBQ0tfQUxMX1pFUk8uIE5vdA0KPiBzdXJlIHdoeSB0aGF0IHdvdWxkIG1h
a2UgYSBkaWZmZXJlbmNlLCBidXQgY3VyaW91cyB0aGF0IGl0IGRvZXMuDQoNCkhvdyBtdWNoIHBl
cmZvcm1hbmNlIGRvZXMgZmlsbGluZyB0aGUgYXJyYXkgY29zdD8NCkknZCBzdXNwZWN0IGl0IGlz
IGVub3VnaCB0byBiZSBtZWFzdXJhYmxlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRy
ZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1L
MSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

