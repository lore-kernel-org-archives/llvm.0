Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191E24A7C9
	for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037935; cv=none; b=bM1VhM++Ive8XUY0aooUm+eyBEuKaSox30Y6+vOaJZw0OfNxs4iPzJbRvLG2QA5e3JQ3jpbiwmlclbs64fhhccztQ+tnhbChYCXD13GomDwB0MU7Y3/PZSiNPVY4+6XeIgvXQUklGItoGytspPYm3oKJ/TysOH1GN9s1sZC4RV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037935; c=relaxed/simple;
	bh=HeD4vbuuMHaAUYRozT0nimXyvHpbDEcXMiVPDEb9xi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKU+7SoWLyvRNidNKvZp9cANZXQoNqwNs3cWTIp5tkGvGD48VgGtb8XhXFwhSlu1PqLI87xljDpu/nghYHJsFNTxt48ihjgaFU9etlhZVr14YLdP5XHUdORQoBwIPLH+GP3YxagHQD+J5gm5Q5XiyNmC3MLdnsUDmknCxVhx5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UMQxc4gN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UMQxc4gN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so568901f8f.0
        for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737037932; x=1737642732; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HeD4vbuuMHaAUYRozT0nimXyvHpbDEcXMiVPDEb9xi0=;
        b=UMQxc4gNmPGLOufmWQOv4OVXQ3UJXKL7G9pMr3bhBC5JMAnGPqOwDDYiSxmszlXKHl
         a1yuWSAvYAkBIAN92U66b4uOxKEg52suLBFTEjeIL5Bzn2Jc2hiYgCsWxhhBgvL8twSH
         6RyUsdvRcx0xoVjprTIuSJcfCRbPMLQBWtUNSVGUVJpJuOwLmfVdZoDrUAGErgE2+4gw
         eeyZZ8qRkHApHb6ui6vihqXCoX+TJ05nKHLKZgXFl5r63wBPPJVnfagoBpfwEzW8ORlN
         zKOJIjx6S+m6QmnyieaMnCm3px4xflSqBEktRrw7FLrQyZInItTVS63ToUEKsDa54vDs
         xIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737037932; x=1737642732;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeD4vbuuMHaAUYRozT0nimXyvHpbDEcXMiVPDEb9xi0=;
        b=u5Nq8omEKYKzolZph1oR5ecBAzP3NGM184nrHjB1aLUZtn1rKs8/cCeWbBaaSW5/y7
         vWHJoA+Q1MaQ5T3w6nsR8XLE0kh6J7R48GaxdxYjEeIRyExFqj0G1vUCrYrbVBtiEVI/
         IrxLfnBMIboNy0McgFUjS4NeNWwmBCR8PCQgkdJdCn+3M1PnypQJJEow8SGdAbb4wFnA
         aS3ThRfCIbB2b2MogWSERZOTZ+mVaM5nYjJUc7b75vZPiU0gvSzufLc4Fh32TW0Nyswx
         JqyTFQGONdwHVLeC0vEWvL0leQFwUk71g3CiGaqOZGmX6PYcmXtQbsf6UW+d7fcVbJ4d
         tifw==
X-Forwarded-Encrypted: i=1; AJvYcCVziL/Eh5sdgkB33zngiq+gNijhszItmpzcXcQtAwcRlmDMzBrXkNsYAlNuRhkCoCe385Fi@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6sBseyT4XzygoqA3h/3ipGny9KQ8ma5NzyGH+1m/1sfwPS06Z
	PPykfgjKzfCwUG+itXkoNQYn/9BT9aUjGBpBiAN83aq2nB2rGaVnC1js7kUtWS4=
