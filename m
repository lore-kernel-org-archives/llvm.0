Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51906FBB
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673379390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yj+HBuTUncC5lE81l2Gg3tjvcbmvnq4VCsptZAErNXM=;
	b=af5cAjsE2jOMiYODzm28Gy8e9BE7x2XC0BfiigOhQVIgD3ct8Ssy3DPY3SuC9HjDNFazC8
	l0Jx3zf6CAvJjOwL9FzsSaVwIyqreCv+Lxx9unvlye+o/M1hyHIiuOHqlrLXw+Ey1rk/e2
	iOhLyhIlus3H+zXOa791aVAzmBGIh3s=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-2NQMfS56MCmUpqT1uaAKfw-1; Tue, 10 Jan 2023 14:36:21 -0500
X-MC-Unique: 2NQMfS56MCmUpqT1uaAKfw-1
Received: by mail-pj1-f71.google.com with SMTP id o8-20020a17090a9f8800b002260d01b221so9773308pjp.8
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 11:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj+HBuTUncC5lE81l2Gg3tjvcbmvnq4VCsptZAErNXM=;
        b=Og3/kX5+tm5RpP7kcT7/0oWECWfzkSTF6Eqrz2MtX53Xx4UOCPtgXn4i4Ov78dXlNw
         0qUaRDj3ynzYMXsDs35KiUMCO7NVUrnebTJR/BdsdinrLYK4YPv6PDV1cmIcb8PfoUll
         1f8nxk74Bf0hjrtBz9yrPsCtAkaeKV6NBNV/nngw3m2mNEikSLahfcNwAELWetbQ3t/w
         uNBXgTlBLMgJliTK3EknLGBaw0cqUIUzM8JZNAUIjUtGKmh+C8bTHuJ8Dwreh6dkb6lb
         Sjnn9DCQHseGD9o4aBNwnwYl7oR6n5JZRJgxmuCguLt8WHvEPe61SlXTu9bB2tSNbLR0
         gb0g==
X-Gm-Message-State: AFqh2kpPv0DjQfSoP0at6PrL6Rtn1kL+fEtSM3ilVH4IVpY9Df5gqizw
	yQGjmPufxk7i28wW4tK1eeNktPwCKxV6BYeR8KhZxaW/SY+TJ1xFO7l1U7HBPjhgyBVH7IHHI4p
	daGxX6uOJQo9qfQ==
X-Received: by 2002:a05:6a20:47c8:b0:9d:efbe:204b with SMTP id ey8-20020a056a2047c800b0009defbe204bmr76827472pzb.1.1673379380009;
        Tue, 10 Jan 2023 11:36:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCtPTYrYlOZy/4MsymT5iev0oOLVLTuxBLZWISSRSnYz9AF4e8Uu0T/HgOGW4RT0ynfsSHjQ==
X-Received: by 2002:a05:6a20:47c8:b0:9d:efbe:204b with SMTP id ey8-20020a056a2047c800b0009defbe204bmr76827465pzb.1.1673379379776;
        Tue, 10 Jan 2023 11:36:19 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 14-20020a630c4e000000b00478f87eaa44sm7005552pgm.35.2023.01.10.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:36:19 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bleung@chromium.org,
	groeck@chromium.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/chrome: cros_ec_lpc: initialize the buf variable
Date: Tue, 10 Jan 2023 14:36:11 -0500
Message-Id: <20230110193611.3573777-1-trix@redhat.com>
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

Clang static analysis reports this problem
drivers/platform/chrome/cros_ec_lpc.c:379:13: warning: The left operand
  of '!=' is a garbage value [core.UndefinedBinaryOperatorResult]
    if (buf[0] != 'E' || buf[1] != 'C') {
         ~~~~~~ ^

The check depends on the side effect of the read.  When the read fails
or is short, a buf containing garbage could be mistaken as correct.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 3708fa75feb1..68bba0fcafab 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -350,7 +350,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
-	u8 buf[2];
+	u8 buf[2] = {};
 	int irq, ret;
 
 	/*
-- 
2.27.0

