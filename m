Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB12E228D
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756248715; cv=none; b=AnbckRaeLwlqyxoX4yjZhnrr0AsmBawc+QYy7sDY+oo6c3XSSd7sp4eXbhCiCT/9brt/xYDGkvvNCyTbCElplYbUStrwW/w19CeeRHvgEf+3VXfnaXa7eWzb9plH2kZWB84eR6VWl8TSQ2cB+gO30ZeM42N9I4dIccymporkTfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756248715; c=relaxed/simple;
	bh=nkgAgHfDk/2F0xYm3P4OtMs0EfdJM0Zbncn4co8vnRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reDgwLQFqlpbKVXv5tXF0B9sNiRLmgrL2nQm/fvGC9ejdLuEiSOF5ESfuReCYhw3VW501EhlFZ78VbVQPgp/qm6UlnVCIrO+3bS0zdf9+IyaupPbJgLl6v7DhvBHFtERD3RqnpNR5y4xRJZ7+AQYMQ8fC8nHm5EVlEY66g9Whpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isOszZe1; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isOszZe1"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b49e0686139so2671891a12.2
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756248712; x=1756853512; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmShpxcfS462EVS+o44vyyydTMfDb5DHqYeZ5mEw6/I=;
        b=isOszZe1K2WqLdERLQJ7C9E8ie5PF7WEdA/f5irJnI5ri5tonGUpFqRVZiunaHGNT2
         kOJjoe66yMLol/wunvnOvpTeTtY95ItVTilG9ybRGNF/SbanbrLn2i6kXN9BPOeVzAXZ
         7F6RNTbdUgt9cRw0IYfsu+KHnRg7uT6k1+tH0+s8WHpgkhEbAKRClOKpPTc4oIRHD5Xc
         m02Vj2XN6Pfj/+V91FJUUzewENJtPnS8+9dwDoIYCMA0gTgaWCSsg1daoqo3QIr/T1YC
         YolN8ZBNfZLWw2JDEJhOY5R9Pg4uDS2BxnStVWHWvrJLz6Pc8FpJ6Ruu8LFJxEiMtxCL
         7QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756248712; x=1756853512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmShpxcfS462EVS+o44vyyydTMfDb5DHqYeZ5mEw6/I=;
        b=Nviph46q22O1TEDTEvfkhZeU1FWTFrq8eSLnjTcm/F3mF2qyUG2fiBlQ9Ks+bVT/zd
         FbEbHi9tXFaUuwHUX6LwEeBhqmHxBJiEKLheY3PYFA2hZlFl77KsQzPwiKrOwYlX0u/m
         xxYn5TK0dPMU2NqjvUPaKE4EiDhdU6UbSeMBqQLSoug1NnoAFOoKHecfFr0Cml8BRkFL
         lFV0uXSxjA2H+RI5thIkHFJm1R1enu+ASn+Sox9JQtZHM+EXd5nNnK3ddJQ40aB7KKcr
         zPGWQnyY4DZLe5qOT7H3kVzcv7dRDeCsvNk64l+uLnM0marIH/IZpu+UARmD0fYiSmgO
         Egkg==
X-Forwarded-Encrypted: i=1; AJvYcCVj9YSQT0u90Zu/FN6I053O9PUAlwaXRI9IQfWc9zNv/zOP7omDqCdw+QEORg4FwLCdYHTc@lists.linux.dev
X-Gm-Message-State: AOJu0YwHwXWbJNpMVtJs7vsUh1M2JLME67CyzHbkOmurTk7cvuymTo2O
	nHtmSft22FwFLt2vMs8TKpZ+qqbQye0NcyeEWKI/ZGdc3Mkib5cuFbnD
X-Gm-Gg: ASbGncsHrCAxx15sOQ+/QaAafckhH4Weouwq+afsi+O13AV13k4W6XlQI5Bud86w6/v
	vTl+yI+k80HU7z6BpC7hnC2LjXYF1j1MpriQRMNnI3boaBWDOYxRRoxPN7fy5IQK0e/T5pUKalb
	iJKu3Zwriv8MF0hn/xBTSkoZLEGAXQGhI2DxJm2fM+ZDmid6ujo1+0EcrYGYymW2oeKkpwAIdcG
	yb+J6wzQo7YADRmNUs2FxzfjvHLbjJTdXCCQkRsPEgZkpIQASwjD8Tmpi6M0Q8GdyOwdy+BXhra
	dP2zex+ZoNmtZNvnchItuFFnSnhRlz+EZGVja8ZoekIuoxr5xkMlasTAvmlDm62YBs2zLKyXjwb
	W7gRkGR9VekUABhZk8sMP
