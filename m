Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB862376A0B
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639250; cv=pass; b=ZRy30eil7aoO81sX8wa+kL7Sv3p8MeI+Vl/ffE15+fVmuwNI/Sq9rWp0vpb3te6QStEU6Z4E8K8VKEIB/C4MODDw0X8vIxGFjXgn1W/qW6/+ODts3A9/qKP8tAnnlinrSJe9M7zRa6I0bJ8p2vVgVs+Lz5NEDiG2awBJR95z+Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639250; c=relaxed/simple;
	bh=+snkxebuBNXBZk04SdC0odseMNd9Wiypwa8wfMsQQyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AhuOAry7YiQtfJM2NoPL2Ic5DiMj8BSR1GFzTM9aOTXTso9okIxfcipZNLOU01SSYOTkVHyS63BU49JAlsDKAn79ITkwBWOcb3lyXLvhojyC7qwCQc2g57gLjqO5NJYHEMZbb1sDQpYZga+8TY+IOYHZ5l3gl2PFLOwTuQfK78U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJHj8gzg; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJHj8gzg"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a650281d5fso21470361fa.1
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 16:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639247; cv=none;
        d=google.com; s=arc-20260327;
        b=QcklGNdTrr8TY5ss0QPfi0GwP6GcnN8aji6EU0h/ZSsQ3X+wimfMA+Tla21Cybwwta
         b5qMwXQSO0ghXeW+zJaV22pK8eT+X5BrWXE3d4VMPjahoUi/tm98t63q53Gvsy8L7eih
         NYY+OawFw+pkhkpq1G4w8ta09mFo1DffplEjWFdnFvpquGkH58sXUN8WMt4WAuomtpKk
         woY3BJ7NBsVpvjL9jSg+A+771UQT67CQS87B4As5jYs8Gq5SWmHrsOBGS5eSmRGMRD7G
         pKzHtJHUbkr9Wx9FWPkL4LZv8xdKYITUHn0mEPtrrOgK/tMN3ExEgtDa0jPf+jolTIeL
         p1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        fh=BrsXZzNJrJPTLLBJ/OFj8qMakRkrTT+fUs2gtmpmkwc=;
        b=B25AdoW5RcwZX+O2vKg0FP+BBvRZoVcJWq2uAplyOZrhhqUYqxljtdnzmbEAQqXjFf
         krskkP6hNzRXSSv1mKRe9NIvfsz4Zn4IUGA9Sog+ExY6fUB1Rrgndxk5hDjDf0g+CvOh
         ulVWH519QCOZ959X2spoEvNqPCcp/p/KLeYW/7P+XPgX8RIj2y7ZwMqeEEcBrmRaxrac
         7Ft4qIiCiM0+azDnjazcGsIxLSRC+iQyFFVhlxUXs84VzARLHHvtGyNRwYBvOAKF/OdU
         tAr/kIIeU9v/IkJofxYvkkPrb1uTvyrOOiOuRk8owk9XcBb84AOROfJoOhNKf1Ldbsmb
         +v6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639247; x=1791244047; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=JJHj8gzgYsRh4oUCWZmbwUsQUwYHqGtlwSyrfVqBfHiPU+RjQ/bUWPlL9ncNJkDub0
         kwQjxVOR3sbCRPRLPpA4WP5xcNB1/PpamlbeL/w0gvoq9cxUowVb4QveK7K0/x5ectDH
         Mb4Z3r4i/jIN65uGGulD4xXEZVM6MvAU0ImN8fFv46T2OqEM1GpT6VmACgFEX2hPyKRP
         n+b84Z7MuIoXvcKGYjZhJdV4HfPoY2yhaMk3JbDsg8C0B6Z6riC+/2cXckV5WThGo+Md
         fasqJkHn48+Bn1/ovKWFEnkHvHVgniyg2uk8JNyqlC0UszXS6nhpQzw6TPi41tcvLJcx
         DRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639247; x=1791244047;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=rkstFG9p8o1ZNpONug97qJdAf8HdAeF4QF3AmP+ud9S3g4SGwSFUBnIVh6mp5v2IwI
         50lh3mHWe6nxcwOi3Mh3mVyNLAhwTHybg9j5QWQ5dN/siIkajdhZZhdJMmiQ5mWmsmTG
         ZcfG8U2LwJ4Kt1zQYbG96akbEq50JzvGKPIvVOLgAAzS/8RlxEugQrFbVXNLz++h0ekX
         /Bn9sz7MkzPyerH4RCwK2T+E3frXS9Xn4S/j139sPZGN4rkwyco2juTjyWpDzMafDaCs
         Ul2wQuBp+tkBp+O9yUCHiSx4b6NAnNScHexnNP5PINqt9G8HS51NgiWvLVSweBLnMaIw
         7mhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMdfNtthNaQQZZvPCKRBaTCzZMkNskXhwavSWeOAv+B8q4Nt+r1bXPsUL9eY8GyiXqfB+2@lists.linux.dev
