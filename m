Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FB1846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 14:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679235063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
	b=Abmfty+6siissClr1knlEe7KVj+Vs+6FG0LlKKYh81uLxWnpOmsqxfEnlx2tI8jfTANl83
	KdMfzggPM722JCixpDBGw1PFJi6YcYWrtKMg9dzhmdbLH8ILIRmfUrXVqRKxTJ9fmkg/X6
	UsdttU3bpiimp4Vjvb224MOrCuTY3BY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-fPRzRoJ9MKq6uGMMN3qPHw-1; Sun, 19 Mar 2023 10:11:02 -0400
X-MC-Unique: fPRzRoJ9MKq6uGMMN3qPHw-1
Received: by mail-qk1-f200.google.com with SMTP id 191-20020a3705c8000000b007459d84a0f9so4471252qkf.17
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 07:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679235061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
        b=FcxegrYM7BYaOyfTWl2uSur3bcnSGiXBp8reMbN73jIcyxT/yeJA8dKidx+pgB2sZG
         8n7ybmv6plxgGqj+wCVSyJsY0iv7ZBBSnJfCpT23730dZhOoDAUm4IDhR2M+ZLloOPfv
         NAORFFnBZrcbPf2TdBWlhd4q5XAbEw5I24gKMxlR0gYx9Ce39xatMpMnceISEH+wPWb4
         eK3hoJcOqK8gtDPlbzNBMqRGwpBQ2/DHRwG1PHNoz5LP8tdw23UewaMbVpRkQkLT4CL1
         a/RsRARBe+GXe36ILWPB70IBJxrBAtX6pX8ciTv2UaZSGm+R+kjZydCbBbqA/OMx5V7A
         2hqw==
X-Gm-Message-State: AO0yUKXi3J1ap9duipqzho643wt8uO9ALwmr3btROyDp0txrLXxTFk5M
	z8nnF2dlDmWzihosndJPMF/NtjxMHx4KULv7MZu7HWpOh7wiHiTRJZiUbpvqPH1v/qwqu6Sujt0
	lvHh3K0+goOy0+A==
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743874qtk.15.1679235061583;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set82QnetAWI+F3gcmRcjmUamYUEWEUr1FY8V21h15oRUvVodbHhYtRBiyrHKXmDFomTxkbB5rQ==
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743843qtk.15.1679235061327;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a22ab00b0074583bda590sm5492950qkh.10.2023.03.19.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tcpci_mt6360: remove unused mt6360_tcpc_read16 function
Date: Sun, 19 Mar 2023 10:10:53 -0400
Message-Id: <20230319141053.1703937-1-trix@redhat.com>
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
drivers/usb/typec/tcpm/tcpci_mt6360.c:46:19: error: unused function
  'mt6360_tcpc_read16' [-Werror,-Wunused-function]
static inline int mt6360_tcpc_read16(struct regmap *regmap,
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 1b7c31278ebb..6fa8fd5c8041 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -43,12 +43,6 @@ struct mt6360_tcpc_info {
 	int irq;
 };
 
-static inline int mt6360_tcpc_read16(struct regmap *regmap,
-				     unsigned int reg, u16 *val)
-{
-	return regmap_raw_read(regmap, reg, val, sizeof(u16));
-}
-
 static inline int mt6360_tcpc_write16(struct regmap *regmap,
 				      unsigned int reg, u16 val)
 {
-- 
2.27.0

