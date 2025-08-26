Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB8286422
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756248711; cv=none; b=mdcMxmYGqDIk8qS5FzLEDNjF0dln5YqmRCRWlrQeKkDncpe3KsziNg8r/454QKkSziAdpj3Wk2eW+uLlT2oQa1RGr5MmYWNJ8IQ7LnUSZL96Ol9RywPhrXP3j2EUIZkJjiA6yovCkBNCyspGOCMYbFEikGO4YerKZkfzmaz18hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756248711; c=relaxed/simple;
	bh=nja9nOlsvSDuhTHFm8quefBlVFD24Sl3DW2Igdp8jGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z50fCbSD3UQlevLbDczqaCVo1CdoPH/e6JkxrpktGilPHTBRG1bvNCJGR0vkLl6mrhELrSvMMlmEDwhq+7t1JRqvRa+6/9CmGTMjrvFqtnUAE3Gm7MdOcP9L47/k+8x4x6jnHTAnkoHEuSSEV8S5Iit4tVKOUqW1kM8OQXvOzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbzpzXBX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbzpzXBX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b475dfb4f42so4285816a12.0
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 15:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756248709; x=1756853509; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h76qScSG6gmL4kEuO66KYlIEZb8mLYMQm2nAEG+zUfw=;
        b=WbzpzXBXJ3YooJbGYXtVsPaMvJNecok8zvI8l3x0WN5M4kAWDG5waW3cq/LIDnd6qq
         NTlXE2FFiWa5rnnUDP5/+N96WggFL0cSf/JfkF10ENtJ5Amw/360mKnVD5Y33/7M0VId
         iy8TPwiObfssoGA1kM5xSQKAUK/W+tHbK9CYL7JJt1MgaL0IkbCwCBMPBr1dEB5oEvLp
         jDhs0wHTVvaAFHqSHteL9SIBkXNdiTwvPciZ5bs1Sz8UvYEkF9EKvJ6dhPP9UUlqhE7p
         tj50f+hYszpgujs4kvf/An9OQ4TLS0pCdR9kcP5vwCfz4pRTL7QiPj8qPQicp1jxkP4k
         R/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756248709; x=1756853509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h76qScSG6gmL4kEuO66KYlIEZb8mLYMQm2nAEG+zUfw=;
        b=kNsUmWx70DmeLRn0o8suDZzeq/q4/GM3CrfsYj4svq2I5fc9bJSM5uTVDdGitNPA/5
         oIaMRyr6QI0R62NrSBmTnOZ3RbOuhs1jM8nbTYHXWvvF6Ui9sr8Nbb48GRgwShVRgNHX
         D8bZeexSka9SU4OIglJNP9KJYEbEY+Jw55ZbhjmqzaMqCbx05rJzJBdLimiNkd6RE721
         yYM7JWMZNJ8HuR+XsY6vA/wSGdQNgKHHsh840PJv5lOWBBV2AG1WHvnQBy8OyaiU686t
         tUvOfLqIGSzR8IJx9Zu4ya7vDT0IC+ADEzP6UHl/r7vrPZiw+uYkaRJss4zKhtcYTj+k
         Ws3w==
X-Forwarded-Encrypted: i=1; AJvYcCXPCek4FJZIBHIPuBfycswuvkQC0ZSsPqrWK7D85iG8WX06w7p4vK5zRwzbWtQ7k/b1c5Fc@lists.linux.dev
X-Gm-Message-State: AOJu0YzFIphcoGqTuxmrLcB3NXcfWywpXtM+4QDPaNx5xbih/aEAdFDq
	Opo3TsDgi6nJ+9+RCmz8PTTsi2ax+RNei3vHTsCxuRHyd3ktq905cqvw
