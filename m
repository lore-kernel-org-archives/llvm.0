Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138813B5A4
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713881426; cv=none; b=iASd1pbgtaEjvjfjllnhIAx4FDdjF2hYp1UOaP8b+quZiWcNjbaaMxdRfsLUXsDefL3stSettEklar/1krTyx6B3RuYDqAzoXjXf4KM4yybM4nTjkDXKLEAplSGUP0BFCQ41ia3YS91tui00RFpW+Dqr5eIw2+XNZPKUFktFnts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713881426; c=relaxed/simple;
	bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7jA4BzoRYpZdScqG1t61tuiCBSZ67+elFgAyYtxpbSu7p2p5Oe2NCLUU6yUYayizObWy2dYYPwcagbgjj82Zpdfbul5nfsZct1fSNyAolI6twyoUSIbi54yhR6Ulxc70WuPvR3ckuOaikc+1Ym6tyH2IbshbtA8xbFBEs2FZjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9uxVr/9; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9uxVr/9"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6eb8ea5ac95so3470977a34.2
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713881422; x=1714486222; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
        b=Y9uxVr/9QtT11rO4y1+cfZlEK+A9iZb+IiRSXoWBmDqGlX0z/tbkE3RwHXATbOHglK
         F0A988Q78s9kBaoA/sOr9+UJZ7ktcjRhe8yl25lovh4bl9Ba1K6W8er0+Ao8JucSS351
         QazmBn4gPTW7qhmCPI0nBZwyyAvCFV1JS+Yoy4b6iPkVsLuZe2R6D9QX/jTm+MaSDtzG
         tXoiWkvmEtLi4VO88tZ30Wv2ERphjlkZ7/5NRmmncNT6OvZPoqjF5HyTXlmXTX8hnGWB
         TSjcp1IsTiSGdXVpMxQBLnHQ8pQ2ZRfzhSoHD8Y2ShkUBc9J6YASLjBtFQnKTVDtkGoG
         w0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713881422; x=1714486222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
        b=RSZbFP2vinHywQFQiiFdeioxEVlMRlXFT/Y9veFFez3bWIDjV0xrcU61ZixjLEhP0y
         l0QdlkCQnJTPU3VDm2L6n47gsPz2nVy4bgryN+zoKFoCqlGPWIueBEqXkJ16Ag2f3Jby
         2ntyHKk05YW4hKo2Jncqzg6oT1jhUmvpNQ/Habr/+Jh6STBGSI4mYSfJTnMbxx7zaoUo
         YiYQcoZo87zm9C5ny6TCvC9tuxv8SUmBQRzG3m+OmQT00asMD5tX3YylpCKaiFiF26ji
         9NpQh8hsuKGZ3H9KSf/ZwfJA0ZPIRo36MH1r6ZQT30Cdmu0xyjsjdpeBQ+arbvPayLFx
         E6jw==
X-Forwarded-Encrypted: i=1; AJvYcCULZ9tKyWqsQsOefKsJPlO/mCsH4occhvNc6oJAxWLSBrY1YLOozAqxAB9vhWRdtkERN83ghf9NkNXJ6PAu4woVFGAvFw==
X-Gm-Message-State: AOJu0YzZypI8b0dRz+764zZW/bTZQceO7I1rJcvLM6JeOr8CSHi48LHM
	bVeZI2p+NGqM8cK8zCgfrG6VZasyzQimbUcQTRfY/dktzVXK+V5MrJjy+5YZ2u2YCcIn34zZ1Qw
	7kx+9I9RJDRRFuTj2MztBVG5MNMQ=
X-Google-Smtp-Source: AGHT+IEWgbCXB1KnFRVZnvd6ZM6ti/BfjBpAft+kg/c+l9uHynEzf5W3sqmJKuEjsKVCcT/MMXNJfwXNq6jhQHbURjI=
X-Received: by 2002:a05:6808:1448:b0:3c8:2bb9:1516 with SMTP id
 x8-20020a056808144800b003c82bb91516mr9746163oiv.26.1713881422330; Tue, 23 Apr
 2024 07:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713875158.git.siyanteng@loongson.cn> <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
In-Reply-To: <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 23 Apr 2024 22:09:56 +0800
Message-ID: <CAD-N9QU7uyJN7g1D1y0jZt9x64uDwvL3ynyXir6othOm=NpH9A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of
 coding-guidelines to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgOTowOOKAr1BNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFVwZGF0ZSB0byBjb21taXQgYmMyZTdkNWMyOThhICgi
cnVzdDogc3VwcG9ydCBgc3JjdHJlZWAtcmVsYXRpdmUgbGlua3MiKQ0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3Ry
YW5zbGF0aW9ucy96aF9DTi9ydXN0L2NvZGluZy1ndWlkZWxpbmVzLnJzdCAgICB8IDEyICsrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvY29kaW5nLWd1aWRl
bGluZXMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9jb2Rpbmct
Z3VpZGVsaW5lcy5yc3QNCj4gaW5kZXggNmMwYmRiYmM1YTJhLi5kMDJlMmRiZmY1MDkgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvY29kaW5nLWd1
aWRlbGluZXMucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1
c3QvY29kaW5nLWd1aWRlbGluZXMucnN0DQo+IEBAIC0xNTcsNiArMTU3LDE4IEBAIGh0dHBzOi8v
Y29tbW9ubWFyay5vcmcvaGVscC8NCj4NCj4gICAgICAgICBodHRwczovL2RvYy5ydXN0LWxhbmcu
b3JnL3J1c3Rkb2MvaG93LXRvLXdyaXRlLWRvY3VtZW50YXRpb24uaHRtbA0KPg0KPiAr5q2k5aSW
77yM5YaF5qC45pSv5oyB6YCa6L+H5Zyo6ZO+5o6l55uu5qCH5YmN57yAIGBgc3JjdHJlZS9gYCDm
naXliJvlu7rnm7jlr7nkuo7mupDku6PnoIHmoJHnmoTpk77mjqXjgILkvovlpoI6DQoNCuWJjee8
gOmAmuW4uOiiq+eUqOS9nOWQjeivjeOAguW7uuiuruWPr+S7peaUueaIkO+8mg0KDQrmraTlpJbv
vIzlhoXmoLjmlK/mjIHpgJrov4flnKjpk77mjqXnm67moIfliY3mt7vliqAgYGBzcmN0cmVlL2Bg
IOadpeWIm+W7uuebuOWvueS6jua6kOS7o+eggeagkeeahOmTvuaOpeOAguS+i+WmgjoNCg0KPiAr
DQo+ICsuLiBjb2RlLWJsb2NrOjogcnVzdA0KPiArDQo+ICsgICAgICAgLy8hIEMgaGVhZGVyOiBb
YGluY2x1ZGUvbGludXgvcHJpbnRrLmhgXShzcmN0cmVlL2luY2x1ZGUvbGludXgvcHJpbnRrLmgp
DQo+ICsNCj4gK+aIluiAhToNCj4gKw0KPiArLi4gY29kZS1ibG9jazo6IHJ1c3QNCj4gKw0KPiAr
ICAgICAgIC8vLyBbYHN0cnVjdCBtdXRleGBdOiBzcmN0cmVlL2luY2x1ZGUvbGludXgvbXV0ZXgu
aA0KPiArDQo+DQo+ICDlkb3lkI0NCj4gIC0tLS0NCj4gLS0NCj4gMi4zMS40DQo+DQo+DQo=
