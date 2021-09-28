Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C953FCB
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 01:26:52 +0000 (UTC)
X-UUID: 0472ea340c5f4a6cafb182f94f6d8091-20210928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BLlymuonkhKMUQNrGodsUw+v+u1VEea3dRqmgRuo/6A=;
	b=hX0CKKRGGXvxUqmTKxm69Qff3MSfxXB+BDGIXBGCPgyNsgAkiJT+aVwClbYTf2LH8MOYfhmdNk3NJ2xzSd9TTOk00EEXpZ4TynemgAwx34GXJ4ullZ9Olx/ndzpmlmBrnJTvnuII0CGaK0JPEy/w7CfQ4HXpkVlFG3pdjJso4qY=;
X-UUID: 0472ea340c5f4a6cafb182f94f6d8091-20210928
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1292667397; Tue, 28 Sep 2021 09:21:40 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 09:21:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Sep 2021 09:21:38 +0800
Message-ID: <d7db3e4c3c4a40843d60fe92666d7f9e90df8801.camel@mediatek.com>
Subject: Re: [PATCH] iommu/mediatek: fix out-of-range warning with clang
From: Yong Wu <yong.wu@mediatek.com>
To: Arnd Bergmann <arnd@kernel.org>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tomasz Figa <tfiga@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Date: Tue, 28 Sep 2021 09:21:41 +0800
In-Reply-To: <20210927121857.941160-1-arnd@kernel.org>
References: <20210927121857.941160-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTA5LTI3IGF0IDE0OjE4ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gY2xhbmctMTQgbm90
aWNlcyB0aGF0IGEgY29tcGFyaXNvbiBpcyBuZXZlciB0cnVlIHdoZW4NCj4gQ09ORklHX1BIWVNf
QUREUl9UXzY0QklUIGlzIGRpc2FibGVkOg0KPiANCj4gZHJpdmVycy9pb21tdS9tdGtfaW9tbXUu
Yzo1NTM6MzQ6IGVycm9yOiByZXN1bHQgb2YgY29tcGFyaXNvbiBvZg0KPiBjb25zdGFudCA1MzY4
NzA5MTIwIHdpdGggZXhwcmVzc2lvbiBvZiB0eXBlICdwaHlzX2FkZHJfdCcgKGFrYQ0KPiAndW5z
aWduZWQgaW50JykgaXMgYWx3YXlzIGZhbHNlIFstV2Vycm9yLC1XdGF1dG9sb2dpY2FsLWNvbnN0
YW50LW91dC0NCj4gb2YtcmFuZ2UtY29tcGFyZV0NCj4gICAgICAgICBpZiAoZG9tLT5kYXRhLT5l
bmFibGVfNEdCICYmIHBhID49DQo+IE1US19JT01NVV80R0JfTU9ERV9SRU1BUF9CQVNFKQ0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn4NCj4gXiAgfn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCj4gDQo+IEFkZCBhbiBleHBsaWNpdCBjaGVjayBmb3IgdGhlIHR5
cGUgb2YgdGhlIHZhcmlhYmxlIHRvIHNraXAgdGhlIGNoZWNrDQo+IGFuZCB0aGUgd2FybmluZyBp
biB0aGF0IGNhc2UuDQo+IA0KPiBGaXhlczogYjRkYWQ0MGU0ZjM1ICgiaW9tbXUvbWVkaWF0ZWs6
IEFkanVzdCB0aGUgUEEgZm9yIHRoZSA0R0INCj4gTW9kZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBZb25nIFd1IDx5b25n
Lnd1QG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzLg0K

