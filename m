Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77E42C14
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:29:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690f7bf73ddso2118743b3a.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403744; x=1696008544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMdpD2QebNkOsgnE+B1fw20Xf2QOBM+P6FhfFtclzIg=;
        b=IzVFJlo+i4itAlpv7CgdsZJZalYxHjNGivhAURFA+ss5x3q2y6WY4dgrjBBf65mtA2
         FJn/nf+BK4wAG72F6BljnD2tO6I8veoKIW38v+8eU4iEgaZ0JLjYGamD8dDu7+mUrPLF
         1bH9OKfH8g4/9OJ22qB9wphLxeypic8pbFE60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403744; x=1696008544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMdpD2QebNkOsgnE+B1fw20Xf2QOBM+P6FhfFtclzIg=;
        b=Rs17oJl1aE9LND8IaFkJkfsUUKy10S8ldNDfeXgfyiWzAyOUraiNLulzL1l+hju8VD
         4Uxp1mQso+WPY+fYyq4gmNQyebhCSf3z4PAJTXZJPg4B7fqnbmb5Ds6/RB4c+kf8VN8F
         +bOwP47rqq5DDBs5Nmv4DgQSwh/djoSfOdYp0ANOe/gOqggrKAaFanrg+JUYnluYax+h
         1M+kpIVsrhZd+pjb+VSN938L6QGvWhHqJ/nZx/rc1z7PkJv69C29MZQNI1rJOcqkdHND
         HjFx9LvuZt9TwBB2otT6wuHRvrRfYmnk4QB/T513Wxu86DWKwMnbbrijAyPHnyn8BTR0
         +Zng==
X-Gm-Message-State: AOJu0YyNaKhQe1hZxUOplKPhl1WuvovNtvdk6QTtiexXfT9YGbGt2DQr
	To9RHg1xc84pJp2OkINNJnuuZQ==
X-Google-Smtp-Source: AGHT+IE7SiO3xmHQebRTeKr6u2llRvZefk5GbDgDG8FNiA6+zRP8f3eqt7sS8yR1NszsLLOzc2SOaQ==
X-Received: by 2002:a05:6a00:1a0e:b0:692:822a:2250 with SMTP id g14-20020a056a001a0e00b00692822a2250mr28989pfv.17.1695403744255;
        Fri, 22 Sep 2023 10:29:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x17-20020aa793b1000000b0068fb43a72c3sm3467049pff.20.2023.09.22.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:29:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Pravin B Shelar <pshelar@ovn.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	dev@openvswitch.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
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
	linux-parisc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 12/14] net: openvswitch: Annotate struct dp_meter with __counted_by
Date: Fri, 22 Sep 2023 10:28:54 -0700
Message-Id: <20230922172858.3822653-12-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922172449.work.906-kees@kernel.org>
References: <20230922172449.work.906-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=keescook@chromium.org;
 h=from:subject; bh=BiU4XzbiAmb0MDODFTqS+z9raCbhz1/gL/I9iNWiJeo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc7XW5+OhlRV9ltztIVdWSZfQphqd+6c9qMdL
 7vc0r03kUuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3O1wAKCRCJcvTf3G3A
 Jo45EACgakJgI+sZnaQ9PKs7A9coyV/LfTrR7Tn0iFc54pO3XUL1r/z9PwrqOMnwgg56WgY+x/A
 6wFtA4SvikdsEw+xxq96vPUVGo15juErm8BPenaa6w7xcVox6lBW3DHkk6dKBlnngG/e/l5dzFX
 b9M05s5ZS1B4lBNxV3ahit+iBwnkpz5YJ8yqXyzRSXafim1Yze4lLaYBb814XrbLfGFD8vKvK5B
 zJtL0DY0TP92fqKFSbxZUhgUj4gnHDyn42YLSh6fpDiX102rTfPlTwL9GdrVCY/S8v6iMch83ev
 h3fqxds51Iz0pQoMO1yA7cjhwvntVVp8f+0u9ZpNiGv9ABUD53tLaooQiqGxCsUieaH8pKCX3Pe
 ZvbmdRRr64tiiwGpP7qpIJhpd0x0o3tBG+KW/6VpsGTUi8WO0e2/naRltFUeYszXsrfaox0Lmx/
 0g+KLMPDqCrPljPQX1rq/q0g0O3YvtBRFf6n0Vj1BGXjiPFDnDZTMBbmROt6gmu02tH3QmI10KT
 SKkI5QfmIvHyeZlB1c5uxIXSgrcW6W2LX/N+L8zKFpsuAfpqLQzRv7eL2TrstY6mOzOLjCekBP9
 wTZVKBfYr3rKfwrThTcEzg4kju0sWqQXCmWR2DFa0SBDvCWjr5+FL24z85HcEv9ne8TmjWy3eXc LALPKshX4VtbROA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct dp_meter.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pravin B Shelar <pshelar@ovn.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: dev@openvswitch.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/openvswitch/meter.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/openvswitch/meter.h b/net/openvswitch/meter.h
index 013de694221f..ed11cd12b512 100644
--- a/net/openvswitch/meter.h
+++ b/net/openvswitch/meter.h
@@ -39,7 +39,7 @@ struct dp_meter {
 	u32 max_delta_t;
 	u64 used;
 	struct ovs_flow_stats stats;
-	struct dp_meter_band bands[];
+	struct dp_meter_band bands[] __counted_by(n_bands);
 };
 
 struct dp_meter_instance {
-- 
2.34.1

