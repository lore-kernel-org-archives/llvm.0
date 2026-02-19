Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A232F1FFE
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 06:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483449; cv=none; b=dF2Qxyu5D2o4mn4JmZWW8gMrjYaGRJyAQwhkR8oM1cnaGTOJwkin2B0tvep8mPsgyArd6WtmjZeerI3ACIYHFvuwXnbakrj8BwSAX4X0RH88QGGtwUNEalHEFSp1cG7kzNaWGCLyX656cGKQ9bI0Lqf615Q1Kt+r+pqFcnZyoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483449; c=relaxed/simple;
	bh=dFtuZDHXzEQExaPtmfsDAfrp4LO1CuaJnaX9uM3ASnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7WljZfSaGS4AAVHQkVDn5bo03zaqIp1NMbULQPnPKsZ2N6q2SZsQBOSVMYPWgmjbVQhT2vitWtiK6sbpaFpaon3HyKPea8ZCOZcnO3sLoAvxMZ4/NAqXIaJGST7rE4aIReGU3yJYDDL5oIJNk72qKsdpARlKPHQHFUWNRDiOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gG5hzg/Z; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gG5hzg/Z"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8871718b00so96155166b.3
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 22:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771483447; x=1772088247; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFtuZDHXzEQExaPtmfsDAfrp4LO1CuaJnaX9uM3ASnE=;
        b=gG5hzg/ZhVzsG1FHM/Udbenl5FB8oaWZ3HMkVRlKNfR0+m4v4xsYlwjrBm0FWxf2+P
         4IG9tqOa2RMrgWCD5swFHi0jW6B17ceszMNAeKSHGXbl8K9N5+f8aBBZzkQWkZzPe/8/
         MpuWmK9orzvyip20JZKeSFHcYrjVwqlGvqjlwEB1gRAVtNDE9PpnBocVlIHn5Iaa97L0
         0ODyxMEsosJYKGTC+BiuyJJWl9l9Aw3fBuGyZkdfWTJRxzQvxNnPK6UgGDdPAIR491HC
         p4R6xxm0lX7vMPKa0tTmFS71uxXgcjqcHYjohZZ2VfpJaRbliyK57CvGeQYtIEGiNFFe
         bLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483447; x=1772088247;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFtuZDHXzEQExaPtmfsDAfrp4LO1CuaJnaX9uM3ASnE=;
        b=ueL3WrdEcFftKB2KGZQ5upjqNobec+dAF/WQJMum81fp/fM0vaEeIc0ILz0/dl2RsK
         Tzh8boXkyUfmeHvoTOU/9/r91vbnaodpO/KvsH+WV8gQFeEFwjglLQmVJjy+0kQYwjal
         AixkBi7Ukp8WpOE8mINWuF6f1j5rJJfqMz497Wome2nFw/XuJ/omlYq+cYK0n+6i8WN7
         Vk24pHi6C4aZySZZ3a0S7Ao6VtZi2sktBX+I6t9LbkCiDof1m1APoQ4OfZFAXjL04mlD
         PBtWO3dJP1pRvtl1AzO7kojlxwfXlxiuHLyOYfpPcDtURZrIDpv7+0MtnZxRtaDAZgB/
         bkkg==
X-Forwarded-Encrypted: i=1; AJvYcCUjVMDnqV/Mj/VxQbiMkb7VFabzxIURhUpHlmx0j6yGN4pkJ/n5SaTD/09mrf1iX75g9cXg@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQXL4q0KMVbjQB39ZPF51W6LPx5d+AW2nAbejfuEOImzr4cGJ
	vBeLqnibuycf43dfOunXYzvKzapgoCckiM5TePBNdXDogou2gIl/jrHNgAaOiLVF1HQ=
X-Gm-Gg: AZuq6aLHGu375gxd/UbTCBD5fVZtsyUhR2JfQyQd1H0dXTleIuqWdgmhgU9WLaO/uaJ
	WS48AYLyOsE2/0J32oJeWB7UNw7rWO1uZqduD3QXOFqTbl39h30WPHgOjTOr9JT2gNk6IYeEDMz
	qRNd1Jzf3eFk2HwO7HNc86P+kp4AykY9Bf4dU+BeXF6WK2OzDnyyI0J+lhYtqFwIGGTZ/9kElD1
	EMkBJxDEdUVbbMy2R1LJbkexzgdjPbv4vyIRRP31Y/ycBhuyQ1UXJucN5Ol2Lr8F1bNeJQ6RqTz
	MIqrrmBWqvAMmFluo+fGIVzAOTsnzygxzv7DSoxduRWJ5fWLpN0TkoWZVoOX0+7uYv4mHgBVvzA
	vWZl3mYFcCFUeIA7rP4TiCBRVSzigMRcWPWym/ADek3LJjRTG/Qr61lKFJ9Q018fWQYDBLnX+s2
	Qv57SNl6dZiz9XnQg9KvrOEQ3RUrtix2oVucvXcGHyTTW89VIwVK4/mtgQC57DB/3eTCWCHyDoE
	HRxYhGddU3BU3M/Gk71GzwNcvEJoXdT8HebLKL9mUU4tfpFtg==
