Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202560;
	b=wIO+ZKUwzqAx3SVTpVADQTEV12vs6VcJk3boN77P50NKNaD+zfGiIYQDKuBeh4jcSU7q
	 DzRm/9uC9RsOYuIbqOnY/82EKrjFQcK/rt8foGv/lU+YQX/rnfy0DHV8XUvxDlwiA0qjL
	 0CRH6/zIMeqdjRmI+zVa1/5P+C3UBipnw1vu+YiWWNFDzfYPG+SDO77n3bcT8qU47B3oh
	 sdRFpF+R2GQdgNPw8cWBOLzZbMdruMH18j0P85BwFeka0+r3mVcw8Y6dFS03fH81nFdSc
	 n2Ij8JFs6eFUHphPKQEkUk43PmC91mjQT/KmY48nw2KMqkzCtxAdrx4FQzp3XtAGd3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
	b=0KWSS1TNZaCbsDdliRk+yZXGPOFpKmPr6wBo+kY9gML+l2VVRBHPoUVHwiJMYxpwmuOO
	 p2PAvGD9W+Fsym09Np0MtZf/mrK0S/lzgj9EILC3FGCft3MXLZAt8q5OhGPxenjwNvsdk
	 ZeY70KPav9TjWzbCQkV7pJ50BxxScWsYJ2bOON3/iAJZIEqxB4LFTwHZfVUaXLQdNCj0U
	 vcfxPy0bF2sQPv/o+qS6IZFBDjzVocuoCO0B7vEZKE+R1E+ADuu5ZY0mvpLvvMdzIw/Ta
	 WvtMn+Mf9RZTWJqRt+SF4VRUiXqtbrF1smm7bm9vIJomIwA3yhSrmqTzJzwKzXkkj8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ga3WFCeU;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECD606A6E2
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AECD606A6E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ga3WFCeU
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so3400823eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202557; x=1795807357; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
        b=Ga3WFCeUG//eYK9QLmiZabYCJSuY+/3OR0g68LAQelSvLyrJ3UIoeEjNatTSFGaAtA
         wMiczplEKSNPOGAwrDYJlg5rJxQssAdK2hDawujTjSkXL290+YEbpS5fm5zajj5KVLmq
         sr0nVXZmbldH0sUB77F9+auY/lzoK4rtQyNz5lOwVH7WkT4R41d0/BfuDxWpqr5AQdRw
         74vQ+fsu2xuH6wrxCzfMr24NATN0Qm8v9e5yiv0O5N00/EWDTVEoPuKE7oUyUQ9wcF8R
         XdQMWMT+cQdR0O4yzO6zJbSeahGm3tR8ZBtYoMC26EfFWCtcYYtVGAqyqpsEqF3roxK4
         jMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202557; x=1795807357;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fTBwITHRCHhMTw7Dj5LKL4SBycn9eq+C/BpvV4iDsE=;
        b=JQrwbhAOxK0dElV9M1Y9+bKP+uPm4P7FbdAuhnrTAgdIicdIvg0hIzoStf4rom3Hcd
         ECXMWnPrrn2QnGrnI0YMAhtjzO68YlIL18p7EeMyY9uHD3hOUXWhxQZ5BRnzSwlZSAWp
         kaQCwd1fvg4F5hH6HROxeJspVb3Zwf+pAbUEUaSPzOm2OSKec1qn8csIudijn8TB6Xbd
         1v+F4viu0jrhQkwTEs0iD3+FlZ13XU2y6jseXNoDib3K0h8SijR/lnLGHRC2APrYbknA
         mXcGiXTk/6J0K2GehAHNmhTJrde2KH3p9VqKCn7xPgd7qiokXzUkFLKePDVKnZWFF0yc
         izxg==
X-Forwarded-Encrypted: i=1; AL+hErFHTzHG9zpv18HIkXrSRrqOGqWwSKFdtwKkkaO6RoVQw1sG27cTht1YXFGDpqFYT1sIAHVO@lists.linux.dev
X-Gm-Message-State: APuU4Z8J6elz483TgubMhju3LFwtjAvRTgtHAp8lwirKvLToxB9Er4OI
	vYHzhT9CAUDYqUWzgg/umXohn6kANGIx72oe4na6TlnZfo4cR1YxMwmx7uWrhWVTZV8ryOhsMe4
	JGg==
X-Received: from dyba14.prod.google.com ([2002:a05:693c:63ce:b0:381:935d:2548])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:805a:b0:376:a6d7:8f51
 with SMTP id 5a478bee46e88-3856e63bbe9mr4561064eec.12.1795202557046; Fri, 20
 Nov 2026 11:22:37 -0800 (PST)
Date: Fri, 20 Nov 2026 19:21:47 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192147.2869595-1-elkin@google.com>
Subject: [PATCH] serial: 8250_exar: check IS_ERR() on __xr17v35x_register_gpio()
From: Elkin Cruz <elkin@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

__xr17v35x_register_gpio() calls platform_device_register_full(), which
returns an ERR_PTR() on failure rather than NULL. Both
xr17v35x_register_gpio() and iot2040_register_gpio() store the return
value directly into priv->gpio without checking IS_ERR() and return 0;
xr17v35x_unregister_gpio() later tests only if (priv->gpio) and
dereferences the error pointer via __xr17v35x_unregister_gpio().

Check IS_ERR(pdev) and propagate PTR_ERR(pdev) in both callers.

Fixes: 1145d1a0703f ("serial: 8250_exar: use platform_device_register_full()")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/tty/serial/8250/8250_exar.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index 42e55a8f8c69..66858e383afc 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -1173,8 +1173,14 @@ static const struct software_node exar_gpio_node = {
 static int xr17v35x_register_gpio(struct exar8250 *priv, struct pci_dev *pcidev,
 				  struct uart_8250_port *port)
 {
-	if (pcidev->vendor == PCI_VENDOR_ID_EXAR)
-		priv->gpio = __xr17v35x_register_gpio(pcidev, &exar_gpio_node);
+	if (pcidev->vendor == PCI_VENDOR_ID_EXAR) {
+		struct platform_device *pdev;
+
+		pdev = __xr17v35x_register_gpio(pcidev, &exar_gpio_node);
+		if (IS_ERR(pdev))
+			return PTR_ERR(pdev);
+		priv->gpio = pdev;
+	}
 
 	return 0;
 }
@@ -1286,13 +1292,17 @@ static int iot2040_register_gpio(struct exar8250 *priv,
 				 struct uart_8250_port *port)
 {
 	u8 __iomem *p = port->port.membase;
+	struct platform_device *pdev;
 
 	writeb(IOT2040_UARTS_DEFAULT_MODE, p + UART_EXAR_MPIOLVL_7_0);
 	writeb(IOT2040_UARTS_GPIO_LO_MODE, p + UART_EXAR_MPIOSEL_7_0);
 	writeb(IOT2040_UARTS_ENABLE, p + UART_EXAR_MPIOLVL_15_8);
 	writeb(IOT2040_UARTS_GPIO_HI_MODE, p + UART_EXAR_MPIOSEL_15_8);
 
-	priv->gpio = __xr17v35x_register_gpio(pcidev, &iot2040_gpio_node);
+	pdev = __xr17v35x_register_gpio(pcidev, &iot2040_gpio_node);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+	priv->gpio = pdev;
 
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog

