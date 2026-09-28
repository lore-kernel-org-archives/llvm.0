Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DF376A0B
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639186; cv=pass; b=YBdr6IUZDqOOc60+j3vTGa/oKvLifHp+3wxav0gSXSUErsAwMnY1UphKAfHp1P/Al8n/TGMpdlL6z6R7f2iQjuC9KjgtWVpzQFkGiZSyq4FDTA/dwTzzmddFWm+hNnL7idOUUJlotcN/UlbwyjuAh5qVKTwlvAzmn0/PoTePOnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639186; c=relaxed/simple;
	bh=hNIG1O9b63uQZMDwp54n4u8BYZPfc6xLK2wlOe6uGrY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U92IHr3i1bCBQesvP5nx9x7YhzuT6nzqdADHy7Q7rvJLyPvYizeDRXiIJ2cIR52JgyXS8LonOoeo3aO1JaP8t0Qt8eD2vVsF6i8HvaOxXnAhJXW4FKXgKJYf0xvjxQ16klOFBW0EotTURfPyb7C01WWkgNmCwZ+omX0/IotW3O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfuDRFZo; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfuDRFZo"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a650281d5fso21467111fa.1
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 16:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639183; cv=none;
        d=google.com; s=arc-20260327;
        b=MD2zNgZ/ZtG28cXqZzTVhPpSQ3sTPWpuJnD86654zDlBid4EsDnEopjxYIb7dBLBGe
         jT713+hDynjn6OjUwzvdni8JBaGHz19B7MFlUg2W0HU63iAzsW/ZBIeaUMDvkwbbqxfi
         Vr4blxyZeqortz7NoKVLdJTYFcF7WOJjYLjV4YXPMLVjckp0mG/SVh7AyEtQt3xO6eEU
         fu7/rFR96qWbwqO57XbTraG+1UxBHKzB0RgQNzBqUhntVl8GFPT+bYA0U+ugyWzqCIh5
         FpBwxhA/LLwt308vWAH/+Gc3EgQXwBCpHs/y/xFe8mmP/GpmfwBUlDJgENqd5rYL5C0C
         dbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        fh=iIWJ+IyDiPERtaHyWpe+qq8LZ3cCz11iNvlDyJhT4gU=;
        b=fswf93ZohOC+gVhJcwGPKabYIKbjm6Dowmb8DTQHJevU8s43zS2fQkNTxH9JvuA8Sb
         iUvyMQ4/4a3hcErD44EqcdZ4NM+vLslY6WvSMN8flQzXHgpolsIMC24R61umhNoHBiU/
         3rykWn3+glI3zxIpmgjIgr+zlRtXvKPW1jVGIn63e8iqI48eoVcy+wWwNq8LC6ENMqs6
         3IplE/AWdmsvotffbQQf8GB7AScELURAiNuLNO0S1aa7ijfhudATSp5Lm3bO+Z4pMGnP
         wI9qZLBEUjPdePkJeS2wXEtks2M5dZAPXhWml+BgoUe9yJbn8R3ab6A4I/tfF9SCB9VT
         rt9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639183; x=1791243983; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        b=UfuDRFZoqUE/AZDARbFxvT+Y0LI3/++XjH3gaXIL9t2a4aiLxRBAzH/UZtiLZOAZ19
         o003zan2t9CNw6zOJ28AQcVU0RJsckLkxyY4QJfjFoPqqdc1G/XDHqXlrKn0ajGafc4T
         kBmxYlg2+8ThP3Rpo88maJdEPqNS5WMX4+7ATorHHJ4Si/RdKjSLP08QCH2FFyytpFm9
         0tPG+vpwVgcqLTyIJNVimcbRpHPL1TkXfsI7eF2ppxQP8ZPckPlcYYNtT6TRgLiVAjJa
         AeFvUo7RQgscEIzhSTx4QPYkrswLLD3VomauJanrB2sbclZtlyO7SMpM/ueZS6cwscAf
         OL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639183; x=1791243983;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        b=lLO+PN/LZbFYSjxd0vbnGhw++6ds3oi2boRyeM9z8WzuMlSZQST4XxM1CwB9b41EaN
         /2LG8xEg6jES3ajLXmnrWy3qq6xiV8UFJ67B4ekypUStEJT1GLuQemiHJB27G1e9vPV7
         DwJZsw5BNWWV038fjUDDhRXndxiJmMy7eso7zn+lxqwbfgT9q3f9S/wJEe3eYItc/rVK
         WbIOA1mKOfT3gsTsRms6PyyEtWpdatpklgES0C9FMglpYLUhU9O2AdSj+zNcmkCCiIVA
         1knfvuSRvvlijWULnEwMtdJ5Z9vAZSw0ujK+2wsUl6io2kyBQ3Xdif6DOgKbnyDUnSTO
         tjiQ==
X-Forwarded-Encrypted: i=1; AKwUvBySQQDGa8qhVnstFZGHsSrwN1kjGLvv0jh5ad/iGBsdMkhlwdZVjVCbA5B7rZisl5Ho9Mfg@lists.linux.dev
X-Gm-Message-State: AFq9FYINyZnhmGJJZSDzWuHuc4lECHk2NaWSZIIHMLa6dd4gYU82yQVs
	xkXC6igPvymc/QfLGWrc5j1lR3ZU+EJtz1Nnv3ApCLFzwqVglWoqV3+KioBb/BD6nS43/aB4Bq+
	z4428gQBmohbUk1iU+HY4xaW5N9i56jU=
