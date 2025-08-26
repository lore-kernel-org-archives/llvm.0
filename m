Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5702F8BF1
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756248717; cv=none; b=nFQCa5enYlowruyBX4MhwUrMeCck6C8zQeMpC3+V6O9TMjScf2kr64itOw/6ozZYpzgNp4laowR69/6iOQ3KUHV5wKmWA/NdpOCM/Xd/KDcFHFbtLssDdZMOqeEirpk1ixqtO/gkrCReWA//2piAWzmu/a4mz1zeEzXUAceU4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756248717; c=relaxed/simple;
	bh=2sCgtf0iJuHZoEJ+ZjgF8LGfcrJ2jnuz9b44H6Mk4Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jczd8bseR8U5u2uIu/x8MP2ngLX4DgY4jLgO4tgdrMzqj73LpFF2UM4sRnMncfZuT6mxNRs4xRSbfTw56pn0kxG/LUer7W4Wu+3Mc3DXbD+JxE+Jc/Hu7PAn/zjPEL01bYySgMDErT6riFKN/7SpT3LoKhGJRmVwRn/x2IeXA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd17wJif; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd17wJif"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b49cf1d4f6fso2535753a12.3
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 15:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756248714; x=1756853514; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFHzcEkMkKxjDsW7QyH+21adtRUMu8g3PdBU38OriB8=;
        b=Bd17wJif8xrLdVlVgfpQ2s/3haRBDcXzy3joE86lEVhvFjCbBdeLdYy6nt0ewB9v2V
         hOCdHhFCYKez3KQh7FbzmF5WDGU1b1KKgJe0nJ+wtjAJHWU8f6Q/e9IP9L56JO8axovf
         WrO3z5rnINuHYautmsqwvsEKNfFY529OVue7jivTnncGq+pmsQaPSGPgPrznaTAVGDWV
         b70lJyXgHk47GiDOI73XQI334j6mbQub17ltC1ektuw0qliFgnZxMEHQYV/WdkMG1ssB
         Tp1yim6vZwyv92f66TBFRFXu+lWnV/dTQcqL+YO1MH/9gca7+UnhsHqEe0rx6XoqodRE
         w3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756248714; x=1756853514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFHzcEkMkKxjDsW7QyH+21adtRUMu8g3PdBU38OriB8=;
        b=EEA111ZjJoegbUC56c3wAswy2CvwCd5ZmOLdHPc57IYJI5UUxqkedbBj8pAlphBM+K
         ykWWTwtRwFgGP3144g4ux2D/a7jvTliovEpWYIcaN3M+NZF+CIQVbfOhYIpJ7rTKKgtd
         pJodpwMZ2SWzhqh6wYfND1VSY1wLsqsO0uvUO629mCqyCHdkqc3ztLGvppaPOR5yU0AA
         O5cbJGI7VVjRlXwinyNNUpugUaDsJeiXxERNuEyy2UGbpCnYCYVgVaW4OgBiqNRuv0t7
         Ol9OxwsA3Cxyg/6Mr0i5y++M2b1hGLRagyhEZrVO9LXmYg/iEQt8z7sIjupFYoYD9tB1
         RK4A==
X-Forwarded-Encrypted: i=1; AJvYcCXYeNaoVph7X4W8LGYJSSjJ8gm/wAtYTDeqOTHUkbmOwaWrR+xAMOWus44r0db7cQ4QGDqn@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf+LFrjVwCo5bFHTizUlsmoa4y+HY88SJlbDv5tFF0E+2KCy5S
	S0sly/wGu5Tfcw0xpR8JvukFxJ4FN8YeWxwRTmJ5dJ3KTseKQXoj5z/t
X-Gm-Gg: ASbGnctPyFvyee1v8cMK8321bPz9cuTkFPsRlu+pFGHR2LIQvzB6AwLr/y4Us+2pZCS
	f1Aq6+07GpZxfHXZ7Bp+CspkjLnktNDVKal41c9UFQ0DmjLU7N2ACDKc5wo6/VfuKTsBqxL9I0t
	sUDR4M6N3GYN0NXi77CZGCaNu5Z+8V7Grkwa4SqejPoULo1FUKJ9/Cn/D6hsTcmgaEWSljvktKw
	7z6dICGyRhb/l5YAlGGswRlFM9acDaA5Mh4HYoqHLgtuwJK92PHKHyPRwqP69ef0F/f6WvJNDDE
	vHraFF5SgIcFgxtVdz+zX4NyInHKlNHqShazrjwudAuzHZjgrJs+eX8ItFT0k9fLT93KYTMx/ty
	sSwFzDL9zwSOz4tdQ25+y