X-Google-Smtp-Source: AGHT+IFWObHwEwct9wKgFlnQvPXciZeYkPjQRUnjpBOi9syrDOVV1chJhjD7o+c9mv2hvltz/iplog==
X-Received: by 2002:a17:902:cf09:b0:235:eefe:68f4 with SMTP id d9443c01a7336-2462eeb62edmr227348585ad.29.1756248711956;
        Tue, 26 Aug 2025 15:51:51 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a601esm105340815ad.162.2025.08.26.15.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:51:51 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Tue, 26 Aug 2025 16:51:33 -0600
Subject: [RFC PATCH 3/5] tty: Add mock TTY driver for KUnit testing
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-tty-tests-v1-3-e904a817df92@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756248706; l=6583;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=nkgAgHfDk/2F0xYm3P4OtMs0EfdJM0Zbncn4co8vnRo=;
 b=Z+qKGqJA9fK9NZS8wYfo/EhikMqsPVB7GCBpPxOPCqpPCOIL1nmddP0h2FHBuuOZ+3iVWDpuX
 YZGPBmtp4TkAqcLWTSy4Z7+ex31aI47u+L/qeY8QoLZDVdFqwwpwMne
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Implement a minimal mock TTY driver that provides deterministic
behavior for testing core TTY functionality. The driver simulates
immediate data transmission with configurable statistics tracking.

The mock driver enables testing of TTY core paths without hardware
dependencies or timing-sensitive behavior, ensuring reproducible
test results across different systems.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 drivers/tty/tests/tty_mock.c | 186 +++++++++++++++++++++++++++++++++++++++++++
 drivers/tty/tests/tty_mock.h |  34 ++++++++
 2 files changed, 220 insertions(+)

