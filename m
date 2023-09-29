Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A166670
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:11:51 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bf6ea270b2so112123055ad.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696011111; x=1696615911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LelDNgIaKJAGv8m5QtAniz9H43KU5lbEctjO62ftcqY=;
        b=HQPcwL8NCmgWIlcy2IwS3yEW/VOb7sod2yQODM7Kj77W9LWnzWyoaX83rmWxKAeWYh
         K4RkaEhgawAi8ZIKsF88foCJOkd2hEANqTPtfc93zNWh/Za4o3l6r9qRBGxS3zvEHydV
         uqlbpWdpN3zF5mKiEMx8L1iqhcoxQX7gHRoqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696011111; x=1696615911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LelDNgIaKJAGv8m5QtAniz9H43KU5lbEctjO62ftcqY=;
        b=o+zWPMNQUBcKEoPh6K4PVl8AnN83FuzYoCk129xfQ/dBuXF+aX4+IHO3zRBd0MMgNa
         azA4tAcz20eVuuACr4r7Q1lBXTyLmdVTXhw3Dnc8dcvL6iZSdVyWY6Er+OZ8ZptSf1CH
         ik7ZsnuIxYt6WiCylemtAGjYQQEztm7+zahLagzvSAb9Jj68WSLceEDxU8lqy+eVx3Se
         Ef2rntPCAtsMYdY+g1p6aLqyz9Q2DSBWj8WdTqDKvhCOxjM0edN3nvjW570/7pWk/wrH
         hpWWn35u7pCqVTK8ic7Tepj6LTFq+GkHPvcvGqVEyZDU+H/lcvyXDh9D+Y+7ieoGq4HL
         IUHg==
X-Gm-Message-State: AOJu0Ywqzn4xAvku/RYsU8aA5tj+PDUC7wsmvL567aLzjQLqldRZYdQ2
	KudoLhighuC44riS0MGgsrPzIA==
X-Google-Smtp-Source: AGHT+IFp3bhP+Nqbdbpr+lLgR4vtr77JK8lxcWx2zxMlaCWdtIt61fdrd8th89qUIyLgBpTfPNGTAg==
X-Received: by 2002:a17:902:e545:b0:1c0:d17a:bfef with SMTP id n5-20020a170902e54500b001c0d17abfefmr4502026plf.30.1696011110955;
        Fri, 29 Sep 2023 11:11:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b001b8a2edab6asm17075217plt.244.2023.09.29.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:11:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Raju Rangoju <rajur@chelsio.com>
Cc: Kees Cook <keescook@chromium.org>,
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
Subject: [PATCH 2/5] cxgb4: Annotate struct clip_tbl with __counted_by
Date: Fri, 29 Sep 2023 11:11:46 -0700
Message-Id: <20230929181149.3006432-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929181042.work.990-kees@kernel.org>
References: <20230929181042.work.990-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=keescook@chromium.org;
 h=from:subject; bh=1xjwdL5f1ZwQtlSjHraq4S6Ct1cTzMptk05f7F0Knyw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxNkClAByZ2t2imOLxlyWRMjihvubRYuwVOju
 CbJdpqAEYiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcTZAAKCRCJcvTf3G3A
 JmRDD/4xcFd2xErFHHO52g54sKzulxzUwaY7hKB/cJqB+eXbtFGgB2tt9GnWDUYTucvNWfGfrRO
 WefuPoFa1In2irZrcx0pjDUGznGE0qFXLd86FJtIOeSIEJq35TMjFQOnq6tqhTenU3znVkbQZev
 64kT7WHWe+/WYF1syArYm5+LofMLkW1zctxLTdrpIRXBXpxbK9IzCd6gG7yQPGh/nCDZaZJR++k
 D/oSNxxnkr/cGbxRxhf5s/8qYKXv5Y8uzNPu2q5G9yzEf6e+8urdbYNlDIn4WGlWwpOVsGubTh+
 ef8O9z++/PzDHpk+g5s6fMxH3IM1sNyQbzRSblOMYA6ciGJzENjrSxqVZKJtIVk/gu4cEYIdRSC
 MZTZgdpN+v10komKMPQwIO/PiQ/38irV/eA1mWTw5lLAm8tqB6LPg6MgYOuOGXtFoI+neSJYPf/
 x5hWOqzImqqP2rxs3VchpeExsk3srsZJl6fPJKZxcRQ2K8rIR49s8wzZr3k3xKhPdYXoqMAu6lK
 whn/87qgrQShDDdmtGChdFZuoQ8jBLDXo1Y37dgkk0uN1pnVazzfaYydiESmJYIMAqDs7eiDSb+
 dMhc2XY+KeQ78Dvg0PDZtR//QWpS5+pG+iPfaLmlEqG6/1pQASs8+LUwdkJXtia2ClOU5W+qlcR fszdrCV9cNLMyTQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct clip_tbl.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Raju Rangoju <rajur@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/chelsio/cxgb4/clip_tbl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.h b/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.h
index 290c1058069a..847c7fc2bbd9 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.h
@@ -29,7 +29,7 @@ struct clip_tbl {
 	atomic_t nfree;
 	struct list_head ce_free_head;
 	void *cl_list;
-	struct list_head hash_list[];
+	struct list_head hash_list[] __counted_by(clipt_size);
 };
 
 enum {
-- 
2.34.1