X-Google-Smtp-Source: AGHT+IHBbRvLzIIWrINVvaClB1b0OPUk6BLcoAKkgULcCrNboGggfEcV+NS6zLTIGPlFc2xR7s/r5w==
X-Received: by 2002:a17:903:2f50:b0:240:e9d:6c43 with SMTP id d9443c01a7336-2462efa3c78mr199299725ad.51.1756248714470;
        Tue, 26 Aug 2025 15:51:54 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a601esm105340815ad.162.2025.08.26.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:51:54 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Tue, 26 Aug 2025 16:51:35 -0600
Subject: [RFC PATCH 5/5] tty: Add KUnit tests for ttynull driver
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-tty-tests-v1-5-e904a817df92@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756248707; l=6787;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=2sCgtf0iJuHZoEJ+ZjgF8LGfcrJ2jnuz9b44H6Mk4Ks=;
 b=7wonk4jVg8NsrTTBrfr6ESAy6WZFree5W8bJr7L4QLz5S5/8f6osUqGimZhjCM+tfxdsy0G/x
 5lMJhbjAnpQAT+KhMfWgRJQVpiNA4sbrEiobc0DSKSK13IqYtS0ervS
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Add targeted tests for the TTY null driver covering its data sink
behavior and driver characteristics. Tests verify that ttynull
properly discards written data while maintaining standard TTY
semantics for applications requiring TTY interfaces without
caring about output.

The tests are integrated directly into ttynull.c when
CONFIG_TTY_KUNIT_NULL_TTY_TESTS=y to test the actual driver
implementation.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 drivers/tty/tests/test_ttynull.c | 163 +++++++++++++++++++++++++++++++++++++++
 drivers/tty/ttynull.c            |   5 ++
 2 files changed, 168 insertions(+)

