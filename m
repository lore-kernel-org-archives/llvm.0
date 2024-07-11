Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DF14F9DD;
	Thu, 11 Jul 2024 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706920; cv=none; b=CciQFpSfb9zQxjfnRxGLsZ2vKPTMkwvKTxdgdxuts4Fwa7z4s5uluLlc7uoBtsauwdqU55vLSqO3Ph9hGig95DJufHq+dbt4tzIdWEOv5Uz+i+kxIHnVf2H3rkL0k7YrUVupYM3j1rvG2XE3WQADiE8CklwsUpWHlDPCVgZ1WZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706920; c=relaxed/simple;
	bh=Gye8/d+1Ts+RLwpU/JmBYvCcCqsTXc4CF60MpmcFJ1Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jhPXMCQDOhi7A2pNLNP4DC4K0AL5iUzRz6bxO9Augk9HCvPCyHXowd7RFamOSJ3mp+5i9mVqxImF8XD7RH/gIl/Lmh45Cog/pd5ut8TC8PCBuKX8HimeGEw4GWbN4Wav+amzGRCtRGrsT7CPtoqUpTyuSUeeXUlWNUT0/xO5VD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WKc383yffz6H8cN;
	Thu, 11 Jul 2024 22:06:28 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 06CC61402C7;
	Thu, 11 Jul 2024 22:08:34 +0800 (CST)
Received: from frapeml500005.china.huawei.com (7.182.85.13) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 16:08:33 +0200
Received: from frapeml500005.china.huawei.com ([7.182.85.13]) by
 frapeml500005.china.huawei.com ([7.182.85.13]) with mapi id 15.01.2507.039;
 Thu, 11 Jul 2024 16:08:33 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Paul Moore <paul@paul-moore.com>, kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [robertosassu:inode-free-security 1/1]
 include/linux/lsm_hook_defs.h:117:1: warning: omitting the parameter name in
 a function definition is a C23 extension
Thread-Topic: [robertosassu:inode-free-security 1/1]
 include/linux/lsm_hook_defs.h:117:1: warning: omitting the parameter name in
 a function definition is a C23 extension
Thread-Index: AQHa03u53syUgmYpX0eaa+Ze5ELtJbHxag0AgAAmgqA=
Date: Thu, 11 Jul 2024 14:08:33 +0000
Message-ID: <3dbcb32d8ac046b1a3c822ab4f9fe339@huawei.com>
References: <202407111803.LoTE3SJX-lkp@intel.com>
 <CAHC9VhT8o--Xwj-0TwBwa-n09qbQJzaYruCVyPtqdY_pw49hWw@mail.gmail.com>
In-Reply-To: <CAHC9VhT8o--Xwj-0TwBwa-n09qbQJzaYruCVyPtqdY_pw49hWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBGcm9tOiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0NCj4gU2VudDog
VGh1cnNkYXksIEp1bHkgMTEsIDIwMjQgMzo1MCBQTQ0KPiBPbiBUaHUsIEp1bCAxMSwgMjAyNCBh
dCA2OjE44oCvQU0ga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gdHJlZTogICBodHRwczovL2dpdGh1Yi5jb20vcm9iZXJ0b3Nhc3N1L2xpbnV4IGlub2Rl
LWZyZWUtc2VjdXJpdHkNCj4gPiBoZWFkOiAgIDgwNGRmNGVjZGFlZDVhYWIxYjRiYTg3NmFjZDIw
NzE5NTA5MGQ5Y2INCj4gPiBjb21taXQ6IDgwNGRmNGVjZGFlZDVhYWIxYjRiYTg3NmFjZDIwNzE5
NTA5MGQ5Y2IgWzEvMV0gbHNtOiBhZGQgdGhlIGlub2RlX2ZyZWVfc2VjdXJpdHlfcmN1KCkgTFNN
DQo+IGltcGxlbWVudGF0aW9uIGhvb2sNCj4gPiBjb25maWc6IHMzOTAtZGVmY29uZmlnIChodHRw
czovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA3MTEvMjAyNDA3MTExODAz
LkxvVEUzU0pYLQ0KPiBsa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiBjb21waWxlcjogY2xhbmcg
dmVyc2lvbiAxOS4wLjBnaXQgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdA0K
PiBhMGM2YjhhZWY4NTNlZWRhYTA5ODBmMDdjMGE1MDJhNWE4YTk3NDBlKQ0KPiA+IHJlcHJvZHVj
ZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNp
L2FyY2hpdmUvMjAyNDA3MTEvMjAyNDA3MTExODAzLkxvVEUzU0pYLQ0KPiBsa3BAaW50ZWwuY29t
L3JlcHJvZHVjZSkNCj4gPg0KPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUg
cGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gPiB0aGUgc2Ft
ZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gfCBSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gfCBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNDA3MTExODAzLkxvVEUzU0pY
LWxrcEBpbnRlbC5jb20vDQo+IA0KPiBGV0lXLCBJIGNhdWdodCB0aGlzIHdoZW4gcmVuYW1pbmcg
dGhlIHBhcmFtZXRlciBiYXNlZCBvbiBvdGhlcg0KPiBmZWVkYmFjayBvbiB0aGUgUkZDIHBhdGNo
OyBpdCB3aWxsIGJlIGNvcnJlY3RlZCB3aGVuIEkgcG9zdCB0aGUgbmV4dA0KPiByZXZpc2lvbi4N
Cg0KT2ssIHBlcmZlY3QuDQoNClJvYmVydG8NCg==