X-Gm-Gg: ASbGncvddu80qmYi0cRZ9uX6piXebmdrD32g28YQBiR+14POhZfpszM/cPvhc+85lHe
	FkkwiHQGnN5Ha6zDHDEBk08lEc0vGJbXv6MhPsgB97R0eG40G7KD3KujZGcK5gwIiJ0ld/3RnWM
	R3uYny5QjKq0YyXMD616do98e27QWwloNO/53Iwz4yOwqY4/7QbY9mdjP5a3NDRiQXlEUQVgV9s
	eA8e7qcCoEe4nV4zPznNaowJGmZIUv1L//aTdVu8rKmAoe+8Mg/yThE4XDiQayt8g/mcnVbYv5s
	vW9XH8Ivtwh1xYNDNg7bBEDbvc31IMLcPJVOSQORDQwC9U6xYT6dAqJZzq8CpVQLSmbb8GamtQ9
	u3TXbhw==
X-Google-Smtp-Source: AGHT+IFfVuow8gjbNlxCzPB+h1PiQ6M/UMTPHFPAcxLFTyAqCQzjX60tVkUugqqgwTjoqdegJFTnUg==
X-Received: by 2002:a05:6000:184e:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38a872c93e3mr30716855f8f.10.1737037931946;
        Thu, 16 Jan 2025 06:32:11 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595? (p200300e587312800842d42a059923595.dip0.t-ipconnect.de. [2003:e5:8731:2800:842d:42a0:5992:3595])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499942sm60981805e9.6.2025.01.16.06.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 06:32:11 -0800 (PST)
Message-ID: <14145470-070f-4249-8d6b-1a35a1b3ef21@suse.com>
Date: Thu, 16 Jan 2025 15:32:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/asm: Always inline serialize()
To: Nathan Chancellor <nathan@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, Sean Christopherson <seanjc@google.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250116-always-inline-serialize-for-noinstr-v1-1-b7a37b2af04b@kernel.org>
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
In-Reply-To: <20250116-always-inline-serialize-for-noinstr-v1-1-b7a37b2af04b@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SVLlXjV08wpGpOkaooPRgk02"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SVLlXjV08wpGpOkaooPRgk02
Content-Type: multipart/mixed; boundary="------------Nmo2DBNUBS6zyDtwZNRuk0ZW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Nathan Chancellor <nathan@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, Sean Christopherson <seanjc@google.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Message-ID: <14145470-070f-4249-8d6b-1a35a1b3ef21@suse.com>
Subject: Re: [PATCH] x86/asm: Always inline serialize()
References: <20250116-always-inline-serialize-for-noinstr-v1-1-b7a37b2af04b@kernel.org>
In-Reply-To: <20250116-always-inline-serialize-for-noinstr-v1-1-b7a37b2af04b@kernel.org>

--------------Nmo2DBNUBS6zyDtwZNRuk0ZW
Content-Type: multipart/mixed; boundary="------------TZbndA0OEsSX5WH2pS0kkfic"

