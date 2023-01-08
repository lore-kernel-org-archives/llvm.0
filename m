Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C601110
	for <llvm@lists.linux.dev>; Sun,  8 Jan 2023 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673188736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8nmF6yGQPc7csrjOj7kKwdzfOlPcQjGza6hQEjZq+L8=;
	b=NHNU3C786N0Nnfue3xk791VhRTah0xKSXiJNe+3988I1Kn2FBOzYRXVZEbOuMgis6UxZBJ
	iMZmIyH+WQQCRbl+LIUaTdC83Os4ygQXvWV2lJX7sNzUZ93tSBhChfbQDZq7M19I05qoBv
	qPRU214ErOQF+OzVtv8M+IGooQVH7uc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-aE-nhnRVPkqolpggDi-M4w-1; Sun, 08 Jan 2023 09:38:54 -0500
X-MC-Unique: aE-nhnRVPkqolpggDi-M4w-1
Received: by mail-qv1-f71.google.com with SMTP id qf9-20020a0562144b8900b004c71efc3528so3901654qvb.22
        for <llvm@lists.linux.dev>; Sun, 08 Jan 2023 06:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nmF6yGQPc7csrjOj7kKwdzfOlPcQjGza6hQEjZq+L8=;
        b=FmhCN0mZ3U0OmmTScAciWU+RRwCWtUS158wqk3Ed7EmwT6d71Q4O1/KPxgriqnK4YC
         Kz/z0Ng1UmNA1aS6/aJ6sAo75i0XARYaUoiIqts6lCeivSQVD1S1xt8oIwTe4HaPQ7Pl
         ZsQzuwey4cYtNAjMF/xmuxh/8+ciyz0efEkXGLMU97Ls0i801HmK2d1R052K0QK8Roq+
         GGE3GRVMo274ypWp9jX9C1whrwO35cLC4y8WeJ2UrgXMluYt7qeNdJHk03LVNUgkpjLU
         zkGmYY86OS/mYRNzZy8DUSXBdQY3L466fv/2tZxZK4ZAIsvPNDyewc91QIqjrF4vbZAf
         HPFA==
X-Gm-Message-State: AFqh2kqr8oA41zJjVJK1bh3x/VFgS3GVUgM7GmGch2+KrbZW/YOR01Pb
	FsoQIfJAplwIrxbhu7dJvMfmJyp3nahcNifu3f8putYnx2SdKTEOQQFIH69o13s6yy/q6x3wOQY
	jC1DRJYmFMu6Jzg==
X-Received: by 2002:a05:622a:181e:b0:3a5:ed7:1644 with SMTP id t30-20020a05622a181e00b003a50ed71644mr114338864qtc.45.1673188734222;
        Sun, 08 Jan 2023 06:38:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKAHGfagVXu0UGthHdTUi8lf8mpUA43lYoZ63p/qHcdByb7YZnxyYzllZilXvP41HZfOJ4Yw==
X-Received: by 2002:a05:622a:181e:b0:3a5:ed7:1644 with SMTP id t30-20020a05622a181e00b003a50ed71644mr114338832qtc.45.1673188734004;
        Sun, 08 Jan 2023 06:38:54 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y4-20020ac87c84000000b0039a55f78792sm3273434qtv.89.2023.01.08.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 06:38:53 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: shayagr@amazon.com,
	akiyano@amazon.com,
	darinzon@amazon.com,
	ndagan@amazon.com,
	saeedb@amazon.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	khalasa@piap.pl,
	wsa+renesas@sang-engineering.com,
	yuancan@huawei.com,
	tglx@linutronix.de,
	42.hyeyoo@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ena: initialize dim_sample
Date: Sun,  8 Jan 2023 09:38:43 -0500
Message-Id: <20230108143843.2987732-1-trix@redhat.com>
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

clang static analysis reports this problem
drivers/net/ethernet/amazon/ena/ena_netdev.c:1821:2: warning: Passed-by-value struct
  argument contains uninitialized data (e.g., field: 'comp_ctr') [core.CallAndMessage]
        net_dim(&ena_napi->dim, dim_sample);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

net_dim can call dim_calc_stats() which uses the comp_ctr element,
so it must be initialized.

Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index e8ad5ea31aff..938184465eae 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -1805,7 +1805,7 @@ static void ena_dim_work(struct work_struct *w)
 
 static void ena_adjust_adaptive_rx_intr_moderation(struct ena_napi *ena_napi)
 {
-	struct dim_sample dim_sample;
+	struct dim_sample dim_sample = {};
 	struct ena_ring *rx_ring = ena_napi->rx_ring;
 
 	if (!rx_ring->per_napi_packets)
-- 
2.27.0

