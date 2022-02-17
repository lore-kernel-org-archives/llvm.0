Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD638D1
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 00:28:46 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id p23so3544949pgj.2
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 16:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGcQO3MYiNVzzOdQ6PURsZcaUd8RxaLP2F5BG8x7eyQ=;
        b=Lqy2LJOcN+upnxmIuTwy3fpzudc0qiFDVU+dx5qCPOwHk6QfaFIX97c4efamZKjMMi
         euF0m2g0IF54Vfa68IeK+IXk2NUQXtaq7kA0Uod+Y2cXxKbxzrX4PExsECyuXGTltvrA
         i2leezKeoQtfK2DYFOiqo//LmWYDTGnE5l2q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGcQO3MYiNVzzOdQ6PURsZcaUd8RxaLP2F5BG8x7eyQ=;
        b=gPe1R5MPlMZsTzUsCYKpH+Qeqt5jsvQtlFM0tgs6wy7otginh2MXRoVnZxsyfcIIAj
         GfAHLQSXPplfU2VQX6huT/OVH5Mulp9hAgIRIDIJ7zpeXFAfoUuyZTuKsAvY7IhvtH5Y
         8F5lmthUtRJyR2RvP+tEAx9ohJtpS4QM0PQobtom43WU3RqeCDPlbV8kXdBrC+zxZkng
         VtxNjLG1f5A7wKh5/VnL+dFTLrPbca1f/oX/v+DmPkJb175N2om0ED8FJ7GZ3xOMtsUA
         gx86GG5i+RVQCUF1N1aC9agKQLo5n6WCZmRfgVnYWVe8ff8br+f3AidZ8M7nzDRyfNRE
         dvyA==
X-Gm-Message-State: AOAM531lspyeboMrjpi5ScVdY0IpjXz19rbGKl10FZ0siTml2q6tVvnA
	AD1pHjS9QwBUffdQlr4n+H2qKw==
X-Google-Smtp-Source: ABdhPJxm+8yfHYB9vBipUYW1o+9PJNIevacMU+b/iaFcke9KfnDnfNB1BpC49YXhw4myccRnzpcrRQ==
X-Received: by 2002:a63:8bca:0:b0:370:2717:3756 with SMTP id j193-20020a638bca000000b0037027173756mr396843pge.604.1645057725956;
        Wed, 16 Feb 2022 16:28:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mj21sm199355pjb.20.2022.02.16.16.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 16:28:45 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jeff Dike <jdike@addtoit.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	David Gow <davidgow@google.com>,
	linux-um@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] um: Allow builds with Clang
Date: Wed, 16 Feb 2022 16:28:43 -0800
Message-Id: <20220217002843.2312603-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; h=from:subject; bh=vShMU0xnxVexx4MO5nHaUDLC8EDUgfNlHp2nsWHEiy8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiDZa6UafTd6YGrYc+tswDkAPHU5vTnnAfc+6lyNW/ iJEEJS+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYg2WugAKCRCJcvTf3G3AJrobD/ 94N3eFm682VZ5KXRjhfpVMnBOe7gen8xGGN/fUaNo7D5ELCrVTZ2MtlaOxpZg3gFE2QOS9Qi3KfN4T evcT3Sx7e2eCQQVIH989akOsLuFQkuDsJRZoHarM0gDLFJzqJYV5DD2F2x802pGeBcAYXME1KMkgYv cjzKSXixhur7fi/4i8v1+oGXSW39WRHeZMsb2tZhhiZerHcEkgc2Z5CBLFgBWBNwdcq0G2bza84e8J /LETYVec+LxaEtcVGZEquYASEuBwVhfnU1ELznR5msJ1OE3CpBJdUq9rFIhJY+FpU3yW1O2FSELINI zyUhxrRYDxplhqkV/9AZtB/cNiD4KJpd7yHH19JsB+773pA2qjFHej71yPlqO76eLGq85fnpkPVLAs OeUT9i/B0TfTI9W2PdqsUuXV2EeAUt52hIJ7Tc0bFsewLzdpgwT+88sk5Gx8/X3eR07rEpVTGVPx8d VhPQDd+eYjbAkmdCIco+FoxapSJq/+HtPyDFsrqsJvHyzfaiSXCkHc4cNjJAOB0P+T4/RTrk5EgpIC Q1k75VinAtx6s3sX/wE3+X7/bDeN2MSznWVfMYpwbZuJ42y6W+HD7mZPRXCg+pBUBzo6xPucFqLzXN MpOxLvy+jlg8HUr9uGvI0UoDqaix1aidkMMl2KM5AWa+wnAS5UJHGqjM7euQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Add x86-64 target for Clang+um and update user-offsets.c to use
Clang-friendly assembler, similar to the fix from commit cf0c3e68aa81
("kbuild: fix asm-offset generation to work with clang").

This lets me run KUnit tests with Clang:

$ ./tools/testing/kunit/kunit.py config --make_options LLVM=1
...
$ ./tools/testing/kunit/kunit.py run --make_options LLVM=1
...

Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: linux-um@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/um/user-offsets.c | 4 ++--
 scripts/Makefile.clang     | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/um/user-offsets.c b/arch/x86/um/user-offsets.c
index bae61554abcc..d9071827b515 100644
--- a/arch/x86/um/user-offsets.c
+++ b/arch/x86/um/user-offsets.c
@@ -10,10 +10,10 @@
 #include <asm/types.h>
 
 #define DEFINE(sym, val) \
-	asm volatile("\n->" #sym " %0 " #val : : "i" (val))
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"": : "i" (val))
 
 #define DEFINE_LONGS(sym, val) \
-	asm volatile("\n->" #sym " %0 " #val : : "i" (val/sizeof(unsigned long)))
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"": : "i" (val/sizeof(unsigned long)))
 
 void foo(void)
 {
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 51fc23e2e9e5..857b23de51c6 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -10,6 +10,7 @@ CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
 CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
 CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
+CLANG_TARGET_FLAGS_um		:= x86_64-linux-gnu
 CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
 
 ifeq ($(CROSS_COMPILE),)
-- 
2.30.2

