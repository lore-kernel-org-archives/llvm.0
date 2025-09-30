Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE42147E6
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221988; cv=none; b=fLemX9F5QruWzr+U3TKlPert2T0vQl+LdPuR512X+eb8bUwV4oReA8QstEOeZ33QZn9uONChvlGyBrn0HXig/8wZ5qalxlrlPCOmoaBeo2dTLz0gPu7N1MFlQfekfggP2pbArv8hrv0jWS9XNFby0kJC8YxGPC3DgxGevBqridM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221988; c=relaxed/simple;
	bh=n073neUCiDTGhaEDHA2IjeRoyHl37uk5yKvHEz0WeF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8ho38r5OAZaMw9WbpwhI5R9eg4IrlTkvlzFa6VK8x73TiuJGaxDy5F3XauEvzLexYaPuIMAftLGCpCbEjF4W4FyWynp8DPbFamqPdpwwEo8F2hFHadCloWYXyofi7+rc0ud12s0lq+5pD9fbwaJRI6JtFPawJ6tiqN4HlTMRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XyycLaX7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XyycLaX7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso355083866b.3
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759221985; x=1759826785; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n073neUCiDTGhaEDHA2IjeRoyHl37uk5yKvHEz0WeF0=;
        b=XyycLaX7svbRW2u1Z+QyRVoj0mFawws4vYkFn1os5Aow/eeaJYRBINCRlCjVTJ2Nmm
         OJV1CwUtoePwLU0kl/jR6oSjhTQRHvMcO/oZ3xOebSEqmjI7YMDPu15Bxu1XHR450/L1
         3As69yFhzI8iD12cpcBT3mZKw8+YUtjS61gkxctGkPHJxcSd/OxM/cpl+xxh8eQg7fT+
         R/oW0n3lZUnLRDJAbxRPKTUk7kC+/CLkKOTVEgr5gKQW6Kry3IntJTiDjZdReh4rus7j
         9iUR5tecMYSDWP5YhDdyy+tJsra3FpjMhmKw8GxYoicqKV9/0pGxQ9w098J88dMMZgA9
         StoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221985; x=1759826785;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n073neUCiDTGhaEDHA2IjeRoyHl37uk5yKvHEz0WeF0=;
        b=IxYOEDhmIFwPOjcrQFnmOegq0zKRglsUw9BRvxRPQFm2gynVdYrkj7yJdQIfiXXLwO
         1wGrUB91rQKlqmK4JO69DAb2H4laMx5B5uqmaBgdbwhvUZ0jPw/6Hm4isLPHuFA+YLwh
         tWK9nXbXFqnWtpTx/JJlN/rS6Hnw73JA9jR432e5QHBlZRcASNH/CZg7Y8JSTprrHwJe
         12PTLG2q8aCMtaZO342sSwyM6DVRZnxwe39MPKW+WRdCNVCqXJUNoOTRs6Z+fu2xIU4O
         /tKhydQ1FPtNJepVCWe6ChEbkLSTwQvMgLG5AdPwQ9MBz4GhKfOYXWiEB+Qo+kiJYjPt
         Jf7w==
X-Forwarded-Encrypted: i=1; AJvYcCXI81Jc52ssV/PrpRCYQ9CClpxDmGB/uc0dnqRKnzNGoSaj7uP1TukwkrM2NLe1hg4LcSwm@lists.linux.dev
X-Gm-Message-State: AOJu0YxVnr6YHzdPPUSI+Pmr13u9cV0EWDeZYyKsShhOT72HxwzPXUZx
	64EmfIekug7ikFTQ2BwHdDl9vioOxytlwSQxWclHLNgSI/NT0SdXEyNDD24Fkc8UK0g=
X-Gm-Gg: ASbGncuwFw6MeJDdoptlNQu+WffizZjYojChUtl77vi99WI00b3iuiWKga6IddzYtqM
	43mpDZ/iUBR7hXft81C/7esVOeg4BPfpDoa+AwZ+iR2FwCE0X9QQQFEIGZsh5Krc+Xw5iWmirIv
	7hktoYeJaZ7m+/nusKtYfJM96eA6iGT1zPiIGNqbNkB3yQPpQSsr0K8BwJ72uAjzp8NOqtK9XJQ
	F4CF5zsC9uy8RPo5nj8DHHbMHWCh4mzG1rACxUMou0AMO2elL/GJXLk4H4cyhQNKMCEYdWItiDO
	yExmwd9dgFp9ffNvW/nfwPwU5ThOguxrPjeUKEvopwQ3z23avEvG0JhI+WRTK/w1luMfKRnb3eU
	kO9s+DhkF7CsGEtDcMA+EDWAdS9TNNxm1aaM/Mj4f4s5fWFVq4Zyk+q+e4GTT5pxsmfeCM9o+qb
	Mx9e2aZd7feZVoXOa2s/jCwsJEztM9GIo7gXd8ukx319PkWbekki81JXIFTXET5YRFVsrHLjPSZ
	gF45yg=
