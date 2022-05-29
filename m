Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF4B7B
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 13:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653831981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+x+7esITuEjTahDQpOkrlpvxyvUZTU5N43BUwJS8j6w=;
	b=QRiJhINSlBCRaylGlwCO5VrJnaM3I72lKxymUpLr9q3WlD11ENaxPaYfDMUcttQ9zN8cJW
	4NaRT4e3NJmfPP8srXtC93LxhIRp0ACw8TWTnbKIPqbr3CFDm8iC+QoKf4VDv8BWUjUA0F
	J+d3kLoNRYGR5dFBjfvA89Pz9nPH6a0=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-2zIS53LkPlSzba81rengrQ-1; Sun, 29 May 2022 09:46:20 -0400
X-MC-Unique: 2zIS53LkPlSzba81rengrQ-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-e630d5d6easo5603828fac.10
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+x+7esITuEjTahDQpOkrlpvxyvUZTU5N43BUwJS8j6w=;
        b=ODwmnl+2ceAO4ZGHuRMAtMIpCbuAoBr9eYRzkoqET7LXbOoXUCfiCLc5HZIuKCKgic
         cB15JM1ZVGESTeQ5gPCPc6xdAq3csbojBkgoZSRiizEJy4oON3kW+ZKqZQh8oKwYYD/c
         hWsrz4WM0ClsQ868TnKbZSrhZMVuZ46EHK4zq8GCHezZbcWzuZ/i1/GhGcRaccyCBXNB
         Mjys3slwLwGZa+S/Hp6Jw4RKTXjAMglRl58+4esmFcsi1gD0T9UZlnbiWfK4oLl0a+YG
         L/Wq2IKWhLDU630EE0xez08g7UL1ZUCnIDqcV3ntsykXFZV0/rl9vmjd2HBrInmsHGZ2
         Entg==
X-Gm-Message-State: AOAM531J+PDDf7ZkBjbTbWMzt3QMdFGok6EA2KN981wKp2DQA6bSU2VS
	KbzXO1TrJpWkkP9HAWYVghGGsEUsTQeAhpDAgQNZV2TITjLkB9tugcg3ZV1lJ0B6gfmaLI6u9k5
	+HHLsSeBSdb26cw==
X-Received: by 2002:a05:6870:589a:b0:f2:fafb:3268 with SMTP id be26-20020a056870589a00b000f2fafb3268mr5161986oab.68.1653831979891;
        Sun, 29 May 2022 06:46:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy/4vZkdiw3Eo74fnOSNE+IkU85kNV9iYWClrYLk9dLPusPYefeXXCYc65O67WxYVv9jkq2A==
X-Received: by 2002:a05:6870:589a:b0:f2:fafb:3268 with SMTP id be26-20020a056870589a00b000f2fafb3268mr5161978oab.68.1653831979679;
        Sun, 29 May 2022 06:46:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y13-20020a9d714d000000b0060aea5bbc87sm3958874otj.18.2022.05.29.06.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 06:46:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peter@hurleysoftware.com
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] serial: core: check if uart_get_info succeeds before using
Date: Sun, 29 May 2022 09:46:05 -0400
Message-Id: <20220529134605.12881-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang static analysis reports this representative issue
drivers/tty/serial/serial_core.c:2818:9: warning: 3rd function call argument is an uninitialized value [core.CallAndMessage]
        return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

uart_get_info() is used the *show() functions.  When uart_get_info() fails, what is reported
is garbage.  So check if uart_get_info() succeeded.

Fixes: 4047b37122d1 ("serial: core: Prevent unsafe uart port access, part 1")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/tty/serial/serial_core.c | 52 ++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 9a85b41caa0a..4160f6711c5d 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2690,7 +2690,9 @@ static ssize_t uartclk_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.baud_base * 16);
 }
 
@@ -2700,7 +2702,9 @@ static ssize_t type_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.type);
 }
 
@@ -2710,7 +2714,9 @@ static ssize_t line_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.line);
 }
 
@@ -2721,7 +2727,9 @@ static ssize_t port_show(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	unsigned long ioaddr;
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	ioaddr = tmp.port;
 	if (HIGH_BITS_OFFSET)
 		ioaddr |= (unsigned long)tmp.port_high << HIGH_BITS_OFFSET;
@@ -2734,7 +2742,9 @@ static ssize_t irq_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.irq);
 }
 
@@ -2744,7 +2754,9 @@ static ssize_t flags_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "0x%X\n", tmp.flags);
 }
 
@@ -2754,7 +2766,9 @@ static ssize_t xmit_fifo_size_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.xmit_fifo_size);
 }
 
@@ -2764,7 +2778,9 @@ static ssize_t close_delay_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.close_delay);
 }
 
@@ -2774,7 +2790,9 @@ static ssize_t closing_wait_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.closing_wait);
 }
 
@@ -2784,7 +2802,9 @@ static ssize_t custom_divisor_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.custom_divisor);
 }
 
@@ -2794,7 +2814,9 @@ static ssize_t io_type_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.io_type);
 }
 
@@ -2804,7 +2826,9 @@ static ssize_t iomem_base_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "0x%lX\n", (unsigned long)tmp.iomem_base);
 }
 
@@ -2814,7 +2838,9 @@ static ssize_t iomem_reg_shift_show(struct device *dev,
 	struct serial_struct tmp;
 	struct tty_port *port = dev_get_drvdata(dev);
 
-	uart_get_info(port, &tmp);
+	if (uart_get_info(port, &tmp))
+		return 0;
+
 	return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
 }
 
-- 
2.27.0

