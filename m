Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEE18D
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679789859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D61zQjRsLuXz/56PVuTWbWV80IKbwWyVMu0ddKqCreo=;
	b=en8qmZDDFgEIc/mNpGPRh2TP1eKYNxYNaGysnrhGUZ/IPA4JPOkWJW5rcVxYiTEIi7QKnj
	VbSQGISPonK6urCvPPo7qGMDvjcvLn/uhb5aT8GN5c/67MElSHM+QQVqx1MZ8VlRhVCIbj
	Dq3NDHz+/fXhw6h77eoa2UkMbY/0RTw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-3ZGbjPNDNU22ZoVHb07KqA-1; Sat, 25 Mar 2023 20:17:38 -0400
X-MC-Unique: 3ZGbjPNDNU22ZoVHb07KqA-1
Received: by mail-qt1-f199.google.com with SMTP id w13-20020ac857cd000000b003e37d3e6de2so3465047qta.16
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 17:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679789858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D61zQjRsLuXz/56PVuTWbWV80IKbwWyVMu0ddKqCreo=;
        b=c21/Av07gZufOcmtVF/Zhvsripe6MVm6LOVKXqhzuAdCwNslgYn9Tz+yg+mbNFTbvS
         nkhNN4Bl8auC0yp9TQhnVVpr5Qt6gtKJGzHai5/GkREt4ThB+I2D+5GrgJPiQWYMRfwY
         C7zZYikEEFFawOX2gOLBfFJzNMDRNs8siJClK+fPeZQEq86Xz8DA9kR9JeZ92t+enlpe
         T2I/Sz+e6rDWEFoATT0Uq6Zmnit/yGOJLbKWmqiLMW2MOBc2tgqAK47a8xUQIcbLlMMI
         VRfx2r7UARd5mqwhgVzDIfGTymIBrw8n9CbgzvA2KsK381SlRffYRZI7bzlFsHzjsiX2
         eZQw==
X-Gm-Message-State: AAQBX9cQ15qeNg0pJULdiX8OQzO96NahYnDfJjPoZekHvREmKmWvyHuN
	mpc6eZQv8J/RW+g+1sFAM6ZkRu19BwOsFcNf2eQa8b/iFCavDEuzQ24NFlaw6Yt7X3nreNdB3hT
	Wji8xmtzr7HNtMw==
X-Received: by 2002:a05:6214:2506:b0:5a5:d286:c706 with SMTP id gf6-20020a056214250600b005a5d286c706mr15063793qvb.17.1679789857890;
        Sat, 25 Mar 2023 17:17:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZugfWYhwn2fNmL9rQUMhOV2wtNFMMLNcZ9o3qv7OoE+LRL/5md/0aJyAMSsIMeQNzQQ+l9MA==
X-Received: by 2002:a05:6214:2506:b0:5a5:d286:c706 with SMTP id gf6-20020a056214250600b005a5d286c706mr15063781qvb.17.1679789857620;
        Sat, 25 Mar 2023 17:17:37 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 204-20020a3708d5000000b007485a383921sm528719qki.116.2023.03.25.17.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:17:37 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: aelior@marvell.com,
	manishc@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] qed: remove unused num_ooo_add_to_peninsula variable
Date: Sat, 25 Mar 2023 20:17:33 -0400
Message-Id: <20230326001733.1343274-1-trix@redhat.com>
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
drivers/net/ethernet/qlogic/qed/qed_ll2.c:649:6: error: variable
  'num_ooo_add_to_peninsula' set but not used [-Werror,-Wunused-but-set-variable]
        u32 num_ooo_add_to_peninsula = 0, cid;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/qlogic/qed/qed_ll2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
index e5116a86cfbc..717a0b3f89bd 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
@@ -646,13 +646,13 @@ static int qed_ll2_lb_rxq_handler(struct qed_hwfn *p_hwfn,
 	struct qed_ll2_rx_queue *p_rx = &p_ll2_conn->rx_queue;
 	u16 packet_length = 0, parse_flags = 0, vlan = 0;
 	struct qed_ll2_rx_packet *p_pkt = NULL;
-	u32 num_ooo_add_to_peninsula = 0, cid;
 	union core_rx_cqe_union *cqe = NULL;
 	u16 cq_new_idx = 0, cq_old_idx = 0;
 	struct qed_ooo_buffer *p_buffer;
 	struct ooo_opaque *ooo_opq;
 	u8 placement_offset = 0;
 	u8 cqe_type;
+	u32 cid;
 
 	cq_new_idx = le16_to_cpu(*p_rx->p_fw_cons);
 	cq_old_idx = qed_chain_get_cons_idx(&p_rx->rcq_chain);
@@ -762,7 +762,6 @@ static int qed_ll2_lb_rxq_handler(struct qed_hwfn *p_hwfn,
 						   cid, ooo_opq->ooo_isle);
 				break;
 			case TCP_EVENT_ADD_PEN:
-				num_ooo_add_to_peninsula++;
 				qed_ooo_put_ready_buffer(p_hwfn,
 							 p_hwfn->p_ooo_info,
 							 p_buffer, true);
-- 
2.27.0

