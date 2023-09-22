Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294D171D5
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:29:05 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-274e392a5c1so1796410a91.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403744; x=1696008544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+fG/1IUZcjxNvMlyP56fbg8HR7JVnjt3riwCi0wfhY=;
        b=gAWvOE+l0jGjuqFulMHeET17rWMpxk8HFboNDD9/Eb7Fq7D78L6TbXFtUnOi0pYKUK
         PslmRW6tW2iFM7MHpTT1ZZ2/BapE+Ruf9Irxt7TaP5B5VnHP3SUh2S/7hRT28BTciqGn
         ltS1OoEMPrtLvLnjwnh4+PDJ5UW7VE58D1WHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403744; x=1696008544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+fG/1IUZcjxNvMlyP56fbg8HR7JVnjt3riwCi0wfhY=;
        b=F0DY4dUp89TprrWwb/yiyfks97tL4+i7auh4wPUAfvxsEBjmgmIpZQ+9MoiJswPVF+
         ewastP4V+vWA+guxcevjcOCGkwLVR2Tndz6Md7bECnokNKY+7Ti452MYGTPfAccfMegX
         c3EXhbcIjAedoWxG4FMFUhk/b5wereuJuvg8OzM7GrKTClYo0UTyzOXUlOhwRXCUaK1q
         8HacpvTWiaCjVpZxRQahbIwROd7dvrqSn6EofKnQAHcCBG84MvZf2HxDgCV7IkjZ4xC+
         x3sjSGXWpPq9JH40ynIPgrMaRbGQKap1DgzFQFMFTRJWwHvQcwFZd98KFrMy5LMHTwhb
         M5Eg==
X-Gm-Message-State: AOJu0Yy8mpBQCkkqCljgU0+SfpHyaHJeUgV08tQDYI96UlUUQCAgzDad
	vK8crwZqHtNv1KR89mrXt9xdxg==
X-Google-Smtp-Source: AGHT+IH6S8Qm5OPqgsDQKauIPObSxBk1dvTlx5l1M5gkLGsn8Dxuo+qpskJS1TC+0k22q1ogPLtjUA==
X-Received: by 2002:a17:90a:fb8c:b0:274:4fb:360a with SMTP id cp12-20020a17090afb8c00b0027404fb360amr385633pjb.16.1695403744652;
        Fri, 22 Sep 2023 10:29:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gq7-20020a17090b104700b0025bd4db25f0sm3544485pjb.53.2023.09.22.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:29:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Sharma <sharmaajay@microsoft.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alex Elder <elder@kernel.org>,
	Pravin B Shelar <pshelar@ovn.org>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	linux-parisc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 07/14] net: mana: Annotate struct mana_rxq with __counted_by
Date: Fri, 22 Sep 2023 10:28:49 -0700
Message-Id: <20230922172858.3822653-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922172449.work.906-kees@kernel.org>
References: <20230922172449.work.906-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=keescook@chromium.org;
 h=from:subject; bh=ZdDX1htO5g9RU0JVxl8E3nenoSp50ETWGlk5dSjb3Pk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc7XhV+304GTOyf/fNFFzA18xiqgiag6BHBkU
 r6QL6lj+iGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3O1wAKCRCJcvTf3G3A
 JttUD/4nw3GnIK/006QbQZGOylTpwCOUiis/9zO+cYuRhscdH8v/ABtugcRwPC6Cn46YyRhmelJ
 I2EjfW+CUaswbO+4XodbsNw1MP3/9Rh2Z9hxWJp/ixVY+9Gr/Xso37A3Kx7yx/j9g7cJ5G8FsHR
 BhADK3SY0PK+fm8vEQHbU47FLD+SDObsUZwCTiQppe3Qyj4rtHRPkpvlP8Xtnc3oktAK9NfjPO4
 BYX4lmas+XoVTX/BFSYNV+dbtgn9PgTb5cIcrf+KYs1b21rtyLu7FAM/T0PHhS5lrEfGjiDqIXO
 0HnCVEXXW+bGsbCUW5vcgJX0NOpM8VO45dmzonA+kMLxzbeOr31HUL+vx9F41U6UFLiosKhC35X
 QKeQKslSIwT9mFn9vcACY3wusuQlm2dm5Gb6CJ6xJhihRmK+yH+a6EZadQqvSoyBI1jX/P4o4cg
 sNTuPs+4n3fXOjGWHI1inrX2o79utjzSj6NnfBHfWaSsJwBy5DLPBUA7QEk5YnSa0PpkGZXbZov
 542ytPJTcKvRQlZRIwvp7bbD6cF+jq/ZtXo/ut0guz7iB3rUVKztN8ninv86elhhA7yicM598rP
 JLBjpJsix6aeD9dFf7JzIxn3ZYFhogdNT5fm/Nauo9VfLHWZCflPIDWW1LOXoXjv/A12uH/gUeb k+LcfI33E0wxohQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mana_rxq.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Long Li <longli@microsoft.com>
Cc: Ajay Sharma <sharmaajay@microsoft.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/mana/mana.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/mana/mana.h b/include/net/mana/mana.h
index 9f70b4332238..38441be68592 100644
--- a/include/net/mana/mana.h
+++ b/include/net/mana/mana.h
@@ -338,7 +338,7 @@ struct mana_rxq {
 	/* MUST BE THE LAST MEMBER:
 	 * Each receive buffer has an associated mana_recv_buf_oob.
 	 */
-	struct mana_recv_buf_oob rx_oobs[];
+	struct mana_recv_buf_oob rx_oobs[] __counted_by(num_rx_buf);
 };
 
 struct mana_tx_qp {
-- 
2.34.1

