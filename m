Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96BE79D6
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679086641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ueSLYTbczhpfG9NghbRnTQhmVk9+C96iBsuLv5iJJc=;
	b=UZ0NzoRyC9cFuIjibwQ7DAscLfmQ3KoLUPlxde60tzF7x+XYw9Y3ZW76cug3JmmSWaOkD1
	dzDhCzS7pokOI9sXXbIGcKoIj2ka2Vt2iD9hcNOFkH7+5dTHTjEXXPwGBbGYXRucpHXRP1
	bLK3cbMMZ7RUWht0S9ZwXh6U2GNJd7M=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-gZJMVdOFMymZCBnHrwLPUA-1; Fri, 17 Mar 2023 16:57:20 -0400
X-MC-Unique: gZJMVdOFMymZCBnHrwLPUA-1
Received: by mail-qt1-f198.google.com with SMTP id h21-20020ac87d55000000b003bffb1c9745so3129619qtb.4
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ueSLYTbczhpfG9NghbRnTQhmVk9+C96iBsuLv5iJJc=;
        b=CXY5BodErLzojIFVbxc/WddnRKHo81qOtVFl/bBYbPSvVxMSp2GSfgx8kMxJsdJriP
         yX1R/SfvchyB0YSdYEePXdrXn59oACkDnpJ+uYX8o5BZafgExBOAy1BJ3yH9tmVIsRp1
         XhGaMJ/1ZgJ0JGJCE334ypGaj3oytEfVWmQtp+upTQuyydl8SBwgGt2DXThIR/wviKEq
         ZUKVlyazSbrkyIuD89aQGjEXtmAj3RxpUXK7RPG20cDAV+KieW81jLAssodBFA4wYMT3
         NvkdIqLWECr2gxOcCxDwnCYasJdCJ7BlQ6Wxs78hmnRbrdzhd7VgNGNf4RfOnwKZlCbG
         mVfA==
X-Gm-Message-State: AO0yUKXqsDCEp3R6GAl+SohswBOS6jxVNRE/AWK+lUdSRgZD16Xqffst
	Yqz2tVPFFDkFEZiGCpYsT93pIEufzvzzYg0z/GX7aYAeNuckoLIkBopMby06M7ofDrYJgjOCqGy
	JNydU22kXpzEGtQ==
X-Received: by 2002:a05:6214:e88:b0:5b4:2271:b42f with SMTP id hf8-20020a0562140e8800b005b42271b42fmr15359007qvb.47.1679086639846;
        Fri, 17 Mar 2023 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set+i8S89kFUh6Def3I4RhtkIaIaYkO0oKXURsOnZTacJ2FYR4+jckCSLZDHDDsPzEFtMvK2Vgw==
X-Received: by 2002:a05:6214:e88:b0:5b4:2271:b42f with SMTP id hf8-20020a0562140e8800b005b42271b42fmr15358978qvb.47.1679086639567;
        Fri, 17 Mar 2023 13:57:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s20-20020a374514000000b00742bc037f29sm2295574qka.120.2023.03.17.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 13:57:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] serial: imx: remove unused imx_uart_is_imx* functions
Date: Fri, 17 Mar 2023 16:57:10 -0400
Message-Id: <20230317205710.1672232-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/tty/serial/imx.c:292:19: error:
  unused function 'imx_uart_is_imx21' [-Werror,-Wunused-function]
static inline int imx_uart_is_imx21(struct imx_port *sport)
                  ^
drivers/tty/serial/imx.c:297:19: error:
  unused function 'imx_uart_is_imx53' [-Werror,-Wunused-function]
static inline int imx_uart_is_imx53(struct imx_port *sport)
                  ^
drivers/tty/serial/imx.c:302:19: error:
  unused function 'imx_uart_is_imx6q' [-Werror,-Wunused-function]
static inline int imx_uart_is_imx6q(struct imx_port *sport)
                  ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/tty/serial/imx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 84bc0e768726..dbb3af4c1a34 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -289,20 +289,6 @@ static inline int imx_uart_is_imx1(struct imx_port *sport)
 	return sport->devdata->devtype == IMX1_UART;
 }
 
-static inline int imx_uart_is_imx21(struct imx_port *sport)
-{
-	return sport->devdata->devtype == IMX21_UART;
-}
-
-static inline int imx_uart_is_imx53(struct imx_port *sport)
-{
-	return sport->devdata->devtype == IMX53_UART;
-}
-
-static inline int imx_uart_is_imx6q(struct imx_port *sport)
-{
-	return sport->devdata->devtype == IMX6Q_UART;
-}
 /*
  * Save and restore functions for UCR1, UCR2 and UCR3 registers
  */
-- 
2.27.0

