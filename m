Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D27C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 21:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646427850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aB6Kk4CiP7ma9Bi5vpnU1x/1xVJ2+zGmFV9PkjhVvyE=;
	b=dB8AmjLbqsD2C0gDx/IC2EqzYkCOU0d2awYjnlTLcNFOST0j9J4tB62nOW7CcxVLQOUw4l
	4j9LclIIfPOuP4IuFrorMvav5d3i/rq/qvF6+8mH5SXGbQkoG9Pg3Pv4Y4AcTrciv15+81
	k9QkM/O96ND9ItA3Mt3BqstMVNWdZx4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-U4QYS8-ENDu3miFEJoP4SA-1; Fri, 04 Mar 2022 16:04:06 -0500
X-MC-Unique: U4QYS8-ENDu3miFEJoP4SA-1
Received: by mail-qk1-f198.google.com with SMTP id 7-20020a05620a048700b00648b76040f6so6543253qkr.9
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 13:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aB6Kk4CiP7ma9Bi5vpnU1x/1xVJ2+zGmFV9PkjhVvyE=;
        b=6abtWj0VEczRoqCbc5ihER1c43+964s1LhqT7T6kaX39rcJ2alOWe6df6lNy3neD60
         L1N0fRB2c/KtthdstsQSXcoH1IpS6dj2bWpkEtlC5gju/3cmr4wZu77W0Y/b4OAyUgta
         Hh96sUD1CVTXfcD7/H24VbJVrxCMmqUb2fExnsjeTj5fgG7UhnTtJt/vxBB593WGyF+H
         naE/HndjUSv2fR4zaOrppzMtWhJCmSUAAQ79nh/3f2IugfNKyZGm7rRY+b5ckbb3UzSe
         aC6Da2RFePLCidwpBfIvOM+o+L3Nngdutk2egiqBRp5LVahpMSIENvXzxPe/pEs+yj+b
         4DFw==
X-Gm-Message-State: AOAM532wkXOuGSJT7N3lNBWfz4ZJqIZ4HuxIIXGqU5SJSjKWcWg+QaSe
	CLZg8D+OHO+eJwhHHLzty3h6efwmaj7/YhBf8V2DZPuTz3VhXAEbKMW+QbS9mEhkecmGuF5HY7X
	LZ2rEiEnyFtWixQ==
X-Received: by 2002:ac8:7d0d:0:b0:2e0:4e16:d3e3 with SMTP id g13-20020ac87d0d000000b002e04e16d3e3mr596092qtb.140.1646427845905;
        Fri, 04 Mar 2022 13:04:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl8+Ou2jNdvl2lw+bUe6/hKRdnkUMPqvw52WVW8CnKDZfAXFw9zzSyaFkAoX7LqTGuVUhhjg==
X-Received: by 2002:ac8:7d0d:0:b0:2e0:4e16:d3e3 with SMTP id g13-20020ac87d0d000000b002e04e16d3e3mr596051qtb.140.1646427845459;
        Fri, 04 Mar 2022 13:04:05 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d15-20020a05622a15cf00b002de711a190bsm4066708qty.71.2022.03.04.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 13:04:05 -0800 (PST)
From: trix@redhat.com
To: jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ville.syrjala@linux.intel.com,
	matthew.d.roper@intel.com,
	lucas.demarchi@intel.com,
	airlied@redhat.com,
	imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/i915: rework the error handling in *_dpll_params
Date: Fri,  4 Mar 2022 13:03:55 -0800
Message-Id: <20220304210355.608898-1-trix@redhat.com>
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

Clang static analysis reports this issue
intel_dpll.c:472:31: warning: The left operand of '-'
  is a garbage value [core.UndefinedBinaryOperatorResult]
  this_err = abs(clock.dot - target);
                 ~~~~~~~~~ ^

In a loop clock.dot is set on successful call to
i9xx_calc_dpll_params().  If the call fails, the later
*is_valid() will use the previous loop's clock.dot.

The *_dpll_params functions return an arithmetic statement
with the clock.dot as the variable.  Change the error handler
to set clock.dot to 0 and jump to the return statement.

Fixes: dccbea3b0704 ("drm/i915: calculate the port clock rate along with other PLL params")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 32 ++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 0ae37fdbf2a5b..ba7cada704288 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -309,11 +309,13 @@ int pnv_calc_dpll_params(int refclk, struct dpll *clock)
 {
 	clock->m = clock->m2 + 2;
 	clock->p = clock->p1 * clock->p2;
-	if (WARN_ON(clock->n == 0 || clock->p == 0))
-		return 0;
+	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
+		clock->dot = 0;
+		goto end;
+	}
 	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n);
 	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
-
+end:
 	return clock->dot;
 }
 
@@ -326,11 +328,13 @@ int i9xx_calc_dpll_params(int refclk, struct dpll *clock)
 {
 	clock->m = i9xx_dpll_compute_m(clock);
 	clock->p = clock->p1 * clock->p2;
-	if (WARN_ON(clock->n + 2 == 0 || clock->p == 0))
-		return 0;
+	if (WARN_ON(clock->n + 2 == 0 || clock->p == 0)) {
+		clock->dot = 0;
+		goto end;
+	}
 	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n + 2);
 	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
-
+end:
 	return clock->dot;
 }
 
@@ -338,11 +342,13 @@ int vlv_calc_dpll_params(int refclk, struct dpll *clock)
 {
 	clock->m = clock->m1 * clock->m2;
 	clock->p = clock->p1 * clock->p2;
-	if (WARN_ON(clock->n == 0 || clock->p == 0))
-		return 0;
+	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
+		clock->dot = 0;
+		goto end;
+	}
 	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n);
 	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
-
+end:
 	return clock->dot / 5;
 }
 
@@ -350,12 +356,14 @@ int chv_calc_dpll_params(int refclk, struct dpll *clock)
 {
 	clock->m = clock->m1 * clock->m2;
 	clock->p = clock->p1 * clock->p2;
-	if (WARN_ON(clock->n == 0 || clock->p == 0))
-		return 0;
+	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
+		clock->dot = 0;
+		goto end;
+	}
 	clock->vco = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(refclk, clock->m),
 					   clock->n << 22);
 	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
-
+end:
 	return clock->dot / 5;
 }
 
-- 
2.26.3

