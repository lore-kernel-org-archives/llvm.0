Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63363C1
	for <llvm@lists.linux.dev>; Sat, 14 Jan 2023 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673705073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6F2gTFb1ZrF9f6ES4DXTz8rBxEV3JQ1L7+17Uewwhrc=;
	b=J7gZVmiP2NKjAR70PGndNFLVN3A+iTOsX+MIj6Tu+adrGn1c94gbmhW99F0UO7h6SDinKL
	IiKQVQPiuB1+roGfBnFGJ8T1XvfHIXapL22x1/oTCxwlv+qcObB6qc0x9fqNYYCya5FN8+
	mbrsa1Idv75E7/+rvHs0vBgmcQhigX8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-RiRX2Rl1Mo2e5wyrjVQHNg-1; Sat, 14 Jan 2023 09:04:30 -0500
X-MC-Unique: RiRX2Rl1Mo2e5wyrjVQHNg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-4c57d19de6fso230736677b3.20
        for <llvm@lists.linux.dev>; Sat, 14 Jan 2023 06:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F2gTFb1ZrF9f6ES4DXTz8rBxEV3JQ1L7+17Uewwhrc=;
        b=cXhXibfd2SFIHF1zppds3fIH4RCe3ZdieV7/AUecaQjmoRgNxifkFF6if0ebUys9up
         6nZxPrC6jzJ5ztJwLCleMUPPhstGurC7pHev1pMww1Vnsx7n7D2plhLOsKFtV9fu+8UJ
         oRLgvjQD5/pSe4qubcvxTfPV/AmVNbGmzZX+MAwJw6TzsoxYcp7Ceukx4CDXzpjDfMlO
         NhvwvjoAUeeOeAJqUJRA6Ryvqy1RBucVZ66X2gPpXNf2/ixYzh0J2r2g7KkIZu0SILsR
         634v4M4LadmWA3DSoht0WvM4AI+YyL8xCSTXGDu27Ix+A3frPUJxffcPwfSVXHFOUS3s
         xiNg==
X-Gm-Message-State: AFqh2kp2ZFqWWfv32iFaOMGdj5ybVKZZkuxDrB56jEM/n7NoivbJ1VvD
	DlsHJYPe3orcYiyvJRf//Xtt+SI9OpfGyPLoqXhMUbVA4QfydKKDT4xS4ghVJ4kt4q7IrQXdKKh
	i/i91yEMLDaliLA==
X-Received: by 2002:a05:7500:398d:b0:f1:c205:b468 with SMTP id lu13-20020a057500398d00b000f1c205b468mr303202gab.48.1673705069471;
        Sat, 14 Jan 2023 06:04:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVpjjeHbW3FsEjFjGQmccrBWIuIWhHpfGIsTLiovScnaV9wcQ0yrSXBbBjxnBKtOpqCbSnHw==
X-Received: by 2002:a05:7500:398d:b0:f1:c205:b468 with SMTP id lu13-20020a057500398d00b000f1c205b468mr303174gab.48.1673705069108;
        Sat, 14 Jan 2023 06:04:29 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id br43-20020a05620a462b00b006ec771d8f89sm14675789qkb.112.2023.01.14.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 06:04:28 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	vinicius.gomes@intel.com,
	jeffrey.t.kirsher@intel.com
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] igc: return an error if the mac type is unknown in igc_ptp_systim_to_hwtstamp()
Date: Sat, 14 Jan 2023 09:04:12 -0500
Message-Id: <20230114140412.3975245-1-trix@redhat.com>
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

clang static analysis reports
drivers/net/ethernet/intel/igc/igc_ptp.c:673:3: warning: The left operand of
  '+' is a garbage value [core.UndefinedBinaryOperatorResult]
   ktime_add_ns(shhwtstamps.hwtstamp, adjust);
   ^            ~~~~~~~~~~~~~~~~~~~~

igc_ptp_systim_to_hwtstamp() silently returns without setting the hwtstamp
if the mac type is unknown.  This should be treated as an error.

Fixes: 81b055205e8b ("igc: Add support for RX timestamping")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/intel/igc/igc_ptp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_ptp.c b/drivers/net/ethernet/intel/igc/igc_ptp.c
index c34734d432e0..4e10ced736db 100644
--- a/drivers/net/ethernet/intel/igc/igc_ptp.c
+++ b/drivers/net/ethernet/intel/igc/igc_ptp.c
@@ -417,10 +417,12 @@ static int igc_ptp_verify_pin(struct ptp_clock_info *ptp, unsigned int pin,
  *
  * We need to convert the system time value stored in the RX/TXSTMP registers
  * into a hwtstamp which can be used by the upper level timestamping functions.
+ *
+ * Returns 0 on success.
  **/
-static void igc_ptp_systim_to_hwtstamp(struct igc_adapter *adapter,
-				       struct skb_shared_hwtstamps *hwtstamps,
-				       u64 systim)
+static int igc_ptp_systim_to_hwtstamp(struct igc_adapter *adapter,
+				      struct skb_shared_hwtstamps *hwtstamps,
+				      u64 systim)
 {
 	switch (adapter->hw.mac.type) {
 	case igc_i225:
@@ -430,8 +432,9 @@ static void igc_ptp_systim_to_hwtstamp(struct igc_adapter *adapter,
 						systim & 0xFFFFFFFF);
 		break;
 	default:
-		break;
+		return -EINVAL;
 	}
+	return 0;
 }
 
 /**
@@ -652,7 +655,8 @@ static void igc_ptp_tx_hwtstamp(struct igc_adapter *adapter)
 
 	regval = rd32(IGC_TXSTMPL);
 	regval |= (u64)rd32(IGC_TXSTMPH) << 32;
-	igc_ptp_systim_to_hwtstamp(adapter, &shhwtstamps, regval);
+	if (igc_ptp_systim_to_hwtstamp(adapter, &shhwtstamps, regval))
+		return;
 
 	switch (adapter->link_speed) {
 	case SPEED_10:
-- 
2.27.0

