Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C11FD6
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 22:37:36 +0000 (UTC)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Lp9V44F1wz67M0J;
	Thu, 21 Jul 2022 06:34:04 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 00:37:31 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2375.024;
 Thu, 21 Jul 2022 00:37:31 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Quentin Monnet <quentin@isovalent.com>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	"terrelln@fb.com" <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, bpf <bpf@vger.kernel.org>,
	linux-perf-use. <linux-perf-users@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] bpftool: Complete libbfd feature detection
Thread-Topic: [PATCH 2/4] bpftool: Complete libbfd feature detection
Thread-Index: AQHYm5Hd75GXWaHAc0+e+lQkHL6lia2HkB6AgABJhKA=
Date: Wed, 20 Jul 2022 22:37:31 +0000
Message-ID: <c5a1ca3d8ffa4998970eacf4f8057b1b@huawei.com>
References: <20220719170555.2576993-1-roberto.sassu@huawei.com>
 <20220719170555.2576993-2-roberto.sassu@huawei.com>
 <CACdoK4LMvLyV2z5quN1BE4VrxGJK-f1YfuHWoQrJaH_eKyHZog@mail.gmail.com>
In-Reply-To: <CACdoK4LMvLyV2z5quN1BE4VrxGJK-f1YfuHWoQrJaH_eKyHZog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.81.206.250]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected

