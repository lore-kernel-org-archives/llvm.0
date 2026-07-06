Received: from out-06.smtp.spacemail.com (out-06.smtp.spacemail.com [66.29.159.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C1386C21
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.29.159.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306341; cv=none; b=Rl2P2VExcE51zw1beOzeDxTRTONcg6ZZv2i9ramI/Y2UqC5MQzDS47Mw/M8n/Z8tZLxk9cZd7JyKI3ZarZGaekHSThSHA2YertekvlQakZKUQav3cBhseHq1x7anh0pxgDhnidJGjWfh7XdI6GV955M0Lp8+Pe4KD3pmL6wc6Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306341; c=relaxed/simple;
	bh=YUbh1iNoSwvi0CNJEIupQgq/DiXRWry+nqS+ljqlZbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EpMIyEWh9alL0xthvKdGrJDdBGhqUQREDYJji8D8MdWI2LwBMuam/DYo22o12XirvpJ4zl6Xs1nPqBwLjXQrMsucjtrIzHUVdkZstKN9DnMCECA4WcbYbq1f6YZZneyApRmJW3b0OYcfWQiFT8N/7b3mj7DHErVvrnagfYhYXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=BQxyIMAL; arc=none smtp.client-ip=66.29.159.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="BQxyIMAL"
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gtpmQ1cx8z2x9F;
	Mon, 06 Jul 2026 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783306327;
	bh=NnqR4JyUDyRYRTafEbt4K57u5begKiQTLOM1sWepyzs=;
	h=From:Date:Subject:To:Cc:From;
	b=BQxyIMALPYtm1EyydehD7eKiwKc1JRbGvtsIcpp4GnXYP4LnVcLgQ/diJW9j8Lm2c
	 7qU/mr/r4sQ0KeR1MxvXD/aoREKTYu+PVoLBkibLVbVUp94iuI9uQPAqC6RT1XBfIG
	 h2WaivXVIhMMOd8VVszS7ygM133WYsY70Mu/qsmishZKWLBPJms1dcfwQ278Q3dKHJ
	 OM+UBulPPE9iukPRJIAsznhLaHdaNvEFVymS/0vrUhSnJp9h9QgMn1noyo7o7jnVyg
	 YFs7i1JMEOZDntmfpRLWWydMJSX7QDkLbQmuwhGG0/qLZNMpDsoAE/BGwCeUvlwsT5
	 gManYo3UllHcA==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 05 Jul 2026 19:52:05 -0700
Subject: [PATCH] pwm: th1520: use vertical import style
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pwm-rust-vert-imp-v1-1-753dbbfc6061@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROXeSRdB6lcaB3cE0wWZm0US8e
 7ccv8P/H6AkTAp1coDQxsrLHJE+ErBjOw+E7KIhM1lpKlOg3yeUVQNuJAF58li82tylz84Z20P
 svFDP3+v5bm7r2n3Ihv8IzvMHuM7sunUAAAA=
X-Change-ID: 20260705-pwm-rust-vert-imp-59a3d18bd0cf
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Separating out patches per-subsystem as per the review feedback in [0].

Tested via:

    $ make LLVM=1 rustfmtcheck || echo "fail"
    $

[0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
---
 drivers/pwm/pwm_th1520.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 3e3fa51ccef9..2a3b107157ac 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -23,15 +23,21 @@
 use core::ops::Deref;
 use kernel::{
     clk::Clk,
-    device::{Bound, Core, Device},
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
     devres,
     io::{
         mem::IoMem,
         Io, //
     },
-    of, platform,
+    of,
+    platform, //
     prelude::*,
-    pwm, time,
+    pwm,
+    time, //
 };
 
 const TH1520_MAX_PWM_NUM: u32 = 6;

---
base-commit: 1a4920940ebfd8d907858abd8f8dd09b13752946
change-id: 20260705-pwm-rust-vert-imp-59a3d18bd0cf

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

