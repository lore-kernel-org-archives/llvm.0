Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DD171D5
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:29:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c43166b7e5so21833985ad.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403740; x=1696008540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQgcIF4PySsFwzeoGRYEtks5LIc34ltXAoSUNKMo2rM=;
        b=ZQ6Cmx5wWQSA01kJicjdbhb2WqPNRG3mRGdTB/TGIkgvf34301FBaZglleqoOYW1yp
         dAROc7x8bOWh50wb7moM8/xLVlmE2YX9+oPaJQglKvENlXuX3saNDJ/otjIfZNnYzhZD
         dBPqZ73HHi8lSIVWH6HSk//kdDEbP9GNXrTiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403740; x=1696008540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQgcIF4PySsFwzeoGRYEtks5LIc34ltXAoSUNKMo2rM=;
        b=L4FpkKrN9Nz2nKVG4bsQ0WOHt3j6VQX5chVg3zLNh+RGIVmWcxA06pKykufh0tdSEn
         wx2a2+tFjVoo9UkzIX70oTB9bikaaWa9ssKReOkjhMFzhfliRrx72UQz7jHUqVH3ZBKk
         P6eUVNgkRB33OYroTpAHw7e5ulDV8UKSkK5+b15FCTnCQkAdM/Y8TbOLY7P/ZxxH7UE0
         SHwllWrRcwPONMk/UHwPT6QzKA9GnfHRTTAgDAv9IEsqK+V9LRb/AnNO33nCfk4/77Is
         gmZscDikv4FlhSINOHdYi44UAeKaJWx7oypZX4WVizwfjO4LanKCptZiWDAtMEqoSabR
         r3Iw==
X-Gm-Message-State: AOJu0YxUoMjSblcqAsF54Q7HlsYFlP3/2AORb/SJmkXiYI4jRtlqwPDY
	6/8WQ7jL+vOcyVoILCTiEa6GUA==
X-Google-Smtp-Source: AGHT+IENmtf+3QgdICsx9sMlPZ8VP9uQ4Oz7vOx980wWikaK8xYczZcDLwgaN7wYl0LqtVWF+L/15A==
X-Received: by 2002:a17:903:1104:b0:1b9:de75:d5bb with SMTP id n4-20020a170903110400b001b9de75d5bbmr129615plh.7.1695403740055;
        Fri, 22 Sep 2023 10:29:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001c5684aed57sm3747496plb.218.2023.09.22.10.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:28:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
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
	netdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	dev@openvswitch.org,
	linux-parisc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 02/14] ipv4/igmp: Annotate struct ip_sf_socklist with __counted_by
Date: Fri, 22 Sep 2023 10:28:44 -0700
Message-Id: <20230922172858.3822653-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922172449.work.906-kees@kernel.org>
References: <20230922172449.work.906-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=keescook@chromium.org;
 h=from:subject; bh=6I/UlxaeVfPSNCQK2wJRk7LvdQNOEqFwEHhj61WBOvM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc7WtZKzI4JHFCjzeBDKOaLb2wkieWFO9YYNa
 DG+55LdCDKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3O1gAKCRCJcvTf3G3A
 Jm8qD/9eheMPlBV345+ln0OsLw143sFPp/IgjC2ffDkvS+vNvlyGKo1pdDfWL/Dy6yQbTqJIKWj
 izxzityDxwVA5CrakAWjh0OUEc71/HYUErA4IzMs7+UoxJbgLn77IWWpyw9Xwj46b3IrmRsWA63
 IRzPhOYgKmjgTZ0/P5uk+86O0fX3UFW7aDBTUCxijuYfhGodNshSKQoHWNQDyR+Runv2Mr5/nrV
 47/zpDx45NGiHVXKH/RB+v83VHSSg0B80AvuKBtrrECHT3uGd0vQxajYOXF6kIdhsnLEojhkSdB
 6hJsvl9SL8mu/kw37S2hPbbF7ZSwyNqtNPXAJwTUX91YRDiwUz/E2Id35bAX6iAYZJPOgqQNlba
 m9sGLSd5M1FNeb7BMZFfkHlvXtRU3lGqmxTCythMv9l5vOFelYrWm3Ed5DsDzUJso4uHqMoeJLG
 abH8O7CdTeYTSBEPqKO+hOU2RbQvGjJSGgpqkNnGadIH7wsREbIh4wpGIoeyjG4AFJkWcJHPW0X
 pclEzg1B6BV3xUvk+Orq3M6MIdEdE7Qeag5HRs3i20O1tA/6Nt5Zg1GDi6PGIU8czPirNy7vi7Z
 1/e6fS4U10TVhrJ0/X1IdhPx94mERDlb73y5W8AJNMIpUO3NKcKwi94OZp7UCYdY6dy+6ShVhDg QMQF1oNmMT1fAvg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ip_sf_socklist.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Martin KaFai Lau <martin.lau@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/igmp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/igmp.h b/include/linux/igmp.h
index ebf4349a53af..5171231f70a8 100644
--- a/include/linux/igmp.h
+++ b/include/linux/igmp.h
@@ -39,7 +39,7 @@ struct ip_sf_socklist {
 	unsigned int		sl_max;
 	unsigned int		sl_count;
 	struct rcu_head		rcu;
-	__be32			sl_addr[];
+	__be32			sl_addr[] __counted_by(sl_max);
 };
 
 #define IP_SFBLOCK	10	/* allocate this many at once */
-- 
2.34.1