--------------TZbndA0OEsSX5WH2pS0kkfic
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDEuMjUgMTU6MjgsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOg0KPiBzZXJpYWxp
emUoKSBtYXkgYmUgY2FsbGVkIGZyb20gbm9pbnN0ciBjb2RlIGFuZCBpZiBpdCBpcyBub3Qg
aW5saW5lZCwNCj4gb2JqdG9vbCBtYXkgd2FybiBsaWtlOg0KPiANCj4gICAgdm1saW51eC5v
OiB3YXJuaW5nOiBvYmp0b29sOiBfX3N0YXRpY19jYWxsX3VwZGF0ZV9lYXJseSsweDJhOiBj
YWxsIHRvIHNlcmlhbGl6ZSgpIGxlYXZlcyAubm9pbnN0ci50ZXh0IHNlY3Rpb24NCj4gDQo+
IE1hcmsgc2VyaWFsaXplKCkgd2l0aCBfX2Fsd2F5c19pbmxpbmUgdG8gY2xlYXIgdXAgdGhl
IHdhcm5pbmcgYW5kDQo+IHByZXZlbnQgZnV0dXJlIG9uZXMgZnJvbSBvY2N1cnJpbmcuDQo+
IA0KPiBGaXhlczogMGVmODA0N2I3MzdkICgieDg2L3N0YXRpYy1jYWxsOiBwcm92aWRlIGEg
d2F5IHRvIGRvIHZlcnkgZWFybHkgc3RhdGljLWNhbGwgdXBkYXRlcyIpDQo+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy8yMDI0MTIxODE3NTYuYUp2emloMkstbGtwQGludGVsLmNv
bS8NCj4gUmVwb3J0ZWQtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUu
Y29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL1o0YlduV1lxdTFMYUQt
SkdAZ29vZ2xlLmNvbS8NCj4gUmVwb3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFs
IFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9DQStHOWZZdi1BZ2VVcFAxeVBEbXk0OFQ4NjlNczgwamdVZGpud3RCTm9KbUNL
UXZaRFFAbWFpbC5nbWFpbC5jb20vDQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2Vs
bG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9h
c20vc3BlY2lhbF9pbnNucy5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3NwZWNpYWxfaW5zbnMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NwZWNp
YWxfaW5zbnMuaA0KPiBpbmRleCBmYWI3YzhhZjI3YTRkMDA2NDdmMmY1MmU3ZmU0ZjkxYmQ0
MmE3MjkxLi4wM2U3YzJkNDk1NTk3NTk3YTYzNWY4MzExNmZhZmExYTk1ZWQzNTdlIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zcGVjaWFsX2luc25zLmgNCj4gKysr
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc3BlY2lhbF9pbnNucy5oDQo+IEBAIC0yMTEsNyAr
MjExLDcgQEAgc3RhdGljIGlubGluZSBpbnQgd3JpdGVfdXNlcl9zaHN0a182NCh1NjQgX191
c2VyICphZGRyLCB1NjQgdmFsKQ0KPiAgIA0KPiAgICNkZWZpbmUgbm9wKCkgYXNtIHZvbGF0
aWxlICgibm9wIikNCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBzZXJpYWxpemUodm9p
ZCkNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBzZXJpYWxpemUodm9pZCkNCj4g
ICB7DQo+ICAgCS8qIEluc3RydWN0aW9uIG9wY29kZSBmb3IgU0VSSUFMSVpFOyBzdXBwb3J0
ZWQgaW4gYmludXRpbHMgPj0gMi4zNS4gKi8NCj4gICAJYXNtIHZvbGF0aWxlKCIuYnl0ZSAw
eGYsIDB4MSwgMHhlOCIgOjo6ICJtZW1vcnkiKTsNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1p
dDogMzdiYzkxNWM2YWQwZmI4YTE5MmRhZmI2YjcwNDZjNzljYWQxZjRhMg0KPiBjaGFuZ2Ut
aWQ6IDIwMjUwMTE2LWFsd2F5cy1pbmxpbmUtc2VyaWFsaXplLWZvci1ub2luc3RyLTRlOWU5
ODI2ZDk2Nw0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQpJIGhhdmUgc2VudCB0aGUgdmVyeSBz
YW1lIHBhdGNoIG9uIERlYy4gMTh0aCBhbHJlYWR5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------TZbndA0OEsSX5WH2pS0kkfic
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TZbndA0OEsSX5WH2pS0kkfic--

--------------Nmo2DBNUBS6zyDtwZNRuk0ZW--

--------------SVLlXjV08wpGpOkaooPRgk02
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmeJGGoFAwAAAAAACgkQsN6d1ii/Ey8A
0wgAnTIMGS6KhcLIc8Ea/jf6p0PE2f7lcNU4rP0J3LCC4h6bkgxpIjhvk/m2w0u98v7ZJbkIsxBY
NTBEHRbDn3fh9PVQrZrJIwFuSAfpw6vmIkCnMJ1eAPa6fct8WaozoBGl3E4s5H4SpcgB519IZ7Vi
sybmoq1ix28amD/jriLTQ9Ua7OIznTjqCY//7cgmtU9OK1STL2Z4o9Yl4ERB7Gnq3z0nxhYcVtVa
X0555RwZg+QaNLiq2W3LgHhBQYGl9DT1HZZATXVH/fuNrcWgu2XmDCbazTg823SKVuHQVAb9PiJZ
M3oXVkxJKjsJ1yimdBJuOhRWeqqff+GPSNffvyN/Og==
=DH7+
-----END PGP SIGNATURE-----

--------------SVLlXjV08wpGpOkaooPRgk02--
