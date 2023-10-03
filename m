Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFDB3F4C4
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:17:35 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so1145636b3a.3
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375055; x=1696979855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoKQpmMqfvqKzHnLxZqD4HyHEsiNZ2wH5iTpRblmiR4=;
        b=OCInLXa5wr8ld4tJxmixzu+sf9eZEkGLDMQPfaBLPtpSe0Hbxyzq2QNhXYbMsNMqs8
         DTlXM5yZtetupZTWtVNRP5O8Hb3+n9GXin1MNeZTc25sr2uu7RHMiOO2HUjs9Zvw0M9W
         aTab8bi4DEX8V3hbiKulKchk6rpbuDAVcddBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375055; x=1696979855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoKQpmMqfvqKzHnLxZqD4HyHEsiNZ2wH5iTpRblmiR4=;
        b=uKkJb/Tg/rzE3mAdduUu0+iu0+lSMVoEM8e4gDHe6PIdD8t/AnlQ9yGgz2CFP0fJCw
         Jz4+buw5p8MRNaybdnoNvlpYluePMvzEA7nm2UE+i7QWLmr4QgIsmP0O8u13ufHi2qq2
         ND/HmFVtbASvdc0xFxbIVZHAbtdO7SS5HJaAu2kPJEOGKtJjpa3fxHmlpTVqE2XFdiRW
         DJbQRw+CL1izPewJ1s3/Z3NHFJkrt8bVPkTRN3uBGiEXVJMOqcnni/ZLQIZtUKt1w9eJ
         4RAQDchuwQyZUmTuUYzFmbiSYdkSw8E0JquO7csj1fTrl+oGZMG9j0OW99as+/Z/QYnC
         jkQA==
X-Gm-Message-State: AOJu0YxC+HXCxVX85LcpzF/aS+eaCjzO6s3meS/kGq/5um4K+BWjMSM7
	mn/xvNzr/6gjgj/gANd9qnEAnA==
X-Google-Smtp-Source: AGHT+IGHJDUN/6E4AVoGh+IF3RFevWze6T8pc7xq/e7zFBZVKvCx1ePEZLa2oRxMwKGEVJJ01u7crg==
X-Received: by 2002:a05:6a20:3d13:b0:160:a752:59e with SMTP id y19-20020a056a203d1300b00160a752059emr936572pzi.40.1696375055059;
        Tue, 03 Oct 2023 16:17:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090274cb00b001c0c86a5415sm2171759plt.154.2023.10.03.16.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:17:34 -0700 (PDT)
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
Subject: [PATCH] net/mlx5: Annotate struct mlx5_flow_handle with __counted_by
Date: Tue,  3 Oct 2023 16:17:30 -0700
Message-Id: <20231003231730.work.166-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=keescook@chromium.org;
 h=from:subject:message-id; bh=f4vYnzC3KAMbhe3PqA9dQTWjat9pNjLmhrrK9jgwO8c=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKEKOBp2oKoOdsMZ42xUeFs28bfpJIdHoC1hr
 xN+4gwoi/yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhCgAKCRCJcvTf3G3A
 JnVcD/9OO1uAbC5Mu8AdWtl4mv3U7HH3JxWnR+y6OyXqdQtJS6Cqn1dejXUIYRJh44Sq+kT716I
 FUs0HEhVgknlMkWN4f5Qzy+2LcH9uTSNUfNLCCzXGwLYH2jCbBFVg4HCO1PeqhRYiLubOCll8t1
 BrZU2+OiuHqIDMcl/M2ll0CnI5J9ORxpkJLspsSGSZQQXrZJALMJ63vZRVMbdgAcrjJ48pwAvzm
 diGSqJWKqz4gQW0QzsOgFTGNlmGlhIkC96iCF6xO/p8sMi5lC7yIstjF7p8u2ogCfGdYahAgpxt
 7jdfIEXFuYZt8z+/+Uy2CjW/dXRfZ1CLVrUq0zX2ixuTNrMe4zhq6mAMONDF8bWpEkVVadzE3td
 0nk6Ninq/lCDZhZZ9mwhz10ZorGEeiA1J9YcX0WR0C29P05xurEN6dzy8tKMTFnM9dGLdzEYTpK
 T6L7TDpI4ySjWf/XhJXCgzhOqwOLmvtJX/328SAFczoH6Cd7ohK0jc3gi3AKjx8uonMDPNDjNzN
 WmTD8lRClxhacI3z2fQrMBoTlJnLJb5SQ6/r3SeAoYu/7c5Nut6+qdAJQCZTO48A6lrC/d/TfiO
 /oNfumYbWNf+u/Pdb6IzLiJmcr1Ma2m4WvM2DKw3pyMo0pnEjBQE5vf81ACsuKqcER80i5p9bl+
 IOPyguL n2YaaogQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mlx5_flow_handle.

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
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h
index 4aed1768b85f..78eb6b7097e1 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h
@@ -181,7 +181,7 @@ struct mlx5_flow_rule {
 
 struct mlx5_flow_handle {
 	int num_rules;
-	struct mlx5_flow_rule *rule[];
+	struct mlx5_flow_rule *rule[] __counted_by(num_rules);
 };
 
 /* Type of children is mlx5_flow_group */
-- 
2.34.1

