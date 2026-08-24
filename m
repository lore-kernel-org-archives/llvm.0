Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5491D31DD97
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578536; cv=none; b=Ow8Yo3A8cedTlbyMogRB/xKTwxf+EWBDPwbGaQ5y0yq8jxJqvXKBiKG2jFRIud+6J+wbjvXf9uuEW+2ABfI8Nh9kpVa06yNZBTE3Mis/83yXiovmJCiBmAo92ZYYTOCE5wq+jmRTCrOkr6zwUEKLluJ4r6OMSArk6+o1zIkBYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578536; c=relaxed/simple;
	bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXcZ/+kLljpRN3gcSvh7FE15Gt4L5/tjhshACFahoJP0YRnW/FvBM2lpngOT/aVubk2YCR9fSv/TsIpJOLYBOJIWkmN6vCCyRP/PHcCsrkA7mDeKdTuGZCLw8L5HwOz12AyRv1J7pYQu2GG+cggQ4aDziUkzZi9zXbzSShysZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B046tuEL; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B046tuEL"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so6331604a12.3
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787578532; x=1788183332; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
        b=B046tuELaQvWTJCg3ds2iXNqTZIg4Xu5sHzYo1Eqzg0AVb5Jds4h7x4GWkZ0ZoYF41
         5D+dhN+SPgh18zQXTQr3uSOTY1v227YktZey5wf/Fo4/FyHNC9UTcsjq/nNnhRORrgWZ
         jdgIaHuIaMxiWgdQkSG94Abu6JowP2FOWY+djStt4xkQH3tdtREJYUA2Lgh+W9A0M3eL
         GpXj2IKNuXf0Vw26ojEBYOP4TFyWH2ScRPRNqHA0Be+6ose198Cia3eQut+Y/2g/GFC5
         FU6OYMznmOWb1jO5Duop8DrL0kAowOsGqGqGuShfTKFftnPeQuy7fTeytKHu5LNKV3Aw
         k54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578532; x=1788183332;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
        b=l0zFsCdmEhLD9iXUh1/0FRp0l/cgXaL7tL5mct8UKe3i8zJW0E3MpR4OzaB9zvWfVq
         FbYzTKNHaF+i1jmDzhFnzbLSeymDn02KYkRfNLzEdborV9GS+9HnJRtdtp5sL/W/iCw6
         po8+k0Xba4xVb4zDR+JAJUZU36ZZzsEGOqS7SDwq6wParQlk259WWF2eL7HG0EjNGuYd
         U7KK943NKdH1102xpeiX76Glbu2ofIVfh24mtN0JT1D9tp767sjKXaG0VJ9pccyj803p
         QHzGD6WEPJO51RT2Usni14I59TB1sVuw+x0z6lVov5rMuRdXnSOM9eepFgtMYKGvfTjZ
         R8og==
X-Forwarded-Encrypted: i=1; AHgh+RoGPA0qJPc+zVLqbxdKDqY9tmKMz4hUtjRfB0kS1AEpRsA8vtbU23MKY3fe6hJG6a+mHNuW@lists.linux.dev
X-Gm-Message-State: AFuF++ntpYKobugJbyl4v8JQWLxURc2vA4yV8RK03HYFv9Qx2LX9PfaV
	XX4h2EB1Z+Yrcv0bv15M3cRub13t8RoScTZhLRCAvj8EE9QDfHQVfw6ME8/JGtwKTUQ=
X-Gm-Gg: AR+sD12V9NIrSixy07yyYswP89B2fH5W9+wV+/Arkjo160P70Zd/AHhbLhtiDC0+OEN
	iWQqoCDZjLtEInnz54BydlZu0gNgfoZCWT3oBmHJ3Z3dnQB4KFA/7q+5JtAOOktctZCuENYlL/T
	ztLOOmvFr4IOEhvGFAK0FqCHrHOvaQcBpEoHP/2DEzBKqRN5blGx68ZRiosthcd46yPUSL7c+wB
	WGBsJX/+KibD8ruHIrHbpsxV3eN66PvY7MRVKGxgcGo4Shg4oEh4TE1jT2HIJeL+6zJkEy2CM2Q
	jIOME5TwJ3G+2uJX7UHaqy/iwkbxB/R+N6X41tbcj1dA1cRIc8o+12Kfjn2PuxrtIKeYKBwmO7K
	3PbVglrvoxnZR4g1AvtHb7Sr43MKXTLEfh5izSi6itzp6bq9Klh7ssx9jT07v1GdBi59f1Gxewc
	S2Wj9QBobgr5r8vUT1ijFzVWkOIi0oOBfVgET8djxSuD0AKNHzqIfc45qdXn6xrukH
X-Received: by 2002:a05:6402:3202:b0:6a1:b515:d2b9 with SMTP id 4fb4d7f45d1cf-6a582ba2f09mr22312579a12.14.1787578532100;
        Mon, 24 Aug 2026 06:35:32 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d7399sm12707547a12.26.2026.08.24.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:35:30 -0700 (PDT)