X-Google-Smtp-Source: AGHT+IHxsEMyNpkOmoP1U/w50PEW9dqktFGCuYCKbZWdgaPwWE+RQg0SNgb7DMeYUYG17C1wAJEwQA==
X-Received: by 2002:a17:907:969f:b0:b3f:e1e9:22c1 with SMTP id a640c23a62f3a-b3fe1e92469mr628491566b.53.1759221984572;
        Tue, 30 Sep 2025 01:46:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86? (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de. [2003:e5:873f:400:7b4f:e512:a417:5a86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9769bsm1105990566b.99.2025.09.30.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:46:24 -0700 (PDT)
Message-ID: <2df26cc0-53bc-499c-8c78-bc24fd8bf882@suse.com>
Date: Tue, 30 Sep 2025 10:46:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] x86/msr: Use the alternatives mechanism for
 WRMSR
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, llvm@lists.linux.dev,
 xin@zytor.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-10-jgross@suse.com>
 <20250930083137.GH3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250930083137.GH3245006@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WyvLv7FPqaRR3LZWOKqhQ93Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WyvLv7FPqaRR3LZWOKqhQ93Q
Content-Type: multipart/mixed; boundary="------------aKTd8pK9QFbBkB2G6cgX0bFZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, llvm@lists.linux.dev,
 xin@zytor.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <2df26cc0-53bc-499c-8c78-bc24fd8bf882@suse.com>
Subject: Re: [PATCH v2 09/12] x86/msr: Use the alternatives mechanism for
 WRMSR
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-10-jgross@suse.com>
 <20250930083137.GH3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250930083137.GH3245006@noisy.programming.kicks-ass.net>

--------------aKTd8pK9QFbBkB2G6cgX0bFZ
Content-Type: multipart/mixed; boundary="------------N30kQOTdZwedXtdN5VMqEbar"

--------------N30kQOTdZwedXtdN5VMqEbar
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDkuMjUgMTA6MzEsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBUdWUsIFNl
cCAzMCwgMjAyNSBhdCAwOTowMzo1M0FNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiANCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgX193cm1zcnFfY29uc3RhbnQo
dTMyIG1zciwgdTY0IHZhbCwgaW50IHR5cGUpDQo+PiArew0KPj4gKwlCVUlMRF9CVUdfT04o
IV9fYnVpbHRpbl9jb25zdGFudF9wKG1zcikpOw0KPj4gKw0KPj4gKwlhc21faW5saW5lIHZv
bGF0aWxlIGdvdG8oDQo+PiArCQkiMTpcbiINCj4+ICsJCUFMVEVSTkFUSVZFXzIoUFJFUEFS
RV9SQ1hfUkRYX0ZPUl9XUk1TUg0KPj4gKwkJCSAgICAgICIyOiBkcyB3cm1zciIsDQo+PiAr
CQkJICAgICAgUFJFUEFSRV9SQ1hfUkRYX0ZPUl9XUk1TUg0KPj4gKwkJCSAgICAgIEFTTV9X
Uk1TUk5TLA0KPj4gKwkJCSAgICAgIFg4Nl9GRUFUVVJFX1dSTVNSTlMsDQo+PiArCQkJICAg
ICAgQVNNX1dSTVNSTlNfSU1NLA0KPj4gKwkJCSAgICAgIFg4Nl9GRUFUVVJFX01TUl9JTU0p
DQo+PiArCQlfQVNNX0VYVEFCTEVfVFlQRSgxYiwgJWxbYmFkbXNyXSwgJWNbdHlwZV0pCS8q
IEZvciBXUk1TUk5TIGltbWVkaWF0ZSAqLw0KPj4gKwkJX0FTTV9FWFRBQkxFX1RZUEUoMmIs
ICVsW2JhZG1zcl0sICVjW3R5cGVdKQkvKiBGb3IgV1JNU1IoTlMpICovDQo+PiArDQo+PiAr
CQk6DQo+PiArCQk6IFt2YWxdICJhIiAodmFsKSwgW21zcl0gImkiIChtc3IpLCBbdHlwZV0g
ImkiICh0eXBlKQ0KPj4gKwkJOiAibWVtb3J5IiwgImVjeCIsICJyZHgiDQo+PiArCQk6IGJh
ZG1zcik7DQo+PiArDQo+PiArCXJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICtiYWRtc3I6DQo+
PiArCXJldHVybiB0cnVlOw0KPj4gK30NCj4gDQo+IEp1c3Qgd29uZGVyaW5nLCB3b3VsZCBz
b21ldGhpbmcgdGhpcyB3b3JrPw0KPiANCj4gCWFzbV9pbmxpbmUgdm9sYXRpbGUgZ290bygN
Cj4gCQkiMTpcbiINCj4gCQlBTFRFUk5BVElWRShQUkVQQVJFX1JDWF9SRFhfRk9SX1dSTVNS
DQo+IAkJCSAgICAiMjpcbiINCj4gCQkJICAgIEFMVEVSTkFUSVZFKCJkcyB3cm1zciIsDQo+
IAkJCSAgICAgICAgICAgICAgICBBU01fV1JNU1JOUywgWDg2X0ZFQVRVUkVfV1JNU1JOUyks
DQo+IAkJCSAgICBBU01fV1JNU1JOU19JTU0sIFg4Nl9GRUFUVVJFX01TUl9JTU0pOw0KPiAJ
CV9BU01fRVhUQUJMRV9UWVBFKDFiLCAlbFtiYWRtc3JdLCAlY1t0eXBlXSkJLyogRm9yIFdS
TVNSTlMgaW1tZWRpYXRlICovDQo+IAkJX0FTTV9FWFRBQkxFX1RZUEUoMmIsICVsW2JhZG1z
cl0sICVjW3R5cGVdKQkvKiBGb3IgV1JNU1IoTlMpICovDQo+IA0KPiAJCToNCj4gCQk6IFt2
YWxdICJhIiAodmFsKSwgW21zcl0gImkiIChtc3IpLCBbdHlwZV0gImkiICh0eXBlKQ0KPiAJ
CTogIm1lbW9yeSIsICJlY3giLCAicmR4Ig0KPiAJCTogYmFkbXNyKTsNCj4gDQo+IEl0cyBh
IGJpdCB3ZWlyZCBiZWNhdXNlIHRoZSBuZXN0ZWQgYWx0ZXJuYXRpdmUgaXNuJ3QgZm9yIHRo
ZSBleGFjdCBzYW1lDQo+IHBvc2l0aW9uIEkgc3VwcG9zZS4gQnV0IEkgZmluZCBpdCBhIG1v
cmUgcmVhZGFibGUgZm9ybS4NCg0KSSBkb24ndCB0aGluayBpdCB3b3VsZCB3b3JrLiBOZXN0
ZWQgQUxURVJOQVRJVkUoKXMgZG8gd29yayBvbmx5IHdpdGgNCmFsbCBvZiB0aGVtIHN0YXJ0
aW5nIGF0IHRoZSBzYW1lIGxvY2F0aW9uLiBIYXZlIGEgbG9vayBhdCB0aGUNCkFMVEVSTkFU
SVZFKCkgbWFjcm8sIHdoaWNoIGlzIGRlZmluaW5nIHRoZSBsYWJlbCAiNzcxIiB2aWEgT0xE
SU5TVFIoKQ0KYW5kIHRoZW4gcmVmZXJyaW5nIHRvIHRoaXMgbGFiZWwgdmlhIEFMVElOU1RS
X0VOVFJZKCkuIEluIHlvdXIgY2FzZQ0KdGhlIEFMVElOU1RSX0VOVFJZKCkgb2YgdGhlIG91
dGVyIEFMVEVSTkFUSVZFKCkgaW52b2NhdGlvbiB3b3VsZCBmaW5kDQp0aGUgd3JvbmcgIjc3
MSIgbGFiZWwgKHRoZSBvbmUgb2YgdGhlIGlubmVyIEFMVEVSTkFUSVZFKCkpLg0KDQpBbGxv
d2luZyBzdWNoIGNvbnN0cnVjdHMgd291bGQgcHJvYmFibHkgcmVxdWlyZSBzd2l0Y2hpbmcg
ZnJvbSBwcmVwcm9jZXNzb3INCm1hY3JvcyB0byBhc3NlbWJsZXIgbWFjcm9zLg0KDQoNCkp1
ZXJnZW4NCg==
--------------N30kQOTdZwedXtdN5VMqEbar
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------N30kQOTdZwedXtdN5VMqEbar--

--------------aKTd8pK9QFbBkB2G6cgX0bFZ--

--------------WyvLv7FPqaRR3LZWOKqhQ93Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjbmN8FAwAAAAAACgkQsN6d1ii/Ey/F
awf/fno3luNeDyyPCvIMnrq1g+67KuO6WYcxOoweSiZcMtyPM9Uz5GnGBU9o7sorklegCHuQQ4al
ZffznYe40JhyZ9tNG8AxL4Lmo8j0CPbTOJXCL0m99rJMR3LpVFboU8fFeOe14jjewN+yw3u6RES4
D9BAlUnTfwrXVZf7z5wg1H3kwU6NXhUBNHfQxYDBCfI8qVmlmGI9GAWZp+Opj+4cdfwThp7iMuda
p2aF1Kvs4z0V/o+EmepBogTBccSFvbT0SW2mZvty3nPMIuELOA9UstzbESAqfwyshMD+H+rWJbTu
HVQb02U5G64+ieSeh0Aqe+FVohJKU4NcvgevOp0rlw==
=bYlT
-----END PGP SIGNATURE-----

--------------WyvLv7FPqaRR3LZWOKqhQ93Q--
