Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708D173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641652406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OTEoDAXesUBrrz0y7VX933AG7BpNKcC+21DOjfav4eQ=;
	b=D8gXXWgNZ9DXSTSo8jnij07qMUPZo2/0FiqVRLFwDwkykv+EEA/7U34K4Kp1UW0P+yFI6/
	9EBB53xD436eSkw3uJf16DajLWoZcLja3tCaRtVCwtQKJWglccmMO5QBqR5phGFh/JqQWt
	WedKsW8qkgYNw8hTNW+cHioaY8F3/u8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-ch4ogGsYO9G5f81J_jYtrA-1; Sat, 08 Jan 2022 09:33:25 -0500
X-MC-Unique: ch4ogGsYO9G5f81J_jYtrA-1
Received: by mail-oo1-f69.google.com with SMTP id v30-20020a4a9761000000b002daad3afaf6so5980540ooi.18
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 06:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTEoDAXesUBrrz0y7VX933AG7BpNKcC+21DOjfav4eQ=;
        b=KPOLCMQhTwoRZP3bvoLrT48aptPQVJPwBV2EG6tXYoRXSZb+EeQgbwT9voJnvXMnMS
         6O9sOKQ91zf+7scwp5osJGN5FedZEnEOOkhJ5S1X8+kJdQ9nVYfQ6ApQZVoayaKnvvGn
         U1Ol9oOshEGg8REFhpLwWePLjO0t4k/ZjlztSXJJ5HasgPW0QHJ9WFGglBLo3MiqwU2J
         U1PIziNKo4X+Tk2SSN4Dwq5+zJfx/ruJj55YjvWPNf+RitH/duCUTHz6kZXfTDxDWOwB
         scBcD4iwlNaO34zaCdLw1avpBbDmyaU2ryUfybL0LrS2qxCHS6hE2ND7Q3gSPbvuSST6
         7kXw==
X-Gm-Message-State: AOAM530p5oxA1UWoJNvFwg7PTgl6YJQRi2v9yJWh4H1S9J5q+TFqSP3Z
	FecL0j2t2RJq7HqdI4UAnil3nrMUGE1EbAIsMCrGOvfsyHfcOa1sK+auOHYfEuro12gDCwUHD2y
	PQdTVoZq4FIoeiw==
X-Received: by 2002:a9d:d68:: with SMTP id 95mr46520900oti.188.1641652404373;
        Sat, 08 Jan 2022 06:33:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrzTGEeaVMK49HTR2/2D3npJiXwy7xQHcIPlSumyPxfb0SUfpPiLi4GiaG2GrUwzY6o8mW7Q==
X-Received: by 2002:a9d:d68:: with SMTP id 95mr46520883oti.188.1641652404104;
        Sat, 08 Jan 2022 06:33:24 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r37sm353568otv.54.2022.01.08.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 06:33:23 -0800 (PST)
From: trix@redhat.com
To: wg@grandegger.com,
	mkl@pengutronix.de,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	mailhol.vincent@wanadoo.fr,
	stefan.maetje@esd.eu
Cc: linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] can: janz-ican3: initialize dlc variable
Date: Sat,  8 Jan 2022 06:33:19 -0800
Message-Id: <20220108143319.3986923-1-trix@redhat.com>
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

Clang static analysis reports this problem
janz-ican3.c:1311:2: warning: Undefined or garbage value returned to caller
        return dlc;
        ^~~~~~~~~~

dlc is only set with this conditional
	if (!(cf->can_id & CAN_RTR_FLAG))
		dlc = cf->len;

But is always returned.  So initialize dlc to 0.

Fixes: cc4b08c31b5c ("can: do not increase tx_bytes statistics for RTR frames")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/can/janz-ican3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/janz-ican3.c b/drivers/net/can/janz-ican3.c
index 5b677af5f2a41..808c105cf8f7e 100644
--- a/drivers/net/can/janz-ican3.c
+++ b/drivers/net/can/janz-ican3.c
@@ -1285,7 +1285,7 @@ static unsigned int ican3_get_echo_skb(struct ican3_dev *mod)
 {
 	struct sk_buff *skb = skb_dequeue(&mod->echoq);
 	struct can_frame *cf;
-	u8 dlc;
+	u8 dlc = 0;
 
 	/* this should never trigger unless there is a driver bug */
 	if (!skb) {
-- 
2.26.3

