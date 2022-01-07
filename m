Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD229CA
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641588587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rFO4WJY3j7pAXTu1RPPXXQTX/D3JtAjVln6pv17Se70=;
	b=Fd5AuVkJwEjMVd9eNHGtvv0meAu71vwA9bsMmPd148N2aLBrIDwHIOswsHG+ZdUuPigvV1
	x4tCeHm+DKOW0Zjvnc3T4Is4p/kFbsof0OxL6fbd3R+6rdvLbAHdgGt+8Hg75yfxF3CLux
	l4W0JgcAUJeUdg7rMvskEW51KsC8QDg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-tL9w5yLFO7KjX1jXe0TJoA-1; Fri, 07 Jan 2022 15:49:46 -0500
X-MC-Unique: tL9w5yLFO7KjX1jXe0TJoA-1
Received: by mail-oo1-f71.google.com with SMTP id x65-20020a4a4144000000b002daa05165cfso4230224ooa.19
        for <llvm@lists.linux.dev>; Fri, 07 Jan 2022 12:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFO4WJY3j7pAXTu1RPPXXQTX/D3JtAjVln6pv17Se70=;
        b=7Vulje4xV+ojnVtDhAqWcS/GepDGz3HTuwke82uP1EVJsMk9gqxU482AtIt6WP97lc
         S3cbn8nGvyg+86rhPm6/jFZC9AElIA5kQSqxDXKMPDi5QUghXzYUUHSU+5MosIYZ0UQv
         IA4+cfX33Wc5O0umj6Z0TdD9t060G1XNq2ravgPhRy8dWMm4JU618OzOKbAZxJ+Xtix2
         LQtPb5VV0HScUyyiie5tq1plTDSOXhxNH31TKugikWDbG2x72S7TMxk3QWBGen68wN9P
         eqJBWnpnfW8MfJQq5ZwkHmScovZNE7ulWogSsQg/A6TPOPLY/OWktgggp7uVNLzbl6WE
         /9Kg==
X-Gm-Message-State: AOAM530cA8UGkpxa12Ryj8GKTDHJyUc+H4oLwb8aEjvtk53ArhLN5bLv
	S3vhilxkDLhVAZd2rgwPuBOB4Yio+3o9HifZVmvdBUqbVEhOQlXdwKRSmpTkdRlWgE61i1u0O0A
	HuRvj4xRFCyQ13Q==
X-Received: by 2002:a05:6830:2b14:: with SMTP id l20mr47451463otv.42.1641588585254;
        Fri, 07 Jan 2022 12:49:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoF/ZqeM2gXeI5h7MGTxjtgzAX2We+Kfkvc0DuwXwOA198L3Mc61AmDSUseGbyUBDzv34mkA==
X-Received: by 2002:a05:6830:2b14:: with SMTP id l20mr47451453otv.42.1641588585073;
        Fri, 07 Jan 2022 12:49:45 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id e4sm1133222oiy.12.2022.01.07.12.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 12:49:44 -0800 (PST)
From: trix@redhat.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: visconti: fix array's data insert check
Date: Fri,  7 Jan 2022 12:49:39 -0800
Message-Id: <20220107204939.3939151-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang build fails with
pll.c:292:20: error: address of array 'ctx->clk_data.hws' will
  always evaluate to 'true'
        if (ctx->clk_data.hws && id)
            ~~~~~~~~~~~~~~^~~ ~~

This check protects inserting into the clk_data.hws array.
clk_data is allocated a trailing element of the ctx struct.
If the ctx is ok, the ctx->clk_data.hws will be ok.

Change to checking if 'id' falls outside of the array
bounds.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/visconti/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 3b6e88bb73d5b..7f2e1016536ab 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -289,7 +289,7 @@ static void visconti_pll_add_lookup(struct visconti_pll_provider *ctx,
 				    struct clk_hw *hw_clk,
 				    unsigned int id)
 {
-	if (ctx->clk_data.hws && id)
+	if (id < ctx->clk_data.num)
 		ctx->clk_data.hws[id] = hw_clk;
 }
 
-- 
2.26.3

