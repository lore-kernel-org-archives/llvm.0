Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21B2F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644424237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1bQbhgSAF2lPgwQubVMn3pqKT77IeuZyyfYEoagC560=;
	b=OzZZBix1TepSiZNrHF1wGMMRLbk3Wdr1EfdFgs+ZWwppnyfGuA0q0gzMd1QVdLzDemRTPe
	ZyivcnKYRftCcw7u9Xp/NF6Io99pt2A6WDsSCucop4QC57PnwQEbOvYQkCH5WpPNhDxqOo
	xk9aDE0wnS4wuvcQ6N00dq6yhvzIjR8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-zCt7dEPnN1e7z3PC5GJUqQ-1; Wed, 09 Feb 2022 11:30:36 -0500
X-MC-Unique: zCt7dEPnN1e7z3PC5GJUqQ-1
Received: by mail-qk1-f199.google.com with SMTP id b204-20020a3767d5000000b004b2a0d2e930so1754595qkc.15
        for <llvm@lists.linux.dev>; Wed, 09 Feb 2022 08:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bQbhgSAF2lPgwQubVMn3pqKT77IeuZyyfYEoagC560=;
        b=1DcMRqjiRh+5xDs0EhcQbEKsavJyGcOHyjhPb8uMTS6odmEeP9A7v7H0+O6ZIrm0SW
         IepSYscrEf04L9MWB4SCtRGkkJT7tqpdr5y/qnTV6SNJyajaDpr3eCcskIeNRpnZac1k
         xALMAJpgNTj+KRsy8aYkVWChABN/FAgEnSvpbeJOG9X7Cl5s9+/GfJmbLr6iTpe4WGmU
         cPuzKKy4Tr5fhxr0cuz/1ajuxQ76bkMkwlIIInivAX8cjI/QET1YPJgDGgsFLc8qGfsI
         KPNbKYctyGECF2pMvh4+WUu02xn0KcT9RJ/VyQynh2iQ+W0GbaHoaORBcaGmzaHwkpQp
         k0rA==
X-Gm-Message-State: AOAM5322dMXIsLeSekVor6YfWdYNVv8BHi+xd52phUZ0dt2tQMrUNfef
	D6l/63tZKp7JXo1qFvB3NRZ/MIhjmyoQpeqg1VaAGoF3FUuUvTIwiP8xJcEyvbkQN9srqWZfMtf
	P4VdyDvOC01ptJw==
X-Received: by 2002:a37:4648:: with SMTP id t69mr1512060qka.702.1644424235750;
        Wed, 09 Feb 2022 08:30:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnwrxGYEFisJG8vsAxtzWQegq11Myco9LBMvHqdQZ4x/6E6Yb1DWf2feI7/8QDUXQ7/ItaQg==
X-Received: by 2002:a37:4648:: with SMTP id t69mr1512046qka.702.1644424235520;
        Wed, 09 Feb 2022 08:30:35 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m4sm8323725qka.111.2022.02.09.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:30:34 -0800 (PST)
From: trix@redhat.com
To: lhjeff911@gmail.com,
	broonie@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] spi: initialize ret variable
Date: Wed,  9 Feb 2022 08:30:29 -0800
Message-Id: <20220209163029.2299009-1-trix@redhat.com>
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

Clang build fails with
spi-sunplus-sp7021.c:405:2: error: variable 'ret' is used
  uninitialized whenever switch default is taken
        default:
        ^~~~~~~

Restore initializing ret.

Fixes: 47e8fe57a66f ("spi: Modify irq request position and modify parameters")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/spi/spi-sunplus-sp7021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index ba5ed9f7277a3..fc61578ce5c47 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -375,7 +375,7 @@ static int sp7021_spi_slave_transfer_one(struct spi_controller *ctlr, struct spi
 {
 	struct sp7021_spi_ctlr *pspim = spi_master_get_devdata(ctlr);
 	struct device *dev = pspim->dev;
-	int mode, ret;
+	int mode, ret = 0;
 
 	mode = SP7021_SPI_IDLE;
 	if (xfer->tx_buf && xfer->rx_buf) {
-- 
2.26.3

