Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5161FD7
	for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103344; cv=none; b=nmYm05ceIQTpKt7GGFHvh766v9HkHvqu9cyvow6UF6MHGG6z9LpmkTJeOdNjKXMo/wYhvW2ujnnRj/cPLYVAm8H5wg3GSd+9aKeYsZSwdLJieQhftBri4lB9R59qrdCIXVPom1MjTVUZpQzn3qEhBUnq/AogeKrRWFpYJ5xmz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103344; c=relaxed/simple;
	bh=W+4z+9HWRgx7SMhB8z3ozZSOSuMGdyeH4bjUydY93d8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=f9GHwbHQySDi9YuwNgEn0UnbT7OOAwKyXsbCGMBCiOO1Fu9n7VQ27t2O98zMp7OnE1Io0ra4QkawW57eDUHPsgIzuvH9CkOHJmoT7qq/OP/cxDzsKqjKpBE/yVhvopTxV44RkexbvYW+OPD95iDV1OdwgdRlyyAM4+Y/uXFLPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zZiJ8LjU; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zZiJ8LjU"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6b46d8bc153so36809987b3.2
        for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103341; x=1724708141; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NHr+d6UmIU/9IG30FNpxZ6Aa0eu/YiD/uhxdbWXAtq0=;
        b=zZiJ8LjUkIWFPSwrNXlZdKddqRYYKAmvxi9PKRZCEmKQ1y57jg4ly1nd6PjIYZEuos
         +BIHg6nhELtyQ+vIbzdISwIG52zd2hW0pP92GXAIBIXuxBimM6LI/1+ISByKUqn3vZhW
         G8mnRoekyDUl1nErVaL+GuHLKabkc8bNskJIjzIaMzkValHJm8sZ+wKG3Z49rtSBIpuz
         ykqt8N9btqGbp8FrCTy3tMQ3X12W6EqAMopuiR9YxVwHFxkj+ZWKkRsLlcgaQCJManDg
         Se+Utlq711nchp2U+FNiPjOWxbWClAJY4GHCfkiSAwGm4WDnn1CKlIkSDKQdYFh8RYE5
         qT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103341; x=1724708141;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHr+d6UmIU/9IG30FNpxZ6Aa0eu/YiD/uhxdbWXAtq0=;
        b=X0fvuM7rfun6i6avR6BcS/BgLpKIpB4PPrWDmGU2cBOdNS1t3JuIanRb4kl/1FEjsM
         xdhlbFB5M2rLwD46ex9Z+GpCD355TXyu3JMnOl1dBhcgx2Ueasv3n+6tusfdHnm7R9OZ
         LIzU1wgknitRIShQ08sXn/SWsxWgfkV/XQOuVp/jfQhRNNlh4vM5KEvxJ0CGelaUxdbu
         UFYWIHbR+pRYOyqx51tCdhfUafOdNnV8DXaM7TPYVpdlhWA3QkZ97SN9X/PqIkfZuoet
         tlEhonDwA3h9H9ECGaFGcVmuIbK8vHqoDut9brvdH3sGSQVZ/HlJqxbDVx9iuxRfNTZ/
         qokg==
X-Forwarded-Encrypted: i=1; AJvYcCUWh2uFc7gguFUXmrH05uK+sdFYvfF0N/H32hgUsI7alVQdsg2QJ5qZRjxtXSqaBUQGp7M5@lists.linux.dev
X-Gm-Message-State: AOJu0YzxG0hcaroZXPuq4NEWv6hSvF9N/VqJ0+y30Dj6DicaPC0I1A7g
	sudPQ84d7F9KUaOMpe0FAXxGosqEn4dcwaJWCMm69eNpUjp5K/iVI+hItnaQ80hVYVgeNuKXS1c
	rteip7A==
X-Google-Smtp-Source: AGHT+IFPFz0ZC/TObmbtIW+FNYagPR0uj4bw/LTpIWyJXejA9x5eEzGFXKmI7mbSTIJ28oCMdsYOHWMIix2S
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:688d:b0:69f:9a1d:a04e with SMTP
 id 00721157ae682-6b1bb099b4fmr445507b3.4.1724103341547; Mon, 19 Aug 2024
 14:35:41 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:18 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-1-mmaurer@google.com>
Subject: [PATCH v3 0/4] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, ryabinin.a.a@gmail.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Right now, if we turn on KASAN, Rust code will cause violations because
it's not enabled properly.

This series:
1. Adds flag probe macros for Rust - now that we're setting a minimum rustc
   version instead of an exact one, these could be useful in general. We need
   them in this patch because we don't set a restriction on which LLVM rustc
   is using, which is what KASAN actually cares about.
2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
   integration.

This patch series requires the target.json array support patch [1] as
the x86_64 target.json file currently produced does not mark itself as KASAN
capable, and is rebased on top of the KASAN Makefile rewrite [2].

Differences from v2 [3]:
1. Rebased on top of the maintainer's cleanup of the Makefile.
2. Cleaned up the UaF test based on feedback.
3. Calls out that KASAN_SW_TAGS is not yet supported in the config.

The notable piece of feedback I have not followed is in the renaming of
kasan_test.c to kasan_test_c.c - this was done in order to allow the
module to be named kasan_test but consist of two .o files. The other
options I see are renaming the test suite or creating a separate Rust
test suite, but both of those seemed more invasive than the rename. Let
me know if you have another approach you'd prefer there.

[1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/
[2] https://lore.kernel.org/all/20240813224027.84503-1-andrey.konovalov@linux.dev
[3] https://lore.kernel.org/all/20240812232910.2026387-1-mmaurer@google.com/


Matthew Maurer (4):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support
  rust: kasan: Rust does not support KHWASAN
  kasan: rust: Add KASAN smoke test via UAF

 init/Kconfig                              |  1 +
 mm/kasan/Makefile                         |  9 +++-
 mm/kasan/kasan.h                          |  1 +
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 11 +++++
 mm/kasan/kasan_test_rust.rs               | 19 ++++++++
 scripts/Kconfig.include                   |  8 ++++
 scripts/Makefile.compiler                 | 15 +++++++
 scripts/Makefile.kasan                    | 54 ++++++++++++++++-------
 scripts/Makefile.lib                      |  3 ++
 scripts/generate_rust_target.rs           |  1 +
 10 files changed, 105 insertions(+), 17 deletions(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

-- 
2.46.0.184.g6999bdac58-goog

