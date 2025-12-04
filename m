Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB2D30DEA9
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834924; cv=none; b=lcnYeJxgtbj4w+crwdsjw8tPZhupoZv0CePnbWPuiTjwWkRKwoch2yR+59TmCtq3SUN7oxNBTaG6EqRg0A7/Bi9P14hEXICHsJ00lNeCVN9+B535CvfXoJZYKHtP63DgcTUO/Lok57635r/X0XHPqd45PAm518wHUVbXa8b47Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834924; c=relaxed/simple;
	bh=3qpxref+fIz2xXinhbe3sx3733zbNSv6/Z2ffSx178M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5d2qtYYO6i2L0LoRRcGZcrzFdGKptNySdkGMRCj0yQbnV1ndc2v3Tnsn52ZcQIHTVgxXZdOUkG3QLNQFqClnyUdsblpNUt4EEbXIZMjGIKmDIPuNd4slg/axjS+1YynpWQd7T1lptBHkMIkAfb6rcc/2PuEX4qf5zhZkskM+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKYbjn76; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKYbjn76"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594330147efso523304e87.2
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=KKYbjn76OOW47rh+zJ6ZWceEz2bf+LUM0/q/jjrO7K9UIwwI1y4dibwOZ8wUO//OKa
         XLGKfv0oL0eznPt05kJcIF7YFxeSpfmv9RJ4GvGv2vW/VbtVLR/HrHfA1/sO8+HJKqit
         /TGCPhiwzDF3vyGZDOJmLEl1fKKP+jsKOW3019HfKygBqqoPbQ1XSlzD3UnOJ8GUXQLj
         iWjfX2hu2Z2trj7dj0UM3nVQcVRPDoOyFfm6mEv/UrksKIf2iI+0JMV+IrycmZQwfjwe
         sazBG/t/bT4XFNoUa6SEBhOCda0NaYfF+r8dlfuS9hiPL5Cd66/ooCJsOCHjS6iQGByn
         9M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=t/xdaxd/63hWwVvr+bmsXr1rgLDzUCHT2MIzOhN3vHY4jzdfeJiimGeVaGjlmqGz9d
         Sp58roZu3jIszHXPx9v558zt7tIh2u7WX3sUcPOYSC6NG0NuILSlxKNjbc62ArfVb9lo
         SEQejiyS0iKLCxJNTz9erf0eaotRhXbb8F5lsts9nK0ib/bLKBsRM4R3bZX/QyYhV448
         r8dFpmNnh51ahbdql9zHXX4jauAzw+M8IZ13+S49Xx6lxFcjXum2IEpQ+4JynTOBtiRD
         s7WleVAHXTsRaQS4pvdRlNBpH7xFlFsQWiNdDaLr6bg7mVKYnPTJbu2G7WMOdX6wO0bb
         r+jg==
X-Forwarded-Encrypted: i=1; AJvYcCUj19qlvc1DIFtJxXswrQVTpf413xUUdNE4sRkfHwGu/m7XMKIWUaDB7+LzQLnPOci91NDW@lists.linux.dev
X-Gm-Message-State: AOJu0YwEDA708UCxCbPN8mNhN8zGd5M4o+UFd+jVHYPbcmXCEc5FHGfy
	8XoQTaVnAq75IhNMYav9GCI1Wm/q4N14E3IWYjkaHXJEaH5Gb//qGeBB
X-Gm-Gg: ASbGncsvABy1OrIOmNSHg0/IZ9lBYLH93Dnp7VwLjDoqAHM7ZMPUM9K4WGP7CpxK6rc
	eDC7YdAZ4aGfD5MVK6u94LpLv6py9K5msb8Jnl+8iVCgl8DhPFE+zCjDYKOXoZGJPcQHyq/5spk
	cLHlQogsQmmK2nBDrXCzwxVofCNekgmDkvWdUIc+/Zoi5SJ2y8KyDg4EW1hZCLxE1jSU1/IxbJ1
	nfXibddHBo3mAWpYto9apPHWh2WYVd6ZZf5IL0Tdwl7La6InDvDom+azu++3nYHqz6l7vL0fwT6
	POMjEdNZH33pC6hYysVXvJZVPksJweCPjU4AmcGBjay3i+xrlumDjj9Si2w5j9L6gmO01YdQrk8
	QhWawApHlD/F+mOLCxJyxoH95tPOm7Z1Fp4wXrLgHHXJcLJukwz++BCyqEjuFZMxdWmGvHA==
X-Google-Smtp-Source: AGHT+IHbKKwv3Cd14fMbRlzVZpxoDoNXbiyghddISZDjVQeIjBR6wf7cZ5tNAwGCF94LJdZf6RcGDg==
X-Received: by 2002:a05:6512:3f14:b0:594:27fb:e7f5 with SMTP id 2adb3069b0e04-597d3feb5f1mr1891895e87.42.1764834919370;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:18 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
Date: Thu, 04 Dec 2025 08:54:50 +0100
Message-Id: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEo+MWkC/x3MTQqAIBBA4avIrBvwJzddJVqIjjYbCy0JwrsnL
 b/Fey9UKkwVFvFCocaVjzxgJwF+dzkRchgGLbVVWs6YvMdy1wubReeip0BGkTMwirNQ5Oe/rVv
 vH4A+U+BdAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

Previous v4 patch:
https://lore.kernel.org/rust-for-linux/20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com/T/#t

Compared to v4, this v5:
- Placed `include Makefile.rust` under `ifdef need-compiler` branch. From my local testing, this did not cause any issues.
- The Kconfig function now only tests backend flags and has been renamed to `bindgen-option`, without depending on environment variable. Added a comment explaining the meaning of "backend".
- Improved the wording of commit messages and provided further details.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 12 deletions(-)
---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>

