Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D129CA
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640120411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=opHhr7eJomY1CIR2KI4V/ZHUiBD46mZi8UhoJAWs9bo=;
	b=RxscHBDT+SbDqznQv6BGgtoAWFiXEO44eTg8jHR1fRGImFZEqEnY7N5UUfx/7KYihHpZ92
	g6Uo0y6KfsBx8QACWQMx+gXib6/mwyl+B9888dyotmMrSEzhW8JyV6qXxIGa5OWBjkjGfT
	NiE7ITWnSyiDuYYnfHyFxGFEwMXTdG0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-fxCz2x0sOqKBHL6-3a4jEw-1; Tue, 21 Dec 2021 16:00:09 -0500
X-MC-Unique: fxCz2x0sOqKBHL6-3a4jEw-1
Received: by mail-oo1-f70.google.com with SMTP id c15-20020a4a87cf000000b002caccd96998so210141ooi.10
        for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 13:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opHhr7eJomY1CIR2KI4V/ZHUiBD46mZi8UhoJAWs9bo=;
        b=DDpsF8+Al39EALDRDh95a/MLByeraRL7jHx+/bj3fW/4EEhvVpFkqpAFHPjgmBM+b8
         nkzsMh0HSBc6D90E3X/Duu7PjknmnVpH7MiAO/Plf32BYgNYoavMK7FkfmiFOq2KlRq4
         WpJt2Qx55S5U+uwRCO+14kAQpqeTZHbs/ISh8CYRdftAP01hUmzq+w6aNQTyGKIBaznW
         9ajCpzv2DnCtN1FsfDfzIl7pOs82nCbPhzvE+tf6RZNiJQmZFglavVNWcuQZ0L+DCn5S
         8nCe869Zy/9axsbiQzsIqyFvc6CVd9SvXfTBdhW4RkVuSFUeemh+txG7NkaCE6qWJ5Lw
         vqPA==
X-Gm-Message-State: AOAM530YZx6CSP0rSPRMTmacaFMsYJG3FLX4bJOadjKeWoEJmGdEeveP
	FtVeP790H7jcs3hijGcQn/hOlJFP9W65bHflHNh9+B0oN7XZWHAY/awL+55WNJ/+zNzONdBsCTp
	t28Ya+TNuPnPUTA==
X-Received: by 2002:aca:aa49:: with SMTP id t70mr9911oie.85.1640120408915;
        Tue, 21 Dec 2021 13:00:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziVncuYfrfE+RPUGyGvApAs6V4DsQA0c2MP2vr+q3FzM7aw2hm+pPGcEc53t9Jy+88JOV4pw==
X-Received: by 2002:aca:aa49:: with SMTP id t70mr9890oie.85.1640120408439;
        Tue, 21 Dec 2021 13:00:08 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f59sm2021otf.9.2021.12.21.13.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 13:00:08 -0800 (PST)
From: trix@redhat.com
To: wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] crypto: cleanup warning in qm_get_qos_value()
Date: Tue, 21 Dec 2021 12:59:53 -0800
Message-Id: <20211221205953.3128923-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Building with clang static analysis returns this warning:

qm.c:4382:11: warning: The left operand of '==' is a garbage value
        if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
            ~~~~ ^

The call to qm_qos_value_init() can return an error without setting
*val.  So check ret before checking *val.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/crypto/hisilicon/qm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index b1fe9c7b8cc89..c906f2e59277b 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -4379,7 +4379,7 @@ static ssize_t qm_get_qos_value(struct hisi_qm *qm, const char *buf,
 		return -EINVAL;
 
 	ret = qm_qos_value_init(val_buf, val);
-	if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
+	if (ret || *val == 0 || *val > QM_QOS_MAX_VAL) {
 		pci_err(qm->pdev, "input qos value is error, please set 1~1000!\n");
 		return -EINVAL;
 	}
-- 
2.26.3

