Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCF87B
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679354607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GpP2z7KdETtSjf5FRKQeOFJT3f2f22hqp1FLeOMOD9E=;
	b=HQATAizG9jhHYFZUGfwzDME/fop7WF3BcXwsrMp1TZXGgE/8lNb7I7diD3Zs8h6xp53uaj
	9i1KEIaSQ+EJ0681HR9qErzQCcEoX/E2VTI6gv75eS2CVE4WaP8MHLW14F3ftEILboioq1
	/VugaMU1GY1Jttd2NWBfQ+RnfGhT9js=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-piCWPBEyNRuToDM-zWPhgA-1; Mon, 20 Mar 2023 19:23:26 -0400
X-MC-Unique: piCWPBEyNRuToDM-zWPhgA-1
Received: by mail-qk1-f199.google.com with SMTP id q143-20020a374395000000b0074690a17414so1422174qka.7
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679354606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpP2z7KdETtSjf5FRKQeOFJT3f2f22hqp1FLeOMOD9E=;
        b=3qZ30eNZV2hSU85z3eK2aF4LVugfG3cj5GERXPPxm/KXX0v44m6g/mQLAAF4gS5XB5
         WIE/t7waxtKoipJTUkrJ8akcTwnAjy4YXtEQNjMjfEL7wT3LHMcUc8I2ao/tlEBkMzOY
         fnoTmrDGra8ywQp6m5YEk9i95aKJc5byUgjnyC5mhzPGNIPRJir+QdGkR4gAgO+0hL9S
         PiWRyLcPSKEjFRIi/T+xPa9D++ZPBSH6wBtxafIY99GmAwnYGq2HU+Pq2+lOKtBFjkGZ
         6YhBAVqDD3w+DEgct6V7JcngozG97JKr0vjSQ/3RuyOTpskh2s8B85RpISdD2qnmzqKT
         iUZA==
X-Gm-Message-State: AO0yUKX9/sGvrMB3gimXMALRYfDOo+KlFQzUTxzbavQ0Yo5jM9Nrydff
	w5Zr5fmG6RKi7qzZMgIYhM/eJB9ARVq+gO4igYDTQilF5PeKaeJrm8mByayhaRevWYQ979N5Buh
	wBjWktLYe9FDfKg==
X-Received: by 2002:a05:6214:2a88:b0:56e:b1e0:3fef with SMTP id jr8-20020a0562142a8800b0056eb1e03fefmr1002391qvb.24.1679354605909;
        Mon, 20 Mar 2023 16:23:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8QOzhqOd7nFesFbCuOTTVxImRbs0jpuxacByG/oeEhIIMtdUjSbjovf3qvpuVqd45uRXJMxQ==
X-Received: by 2002:a05:6214:2a88:b0:56e:b1e0:3fef with SMTP id jr8-20020a0562142a8800b0056eb1e03fefmr1002373qvb.24.1679354605659;
        Mon, 20 Mar 2023 16:23:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q145-20020a374397000000b007429ee9482dsm8113502qka.134.2023.03.20.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:23:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chris.snook@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	yuanjilin@cdjrlc.com,
	liew.s.piaw@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: atheros: atl1c: remove unused atl1c_irq_reset function
Date: Mon, 20 Mar 2023 19:23:17 -0400
Message-Id: <20230320232317.1729464-1-trix@redhat.com>
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
drivers/net/ethernet/atheros/atl1c/atl1c_main.c:214:20: error:
  unused function 'atl1c_irq_reset' [-Werror,-Wunused-function]
static inline void atl1c_irq_reset(struct atl1c_adapter *adapter)
                   ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
index 40c781695d58..4a288799633f 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -207,16 +207,6 @@ static inline void atl1c_irq_disable(struct atl1c_adapter *adapter)
 	synchronize_irq(adapter->pdev->irq);
 }
 
-/**
- * atl1c_irq_reset - reset interrupt confiure on the NIC
- * @adapter: board private structure
- */
-static inline void atl1c_irq_reset(struct atl1c_adapter *adapter)
-{
-	atomic_set(&adapter->irq_sem, 1);
-	atl1c_irq_enable(adapter);
-}
-
 /*
  * atl1c_wait_until_idle - wait up to AT_HW_MAX_IDLE_DELAY reads
  * of the idle status register until the device is actually idle
-- 
2.27.0

