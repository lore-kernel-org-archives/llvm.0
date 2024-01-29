Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35F159587
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551558; cv=none; b=lwFGHHdY7KP3UvbWuh/jtaMBZ6gt00YDYhzxxBDsHiEOrwkCqzc8GMGqkaVy4Hv1Got0LPy2qVa3u0TwsLv/Kf2Vp1IqmE0n7g84HryuakniNVo2itUwmk1o/a0M/4ySq9LwP22SVui4L9GiZWzBXnlxZ2tLdDgo7bOLuTXFDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551558; c=relaxed/simple;
	bh=BHUup4Ao15H5a0x4s+HXfGoWgWU/14gkkZKIK0ZXAdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hjviLRNptwlypvTGWQrbVtwNlz+riX20FhqoApUHmBhyUp7h+Y4TQoKrTabsFLD6OwXg5U/hx+MPsmGMHY4pLHCQTwmbvZB4fWH1YyWI+/FT6vPkefTskE0PN7W1rZACYzbNGrVfa5hlnhfNxhETbztdIMuEFNP7Vf0QQe/iTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2t/f01pW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2t/f01pW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-40e8810b5f3so25160765e9.3
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551555; x=1707156355; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=usiDcusxejCbluC36Vpk0on80rVNZ7Itzv8e5WwmSQI=;
        b=2t/f01pWHxugZD/LgOBLOBJ1OD41TwMJTMXz4Nhqf4By+iXMWuv33h0vYPeAvGNLX0
         /pXX9WOoAgy2x6Csyt4GhdZRb3/xfKVx8LiTMoCfvmkL0wuGKXdbzOWybW05zwvhqrRm
         89e+PLKK++dbRLUuMy027RO+qlqknLPuba7x4VfW6W0wBNdh4KQgh1rpjRTEJ920VgcY
         +AqexEhpyYUfaSz3vp+qaBNFf8kR/eUC6doUeoWjrdabW3M0T8AsTdf7Qzq6e2Ez81ak
         LT5ujpwBhxOhhHbDC6j8hYRJeetyWnOZDwRuPFBWfr6IKgz9ojuxX2PH0lIikliU/sGG
         gqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551555; x=1707156355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usiDcusxejCbluC36Vpk0on80rVNZ7Itzv8e5WwmSQI=;
        b=ZTzglSOikWQ8nd5IeVKoRwx/zg2oyidPlzKrfqQWKvKQgh0t6/SOKrFm9zrCxYllxb
         UdU8QvPr/oJTyYxKKSAW5WOMP/2sWtyx0IyK94w6hbJE1s41sa7rKJsROxJHNC+s7UUg
         RLuSdW6qy6dL3QvwbIetAnuDBN24HJIeYsMcvU7uYrTaIiru2D7OYpxrmpLHdGdTDgua
         J1U+7xXPCqkXFKlXtmVKiiv5aSQKsFXcw7f/PemVgXoDFk1g/hx/8f6MUw0+OqP2EbMZ
         VY/VAeg5usdU+29u4jJ82wL1S4FgQiGthaa58kE93JRIb2ob0vSj+7b7Au7JsYH5xG/l
         6nBA==
X-Gm-Message-State: AOJu0YyxThNU4Of9Du4EojMS5n5L/0JBqeG7Hz0csBO8EjkpQ5JUWuqK
	QOj4JcT36SALrnB0GjhRIQ/qWoBxjrbrl/c1/ZvYU+J9LFMY9xEtzYyl2YBiYnhqQQ78dg==
X-Google-Smtp-Source: AGHT+IEH4d52wGH8vbNwfzvpV2wqsfdLfYYhb20TejcQqFRaHlU9GjFY3tNK9qHPkBnSWswi3vS1ehXT
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:1d88:b0:40e:f9fa:14ea with SMTP id
 p8-20020a05600c1d8800b0040ef9fa14eamr11573wms.6.1706551554793; Mon, 29 Jan
 2024 10:05:54 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:14 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=ardb@kernel.org;
 h=from:subject; bh=+Hn8XwOONyFACfVl0+TV+ToDQrCQwdquUdW+H4YgWKM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i9u7Fp4sj3V7udXtpNY9MXsR10NPBb0cuP92X1ry+
 VW5ZJd4RykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIfTOG/9We01eGNZ24aN3g
 GLjUIHZG9EL9Tn/mrwzhRufLA4NNixl+s9z50czfGr3v0OlmYdt8rSt7pp3lK5l6zCp89pbDm8z uswAA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-32-ardb+git@google.com>
Subject: [PATCH v3 11/19] x86: Move return_thunk to __pitext section
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The x86 return thunk will function correctly even when it is called via
a different virtual mapping than the one it was linked at, so it can
safely be moved to .pi.text. This allows other code in that section to
call it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 arch/x86/lib/retpoline.S      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a349dbfc6d5a..77262e804250 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -134,7 +134,7 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 #ifdef CONFIG_RETPOLINE
 		*(.text..__x86.indirect_thunk)
-		*(.text..__x86.return_thunk)
+		*(.pi.text..__x86.return_thunk)
 #endif
 		STATIC_CALL_TEXT
 
diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index 7b2589877d06..003b35445bbb 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -136,7 +136,7 @@ SYM_CODE_END(__x86_indirect_jump_thunk_array)
  * relocations for same-section JMPs and that breaks the returns
  * detection logic in apply_returns() and in objtool.
  */
-	.section .text..__x86.return_thunk
+	.section .pi.text..__x86.return_thunk, "ax"
 
 #ifdef CONFIG_CPU_SRSO
 
-- 
2.43.0.429.g432eaa2c6b-goog

