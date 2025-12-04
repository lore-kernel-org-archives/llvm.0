Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623FA30F552
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834925; cv=none; b=mswdYJuRptlykd6C92R5CYAbPkNUHBkZEOLZ3t66hXOpk5HbnyztmwC0EukU9oXCNVPqYAhqkxzm3FUhY1mAnkbk/1VEUSLGSRmCSsvmmEzI6RUP7q5YYcuBFm8K0YRxon5X0jkDcq6RTu67z5cnYZXCsP2XPn8l1znmRtlraS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834925; c=relaxed/simple;
	bh=djzz99/Nqr+mam54feyNiv1NIFjqDBU6RJYwqgkk4Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjgmtK89/1eAV0o/mrR46Vw+xiTIj73ADONjQutdAESYzlAqGkXlXezSg+ajdfk7IhnhSO/OtLJB202VuxRL7QhQoDAL2Mfek0ZVjeoww4tTw3/FzmH1Gx/n6mHQBIMczj99TQbeD0I4hfYLB2H4jHQGrTF0FW0gCW6I6wUWk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB82xu5z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB82xu5z"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957e017378so828599e87.3
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=YB82xu5z4edLoa/2sj4c6XgWcYBtEBa6XGTvkTWtV3Hyi2c+XYRL9nUu8+YK0JNp9j
         2cOF7IX5j/gNonHowJX9iSI78W0DZsVan+ptW82wu+RprTkxSy0txnRpOlZ+9gx4kUQm
         oXT0l4Ou0xV022QB3uN+JvzV4W0nKaBJI5wku55T3xMyzfyruWSd4ceLqnT39zGZ5TTz
         x4DIw8ZcbIbO8HpIXCEFcWP2FP2SXg145RCPNMaLfNTNj3UXuo3feNE5gx+jP3Am78G0
         6zCyC+hn/tfngrZRQqAti390H6eGiW7WFci0umrb+CG+Ubr1h81dm170pReY24BP8K+l
         STvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=mBrKReum6aVao8kx69Bp+Re9lfmcphyGW+4hFdHZjibxrMhnVmecZpiCKTsMh3YBYg
         NoRjpQrYoH5Raqo70pIyXMWqQYrdsZa+aCz1JuMdqHxzq379vSfLFkkssT854bUv1+sa
         F/4JjkFh629PwTcQqCFhcBK6bXR6iNbBQwoOicInR6z26YLrH2y86wYUyO0XygzUeZEJ
         TRrNP4h+PW6ILRISKYm0VPCOzI5VQk0v8B0WQx4WPD717X1WKjDhCPQq6OnF7u3TjS95
         /lDaK59gTg3mXqZUgJl9X95lExDr5hgvcFhs6VKBpvNYpyJk1ZL4EAPnqz38wAfz73Hc
         Lj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6MF71Qj+l74hmBLxxhXyCXTz4VD2+Kh70RN3F39w1bB7ICw2xRDfDOhHIvbQgx5gD73dL@lists.linux.dev
X-Gm-Message-State: AOJu0YwkD+t1M8gZpEtOk956ugMwvfwGkuYVp9fRa2KQAs/3Hfjnd11c
	B5PjII3sPlemBWiuHuyjqenaOjCkgFDsDod6ifd3vSOCtTqfDb2f16GS
X-Gm-Gg: ASbGncvv5QyiHwH9JNvtqjWXteX3yZFtdwKlDARYBJJkldHvScrnLpiqGRJxE/yI/aX
	iTTrtl2P4CRs/Wiw8eMKYV+fy6EbCL9IaisUvydSQCpnfOVG3unNMFfm+XXHZH1UYf0gDtYN3yP
	J7X2wIcX54tOdwG9BRK0b1WHK9O0VRXlJhT8ecuvVRXuHYLbKoyyFk7fIJ3XYxLz7TNcxy2ZMjb
	FAbX0i3+b/ShooGMLI87apI7dV1HRn8xtPymHvbrIwMfHpPc6GoaOP/06OZmfdwk0XWmzbeSIpb
	yfB1ulgdLnGbyxJvmWOVen3bQZsEg8b2jpDc/dCmNm9STmFoLSdB6t2oo4+kzu+/ok1ew5hXwlT
	BnOyaUmUT2rgMOPjOwNIXVVzdKaNXGo6mxtszqwD701SSUFG5kbS+9vgj/Xj22JmMvzYP5A==
X-Google-Smtp-Source: AGHT+IEldMEBa+Y+2+8e9BBmMa+iraf8wmEl/ZT2sdU4A9p2jyG2tZG76w7egCqyyaaevWjMOuPaow==
X-Received: by 2002:a05:6512:3c9c:b0:595:9d6b:1175 with SMTP id 2adb3069b0e04-597d3f27914mr1982243e87.14.1764834919940;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:51 +0100
Subject: [PATCH v5 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-1-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
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

From: Asuna Yang <spriteovo@gmail.com>

A subsequent commit will add a new function `bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Therefore, move this variable to a separate new `Makefile.rust` file and
include it from `scripts/Makefile` to make the exported variable
available for use in Kconfig. Place the include in the `need-compiler`
branch to avoid including it in irrelevant make targets.

Since the new file name is `Makefile.rust`, it matches an existing
MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
file is needed.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 3 ++-
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index e61f1300fea0..bdbf2025e68c 100644
--- a/Makefile
+++ b/Makefile
@@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+ifdef need-compiler
+include $(srctree)/scripts/Makefile.rust
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2603b34f9833 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1

