Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C481DB37A
	for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734390811; cv=none; b=Ys1/8Kzh6YnxNQcSG9wnkFMtSRqP2HoGN+9OyMdAM7isFg3Wm0GKw+flIfuNmNTynuK1gkA8brfZeC3u4A1RvYkyJhM8tc7yh7Bt5keTco4uU5vlqiSsdPo3eEFoScmrLhKcut1V7upv9zmht7thFM71Ed6qowJY/mtuDqIFZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734390811; c=relaxed/simple;
	bh=k4Sj7dM5EROtRyKRIxtv+8o9o4DaFse9qSyIbzlZ98Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOrC3MFlVvDI7MhsnEUVDSj2oNvZmkn92ZqWniBVW+7zkK78rFf+lmvWL9zWeA6W1enaOqdLRGlKmmrdpQNYbXHF0S+kwbDVzIizt0odwKV/it7E5fReEuo1NZykIZTEjfvkGgUOsxpWRExg/OVy4AteregiV1bWUwJVp8l1WFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gNpR6ENK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gNpR6ENK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216728b1836so33244255ad.0
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390809; x=1734995609; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm+gy0vg6ADpwKtQUne3ds2s3sgHguLz0qdVVhDqizo=;
        b=gNpR6ENK/jxFA7zSpm9Aq7alJWZVSE89RlwWPb10uLQxtsSYxXOpcV3fPYtdpJUky/
         mwojlg58t19AlHlN8VcVr0UKHEh8V2n0ohgWwEkTVz4hwx9Gn3V185OLg57aqpD2qA8x
         yYoPBZnUzU/nxNddRaP/NUVpVFnsDBcw0uiNerO20N+xxmoe56c1Tj0eD8JjNHx9KIOL
         A51tE+YiAEe1z7Kv5i8U6O3DmcKHQQCg+C7Qzj2XfSS53Iz80BjFDc7pgjhs0ur5C2k+
         lw+bjka3WEjtquk05GnjAeA69WJ1NEOLf7ahPiPpnTU3cZKl201SttCbnCoxP1sDpkV1
         lNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390809; x=1734995609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm+gy0vg6ADpwKtQUne3ds2s3sgHguLz0qdVVhDqizo=;
        b=LruhDH+lJCpGqmTGhVhW/8fYS/wii/NhI6ou9YEkUkOOe0TgA+Y0bcUoPFuZfzZx5J
         xyZjrwNAqT3/yf7QEJAZAGJYufwHp/dLiVz03ERLd2EEK3guy5l/LPCli5NcafzXlR91
         4EuGTngbCtaSt62LA2k5lT75ei84oFsRAtazgNPnAEiIsvglu7LP6FQ+IiFUo7fjI8zT
         dD4kiaeq7NClpmjcHtuX5Nibz2h4oCLtu84q4JaL825TExo94zeab1CyjLQRETjK/HqX
         SjD5QPqDqnDIXksAO9i/2+7ECT5Jr2zQZWj6IO7sNTranDTa1+dnCT1LY6bCKUQPX4Dj
         EN0A==
X-Forwarded-Encrypted: i=1; AJvYcCWQNtl6hbtHJ0aZ0mHpoqRxH40iWP4PAV6+tnUoqzGxA+cOI/tQOmMdG1ZN2dgufE4+DLlA@lists.linux.dev
X-Gm-Message-State: AOJu0YwiUBA8Ccf3tHIV2dR1dnlWuy2c1EYcMM1lNEsM9wMVRkRBv96i
	uBxqfDWoxElFtI9L/04O1Ast2X+16TWctXH88hfv/zbE/GFmvpOkcA448eZH+ps=
X-Gm-Gg: ASbGnctHGOjT2ohdpUbcRiIHXN6rEM8xJCz2LSljtkVOxZFAowkOclvibAq57b0V7QS
	IQ6JZFq+Xhhf5+4BUGPBuuBtjz96Ec4fh3n0faUx8MqKbS7i4yrGcNgLjdZCaJZfW0qAoYC4HPJ
	PUwAzBn2cixfF7iM/9TLQ4dSI+E18lWyBiuzV7deZSGraFDoAE6/LeL2UePldSVTSqWbAIuwkxo
	8Zk0xFPUN7CXBEa8WjZ1FZ/b67U2JUpnzgwSbLLYVKqMFP24dYCGYLPEGylPo+AThDTXYU7
X-Google-Smtp-Source: AGHT+IEUS1KQ0ef501yi9KQdApUOJap2Q7VLgsPuhiCn2hfgEw7VxTtRPysE5A5XxEfaj3jPqra1Kw==
X-Received: by 2002:a17:902:ecd1:b0:216:3eaf:3781 with SMTP id d9443c01a7336-21892a58734mr187815855ad.43.1734390808967;
        Mon, 16 Dec 2024 15:13:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 15:12:52 -0800
Subject: [PATCH 2/2] tools: perf: tests: Fix code reading for riscv
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=k4Sj7dM5EROtRyKRIxtv+8o9o4DaFse9qSyIbzlZ98Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFsHN62Zdecfs+JNP2uLlep5+jx3vdkTV/r39gW3+i
 RnX8+22dZSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCR+wmMDF+2JGUuPhm4eJ+U
 wobqzxGrOt5EMjWvrZGL5XpxZAfXtzWMDFOnT7tTaS962CctyFjKfIG1dduJX4UMnUpCpZ6iYvz
 KnAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

After binutils commit e43d876 which was first included in binutils 2.41,
riscv no longer supports dumping in the middle of instructions. Increase
the objdump window by 2-bytes to ensure that any instruction that sits
on the boundary of the specified stop-address is not cut in half.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig              |  5 +++++
 tools/perf/tests/code-reading.c | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c071b536df59c0eb11d55f9080c7cd..f164047471267936bc62389b7d7d9a7cbdca8f97 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -229,6 +229,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
 
+config RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION
+	# Some versions of objdump do not support dumping partial instructions
+	def_bool y
+	depends on !(OBJDUMP_IS_GNU && OBJDUMP_VERSION > 24100)
+
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..605f4a8e1dbc00d8a572503f45053c2f30ad19e3 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <inttypes.h>
@@ -183,9 +184,23 @@ static int read_via_objdump(const char *filename, u64 addr, void *buf,
 	const char *fmt;
 	FILE *f;
 	int ret;
+	u64 stop_address = addr + len;
+
+	if (IS_ENABLED(__riscv) && !IS_ENABLED(CONFIG_RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION)) {
+		/*
+		 * On some versions of riscv objdump, dumping in the middle of
+		 * instructions is not supported. riscv instructions are aligned along
+		 * 2-byte intervals and can be either 2-bytes or 4-bytes. This makes it
+		 * possible that the stop-address lands in the middle of a 4-byte
+		 * instruction. Increase the stop_address by two to ensure an
+		 * instruction is not cut in half, but leave the len as-is so only the
+		 * expected number of bytes are collected.
+		 */
+		stop_address += 2;
+	}
 
 	fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
-	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, addr + len,
+	ret = snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, stop_address,
 		       filename);
 	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
 		return -1;

-- 
2.34.1