X-Gm-Gg: ASbGncup0M7sqJznaTguiBUvS99rF85JhitzqmOpm6vYEF6htoSwjiH4EH+N58WarCp
	SmZgjxciBE0lKWCQh5sp2wi+KtpJ6ymsIM6J8ROH8p8NS15jwFcnQE0NDpI2tg0Pvvpqp26SBNH
	D4L7Q2Zj1JM5MZntIMcz2YG86zYfmHUk9oharwvcO3qQL8N4HinfQuN1fm0PU37nLgIUZ8N08F2
	BWYJyOGfDt4/7He6VcLIi+I7jcgXM5C6ogEZTPpXZe8uMH+/mGvL6pQgiIbBxME3f4i6n/eAq7M
	Rgo+I9vQKpKcSSpcmPdcKlRlPfBQebOo2WMsspEvAHTPpHEz5sajjnDoi57LC4pX2Jri3VjMiNI
	KEjGT74M9LnZZrHnMDzN5xBI97vk/pr8=
X-Google-Smtp-Source: AGHT+IF+izjhG7On7CU2ByXZpOjy8LPezZ/rCLLddhlRANAQzX6wO7qTaFF2CC3KEWQiRyxvo+F7Jw==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id d9443c01a7336-246a4e655fcmr163205335ad.56.1756248709266;
        Tue, 26 Aug 2025 15:51:49 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a601esm105340815ad.162.2025.08.26.15.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:51:48 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Tue, 26 Aug 2025 16:51:31 -0600
Subject: [RFC PATCH 1/5] tty: Add KUnit test infrastructure configuration
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-tty-tests-v1-1-e904a817df92@gmail.com>
References: <20250826-tty-tests-v1-0-e904a817df92@gmail.com>
In-Reply-To: <20250826-tty-tests-v1-0-e904a817df92@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756248706; l=5404;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=nja9nOlsvSDuhTHFm8quefBlVFD24Sl3DW2Igdp8jGk=;
 b=QDM8ax2hVfpwy0tB0W42Pw1oKpD+7EMU1aQCxHNEmk+WZIpTA286sil+W+VT9m+B2Rx6rceaW
 UmEXE4gkWuBBT2zDSfvvdIaYwe7m64cF0eTey4PD2StBJK0WKMWSDPy
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Add Kconfig and Makefile support for TTY KUnit testing framework.
Introduces CONFIG_TTY_GCOV_PROFILE for targeted coverage analysis
and CONFIG_TTY_KUNIT_TESTS for test infrastructure enabling.

The infrastructure allows selective testing of TTY components without
instrumenting the entire kernel, improving development efficiency for
TTY subsystem changes.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 drivers/tty/Kconfig            |  9 +++++++++
 drivers/tty/Makefile           |  7 +++++++
 drivers/tty/tests/.kunitconfig | 44 ++++++++++++++++++++++++++++++++++++++++++
 drivers/tty/tests/Kconfig      | 44 ++++++++++++++++++++++++++++++++++++++++++
 drivers/tty/tests/Makefile     |  2 ++
 5 files changed, 106 insertions(+)

diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index 149f3d53b76086cd4ac5acf116ebe36d816664ac..92d27761e1543ceb138a670194480ed1e711124b 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -424,6 +424,15 @@ config RPMSG_TTY
 	  To compile this driver as a module, choose M here: the module will be
 	  called rpmsg_tty.
 
