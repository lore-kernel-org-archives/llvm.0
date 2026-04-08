Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124F379EC6
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637148; cv=none; b=peacBg0vz9aukuqXz0JZnv/qmxw9diwPKThPhSsZyd7/bwnqdnKjph6b8x3qesF/EqKCV0eHhlpMJoJfsXVjnNF5IYM2dfK1+oUaQs7D5+LB28DmKbKCHbA0xAEQ8vQ8R8T+jT54PQMuTHVzU1izZS/L+sHTi6Ta5s/Mj+sAhMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637148; c=relaxed/simple;
	bh=jZzCH5kTMzk4+zh/HS6e7lFcHIt4B1RwjUnl/g3Zoio=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ipmN4ZGdmlujtMNKdAlR2/QWK/oTAd9zjqKRCLZWdA48mNpQrWeNypjj23ETs5Lp+Kx6+IDEtfeRcJtVmGlEIODwNuEy69S8OXh+4FKEhpD7CoTsrgjXYBt/iYQxN/ww7RbJpkbmtr28cpgi8zRdnRWYqBzZvIw4rZVY1aYJlSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HX6rUuLq; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HX6rUuLq"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b9c0787da95so419835666b.1
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637146; x=1776241946; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jh0XBz9sbsK54mPuiYsUDgChOjit4qvJcbtf+cqXL9I=;
        b=HX6rUuLqS1uyM+1rUvQHCvC0wH7SaP8XpeXb6j/wydkv7zCxpxqc/kE0k88lj0915P
         TDHi9IWo975WsBv7ijSq+ixL1LtU39XNn6CcdNiCYwrTIDnt1xhZcKIZCudazK2bY3TM
         lJ+ngBtiA4AoB6+n6YVPXYstX5SAirB3UWnOrgvStuW9Jd7b6I2z+Hb+InTMB/iIhLpA
         itqMeJaNZM2um1hyWFVCodLY7XX1+slVEh8vB0DY+ree/Di27HtunRVS20bn2z0qIXGR
         k6GfpIPT6sXhQzfKvqStrIsOXE68ziGf2SXQL2jHeKS0SglUqXmLsrVrJEFErZVxyIa6
         98ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637146; x=1776241946;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jh0XBz9sbsK54mPuiYsUDgChOjit4qvJcbtf+cqXL9I=;
        b=j/VuAgRAXSKAeg5oS+q5PRoSBvMQUUcvRb8G3Xtzu3/oa17D+X+mE1+l4yuDpO144J
         Z4d4/SjTb5r2yszoOAOA4C46o2Cn1rI4En5fWmPIKxsrGgsq/8d53XyXtYURdEsAY/Ai
         s7bMOsawcXiP1LgS8E6ikX31quqMbpy9orKvpJvq4k9A55IlSxFm/cqf/MVfPvsjjmkA
         Jg2vu+6urddU6ta3hxPBSh52w7jefXE8uii4Cio5TXfEYMNe1hWzBgaNIspe9jH/+0ki
         f5XmH29UKvFoO0c0A05J2NSlJHUmi1ZbeLQIFN8zlzaYvdu+i4wdJZI0BcNQGeMfAHvT
         zlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU4lJLMerperDs0SvT4HlhSgkGHikMLQ6S+/u4FiWA0aZcZbMsR2EIocjyXxW+fwnZ9XZ4@lists.linux.dev
X-Gm-Message-State: AOJu0YyhY3Uuq3wC4e7NBp7SeZZjfaqhjesxaB2h0QGEG+5TxacPW6Yh
	AGR42tpPna+WE89Hsxrxgest80YCwNxMFKFhNOWpTxRQbfS91f5ZbYKuVCV+FHVdGe79sbnTtRj
	Lq4KoVza3HyzCkgHYbw==
X-Received: from ejcdr22.prod.google.com ([2002:a17:907:7216:b0:b97:76e1:bcfd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:eec1:b0:b98:b08:7442 with SMTP id a640c23a62f3a-b9c672ae89bmr941367866b.7.1775637145029;
 Wed, 08 Apr 2026 01:32:25 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:15 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI8S1mkC/32NywrCMBBFf0WydqRJaAqu/A9xMbaTNj4ayaRRK
 f1307pREJcH7j1nFEzBEYvtahSBkmPn+wx6vRJ1h31L4JrMQhXKFFqVcEbGHsLAEfgOEVuGukR
 rrS7IaBT5eAtk3WOR7g9v5uF4ojrOpnnROY4+PJdqkvPubyBJKKBqNFamxEoh7lrv2wttan8Vc yGpD4eWPx0KJFiTDaRJorJfjmmaXmxpxbALAQAA
X-Change-Id: 20260325-kasan-rust-sw-tags-c5afff30e63a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jZzCH5kTMzk4+zh/HS6e7lFcHIt4B1RwjUnl/g3Zoio=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKS7L8tB8P44ROw+4ftT76ANhPBdoEGEfJW9
 nhtFNckROCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSkgAKCRAEWL7uWMY5
 RlmcD/4yd/muXdvb6JNcqsu2JOLWgv0sTqKlTYxscDKq9SkAc5wHOs1xLyDNDifsAqndwd/zlzA
 ECoWbciWxE//7HcnqBjlEO+Ypj7DbKgbDcCiJRsYTX1nS2uZejCKNF14Jj/aFpeUhvHOLZUQkQN
 GQVF/0+gxGtcPUfFpUfiKg+qWjhuIt1rsyejrdg2PkqYkyX4RpABAQ2gBu7Bez+lAELUKUS3xC0
 uvIdc2q0JL5V6f4ypSawxwM+UxhJjAgiBkOKYkuzsUSrI38ZK+Bf7IeePM7XcHkTN6o9FLf/ySm
 8v3KiC4SvFy4B+KUOvOQZCn5ZFLEEPJD0uPqJS5b62rNjT94Jv/CkS693P7rYLpEgYzbnl/Dn7e
 wc5IVBJ1kYZIiCtPmVjToWalHgySUIVvmzIWgTJuEP9X1YFBQtaEy48A8wJvk9mtu/5Pf/Z5+4F
 VoJLF1HbbIccNABzk0GEXeOPRICn+4yx+IMf33z9d/nz7ipMitKNIK5P/N53frxbwzjJsLJ1fi9
 4wvC0b5qejZlZP9ezpaOiC+39OiJxfi11XNRmyKktxj+a8729PWNnZPJwAwx0ldc1PYduiuROUe
 5H1yVeQuja5u6O5RORp0IpHy54EWc1zwjGOI4PGpWYnmZN7HIoG6mzAw0g7snVB/DBTDKYQQOnA yKvW1zhRRy/j4jA==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Subject: [PATCH v3 0/2] rust: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Disallow mixing kasan with gcc.
- Link to v2: https://lore.kernel.org/r/20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com

Changes in v2:
- Drop the first patch for -Zsanitizer-recover, and mention why in
  commit message for remaining patch.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com

---
Alice Ryhl (2):
      rust: kasan: KASAN+RUST requires clang
      rust: kasan: add support for Software Tag-Based KASAN

 init/Kconfig           | 3 ++-
 scripts/Makefile.kasan | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

