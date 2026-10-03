Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DA3F86FB
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020321; cv=none; b=N+DBFS1ikzJ6jkGbRsceMgAMe9hFGjjn4geU4AWcJUTNDd+AB9ZnOzHRAq0SRqpwsdcYtD5HZhKhR1sIQhzenpklBN6rpYzdsvSuLIHwdA669zph8fjD7bouVe+sGDvqxUcciU21TViqt11di3uDIuFVPLgSHrVHLd0le2bV/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020321; c=relaxed/simple;
	bh=0zGZamDELNJVb3ZPRXbsTVbrc9fNePuUT6QFJ6IALfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=foMeoOCMUoGCRzstxojaHhpv7Ry70SA81w/3LFScFUu8fSMRBrLPZF0GBq8EvwFt9cQ99DI2aPp/E2Gpf4PYsfNZuR8inLL3yaHgfv3qGmKeotRIqbyLVib5EG1SxPaJ/NmqKAffM9LuazCaixukwvmRGSLHCVdFqHeOovkiiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D40CPhq1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D40CPhq1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso4483525e9.3
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020317; x=1791625117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+FUoa7O6EqJD1Y05Er2fK+U4nTQNlxggxHHVkGMPXA=;
        b=D40CPhq1oaIPZLAllOh0fpjcPL501hgfOZDZP9xjeJa03ol7PHxH9awZV4y6MA5lil
         BR+qnXInK6DoSpdP76rMUkQbdy4KXzYh7gCJyFAu3T6uVcDk/f86h97epE2YIPz3mpMZ
         hfW5RfaHk1m48lcQbv7/YucxWijy8q3SWd3fMIlTxD3ROtZXuB49fLzXtYpuwmK2wbDc
         SGvo6q0E7VOCIt4DDheKGDaF1UCBIKsKOt16v2PVuoUPxjqv2SHgkDtoPf84zxfChH40
         i6dPrnLrmTaTLXKa52IkQn5X394b6k/BXdi/Q9tLFfVsgyaBOURbhe+IXQ7UJ7gO4e5V
         eypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020317; x=1791625117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+FUoa7O6EqJD1Y05Er2fK+U4nTQNlxggxHHVkGMPXA=;
        b=sRjXEMV0Ifwl7wy9nXZFR51wXuOzbhihI+LWF84IH4vnX9075NzOojx9hyvsdvEwoH
         k2lnd1wi5SlzCQ7KwTGwSn4YJIxVyUNMn76CLa+ZWbDIGeN6dKFJvp6Wk+4R7GfhPHs9
         jCOWw0HblB6ggV8Q9PZ7kh4SFxqJrud78udHlf08VNRPDZ8xMkoVYOBhgtRzHO2Lmh+O
         lUQxibWUBA+04T1V8otyASNnuzDh2senK1Q1xiQvuuQDJ662cngQRxw12PUtVBI/E41p
         b32VQgFoVZekldOjc61SckUCNxwM7clxe3TJDgJb6bIkX/+EZmOuSWxEopr0CrUUBtp7
         7YlA==
X-Forwarded-Encrypted: i=1; AKwUvBzR/N2TAvble1y5aBd+wZhUhqGZ/y3VOPHnK3mZI0TO7EiyNUznYdp8A4GYRYs26y4Vdk8b@lists.linux.dev
X-Gm-Message-State: AFuF++kPGcTbwhiBwWSSv+R7Lcsx1PAYgSAQWKTE9awFpk1ESNX0SN/b
	RcYJKgTLNRDVXAqPrRXc7olngaHszzIU8dH4yBDuvpXhLyL2c7rRJKUg
X-Gm-Gg: AYBFou1BIiBl3rTtpBiDKcLp08VoP1xeZkFBw1cmLxknwbKB1/mQiTkFbnueH2aZP6p
	n8Mem5oxWR/0sC+O84wZo5ZyePtE6ZYHEHSNOKXvUh9Gyqaz/wht2iobxpC5gzXigOIthNqNu6F
	PztXmQ7rcxjCsc8Qt9DXXQvrZAk5yNro+F/M2vIDIjrAaNymEfRjKwDbaj6ECPjB6gD6ZjmIWLg
	i2FjbSBOJwgGWtAd1twm8bg/3nq4PFmqDlg/zqp9lrtth20VYTVaD5mt0WLzi5CVQ4p72VyM6+F
	ObVK+TRw/qRRZMvafZYa7Aidz9Gc2+8MFDWZ+nijj7Ff5v51XVuo0pRibRdJ1ug+eoRHUjEKnYj
	HFgTBV1JRUU2cE95ftHagI4zr8dH+K9NcVjhnx4QWITRrbJElaZu+NUWqhlJgAsXieu5HFFlolG
	DEcKkoeAGcaq388C5zpiC61SsPUKpq4XaeHbmnnCh0xAqYuMhHoMx0eM416ONLsThcqgslzOYrt
	mJ6qi0EASFtkMcROe0icJ0lJ+EK8Ugr9CmXLnuYBhB2+Z5LmigNrleTWnjTJII/qjmzyKrOyRKc
	bUVhxF7nVFnXW/yNpplJ6xku02I87u4gk80UWCFbGaCBEN/Lb8eyKpJbuCppxbuu/Frb0mvpIlB
	wBPK0UAQ=
X-Received: by 2002:a05:600c:46ca:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a0275790b7mr85076925e9.12.1791020316829;
        Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Date: Sat,  3 Oct 2026 11:38:27 +0200
Message-Id: <20261003093827.77857-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HAVE_RUST is currently selected for CPU_32v7 only. The
arm-unknown-linux-gnueabi target used for ARMv7 emits ARMv6
instructions (+v6), so it cannot be used for ARMv5. Use rustc's
built-in armv5te-unknown-linux-gnueabi target instead. It keeps the
Linux EABI (no short enums, unlike the -none-eabi targets) and is
soft-float and strict-align.

Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
ARM1020. C code is already built with -march=armv5te there, so Rust
matches.

The kernel crate implements atomics through the C helpers rather than
core::sync::atomic, so the missing atomic instructions on ARMv5 do not
matter. The only gap was the 2-byte xchg() added by "ARM: cmpxchg:
support 2-byte xchg() on pre-ARMv6 CPUs".

core::sync::atomic types up to 32 bits still compile on this target,
but LLVM lowers them to __sync_* libcalls which the kernel does not
provide. Nothing in the tree uses them. Such code would fail to link
on ARMv5 while it links on ARMv7.

Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
in QEMU versatilepb and on a Microchip SAM9X75 Curiosity board (both
ARM926EJ-S). The Rust samples, all Rust KUnit suites and the doctests
pass.

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..2193d8e1e156 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv5TE and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..f6b14d9f0e1f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && (CPU_32v7 || (CPU_32v5 && !CPU_32v4T && !CPU_32v4)) && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..ef94eae1f047 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -150,7 +150,11 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
+ifdef CONFIG_CPU_32v5
+KBUILD_RUSTFLAGS += --target=armv5te-unknown-linux-gnueabi
+else
 KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+endif
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)