diff --git a/drivers/tty/tests/test_ttynull.c b/drivers/tty/tests/test_ttynull.c
new file mode 100644
index 0000000000000000000000000000000000000000..c062d69bd5d5975ab84442a83426a1d44440b0a6
--- /dev/null
+++ b/drivers/tty/tests/test_ttynull.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for the TTY null driver
+ *
+ * Tests for the ttynull driver covering basic lifecycle and sink behavior.
+ * The ttynull driver acts as a data sink, discarding all written data
+ * while providing minimal overhead for applications that need a TTY
+ * but don't care about the output.
+ *
+ * Copyright (c) 2025 Abhinav Saxena <xandury@gmail.com>
+ *
+ */
+
+#include <kunit/test.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/tty_flip.h>
+#include <linux/string.h>
+
+#include "tests/tty_test_helpers.h"
+
+/**
+ * test_ttynull_write_sink - Verify ttynull acts as data sink
+ * @test: KUnit test context
+ *
+ * ttynull should accept all write data and discard it silently.
+ * This tests the core functionality of the null TTY driver.
+ */
+static void test_ttynull_write_sink(struct kunit *test)
+{
+	struct tty_driver *drv = ttynull_driver;
+	struct tty_test_fixture *fx;
+	const char *msg = "test data; discard me";
+	unsigned int room;
+	ssize_t write_result;
+
+	fx = tty_test_create_fixture(test, drv, 0);
+	KUNIT_ASSERT_NOT_NULL(test, fx);
+
+	KUNIT_ASSERT_EQ(test, tty_test_open(fx), 0);
+	KUNIT_ASSERT_TRUE(test, fx->opened);
+
+	/* Verify TTY is properly initialized */
+	KUNIT_EXPECT_NOT_NULL(test, fx->tty);
+	KUNIT_EXPECT_NOT_NULL(test, fx->tty->ldisc);
+	KUNIT_EXPECT_TRUE(test, !list_empty(&fx->tty->tty_files));
+
+	/* Check initial write room - should be available */
+	room = tty_test_get_write_room(fx);
+	KUNIT_EXPECT_GT(test, room, 0U);
+
+	/* Write data - should be completely accepted */
+	KUNIT_ASSERT_EQ(test, tty_test_write_all(fx, msg, strlen(msg)), 0);
+
+	/* ttynull discards writes; buffer should remain empty */
+	KUNIT_EXPECT_EQ(test, tty_test_get_chars_in_buffer(fx), 0U);
+
+	/* Write room should remain available for a sink */
+	room = tty_test_get_write_room(fx);
+	KUNIT_EXPECT_GT(test, room, 0U);
+
+	/* ttynull should accept all data */
+	write_result = tty_test_write(fx, msg, strlen(msg));
+	KUNIT_EXPECT_EQ(test, write_result, strlen(msg));
+
+	/* Multiple writes should all succeed */
+	write_result = tty_test_write(fx, msg, strlen(msg));
+	KUNIT_EXPECT_EQ(test, write_result, strlen(msg));
+
+	/*
+	 * TODO: Simulate hangup condition making subsequent writes fail
+	 * For now, just release.
+	 */
+	KUNIT_ASSERT_EQ(test, tty_test_release(fx), 0);
+}
+
+/**
+ * test_ttynull_read_behavior - Verify read behavior on null device
+ * @test: KUnit test context
+ *
+ * While ttynull technically supports read (via N_TTY), reading should
+ * behave predictably (likely EOF or blocking).
+ */
+static void test_ttynull_read_behavior(struct kunit *test)
+{
+	struct tty_driver *drv = ttynull_driver;
+	struct tty_test_fixture *fx;
+	struct tty_ldisc *ld;
+	/* char read_buffer[128]; */
+	/* ssize_t bytes_read; */
+
+	fx = tty_test_create_fixture(test, drv, 0);
+	KUNIT_ASSERT_NOT_NULL(test, fx);
+
+	KUNIT_ASSERT_EQ(test, tty_test_open(fx), 0);
+	KUNIT_ASSERT_TRUE(test, fx->opened);
+
+	ld = tty_ldisc_ref(fx->tty);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ld);
+	KUNIT_ASSERT_TRUE(test, ld->ops && ld->ops->read);
+	tty_ldisc_deref(ld);
+
+	/*
+	 * Reading from ttynull should behave consistently.
+	 * Depending on implementation, this might:
+	 * - Return 0 (EOF)
+	 * - Block (if no data available)
+	 * - Return -EAGAIN (if non-blocking)
+	 */
+	KUNIT_ASSERT_NOT_NULL(test, fx->tty->disc_data);
+	/* bytes_read = tty_test_read(fx, read_buffer, sizeof(read_buffer)); */
+
+	/*
+	 * Document the expected behavior
+	 *  - adjust based on actual ttynull implementation
+	 */
+	/* KUNIT_EXPECT_GE(test, bytes_read, 0); /\* Should not return error *\/ */
+
+	KUNIT_ASSERT_EQ(test, tty_test_release(fx), 0);
+}
+
+/**
+ * test_ttynull_driver_properties - Verify driver characteristics
+ * @test: KUnit test context
+ *
+ * Test the driver's static properties and configuration. Also, ensure that
+ * it implements the required file_operation ops.
+ */
+static void test_ttynull_driver_properties(struct kunit *test)
+{
+	struct tty_driver *drv = ttynull_driver;
+
+	KUNIT_ASSERT_NOT_NULL(test, drv);
+
+	/* Verify driver identification */
+	KUNIT_EXPECT_STREQ(test, drv->driver_name, "ttynull");
+	KUNIT_EXPECT_STREQ(test, drv->name, "ttynull");
+
+	/* Ensure that driver implements the required ops. */
+	KUNIT_ASSERT_NOT_NULL(test, drv);
+	tty_test_assert_valid_ops(test, drv);
+
+	/* Verify driver type */
+	KUNIT_EXPECT_EQ(test, drv->type, TTY_DRIVER_TYPE_CONSOLE);
+
+	/* Verify driver flags */
+	KUNIT_EXPECT_TRUE(test, drv->flags & TTY_DRIVER_REAL_RAW);
+	KUNIT_EXPECT_TRUE(test, drv->flags & TTY_DRIVER_RESET_TERMIOS);
+}
+
+static struct kunit_case ttynull_test_cases[] = {
+	KUNIT_CASE(test_ttynull_write_sink),
+	KUNIT_CASE(test_ttynull_read_behavior),
+	KUNIT_CASE(test_ttynull_driver_properties),
+	{}
+};
+
+static struct kunit_suite ttynull_test_suite = {
+	.name = "ttynull",
+	.test_cases = ttynull_test_cases,
+};
+
+kunit_test_suite(ttynull_test_suite);
diff --git a/drivers/tty/ttynull.c b/drivers/tty/ttynull.c
index 6b2f7208b564b659bf7faa4113541fcea7ec6ac0..baad9f0e3d27d97409a571e8da953384b7c64891 100644
--- a/drivers/tty/ttynull.c
+++ b/drivers/tty/ttynull.c
@@ -6,6 +6,7 @@
  *  Copyright (C) 2010 Samo Pogacnik
  */
 
+#include <kunit/visibility.h>
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/tty.h>
@@ -106,5 +107,9 @@ static void __exit ttynull_exit(void)
 module_init(ttynull_init);
 module_exit(ttynull_exit);
 
+#ifdef CONFIG_TTY_KUNIT_NULL_TTY_TESTS
+#include "tests/test_ttynull.c"
+#endif /* CONFIG_TTY_KUNIT_TTYNULL_TESTS */
+
 MODULE_DESCRIPTION("NULL TTY driver");
 MODULE_LICENSE("GPL v2");

-- 
2.43.0

