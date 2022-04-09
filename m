Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B41816
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649509229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pi4pYQTNYCuF2Y8MBQqcWvYBPADTg7R4hnusPThr2oY=;
	b=hF/TC2CP8JYabzaQTbXDLdngRZ+3q0BTas6hCTyiOTjShB0exJ6MC5Oh3UM+eDuTIMSpZU
	bGD7XJXXokyG52IEXCo+5E4a9SLAT86s7SggdxNzBllRSA9H8zpKfAZpJUbNIOCCLKADMe
	gFSVLQr0zjeBYhSuFuFzbZ768AhpPC8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-j-9ad2o_NwyTQRTnipfxig-1; Sat, 09 Apr 2022 09:00:28 -0400
X-MC-Unique: j-9ad2o_NwyTQRTnipfxig-1
Received: by mail-qv1-f69.google.com with SMTP id kd20-20020a056214401400b00443c252b315so11645603qvb.23
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 06:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pi4pYQTNYCuF2Y8MBQqcWvYBPADTg7R4hnusPThr2oY=;
        b=6f6wTbJB8qrivSDMcFTFvfQYURnUCkBSibfrhOFJEkVVpCmaYjo8Zp2llzKqxARBjy
         frXKPMO27/3wkVwZ9tl/zt33dO7SHZ/rRcqH8DDQjPTlAKWUHDgz6iWqbzgZDfU2XaDk
         Z3uERZEQ+r9OeQLWhrmkAu254AMAXw2puFle3hRogpoZJfOP8BfqxajQ0kB7Um/FMDna
         cuYi3Mf9HdT+468MmN/7NLPS71EKK6oIF9beTkNCrsCUusEr3dHmu6+RJH7EC9gXfvdT
         J+MWPmsGwgUVABoBOurJUSCIY927hoFZKRvBNVx2V7KKoE7G1x3htUJqkjFZBCJFt9ij
         DDyw==
X-Gm-Message-State: AOAM530P2NOR9RPiEzvp25ce21oa0kNfvB+iGMaXDUx8FRW4hLt4/ZFI
	+wpFWSKAizFDDv45q6Rf0oWMH/SDWLdZnbN2ptw0QQIS3VfwmvPHfhV+jNThFhri3pmVZoW4ky0
	+01EcScIz3Buc/Q==
X-Received: by 2002:a05:620a:f03:b0:67e:1e38:3a90 with SMTP id v3-20020a05620a0f0300b0067e1e383a90mr15707036qkl.442.1649509227404;
        Sat, 09 Apr 2022 06:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiWGKGegbZUryXgoDbOVNltQJuqFvoqURUtghXwG+4Ot6d+KTA+M614leRjmBRJgRVliPdwg==
X-Received: by 2002:a05:620a:f03:b0:67e:1e38:3a90 with SMTP id v3-20020a05620a0f0300b0067e1e383a90mr15706985qkl.442.1649509226925;
        Sat, 09 Apr 2022 06:00:26 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c10-20020ac87dca000000b002e1db1b7b10sm20782197qte.25.2022.04.09.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 06:00:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	marcan@marcan.st,
	martink@posteo.de,
	saranya.gopal@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tipd: improve handling of failures in interrupt handlers
Date: Sat,  9 Apr 2022 09:00:13 -0400
Message-Id: <20220409130013.1474412-1-trix@redhat.com>
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
core.c:516:6: warning: Branch condition evaluates
  to a garbage value
  if (event)
      ^~~~~

In cd321x_interrupt(), a successful call to
tps6598x_read64() is the only way event is set,
and if a failure happens the irq should not be
reported as handled.

Instead of initializing event, rework the
usage of ret by initializing it to IRQ_NONE
and then setting it when event is known to
be not zero.  This removes the if-statement
before the return.

tps6598x_interrupt() is similar.

Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 16b4560216ba..88a20cc15da4 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -478,12 +478,11 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	struct tps6598x *tps = data;
 	u64 event;
 	u32 status;
-	int ret;
+	int ret = IRQ_NONE;
 
 	mutex_lock(&tps->lock);
 
-	ret = tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event);
-	if (ret) {
+	if (tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event)) {
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
@@ -492,6 +491,8 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!event)
 		goto err_unlock;
 
+	ret = IRQ_HANDLED;
+
 	if (!tps6598x_read_status(tps, &status))
 		goto err_clear_ints;
 
@@ -513,9 +514,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 err_unlock:
 	mutex_unlock(&tps->lock);
 
-	if (event)
-		return IRQ_HANDLED;
-	return IRQ_NONE;
+	return ret;
 }
 
 static irqreturn_t tps6598x_interrupt(int irq, void *data)
@@ -524,13 +523,12 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	u64 event1;
 	u64 event2;
 	u32 status;
-	int ret;
+	int ret = IRQ_NONE;
 
 	mutex_lock(&tps->lock);
 
-	ret = tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event1);
-	ret |= tps6598x_read64(tps, TPS_REG_INT_EVENT2, &event2);
-	if (ret) {
+	if (tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event1) ||
+	    tps6598x_read64(tps, TPS_REG_INT_EVENT2, &event2)) {
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
@@ -539,6 +537,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!(event1 | event2))
 		goto err_unlock;
 
+	ret = IRQ_HANDLED;
+
 	if (!tps6598x_read_status(tps, &status))
 		goto err_clear_ints;
 
@@ -561,9 +561,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 err_unlock:
 	mutex_unlock(&tps->lock);
 
-	if (event1 | event2)
-		return IRQ_HANDLED;
-	return IRQ_NONE;
+	return ret;
 }
 
 static int tps6598x_check_mode(struct tps6598x *tps)
-- 
2.27.0

