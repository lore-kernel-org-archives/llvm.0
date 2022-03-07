Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A63B53
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 15:30:50 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id p9so23892303wra.12
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VEUtjRWw8hcXPx8ISHtvMs+ktqj0awQxQ1FmrJuTsp0=;
        b=MNpHF7Pxg9BKJiM7fXtwr+H0qiQHTO5YaiWRpoj8JeGPvWbNy27/PM68jvK4QSBRoS
         eJV84YLL7LY0Kx+2dttq4o8BSGVJnTkTkSVrSQ6jqym1hnTU/KN1tiaQ4HT3YxHnGaep
         l/BgDYpY9h1dRuCJcH3/sPXiySIO+U6vefOR+F4+6/wYeky7WPYEoZhJjDMIx0OvJUnr
         rJpIGYuHLOeHT93rWf+ikiIQTOzZMcEJeJjTV+qPGfz/r4iAqH5VCVB98b/FMsXQJZQT
         bPAklAmCoO81z7iPKi3IVku0QUFChskh487B2KlaehvDU0EI0uy5Gq33vkGC5FnOYU2C
         YW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VEUtjRWw8hcXPx8ISHtvMs+ktqj0awQxQ1FmrJuTsp0=;
        b=44LYdlNAVqZ6IG1dIlU/2zCo7SMBiZ84tnjHht7YY2/IPbzuPh0j4Wf4XlLVlfQRKr
         sdV5gl0lJb6vJFaojBvRXbtVfuw02PRF/fFxBcy/lHommv48CxL0lzZlH4On4sNFr0tk
         pCfAn+EC0H3ELTuYevlT7C29zTGrTtrBgupSY7HwkdKhZdejW9aolDukoeKLO329mAWp
         Uj16YdtgJD6KRq1GR/D3qgPmSI1CmbXEfyR5ObNrY5eCqHOFOWh+WwcK9WcAI8bnNrbG
         cChipfVUqhzPhWvTY0EZMkFuLumNZSnDHi/PjmbJaVziUpkfV8AAOmnqrHUEimCIXlmi
         sLEg==
X-Gm-Message-State: AOAM531uO3v3j2O3EaNbIDiR8WqKRfLzLIjO1yW0BKgKCBbtpuHF5UqK
	azGxMCfCTr+kZkT3tKOB1As=
X-Google-Smtp-Source: ABdhPJybfHSo0eCkjaEOHXAgaY8b9TUr8U9Fg4tG5GiMhl+kF2PHHrRNJApWZg0ccl+N6LMTkzuvSA==
X-Received: by 2002:a5d:64ac:0:b0:1e7:1415:2548 with SMTP id m12-20020a5d64ac000000b001e714152548mr8834834wrp.267.1646667048657;
        Mon, 07 Mar 2022 07:30:48 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c4f4d00b00386744cb31bsm15673525wmq.35.2022.03.07.07.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:30:48 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] tty: serial: jsm: remove redundant assignments to variable linestatus
Date: Mon,  7 Mar 2022 15:30:47 +0000
Message-Id: <20220307153047.139639-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable linestatus is being assigned values that are never read, the
assignments are redundant and can be removed.

Cleans up clang scan warnings:
drivers/tty/serial/jsm/jsm_cls.c:369:2: warning: Value stored to
'linestatus' is never read [deadcode.DeadStores]
drivers/tty/serial/jsm/jsm_cls.c:400:4: warning: Value stored to
'linestatus' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/tty/serial/jsm/jsm_cls.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/jsm/jsm_cls.c b/drivers/tty/serial/jsm/jsm_cls.c
index b280da50290c..444f233ebd1f 100644
--- a/drivers/tty/serial/jsm/jsm_cls.c
+++ b/drivers/tty/serial/jsm/jsm_cls.c
@@ -350,7 +350,7 @@ static void cls_assert_modem_signals(struct jsm_channel *ch)
 static void cls_copy_data_from_uart_to_queue(struct jsm_channel *ch)
 {
 	int qleft = 0;
-	u8 linestatus = 0;
+	u8 linestatus;
 	u8 error_mask = 0;
 	u16 head;
 	u16 tail;
@@ -365,8 +365,6 @@ static void cls_copy_data_from_uart_to_queue(struct jsm_channel *ch)
 	head = ch->ch_r_head & RQUEUEMASK;
 	tail = ch->ch_r_tail & RQUEUEMASK;
 
-	/* Get our cached LSR */
-	linestatus = ch->ch_cached_lsr;
 	ch->ch_cached_lsr = 0;
 
 	/* Store how much space we have left in the queue */
-- 
2.35.1

