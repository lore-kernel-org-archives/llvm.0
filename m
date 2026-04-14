Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D2B388375
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153924; cv=none; b=XTu2dOI+8FH+dXGXa6EphYScusZOubePZFYiS7K5ZIgj8cnORlx6wy6ymP+uv+YhNTsLKRQBGJwUOMkJXlTTGI4+av8sF6MhS0x1DQ5h4iWvpp4d+4pLy9XNv4m1xtda58M+YECGLOAW7Z/YxJccs92COXq54k9P+g6ahuJYRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153924; c=relaxed/simple;
	bh=xRfot5V410ko3VC/JnSvckBt3VT2Kyp1M6wEsrFm0ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBoLzPO2h/oPfKD2rCxYB3OcV+Nfa544GvvexNSXnIqI0DhBByyTp3WRJqOoOxiBs7bgCvtIrAsBNc7aHko7tQIjdy0zpnsCbLKiTZCb30wh5KL3kXAbF/x9dS2AkA9SipfoZ04eloYdOklBdOSTX/egSfZkgGCyQyQWfKteFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=AOlV6OVP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="AOlV6OVP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso3857348a91.0
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776153921; x=1776758721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6633lJHMBTkrsVPQmGB6HI2mM0l2A6MHXZK2D7n6dc=;
        b=AOlV6OVPoqFGhnnyPTzhvVbFEFS9z6RvvpEwGJFRt6ylzzYh88YOj+6n8yJZlSC23Z
         s8sWrYzLSt/8F11Rmc1y6bCmmoXcdo3V3aY0nTA2il9Hmn6eQbJHAsmDXz7MQGGAj4Ea
         K8grI5ttfS7lyiugiNw2OXJXpztdqt/9SStZyrrwnBAsqDkQEAWeTdysmBW6FVzyIyze
         W/9TtpJuop48CoPmDCiqpqyFhyyUOOeg5CAjdE92z/6v+5GqphJASK9VCc2pDApnquTR
         U5o64xA1YObt2mw2YM6Vhoy6lGLeMeKCABEWAHeH+Acqdtoxt1p3GIHtSa9rndOHq41Q
         bD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153921; x=1776758721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6633lJHMBTkrsVPQmGB6HI2mM0l2A6MHXZK2D7n6dc=;
        b=LSPtKqMo+WwtyX/bVYXo3v2ksJRZfib3Yd2+KJpZEz+/J1Z90pNAa9DgfM85b6eqEG
         NvDYa0sJ1aaop0SAzdghYplfHC1GDkouULNsex2aNlLCVzciWCT2je1pzpX22k7/vRxE
         vLz24nwgVDZCbhnjEVcv+ejDZ6vPT3qUIUtiRuIHBaE3BTNkrDlU89QvkXndTCXXkkhO
         kWDEqPPerFzEhsakzLLPXG7YCasK9C81ZuN/+YTyKQi/vXXRFbR7XT6Rz93CcUQAA3B1
         +eiQUEZht+ENCpM4PluLXKdwD7nks+r4PnteHXMf80r7mQejCjR97mU2iXGxFExAuJ9T
         mYzw==
X-Forwarded-Encrypted: i=1; AFNElJ+flbZU84F1L8a7ZfU93r2e9e7aNTTCJU9BFATW3JYmcM6OgY2x9Il2nNJ8tgzGcY1pFs09@lists.linux.dev
X-Gm-Message-State: AOJu0YyKG69BwCKhvobUpIzkL/x0XTZJ3EtYtlbGUdJ3AV2VKwsAtzN4
	eAgNl8dkRsMWJ5h6o6cNAwOPPnEd8VypZyUW0k+ulMA6Aj50dCb9wbzp25ILAD7io3s=
X-Gm-Gg: AeBDies/W+rQr1NUFu9E+epi6Qy+WegwLouQ17n9XoMHgeOAbqAJamHoIegkLEtr/7v
	kGPj4eyYOXYYOONcLez2VvQ2mqvm/JOEmCdQhK2ey43VB5+yqMX4A5NqF1fjoEl6m6aqvDF/v3Z
	WciqIHKlXW+rRb5EPiqVWEMuCBTfggKvqwibQpRTYiMMHJX2UoWrp4SBcV8wPFSytcOpvhz5VsC
	K9JaLlGRyPivBy9W0Rkgspw8c/wKPlZvUQAUgi00HgTKhJsx52KXkn0zB3IdzrL8sVKNV2t5iwC
	VMIWNEknon/Tm0XTS02JJ6WW+eukgqd1RCp75RNFWcvXUYTFcGk6PU911uBJEeqa8QsevPsGfNL
	z4K5pozcK7UyFarjwVRxJm7QOpcxmqStbQ6BNblBONtAu3dejB8FXNCH6uO1LDPBQH5Cyx+YPJT
	MzV/C/bztvYQ==
X-Received: by 2002:a17:90b:3e8a:b0:35d:a542:2dbf with SMTP id 98e67ed59e1d1-35e428320a8mr16108998a91.20.1776153921460;
        Tue, 14 Apr 2026 01:05:21 -0700 (PDT)
Received: from xpc ([2400:8902:e002:de21:a5e:ca8a:49d9:fb8a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e3fe18sm1243071a91.2.2026.04.14.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:05:20 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	loongarch@lists.linux.dev,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	WANG Rui <r@hev.cc>
Subject: [PATCH] perf build: Add clang and rust target flags for loongarch
Date: Tue, 14 Apr 2026 16:05:00 +0800
Message-ID: <20260414080500.320095-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haiyong Sun <sunhaiyong@loongson.cn>

Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
so that perf can be built with clang and enable rust cross compilation.

Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
---
 tools/perf/Makefile.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 15fbba9f4..1340744a6 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -27,6 +27,7 @@ CFLAGS += -fno-strict-aliasing
 ifeq ($(CC_NO_CLANG), 0)
   CLANG_TARGET_FLAGS_arm	:= arm-linux-gnueabi
   CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
+  CLANG_TARGET_FLAGS_loongarch	:= loongarch64-linux-gnu
   CLANG_TARGET_FLAGS_m68k	:= m68k-linux-gnu
   CLANG_TARGET_FLAGS_mips	:= mipsel-linux-gnu
   CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
@@ -1167,6 +1168,7 @@ ifndef NO_RUST
   ifneq ($(CROSS_COMPILE),)
     RUST_TARGET_FLAGS_arm	:= arm-unknown-linux-gnueabi
     RUST_TARGET_FLAGS_arm64	:= aarch64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_loongarch	:= loongarch64-unknown-linux-gnu
     RUST_TARGET_FLAGS_m68k	:= m68k-unknown-linux-gnu
     RUST_TARGET_FLAGS_mips	:= mipsel-unknown-linux-gnu
     RUST_TARGET_FLAGS_powerpc	:= powerpc64le-unknown-linux-gnu
-- 
2.53.0

