Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952526668F
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:07:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c724577e1fso44389425ad.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010871; x=1696615671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+OUXUGuXcJBjG1vjBPXQ48YFM5VCEcB7cIToPK1BuE=;
        b=XsSfmQxT1ChIMpMICO2eibXJeiH/V2JC8aaz3iI/ZQEkUHH4m8sZlbNJ6NmBQtVyLQ
         xKZo8NTmsAeXBBLMo0wvn09zA19KrtnvDS/XF05OZ+uoKXUSgM0KXj86KRcvhE+VX4zr
         +87qy5vZyJ9MuKRCtjBxFwKnzgAo950dHSv+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010871; x=1696615671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+OUXUGuXcJBjG1vjBPXQ48YFM5VCEcB7cIToPK1BuE=;
        b=v78FR+ci/hm04sjxu3zNLFz/MvyTNVBPrpJ7FZa7KICttD4VE+ry7gBbiU7/zCe38r
         2hV3gZWWnwFegCcQ4W0xqqGQMO5l6N/RRF9C56cmE9cGo9QqZUnbBJcx2TQlgHkuIt1l
         2CwMRuZfAoQAJ0dvnWHhRsVy+wvvC4HFk/eD4W5IrIKxImJXezAatxUKSRVSb0jWncmm
         ztjAGO2YUA2FFpLllUX1+4Z+cruVuzfKSMwvwYjoeCvdDbR4mtB4nBWZ9k2AydNYs3sB
         puUMcijN1IZ5IWOcxH5lJaolw1CHfciF2ElpjUQB6lRWuzDy2JYv2oaVPVD+oLcRmnlN
         47dg==
X-Gm-Message-State: AOJu0YzP3vnRRr4rAusKban/EJ8Co3Y5QTkobtqnUBeXHRY4WX9tZq5c
	rWrzUMG4EfgqiHXhgSXmWufWdw==
X-Google-Smtp-Source: AGHT+IEUS5Q6CItC18bYsvchkQTR8lfIdVZ9unfjKsIV5LAfE1xlw6Gtd4iK7tOPYWs64fb0cikyIA==
X-Received: by 2002:a17:903:1247:b0:1bf:8779:e045 with SMTP id u7-20020a170903124700b001bf8779e045mr5483760plh.50.1696010870993;
        Fri, 29 Sep 2023 11:07:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b001b8a3e2c241sm10147160plb.14.2023.09.29.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:07:49 -0700 (PDT)
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
Subject: [PATCH 5/5] mlxsw: spectrum_span: Annotate struct mlxsw_sp_span with __counted_by
Date: Fri, 29 Sep 2023 11:07:44 -0700
Message-Id: <20230929180746.3005922-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180611.work.870-kees@kernel.org>
References: <20230929180611.work.870-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=keescook@chromium.org;
 h=from:subject; bh=jOjkutl+FN0Q0NcydftzDs97qCbfIf1phadYTLsXBco=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxJwlBbholfX/29SJCBAGZf8A8xz38gXp6NGn
 iJOOuDg+hWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcScAAKCRCJcvTf3G3A
 Jl1kD/90JOuRmIMhCW3kVJu4Gf7kOSWnfxMGxbUxzN86sjU+wC/P4QEzsQgpQHekYaH3EkKx7w3
 hZY3FZcnwP5TRImzUsKk3CTw9Mh+q5lC+9myfP1SslNwswdLHQFuNlACOS3ib7oQcKfwl/L+0+C
 4nNsIZCoUyPTYoHcC5bpZ2/WYHFFyzk1INSN5bwLVHjUtbYzN8WfOnbhXAh2UCBZx6M241VRFt8
 GdGwT6UEKT/WxeFImZc1/we2T3lPaFgJL6cTsFwBsC7VzwsJjSGrozdK64zfdYXL8GR0hu6IFON
 q1m8C/5hOkI5Roxt+ixnIcsJCMEtG/toG1nRVfNmwbrvS47XKtz/9suOKadveDxhgjmE8ly8vb9
 7I8Y68+f9/E2SZs1lLgKDlALZRHfjrUcCQKkaSOdncpJ79tVuDV1WHvLwlkOXKcS5PZp79wPxwU
 C1nBv+Fb8S9rOV2GUWx4CwY6gPSJITjbsK8OwtN2gpaZ4HEwqJNynjJKdJ3pnlxS8L5G7JQQ0Z0
 sL2oqyF2kseDrtIcEFZjha2dZXLaLgCwgW5bGfqsUbO/7bxD82ySZTA7UMqKtDu7ukVDDnrHoPM
 34KCVIJKR5OuqECReYCfRgG35+fh2+3yxWpNQu+qbdDtXvkRWrF76jUvTEoG0cSZ9AhOMB2wrUZ ptq+XEqPzyVUZaQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_span.

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
 drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
index b3472fb94617..af50ff9e5f26 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
@@ -31,7 +31,7 @@ struct mlxsw_sp_span {
 	refcount_t policer_id_base_ref_count;
 	atomic_t active_entries_count;
 	int entries_count;
-	struct mlxsw_sp_span_entry entries[];
+	struct mlxsw_sp_span_entry entries[] __counted_by(entries_count);
 };
 
 struct mlxsw_sp_span_analyzed_port {
-- 
2.34.1