Message-ID: <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas	 <jyescas@google.com>, Guenter Roeck <linux@roeck-us.net>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Date: Mon, 24 Aug 2026 14:36:16 +0100
In-Reply-To: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
	 <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
	 <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SGkgR2VlcnQsCgpPbiBNb24sIDIwMjYtMDgtMjQgYXQgMTQ6MjYgKzAyMDAsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToKPiBIaSBBbmRyw6ksCj4gCj4gT24gVHVlLCAyOCBKdWwgMjAyNiBhdCAx
NDo1MiwgQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
PiBBZGQgc3ltYm9sIHNpemUgZm9yIGthbGxzeW1zIHN5bWJvbHMgdGhhdCBjYW4gY2hhbmdlIHNp
emUgc28gdGhhdCBzaXplcwo+ID4gY2FuIGJlIGRldGVybWluZWQgZWFzaWx5IHdpdGhvdXQgaGF2
aW5nIHRvIG1hbnVhbGx5IGNhbGN1bGF0ZSB0aGVtCj4gPiB3aGVuIGluc3BlY3RpbmcgdGhlIG9i
amVjdCBmaWxlcyAoLnRtcF92bWxpbnV4Py5rYWxsc3ltcy5vIG9yCj4gPiAudG1wX3ZtbGludXg/
KS4gV2l0aG91dCwgdGhlIGFzc2VtYmxlciByZWNvcmRzIHRoZSBzeW1ib2wgc2l6ZSBhcyAwLgo+
ID4gCj4gPiBUaGlzIGlzIHByaW1hcmlseSB1c2VmdWwgYXMgYSBkZWJ1Z2dpbmcgYWlkIGluIGNh
c2Ugb2YgbGlua2VyIGVycm9ycyBhcwo+ID4gcGFydCBvZiBsaW5rLXZtbGludXguc2gsIGFuZCBi
ZWNhdXNlIHN5bWJvbCBzaXplIGRvZXNuJ3QgaGF2ZSB0byBhbGlnbgo+ID4gd2l0aCB0aGUgb2Zm
c2V0IHRvIHRoZSBuZXh0IHN5bWJvbCBkdWUgdG8gcGFkZGluZy9hbGlnbm1lbnQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+
Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGQ2YmYxMWE3
ZThhODYxMzUgKCJrYWxsc3ltczoKPiBhZGQgc3ltYm9sIHNpemUgZm9yIGthbGxzeW1zIHN5bWJv
bHMgdGhhdCBjYW4gY2hhbmdlIHNpemUiKSB1cHN0cmVhbS4KPiAKPiBGVFIsIHRoaXMgY29tbWl0
IGhhcyBhIGh1Z2UgaW1wYWN0IG9uIGtlcm5lbCBzaXplLCBhY2NvcmRpbmcgdG8KPiBibG9hdC1v
LW1ldGVyOgo+IAo+IMKgwqDCoCAkIGJsb2F0LW8tbWV0ZXIgdm1saW51eC57b2xkLH0KPiDCoMKg
wqAgYWRkL3JlbW92ZTogNC8wIGdyb3cvc2hyaW5rOiAwLzAgdXAvZG93bjogNDQwMjY0LzAgKDQ0
MDI2NCkKPiDCoMKgwqAgRnVuY3Rpb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkwqDCoMKgwqAgbmV3wqDC
oCBkZWx0YQo+IMKgwqDCoCBrYWxsc3ltc19uYW1lc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLcKgIDMyNDU0MyArMzI0NTQz
Cj4gwqDCoMKgIGthbGxzeW1zX29mZnNldHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLcKgIDExNDQyNCArMTE0NDI0Cj4gwqDCoMKg
IGthbGxzeW1zX3Rva2VuX3RhYmxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtwqDCoMKgwqAgODQ5wqDCoMKgICs4NDkKPiDCoMKgwqAga2FsbHN5
bXNfbWFya2Vyc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtwqDCoMKgwqAgNDQ4wqDCoMKgICs0NDgKPiDCoMKgwqAgVG90YWw6IEJl
Zm9yZT01MDg1NDk2LCBBZnRlcj01NTI1NzYwLCBjaGcgKzguNjYlCgpJIHN1cHBvc2UgdGhlIHJl
YXNvbiBpcyB0aGF0IGJlZm9yZSB0aGUgcGF0Y2ggZWFjaCBvZiB0aGUgYWJvdmUgNApzeW1ib2xz
JyBzaXplIHdhcyByZWNvcmRlZCBhcyAwIGluIHRoZSBFTEYgZmlsZSBieSB0aGUgYXNzZW1ibGVy
LgoKV2l0aCB0aGlzIHBhdGNoLCB0aGUgYXNzZW1ibGVyIHBsYWNlcyB0aGUgYWN0dWFsIHNpemUg
Zm9yIGVhY2gKc3ltYm9sLiBIZW5jZSB0aGV5IGFwcGVhciB0byBoYXZlIGdyb3duLCBidXQgaW4g
cmVhbGl0eSB0aGV5CmhhdmVuJ3QuCgpMb29raW5nIGF0IHRoZSBkZWx0YSBiZXR3ZWVuIGVhY2gg
b2YgdGhlIHN5bWJvbCdzIHN0YXJ0IGFkZHJlc3Mgd2l0aAphbmQgd2l0aG91dCB0aGUgcGF0Y2gg
c2hvdWxkIGNvbmZpcm0gdGhhdCwgdG9vLgoKQ2hlZXJzLApBbmRyZScK

