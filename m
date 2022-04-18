Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE47A
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:44:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m14so18810773wrb.6
        for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U/BmndimxRUeGnhgbDunPyQq29ma5+SBfEP8BqMsdFU=;
        b=ZLnqQm98G+ZMkFQXpLyGZSX7fecCPhjMaUZd1GrcqcdgaP6HD6TuQSlDJ3MYDJ6g7y
         fjGPUCmal/HdSK6Joq1ZM5PJTvmmrMpUwmh9uy8kZyyOytxq4Fz91uEVLK/alpOxuHD+
         hhKyyIWY6OZg4IaB8v/e30AnJ50CeXu34skkKWsH66GkjbeNa7HhkbRLzoYi5D01P4Gb
         G5IiYD7NH9MxyhCdiPXFNJ0pIWeASI4bs01Vyn9WUV+AurAIfp9oIcZHa0DdeIQuZLEK
         6dv3Howdcd6jr+QU19tVb12STIXLZaknW+Tm6Q12MyVCw1Mz9sQRQ7882olvihPcasSD
         Z0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U/BmndimxRUeGnhgbDunPyQq29ma5+SBfEP8BqMsdFU=;
        b=dthJ1cuRMCyGYcUQT4J9x7tnPu6c2KWz40lEowDb3W6AmjIPWO1/hhYcbXCS838anE
         t+uZ74IGXCOX/CgXpF2Dq3XBJCFv7bqSMH6N3lu7WgMPU5BI+OBfmFnBZpnCtrUyllWD
         MElxzq6v+aqbGKTM2a206IKBDWaj6RvkgWZjOR8V+DiRqAmiZc8P/s8FTZ2BNSJEZuIf
         ZRmDeK98nzhcLGHRSWClFI7vvEuiVr4xzKfXfpa6CDODaW1Kfuei5i8phbwMpTJLSf/9
         bnjVG4EtWcAwA+ZC+1zeb0isZBqcu027G4rhvzLwc+1WGvqGsB4XdHL26QeG971ik/PJ
         c5og==
X-Gm-Message-State: AOAM5319v0GOYdJbGN9ARTQZg3ajIMu1gTzdK2rLCbEM2c7sM2SGnjFL
	KA9ylVUrp00jZPzJxwG2/kc=
X-Google-Smtp-Source: ABdhPJy6pPOJ+6VhwxYN/pnIzTHx+lgfuKlb7rqnPNvgzd2Y+LUnRXOI5h+9yUgPBmkfSXaE05jaAQ==
X-Received: by 2002:a05:6000:1ace:b0:203:d465:1a83 with SMTP id i14-20020a0560001ace00b00203d4651a83mr8476727wry.26.1650293058002;
        Mon, 18 Apr 2022 07:44:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d2-20020a056000186200b0020a7be3f1d2sm9107529wri.53.2022.04.18.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:44:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] PCI: versatile: Remove redundant variable retval
Date: Mon, 18 Apr 2022 15:44:16 +0100
Message-Id: <20220418144416.86121-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable retval is being assigned a value that is never read, the
variable is redundant and can be removed.

Cleans up clang scan build warning:
drivers/pci/controller/pci-versatile.c:37:10: warning: Although the value
stored to 'retval' is used in the enclosing expression, the value is never
actually read from 'retval' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pci/controller/pci-versatile.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index 653d5d0ecf81..7991d334e0f1 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -31,10 +31,9 @@ static u32 pci_slot_ignore;
 
 static int __init versatile_pci_slot_ignore(char *str)
 {
-	int retval;
 	int slot;
 
-	while ((retval = get_option(&str, &slot))) {
+	while (get_option(&str, &slot)) {
 		if ((slot < 0) || (slot > 31))
 			pr_err("Illegal slot value: %d\n", slot);
 		else
-- 
2.35.1