X-Received: by 2002:a17:907:7fa4:b0:b87:225f:2e74 with SMTP id a640c23a62f3a-b8fc3a31062mr1091664566b.14.1771483446693;
        Wed, 18 Feb 2026 22:44:06 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1? (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de. [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735ed50sm532090666b.8.2026.02.18.22.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 22:44:06 -0800 (PST)
Message-ID: <d622a318-f7f8-4cff-b540-38d159ca87f4@suse.com>
Date: Thu, 19 Feb 2026 07:44:05 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/16] x86/msr: Use the alternatives mechanism for
 WRMSR
To: Dave Hansen <dave.hansen@intel.com>,
 Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 llvm@lists.linux.dev, Xin Li <xin@zytor.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20260218082133.400602-1-jgross@suse.com>
 <20260218082133.400602-10-jgross@suse.com> <aZYoUE7CmrLg3SVe@google.com>
 <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>
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
In-Reply-To: <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i7tGauSnGBXlGVxwFmTcQ3qa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i7tGauSnGBXlGVxwFmTcQ3qa
Content-Type: multipart/mixed; boundary="------------R0o0ZLFrMp6sppOeKmMd6spL";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dave Hansen <dave.hansen@intel.com>,
 Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 llvm@lists.linux.dev, Xin Li <xin@zytor.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <d622a318-f7f8-4cff-b540-38d159ca87f4@suse.com>
Subject: Re: [PATCH v3 09/16] x86/msr: Use the alternatives mechanism for
 WRMSR
References: <20260218082133.400602-1-jgross@suse.com>
 <20260218082133.400602-10-jgross@suse.com> <aZYoUE7CmrLg3SVe@google.com>
 <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>
In-Reply-To: <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>

--------------R0o0ZLFrMp6sppOeKmMd6spL
Content-Type: multipart/mixed; boundary="------------hJU4UTTvn1Sbu0AKMghCM9Ta"

--------------hJU4UTTvn1Sbu0AKMghCM9Ta
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDIuMjYgMjI6MzcsIERhdmUgSGFuc2VuIHdyb3RlOg0KPiBPbiAyLzE4LzI2IDEz
OjAwLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOg0KPj4gT24gV2VkLCBGZWIgMTgsIDIw
MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gV2hlbiBhdmFpbGFibGUgdXNlIG9uZSBv
ZiB0aGUgbm9uLXNlcmlhbGl6aW5nIFdSTVNSIHZhcmlhbnRzIChXUk1TUk5TDQo+Pj4gd2l0
aCBvciB3aXRob3V0IGFuIGltbWVkaWF0ZSBvcGVyYW5kIHNwZWNpZnlpbmcgdGhlIE1TUiBy
ZWdpc3RlcikgaW4NCj4+PiBfX3dybXNycSgpLg0KPj4gU2lsZW50bHkgdXNpbmcgYSBub24t
c2VyaWFsaXppbmcgdmVyc2lvbiAob3Igbm90KSBzZWVtcyBkYW5nZXJvdXMgKG5vdCBmb3Ig
S1ZNLA0KPj4gYnV0IGZvciB0aGUga2VybmVsIGF0LWxhcmdlKSwgdW5sZXNzIHRoZSBydWxl
IGlzIGdvaW5nIHRvIGJlIHRoYXQgTVNSIHdyaXRlcyBuZWVkDQo+PiB0byBiZSB0cmVhdGVk
IGFzIG5vbi1zZXJpYWxpemluZyBieSBkZWZhdWx0Lg0KPiANCj4gWWVhaCwgdGhlcmUncyBu
byB3YXkgd2UgY2FuIGRvIHRoaXMgaW4gZ2VuZXJhbC4gSXQnbGwgd29yayBmb3IgOTklIG9m
DQo+IHRoZSBNU1JzIG9uIDk5JSBvZiB0aGUgc3lzdGVtcyBmb3IgYSBsb25nIHRpbWUuIFRo
ZW4gdGhlIG9uZSBuZXcgc3lzdGVtDQo+IHdpdGggV1JNU1JOUyBpcyBnb2luZyB0byBoYXZl
IG9uZSBoZWxsIG9mIGEgaGVpc2VuYnVnIHRoYXQnbGwgdGFrZSB5ZWFycw0KPiBvZmYgc29t
ZSBwb29yIHNjaG11Y2sncyBsaWZlLg0KDQpJIF9yZWFsbHlfIHRob3VnaHQgdGhpcyB3YXMg
ZGlzY3Vzc2VkIHVwZnJvbnQgYnkgWGluIGJlZm9yZSBoZSBzZW50IG91dCBoaXMNCmZpcnN0
IHZlcnNpb24gb2YgdGhlIHNlcmllcy4NCg0KU29ycnkgZm9yIG5vdCBtYWtpbmcgaXQgbW9y
ZSBjbGVhciBpbiB0aGUgaGVhZGVyIG1lc3NhZ2UuDQoNCg0KSnVlcmdlbg0K
--------------hJU4UTTvn1Sbu0AKMghCM9Ta
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hJU4UTTvn1Sbu0AKMghCM9Ta--

--------------R0o0ZLFrMp6sppOeKmMd6spL--

--------------i7tGauSnGBXlGVxwFmTcQ3qa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmWsTUFAwAAAAAACgkQsN6d1ii/Ey+C
lgf+O+LGlHjGrAMnu6IWbpT+VkiHG7Zg6qoigpT07R57l8vSEwS0VgZi5HyIDqZf+l8/1rWHz3iv
ZZ02UzuqkfBjnU9srlowmFwQcURJgteP59LTgsUgXDheL9oYvNx9+c8BsIJl6yylnABFbbIow82z
gywQX3N+Z+VvrTrM+pGXiPSFyPukkgFvaVxCj9GlRsWrT7wkdVFKIAxoe0wplOkPCqojCssQEAd2
CkQdnkbGBxG1G5IFpjDuk0JF/zxkRrPFOlplbS0eBewtYXN7S/JEYJP6grUeKr+LQq/frA4dIb3V
rovD6Ui2Y1cOVYp5NPAxFfxKhYjquusXEZu8KoBhgw==
=d3uQ
-----END PGP SIGNATURE-----

--------------i7tGauSnGBXlGVxwFmTcQ3qa--
