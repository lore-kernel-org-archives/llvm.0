Received: from mail-yx1-f74.google.com (mail-yx1-f74.google.com [74.125.224.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347C2E543B
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676110; cv=none; b=GcXpiSxQ+jEIF8hzqHlQsV6r8vM4m5DXOoJpPhClmdaUtpYql7tNkM6Y6bkr9xUoYlz29OVseSdeDlax/0EEWELKfPpKPgNtE0SY3z6rqqrI6eTENk2fcMpAF4XafF5JmPf5sdZ+EMzOjVceE0+E16FL9bMU0GE1NTJ+Ob8AERM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676110; c=relaxed/simple;
	bh=fX7XbLSp971rMTg0UpwRdyUHxI4708ybuHhCpWAllo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bFBhsUrl0y55VYYU3fEdAhPAUi8ouTUiJ8Nxp1EKLibz9xwldm/VGQG+k/kSDJVQP8jo4TidguA5rqAcxKWDEuRxveVIpH5wPahct+LK2vjMRPQ4xRhRfumF9ZhzlqmiVyMlDoxHIEuOOl71GlaHAj4KIJEoFa0Sb7REiT8sOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhFyLF2J; arc=none smtp.client-ip=74.125.224.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhFyLF2J"
Received: by mail-yx1-f74.google.com with SMTP id 956f58d0204a3-63e1d6438e0so8010508d50.3
        for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761676108; x=1762280908; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/B5eNcHD/N3E3+kFhoRC2kLmuGEBa6rnxq3ZrWjw6Q=;
        b=YhFyLF2JGVTiqNQEM55VbtT7nN9QQOxEe04bXFc7FLF1UjarTW+0vA1ofBRUzXgsub
         WXCQdTMAQoVNwfgJHZ2KsgNGVVeJHT8tgyA5K2+skLSXRCs4fTjJteJ57RBvfoiJm7l9
         G+wL9kyHMkDnL9MGZR8O9crYmynfcFChN7vhjj5l0SNhFu8BJbXcz+gnSG/8MfyuaT7F
         lAxZR72R8aa68RSq651FIhB5wx78LGzD+pOK8gcwgiuTxLsqIbLII2ZDeHUmv5jwiZQY
         LSELhZ1CWr1iMMv7oehYBlD1KM8Kt4MABtFlen/GqpYCfEExMMgvbCLNYBq6ucMdBrkM
         jc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676108; x=1762280908;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/B5eNcHD/N3E3+kFhoRC2kLmuGEBa6rnxq3ZrWjw6Q=;
        b=EUdiBuy0H9BTXDh3Mh7E9uERo+r4GnceCemWDjsqlAyufw42Ul7a7nVYT3bsE6nP9I
         PJ8sQImxLQ31oVP5W4l4L5E4d8peBT4YYXy/g3oJYhXlX8k08k6oHgU7bwTp2PVvjs9I
         TxN1zwW8XyTd30WITLfx9VyAlx7Aw4OsO0U89X2h7+LM5Bm9/K5RaFJxQGyGBZl7yyS6
         tzcShtsQvVoJYGvVlRgVLdvpc0ldr9HBNd/SiVlxv4N8MCi6TN14znitsBCB6507gHML
         mSus0bLbmB+27kB8UnGWew3UFEGnYDQkqfwB20RvzFxwmvrP62Z5hq4Yt2+Vjfv38C5c
         j+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWOYXGYDvxyZ4ESD0iW0D35kBtunSSPCbXzC4o3yClrSkim/jbkOmk8g9MWl77Cn4GI9yYh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0sflvBWIfeAw2uo6PucoZ94/kgpkzXgd1OkZvps8cNB68K1/b
	LhrlqdndmYPAnv3s7etx04qn9bnMAPhRmljI2p/KGEkFhRLE4f6faY9hzzd2DE3dmOhfMg==
X-Google-Smtp-Source: AGHT+IHKgweEeaLJqEq+LQTEeKUy21GxhN+HXb+lwE/+WPniFQggWEwGckSmcOi3srPPaBPmXdnrZsY=
X-Received: from ybsa8.prod.google.com ([2002:a5b:ec8:0:b0:eb6:c177:51d8])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:9985:b0:784:a119:e71b
 with SMTP id 00721157ae682-78628f87d9cmr2297817b3.42.1761676107702; Tue, 28
 Oct 2025 11:28:27 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:28:20 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028182822.3210436-1-xur@google.com>
Subject: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
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

ChangeLog:

V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.

V4: This is based on the reimplementation provided by Masahiro Yamada
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
2.51.1.851.g4ebd6896fd-goog