PiBGcm9tOiBRdWVudGluIE1vbm5ldCBbbWFpbHRvOnF1ZW50aW5AaXNvdmFsZW50LmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBKdWx5IDIwLCAyMDIyIDEwOjA4IFBNDQo+IE9uIFR1ZSwgMTkgSnVs
IDIwMjIgYXQgMTg6MDYsIFJvYmVydG8gU2Fzc3UgPHJvYmVydG8uc2Fzc3VAaHVhd2VpLmNvbT4N
Cj4gd3JvdGU6DQo+ID4NCj4gPiBDb21taXQgNmU4Y2NiNGY2MjRhNyAoInRvb2xzL2JwZjogcHJv
cGVybHkgYWNjb3VudCBmb3IgbGliYmZkIHZhcmlhdGlvbnMiKQ0KPiA+IHNldHMgdGhlIGxpbmtp
bmcgZmxhZ3MgZGVwZW5kaW5nIG9uIHdoaWNoIGZsYXZvciBvZiB0aGUgbGliYmZkIGZlYXR1cmUg
d2FzDQo+ID4gZGV0ZWN0ZWQuDQo+ID4NCj4gPiBIb3dldmVyLCB0aGUgZmxhdm9ycyBleGNlcHQg
bGliYmZkIGNhbm5vdCBiZSBkZXRlY3RlZCwgYXMgdGhleSBhcmUgbm90IGluDQo+ID4gdGhlIGZl
YXR1cmUgbGlzdC4NCj4gPg0KPiA+IENvbXBsZXRlIHRoZSBsaXN0IG9mIGZlYXR1cmVzIHRvIGRl
dGVjdCBieSBhZGRpbmcgbGliYmZkLWxpYmVydHkgYW5kDQo+ID4gbGliYmZkLWxpYmVydHktei4N
Cj4gPg0KPiA+IEZpeGVzOiA2ZThjY2I0ZjYyNGE3ICgidG9vbHMvYnBmOiBwcm9wZXJseSBhY2Nv
dW50IGZvciBsaWJiZmQgdmFyaWF0aW9ucyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0byBT
YXNzdSA8cm9iZXJ0by5zYXNzdUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICB0b29scy9icGYv
YnBmdG9vbC9NYWtlZmlsZSB8IDYgKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvYnBm
L2JwZnRvb2wvTWFrZWZpbGUgYi90b29scy9icGYvYnBmdG9vbC9NYWtlZmlsZQ0KPiA+IGluZGV4
IDZiNWIzYTk5Zjc5ZC4uNGIwOWE1YzNiOWYxIDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL2JwZi9i
cGZ0b29sL01ha2VmaWxlDQo+ID4gKysrIGIvdG9vbHMvYnBmL2JwZnRvb2wvTWFrZWZpbGUNCj4g
PiBAQCAtOTMsOCArOTMsMTAgQEAgSU5TVEFMTCA/PSBpbnN0YWxsDQo+ID4gIFJNID89IHJtIC1m
DQo+ID4NCj4gPiAgRkVBVFVSRV9VU0VSID0gLmJwZnRvb2wNCj4gPiAtRkVBVFVSRV9URVNUUyA9
IGxpYmJmZCBkaXNhc3NlbWJsZXItZm91ci1hcmdzIGxpYmNhcCBjbGFuZy1icGYtY28tcmUNCj4g
PiAtRkVBVFVSRV9ESVNQTEFZID0gbGliYmZkIGRpc2Fzc2VtYmxlci1mb3VyLWFyZ3MgbGliY2Fw
IGNsYW5nLWJwZi1jby1yZQ0KPiA+ICtGRUFUVVJFX1RFU1RTID0gbGliYmZkIGxpYmJmZC1saWJl
cnR5IGxpYmJmZC1saWJlcnR5LXogXA0KPiA+ICsgICAgICAgICAgICAgICBkaXNhc3NlbWJsZXIt
Zm91ci1hcmdzIGxpYmNhcCBjbGFuZy1icGYtY28tcmUNCj4gPiArRkVBVFVSRV9ESVNQTEFZID0g
bGliYmZkIGxpYmJmZC1saWJlcnR5IGxpYmJmZC1saWJlcnR5LXogXA0KPiA+ICsgICAgICAgICAg
ICAgICAgIGRpc2Fzc2VtYmxlci1mb3VyLWFyZ3MgbGliY2FwIGNsYW5nLWJwZi1jby1yZQ0KPiAN
Cj4gRG8geW91IGtub3cgaWYgdGhlcmUgaXMgYSB3YXkgdG8gZm9sZCB0aGUgZGlmZmVyZW50IGZl
YXR1cmUtbGliYmZkLSoNCj4gZmVhdHVyZXMgaW50byBhIHNpbmdsZSBvbmUgZm9yIEZFQVRVUkVf
RElTUExBWT8gT3Igc2hvdWxkIHRoZSB2YXJpb3VzDQo+IGZlYXR1cmVzIGJlIGFsbCBtb3ZlZCB1
bmRlciBmZWF0dXJlLWxpYmJmZCB3aXRoIG11bHRpcGxlIGF0dGVtcHRzLA0KPiBsaWtlIHlvdSBk
aWQgZm9yIGRpc2Fzc2VtYmxlci1mb3VyLWFyZ3MgaW4gcGF0Y2ggMT8gTXkgY29uY2VybiBpcyB0
aGF0DQo+IHVzZXJzIG1heSB0aGluayBzb21lIGZlYXR1cmVzIGNvdWxkIGJlIG1pc3Npbmcgd2hl
biB0aGV5IGNvbXBpbGUgYW5kDQo+IHNlZSB0aGF0IGRldGVjdGlvbiBmYWlscyBmb3Igc29tZSBp
dGVtcy4NCg0KSSB0aG91Z2h0IGFib3V0IHJldHJ5aW5nLiBIb3Zld2VyLCBicGZ0b29sIE1ha2Vm
aWxlIHVzZXMgdGhlDQpkaWZmZXJlbnQgZmxhdm9ycyB0byBkZXRlcm1pbmUgZXhhY3RseSB3aGlj
aCBsaW5raW5nIGZsYWdzIHRvIHVzZS4NClRyYW5zcGFyZW50IHJldHJ5aW5nIG1lYW5zIHRoYXQg
dGhpcyBpbmZvcm1hdGlvbiBpcyBsb3N0Lg0KDQpBbHNvIHZlcnkgaW50ZXJlc3RpbmcsIFVidW50
dSB1c2VzIGZlYXR1cmUtbGliYmZkIGZvciB0aGUgc2hhcmVkDQpsaWJyYXJ5LCBmZWF0dXJlLWxp
YmJmZC1saWJlcnR5LXogZm9yIHRoZSBzdGF0aWMgb25lLiANCg0KUm9iZXJ0bw0K
