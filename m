Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134820;
	b=pxblljHrisKgKgWjFsEoxRd5+VaHLeBWGDzLw0LqBhiurcaep+5QSgP5JoQ1228V6bnC
	 9smSBiLwj7XKgSrj/gJj1Upa79rcwapaGqlocm3GCIuOyXsU86RFrG0O6JME5AMIBLV+i
	 gZNhud+WNFBz0OcPehq41y8ZtgS7V5p+pIehpBQRy0pRT6Ye5UyywrsKeNzOHv0CEUA7P
	 /A7OygwJZqHPiQUHL0tPku7AnPWcZ/rk/CxUhY62uSOCGWumuNqt236h1X2V8N+ronX82
	 E7W6HEOJ5yJ6qYQJ3J7gVbde/taE5Tor1ru60y6SSOABC19slTEz4P89u35ZENHLOlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134820;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NUGE27P0RcdhbSY+gyRQWDR8oTXn6lDdw2b9NdqXNPw=;
	b=FKaisjORwF1W8Ds/3NEjIZF+tkG97CJBxaa3rQ9MvoezC3x+9InNbIQctXcFrwa/jLqg
	 phPoY6ytEtKj6n2OS7xdUmJQCkG6JTzPMDc2rihNu4azYxgwNHc70A7P/EIu+ysl8GOSY
	 DwR19fP6CUTZ92vA4v+n9f8NiznbLb+e3MC4QmKl1pKf1pUthG/zrDZLnBYuXMQDGdAhF
	 FGA5HEjc1JJcoxZquuzq3MXNHIdqqS0GNoGqfXW4gu07sseZOJyOIhSSDlmBXy3OLJTuh
	 nPcg21MeuBkIf3WsbEnv+9oHArVy72Jw4j03eXEUc+pWJKPkYHdVz5IhvzL60RRCWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RSpj1Xz7;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79411606A331;
	Fri, 20 Nov 2026 00:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79411606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RSpj1Xz7
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AK0XXZg82986714, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795134813; bh=NUGE27P0RcdhbSY+gyRQWDR8oTXn6lDdw2b9NdqXNPw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RSpj1Xz7Q3TFgzwBVkhxCxA19JkY4oHH/TdQoxjH/06x3pmJVkT+htrpmlGRpsdTI
	 SK5a9WWInrlPT1rPs8JGOV9aGZ4GioISWigQj+vPiMndqFevt7NKlJOM2QpqYNLjo7
	 LGxuibSmk1g7JGIHws3w/V7hzVLcS31cA2o9g6y7XVljX2MHTCugN6iT0/26n0ENfO
	 9ytOVeJmUMj4tsSu6cuItruVshgZ/EIAvQk8PYvEEp/8NURLMW7iUzHg5MKTdP2iJb
	 yKHwkS5mC4L/H63IoxBRbXESGitkNiuvhCbyb/XiYcTOz+7NN3p2Xpd5miMOYkai7B
	 KDdikGYsjwRnw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AK0XXZg82986714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2026 08:33:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:33:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:33:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 20 Nov 2026 08:33:33 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ian Rogers <irogers@google.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Subject: RE: [PATCH] wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C
 command IDs
Thread-Topic: [PATCH] wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C
 command IDs
Thread-Index: AQHdeEirDO2990nzp0y0YWEiO8ZZMrc2HKzA
Date: Fri, 20 Nov 2026 00:33:33 +0000
Message-ID: <8e2a33ce03c74e14bd9f3f4a33833c7b@realtek.com>
References: <20261119170753.1526210-1-irogers@google.com>
In-Reply-To: <20261119170753.1526210-1-irogers@google.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

SWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToNCj4gSW4gcnRsODgyMWFlLCBy
dGw4MTkyZWUsIGFuZCBydGw4MTg4ZWUsIHRoZSBIMkMgcG93ZXItc2F2ZSBjb21tYW5kIGVudW1z
DQo+IGRlZmluZSAweDIwLCAweDIxLCAweDIyLCAweDIzIGZvbGxvd2VkIGJ5ICdIMkNfKl9QMlBf
UFNfT0ZGTE9BRCA9IDAyNCcuDQo+IFRoZSBtaXNzaW5nICd4JyBtYWtlcyAwMjQgYW4gb2N0YWwg
Y29uc3RhbnQgKGRlY2ltYWwgMjAsIDB4MTQpIGluc3RlYWQgb2YNCj4gMHgyNCAoZGVjaW1hbCAz
NiwgbWF0Y2hpbmcgSDJDXzg3MjNCX1AyUF9QU19PRkZMT0FEID0gMHgyNCBpbiBydGw4NzIzYmUN
Cj4gYW5kIHJ0bDh4eHh1KSwgc2VuZGluZyB0aGUgd3JvbmcgSDJDIGNvbW1hbmQgSUQgdG8gZmly
bXdhcmUgZHVyaW5nIFdpLUZpDQo+IERpcmVjdCBQMlAgcG93ZXItc2F2ZSBvZmZsb2FkIHVwZGF0
ZXMuDQo+IA0KPiBDaGFuZ2UgMDI0IHRvIDB4MjQgaW4gYWxsIHRocmVlIGhlYWRlcnMuDQo+IA0K
PiBGb3VuZCB2aWEgaW5zcGVjdGlvbiBvZiBIMkMgY29tbWFuZCBlbnVtcyBkdXJpbmcgYW4geDg2
XzY0IExMVk09MQ0KPiAoQ2xhbmcgMjEuMS44KSBhbGx5ZXNjb25maWcgd2FybmluZyBhdWRpdDsg
Zml4IGFuZCBjaGFuZ2Vsb2cgZHJhZnRlZCB3aXRoDQo+IGFuIEFJIGNvZGluZyBhc3Npc3RhbnQu
IEJ1aWxkLXRlc3RlZCB1bmRlciBMTFZNPTEgVz0xICgtV2Vycm9yKTsgbm90DQo+IHRlc3RlZCBv
biBSZWFsdGVrIFdpLUZpIGhhcmR3YXJlLg0KPiANCj4gRml4ZXM6IGYwZWI4NTZlMGI2YyAoInJ0
bHdpZmk6IHJ0bDgxODhlZTogQWRkIG5ldyBkcml2ZXIiKQ0KPiBGaXhlczogMjFlNGIwNzI2ZGM2
ICgicnRsd2lmaTogcnRsODgyMWFlOiBNb3ZlIGRyaXZlciBmcm9tIHN0YWdpbmcgdG8gcmVndWxh
ciB0cmVlIikNCj4gRml4ZXM6IGIxYTNiZmM5N2NkOSAoInJ0bHdpZmk6IHJ0bDgxOTJlZTogTW92
ZSBkcml2ZXIgZnJvbSBzdGFnaW5nIHRvIHRoZSByZWd1bGFyIHRyZWUiKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+DQoNCkNyb3NzIGNoZWNrIHdpdGgg
dmVuZG9yIGRyaXZlci4gMHgyNCBpcyBjb3JyZWN0LiANCg0KQWNrZWQtYnk6IFBpbmctS2UgU2hp
aCA8cGtzaGloQHJlYWx0ZWsuY29tPg0KDQo=
