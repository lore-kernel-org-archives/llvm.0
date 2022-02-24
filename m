Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A111373
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 22:15:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so1718170wrg.10
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23uPqqlxtmnZRHLs9v3vgksA5KeOpFw/ThnhTpkf+2w=;
        b=S6nCprqxh0JglbBAqwKJDoHoVIjtj4T6nsOoxoor9OqZxzcWSmesnc8rh8G+UcJWwk
         mc13iC3iU8uKZp4mj0CgARdJtp+90Ud9bgn5xxixO3CyqpAeGCn0AN3oF1cX3oJB8QHI
         8UDrUzs36GYtOFY6uAjLWQanpjCWTIYlFlqjK+5LUI+xyxfWFQ6tVS0z0hiVKS+6d/0p
         uDzEg8pnt+wxr4pKPMoXM/zFFnEQk9VlaKv2+C5Vd2mQ7edNv+t4RTkX4Sr9Xtq8hNMz
         ujeMJtqjfqPyaAiw66xkhG8E57AyVTyOdWffuxDtoxuEQE1wiizAlDyCwHPUFQtj1pHX
         q82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23uPqqlxtmnZRHLs9v3vgksA5KeOpFw/ThnhTpkf+2w=;
        b=3JDDlg95htH1mkBBx9Ae80asvqvT+8/IW7vFL+y6MHkEin1AkOt96wjlHch3p77Xri
         SLVUb2u6OTsIfVc8tr1yUkl8riw/zqoKYiLKee2wHcbEhwBZ0WdK41eP07HwIh/jqS8C
         emSSLJwuIsVUAxFHyKFzx5XlVa8CvNT4pnSECUQKxoQDr5DOnqQQOm3Su5+3J53eQg6Q
         yn19gjrN9CN04sVBnceoqOMAhAi7oOQqBhXbFp5O6JYOttQZEfoR7HDY3yAMrFzbjPTq
         N6ti3c9aiJbYm7HNBQQ1b7VRuPXKex5FgqRCQw+dmFqw/Wqsd9yMnCzkrz3RVAXmoUGr
         OiDg==
X-Gm-Message-State: AOAM530yDId95hUhYbRBJBpWj5DrOPKNvEGTlYoOUdzPx3yUSuewlUVo
	mFdeOBZZ5Nbo1DlDCR7C+Ec=
X-Google-Smtp-Source: ABdhPJwAm/jUbae804Iirsh2TE+k/iRCYA06xF1rFmTlmPTvYCNCE4wR20beM9tBYDQ6CUCuGmHO7g==
X-Received: by 2002:a05:6000:1789:b0:1ea:7bb7:312c with SMTP id e9-20020a056000178900b001ea7bb7312cmr3861415wrg.660.1645740926020;
        Thu, 24 Feb 2022 14:15:26 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c35cf00b003808165fbc2sm584330wmq.25.2022.02.24.14.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 14:15:25 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Roi Dayan <roid@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] net/mlx5e: Fix return of a kfree'd object instead of NULL
Date: Thu, 24 Feb 2022 22:15:24 +0000
Message-Id: <20220224221525.147744-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently in the case where parse_attr fails to be allocated the memory
pointed to by attr2 is kfree'd but the non-null pointer attr2 is returned
and a potential use of a kfree'd object can occur.  Fix this by returning
NULL to indicate a memory allocation error.

Addresses issue found by clang-scan:
drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:3401:3: warning: Use of
memory after it is freed [unix.Malloc]

Fixes: 8300f225268b ("net/mlx5e: Create new flow attr for multi table actions")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 76a015dfc5fc..c0776a4a3845 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3398,7 +3398,7 @@ mlx5e_clone_flow_attr_for_post_act(struct mlx5_flow_attr *attr,
 	if (!attr2 || !parse_attr) {
 		kvfree(parse_attr);
 		kfree(attr2);
-		return attr2;
+		return NULL;
 	}
 
 	memcpy(attr2, attr, attr_sz);
-- 
2.34.1

