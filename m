Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997310F1
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 00:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778198937; cv=none; b=VBPkHwSBghhV5oMPpzCwWnKRKN/yYlA29ot0jM4JFpKo/lB13DDDmfJc8icYQJOhR3NW9dSfZOiRGi8RyeO48RyCu1szq450Kyymq29EPawe3SYqyGPB+u57CmHivbEzjwdZcWUkn8b2vGdBywo/pSbQtUxzOd/bgqxJl3MaK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778198937; c=relaxed/simple;
	bh=S8BZCxovO9b7N1yNjqQbGm2G8ks95+KJFQvDYlcZ6nI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuS9lpgHoJMkOCczMotTW+r+tmLJ13ru7U3R3Fogvq7lcd9Q6W2WtNqiAU5QMKrpn/wpd7DhvKaFsLF32rYXJ4R7HXK5pNtQyqpoBAFUBPNJsxC47z3cQcRF6h4C62sO1S/ib2pddeB5jXlhP+6PXVugiWFBLAQ+fLIIhI7DGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J63h7DDc; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J63h7DDc"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso18880916d6.0
        for <llvm@lists.linux.dev>; Thu, 07 May 2026 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778198934; x=1778803734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiMsd4QNZdhgq2TeK7b6UP9/6dhJg0SmZyNtOPTS9/w=;
        b=J63h7DDc9hjrbv4UPIMdM41KI/fcYciAcG+wt01BImpvuO/tOJgHz/xm6i4xmSCoAH
         puS9OQrkLwKhn2o812EpuKyLkcDExsJvHtG3jHYwqRZ1Wbr54JIl1LbT0SALeovVsAAA
         sHgkNBc09I2TB+Qh3T7HX18/rDfVvMRJ5TFzjDXEvU4mz89FRqxZadO5z6YXrvGuG1qu
         dz8H/R0sDepL4krvHsjoYa185bH05HQCRQb1fUwffedbaGIhQEquXH7rE9bV91uuh3vd
         UE/t5PzxQUrldd2rETmMvq51ZXHCdP1bWSJYALaW0kcXqlgStjeZww+KjTfxgEsULaOD
         YV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778198934; x=1778803734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiMsd4QNZdhgq2TeK7b6UP9/6dhJg0SmZyNtOPTS9/w=;
        b=qFHkLw7bTnsc8FHXqWKyWF1TUU4yOfNO0tM59JgWujkRWq5HBYq4/iHS3vgxdMR8r3
         OKJ+JEyG9hYbZ86kGWFkWNClNkSlPzuaHx48NnpJHi5ar9OffIoNIOuzfzkmqjT4/wdh
         wZtJq/OI0fpo33tkPJsZq26WOvflMdbQqnPXpjbkLdeAt1yFSTcg2gCumpYAYI8hgrJt
         kIIIeCMfZ0SdWjOBre9EZKHJO9Kjbls69HCcAdsSmTfWAyecxYqtztFuEi/X8Y6PNHQD
         HJA0isus/D7HWCpJd+NZ++W1Y7HKP7sJoG0A97SfrkWWXK7z7uCioJ3Wn1xypIb9v9se
         CTUA==
X-Forwarded-Encrypted: i=1; AFNElJ8KDwHWL2aGjC2UGPKlN3ZbNYGQuEoSx6g5odOioFlXE9FLVW30ChPZp3D6NHwe2hfYfnxa@lists.linux.dev
X-Gm-Message-State: AOJu0YytLSvBTh9OFrE5lMWfkoSXhOhABoTp+TWHzzwm41CZOI5pWcxg
	y40q37k2nLVlObDmX2eljYJeTP5OyxSvANIBD3RATurBLGQOA1kOyLY2
X-Gm-Gg: Acq92OHUskXhYPCArjUwwGk0+dDjGv+707DQX4h1gh/KlnMmAyyugYx7lU0pLLl5Elh
	nfMsNvKZVJrrXhGwkvdL71PUnw7yMSu+J+3eJs3OrCZlNIDo6/Y5yq4gDrMoONue0xAr59Zxb/t
	BwuLVZwXuOxSH81yiZDUwFMfo9+Po8g2qO6CDO3B++zTv8KFZpLx6b9ZNWahkOy8twG2IfBt4cW
	4rrJc+OzYYlDOLlfWXUlVjxsdcpWodwDzIngv7l90BhNOPofNX/g2/rgLsrOMYLg65Frv8rQmUi
	cVBe9th8ks+Uo5hPRKhJYZ/icFsFzqoBCTtaqw0OFArlwEMNZlbKwYym/+MY8zK4Psq8tcBfCFy
	S4XbtvpvEP0tiaShRVnnuOQAQFWJryeov/+43WM1HXXBt1xdxu6+fjqxloBiY2fQghxK86/MT1o
	o5+n2zMxO+kDw4fe0jNOuT2PV6KxDHjUH3xO2h837n9+idwLcLcTjcWK/Msc0Nvde37w1VWTG8a
	JTb0AudoFqgWOAvBltMjpDYmJviO9/xilqchFleUkTxsQ==
X-Received: by 2002:a05:6214:2424:b0:89c:e2b4:4ee9 with SMTP id 6a1803df08f44-8bc462f7c01mr163074446d6.46.1778198934362;
        Thu, 07 May 2026 17:08:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d450dcbsm222060286d6.45.2026.05.07.17.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 17:08:53 -0700 (PDT)
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
Subject: [PATCH] sparc: Disable compat support with LLD
Date: Thu,  7 May 2026 17:08:34 -0700
Message-ID: <20260508000834.834824-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An LLVM=1 sparc64 allmodconfig enables COMPAT and then tries to
build the 32-bit vDSO. That path cannot be linked with ld.lld:

  ld.lld: error: unknown emulation: elf32_sparc

ld.lld does not support the 32-bit SPARC ELF emulation used for
the compat vDSO, so keep COMPAT disabled when LLD is the linker.
This avoids selecting an unsupported build path while leaving the
existing GNU ld configuration unchanged.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/sparc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a6b787efc2c4..681ab2fd3d8a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -474,6 +474,7 @@ endmenu
 config COMPAT
 	bool
 	depends on SPARC64
+	depends on !LD_IS_LLD
 	default y
 	select HAVE_UID16
 	select ARCH_WANT_OLD_COMPAT_IPC
-- 
2.54.0

