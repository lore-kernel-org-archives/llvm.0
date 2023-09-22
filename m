Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2F42C12
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:29:08 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-578aca5a6bbso1709793a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403747; x=1696008547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8wcxdgkYAvkCOCoP6EB5xh89rywD8lhufIcjStIsos=;
        b=CIdV1t+KapBZJpJdv6C+2RdsVPvTK2ULZ/pi0uipv49anDhEHH59ecosQI9qq4/NfZ
         oCTnsOFMaL5ijqQSF66SEY6kmEXtFbWlVTUcvf9uFdR2RBb3HhAdkrhU/C/Xa5Vkjppf
         ODvXVyDgtS05VvWjCcs8y5bu7bxd+D3bMZOkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403747; x=1696008547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8wcxdgkYAvkCOCoP6EB5xh89rywD8lhufIcjStIsos=;
        b=HN8lLPLaM8uk97KXJG/TDHLwUVHSpWei6wGcCYUrklNpE6vkDd9dbOYAE+EjHOVmJJ
         Kksuwtehx9RFP6KXOG4URcDsmXHWATQfXXg2ENuGR8sQrmim4dfpuuU9EyCxJkv59R29
         PK9e+perYNxqOkOuRBvd60V74+9/8u0ZwqvNLdExrpSLVm1bjpLW2GIOOxG8XXmvlj6d
         mJbj50kb4QcWiGk8K4SuVeJW9PjMchPowbwE6iG5+00fH8F5qOQrquDYoBux35T+44z5
         TNaAR6D0WvilfFbw/U++WBw6IUX6f8phIFCU95hn2FisSYhL16gJb+I7JM1IoeGNp4I1
         H3qQ==
X-Gm-Message-State: AOJu0Yxd8ZEWPekLgPLfSmR9OZ67p9UKeL77JSazjAfwqG+mY6Hko1un
	rpungtnUcS+RKNlChWhhfaC7mQ==
X-Google-Smtp-Source: AGHT+IElpZNjY2TGipiQutTff+ugw0APbFwNtO/dCFekhNu4FwvwZxuRlHmJbXr+4aj61TxA1EODzw==
X-Received: by 2002:a17:90b:350a:b0:267:f094:afcf with SMTP id ls10-20020a17090b350a00b00267f094afcfmr382935pjb.12.1695403747365;
        Fri, 22 Sep 2023 10:29:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id on16-20020a17090b1d1000b0026cecddfc58sm5168623pjb.42.2023.09.22.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:29:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Sharma <sharmaajay@microsoft.com>,
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
	linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	dev@openvswitch.org,
	linux-parisc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 06/14] net: hisilicon: Annotate struct rcb_common_cb with __counted_by
Date: Fri, 22 Sep 2023 10:28:48 -0700
Message-Id: <20230922172858.3822653-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922172449.work.906-kees@kernel.org>
References: <20230922172449.work.906-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=keescook@chromium.org;
 h=from:subject; bh=1a7NieutkFX6AaDPkEeHOZVHEoHBt5bQcCIJutpCWUw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc7WrIx18IVUGp+00bkbeA7+GMMa1sOqiyBAN
 /AV74Ua6mWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3O1gAKCRCJcvTf3G3A
 JtWVD/0YjudsxRE+Gn/6ufjGzrUTJPOLYENG3QXjmKKMjykihDhpS8roKUz2639IJQ3ofG2lpRk
 pXxt1nWBR3nqg+5tD17nHNX5VrKywlSBPf5mb3whcLu+0iyWDcCOXNHRNmjXVj4DsvbXClNK+s2
 axrhXO/7+2urhIqPiZBSj8fZ+gMdMkGrkTBOpVOlpXCI+ALT+DTMX6XrGCT9blczSojxLyMi+fR
 56bjaJ5DQmkfNVF9FbmQqkz1kvtSMt8EJZgAJQvO3Co2nhnYjG6aWv7Co4NraY1+y/uXZ5UM0Wf
 CS3m75U8q7P31UyY0cYZZBAOAGYs7vDBolcGl0mkgZpmulcb2JGvtrCQtJbSX67BqG6ABbzt0ua
 D+v6y10gAogt3nTCEqz+86wi6NATANnhftFkrO/hMg5JH1ULZskFkOHKabuV8Q0h2ZtE5tIcnuJ
 MmFspm4sTsM9Wt/0MPN1VfS0UYoTpeMjQEpZYVztnxaTa4vFLrLf3YCRTllV0iflQJtbLe671v0
 SepA6Jp/5ELNjbuHEwQ3U04XAtLLSsXxaHj9U/t0HrxsKL7gOXQ0lPrqAVCgVPw9PRh/cNTIIky
 mCWwUUCQMoVQOj63jYvTKofBHWWpzbkDdCd6A6q0o3QG3sbwrilQzwD1k6NViARVdu8Js0Qo++i 4um6OXwKgBbqLEA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct rcb_common_cb.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Yisen Zhuang <yisen.zhuang@huawei.com>
Cc: Salil Mehta <salil.mehta@huawei.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.h b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.h
index a9f805925699..c1e9b6997853 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.h
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.h
@@ -108,7 +108,7 @@ struct rcb_common_cb {
 	u32 ring_num;
 	u32 desc_num; /*  desc num per queue*/
 
-	struct ring_pair_cb ring_pair_cb[];
+	struct ring_pair_cb ring_pair_cb[] __counted_by(ring_num);
 };
 
 int hns_rcb_buf_size2type(u32 buf_size);
-- 
2.34.1

