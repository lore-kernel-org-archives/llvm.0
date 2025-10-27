Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7C31B81C
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602961; cv=none; b=MShHXvxXF7NOubOJcQk10PCQafG0MBr1vFlx0HAwP1rlE+YHD8S95zlg+nL4TOcCWJb/Xizb4VU/bgZpoGZgXZr9d2JtNfzv4Lr03S7J8PWJ0wl4NkakNWykgNzds1oBbNovQ20xRLJD8ErahQ9e2hdTcMDi964ZeKNdcLfLJwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602961; c=relaxed/simple;
	bh=yXfJZ9u3Fbjfd2gJx08sRzobL8zpTJ5hQcZOUZCTRdw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PAZgbgxHWtkJ3z9Spw2BhZOin9WbaPxPFMO8Zo9LAfvHMU3xUJEntT6olBnoOnZtvd78rOkkLyWLEWERIXOJ20PwZxQmCsmVPiPfiDFa9eLaJ78fqPhRMCc6BZGy7ioOIiFQhzV7P+KQZkfavd4fQvezH/yp8n9/IewuqzBuZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k5YBaksu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k5YBaksu"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33baef12edaso4752704a91.0
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761602959; x=1762207759; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dSGfQMNjri/IzdLNzyd+71NlCYDzISAHz9ggAxICGTk=;
        b=k5YBaksuktJ/K6l/dt/Egwi20nfEUtWpT07brCDOIY0oogZ8q7ycTaGLuzjQuBNyA1
         T+ffobrvC1wHctNOi3mW6fBMUuhwCXxu97RPur2BpFj1jzAeTtcTDN2Lc8K7FvD6la0j
         NkZ2vPsYOV/UD+3383RFGgqRpA80piADmqdG43/yEsaIOWDrnTjEvO4jqGTU52HFAh67
         7d3cHdnHG9eOEHnaw+MGX6VBFjLSQNF6+igHXO/zgePLoq/R61ntn2BHNI7FJ17+xiOu
         8t4uMDAijhWsrH+oOqbL3JjNY235ZcTAov80iyJr3QFaRDD8RnVzMebP6fuaRAjQNJdZ
         UgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602959; x=1762207759;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSGfQMNjri/IzdLNzyd+71NlCYDzISAHz9ggAxICGTk=;
        b=JyJCa76X8/hpcJ2OgeM26d95VgC+83+wPFlu9zLc+UlwAmvh0YElKgVnjqmEOtDk0r
         zPsC40e4i7HbbVDvDp4fU2sW0tBMczGwnytal3+YdTacyX60UATqSFC+VMu8C/imzFhW
         etOeMJo6U/963R0RT0RGhzv3jvgCFoLpjukKxKxaPK18/PN7byd0ATz+cVeQHbZHiHFJ
         1nOJP/M/TG5xPdDGr7wAaENhEbP/tuYPzjBLQS1EWXHl2eMmGFrDrsUdhJEEWkf25WIt
         nX2IybOa4LXpJW1FJtUtVXm3NIntWtGKLP90iIoCSz+2z5pgN8DWOHvTcvNkEAboZeFh
         3j+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAhAobhlZ9LYxsGMZ+MFOrTIAxQQWbKYyRDgceNdwHKKTZJxSye1O8W4FrreY/CvCuJtyN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk04lPEVUkmKURWZ5kQXfC1dYJLvrGkRR8tys6P7dSEuFI5dEE
	DbI+jCUaqu0Y4tKRXXzdF6qlmCK7JcxRJ0HbsESvHj+sj7761pntyHeYWwnqeDQROlQzXQ==
X-Google-Smtp-Source: AGHT+IGS7xK7WB6H01wrhC/DTJJJdKCdhMHqBiqf2jyYVcEgqsh6sEw0yU2tcp1RCB979UO3Psy6Cak=
X-Received: from pjboi5.prod.google.com ([2002:a17:90b:3a05:b0:32b:65c6:661a])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:280c:b0:32b:bac7:5a41
 with SMTP id 98e67ed59e1d1-34027c1c55cmr1350654a91.37.1761602959448; Mon, 27
 Oct 2025 15:09:19 -0700 (PDT)
Date: Mon, 27 Oct 2025 22:09:12 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027220914.2665978-1-xur@google.com>
Subject: [PATCH v4 0/2] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

This V4 is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (2):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 25 +++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.51.1.838.g19442a804e-goog

