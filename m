Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F735505CE
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923547; cv=none; b=B20VceqVcqNMAcpe/lvipMX6CqgbVbCcdDgNGfgNTfQL5Zpqyg7W7bmmBASuiqracDSFkKBhpCDFmlW13KuP3W4JOMxAvNKnCP/SXWUda3w/JPOowCcutuTgv8ypR2mxFTVyoJdm2cjyrwmjxD8vVZZv3jf0x2i1b5G699r3Dxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923547; c=relaxed/simple;
	bh=6JajpgDfEBwfZ8sqZjkLO3o4yng9oDArTPI6I0e/LXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/wDbW+U6BWzrby+5QpsHjujtVHbV+t+IFLpokXfdKEghoB31JQA7VpkY5MxHGKhyMgzRj1ofygZYtUbBPm8wHgL5jN5RRxW/sy9vn2kwUkudUQbpqtJT/cTAZEX+hOHcQRgnwTPLJjofqiAenQ+OQy2HaYJ6doazCFnSds2n1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuK9W+wR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuK9W+wR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c399641so33916075e9.2
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923541; x=1792528341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=IuK9W+wRSGrCEJXJBihpd6ONZW1PwQ/9fJGkD6mSuuNOHQaMyvuiJIRzfZwYbzC8Ql
         ZOLTKlJl87zcCzLN4kN80vVW5l29GtNeF3BJqf3/ninkjJFyDjOBRwsX4WJDIzk8JLLI
         zrMTVc18NvdWjWCW7U/x3fdoKIC9Ie1tmbGF356cLif1NQtIfNuDNqM6uavAMRQM1RS3
         398UGGhdoWIwtAiVPf0LcKCAV2OuJUSMveaeOVlXVWAEZeBO/ca7dCbMqnp5ZOBQiiCi
         6lt4xZjcA7ky59R43V6Nm3bxNIEgAIoI2uF6wyAhwaaxeVbL9d7DujPl9cjEa4P1C8uf
         J+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923541; x=1792528341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=d26i+QDBKIZJdv/X8hWX151vNFwNTipWxMDI5l/FcvkdjAiF1Yh1l1uHx0+yd1xseR
         yaHl5aLTJZ94/kuscHdQVCManM9vnbsxCp7bImx9qc3nXGZm84tN2iuswgBjOj9mT4SV
         VrkNu/DexsqwEPHba9+bIxN9xF9v5z0wsgEEVxr2v6lHp2F5uKi9znwonDQxxDHKa14y
         Ez6qZgo8WfiUXzp1q6qSut5qrmTXTvDeHstBxsV0p+7P/ZmXmV89P9Lh8Lp8nz4bdnug
         29Xpn0eKrO7TpKcovxo5yoFUGs+n6mU8FlM6BCucC5ri5/xg746yBC9vJsvxL42TaOY4
         UjhQ==
X-Forwarded-Encrypted: i=1; AKwUvByoF+BNyBrYboree2/s4Ibza8wi6hxSbD8R7eIsAhF5t3hYTwNpoSrkflzXpJBjFV3JMTPa@lists.linux.dev
X-Gm-Message-State: AFq9FYLKQBeaMeppIS0GG0jZTpUMXAX6MjsCbB5A99ke3S/JJcXlv78r
	ClG7hnNeSyF3BPFtX0L0QAbXHrlSmthmX8fDRkO7kvQuhaiFjxAluDMc
X-Gm-Gg: AYBFou2ITkjfhFc98ALW1Xb5FBqp0z28GdpvGDOqU1z3mMDZbQjdZTPHXQA3jYJTvP0
	JJuquu9ebsJPk66uIMwp226jYld1GcZyhj97h0obpQQymSggDf83e8ubSIMgWvXU2erg7FR+86D
	Z5wTarLGePwyg84qCUUL7EkULPY4RqlNxPCDbBpKpdO6iBnTJMx9wgeXB3P+n8nneknfSFKW979
	yq+a5bT+6Js4/d6Xh2WphUp4u3rnpYK3LvrE6OLy28/aU67pGz36D+raZXPFskrZJTQIYV2IAcu
	5piEv5flYhp6gp6MHNf8DhGxjbR4G81zHwDVp5avdw8bFCrUh67vlVnf1XgZX9Dtmvjp1dpofC4
	9NBhty7ypwZbuAMlJFrGQMhGaRrelTiQN5IDSCV2aixsekGrz5J05yxfMmq/mPqh+ku1XR6rXhh
	Qw/sWcjvfce4dmYs4kEF9N1yBXS6TkG4d3X+O4Z5+FHjs8CEjMa7tcWjKccLXGJUtzWI8yKm9Ue
	FHshxEJAQ69vRQEf3XzBfAboS5KpGqHsNuy3We5UwYnMg1lAaU87Igag5QTDoqRqmBmPpqkjtCA
	KOXZ2veHPLdFozV0vI7nXzkV17DqjMzy0cmWZp0vy2NLRoCjSxOdT5Em7U3uK8y7TUFbxoQ+ObG
	cxSOP0Zav8GWxn1oMYQ==
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr69814455e9.26.1791923541329;
        Tue, 13 Oct 2026 13:32:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:19 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Tue, 13 Oct 2026 22:31:40 +0200
Message-Id: <20261013203140.31741-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target builds ARMv6 code, so ARMv7 kernels
cannot use ARMv7 instructions in Rust code.

Use armv7-unknown-linux-gnueabi when C is built with -march=armv7-a. The
target uses the soft-float EABI with NEON disabled and permits unaligned
word and halfword accesses, matching C on MMU-enabled ARMv7 kernels. A
kernel that also contains an ARMv6K CPU is built with -march=armv6k and
keeps the generic target.

In the tested Raspberry Pi 400 configuration, Rust text grows by 1.9%.
Six small benchmarks range from 10% shorter to 5% longer runtimes.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and in
QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules load
with the movw/movt relocations.

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