diff --git a/drivers/tty/tests/tty_mock.c b/drivers/tty/tests/tty_mock.c
new file mode 100644
index 0000000000000000000000000000000000000000..d5488760bb83c2837bb5226e3c33ec370c2c9c07
--- /dev/null
+++ b/drivers/tty/tests/tty_mock.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Minimal mock TTY driver for KUnit tests. Based on ttynull and ttyprintk
+ *
+ * Behavior:
+ *   - write() pretends to transmit all bytes immediately
+ *   - write_room() is large
+ *   - chars_in_buffer() is 0
+ *
+ * Tracks only: total_writes, total_bytes, last_write_len
+ *
+ * Copyright (c) 2025 Abhinav Saxena <xandury@gmail.com>
+ */
+
+#include <kunit/visibility.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/tty_flip.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+#include "tty_mock.h"
+
+#define TTYMOCK_NAME "ttymock"
+#define TTYMOCK_ROOM 4096
+
+static struct tty_port mock_port; /* single port */
+
+/* --- Stats (private) --- */
+static struct {
+	u64 total_writes;
+	u64 total_bytes;
+	u32 last_write_len;
+	spinlock_t lock;
+} mock_state;
+
+/* --- tty_operations --- */
+
+static int mock_open(struct tty_struct *tty, struct file *file)
+{
+	tty->driver_data = &mock_port;
+	return tty_port_open(&mock_port, tty, file);
+}
+
+static void mock_close(struct tty_struct *tty, struct file *file)
+{
+	tty_port_close(&mock_port, tty, file);
+	tty->driver_data = NULL;
+}
+
+static ssize_t mock_write(struct tty_struct *tty, const u8 *buf, size_t cnt)
+{
+	unsigned long flags;
+
+	if (!buf)
+		return -EINVAL;
+
+	spin_lock_irqsave(&mock_state.lock, flags);
+	mock_state.total_writes++;
+	mock_state.total_bytes += cnt;
+	mock_state.last_write_len = cnt;
+	spin_unlock_irqrestore(&mock_state.lock, flags);
+
+	return cnt; /* everything written immediately */
+}
+
+static unsigned int mock_write_room(struct tty_struct *tty)
+{
+	return TTYMOCK_ROOM;
+}
+
+static unsigned int mock_chars_in_buffer(struct tty_struct *tty)
+{
+	return 0;
+}
+
+static const struct tty_operations mock_ops = {
+	.open = mock_open,
+	.close = mock_close,
+	.write = mock_write,
+	.write_room = mock_write_room,
+	.chars_in_buffer = mock_chars_in_buffer,
+};
+
+/* --- tty_port_operations --- */
+
+static bool mock_carrier_raised(struct tty_port *port)
+{
+	return true;
+}
+
+static void mock_shutdown(struct tty_port *port) { }
+
+static const struct tty_port_operations mock_port_ops = {
+	.carrier_raised = mock_carrier_raised,
+	.shutdown = mock_shutdown,
+};
+
+/* --- Public helpers --- */
+
+int tty_mock_register(struct tty_driver **out_drv, struct device *parent)
+{
+	struct tty_driver *drv;
+	struct device *dev;
+	int ret;
+
+	spin_lock_init(&mock_state.lock);
+
+	drv = tty_alloc_driver(1, TTY_DRIVER_RESET_TERMIOS |
+				  TTY_DRIVER_REAL_RAW |
+				  TTY_DRIVER_UNNUMBERED_NODE |
+				  TTY_DRIVER_DYNAMIC_DEV);
+	if (IS_ERR(drv))
+		return PTR_ERR(drv);
+
+	drv->driver_name = TTYMOCK_NAME;
+	drv->name = TTYMOCK_NAME;
+	drv->type = TTY_DRIVER_TYPE_SERIAL;
+	drv->subtype = SERIAL_TYPE_NORMAL;
+	drv->init_termios = tty_std_termios;
+	tty_set_operations(drv, &mock_ops);
+
+	ret = tty_register_driver(drv);
+	if (ret) {
+		tty_driver_kref_put(drv);
+		return ret;
+	}
+
+	tty_port_init(&mock_port);
+	mock_port.ops = &mock_port_ops;
+
+	dev = tty_port_register_device(&mock_port, drv, 0, parent);
+	if (IS_ERR(dev)) {
+		ret = PTR_ERR(dev);
+		tty_unregister_driver(drv);
+		tty_driver_kref_put(drv);
+		tty_port_destroy(&mock_port);
+		return ret;
+	}
+
+	if (out_drv)
+		*out_drv = drv;
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(tty_mock_register);
+
+void tty_mock_unregister(struct tty_driver *drv)
+{
+	if (!drv)
+		return;
+
+	tty_port_unregister_device(&mock_port, drv, 0);
+	tty_unregister_driver(drv);
+	tty_driver_kref_put(drv);
+	tty_port_destroy(&mock_port);
+}
+EXPORT_SYMBOL_IF_KUNIT(tty_mock_unregister);
+
+struct tty_mock_stats tty_mock_get_stats(void)
+{
+	unsigned long flags;
+	struct tty_mock_stats state;
+
+	spin_lock_irqsave(&mock_state.lock, flags);
+	state.total_writes   = mock_state.total_writes;
+	state.total_bytes    = mock_state.total_bytes;
+	state.last_write_len = mock_state.last_write_len;
+	spin_unlock_irqrestore(&mock_state.lock, flags);
+
+	return state;
+}
+EXPORT_SYMBOL_IF_KUNIT(tty_mock_get_stats);
+
+void tty_mock_reset_stats(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&mock_state.lock, flags);
+	mock_state.total_writes = 0;
+	mock_state.total_bytes = 0;
+	mock_state.last_write_len = 0;
+	spin_unlock_irqrestore(&mock_state.lock, flags);
+}
+EXPORT_SYMBOL_IF_KUNIT(tty_mock_reset_stats);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/tty/tests/tty_mock.h b/drivers/tty/tests/tty_mock.h
new file mode 100644
index 0000000000000000000000000000000000000000..e61eeccc6181fc459d8db790b29350dbf3d9f588
--- /dev/null
+++ b/drivers/tty/tests/tty_mock.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TTY - Mock driver
+ *
+ * Copyright (c) 2025 Abhinav Saxena <xandury@gmail.com>
+ *
+ */
+
+#ifndef _TTY_MOCK_H
+#define _TTY_MOCK_H
+
+#include <linux/device.h>
+#include <linux/tty_driver.h>
+#include <linux/types.h>
+
+/* Register a single-port mock tty driver and create device #0. */
+int tty_mock_register(struct tty_driver **out_drv, struct device *parent);
+/* Tear down device, unregister driver and destroy port. */
+void tty_mock_unregister(struct tty_driver *drv);
+
+/* --- Stats available to KUnit tests --- */
+struct tty_mock_stats {
+	u64 total_writes;
+	u64 total_bytes;
+	u32 last_write_len;
+};
+
+/* Returns a snapshot of counters. */
+struct tty_mock_stats tty_mock_get_stats(void);
+
+/* Reset all statistics counters to zero. */
+void tty_mock_reset_stats(void);
+
+#endif /* _TTY_MOCK_H */

-- 
2.43.0

