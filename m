Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909A72
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 14:21:20 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k37so9410053lfv.3
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/asYRVVWrg/grLuo8zXbR+gZRKZzxwVDaGoh6UAG/o=;
        b=wimL+JRML5IGeSealFKMZcxayi3pvkjJI/tzMcAtP/rIndg7ICyi4Yu4Qg3vbIcXnO
         H6hz3fvy/1Cd9ZgKmmqmiCv75wi4m647NaA6Lqq1fH+BPstN8Bk9RY3Qjaojie6cZQIp
         Q3YtO0eOZxRxTSlJHZmTrBzPr4uzgVmgVE0jIdh6ttV/k2ZjeePjhL7UWCQut1o7wfcW
         Wn5dUUUUnBdRjI008WDNJ/gzXK8MCemg/p5sm2vsp0BEe5zpOecRDHB4ryO+iPxctttS
         V9vBLyo3wVlG9wdhdEbp/zeadhiy3+LfMt4YabKFgHNFIWa4U3nQmDaj5GJYSzQyIDfv
         pPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/asYRVVWrg/grLuo8zXbR+gZRKZzxwVDaGoh6UAG/o=;
        b=g+NVrJwRMMUUKQgkWBGXfLMJIdT/t+LH9chkhXFQO/17WZdrwUUI0UrIdkOVn3JROk
         wyTmcj8AuGBammkYixdBCScbO+qoXbmtxmHKt/sCVInSMb3UfkI3nfmg7FbTW83J1tYi
         XDsFI0pvnrzDRz0azNOlP2zrD7MaNoHlE+5LthxFhTzVmq49F6HLeGTnIGHuYhJfwgh+
         5N0d332y1RJMHoAXhjQvTjWAyC7ZThE5O8WxjEKckBFo8ZTGIXa5aIm/dapiLPRUkwvv
         8G6GGcaZHDIGACE3R9ZNKaY5dn/9ESHe6bjtPF39Ivo8/6K4tVZdpu7ZUe7ucAZVMmnb
         sqMA==
X-Gm-Message-State: AOAM531MuWmpah1s8Je8ulunhnZgXwso8nhqYnmWbAfeMd2tDzq8Ft0B
	ZYmf/LJWmbG4TYegebpw+jTuRQ==
X-Google-Smtp-Source: ABdhPJwkO8DIFD2Kf3FTpIODSrLT4YpxSReqGBI4fzQVGakSD94NhFi1Wv9HnXf0MXYn1eLLlG0LRg==
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr15087875lfv.523.1637158878488;
        Wed, 17 Nov 2021 06:21:18 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id u7sm1165ljh.49.2021.11.17.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:21:18 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] soc/tegra: fuse: fix bitwice vs. logical warning
Date: Wed, 17 Nov 2021 15:21:15 +0100
Message-Id: <20211117142115.694316-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with clang-13 the compiler warns about:

drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
                reg = tegra_fuse_read_spare(i) |
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                               ||

This should be a logical OR so change it to fix the warning.

Fixes: 7e939de1b2bb ("soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/soc/tegra/fuse/speedo-tegra20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra20.c b/drivers/soc/tegra/fuse/speedo-tegra20.c
index 2546bddbab93..4984246605ae 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra20.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
@@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	val = 0;
 	for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
-		reg = tegra_fuse_read_spare(i) |
+		reg = tegra_fuse_read_spare(i) ||
 			tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
 		val = (val << 1) | (reg & 0x1);
 	}
@@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	val = 0;
 	for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
-		reg = tegra_fuse_read_spare(i) |
+		reg = tegra_fuse_read_spare(i) ||
 			tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
 		val = (val << 1) | (reg & 0x1);
 	}
-- 
2.33.0