+config TTY_GCOV_PROFILE
+	bool "Enable gcov profiling for TTY subsystem"
+	depends on GCOV_KERNEL && TTY
+	help
+	  Instrument drivers/tty/* with gcov when GCOV is enabled.
+	  Useful for targeted coverage runs without profiling the whole kernel.
+
+source "drivers/tty/tests/Kconfig"
+
 endif # TTY
 
 source "drivers/tty/serdev/Kconfig"
diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
index 07aca5184a55dd38036587c3485ba9f12d2e7ec7..c0cb47c32e94abe072f4cd7e2023480bbb5da9f2 100644
--- a/drivers/tty/Makefile
+++ b/drivers/tty/Makefile
@@ -29,3 +29,10 @@ obj-$(CONFIG_VCC)		+= vcc.o
 obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
 
 obj-y += ipwireless/
+
+obj-$(CONFIG_TTY_KUNIT_TESTS) += tests/
+
+# tty profiling & coverage
+ifdef CONFIG_TTY_GCOV_PROFILE
+GCOV_PROFILE := y
+endif
diff --git a/drivers/tty/tests/.kunitconfig b/drivers/tty/tests/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..a29112fa03ae78e096d9e22546b3cfd3007d710c
--- /dev/null
+++ b/drivers/tty/tests/.kunitconfig
@@ -0,0 +1,44 @@
+# TTY KUnit Test Configuration
+# =============================
+#
+# Running test with something like this:
+# -------------------------------------
+# ./tools/testing/kunit/kunit.py run tty_io_core \
+#     --kunitconfig=.kunit/ \
+#     --kunitconfig=drivers/tty/tests/.kunitconfig \
+#     --jobs "$(nproc)" \
+#     --arch=x86_64 \
+#     --make_options="LLVM=-18"
+
+# Core KUnit Infrastructure
+# -------------------------
+CONFIG_KUNIT=y
+CONFIG_KUNIT_DEBUGFS=y
+CONFIG_KUNIT_TEST=y
+CONFIG_PROC_FS=y
+CONFIG_SYSFS=y
+CONFIG_DEBUG_FS=y
+
+# TTY Subsystem Core
+# ------------------
+CONFIG_TTY=y
+CONFIG_UNIX98_PTYS=y
+CONFIG_SERIAL_CORE=y
+CONFIG_VT=y
+CONFIG_VT_CONSOLE=y
+
+# TTY Drivers for Testing
+# -----------------------
+# Enable ttynull driver (required for ttynull tests)
+CONFIG_NULL_TTY=y
+
+# TTY KUnit Tests
+# ---------------
+CONFIG_TTY_KUNIT_TESTS=y
+CONFIG_TTY_KUNIT_CORE_TESTS=y
+CONFIG_TTY_KUNIT_NULL_TTY_TESTS=y
+
+# Code Coverage
+# -------------------------------------------
+CONFIG_GCOV_KERNEL=y
+CONFIG_TTY_GCOV_PROFILE=y
diff --git a/drivers/tty/tests/Kconfig b/drivers/tty/tests/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..6012f4ab7f1bc90d434d69ee82e87e89c1291763
--- /dev/null
+++ b/drivers/tty/tests/Kconfig
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "TTY KUnit tests"
+	depends on KUNIT && TTY
+
+config TTY_KUNIT_TESTS
+	bool "TTY KUnit test infrastructure"
+	depends on KUNIT && TTY
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit test infrastructure for TTY drivers.
+
+	  This enables test helper functions that are included directly
+	  into tty_io.c to provide access to internal TTY functions for
+	  testing. The helpers are only available when KUNIT is enabled.
+
+	  This option provides the foundation for TTY testing but does not
+	  run any tests by itself. Enable specific test suites below.
+
+config TTY_KUNIT_CORE_TESTS
+	bool "TTY core functionality tests"
+	depends on TTY_KUNIT_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for TTY core functionality.
+
+	  Tests cover basic TTY operations including open/close lifecycle,
+	  write operations, buffer management, line discipline integration,
+	  and error handling through real kernel code paths.
+
+	  If unsure, say N.
+
+config TTY_KUNIT_NULL_TTY_TESTS
+	tristate "TTY null driver tests" if !KUNIT_ALL_TESTS
+	depends on TTY_KUNIT_TESTS && NULL_TTY
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for the TTY null driver.
+
+	  Tests validate ttynull behavior as a data sink, including write
+	  operations, data discarding, and error handling. The ttynull
+	  driver discards all written data while providing minimal overhead.
+
+	  If unsure, say N.
+endmenu
diff --git a/drivers/tty/tests/Makefile b/drivers/tty/tests/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..854911a0f87d6a6fdc826cc40f99afb1202afd46
--- /dev/null
+++ b/drivers/tty/tests/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_TTY_KUNIT_CORE_TESTS) += tty_mock.o test_tty_io_core.o

-- 
2.43.0

