Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E86539D
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246690; x=1708782690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gL3Cs2+m/4fshHcUNF4uRlCTHPwu5XQNW/5CYVP3NRU=;
  b=iP8Ek/BCPkh7TYNXkzh5efDhK4kG593GcdZGSmpTiJJakTg0ErwVFmtQ
   oSUS1YNK7i0NH7/Uudl+3kKp8ThgfrbF09O7Cer9+/ZxrdlwvkP2U51L7
   ZqN2//Ym1EbJouijRv2tC5YzK0mtpqWWF9/3KlH3snqcN7qgfGdSZd26h
   p7AjF5mSxvayLzWdX03dCsYjqOdE6ybZDJXSJoRn/fhGXZjXOVj3um2LB
   aeXJ1lmFVGcY2UNMhsDagtHF2whNkpfaGAYBDjVmDTfiOApM+IibVWPl7
   OvrcNF3lrZ4SCc9PHcxdl1+WdYShx0LZYw5DsgBZxHNTsbZfHIgR7Fa0w
   w==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923417"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:24 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:21 -0700
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
Subject: [RFC RESEND 0/2] RISC-V: enable rust
Date: Fri, 24 Feb 2023 13:50:42 +0000
Message-ID: <20230224135044.2882109-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=conor.dooley@microchip.com; h=from:subject; bh=gL3Cs2+m/4fshHcUNF4uRlCTHPwu5XQNW/5CYVP3NRU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/DqyX/be4ynaJ06921nXKl9tk5qT9mD3X4ciGE9WnXQoS j77z7yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEoqsY/ucUZijfbD/GaTebVVrZwG PNqjed5778FN916Yi6WqpH+ndGhpUu9zVn9TZPebhcMPv6pm+CzSc8eFpXTAjz/PnG9P/ZaSwA
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

Changes in RFC-RESEND:
- fixed the asymmetrical additions in the Makefile bits
- added cc-cover to my git send-email command...

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

