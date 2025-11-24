Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB02C187
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943808; cv=none; b=E1pqFFb4Sj7vqgckJEfapshsHdu5pelgGLuiJb+fkO9vMQNCPHZz/GqA0RbaLRep/DxCRL96jtZ/J8rBWw9PoUedsPMYsOC14i8OOErqYmrLtC/4EzXCJf7TlZT8ZmSwOiN8cszAIfzV8o0cd+CXY86NMpWtyWVFS/dfJt9x32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943808; c=relaxed/simple;
	bh=cEQkVzIQAT5F+YBATsjdDaHzZfOdiRJgRCPobJ8Vjt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X59S8or2gI7am5mgvgfbv5NbSohdBm4V2nqQBD5a+BffplPKYRrMkt08oLE+0JeZhffRNCOS27Ss69Ibcxf80krzGWMKVjQCQgb99ARwywObOg9ux/SztRmB2G4LPpyZuP75Ma6XriRvtScOfqWh7aWWiq88Bs+4hMIai005DI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anGqFmBa; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anGqFmBa"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594270ec7f9so3395786e87.3
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 16:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943804; x=1764548604; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OW9zraMwsimBhMrQgXdByeYCxYLuz0CHVP+O90zjt8=;
        b=anGqFmBapq4ZOB9MEqBA+qf1+IFsK8Xv7qQvUqLCbVDkggvR70ojLmHHvXQRYofzxQ
         nbGG3S1MlC92cO8b0rX7xiRNJeXLgsXjVfNVcUTApA2K416BAwWdYto2M6uHcQtjRj0I
         MON7SPIQMgcDzE0WZ8GKqtYhmjJTt9ph2ZtVAJxsaiGuYxS7R33lmsiueLpp+Wa5pQm8
         uMM5vA6H7J76Bed4ap8uXXvJ1DIB83G/47L+vukB96mH4q8RLsutTNJ1QCW9gvUiD99z
         sasx6Dp8rgCQHL5/3fMqJ7uQg0gGxaRnH6K+5wZlFMT42pp6uDPYNVpuT2f3E8AUy88r
         n0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943804; x=1764548604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OW9zraMwsimBhMrQgXdByeYCxYLuz0CHVP+O90zjt8=;
        b=H0gfiMzbF2YogV5TGVM6ikiVlv5dtCuGjOo0Qf93RYHI2MJqltjXHzLWPu+HowBUap
         H7lbShpI3sQGzu6kQyKWqwJnQCZfBArcDbCmo/vWK6ZBrblHVvP9Xy6ANeJeDyaklgvr
         VIdantVMSelo2/56FtEE1fpYws5deCpT5iT6fZ+WQgVEh1QFGTVvhfVL5UKLl/PtoATR
         PJBavhiWApC2Oe2ODlHEKagyU2G8CdO49do7I23OT8IlS+zO4y1YLBTi/QEh22aZ7a4E
         lAdKez5NYcD9CNMfOy42WAvpb+IuVYxqjR/0dWZ5p5+/iu3kSHdu8RWmWVfXtCHRBU8B
         OpWg==
X-Forwarded-Encrypted: i=1; AJvYcCVF557+wWx3IGVYCCR+nCMaAOyTHA3uwptLEaGf7Jb4IHeTpTgVkwqFHXt69S+3BGhDLv6m@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Mw1Yl0L1e2Pc9DxIDNCe2ezcnP7MNFEZKC3UDypyV5J7A+hW
	abTcbbwuUby4xOfVv9aOjRyzBqopwuu7cwkOwyax5Z4fXqCIev9nELQ7
X-Gm-Gg: ASbGncsq/lNAyZALFjBDUsXwxzj6IWKZRczwkDUqXZzlv/vJmwNMoHCXYkgJOxe06gz
	9Z4yr/7pNSPnWxHUNhpCARmsPFsB789EMwcLTNTFjsvxcsV7gE/gHAjvVRQLUiP/olAIoKCifoD
	8KQIrf5NWicJxRnlhV/aOGAxbDdnzeqJ9HtR1itoNFIgfyf9urx7QnRU96hW4BTfez4jLX3EyHU
	kaL1+WwwNx9YGTWXfJVMCFZdNnUkKx6Zh60gr8Ll1NDuz1ij1se32up7OVDYGCQtfLdkPc56KCv
	Ev2lrOObYdQRXTbGG5Fm6BFFULGmtj4DU773mfuMbrmaQxPaxAt59wgjY3br2rzLg8qtcexHzt+
	CynmT7EDMro2R6B5Bj6Xf6wsIJieCtRRWKZvX3i5OSZLHnYCstsczhWvlDZTXnjFPSnz4EA==
X-Google-Smtp-Source: AGHT+IGp/S6DY+Vg8q5hhu61BVUxjpK+86wXNMq2cNDUYhkNRYb0qdjGVo9KqBjwyHEpqgrXlidJKA==
X-Received: by 2002:a05:6512:3e0a:b0:595:8311:dc80 with SMTP id 2adb3069b0e04-596a3eb3551mr3359466e87.20.1763943803843;
        Sun, 23 Nov 2025 16:23:23 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:23 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v4 0/4] RISC-V: re-enable gcc + rust builds
Date: Mon, 24 Nov 2025 01:23:20 +0100
Message-Id: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHilI2kC/x3MQQqAIBBA0avIrBtIUYquEi1CR5uNhZYE4t2Tl
 m/xf4VMiSnDIiokKpz5jB16EGCPPQZCdt2gRmWkVBqDtZiefGPRKM2sHdmJjPPQiyuR5/e/rVt
 rH1qMHx1dAAAA
X-Change-ID: 20251124-gcc-rust-v4-1584dec7e5df
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Previous v3 patch:
https://lore.kernel.org/linux-riscv/20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com/T/#u

v3 checks option availability via libclang's version. According to
Vivian's suggestion, v4 checks option availability by directly running
bindgen.

Compared to v3, commits are split into finer granularity, as suggested
by Miguel and Vivian. Regarding checking for undefined for
`BINDGEN_TARGET`, I've placed it in a separate commit. Since it's really
small, I think it's not really necessary to send it as a new patch
email.

Regarding Vivian's mention of riscv32 support, the documentation does
not declare riscv32 is maintained, and I have limited experience with
riscv32 and no strong motivation to test it. Therefore, this patch
didn't consider riscv32.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: fix gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  2 ++
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 11 deletions(-)
---
base-commit: f824272b6e3fe24950abc527136e8140f67b0b23
change-id: 20251124-gcc-rust-v4-1584dec7e5df

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>

