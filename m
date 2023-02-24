Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBEF53B3
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246692; x=1708782692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TCkNh4u/HJoVJLn9r2u33Qgna6ijjTAiufIVVsHyKZ8=;
  b=PflciECmNWGMxLMm6/+SfaVTvyfaiKPIFPxr1jdtlTbzzTUn1ATGUxqn
   VEqVJY66nsg78SsSX2vXGBgCxHXoq8WxRwpXz6hcnfkraYhd6mTMGv5gO
   d3epI9WHBH/DD+vMYHNjfj3qid9JhlxQlS17oglzZpJH2fzR2H7DkKItA
   maaleSFnoexPoiTD/ahuWmyhcSyFLDxqQQu/48iWM69l5MLdTbLAeJbwP
   T2BNPbZpjHQsgeGaf3OBH3LiHOSgEwIgQ6VXwz6n5f430uYhSC1JKoFIh
   7fg5URVlmLJDMIRkmk9vMrC9h23JHbDQrs5Zo1YbXgBUQo5rV4T/AWXxi
   A==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923429"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <conor@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [RFC RESEND 1/2] scripts: generate_rust_target: enable building on RISC-V
Date: Fri, 24 Feb 2023 13:50:43 +0000
Message-ID: <20230224135044.2882109-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224135044.2882109-1-conor.dooley@microchip.com>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=conor.dooley@microchip.com; h=from:subject; bh=QsTuP87FnJv8kjQnYjXUt2ZRgTNJmBC7A5v4jw6v4qE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/DmwoqlM8Npu9+sKdL28fS73Q9jNZKf9sgbZD2yPfwx82 iky711HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ1F5g+F8XuWHlXfFyzvi1cvPVXP 79fxB5a97XGz96eFm8fugdi3dj+F9fO585oFbA/1+8r/1+zsLbO0rUyyad3v9ta57G6jPHH/ABAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Miguel Ojeda <ojeda@kernel.org>

Add the required bits from rust-for-linux to enable generating a RISC-V
target for rust.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 scripts/generate_rust_target.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d..72428fc66502 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -161,6 +161,25 @@ fn main() {
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
         ts.push("target-pointer-width", "64");
+    } else if cfg.has("RISCV") {
+        if cfg.has("64BIT") {
+            ts.push("arch", "riscv64");
+            ts.push("data-layout", "e-m:e-p:64:64-i64:64-i128:128-n64-S128");
+            ts.push("llvm-target", "riscv64-linux-gnu");
+            ts.push("target-pointer-width", "64");
+        } else {
+            ts.push("arch", "riscv32");
+            ts.push("data-layout", "e-m:e-p:32:32-i64:64-n32-S128");
+            ts.push("llvm-target", "riscv32-linux-gnu");
+            ts.push("target-pointer-width", "32");
+        }
+        ts.push("code-model", "medium");
+        ts.push("disable-redzone", true);
+        let mut features = "+m,+a".to_string();
+        if cfg.has("RISCV_ISA_C") {
+            features += ",+c";
+        }
+        ts.push("features", features);
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.39.2

