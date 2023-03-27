Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454C33C0
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679929919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DYh+IUQKnsNavgY4j1iAAQrUA1J5asaTGD0FKGxhaXM=;
	b=TXujnrP4HA04vJM7HwEzDd14afITPVEc2txIuuG8Y6FOXa1sQW/VFXq2KJfBiMvQfIxR2k
	XcHjIqrEIhD1IhZD+dLKu2HmGse5T7uCp/hWm+vMNbg6qb4psjqGCo19j6UPZjo7MWHYua
	/8cUuaNA0Cib/SjgpYI82dzNvfNnugo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-xjnkS5XYPwaSew-lLOXTbQ-1; Mon, 27 Mar 2023 11:11:56 -0400
X-MC-Unique: xjnkS5XYPwaSew-lLOXTbQ-1
Received: by mail-qv1-f70.google.com with SMTP id pr2-20020a056214140200b005b3ed9328a3so3664939qvb.10
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 08:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679929915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYh+IUQKnsNavgY4j1iAAQrUA1J5asaTGD0FKGxhaXM=;
        b=T3pgIQNp0+Iq3cXFVrVV3oYG7sJdfbhBIcvRBVk+/yhjcmmPD6yP3eHUOc8KZiKPhB
         /oF7ErGt8OggEOGNDx0XwFUsIyCtZRL/oyEIK6+gnSVBiM1Bc7rfuHtAR/sG3yOSxwaO
         fFwfMwsA2fmuFgs+Q07xhBO3G9tULzbPXrFf90WsQBzVBpQ43AIqD4gss4cwMjoVCtl7
         14QbqUFC/tAF8CjYXGC7J+ftEV0XLreHqaGRDFFIwVJq6Y7oA/QxvRxw3GvnWqMoRWn1
         4ufwdC79+Vjy95AZz3YecylU1V7zJdA/j6MGVu4dKr6bDR5wfwShBxIoPMjgDdUdbYDS
         9I3w==
X-Gm-Message-State: AO0yUKVhX6Xq5ZRSOPCd/+0g8UXZkUFbyHqUUpvvFns+xqR655iGlVlo
	ikLiLHxmac52H5GlG/SbTXj2eJ4KpDTPEYvYWzv3abdhVXMg5i1CT+/5kZSea20GfJ8OnKTxuJm
	7ORoyfkUw+zE84g==
X-Received: by 2002:ac8:57c2:0:b0:3e1:6c7e:2ee0 with SMTP id w2-20020ac857c2000000b003e16c7e2ee0mr22110166qta.11.1679929915678;
        Mon, 27 Mar 2023 08:11:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set9BAzNnvmMx3UPAztYRtfcEZS/JC0Zbgk59lkyKNRW1O3h/77E7anPa59QcSLU+bg9VrGKy2w==
X-Received: by 2002:ac8:57c2:0:b0:3e1:6c7e:2ee0 with SMTP id w2-20020ac857c2000000b003e16c7e2ee0mr22110133qta.11.1679929915395;
        Mon, 27 Mar 2023 08:11:55 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l6-20020ac848c6000000b003bfb0ea8094sm8328255qtr.83.2023.03.27.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:11:55 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: aspriel@gmail.com,
	franky.lin@broadcom.com,
	hante.meuleman@broadcom.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] brcmsmac: ampdu: remove unused suc_mpdu variable
Date: Mon, 27 Mar 2023 11:11:51 -0400
Message-Id: <20230327151151.1771350-1-trix@redhat.com>
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
drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c:848:5: error: variable
  'suc_mpdu' set but not used [-Werror,-Wunused-but-set-variable]
        u8 suc_mpdu = 0, tot_mpdu = 0;
           ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index 2631eb7569eb..e24228e60027 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -845,7 +845,7 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 	u16 seq, start_seq = 0, bindex, index, mcl;
 	u8 mcs = 0;
 	bool ba_recd = false, ack_recd = false;
-	u8 suc_mpdu = 0, tot_mpdu = 0;
+	u8 tot_mpdu = 0;
 	uint supr_status;
 	bool retry = true;
 	u16 mimoantsel = 0;
@@ -975,7 +975,6 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 				ieee80211_tx_status_irqsafe(wlc->pub->ieee_hw,
 							    p);
 				ack_recd = true;
-				suc_mpdu++;
 			}
 		}
 		/* either retransmit or send bar if ack not recd */
-- 
2.27.0

