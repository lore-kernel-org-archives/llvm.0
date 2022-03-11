Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDBC7E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 01:12:48 +0000 (UTC)
Received: from BC-Mail-Ex15.internal.baidu.com (unknown [172.31.51.55])
	by Forcepoint Email with ESMTPS id 87F44E18D9C7DD0F7DF4;
	Fri, 11 Mar 2022 09:12:29 +0800 (CST)
Received: from BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) by
 BC-Mail-Ex15.internal.baidu.com (172.31.51.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Fri, 11 Mar 2022 09:12:29 +0800
Received: from BJHW-Mail-Ex15.internal.baidu.com ([100.100.100.38]) by
 BJHW-Mail-Ex15.internal.baidu.com ([100.100.100.38]) with mapi id
 15.01.2308.020; Fri, 11 Mar 2022 09:12:29 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>, "Danmei
 Wei" <danmei.wei@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: =?gb2312?B?tPC4tDogW2t2bTpxdWV1ZSAxODIvMjA1XSA8aW5saW5lIGFzbT46NDA6MjA4?=
 =?gb2312?Q?:_error:_expected_relocatable_expression?=
Thread-Topic: [kvm:queue 182/205] <inline asm>:40:208: error: expected
 relocatable expression
Thread-Index: AQHYNB5PBIObN5SLb0WBGJKx313uRKy4gA+AgADgzhA=
Date: Fri, 11 Mar 2022 01:12:29 +0000
Message-ID: <a9c62b83c3a342b88eb7600694cdfbf6@baidu.com>
References: <202203100905.1o88Cp2l-lkp@intel.com>
 <YipVB6MiWdjY3HI3@dev-arch.thelio-3990X>
In-Reply-To: <YipVB6MiWdjY3HI3@dev-arch.thelio-3990X>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.22.206.33]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiANCj4gSXQgbG9va3MgbGlrZSB0aGVyZSBpcyBhIG5ldyByZXZpc2lvbiBvZiB0aGUgcGF0Y2gg
dGhhdCBzaG91bGQgcmVzb2x2ZSB0aGlzLg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8xNjQ2ODkxNjg5LTUzMzY4LTEtZ2l0LXNlbmQtZW1haWwtbGlyb25ncWluZ0BiYWlkdQ0KPiAu
Y29tLw0KPiANCj4gSXQgaGFwcGVucyB3aXRoIEdDQyAvIEdOVSBhcyB0b28uDQo+IA0KPiAvdG1w
L2NjNmdyaEt2LnM6IEFzc2VtYmxlciBtZXNzYWdlczoNCj4gL3RtcC9jYzZncmhLdi5zOjUyOiBF
cnJvcjogaW52YWxpZCBvcGVyYW5kcyAoKlVORCogYW5kIC5kYXRhIHNlY3Rpb25zKSBmb3IgYCsn
DQo+IA0KDQpJIGFtIHNvcnJ5IGFib3V0IHRoaXMsIEkgc2VuZCBhIG5ldyB2ZXJzaW9uLCBpdCBz
aG91bGQgYmUgZml4ZWQNCg0KVGhhbmtzDQoNCi1MaXJvbmdxaW5nDQoNCj4gQ2hlZXJzLA0KPiBO
YXRoYW4NCg==
