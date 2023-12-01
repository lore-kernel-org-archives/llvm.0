Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45E1FAA
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUJsJOze"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso14081765e9.1
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701421050; x=1702025850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEz57f4iqZ5wbUjNIKafkeeRwZy5R/glhsL5WersMuc=;
        b=YUJsJOze629BEcY7xxCk654LOwb6d+OUAGePHzPo3niUSOkKMKkBsETakDpdqCstvN
         vfS57NcIWhjCbM2QkzZG1WOdzfR3dtX6LOBWLe0UWCE3cHGrPiTeuq6SqKk/aGSwHg6e
         n+h4+ut1eE0tZBz51bsSKzLBdHGUX7+LGfAVnigrA80owaS9g/xKTbgnUhTXvrjzcAZY
         D5ybVTlatLEE3Bqy3Wmzv9WygqVIsB3baSkozgCm3n/GZrxzoVWgBsXTNy7hiX16sIbz
         NjY6Yr08lSCgQ7qszuxmN/YjhpYPXEw5Q9QtJDaRXxwAduPSX/qqgqfJ2SNxJdONPuYt
         R+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421050; x=1702025850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEz57f4iqZ5wbUjNIKafkeeRwZy5R/glhsL5WersMuc=;
        b=QtJESCTVN5OVUN45qUuOiB1Z0QGOyi+bSp6851cAesn5/gd5noLseYVWOejjv9Xx6/
         A1AmkZR8OmJhZdTHA/89zqe2T6edAmCrKX88Y8s+02oKlleB9sozx+ptDHKwKpV98C/v
         js4peP0LQc8HR1LoN72LAkdmDRDTlkI3BOoW2MEFzVDZQa5A0htrXUqMUJf4pYWuDQf6
         YkNV8ZP3Uf5c0Wi5WAqc25KYNABpiYOeVWx4LVUm9a3/gY0sU46wPEPoZTs/YiLKTHyz
         L/49vywt4rzHf412Z65nrsZOIDsX37fhl/m5a1SUE48V2YEXpz9O2db3b2S9LE8hLSiR
         8Dsg==
X-Gm-Message-State: AOJu0Yw+oEu2GQavYAgaOxJDk3aVkz2LmhMgOkExKIqZRK7+aLbc1c+Q
	CZoByPDnlJT/4uyGK9Rl3oE=
X-Google-Smtp-Source: AGHT+IFATjIq+Oq77UCymcOdvjYh4ZHRCZNif812JukWqyzxSmhzKo6xnUC3RP2OGuyD+FwSuw2jsA==
X-Received: by 2002:a05:600c:a2a2:b0:40b:5e59:b7d9 with SMTP id hu34-20020a05600ca2a200b0040b5e59b7d9mr245294wmb.182.1701421050257;
        Fri, 01 Dec 2023 00:57:30 -0800 (PST)
Received: from localhost.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id je18-20020a05600c1f9200b003feea62440bsm4753894wmb.43.2023.12.01.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 00:57:30 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH] x86/callthunks: Correct calculation of dest address in is_callthunk()
Date: Fri,  1 Dec 2023 09:57:27 +0100
Message-Id: <20231201085727.3647051-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC didn't warn on the invalid use of relocation destination
pointer, so the calculated destination value was applied to
the uninitialized pointer location in error.

Fixes: 17bce3b2ae2d ("x86/callthunks: Handle %rip-relative relocations in call thunk template")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/lkml/20231201035457.GA321497@dev-arch.thelio-3990X/
Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/kernel/callthunks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
index f5507c95e7be..c561dd481eb9 100644
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -306,7 +306,7 @@ static bool is_callthunk(void *addr)
 	if (!thunks_initialized || skip_addr((void *)dest))
 		return false;
 
-	*pad = dest - tmpl_size;
+	pad = (void *)(dest - tmpl_size);
 
 	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
 	apply_relocation(insn_buff, tmpl_size, pad,
-- 
2.31.1

