Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BED6667E
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:07:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bdf4752c3cso105988035ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010869; x=1696615669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1fCnyMESIUDw106GjvVeHm07JaGiyNbi4ApDENYnlM=;
        b=YLiQbGNidIsUWtLv79L3397WVT0YSMbQ+JzKIavbD21MFGp/nKvKOczCeUOyZrSvNT
         IWAGXTnbYfstbWU5Hl+p+xdLQPBAcVVlkPtCS5eHG8H+WZ5F2Ihy9Y6fr623BinkANbd
         Cr4rirVcYBtoaC9mPFk4eJ56zPax3kpNYYApU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010869; x=1696615669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1fCnyMESIUDw106GjvVeHm07JaGiyNbi4ApDENYnlM=;
        b=HSLAjICLWgbBM8ybU0/tlB7XSbP353DIEVnVOpSGej/8Rot8nlb/8doq7xRizkQlYq
         /TeEPFW5RVCktTztuYHWdgNvosfEj5AZ/UemvxbJBvsLIDnC2G7PaNG6OOUTYxlSXRlZ
         gv2k1CF/WMI2yYiyC6mwGwqchaK+sXvjAIj8NHF3mY8BkRi0D2Gs4UQcJcZHT0aNj+fW
         qI+iGHZJO9yUjV7EG3A2BHABsNDMjkbN9+Xho6Aglg/6GXAuwXug3rSUcCorPe+vXbWd
         qLJmZMS1uxZ1s1Gkwyc3UWWKo5zImcgdpTWIShXga8LfewB7Eh6GIzxND2a7mze8l5bV
         O0ug==
X-Gm-Message-State: AOJu0YwrWBkSA03ADELdiNuzpOSjQSJeT/dwcY6KmzyIsJD+NG8Gu70s
	K2achvBGJmlnOyKiaKjQQQ4haQ==
X-Google-Smtp-Source: AGHT+IEYP50F7nEfHcXuhCVPvSqHJT+dGY9l357PrVksSC4o53t+1o2XfasILPny5/J4Mg6J6IWTvw==
X-Received: by 2002:a17:902:c408:b0:1c4:5c05:c3c9 with SMTP id k8-20020a170902c40800b001c45c05c3c9mr5808758plk.56.1696010869523;
        Fri, 29 Sep 2023 11:07:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902d18100b001b8b1f6619asm17332300plb.75.2023.09.29.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:07:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Kees Cook <keescook@chromium.org>,
	Petr Machata <petrm@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 3/5] mlxsw: spectrum: Annotate struct mlxsw_sp_counter_pool with __counted_by
Date: Fri, 29 Sep 2023 11:07:42 -0700
Message-Id: <20230929180746.3005922-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180611.work.870-kees@kernel.org>
References: <20230929180611.work.870-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=keescook@chromium.org;
 h=from:subject; bh=+RWfw0GyGwLXMxH+fSx74341Dume6vULCGctkWzJyII=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxJvQ2MJX5MIYubHbp+JLru78XV8PSD9HfCip
 MzkMrfhDwOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcSbwAKCRCJcvTf3G3A
 JnRLD/9EGd9KZ/Tj7Icy70EINkAG/rdfxW+EXWV6I9tI7aqUVeByxYSzHqj8FOidkSGNCh4jARc
 +uXnybahYfPpBWVV41kZfAhAIpxzSoq6s8NuNmkX6T8LHkps1oWxj6pDoKaoFfCMdsAhNUK1xcK
 UiU2qHZHzc1qKNWo1sAcHnPjme+swZST7xHSQ8SF2E13eDaQvKKEpdPeGtSNgPEV8yLj58EN7a0
 iP8n1qZPDs7IoEuCGekv4cGmTTaSzUDc0R7Za2m+3bdHl4DcF9E+nOig6tbTybEZi1aNNjPdNL+
 s+j9/MzDWmw9GMUxIetw7H9laEtIav7YYaf6G8aRv+wTndvPDcfVqBcvfdYnZNx0/rgJSm4e1K+
 QhoQGun8o9/gzP/Y0vAq9j6Fqo2XYbAy9jfvjwol3QlvCJMu54iuM/U5nr6GkAWJ4k7d9jZiVFx
 W2aBOpvnHsbXQd8exwGC8sDd5XFNezCGfQ+qK0pWvD3xzZtJ8mgiQFrhnx7KZDh2+fYU33Hzy8K
 6beObhLWjwE4DYbXYUH8YXOE31yPMSY5K6435NP9Zhlwr4oB1bNxjmDgCqJC73O+PFfJuj6UzKl
 fpEuOHPJVmLtuWUTjz2a/oXMxNT4xkygpO3lIq/qJUoDhiJqrHWI4WM1E4GV4EiRdSAkrIFp856 Z9rPTNG+P+HSMvw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_counter_pool.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Ido Schimmel <idosch@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
index ee59c79156e4..50e591420bd9 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
@@ -24,7 +24,7 @@ struct mlxsw_sp_counter_pool {
 	spinlock_t counter_pool_lock; /* Protects counter pool allocations */
 	atomic_t active_entries_count;
 	unsigned int sub_pools_count;
-	struct mlxsw_sp_counter_sub_pool sub_pools[];
+	struct mlxsw_sp_counter_sub_pool sub_pools[] __counted_by(sub_pools_count);
 };
 
 static const struct mlxsw_sp_counter_sub_pool mlxsw_sp_counter_sub_pools[] = {
-- 
2.34.1

