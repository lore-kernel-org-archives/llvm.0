Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3415AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 00:50:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o7-20020a05600c4fc700b0038c87edc21eso347763wmq.0
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 17:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pMEbKBsMpapDd8TCjE4RHFawECGaW/7eNS3lLK39RM=;
        b=nurmfdO1iMIrBTlsO7SIBEuIZr5DueNEiSytzbs9NuL2KOS/DHR/ihWYxPNIKIvIos
         qE2q38W5m0BtJEBxcRlYheiXOLooMSQf3rokqWtNO0i6qVOpzfADGXKZBGPZySVHe3xP
         Os+26lqEw08MMVC4YINaAGUl0uGzucz7Wv1/MCy7vztqDnrqsPSVcHjEeVNpZoXZosEE
         JO4gQ2RBB9Y+gIvpzQkIhFQ9T1ar5IgFM1rwDrPwR7PUE2cmGK91R6rK/Z3DNR4i0eLn
         mmlgroZmqLPbYTueAZnwLINL5LYxYwTYE94eBxiT7Vz1fP6DMhAwsxFirkXj8IrsEHaR
         zLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pMEbKBsMpapDd8TCjE4RHFawECGaW/7eNS3lLK39RM=;
        b=NXUVBNBtRJ0jCFmRrqG27oaoR1BQBx7n1oSbQn79F6P2vwijhSijGZyLaMbeZMYkbp
         ajSzaHwGgbHRiYiL/kcDHypI6rd1D6JQahrBxH+8PJzz7Hj+e+p7LiC+L/ymjqHVoS5s
         S0OJUVNATnlM0H9zah9EuIybTvgZIxtNXD2EUo0lIqH2ex2Gn22zyb1I/p9NqNae6DbB
         FMvSohvajO9O4kTBuGozoSoig/SuORslJ2CERSh+vnCPjX/HgS3ozAL7xxNe48uGR/aX
         ZHYIsReo5Z35c6xRxsMzIh2aJB/fg660Bugneyz8I3buxyd8Wp2ArJ9eavC22oulp0pY
         b2Pg==
X-Gm-Message-State: AOAM531RmO4APr2P1xWFamdBa7EdYj8AIDje318I11i74dAQMzkmhQOT
	oYhtffXXJuM/1kuUqVKpnUU=
X-Google-Smtp-Source: ABdhPJxlOL4MExEm3h26Y4McVA9a+lQbSOcpch5+/PntdcTOqCOFkKirk/UG1u3K3uaNw444o89q6g==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id c11-20020a05600c0a4b00b0037bea2b5583mr14211291wmq.139.1647564625886;
        Thu, 17 Mar 2022 17:50:25 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n65-20020a1c2744000000b003862bfb509bsm9483720wmn.46.2022.03.17.17.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 17:50:25 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chris Snook <chris.snook@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Gatis Peisenieks <gatis@mikrotik.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] atl1c: remove redundant assignment to variable size
Date: Fri, 18 Mar 2022 00:50:21 +0000
Message-Id: <20220318005021.82073-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable sie is being assigned a value that is never read. The
The assignment is redundant and can be removed.

Cleans up clang scan build warning:
drivers/net/ethernet/atheros/atl1c/atl1c_main.c:1054:22: warning:
Although the value stored to 'size' is used in the enclosing
expression, the value is never actually read from 'size'
[deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
index f50604f3e541..49459397993e 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -1051,7 +1051,7 @@ static int atl1c_setup_ring_resources(struct atl1c_adapter *adapter)
 	 * each ring/block may need up to 8 bytes for alignment, hence the
 	 * additional bytes tacked onto the end.
 	 */
-	ring_header->size = size =
+	ring_header->size =
 		sizeof(struct atl1c_tpd_desc) * tpd_ring->count * tqc +
 		sizeof(struct atl1c_rx_free_desc) * rfd_ring->count * rqc +
 		sizeof(struct atl1c_recv_ret_status) * rfd_ring->count * rqc +
-- 
2.35.1

