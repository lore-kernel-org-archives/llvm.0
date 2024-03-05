Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569912D1E3
	for <llvm@lists.linux.dev>; Tue,  5 Mar 2024 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677638; cv=none; b=fjju8XMCobWaPzrM4UAtgrNurAkmlNKNy2T5Io/Jp7MFHIlLRbkS6cFWdtZXbSpCup45KZz5758Id/VkMrh5ZLf/jLAc6c/DRjFa914B84YaS+SgvXY1wD+UZTdvUqQCjJ/lfHWtjdOdofkYHj/uXLKvS6KIAyNrA0y+7jOzAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677638; c=relaxed/simple;
	bh=bYc9L7HlDm2hkqlssVjo7NtERK28vedmgtRhTBdRECU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dYmye6dmME1DcfdRUZ3lidWt5qxpODfcj6te3yC8YbQuQlqOp0ZVUY+k4NTpY94rz79oUnHguryJQ1Tt7b9Tc3TDifx0664nOiPEHuxcxUkGE2XS1vWpKHongYzgE63ZnJiU75y5Vd//p6tb6X9Qt2kVRANvrLrjDS3u0XQR5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=k6gJZTrY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="k6gJZTrY"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AF9D72C0242;
	Wed,  6 Mar 2024 11:27:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709677627;
	bh=bYc9L7HlDm2hkqlssVjo7NtERK28vedmgtRhTBdRECU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=k6gJZTrY1GwRiZZihV3PQ50tuZ21bJjPi9GdRoIAs46ka7/rrtjdiAK/RJiNurLGK
	 fmH/schL9fMfvgyouDm2U0HaKg8L+eM4yrLbOoa3mZvJNkn0gUrfkS2nqPc3qK/RYI
	 x4/Ko7/pHjB0LNnVKxNOfKZOJmdzIgeFjjdLvnPhn0/Eb8RWb8A/QQC263yFPtudC8
	 1PHTdnjJ/9qOMUn68yUP+SpXCdwGae61UX62FTQechwYYMNTDlEDcf1cOJnjS4Zsi3
	 dFE4Fs50DUeVdsz1M4is6uBexVCPLg7apq52bxytW2+cQz9o0cG0OpOpIP0/74C3Tk
	 XBRUQVHiFZzuQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e79c3b0000>; Wed, 06 Mar 2024 11:27:07 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Mar 2024 11:27:07 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 6 Mar 2024 11:27:07 +1300
From: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"wsa-dev@sang-engineering.com" <wsa-dev@sang-engineering.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "lkp@intel.com" <lkp@intel.com>,
	"arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [linux-next:master 11602/11963] ERROR: modpost:
 "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
Thread-Topic: [linux-next:master 11602/11963] ERROR: modpost:
 "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
Thread-Index: AQHabv9juI5YF/G6tkKCIT2lDlEfhbEo4JaA
Date: Tue, 5 Mar 2024 22:27:07 +0000
Message-ID: <6da20a8cf84d358841068e7eff3323b6d61e014b.camel@alliedtelesis.co.nz>
References: <202403052102.hlG8I44z-lkp@intel.com>
In-Reply-To: <202403052102.hlG8I44z-lkp@intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <00711BCFE0F0F749B0CDCDCF7A5F1A04@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e79c3b a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=fzn4atkRgMAA:10 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=nR2biY2A73J2IUppVHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

T24gVHVlLCAyMDI0LTAzLTA1IGF0IDIxOjE1ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gDQo+ID4gPiBFUlJPUjogbW9kcG9zdDogImFjcGlfZGV2aWNlX25vdGlmeV9yZW1vdmUi
IFtkcml2ZXJzL2kyYy9pMmMtDQo+ID4gPiBjb3JlLmtvXSB1bmRlZmluZWQhDQo+IA0KDQpNeSBy
ZWNlbnQgY2hhbmdlIGludHJvZHVjZWQgYSBidWlsZCBmYWlsdXJlIHdoZW4gYnVpbGRpbmcgYXMg
YSBtb2R1bGUuDQoNCkVSUk9SOiBtb2Rwb3N0OiAiYWNwaV9kZXZpY2Vfbm90aWZ5X3JlbW92ZSIg
W2RyaXZlcnMvaTJjL2kyYy1jb3JlLmtvXQ0KdW5kZWZpbmVkIQ0KDQpJIHRoaW5rIHRoZSBpc3N1
ZSBpcyB0aGF0IEkgY2FsbGVkIGFjcGlfZGV2aWNlX25vdGlmeV9yZW1vdmUoKSB3aGljaCBpcw0K
bm90IGV4cG9ydGVkIChpLmUuIG5vIEVYUE9SVF9TWU1CT0xfR1BMKS4NCg0KSSdtIG5vdCBzdXJl
IGlmIHRoZSBjb3JyZWN0IGZpeCBpcyB0byBtYXJrIGFjcGlfZGV2aWNlX25vdGlmeV9yZW1vdmUo
KQ0KYXMgZXhwb3J0ZWQgKG15IGd1dCBzYXlzIG5vKSwgb3IgdG8gaW5zdGVhZCBtb2RpZnkgbXkg
bmV3IGNvZGUgdG8gY2FsbA0KdGhlIGFscmVhZHkgZXhwb3J0ZWQgYWNwaV91bmJpbmRfb25lKCkg
LSBhY3BpX3VuYmluZF9vbmUoKSBpcyBhbHJlYWR5DQpleHBvcnRlZC4gDQpJIHdhcyBvbmx5IGNh
bGxpbmcgYWNwaV9kZXZpY2Vfbm90aWZ5X3JlbW92ZSgpIHRvIHRyaWdnZXINCmFjcGlfdW5iaW5k
X29uZSgpIGFueXdheSwgc28gdGhhdCBzZWVtcyBsaWtlIHdoYXQgSSBzaG91bGQgZG8uDQoNClBs
ZWFzZSBsZXQgbWUga25vdyB3aGljaCBmaXggaXMgcHJlZmVycmVkIGFuZCBJIHdpbGwgcHJlcGFy
ZSBhIGZpeCB0bw0KdGhlIG9yaWdpbmFsIHBhdGNoLg0KDQpUaGFua3MsDQpIYW1pc2ggTQ0K
