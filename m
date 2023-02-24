Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D6539D
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 13:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677245845; x=1708781845;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aZzsSFvg1UfLqYXxjgJ2eB+4H3YgR+M3br8uQwZVD1w=;
  b=OsZITTnp8pPdbDtpbtmGa7WHKBlG96Ri5VTGXMNnU3kJW5CeFXmAeE1K
   3IMTh/D0rgJ5BMM4D6EB/kKAvSPcnBWROoSJwbnw9AUsE6SfVw7mCgKAy
   XQDlFJk+oq8UpWvyFnAapLTiquCcSaYTSEQ9mMsGOGrWNtKmDmwu9klsG
   DmGs+2en5fawdH79TPYdnsK1CbRyBmhA+b+DQi/XJ5NxoqwdE1tw5sr0F
   kiPZGB0VkXFKka+APqNzxTULJ9Yn+qaO6O6TuEDYQlFBiQ2ZHB3FI4gLk
   og8ftJhYQuAlLne8YxS4ZXT8J3U6z1XudhGNFy0HegLb7oUqimIpWoxP+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138922155"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:37:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:37:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:37:17 -0700
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
Subject: [RFC 0/2] RISC-V: enable rust
Date: Fri, 24 Feb 2023 13:36:08 +0000
Message-ID: <20230224133609.2877396-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=conor.dooley@microchip.com; h=from:subject; bh=aZzsSFvg1UfLqYXxjgJ2eB+4H3YgR+M3br8uQwZVD1w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/9rocvX3IpcHZwESXJXif4QPzG+uS7Z+U/3R8YDjTJC6T zbipo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOxMWRk2LhgbcZ94f3W9/ddLXNZq7 b64bvUiUmuPRJzVryeG7I6K4aRYUr5E82VBzfNVau2eiiQ6377v52T4gt7P5kbB5xL+Wr42QA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a somewhat blind (and maybe foolish) attempt at enabling Rust
for RISC-V. I've tested this on Icicle, and the modules seem to work.
I'd like to play around with Rust on RISC-V, but I'm not interested in
using downstream kernels, so figured I should try and see what's
missing...
I've tagged this as RFC in case I've missed some "WAaaaa you can't do
this" somewhere :)

Thanks,
Conor.

CC: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@gmail.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: Björn Roy Baron <bjorn3_gh@protonmail.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Tom Rix <trix@redhat.com>
CC: rust-for-linux@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: llvm@lists.linux.dev

Miguel Ojeda (2):
  scripts: generate_rust_target: enable building on RISC-V
  RISC-V: enable building the 64-bit kernels with rust support

 Documentation/rust/arch-support.rst |  2 ++
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Makefile                 |  3 ++-
 scripts/generate_rust_target.rs     | 19 +++++++++++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.39.2

