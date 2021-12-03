Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A132C80
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 05:29:19 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 200so1997070pga.1
        for <llvm@lists.linux.dev>; Thu, 02 Dec 2021 21:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mWKjniVMdrBCu2ZfTvf1C9srZRA1gRSqS5jHnRsRf/I=;
        b=oDeRah12WrxLDM4zQEvjtSRB/BTJ2RmSNBPPbdB1K88F06sZA8vwEoIPFIeO0tJusb
         toe8ay5qxQfQZwGjUs/jfSEnUgYiU6hTWycQbdlntl1epkt2eTu5V+RycuNgGgLBsKfP
         c9VU32AjZAs5fqNsomzJEepOzF2qQPRdd6I8d1gwCoYYZyf01QLbqAXNBCo80QZd2R2Z
         TJCtXo3gtu1CBTca1rKqb/oXDlMnBWfHCMz+z2yb5Z0KwW4iRGbaIbqmIKha3aqoSZCU
         VmmMTiaFBv5cYfF/z64omCz+1wTrdfpXXZkz3QA9pEXngK5X8uT4BWdvAvAUhj0ocmTG
         pKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mWKjniVMdrBCu2ZfTvf1C9srZRA1gRSqS5jHnRsRf/I=;
        b=MM1yRNON4rGny6FPM2d6nywe8hmM/MIJics/dEAYdWk4/t70QVvcp+1s3Bl83wjyVi
         /9OUyjY01nAXpHrgVsgXd5F3JJrpgrpefBuDc7UNOPfar0hBOT0fiaxEiuGW6w2z9Uwv
         OV/RCjWmq18cx4JSIxseNTbZo4A1nrp49utSJ2G/eA8TsW13qRnuLpgT4RBekBgsIP9L
         Tlh8SkofxZle62qGUzQPCWoB8v90pXyiTn/0tSYNpi+ptYEgxp0Kj5hCGuA6ZdOeZgpj
         Vw9cusIwz/lcpcyigVB6SNW4Zq00SCJOIJ5s2F6KEBN9XZB4bCBk+TE0tkcnOpDlZkdb
         U8eg==
X-Gm-Message-State: AOAM533BGQtWVQo6cvD58esLMyeCs9nniHUdBoQ1fXYiZQr8IK+PsFZ6
	BGygPbDijy7hQmk/sRjh0SQ=
X-Google-Smtp-Source: ABdhPJy3k4hFRYrM0cYmYs+BpbIkjVNWWs4Yqn0gl0JQyrdZ1VfOjaEz7zd+TiGL8HfndvmOR7r1Ng==
X-Received: by 2002:a63:f008:: with SMTP id k8mr2966109pgh.189.1638509358915;
        Thu, 02 Dec 2021 21:29:18 -0800 (PST)
Received: from local.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id d2sm1563797pfu.203.2021.12.02.21.29.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 21:29:18 -0800 (PST)
From: Ben Dai <ben.dai9703@gmail.com>
X-Google-Original-From: Ben Dai <ben.dai@unisoc.com>
To: samitolvanen@google.com,
	ndesaulniers@google.com,
	rostedt@goodmis.org,
	mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Ben Dai <ben.dai@unisoc.com>
Subject: [PATCH] arm64: fix the address of syscall in arch_syscall_addr if CFI is enabled
Date: Fri,  3 Dec 2021 13:29:08 +0800
Message-Id: <20211203052908.7467-1-ben.dai@unisoc.com>
X-Mailer: git-send-email 2.17.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

With CONFIG_CFI_CLANG, the addresses in sys_call_table[] actually point to
jump instructions like "b __arm64_sys_*", and if CONFIG_LTO_CLANG_FULL is
enabled, the compiler will not generate a symbol for each jump. It causes
syscall tracer can't get symbol name in find_syscall_meta() and fail to
initialize.

To fix this problem, implement an strong definition of arch_syscall_addr()
to get the actual addresses of system calls.

Signed-off-by: Ben Dai <ben.dai@unisoc.com>
---
 arch/arm64/kernel/syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 50a0f1a38e84..2b911603966b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -12,6 +12,8 @@
 #include <asm/debug-monitors.h>
 #include <asm/exception.h>
 #include <asm/fpsimd.h>
+#include <asm/insn.h>
+#include <asm/patching.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
 #include <asm/unistd.h>
@@ -19,6 +21,25 @@
 long compat_arm_syscall(struct pt_regs *regs, int scno);
 long sys_ni_syscall(void);
 
+#ifdef CONFIG_CFI_CLANG
+unsigned long __init arch_syscall_addr(int nr)
+{
+	u32 insn;
+	unsigned long addr = (unsigned long)sys_call_table[nr];
+
+	/*
+	 * Clang's CFI will replace the address of each system call function
+	 * with the address of a jump table entry. In this case, the jump
+	 * target address is the actual address of the system call.
+	 */
+	aarch64_insn_read((void *)addr, &insn);
+	if (likely(aarch64_insn_is_b(insn)))
+		addr += aarch64_get_branch_offset(insn);
+
+	return addr;
+}
+#endif
+
 static long do_ni_syscall(struct pt_regs *regs, int scno)
 {
 #ifdef CONFIG_COMPAT
-- 
2.17.0

