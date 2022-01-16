Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5D29CA
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642344140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JRRT3Yl7+f6HbkWI411SEh1HSKqxqkLW8Pqe76fS2Gs=;
	b=GYVaEORPoj4xfQLYpQ4LmA2LMuF5XL4Akp4Zjt1c33KcfgSHazB3pZJeqBh022xm+pSAti
	E5fpdTMceC9Z9cgEYiz9JiK/6VxYGjDsBGrBu3a79lc9673dKhS8RyoSbfoElzGpJAUKtS
	17XjXjb3QDXiNKAA5HmDGxMS7jLTYZc=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-sx5JSZ3sP0OBA8seJTfNpQ-1; Sun, 16 Jan 2022 09:42:17 -0500
X-MC-Unique: sx5JSZ3sP0OBA8seJTfNpQ-1
Received: by mail-ot1-f71.google.com with SMTP id j17-20020a9d7391000000b00591da2aff7bso4347319otk.8
        for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 06:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JRRT3Yl7+f6HbkWI411SEh1HSKqxqkLW8Pqe76fS2Gs=;
        b=V2sBLy6pizmeC+fWwTXk0n3X8mALUm1pYknK86oZUbhnADODXS27OGqzAcVFpFPdWX
         +4ColWlS+zyLXjLHNXT7wuGXO0Tqe6l08G/I66k2R+KTj5/rMQcKfoB5yNenEusiBpIq
         JJW2wDgWtTMNoGMXadUmAckzOMj7IgDx9wZ6XRvTgsDXLTU8Mlb6yh+Vlcz4a3TEwnnm
         SgbKbo+5AZ8i387jEz2N8miMHTDfYlfaae1ygcQ+9QXybAb7kjLetv2QlVXrg6g//SrM
         peoJk7ATb6eEm2i4MkZBzyKYRtzYlkHB1jay6wHorKJpDN4/UcpS1xJUHQeLyCbfgG/J
         xwYg==
X-Gm-Message-State: AOAM531nqy4aA8rvHXaUNyGzBI2W4+vgmKveeG9k7fC2ySy6HQg7lIHZ
	rKvtcNOjeiBPxItGkSLX6z807dXAw+3ROpPILuSix4pcPVU140caTEnfVR1c6r6dDKmk7AukqPQ
	/0fej6KR3Z91YgQ==
X-Received: by 2002:aca:1c16:: with SMTP id c22mr4588775oic.83.1642344136553;
        Sun, 16 Jan 2022 06:42:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrmwZp7l+rQuzj7d+eeD89HQdHOy2AEvZ4lDFXM1Xjeb9/2maMuS4teFTtAREUYd6VJgPcwQ==
X-Received: by 2002:aca:1c16:: with SMTP id c22mr4588753oic.83.1642344136355;
        Sun, 16 Jan 2022 06:42:16 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b22sm2168045otl.24.2022.01.16.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 06:42:15 -0800 (PST)
From: trix@redhat.com
To: kvalo@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	akolli@codeaurora.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ath11k: fix error handling in ath11k_qmi_assign_target_mem_chunk()
Date: Sun, 16 Jan 2022 06:42:06 -0800
Message-Id: <20220116144206.399385-1-trix@redhat.com>
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
qmi.c:1935:5: warning: Undefined or garbage value returned to caller
  return ret;
  ^~~~~~~~~~

ret is uninitialized.  When of_parse_phandle() fails, garbage is
returned.  So return -EINVAL.

Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 65d3c6ba35ae6..81b2304b1fdeb 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1932,7 +1932,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			if (!hremote_node) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "qmi fail to get hremote_node\n");
-				return ret;
+				return -EINVAL;
 			}
 
 			ret = of_address_to_resource(hremote_node, 0, &res);
-- 
2.26.3

