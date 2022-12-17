Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6F63F
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 04:44:58 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d2-20020a170902cec200b001899479b1d8so3010090plg.22
        for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 20:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YND6/2+MHvKx/dzQIvDqR3IvAStElNFUwtkZlZ3WKgQ=;
        b=QMd8J7EJRoRyHw9X4KgOQl8PvNtaLwUhiAS3fSGBCOFhPoHi9xnvzQDYxVD7j5amTH
         Q4GsEYMqTBsn7iQ3GKJlOQR7EYCNqdaNx2qM4/U0btqkZqTcRMc1G1ID4ksjk8w1ygdM
         DAJeLauQhKJzcld5IN4m9ojYJJXJWXH/+Ncc0RYib27ehXOQzrkybiAFl8r2x8Ptjl/S
         +YkSCxfYkmE6lb0ISCS9tQc9f+6I+0E0L/Tx5CAD18WVWeqB1ST40GnnDKUI3RFsEfBa
         yGtQZgSh/2My4u1fuJc0S39x7Y8SoUOc2boVv2C5FpiuBzR3ANMP90xclhrEoiRdL/87
         jXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YND6/2+MHvKx/dzQIvDqR3IvAStElNFUwtkZlZ3WKgQ=;
        b=Zy6shIAJxl/kE/scOvi69z65eSIbfz7kSZWUGIE8S6dK3GBP+lgHcX2SuPbqqd0SRW
         gpuWjj/CCGo3NBLJc3kGwuB1ZcLX25PUa9NLXdPndt7VzIe2b1WBXix1T/UjfGq4flI0
         DlMz5vT8nH9zC43YrLja2espiza3esP79HGE8wI0Z6BQWwWC7yVzhoy9Mo2qtFw2kuca
         RYWY/Y3/IzcMsXCeoZ35NZ1sKxs6ExpFFP1zW14liW1Y9PFk55iTSEIhilakcqOieMxY
         06Z1929jbZsEPF+X2T3DSao3HdpKUhWw0dkx6+35qFK+Oes1usF06/Wo69mbNV+98MsS
         BtmA==
X-Gm-Message-State: ANoB5plu9Fgsknp7w8fMOmoaM52tizOPxpMuGL1TcyoSlJiy5XPUaOcN
	z1kDnYXO6mHxueBKsHvbUVO30I4EETfcWA==
X-Google-Smtp-Source: AA0mqf6DRN18kEtRr6vU/bQebITkL+OzR7rXnAWVsO4WmsI6YKnoCOGcBUx49MMTn8GtKKmZYYEz8T0hXzfXAA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:902:8698:b0:188:e255:39af with SMTP
 id g24-20020a170902869800b00188e25539afmr80407695plo.86.1671252297906; Fri,
 16 Dec 2022 20:44:57 -0800 (PST)
Date: Sat, 17 Dec 2022 12:44:36 +0800
In-Reply-To: <20221217044436.4138642-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221217044436.4138642-1-davidgow@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221217044436.4138642-4-davidgow@google.com>
Subject: [PATCH 3/3] rust: arch/um: Add support for CONFIG_RUST under x86_64 UML
From: David Gow <davidgow@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	kunit-dev@googlegroups.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

CONFIG_RUST currently supports x86_64, but does not support it under
UML. With the previous patches applied, adding support is trivial:
add CONFIG_HAVE_RUST to UML if X86_64 is set.

The scripts/generate_rust_target.rs file already checks for
CONFIG_X86_64, not CONFIG_X86, so is prepared for UML support.

The Rust support does not currently support X86_32.

Also, update the Rust architecture support documentation to not that
this is being maintained: I intend to look after this as best I can.

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/rust/arch-support.rst | 2 ++
 arch/um/Kconfig                     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6982b63775da..a526ca1c688b 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -17,3 +17,5 @@ Architecture  Level of support  Constraints
 ============  ================  ==============================================
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
+``um``        Maintained        ``x86_64`` only.
+============  ================  ==============================================
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index ad4ff3b0e91e..4db186f019ae 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -28,6 +28,7 @@ config UML
 	select TRACE_IRQFLAGS_SUPPORT
 	select TTY # Needed for line.c
 	select HAVE_ARCH_VMAP_STACK
+	select HAVE_RUST			if X86_64
 
 config MMU
 	bool
-- 
2.39.0.314.g84b9a713c41-goog

