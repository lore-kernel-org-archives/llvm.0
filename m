Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A14163
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647703898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RDYbzlAeYYOLKs0jJASD2ePoaygRETdsPOHhL2YcgAw=;
	b=Y2t8oHMJSpFSykqumcD0q93Al3zp/nWd1RzoQbPMlAgI3ssa6MpmftYkBMGW+k8o01zDAC
	E6h4kIfj0zXpgCf9i6YvXeGPdfN0uhXdN7+ZDHqcfa3GEw9cMy8XOSqLpLEriu18U6mDMW
	k+9ttuljygxtoZbBS6oUlh+qu/4Ly/g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-BhKZ5BZpNuqBoUJeYTJP_w-1; Sat, 19 Mar 2022 11:31:35 -0400
X-MC-Unique: BhKZ5BZpNuqBoUJeYTJP_w-1
Received: by mail-qt1-f199.google.com with SMTP id u8-20020ac858c8000000b002e1b3ceb167so7404929qta.10
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 08:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RDYbzlAeYYOLKs0jJASD2ePoaygRETdsPOHhL2YcgAw=;
        b=gwtrgDrcJLQ5VJAIykehqk1brtBWYfxHBiRhgoM3PJNgUl0jGFELDpH/sEr34aU8yJ
         ryuzccy8O+n9b5rDeYjbNK/Dxr5nfw6K4e+uvs1abP8C6rO3dMwySK0HtuMdpJ27DpPr
         qxiCvaU54A/Ro75rE+F0fThqvfz5DNjeZFoJJHwGiKebbFh+KixJ0rGVh0gZl+onvjas
         trcUZqQg+G7HULCWMZ7MEMjxrVZo1zAHXLN9u2erFc+z/0/fjICLpx5A+36ZZoGy1HJV
         oF1UrVNt3H8HFJrmrZYlb2p3P+zXrojeehVVtrv7+kxPqciFczddqW09pGxr9c1/ztxN
         ckaQ==
X-Gm-Message-State: AOAM531+Ey1q1jdkf2BEGAePWnt01SszMiHKz7xEjcru7fYuIcTQ+Bar
	A5+YsZmZSAnnfaKbEAw/1+fl1t+u/lrHL+HCCykyzDKQf0KIxi33Dj9CGZ5sWGKnjGp1sunnxBh
	gBhjggSQcfZuZxQ==
X-Received: by 2002:a05:620a:430b:b0:67e:85d1:f53f with SMTP id u11-20020a05620a430b00b0067e85d1f53fmr376985qko.43.1647703894468;
        Sat, 19 Mar 2022 08:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylEZz+szJS3qXk/iEXTdbF/WnpVfwDLcvLyw6fK6qEuP1X7aGSWen2MjQL9ePfNbUbvv7PgQ==
X-Received: by 2002:a05:620a:430b:b0:67e:85d1:f53f with SMTP id u11-20020a05620a430b00b0067e85d1f53fmr376962qko.43.1647703894215;
        Sat, 19 Mar 2022 08:31:34 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b2-20020ac87fc2000000b002e1b9ddb629sm7850596qtk.47.2022.03.19.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 08:31:33 -0700 (PDT)
From: trix@redhat.com
To: mkl@pengutronix.de,
	mani@kernel.org,
	thomas.kopp@microchip.com,
	wg@grandegger.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] can: mcp251xfd: return errors from mcp251xfd_register_get_dev_id
Date: Sat, 19 Mar 2022 08:31:28 -0700
Message-Id: <20220319153128.2164120-1-trix@redhat.com>
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

Clang static analysis reports this issue
mcp251xfd-core.c:1813:7: warning: The left operand
  of '&' is a garbage value
  FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
  ^                                      ~~~~~~

dev_id is set in a successful call to
mcp251xfd_register_get_dev_id().  Though the status
of calls made by mcp251xfd_register_get_dev_id()
are checked and handled, their status' are not
returned.  So return err.

Fixes: 55e5b97f003e ("can: mcp25xxfd: add driver for Microchip MCP25xxFD SPI CAN")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
index 325024be7b045..f9dd8fdba12bc 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
@@ -1786,7 +1786,7 @@ mcp251xfd_register_get_dev_id(const struct mcp251xfd_priv *priv, u32 *dev_id,
  out_kfree_buf_rx:
 	kfree(buf_rx);
 
-	return 0;
+	return err;
 }
 
 #define MCP251XFD_QUIRK_ACTIVE(quirk) \
-- 
2.26.3

