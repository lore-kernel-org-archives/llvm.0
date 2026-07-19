Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EA282F29
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497845; cv=none; b=uCrv7Krwy7bCETYVUZUCXk4ZGmGSFC6Wo1u+2ZI5Lyd9O3CoTSK7LZ6krwEPPBn9tFzP0kvFUE/fy/5a2pVNvFYUI1TexlklYN4PSe1ZSlP0Hc9LVSMhQqtTMwAbvNRg43c1bzcB8e/+qSqWwXNoJ5RyybBipR0yREM0thqK5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497845; c=relaxed/simple;
	bh=ImMEQc8V036XgFro0YZ75qNqprVm/a715A3QCjmfGTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRAwE0GYyC2mQ7G12ZHTl5CtYgWiE2oc1R7tAxte6CEvWwejyqk38fLbM4a9RxdR9iVW5CIMP79KHZJ8czNkex2y+s3AT5t3dBjucHgLuDPDmeheR/aUeJnblfhDgUpeQa1AD9Hy6zi72KT48HWtzl7lMY2dhEI9ELYimGIGMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNlyJEpM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNlyJEpM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso106217595ad.3
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497844; x=1785102644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=QNlyJEpMiwQfboPCQT3bvhpAeDEEMB8GeRKreG3YqC8sblCPfnxU4SD4jkoGdvspXm
         KSFfCidz3asYwLHSfGzDOTuKWlPyYbmzgF0kntGHzj48/GyMTI3Oan8/EqYFkvTyDdYx
         C+2F+e3NUUEBN1zdy+3EwN6bjG8swmCuO826IlagagqAQauf+8QLNOTfzHHOUIKH2O90
         HwkhlMJhX22TVuo4RxfeV/8hCvnztDzL3EgU/+O7/EB7BQdTqVRCUNvmI8nbe/mYZWGY
         L4wC/HnyEeUrTrqLEZmNlrZHLih48EXyC346ALRqhqwIHzdlNUh+NPHHOq0qEJ8LZbdw
         5Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497844; x=1785102644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=fh5KWcXiuYx8UiJMJ4/SKsNE1njNjL53otLIrijrosS/vATrpaylAt6BubysNQU2EE
         Pz8f8b+MTcMtOV7QB+/d1jXhUVQLIxuqbqS7v/6bjl/aK9f60ErWlTA0C17zhb0MlBvB
         xE76QvjUOel72WWDRTfuA01h8NZJV8+oGJM/SMAXe0cyqxpY3PMmhaWV7yvKEwhMuqIF
         Ez8uFpvlK75DBkUEEmixwnMOU3g+98nOrQv992DCdGK2nJjBZVC8isDy2UXyV75NA0Po
         d1pd/+8j50vJTdQ0R1jyGPtOsL7QRMd6dLrD1z7seTJVDbF6apZK5QRMA2OUr6tklFf8
         VFPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq/JdgKmeUTUv74d5jVmP1JmrzQNSxrzNjQSCtnqgUtaEYh7V/ew2z8dDMzxt76aKFp1iJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzZe0dzrhRaA77m4WqxBx6YKqqDV0I1c1rTVWdMoe+xtc7cKXo8
	IEGavseYEhZ1fuB4rpxEqhGZ6i2dPIODOjFkARlSxkAhfSAQx+/6SQEu
X-Gm-Gg: AfdE7cnOG5zt/CRTJ21cC/ck9xwhZjeV61W3HkgdsrLorYlNcA/Rdi51955JxxWFJpt
	d8tmVRrq2Nx1BxYz/R3M9Jicju871ywCe9+OUjAIkFoBatxHq/mCC7qnjBmieUfKc5ETYzapzF8
	PYk1RjeeZ0SeyaJFeJEMXdkeLtH8yygn2bnLzyKCFMtWdcsXH9g6Hvy1kebyQR4J9Ga/ItOkcYk
	ifIjyEcknZySce692KV4FZ8WjxyB1BZrUYcV8rKQEa+zrt0vSQXr0UFYZiYdK+cZO/L4i7ShZKD
	U5aky98j3amFKFQ7GBAB3sEppkzwUhpG+cZ/9LuB5MFW5791wHzjr8uWZD0D7i1hqZhXyJMZt/T
	NlmtxvnQEXcxOAk8Pk2qW28TK5EaKVw0Bs7rrYVXa9F449V2YmYajQDyPipzKkXtTCIw4Ua9oD5
	E2U63alMNaTxCPmt1EU1HtNUx7k8uzUCmG9eH8XkNwt3Hbz7DMtzhHgysSk+3ns29Pg50ZlshL0
	swNg3l4prVCUFpJg7nyF8xjn43YgHBm8r7JKc4y/xp1EfolyB8EIYM=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr127277915ad.43.1784497844128;
        Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/2] clk: stm32: fix COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:38 -0700
Message-ID: <20260719215040.767232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STM32MP clock drivers have COMPILE_TEST in their Kconfig depends, but
they fail to build (and are not even compiled) when ARCH_STM32 is disabled.
The first patch adds a missing bitfield.h include so the drivers build
standalone, and the second wires up the Makefile gate to the STM32MP clock
symbol so the directory is actually traversed under COMPILE_TEST.

v2: split up in two patches.

Rosen Penev (2):
  clk: stm32: add missing bitfield.h header
  clk: stm32: allow STM32MP COMPILE_TEST builds

 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.55.0

