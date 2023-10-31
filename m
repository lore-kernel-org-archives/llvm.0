Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927DF20332
	for <llvm@lists.linux.dev>; Tue, 31 Oct 2023 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCnRgIy2"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5b1ff96d5b9so32477607b3.1
        for <llvm@lists.linux.dev>; Tue, 31 Oct 2023 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698783631; x=1699388431; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TIpaUvpPt/FXbzm5nKCXxMF++9wEyj/NimmkMOXmsLo=;
        b=YCnRgIy2w3vwc/eZNYzqQKgv5Iy6pc4jI49op9omT9FUr4RPcM85CURwEZ1uKNucVB
         nErOhVoeTv5GelEIMevrJtrMThqlne0ZynTkhML6OOTFDJz6wJduRy2T8AtFsW4k/W4y
         Qp0+uOf87HnpJBS+Y817Al2cVb6K3Itz6J4UAidNdoaB5nVCU89OCAJOlFf+ruGz0IZM
         3v2CmBPQzrZnZrayLNhhJgvqzNSswhBbc6UKZ16GoIk0XMsHDZeqZlWVMun+bvbE1mR3
         updtGiFKAFpuEMFjH+VzqY6dK+PDap5QKuLGil4DeHo1xSQV21mHMH5L2J0w76ycGqw3
         2pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698783631; x=1699388431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIpaUvpPt/FXbzm5nKCXxMF++9wEyj/NimmkMOXmsLo=;
        b=P34K+c4ZdsijtL+DST9SUOaLdg61ujUyd2Y0VI3fVs4mPOLwMdmOtE4JHx6R01V323
         MrMftTvzGuAxjVp5gy59IT1S/ZnCSniDVeCy1O3uAzysm2GpOBw8+wuArymEYVcySt0z
         Dg0LZrdWccQEslP/sMOt0SvBMHuobKZmUKmbSiaUzq80f7wXdqSycNP1rp3k7XItd6cp
         v/XSFuQ2YAU3juDEMHaCXGWXq2Icmvx+qu5EO76v4Xg8UxmemeMA6CDmmkNFQUTPaqBh
         VBUU16nD/Gr63xLg0/qs8S2EzD/Wo7oeOIcRig5l62zY4u6o77jrX2vp6p3V05Rfh65n
         VWzQ==
X-Gm-Message-State: AOJu0YxFGZ3WTbfEpJGIIgu2PBzZvP58i/isnDnJdv/74Js4Lw6/eNEn
	ykvNa59Fwlbns/IOvorFleumgUURP2Jb
X-Google-Smtp-Source: AGHT+IGLO+nOjD62+HLAfpYoCH9Rz2qtqF+wmxh11MaslROEb45vmSU864vwQzq+PEmwctuPBAUQaj3vRvU1
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:4c8:b0:d9a:54e7:e910 with SMTP id
 v8-20020a05690204c800b00d9a54e7e910mr278979ybs.4.1698783631471; Tue, 31 Oct
 2023 13:20:31 -0700 (PDT)
Date: Tue, 31 Oct 2023 20:19:44 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031201945.1412345-1-mmaurer@google.com>
Subject: [PATCH] rust: Ignore preserve-most functions
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Neither bindgen nor Rust know about the preserve-most calling
convention, and Clang describes it as unstable. Since we aren't using
functions with this calling convention from Rust, blocklist them.

These functions are only added to the build when list hardening is
enabled, which is likely why others didn't notice this yet.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/bindgen_parameters | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 552d9a85925b..8d9f82d350b8 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -20,3 +20,7 @@
 
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
+
+# These functions use the __preserve_most calling convention, which neither bindgen
+# nor Rust currently understand, and which Clang currently declares to be unstable.
+--blocklist-function __list_.*_report
-- 
2.42.0.820.g83a721a137-goog

