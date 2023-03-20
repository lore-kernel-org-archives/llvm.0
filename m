Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654B882D
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679355294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eLRNau9yfu5hUtNACbqD47eGjINw3xSx6xkN8nR2nXo=;
	b=i38zbbJ1FZtEZRjt/u2z4lGU1hicprghMRDMsxRaHgEYSpTRR/wSZpir3eNsj7Uv652rKl
	uojjlVDQrsNylQi1TmrZhsWuQFImPZsbDJSTGlYd+AFcvczF+3X4OS7iNi4TqeMkw2LIxB
	mrjuVtlxfINBVN5N9gHLg/d50pUnmC4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-ffUSrpCZOiWL6b5eXML-9w-1; Mon, 20 Mar 2023 19:34:52 -0400
X-MC-Unique: ffUSrpCZOiWL6b5eXML-9w-1
Received: by mail-qv1-f70.google.com with SMTP id z14-20020a0cd78e000000b005adc8684170so6836790qvi.3
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLRNau9yfu5hUtNACbqD47eGjINw3xSx6xkN8nR2nXo=;
        b=Lvby7yi+hdV/Fwab2I9eZxfuDCn4GOT2QYvryI4KF23hWI1IOIryNYMobITHg4uI2I
         7bRyKtA77L4jbbe5mkMaFmpUti4uysUOTHvVtsDJIUOFBqisaXAyb2dInzA2Il1ADQMV
         vgM4/52uFCsi1WPK+gOaakbjihOyAQ1YzaPeGVj/JrM0TDbcPoKJ8QjlTNLB+y2Nrajw
         Y/Yffsd49Jmdsg/9iiW9/IxDpxKSI61sjwmQ05qfKFp/KUz5KgAnzEQ0pGoM9rO4TV/w
         DxMKtryoSiNuKJujhrE8njywQMc22LyDavemlmELQaIZs43qS61KO/RhDckZHlSsuVSW
         BsMQ==
X-Gm-Message-State: AO0yUKUWx7oXuKp/NxoGZOPs3nYdrtHM4KxSoGGmhKzIq7EgHZc5V3Cc
	cx1jmDWxtzV8PyIPHcsiPDtBinEjqGC5EZ15VqWAtHbnyLHrtQVYHhtZgKTl9Dn9SLkXOS23MiT
	ibyHtS7Dt19p5qw==
X-Received: by 2002:ac8:590d:0:b0:3bf:c407:10c6 with SMTP id 13-20020ac8590d000000b003bfc40710c6mr1680925qty.13.1679355292034;
        Mon, 20 Mar 2023 16:34:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set/MSGMYSq3HoZIhVmyS6T1eXwZz2enrFbuKq9nPI2QR/JAsY9RsSg0g8FFAWo/GPQAdeced0g==
X-Received: by 2002:ac8:590d:0:b0:3bf:c407:10c6 with SMTP id 13-20020ac8590d000000b003bfc40710c6mr1680898qty.13.1679355291794;
        Mon, 20 Mar 2023 16:34:51 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 5-20020a370b05000000b0071eddd3bebbsm8312839qkl.81.2023.03.20.16.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:34:51 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: tony0620emma@gmail.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] wifi: rtw88: remove unused rtw_pci_get_tx_desc function
Date: Mon, 20 Mar 2023 19:34:48 -0400
Message-Id: <20230320233448.1729899-1-trix@redhat.com>
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
drivers/net/wireless/realtek/rtw88/pci.c:92:21: error:
  unused function 'rtw_pci_get_tx_desc' [-Werror,-Wunused-function]
static inline void *rtw_pci_get_tx_desc(struct rtw_pci_tx_ring *tx_ring, u8 idx)
                    ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index b4bd831c9845..6a8e6ee82069 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -89,13 +89,6 @@ static void rtw_pci_write32(struct rtw_dev *rtwdev, u32 addr, u32 val)
 	writel(val, rtwpci->mmap + addr);
 }
 
-static inline void *rtw_pci_get_tx_desc(struct rtw_pci_tx_ring *tx_ring, u8 idx)
-{
-	int offset = tx_ring->r.desc_size * idx;
-
-	return tx_ring->r.head + offset;
-}
-
 static void rtw_pci_free_tx_ring_skbs(struct rtw_dev *rtwdev,
 				      struct rtw_pci_tx_ring *tx_ring)
 {
-- 
2.27.0

