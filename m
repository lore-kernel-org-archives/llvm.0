Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509783C69F
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:17:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fb85afef4so1252262b3a.1
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375049; x=1696979849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pC6/v4iVoFQU1IrJy4nniQew2pnCIehdGbhCmJV0Sik=;
        b=NsCe+QqGlJ8to7JEZf4wuRdxF7QtY2nD6EIGFu6W/KCwHi/Pj46czQ/PLTcztOiOHz
         8ob7JGx6LOg+06171brbd/4GgSKw3AVwB0UlPsY1zxq0sJz+PFCLSIvw5OCNjiSBvpJD
         Zu2IP3DWyWJUYPOUJ7dNuZYWZJVkNnVoj8qRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375049; x=1696979849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC6/v4iVoFQU1IrJy4nniQew2pnCIehdGbhCmJV0Sik=;
        b=iaeBDyhBvwuQ2E8B3GoMq7Td3DwinMciLSUmczPhE+oZMDBzbevYBzeTpT+3U3M8ML
         Sy1SljLGVHBfECQsZQrqgsoMS1F33dqRcEmxAYk1CAaIlqhN6hq+eAlIjvu6Z6F2904W
         mG1jv3raEJ06QC9/v/FDgPetLdypMJaZkOkZl6/nq4mKpz3Jh33hlq0H6lSD4C6jF38p
         o8tG8HJwNId/66vtewS5JE7xublh9SqbNeEY8OHdM2qna1xlK2lS0qO842+JKG0eVdrI
         SdV9nCOS81D7lC8betntikbo65y3G7Y2nTRpAXr8jZV/bm83frR2fVJZIvGnjqKO94dL
         21DQ==
X-Gm-Message-State: AOJu0YzO8cBQQFImp283jaFEiZSEwm6kKY5fyq9rWBCgSBDPutfOQ1Y2
	uH9V18jw2ZZfkTK/rkgry5CF/Q==
X-Google-Smtp-Source: AGHT+IHuGnaJKo/eW/4N6NAvL49m6h5gcj04i+ab7cUtcvywEoaT716ZI5XjapIrHclCSR0v4pBMHg==
X-Received: by 2002:a05:6a00:179a:b0:68e:4587:3da8 with SMTP id s26-20020a056a00179a00b0068e45873da8mr1129484pfg.21.1696375049514;
        Tue, 03 Oct 2023 16:17:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b00692c5b1a731sm1906278pfa.186.2023.10.03.16.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:17:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] net/mlx5: Annotate struct mlx5_fc_bulk with __counted_by
Date: Tue,  3 Oct 2023 16:17:22 -0700
Message-Id: <20231003231718.work.679-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=keescook@chromium.org;
 h=from:subject:message-id; bh=+jSITB/6TjSNj+40UA2fLQfGBMphst2NI+EvobKBg1k=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKECE89aWTMpk+BTOLsSMGlsQ5PDBZzFpKrD6
 7pVALRUNgqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhAgAKCRCJcvTf3G3A
 JsAED/9rep0qQL+Uri2yFkaImn8wrEfqCeiUW1dFWN1RYWA57gJIdN2l8m9to7t7t5Qhk8gp0Wl
 TUT/iVzK8etbeuqspeyDrRAJ5ePGg2PGNCBS5ghrevJdY2fImYvh3ARSOdc4e/aFOzqLbqXaKAK
 fwLmjvTj0gcPTX63rT3vW0m3BUBNODkOb0uRZ7Y4D+Jha0Vu1Kmp8zNxpazut9zE9tf31p++P46
 Tl15RjuVZlraJnO25sQCiO2D5kFio2XrIcavvPvIvAVNMCPb8d/+n0v7veeoWKmUhHv2T4+dtBj
 CM/BxQs7ga8vX7Srtu8dFy8KqMYSUvEsWppbZBv7UIvb/+zbdKjVWDcRXwaj0nBoa3aD5vjwoef
 WBv+62w7L34Pq0OBEm87kf5hbU9sawslHfkzscuh1YhbLIwANFe13YToHZy4tXL8/hq15yS9V3g
 O8M8WLXHQISnuGDNigW84R1phmsUt5Xuqq8Gu4Nd6kk0mv2mBUu0bQEVHvKH5glOHkipYjsl+x4
 wbn8hGzVBszGzD8zrQZ5r3UBiPBuM4tSqO5Wb7LQPWIyB3/KvMwK2DGdCY7dQOiD0z+wbHxHrP4
 FFDWH3HyBf9odaSZGGyOFqdaCpNJKZ6RyVW8BSBJrHHwqWjANX+jFn7TODlZ6UKXpA9uWpZEWSf
 SNOYZmX OgJF6EZg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mlx5_fc_bulk.

Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
index 17fe30a4c06c..0c26d707eed2 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
@@ -539,7 +539,7 @@ struct mlx5_fc_bulk {
 	u32 base_id;
 	int bulk_len;
 	unsigned long *bitmask;
-	struct mlx5_fc fcs[];
+	struct mlx5_fc fcs[] __counted_by(bulk_len);
 };
 
 static void mlx5_fc_init(struct mlx5_fc *counter, struct mlx5_fc_bulk *bulk,
-- 
2.34.1

