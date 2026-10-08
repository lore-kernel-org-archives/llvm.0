Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AA3BB102
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437891; cv=none; b=sq+h69GLxaQppqE5JNTS5KiTUyO12sXMdgrETi2c63RgalnrMXxWKzcpj11OSMFOOGzbd9cRmAiCFYF5z9dKAjwRIc27wxPxuDviEib2k7VftRbFd2Eg4yyeC091wXIrh9TdXrnXhFRYZmTAu346u9mBRNgShxoekA8lQ0sSyPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437891; c=relaxed/simple;
	bh=x/su43TmMUkJUZgcKoaIOqCX48ZiVCOwVIkzl9S0tHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7MFKitmKPkPR0JysNYnPxkrUtJMBRM1TQJaUWgpF3Q5FceVIKt4fDIPhlH+eDK39FCKhUBTlXstWNJ88p2NZBAQ3drd99JALlbNxC9Q5o7CGPHcQI5kYkVt/Afj3bXikQk3HdV5mF7l/W9pw8qYySsBbcradITAuhU9quK/AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzNwzd4Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzNwzd4Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso1592655e9.0
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437886; x=1792042686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=JzNwzd4ZRAytsSWA4MgYlSYqYygovIqGTnNRxRVafd/jOG7fbhla5SZ6hf65HHy1/U
         hlWALthT7MlEaKhxOed6uKv1HZCN/BXcMbBzkJXGs/LHbhVkN/DAaOS9OWbWVMhNpNYa
         fp79MX9e6Us/BG4Unv0MKz2wuibPWAoKMjM02TI+cqPDVTRSgOqO7z9kvn0FOazOAZLv
         9mKzFVEIt8tmahKiUXfMMZeZcsJgPu6v8nOoW2ALyMaOtEthk2XbCk13Of9Aueqx0/ja
         sZKwoPULwwDjrCQ1sxzgt/FiXpHtzZH66wlDssCQ0ujFNic4LOFYnLAd4jzAZmyvVauo
         WlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437886; x=1792042686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=lUNQlpM3lkH47Cfl618O1TZVycGCWJxmtprJ5fw6uV4n8JrUh+LkKSMG5d40QmW2Ii
         mWA+jEdhA3JjljDfXgjN4bfHX9KkhwiZv8MB576hONfmH8Q4WsF0IYv0Q2XCq6rGqdr0
         cLGZlcUr/gVyfmvMOQW3j5AcbTPl6pYeJxsxhjl6bIIB6wWP/zRqUrB98Es6n58yYOSB
         0xrukscijROENvHWwvGnBpCAL33A8hY8YTjUCo83H2bcixo/9KnaXrkolM4yfUmyq8BK
         cUR4SC6IXAT0F/z4I4IUdV+vorvkVE74+EXnyNepqrXgIG5yKJx/RJBGiVtVFrseqBsZ
         lhng==
X-Forwarded-Encrypted: i=1; AKwUvBzkVrde0ks7ovftO/cGtaKGW/NJvozzUnwOj9JVJQMgLtfyWxoVoOCzh2NeubR4So3W9eOy@lists.linux.dev
X-Gm-Message-State: AFuF++m4bDvlUu7G3VkbONjGQ86f2Fn9Dzk4tixNGyTakHHM55nWm8Fe
	iMHM0WZN51hIGCNv9sUJONjHWNcGAU0CAB5KXhLv0eNpw/6c6vIc6Tlp
X-Gm-Gg: AYBFou2GrGuJ2cy7cQpBWygtMp+GwK8TFsF5q+jn4Oy6++PPFRhFkPtO6KR7tCYRPdT
	9Qtz6HSMi4w1fqxDPVTHNnRMjHms4tK1jLiNZZ0D1uO2FQRtHxzNjVM7Ujjt581/SAptDawpBEf
	6zEY6eAbH0LkwayfL1X1FrnFKqRWRqD0LG3tzXPM5Y8MX7YLKyWK35dUFRzQ2oGjKE1v6u3h5gL
	o/UyXyaK6b2hvuEl0zvjxAeWjuTCtBG69rBm+d1rlSfGR6AM6X4cMsX03frjoWtUprp8BsXW9AB
	MkmGTL33b/y+YOIFJwtdspGdDu8vOa/0P6mCimFBDecK11fbUfuAPg/GPjsazGbN02XFmZJh1IH
	8HYXtRiX5hnFe86K3Abt4jwMgJs3ObnR3j3d0C6gLXLFt8puPamEgEJeLnbphso4dtmK6JgNS9K
	2HBupXRKK8wo5Ydft2r68A5c4VTYWw76qHcxGCW2k1mFwlJOHVFSmvbpsWAjSlauQKGEQ1C4G7X
	nCMYGpXWVeTeNRM03tqmnP7PnbAvZUs5uZhrQypHlqvz2NFAf1CRM+k4L44DQ8vZcGiGi2NUDJu
	nlFnWjIDlUHx0c3TOPiI1zz1+wiV2TZjtZQ7xHxd6TORnpbtTWvJYugj2LX2ryDbo8Z2c1ZgAkG
	VBoazc+M=
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr26848495e9.9.1791437884887;
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Thu,  8 Oct 2026 07:37:45 +0200
Message-Id: <20261008053746.49631-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
contain an ARMv4T CPU are excluded from Rust for that reason.

Nothing else in the Rust code depends on ARMv5. Use rustc's
armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
ARMv4T.

ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
target for it.

Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
samples, all Rust KUnit suites and the doctests pass with the current
and with the minimum tool versions.

at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
That kernel passes the same tests on a Microchip SAM9X75 Curiosity
board (ARM926EJ-S).

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)

