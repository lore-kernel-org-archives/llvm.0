Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15E201015
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728596; cv=none; b=P3ObGKVgaLNVnizkQELUveW15ylqTyl8VBAf+blzK7LvSCYtzL3owZN/0LA+tP3GXU2kZC3+JITUVh7zodB7UG0QVynKMfTBDTVttvswh0gV5LtI6G8mneABvTum689ECLTESsPtISgwNDdRd0sX2OpQDpmRxjIgoE8a1bumbBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728596; c=relaxed/simple;
	bh=bpMqPVQ3HsfWe+bk5gds1iHBJEE9VMgZp3CPDFR8+go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KjlYuXVtdnzT8neAczl5XtWXXemLXrtgbXmvDmuE+bqVLdm7WW9sBMaUrXNQt30Zr/Xu9oPy5tsvMeGjr0zh0L6aqp8hvs7bK/G7ahcF+4o7L9nrL3p0lO5XGiMTI7dIjn9Xz9DhK3JqEQhNiHiuXxZGOYtJyKBj8SmHaPP2AB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSIxg6HV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSIxg6HV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724f74d6457so47988b3a.0
        for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 09:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728594; x=1733333394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhqF3E4/w+YtOL58NNfG2rcUNmjyen3grJ9NA1x6juQ=;
        b=iSIxg6HVvxOciQav9lbp4dsOvb3wnUFQe5S5/OI7j9egkV+JAxGFKcBCBVDjOziDn+
         ItYfOyDcwkYfhn/I5blDZy2e3pJ2OPCIO0gUmmoY0ud4S9vRigZoY6sBUaieC6ptGfid
         HtD3Zz7mBBHM9igCw57NgHANAIqk1EcXW/t4Ybl1Er8gwtyub2Q3hl6haZ8ML7haRXd4
         fFYwg72+vPqkZk9E//t1sLvFZmBYKPkTFc3acnE4Q9DOYq2FqKQITMy3cIjiYc/j0mWN
         DGvR4LXvgfkIHzfmNuDzcNaPzDikguZXZSwRq+ILpLGFzhCBtRiogRpcylnsAer7oIL6
         9A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728594; x=1733333394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhqF3E4/w+YtOL58NNfG2rcUNmjyen3grJ9NA1x6juQ=;
        b=EoUZ65ihe1S+CtCMIJvkjkUd5DZ9/x1VHWvmzaRPoRxttd8dc5oUNRvrFY/XLKOf5I
         cNUem9rs7HSK8w8pXBW2Yw6924QmE3d0CE/UBIJxQiuuEUqKQqp2Ny2q6pLFsy1HJuB3
         5nAYIvJKbTsv5lxpE903Am1OcCLAF5aQGxg14X/eNDycd12qUTCkg8ffSpvOYIOVhzHG
         O+rJLuvfgftAtYne3ia9T6UvIClUgYCn4uHWcCxvo1Fe1NAW9779zErIz8SC95r7gEoY
         M4NJCVVIE00BlaLzbdoO8b6d3XLJnrmFfxds1k1qZRV939xx1yLl5Gm6KT2UwxMxrRCS
         AXtg==
X-Forwarded-Encrypted: i=1; AJvYcCVEbmLQezOwl4DSvjCFYUYdpYN4Dy3Yb2LmXQ1tew6tBkUBRAOrSvmXWWAnWlWbJ6SSfFsU@lists.linux.dev
X-Gm-Message-State: AOJu0YwTPsViIOQ9nPfwIp0cjM1A4lv9ENfO59ducdwj6lEtVBdv2fb2
	dhR+4hsaMKXg5rB0rc8QAaB17Q2Amh78h1QnifRewbNJfSprKXYm
X-Gm-Gg: ASbGnctzpwZ8tGk01VNPByUkfui7utax0yZkbyhLEXQdt3a7ime/goRQNzK3gAOnbj/
	wOeBh6bXT5e7Q4N/YV/kogWE8DPUozwBWJCQk3UW6AIYsSa1b11On1TB6jyHleVPo0N7NfHlIv4
	2iBw/kM9Fpfr5AfnjiQ5JSAod6aPqYfb/LqkkjouEABHZmid/KH2R/56mxd0UTC2Koowi1hYWgQ
	vNa8YkMBEGwlzpIejcPQi0LOIHi3nWnriKxC8NbAP1tjPExT/BsMAF5xzqh/r39DT05S1oOF4Yk
	+a2ZZ74yq/Hn7ozm0WfgG7BYoCnD
X-Google-Smtp-Source: AGHT+IHe4vfUFn689BzH733Y3azaB4OQQfGNQ2U5d2DUk6y3aLJvqA63KG7l5W6jxcEPLUbmlo8oFg==
X-Received: by 2002:a05:6a00:3c89:b0:724:eac3:576a with SMTP id d2e1a72fcca58-725301a5b92mr5270747b3a.25.1732728594123;
        Wed, 27 Nov 2024 09:29:54 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:29:53 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 1/7] riscv: ftrace: support fastcc in Clang for WITH_ARGS
Date: Thu, 28 Nov 2024 01:29:02 +0800
Message-Id: <20241127172908.17149-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Chiu <andy.chiu@sifive.com>

Some caller-saved registers which are not defined as function arguments
in the ABI can still be passed as arguments when the kernel is compiled
with Clang. As a result, we must save and restore those registers to
prevent ftrace from clobbering them.

- [1]: https://reviews.llvm.org/D68559

Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a9199c45b1@yadro.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/asm-offsets.c |  7 +++++++
 arch/riscv/kernel/mcount-dyn.S  | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 2cddd79ff21b..4ca7ce7f34d7 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -143,6 +143,13 @@ struct ftrace_regs {
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
index e94180ba432f..59789dfb2d5d 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -504,6 +504,13 @@ void asm_offsets(void)
 	DEFINE(FREGS_SP,	    offsetof(struct ftrace_regs, sp));
 	DEFINE(FREGS_S0,	    offsetof(struct ftrace_regs, s0));
 	DEFINE(FREGS_T1,	    offsetof(struct ftrace_regs, t1));
+#ifdef CONFIG_CC_IS_CLANG
+	DEFINE(FREGS_T2,	    offsetof(struct ftrace_regs, t2));
+	DEFINE(FREGS_T3,	    offsetof(struct ftrace_regs, t3));
+	DEFINE(FREGS_T4,	    offsetof(struct ftrace_regs, t4));
+	DEFINE(FREGS_T5,	    offsetof(struct ftrace_regs, t5));
+	DEFINE(FREGS_T6,	    offsetof(struct ftrace_regs, t6));
+#endif
 	DEFINE(FREGS_A0,	    offsetof(struct ftrace_regs, a0));
 	DEFINE(FREGS_A1,	    offsetof(struct ftrace_regs, a1));
 	DEFINE(FREGS_A2,	    offsetof(struct ftrace_regs, a2));
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

