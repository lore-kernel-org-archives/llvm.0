Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A3219A9D
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049334; cv=none; b=FonCXq9IA+76x/lpPZrzTWJLa9hnTIcO5jSdkQfQvE8PUQxTlnjsnq3A2wE7rOcg2pAviKvWRshZtvolvoxOsKBmjTh0zo79w1EkepGmK+hsh2D1qmSp1saPA+w5WGwrgh4U0NOzjAB3rDcCbNznTcotFU4qf3xpsbZBY2hGZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049334; c=relaxed/simple;
	bh=1xPajWgfwmwF/VCSQKTh6IW17wYrEsu9sun66yJMYC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LvYwFICPMf9OIAmEYlCRMqND9OBFLqAcl1W+rWwNzBUI4zgjDTgAl4EzJUr+WgbD8X1pBkhJlIqdIvgekMMXz2NUxlvJP5eMkagBbNCtyayVrHSI/p/duXw7tD3lo+lL7mdgsa4dUyrpx7GckSby78h3/H0uPGycxD6zIeIGLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkCb5gK8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkCb5gK8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22409077c06so57702925ad.1
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049332; x=1744654132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGgUcQY3LpMQzwnxjPDiN9+XewxjYA0t31wP+uhnCCY=;
        b=kkCb5gK8sv2cerb+ORsYYidgaTdX6Bl0lb8EQQfcJhl8GXDRb6Z41zto6Ce1RD5VdR
         pz3g2Fw8cjqQxB0QJmtwbJg9A+aPdkJJaZy0v1YGVyiqz7FZBT3XrvNH7ZWuB4zSe6cJ
         0z+uYkOLVs2gWDRW9joEb9647PIua3RD0rMwxzn3A6U0z503vr+hYSYKG65jsQiCoZMs
         beh5nwydK7e4ByqScz2FeoT+31+w+qr8sA2rZJh+hc8I3Tu4iTL9G5hk6za9Xrk7AEnJ
         kYQ3T3nNsa/dFEJEDwAxL8MwO0RactA6KXiRALN6N6f6cITxtOQcp/uqaVIH8U5apwR7
         xr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049332; x=1744654132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGgUcQY3LpMQzwnxjPDiN9+XewxjYA0t31wP+uhnCCY=;
        b=ZrHBGF+PibVEfBGv5gQ5koqFUL3hWTeBdoW01WbcVaNfIlAa3C/GDmDFP7fzzh8wjs
         otxYNI0T9i2cmPYXFedxW174/Gen5H2NMA1ivrK9p4gIzj13VJ4z8Z5DlkqwvQA3FAoj
         TTAMvm7CIeVLhyLUmtbcZ7IIVv4aJjjdY5rjou3J7eEhwOXhhUcYRB0WfckRBxA9RiGz
         21sbtR7ty/KciTxvtiqeCLR88PDnU+1Zjp+u9GttVP37HYEQ9LFeCvdmMIxjc6xyHd4b
         l2OyUYPerly0hmrtYTJl28y8Dp56EegEO9UnRWkIK1WB2COtP7XWWp82GpilROlm/T/+
         NSoA==
X-Forwarded-Encrypted: i=1; AJvYcCV3FvZS4wi/xaqMjXpxRkNsjAe8i51Xw0CKl0YtVj6ISeJ0h27c+yBtaLsPvhhpxki4mpkX@lists.linux.dev
X-Gm-Message-State: AOJu0YxpYBUrTHiyINOGXnusE24hsO1ZSvNizZd+1Mj4JcRUMzj+lse9
	L/sP74WZ+R4EcTDKc/JMQPtC1Zch3+MoONN80PA3lpqhlewm+l1d5L4xsaxa
X-Gm-Gg: ASbGnctKD+akOf5PWkRh7rQk4TbLIDya7/EMYXqv9ux0pMDDIR0VLfH0n4Z66RLmdmP
	xSgAsvXTSI392Y28fFwX5vO/eK0eM6TBmZWdzZUsDi7zgtrirQf7DJy1o5PB/2kF0fX4d4nFEEy
	h308o5k3ejmDjdYCunUmhuQ7kThwcEhnIX51ntA7WiXvRcHCqc2UHOMVVHLxUp8OobSfgkLTBRV
	oQpEHzEM/4X+5x3yAEnsloSLXcUT5+WHMXPR6bq8Z5C1hIpXX7ggWHFlRuUwI1Zsx3amc/Sqitt
	Tj9e3DCEsph/N1LJiS6U+nZwwvWpV0Iw0T+ys+s3SuNkbu7Ohn9fF1Jz+/v0aM66GgwWa+5t+1J
	KSNL0/P4+7sjaKD9G+RBm9628goaFj9Zxvw==
