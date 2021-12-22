Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE4A173
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640194169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ziVhIeG/+C1hVAL/19RU4EWJLhjrdCffUUmjmXtDbFA=;
	b=aqz77xozJKZoWnzZ33aJUiSGX2r8Uzfniq/uaa7UnOGQU75BSMUVjKpP/jr7G4rhPVL5lp
	BkpneCjLmr14JYZpV9vMhYlRZxckROrgSIVBmSmwiwRWXxWKxHwBMSCCjBvahc97mY/eGC
	2YmhEY2heMhDh/vyHn4C1qch+hNJf+o=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-jH2wmW8jOu-h4HbnLifDwA-1; Wed, 22 Dec 2021 12:29:28 -0500
X-MC-Unique: jH2wmW8jOu-h4HbnLifDwA-1
Received: by mail-oo1-f71.google.com with SMTP id p3-20020a4a4803000000b002da84ca8abcso1470155ooa.14
        for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 09:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziVhIeG/+C1hVAL/19RU4EWJLhjrdCffUUmjmXtDbFA=;
        b=vBNmJP6YmfITxJpM1x/bspQT2wqkcRnbJdMR5v1yFiP/3QtP37qPIrjpWLBp1/i0ia
         j8BPd4qBwTc4brWsmgyuo0By+IJM8j7hrFD9K/vwrh3QJ6t9XLDQ1VEDUxnDKsKbLA4q
         Z6xynAtvsMx9w6uIjPrA15+vWZRtlU+rguR4pHyk3/G6FV2mORhr4vXToar4GfqPy++V
         wORm4aJGSMHEOyO4hSEqiqznXoJs/9F0bS2HT62e62whaTfijOx+3/v6+DNkGI+CHbiP
         nYExSilkkzBpZJPGqlKb9PDtDs/50FfSOQN2KsgJE1FrXTjeCbbj1pkIl2gGpv+G9Rc5
         V0hA==
X-Gm-Message-State: AOAM532fryxnGiR6+PRM7yjfVBVUDawB6SpzRhL9FuaVAvRbxQCjsvAz
	8R31T66i3VLvaRzr6MMcuP4CSWiHavkxLBteHa00caR4kAUwprFL2XTuK2E1VtF9BKxjand8/QR
	KwCPBgdZyVDz0Zw==
X-Received: by 2002:a05:6830:314b:: with SMTP id c11mr2687013ots.224.1640194167842;
        Wed, 22 Dec 2021 09:29:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLuaJSYaMDrkK3LxDpl+f8Sw4+Sd0epeIomMC+76AxWf8uHWNgfE2xrDKogbzg5ksrKHQIdg==
X-Received: by 2002:a05:6830:314b:: with SMTP id c11mr2687001ots.224.1640194167650;
        Wed, 22 Dec 2021 09:29:27 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id m12sm512075oiw.23.2021.12.22.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 09:29:27 -0800 (PST)
From: trix@redhat.com
To: wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nathan@kernel.org,
	ndesaulniers@google.com,
	yekai13@huawei.com
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] crypto: cleanup warning in qm_get_qos_value()
Date: Wed, 22 Dec 2021 09:29:23 -0800
Message-Id: <20211222172923.3209810-1-trix@redhat.com>
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

Fixes: 72b010dc33b9 ("crypto: hisilicon/qm - supports writing QoS int the host")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: Add Fixes: line

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

