Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288FD30A
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679422398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7PqcmUw+IZmRGt9WUw0A+lCjcIOG3yrVoicilFi5R4o=;
	b=Aa9TIQakz5fAXa78lnLEfS0RxZwWyUDqVl4iJlaom1Lxeo1Ski8DPFL9S2Nakt0bugtuR8
	d3TMiqI/vBYO3SUiaK/QsEuQ3EHfevy9rjNhQgLe71xhNLRH+NG9bdZTLhJAHAXshMShHX
	ckT7u6K3KPDVHu2hrag4VTJ0dWNMwOo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-LsU2romWO9i_3IcGxxjYMw-1; Tue, 21 Mar 2023 14:13:06 -0400
X-MC-Unique: LsU2romWO9i_3IcGxxjYMw-1
Received: by mail-qv1-f72.google.com with SMTP id e11-20020ad4536b000000b005a9292e8c2bso8072383qvv.1
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679422383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PqcmUw+IZmRGt9WUw0A+lCjcIOG3yrVoicilFi5R4o=;
        b=2lMWuIulYOTZuQ2Z02eLn+KsEew928oNKheVeAhkyM4tkon9XPV+tF+6uzEMSO0CIf
         yqu/JQ8m4ZJGu+fDDAJ+t2d6n7w5fcJL126pn85UI+AKqcaUICbGj5m4jOJur+zdwq9k
         Ur75KchiTLq54ctS4QKTfqEgHxu4FpogFdp3/j7CP+nxwHeqTnv1+wyJOyDB8ZBaybDx
         9s4Sk1h8rrpjkE/q/Bd5+rx56XgLHRCarLO+ZPDoBZhgJ+Ogdg5QUgDA2AGPalOZd9Z6
         Ijv8APPbvdTSdM4uy2OrTQfwSzRBu+UJFgTSF6Xr//YXcFuiA2sHr2DmBWotD8RlWx5f
         C7fg==
X-Gm-Message-State: AO0yUKUCPk5UFVXV71zMftWi/7n+lf9fLxa66FYp4o9jPqe9mjfqJ2mN
	lht0tmpRIBItOgUTObXrHIBUIKYyhf4qU7eZJmkXU3kTw3UI1Yoi1iDlV5g4Eviz3vpJh+a0+WW
	uWF7HZdjCjHFRXA==
X-Received: by 2002:ac8:7c55:0:b0:3e3:8119:7c68 with SMTP id o21-20020ac87c55000000b003e381197c68mr1356029qtv.52.1679422383558;
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set+5mKIAyTWquc0+eLxRrstoll07nUcDhsg7ybPYJhnq2pOAz549MYFTu+kSCHFP7AxBTc+21g==
X-Received: by 2002:ac8:7c55:0:b0:3e3:8119:7c68 with SMTP id o21-20020ac87c55000000b003e381197c68mr1355993qtv.52.1679422383304;
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a0a0100b0074631fb7ccesm9599518qka.67.2023.03.21.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:13:03 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: serial: quatech2: remove unused qt2_setdevice function
Date: Tue, 21 Mar 2023 14:12:55 -0400
Message-Id: <20230321181255.1825963-1-trix@redhat.com>
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
drivers/usb/serial/quatech2.c:179:19: error: unused function
  'qt2_setdevice' [-Werror,-Wunused-function]
static inline int qt2_setdevice(struct usb_device *dev, u8 *data)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/serial/quatech2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index 6fca40ace83a..fee581409bf6 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -176,14 +176,6 @@ static inline int qt2_control_msg(struct usb_device *dev,
 			       NULL, 0, QT2_USB_TIMEOUT);
 }
 
-static inline int qt2_setdevice(struct usb_device *dev, u8 *data)
-{
-	u16 x = ((u16) (data[1] << 8) | (u16) (data[0]));
-
-	return qt2_control_msg(dev, QT_SET_GET_DEVICE, x, 0);
-}
-
-
 static inline int qt2_getregister(struct usb_device *dev,
 				  u8 uart,
 				  u8 reg,
-- 
2.27.0