X-Google-Smtp-Source: AGHT+IF9o01fgdgPFq84Ese3rGK1eK3K1lWa1HP0jF4cDQEDcmyxsE30VYjB8V+k5xLVlJftQJwEiw==
X-Received: by 2002:a17:902:ecd2:b0:223:52fc:a15a with SMTP id d9443c01a7336-22a8a8b80f8mr161642065ad.33.1744049332400;
        Mon, 07 Apr 2025 11:08:52 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:08:51 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 01/12] riscv: ftrace: support fastcc in Clang for WITH_ARGS
Date: Tue,  8 Apr 2025 02:08:25 +0800
Message-Id: <20250407180838.42877-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andy Chiu <andy.chiu@sifive.com>

Some caller-saved registers which are not defined as function arguments
in the ABI can still be passed as arguments when the kernel is compiled
with Clang. As a result, we must save and restore those registers to
prevent ftrace from clobbering them.

- [1]: https://reviews.llvm.org/D68559

Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a9199c45b1@yadro.com/
Fixes: 7caa9765465f ("ftrace: riscv: move from REGS to ARGS")
Acked-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

---
Changelogs v4:
 - Add a fix tag (Björn, Evgenii)
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/asm-offsets.c |  7 +++++++
 arch/riscv/kernel/mcount-dyn.S  | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index d627f63ee289..d8b2138bd9c6 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -146,6 +146,13 @@ struct __arch_ftrace_regs {
 			unsigned long a5;
 			unsigned long a6;
 			unsigned long a7;
+#ifdef CONFIG_CC_IS_CLANG
+			unsigned long t2;
+			unsigned long t3;
+			unsigned long t4;
+			unsigned long t5;
+			unsigned long t6;
+#endif
 		};
 	};
 };
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 16490755304e..7c43c8e26ae7 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -501,6 +501,13 @@ void asm_offsets(void)
 	DEFINE(FREGS_SP,	    offsetof(struct __arch_ftrace_regs, sp));
 	DEFINE(FREGS_S0,	    offsetof(struct __arch_ftrace_regs, s0));
 	DEFINE(FREGS_T1,	    offsetof(struct __arch_ftrace_regs, t1));
+#ifdef CONFIG_CC_IS_CLANG
+	DEFINE(FREGS_T2,	    offsetof(struct __arch_ftrace_regs, t2));
+	DEFINE(FREGS_T3,	    offsetof(struct __arch_ftrace_regs, t3));
+	DEFINE(FREGS_T4,	    offsetof(struct __arch_ftrace_regs, t4));
+	DEFINE(FREGS_T5,	    offsetof(struct __arch_ftrace_regs, t5));
+	DEFINE(FREGS_T6,	    offsetof(struct __arch_ftrace_regs, t6));
+#endif
 	DEFINE(FREGS_A0,	    offsetof(struct __arch_ftrace_regs, a0));
 	DEFINE(FREGS_A1,	    offsetof(struct __arch_ftrace_regs, a1));
 	DEFINE(FREGS_A2,	    offsetof(struct __arch_ftrace_regs, a2));
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 745dd4c4a69c..e988bd26b28b 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -96,7 +96,13 @@
 	REG_S	x8,  FREGS_S0(sp)
 #endif
 	REG_S	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_S	x7,  FREGS_T2(sp)
+	REG_S	x28, FREGS_T3(sp)
+	REG_S	x29, FREGS_T4(sp)
+	REG_S	x30, FREGS_T5(sp)
+	REG_S	x31, FREGS_T6(sp)
+#endif
 	// save the arguments
 	REG_S	x10, FREGS_A0(sp)
 	REG_S	x11, FREGS_A1(sp)
@@ -115,7 +121,13 @@
 	REG_L	x8, FREGS_S0(sp)
 #endif
 	REG_L	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_L	x7,  FREGS_T2(sp)
+	REG_L	x28, FREGS_T3(sp)
+	REG_L	x29, FREGS_T4(sp)
+	REG_L	x30, FREGS_T5(sp)
+	REG_L	x31, FREGS_T6(sp)
+#endif
 	// restore the arguments
 	REG_L	x10, FREGS_A0(sp)
 	REG_L	x11, FREGS_A1(sp)
-- 
2.39.3 (Apple Git-145)