X-Gm-Gg: AYBFou0bMrOI+EXIl7XKMzwqLrBhimb8LL0bedlr6Ra3afaueAyWlSkdhWsCuwph1Bn
	vbEfyo3bbrwnbKtGWyK0wBWBRkxEGEvNqwo/M+SjbEK8HclDV26xToRdQJlWKjL7RizftF4Dpmt
	Wr5uOnqFXsFXw1aDq+2IgiiBp1wuTqheTBuHvex1Sv98Jsd1GaxWGLvrfSqcIMsuZSHyW17jaT8
	e2+nnMNxZD7vsDbjTvx2jWIl9QqI5ZBibl8eFqylqKRcFQT1R+eIer5xgKz4ftWFaKbBYDEe75c
	wqMwTgU1IfU8nPpoTzL8/KXO55PmKZz4gwP8Di9KKgQ5PSuRvWlYAznptkeSKuqdsHLP7EQdxVD
	ikZYkM++D4veomS737MXPnQB+xhY8A9xBHSgZP6a89vbZc6GWTygPL3QsmE3mKMi4mYlGYaA=
X-Received: by 2002:a2e:be9f:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a63c0f46admr39352421fa.17.1790639183488; Mon, 28 Sep 2026
 16:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:46:11 -0400
X-Gm-Features: AclHuK_QFUDt0E9-fjXxsSQFCCr3a-hEiLPNvrKPEYlNc4wywi6m7hPtYcI0vtM
Message-ID: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
Subject: [PATCH] scripts: gen_compile_commands: accept object file paths
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ndesaulniers@google.com, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000740802065c93ac3a"

--000000000000740802065c93ac3a
Content-Type: text/plain; charset="UTF-8"

The command-line help lists *.o among supported path arguments,
but main() rejects every object path as an unknown file type. Map
an object path to its matching .cmd file so the documented input
produces a compile database entry.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--000000000000740802065c93ac3a
Content-Type: application/octet-stream; 
	name="04-compile-commands-object-input.patch"
Content-Disposition: attachment; 
	filename="04-compile-commands-object-input.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwblys0>
X-Attachment-Id: f_mulwblys0

RnJvbSBmOGRkY2EwYzMwMzk3OGEyNzMxNGM2MjMxY2ExMTliNmIyYzE2MGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IGdlbl9jb21waWxlX2NvbW1hbmRzOiBhY2NlcHQgb2JqZWN0IGZpbGUgcGF0aHMKVG86
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KQ2M6IE5pY29sYXMgU2NoaWVy
IDxuc2NAa2VybmVsLm9yZz4sIE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUu
Y29tPiwgbGx2bUBsaXN0cy5saW51eC5kZXYsIGxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5vcmcs
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZyb206IE9tZXIgWmFsbWFuIDxvbWVyemFs
bWFuNDJAZ21haWwuY29tPgoKVGhlIGNvbW1hbmQtbGluZSBoZWxwIGxpc3RzICoubyBhbW9uZyBz
dXBwb3J0ZWQgcGF0aCBhcmd1bWVudHMsCmJ1dCBtYWluKCkgcmVqZWN0cyBldmVyeSBvYmplY3Qg
cGF0aCBhcyBhbiB1bmtub3duIGZpbGUgdHlwZS4gTWFwCmFuIG9iamVjdCBwYXRoIHRvIGl0cyBt
YXRjaGluZyAuY21kIGZpbGUgc28gdGhlIGRvY3VtZW50ZWQgaW5wdXQKcHJvZHVjZXMgYSBjb21w
aWxlIGRhdGFiYXNlIGVudHJ5LgoKU2lnbmVkLW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxt
YW40MkBnbWFpbC5jb20+Ci0tLQogc2NyaXB0cy9jbGFuZy10b29scy9nZW5fY29tcGlsZV9jb21t
YW5kcy5weSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9zY3JpcHRzL2NsYW5nLXRvb2xzL2dlbl9jb21waWxlX2NvbW1hbmRzLnB5IGIvc2NyaXB0
cy9jbGFuZy10b29scy9nZW5fY29tcGlsZV9jb21tYW5kcy5weQppbmRleCA4ZDE0YjgxLi5kZWNm
ODI0IDEwMDY0NAotLS0gYS9zY3JpcHRzL2NsYW5nLXRvb2xzL2dlbl9jb21waWxlX2NvbW1hbmRz
LnB5CisrKyBiL3NjcmlwdHMvY2xhbmctdG9vbHMvZ2VuX2NvbXBpbGVfY29tbWFuZHMucHkKQEAg
LTIwMyw2ICsyMDMsOCBAQCBkZWYgbWFpbigpOgogICAgICAgICAgICAgY21kZmlsZXMgPSBjbWRm
aWxlc19pbl9kaXIocGF0aCkKICAgICAgICAgZWxpZiBvcy5wYXRoLmJhc2VuYW1lKHBhdGgpID09
ICdsaWJnY2MuYSc6CiAgICAgICAgICAgICBjbWRmaWxlcyA9IFtdCisgICAgICAgIGVsaWYgcGF0
aC5lbmRzd2l0aCgnLm8nKToKKyAgICAgICAgICAgIGNtZGZpbGVzID0gW3RvX2NtZGZpbGUocGF0
aCldCiAgICAgICAgIGVsaWYgcGF0aC5lbmRzd2l0aCgnLmEnKToKICAgICAgICAgICAgIGNtZGZp
bGVzID0gY21kZmlsZXNfZm9yX2EocGF0aCwgYXIpCiAgICAgICAgIGVsaWYgcGF0aC5lbmRzd2l0
aCgnbW9kdWxlcy5vcmRlcicpOgo=
--000000000000740802065c93ac3a--
