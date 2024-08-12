Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E72192B69
	for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505358; cv=none; b=ajgQjn0KtNrD6ER+ZylSbMgjYu6voOX+Oa/apw8SJKb5CYiY9f/73suwOxtCdW2C3Kchldx8DIl4QpvYv8iMEvROJ9+mcKJR4C8ZaLtaRDHKOkt8f7ABuZ/cWbEaVekmGDd/fbBrRGi+I2PQA+Fyt7Id+Gi0uyd6IyP1jYMQRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505358; c=relaxed/simple;
	bh=C1Zz0ScPP1mFsCHtubcJdynvh3BR6CmJLqAON/Xqs9k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QXQC7DkRb0LRrjd9WIjEf+YCKItH82rXxHMfKAWkAcHXDHmHlWPn3ktDArdIZ5zbC0o1Xp/Y2MCIUbRcktMNn25nmlEo6rpTzUoVpyCpfkj0sSQxDhWkxyQZY7Zvmsg45c27CDofftrg/Ro9XnHhhtd3cS36QjlQSy2VWsuukSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIUiJEsp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIUiJEsp"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-68d1d966ef7so107770877b3.1
        for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 16:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723505355; x=1724110155; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lfUjMO5M0SniqX/0k9KLAB5KRodEfFiCSNK+c2KjkqM=;
        b=VIUiJEsp6uINAyiKW/qnyKH5HmfDQnDRZrWPh7dcymemuzZOTnCdo6/puui+Jo1baL
         URevGqeXy8VmYTW74MdQB5gw2L9P0pbCZL3SUEQKl7v4/ITlyA0/lLsMCTgv2jgrPo9o
         VZF33NXXpcc18wK018RwiqLxdAMTF0ZvQkHlybVBlMlqq47daJw4fSK0MCkIpyUnmW6q
         G2tCUlJHUX+nz9PsqF9Tgd872Btk8103fHXXVj7gLrM1k5+CZlGQcwN9cThufQUxr4qT
         iLmilRH8sHb5OmUsQsYZDBpCKpRbRROEROY1uoI6W+TIGy7z+2ykGwspfb0PCf7ZoNMd
         Am0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723505355; x=1724110155;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfUjMO5M0SniqX/0k9KLAB5KRodEfFiCSNK+c2KjkqM=;
        b=k13kbXaPKfWms/DGpF6HLfWyX6XsWhouaE7BBiWCeQU0VKHCMBZO/K+B28d68fGthB
         4xg5+tHcgTnlpzTlr8aQttXHEy6rpRHEtlNrL0tyQxiRP6s4JICPM0F7WElwIow+wi0P
         DpDF27cb++2yroAZ7YbaZ96XgtTVVhW/rLz6keFPE3HUnU6diBMfuCEiOvqfdC/hw4T6
         xS/JWk9fJIwApOy6Y5WFGf5ViuG1JCkcSZ6jfY8+Ll+YkaGYVI/+hjzzgk+3OLAuwWVU
         TskYa8DbQvalKjH3ZK6Ro8RdIu7O1LRshSAi9rmXt+LoeJ27KI5F5YnT1CdtD85284uE
         wx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN6WxEDG9QAnaymP9hWjsl0dPoIfWVxKSP97DnGUskHXBdTirqSnwCY/QJ2qijTCO4IAnukBP+y9CaIRKQrT/dlKGWgg==
X-Gm-Message-State: AOJu0YzjEpzpblq/cUBTwn5UnxtSVmr0Ufptv/icjwPBKrRUqweVWGJD
	o7ntUv7qFcvSvNcDUaiuhg8fgpyaYTtza5ZldqBD33FfK0fHss6ay8+Lf2fGwrWjhw6Ss+Zle3m
	rU/3O2A==
X-Google-Smtp-Source: AGHT+IEtuA7T7bE3cMa+Y4GHIfGRVLpMnVTFC18O4stjZtcv2quBfVTmtnD2+DUMiz8gWjxsLfiWTH/j2Jqa
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:b9e:b0:66b:fb2f:1b7 with SMTP id
 00721157ae682-6a976751ab0mr1067257b3.6.1723505355655; Mon, 12 Aug 2024
 16:29:15 -0700 (PDT)
Date: Mon, 12 Aug 2024 23:29:00 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812232910.2026387-1-mmaurer@google.com>
Subject: [PATCH v2 0/3] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, 
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
capable.

Differences from v1 [2] :
1. Reworked KASAN Makefile to avoid repetition, as requested [3]
2. Added a KUnit smoke test to avoid bitrot, as requested [4]
3. Added `kernel-address` to the target.json (my local base-tree had this
   from another patch series)

[1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/
[2] https://lore.kernel.org/llvm/20240725232126.1996981-1-mmaurer@google.com/
[3] https://lore.kernel.org/llvm/CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com/
[4] https://lore.kernel.org/llvm/CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com/

Matthew Maurer (3):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support
  kasan: rust: Add KASAN smoke test via UAF

 mm/kasan/Makefile                         |  9 +++-
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 13 ++++++
 mm/kasan/kasan_test_rust.rs               | 17 ++++++++
 scripts/Kconfig.include                   |  8 ++++
 scripts/Makefile.compiler                 | 15 +++++++
 scripts/Makefile.kasan                    | 51 ++++++++++++++++-------
 scripts/Makefile.lib                      |  3 ++
 scripts/generate_rust_target.rs           |  1 +
 8 files changed, 101 insertions(+), 16 deletions(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

-- 
2.46.0.76.ge559c4bf1a-goog

