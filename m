Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558C3BBFB0
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437894; cv=none; b=feyp49PrJ4vCMc9HidhHT1vxjUEtVSU9GtGmP+51LI18HNncfN7LPY9MRn3kmjv4VHE2eqd6ikI6KiPB69GFvpTT0qjcvZnMLZhz7dMMYQqFMDh30Rva1yOPs2fvWAowW5nh4xk8K1f/aWo1FJhqn2Lbpe2I8zk0VCfl8EjdpvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437894; c=relaxed/simple;
	bh=kSOdu2D/uPkkscs5ntFbdrqzzlXt7Gw83S0FPlHcMNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3WkgX2j04BlOch3DtuwszaJqs+HHp8/dM+H55D1I207+GzKTuRtl74lZbOGrapXrnrzc2ENguK2mgaRSf9UjWjN/Z1JDoiDMyFXtZNLC09ZgwEEj374QF2QcRXEh3E6MP3SubSILTCnypjeX7O8WzUmZkdFmpSwRzriLDb7W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB/TMkTZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB/TMkTZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a17baef589so18674515e9.0
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437887; x=1792042687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=DB/TMkTZBLr99+pLY/eQt52OdyKIf5v1RaIMq+4ZSIKrz4U5JFqzzqMvUPMu1hZ/JV
         hUtfO/gGyX0UgjCasVBkOXBehODfbuZjT/zbyd6SWk7qBcMSBrDMrPdfSNWcjAEipGUQ
         n/RFsumNCrTxvwNGltmHm933gTHtxeEVK1pdNp/WGcSr5rOr++K0wVU5u7MdSQl4sDQ2
         rCH7jxXmBuq14lzANtmxcLEPUZc0yGmKQR3bPbEQaJQRfzbyWDiKG7gYeGHqDw/1qTsi
         f/uIVgANlyjSMwSIZrIxECaTljWvqzzUHk39tSXcJsFyYrq1dxL4Q/v2MMLFJQXAgvzM
         t7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437887; x=1792042687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=qN2JKRdftXolsSvWQOVIxGmegHOjxwF4LKRMkkQ8RcfNlYP/XtyUg/yz59cPvfdd8e
         08fBApZYXecVeQqJM1juxwHOMxPOe40PMWeMnGC8p12F0Rwba1acA2OU+/p56xGxl4a1
         5uZ4Y/UA2ci5kMdUtno4B4QC8nBHiatsnwST+RzLDz/H1XpqdnEPXE6SVouYV7VpDO79
         uj9TzEC11Fbiy9ank4R/R5DEmWi7/CqFWzhbLVSLgdsq6yPRZKVNwhCKB99PAb+N6v7H
         dh+pfKrrH32NTykfPjHtFkDOeVv9ghCHNHD1a+iqegDOoUTVLgXtg1eD5FAzmlSVhubA
         098g==
X-Forwarded-Encrypted: i=1; AKwUvByN1jKMSfU8KtkJEhDVLc+Ji+7GU+n0H+2N8QFuNr1guQb66teRomdDr8u5ESnue9Wsg1id@lists.linux.dev
X-Gm-Message-State: AFuF++mJNRIDjaXoqDs9Fkpy7hAlBx6wiFXP3yJztfP7qCy6J37pCOIs
	Z2tcVf6KVo2nzPAJ8BbNyiMI6mNcinye0X0yD4gYo9nV7dcwCKkjF9en
X-Gm-Gg: AYBFou1fsSXd039RpjWa/TARm6X+tlJ+uKdgC2ayhdy686g137IzrwtqUfLV/xBctVl
	nJAJsJplOqgIgoC3AjE1pcWIqEv/+xdcAcKjoJfHdxwE15V2x7k316YLFWvNLYDTVBEXzxK6BkZ
	/JOC1GiQzfxx++1AZt0e0yF2S6X5Lh4Y4L/S2sliF9TvQklI3ZV0/2uW8PbfrVtqEWwiNBBaU3c
	ORNjjuPBuzRcwCAE/WJB3YOuaY3JCq3bD0oeqBKwQ0eV1dAym/dklqs4pOYlWdbb4ApTTnkbaV9
	PxbdnNOKrLhDcw+3WJXxQ4uxMj3BvLmsfdWESDVKz0lHB43MaRyjWLGigYzsaBNOYncK0miR09K
	aiM/Yf6U41zyrX3M0x//wRvNi78w7RxBM1LrMXPmoptYBDYlrwoILBkA7EKOmz+YeyvCKjVoCxY
	+K4M3qFWZD+dhFDg63KG32EJ81F4zeyL86eViSDAKl86oZI7gpblt5yI3L636WZh3P0oJlCDvYa
	Y2ULppNVU16ck77gB8bhDjBUmimr/3+GOeJxySSCEwHDQmwhw9Zkh9InzaZd2B1urRb4HYWkQlR
	NwCI9SFYwlCVA5qE0VgqlKq0BvPWCQyCqQdYt/cA5bIfPnldU3xUsLBQ3WwGhLvPtB4lbklexWK
	BnO9u56M=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a180649453mr74925515e9.14.1791437886819;
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
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
Subject: [PATCH v2 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Thu,  8 Oct 2026 07:37:46 +0200
Message-Id: <20261008053746.49631-7-kmehltretter@gmail.com>
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

The arm-unknown-linux-gnueabi target builds ARMv6 code. An ARMv7 kernel
gets that as well, because no CPU flags are passed to rustc. Its Rust
code cannot use movw/movt or any other ARMv7 instruction.

Use rustc's armv7-unknown-linux-gnueabi target when the kernel is built
with -march=armv7-a. It is ARMv7-A with the soft-float EABI and NEON
disabled. Unlike the generic target, it does not set +strict-align.
This allows unaligned word and halfword accesses, matching C code on
MMU-enabled ARMv7 kernels. A kernel that also contains an ARMv6K CPU
is built with -march=armv6k and keeps the generic target.

This builds the Rust code for the same architecture level as the C
code. In the tested Raspberry Pi 400 configuration, Rust text grows
by 1.9 %. Six small benchmarks range from 10 % shorter to 5 % longer
runtimes.

The generic target would turn a full memory barrier from
core::sync::atomic into the deprecated CP15 operation. The armv7 target
emits dmb. No kernel Rust code uses these atomics today, so this is not
a fix.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and
in QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules
load with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)