X-Gm-Message-State: AFq9FYKOo1A7whNgDZDJm/yjbchTnvM1xesOfhHT2RJchs7ZyegRw9fS
	2p0FjBtCOA8RcwufWx0gdnlSNZeigWKRCFKThIE3lnOwjMHUMFZfexFjrXDZkO7C5iFVRTQqsJe
	+7J8ZyrHG0y6O27Udb9pzHaN6D3tclOI/GoOEiwk/Vg==
X-Gm-Gg: AYBFou2krJbM1hs5g/yV6FM4gSfV1A0AikvNwE+EZzEy9K4yktXpQG50F7JZxdiJsWA
	e2DfM7AnyYJEteLJ72/trllE0i0yNVoDFg4vqsurcfbTL88hynFHjaA4AF64VXYLkyOuJ3cNGIY
	tcG8RESW5jbbYxrgF22LXGRKA0p7Aw084l7Wsv9ZGawNOxfhqIgz497OqRkwBeIuQJiOPSbwM97
	5qncIipb8IQqzzVQKXfxZAcA+Jman+eyjVFuRMO2vEAu1rZ2JHHhOF1at1SLnlSm08wCxvYTYqX
	blFVyuKkS61hMogSf+l7lRAbeCY4S07DuJEpne8msaxhs3M0+h4kLjr2vQfKjTcKc2Zpj62dmbu
	TqmHMO/ncwBJ+4RDLgfKhqcwLxBL8KjEmlXPawriJE3aL01CZp7NiwjC80KylpxL/twUtqp0=
X-Received: by 2002:a2e:bea8:0:b0:3a5:f041:d7cd with SMTP id
 38308e7fff4ca-3a63c311438mr33950311fa.26.1790639246649; Mon, 28 Sep 2026
 16:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:14 -0400
X-Gm-Features: AclHuK8FsT1Ec-f58jqhX1xRKXeOuLhZ2Q1xSCkGZJLLJldZLmmUEge1BcznI7o
Message-ID: <CAGLNFZeLTDhLj5bzOVC51J6Az6E1D9PWj6yzgHZO8Rg-82kpHw@mail.gmail.com>
Subject: [PATCH] scripts: run-clang-tools: import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000037de8a065c93b028"

--00000000000037de8a065c93b028
Content-Type: text/plain; charset="UTF-8"

The BrokenPipeError handler calls os.open() and os.dup2(), but the
module never imports os. A broken output pipe therefore raises
NameError while handling the original error. Import os so the
handler can redirect stdout and exit as intended.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--00000000000037de8a065c93b028
Content-Type: application/octet-stream; 
	name="05-run-clang-tools-broken-pipe.patch"
Content-Disposition: attachment; 
	filename="05-run-clang-tools-broken-pipe.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwd76t0>
X-Attachment-Id: f_mulwd76t0

RnJvbSBkZjVhZjRkYjAyYWE5Njc4YjEwNmYwMjc0OTEzZmIwYjE4YzBjY2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IHJ1bi1jbGFuZy10b29sczogaW1wb3J0IG9zIGZvciBicm9rZW4gcGlwZSBoYW5kbGlu
ZwpUbzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpDYzogTmljb2xhcyBT
Y2hpZXIgPG5zY0BrZXJuZWwub3JnPiwgbGx2bUBsaXN0cy5saW51eC5kZXYsIGxpbnV4LWtidWls
ZEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZyb206IE9t
ZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwuY29tPgoKVGhlIEJyb2tlblBpcGVFcnJvciBo
YW5kbGVyIGNhbGxzIG9zLm9wZW4oKSBhbmQgb3MuZHVwMigpLCBidXQgdGhlCm1vZHVsZSBuZXZl
ciBpbXBvcnRzIG9zLiBBIGJyb2tlbiBvdXRwdXQgcGlwZSB0aGVyZWZvcmUgcmFpc2VzCk5hbWVF
cnJvciB3aGlsZSBoYW5kbGluZyB0aGUgb3JpZ2luYWwgZXJyb3IuIEltcG9ydCBvcyBzbyB0aGUK
aGFuZGxlciBjYW4gcmVkaXJlY3Qgc3Rkb3V0IGFuZCBleGl0IGFzIGludGVuZGVkLgoKU2lnbmVk
LW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+Ci0tLQogc2NyaXB0
cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2xhbmctdG9vbHMvcnVuLWNsYW5n
LXRvb2xzLnB5IGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkKaW5kZXgg
ZTc4YmU4Mi4uNzlkNThiMyAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xh
bmctdG9vbHMucHkKKysrIGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkK
QEAgLTEyLDYgKzEyLDcgQEAgY29tcGlsZV9jb21tYW5kcy5qc29uLgogaW1wb3J0IGFyZ3BhcnNl
CiBpbXBvcnQganNvbgogaW1wb3J0IG11bHRpcHJvY2Vzc2luZworaW1wb3J0IG9zCiBpbXBvcnQg
c3VicHJvY2VzcwogaW1wb3J0IHN5cwogCg==
--00000000000037de8a065c93b028--
