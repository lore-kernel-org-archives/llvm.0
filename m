Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE616DEC3
	for <llvm@lists.linux.dev>; Mon,  1 Jul 2024 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859920; cv=none; b=WdCsHZVVl1PkYeOlH5Ns1tTFN5/WsLCIe1MfgeZ4Bf86H8HvJp82QV9ISz1ly/4hzT572RJvJaCRSVPmzWeWDzscclzLKsr+Y+jSV95SUB4Zl5wGaTXMDFY109TK5lJ6w5eQRVfbrz2WynNGwQKTT9abc3LtJlwvUKpnHkGTCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859920; c=relaxed/simple;
	bh=D1FfI80APT75GF2QjHis1jKlW0nJV+tood2WPBXp17g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6NAlylyIR5/QpJtQ3U765iZXN13kZJ34+1he+OS23sJkNwq1TifYv/8McG4cmr+ktrmZCgbUhgOTZo7dgOvzhf+iWs+zJacNwvGgC5paC8lSjpEM0yefxwN0kxYWLGFcAhEfmDuv7GEB5Be+iRKSSDovWsZLMzTwoxnhs/ySVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nTQbXzhP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nTQbXzhP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f4a5344ec7so23981515ad.1
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859918; x=1720464718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anHX1DM3URGCkXrGn4JIrBeC+s/73VzKMiEIav89N4M=;
        b=nTQbXzhPpiQwHk1wt65lMfhxLV7nLUijkBuGV0g0U5njgK/ozkS2zCUT4qCC6qR4sm
         lpPj5HmCn87+H1gqrHGp0chtRIT91Uui1OztZt+YZIWqCwC3WxfAJt3wHnYi/D2b5Dfp
         QD3XlEDGKML9jfs8Nf29jsEXO13GkP/QNdke16lnhzxebDiZrW8gBUl6hqItJYi0poIg
         A+UpyUeQgIibyIELiOznJXbodLs5McY1T1ePHDFfQKNqa57FhRKO3lqXHkqddW1r8BT1
         dGi6XPi8ABKb/SyStBSsMqYaMGlmHrn796FQ+gzT8OJvbscBI2YAEY4MMWcNoZfl6QNW
         4Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859918; x=1720464718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anHX1DM3URGCkXrGn4JIrBeC+s/73VzKMiEIav89N4M=;
        b=sFZOGC8qTLTB+tJQTgQ2ZMBwph+DkWYif5iHz3Pu/30CyScKz5q4a9Y2LPCgNQbqgl
         6Yc8etQ+cOaZytmlzUmhDqB/ecMjYPOTBm3Ii1gQgOhMAZEAX4YShXb3eu5h5MHJBak2
         GWB1OkO3YRSzDn8Frt0LuWqf089eUBBrsuRcHfHBz/uCJT0leg0AyDSJe3w4IUJHyjWQ
         cisGQ4s8s/vyTYvLjYbQJXHqVDU3PoQyMt/IoV07SgCMrDuUbMEnQ/mQDPCtOqYCHVoM
         13/P/lVJ075Oa+kteHWIb/3Gi47Drzj84qLgHfAZQPt4HsrvEvlBw6p5LmU/2k+yJmJ8
         2hJA==
X-Forwarded-Encrypted: i=1; AJvYcCXFzhB0VozSpbwd8PwrKm4kQ4pG92eDtRJLeqMYwxWT2mlmElD591AaOLb5PgjNfjH2ljTaqNIDI5eyCs10cQO62E6EAA==
X-Gm-Message-State: AOJu0YyU510Afh9awsalDG7pLRTYivpRT75yWBO6j6dGk1Tb4TQB460Z
	i009hhY2cLoRJV64H//UZ6C3zB10pTI/DSQArtR3285CW37/iqD8nNqJKVIzFBE=
X-Google-Smtp-Source: AGHT+IENBUzEg6ya4sq7aW1QaFBBcsao6oM/eWof/SzwO+QqO8+WPKu4MnxkOTanbSTh10xlJQnXDA==
X-Received: by 2002:a17:902:d4cd:b0:1f7:1d71:25aa with SMTP id d9443c01a7336-1fadb42d78bmr110124205ad.6.1719859917674;
        Mon, 01 Jul 2024 11:51:57 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:51:57 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/4] RISC-V: pi: Force hidden visibility for all symbol references
Date: Mon,  1 Jul 2024 14:51:29 -0400
Message-ID: <20240701185132.319995-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate all GOT entries in the .pi section, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like arm64, for the
hidden visibility attribute.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
---
 arch/riscv/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..1ef7584be0c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
-- 
2.45.2

