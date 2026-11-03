Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723647;
	b=pOms7Pl+dz9vDpZCiAcIIzqI+NhCqpatb6o1SIfqDlRnBy+NvA4ZL+oXdqD/H2vBN4Hg
	 h6QZ1ySKf9DmVNl8yrdt1yIenpZcimTbeOYqeQAzRYhlURnhKXy+tcrGK4WzoQiknfJsZ
	 4gNL9Kx+/WT4w4X4rsafQ7B4EKD6J6W7kakMsUBJq8G51nlWNi8dNOPg5MSIy9uOYC43G
	 cvdchLFaW/WbuuaRdJ8fTjtk3riory/NtO91eyLS28KMfyLrsvFMdCwxnPno3rEKFbJHT
	 iPerI099AAMGIpDyf+vxZGA1TnGyUN4oOAz2+FMZEZ8hegYAVj6OAG2KwnBrf/0bmIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
	b=bHBcnTH6yOvaxrHGDA71q5minLRI95EY+lcVUya+vJldVuqGXDwKW9nYXKmStW8rowHW
	 kTvu7Qh5mRjvF3nPPXLLAq+qRbGDVTeFcXn+rk1w4jFtKw9OP1Acz4iun/Tz57qbKKVf9
	 MpHXcX/0wOGdERYmpF0ZP48W/nCq0rf7+bl0hP76js3IZSk91f//PYygtFqHbeSj7/u6R
	 hbyKOtUH5iFnQ4vweVmL1xUshJplpYdGlZgWDM7bVhC07teQj4yA0UAMsoaGvWb4ZetJU
	 LN+PlqW3e1gDE5mExKv7UbT5V68CTBgT9aASz8hMu113S8tpfhztiatb1ZDyiCEBhpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LvI8j3E3;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A171606A327
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 16:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A171606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LvI8j3E3
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd60a365440so2759832a12.2
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723646; x=1794328446; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
        b=LvI8j3E32mB5389l3yVJon3qkckOVkzgCHd2okhy993a4jeDH1XTOMUCQBFVTwnXdF
         tm282S7DTpUuQnDQBlgLSNfgmV7M8HHYlhQ8LaajdJ/N2J+KcPm5EHaSRaCWcqLuFI2j
         g3B49TakGXYuWPkxaiKmrD/Es8KbYXQb2O84hNgcr8GRBxOt64aI2tEYGkI+jI//RMUe
         9sfErMnpofTY3H6SL0ThfMpE2BzQ191dOnHzt0mPQwsR6oi+SwNpAdTGaqbsWTelwBJJ
         hV3GR6uKimfmvoVbfNQmRfJg2dyWL9d5mNr2fUbxgbOkAUjAxue/M1y5DgaKJIi5cN/z
         ntww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723646; x=1794328446;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
        b=Iu9/zb5QB0tg54GNBEZHCxeWbFs74zkQvFurX462ENYHvL+fFdyCdtEoKg3q7lDaZ1
         9eHyAW8Ol+Bych//apLE/s9N9YuBfoioTtENcMY58Sz2gYnqR83qplcc/vu6iHgV097F
         Lqg0gL/mpohsiml1qNGI1O7Q6SvOGwQ+7DnvLuK4z3kq3yWADdFUinq2WBbug1oRqAnl
         nHmPpcissB0637uXNnWluJRG00KUUKd7+w67fe2LfZ04OiDX1dS6ajYy6miUROoPy/GK
         4R5ax2B9CTGDlS+PVH1kr/rsnkAcW6TmX7IoCi0C7kGRKTGtjpB4zV3OFtIpaPxlGw7J
         vO9w==
X-Forwarded-Encrypted: i=1; AKwUvBys5Yge25XVYlzRS55u6I2pD05hg65sMbk+V+1qgiRXHSaWjxiJe65JAaJdXucvBAkHZsqt@lists.linux.dev
X-Gm-Message-State: APuU4Z83cqVUpA9lp8RJRBPMZXx11S46ol/bIsrVbfeTW4b4UgHUdJ7d
	KCxsUpPddWW3eVFRYHLUw91U6wcovY1xYtcAh2o+Qqv1HsEz3qCJlazaQujkcZ7rvvXrw/DdU3x
	CyyfY51PnXaALZYq22+WQjHPlHA==
X-Received: from pgu28.prod.google.com ([2002:a63:145c:0:b0:cdb:1c92:d2df])
 (user=rosaliefang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f84:b0:3e0:c346:734c with SMTP id adf61e73a8af0-3e929042a8dmr9818206637.89.1793723646036;
 Tue, 03 Nov 2026 08:34:06 -0800 (PST)
Date: Tue,  3 Nov 2026 16:34:04 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103163404.159582-1-rosaliefang@google.com>
Subject: [PATCH] lib/base64: fix -Wconstant-conversion warning in INIT_1()
From: Rosalie Fang <rosaliefang@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Cc: David Laight <david.laight.linux@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Thelen <gthelen@google.com>, Yi Zhu <chuyee@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rosalie Fang <rosaliefang@google.com>
Content-Type: text/plain; charset="UTF-8"

When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
constant conversions in unevaluated ternary arms when initializing the
s8 lookup tables:

  lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
  (aka 'signed char') changes value from 131 to -125
  [-Werror,-Wconstant-conversion]
     58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
  lib/base64.c:34:42: note: expanded from macro 'INIT_1'
     34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
        |                                              ~~~~~~~~~~^~~~

Explicitly cast the digit-branch expression to s8 to silence the
warning.

Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
Assisted-by: LLM
Signed-off-by: Rosalie Fang <rosaliefang@google.com>
---
 lib/base64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/base64.c b/lib/base64.c
index 325c7332b049..1489c048b1fd 100644
--- a/lib/base64.c
+++ b/lib/base64.c
@@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
 #define INIT_1(v, ch_62, ch_63) \
 	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
 		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
-		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
+		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
 		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1
 
 /*
-- 
2.56.0.385.gac671c819a-goog

