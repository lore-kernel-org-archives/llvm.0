Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E57396B6F
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288124; cv=none; b=I2It9SEq+x7dmsJ+kDFZtxq91K3Epr+DQRXkpeVt96NuQGlLhxwQ7Nj3ZbtZB4w3D3twajlC6KRC0a2FDVYN2qkIMW5zuZu8+y7qIOPbFyHYs92+tqdoWdACt8aIHCfdOl//eR8yVxw8dq/dyQCRqoXAKfIifHMNj80dWvvSEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288124; c=relaxed/simple;
	bh=vsANt1h9HdzXbx7N3oL80yOXLqH5oygsCyvZrb3biUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fz1LJr597w+vEOjx8Y04kcgga6ZJAIeMNef4BLgeR6mCDNxG3/yPLL5VKYvMf1X4GZrIoAqLqxRFr6K7Kf+x1TSedxQZZ4LARxPNrboQwKAdUQ2ti85Pgeau3LvZugdtntJNYlYPkCP2f39RqBTkmrRuJYJYxvfQVfSNYem4clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5dBRI9M; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5dBRI9M"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13809223fd4so1408343c88.1
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288123; x=1781892923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpLH7pAfvy2/Tbtaa6B4TgQbD2Aufq4wSSHnGDhKK04=;
        b=Z5dBRI9MTAv9JzOxpAS7+WJNv+KacomSVH2e4EOfbcCRZO3pXnF2OsXJ3yUTd7uiDB
         VOweGHT805ICzPIrWN5AFuyZSj5wRAxxIY2Qeua19oIFYiQarh6b99QEuLPODPfuVNb7
         J/zPulOU+4Zixq45kgjY2/exao+RYd1SMp2pRptxzB7BmrewGPHkvqjT4txyLBXs3I2C
         mUs7JUwaKIaWtv6LenliihlAb0mfKYlFQk/zPYNppjuMth2nyWz+tyXmvfj9Y7qjrhEE
         h5/PvUVfewfSzov6CAmaSXakU47VpAuizRST71z04oZPJODMt+yf/NJgfBhYgCc+QwOF
         aqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288123; x=1781892923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpLH7pAfvy2/Tbtaa6B4TgQbD2Aufq4wSSHnGDhKK04=;
        b=Cl5H4X8AZKaYw/ZbD/O7nx5Yh0L6JgkrlfgV8SzBl2FtW0WHVZq0wcyzzqXbt/iFyY
         EA0BymzLzWUd+faXC/SUb2qf8b4C8swWx18wz7pL3nF4KrzULjzwXzYtC5jO/m03J/lZ
         JqTubUfLXAn4IxIwBynjgyZiWnn/hBpjHT1/oRtK8cVg5tAZOxCahnJjq5STxbAQVmrv
         86BWxqZwObBLPqEIg+FADJ8jpSIQ+kWOI2h27Kdc6CxdP0ePBUhLeheKta6SE4+6tPha
         25iIYcG1EmtTZdhpm1IjWFeVjsdSHZb/5oFnNJt6N+3V8WTjz2YgbeN3n0eeFR8pvHey
         +4VQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GRjA7PIpQkc+3X+/zG6RrroMdrsy/Vt3ojsEuk2cdPtCSjsiJpThsvlNHw3BjU57v3T8B@lists.linux.dev
X-Gm-Message-State: AOJu0YzoqwFY/Y8IHITpLzk4kMJ/BYveueWHngJm6fJH0aBSjstl3jJ1
	HGG0sHNNSmPtCNj6PAksv0XQtbRC/7ksVzy1qiQMfcve/njb38T2jKO5
X-Gm-Gg: Acq92OHWCilsnsiiLMkuXSYRU482czWS3ZQAlOLb0WcJDxTl5NJqAtyLqfJ9xj4EmSw
	fvv6JqrHc+qGCuI+nsQqkGN6Frlw1B+N7cIDC3hn/2Ld14CE5W50IHRKGACpUdEx5NA+NsVp7bB
	nEAlnAQgd6mdcOLrHa3ltgvKN0Z94WQg9ohvSGUhJfpF2VfkpmrePSc1ZEk9eSGcQf0Wfz8AMrV
	VAp0aVglDJUuEtpBguF5gG/1BF0XfkNIuycOxva/Hl3zzH+Eu6x4Pm+tI7KL+lr+oWOtBO7/v/S
	IdB8yjVrsW+/vRwZHL4Q4o1HzvxHqVLsZb37HO3eZ6V0PWAmUFZkZPdlDgxAtEDOBKCDxJ2y1gS
	6ifMiCRFcV5R27C651GR1jof/g+DgJlOE3znzOIefbYMrC5JxeyaX8WQqdUpZWlJZDvtScmUcFV
	urI7H046rpnoK4XPxx8G4vScQE4USAdjLlCU4VcK7PkLnwsxVnoYtC4JG3PdZQ6UWkH4RKafnXw
	Jur66FvIG3NZtzbt08RdRxSU7kI+50tDQ==
X-Received: by 2002:a05:7300:e7a5:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-308200c2827mr1977791eec.30.1781288121023;
        Fri, 12 Jun 2026 11:15:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:a073:5e58:ab5:a167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm4765327eec.4.2026.06.12.11.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:15:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] sparc: Export mcount for Clang-built modules
Date: Fri, 12 Jun 2026 11:15:03 -0700
Message-ID: <20260612181503.4509-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang emits calls to mcount for -pg on sparc64, while the
existing ftrace support only exports the _mcount name. With
FUNCTION_TRACER enabled, modules can therefore keep relocations
against mcount and fail during modpost:

  ERROR: modpost: "mcount" [arch/sparc/kernel/chmc.ko] undefined!

_mcount and mcount are aliases in arch/sparc/lib/mcount.S. Export
the plain mcount alias as well so Clang-built modules can resolve
their profiling call target.

Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add declaration in asm-prototypes.h
 arch/sparc/include/asm/asm-prototypes.h | 1 +
 arch/sparc/lib/mcount.S                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/sparc/include/asm/asm-prototypes.h b/arch/sparc/include/asm/asm-prototypes.h
index 270c51017212..a39a24c53216 100644
--- a/arch/sparc/include/asm/asm-prototypes.h
+++ b/arch/sparc/include/asm/asm-prototypes.h
@@ -26,6 +26,7 @@ void *memset(void *s, int c, size_t n);
 typedef int TItype __attribute__((mode(TI)));
 TItype __multi3(TItype a, TItype b);
 void _mcount(void);
+void mcount(void);

 s64 __ashldi3(s64, int);
 s64 __lshrdi3(s64, int);
diff --git a/arch/sparc/lib/mcount.S b/arch/sparc/lib/mcount.S
index f7f7910eb41e..0309ba2c4712 100644
--- a/arch/sparc/lib/mcount.S
+++ b/arch/sparc/lib/mcount.S
@@ -21,6 +21,7 @@
 	EXPORT_SYMBOL(_mcount)
 	.globl		mcount
 	.type		mcount,#function
+	EXPORT_SYMBOL(mcount)
 _mcount:
 mcount:
 #ifdef CONFIG_FUNCTION_TRACER
--
2.54.0

