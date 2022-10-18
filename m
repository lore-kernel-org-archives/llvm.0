Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66BB7B
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666088604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lGc1brklA5v9OUHTBe6S3k3fA4Qi2pTlNeYEp6W+HVI=;
	b=J0Bt+KMig5bkKLegzPYOcqljEyOWYC7QFIqtz+VQreLjRAQC0s0u5kfPEtu36XJS+o+l+t
	ksBKTZijcaLGXf9lYM8J5uEVUOin0j4jZxrQAunRfKQtH1QQRd4926LO7mG0vekXOyPMli
	fIhHfLrLHjymTYCf17+VkDah4YTCZzw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-KRFRPV2CMO-9Xk0VN-4-gA-1; Tue, 18 Oct 2022 06:23:23 -0400
X-MC-Unique: KRFRPV2CMO-9Xk0VN-4-gA-1
Received: by mail-pf1-f200.google.com with SMTP id s2-20020aa78282000000b00561ba8f77b4so7505470pfm.1
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 03:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGc1brklA5v9OUHTBe6S3k3fA4Qi2pTlNeYEp6W+HVI=;
        b=Q6ji56MBPmvmRiJoH5Hbgik8cONE01R6MD3Xw7IVQogsEQlvYZnRasP6Rwg6upN+2e
         RLmbbY4VGzdwcz48zr2dQEt3ZPt2LavU6ErT2CQg4VHOd1iV2c38aPAQXHmO8yiU1Abt
         C9AFQ3FBXlH1PT2/GJp129xOGiapTMPwjYodKPtvV4/vJ8iE6zA/nNUfv5gx9CS7LhlB
         dxTRngCEhyLfgKhYQJFv+ANo3/DwpnlxCpEkp3IA8rNJ1KL6v+KKvHAVuN3urDl2lKaT
         Z2px2MQ7Ds49JGXaR0afzGqUHFd5MIJLg6I1AGTOfV3ZI7MtJg7MSieTH34uDE+iYGUq
         e+KQ==
X-Gm-Message-State: ACrzQf19VH4+DWUowqJFvP5Jl0m9g2wqOVNBUYSXMr+Dam6MiLVYfdgH
	8EZUURRqAhvqTv8Q4Mu4oOYKFzm7yJEc7dcHS3IDMIzD8w4YtIopLq3z2wyj6sb63kiMCkEmJp0
	D8BRrQ2wTGvwY7g==
X-Received: by 2002:a17:90b:4a8a:b0:20d:8a4d:c2ae with SMTP id lp10-20020a17090b4a8a00b0020d8a4dc2aemr36943057pjb.179.1666088602213;
        Tue, 18 Oct 2022 03:23:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4yZEZ3zz/NaaPvomcA0q2fWZLeE26WLTAC0kzNafK9BiNR2Y6DRwutygGdqw7K1vCRk2VOgw==
X-Received: by 2002:a17:90b:4a8a:b0:20d:8a4d:c2ae with SMTP id lp10-20020a17090b4a8a00b0020d8a4dc2aemr36943033pjb.179.1666088601967;
        Tue, 18 Oct 2022 03:23:21 -0700 (PDT)
Received: from zeus.flets-east.jp ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090a4d4500b00205d85cfb30sm11173373pjh.20.2022.10.18.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:23:21 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: elver@google.com,
	dvyukov@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kcsan: Fix trivial typo in Kconfig help comments
Date: Tue, 18 Oct 2022 19:22:54 +0900
Message-Id: <20221018102254.2424506-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Fix trivial typo in Kconfig help comments in KCSAN_SKIP_WATCH and
KCSAN_SKIP_WATCH_RANDOMIZE

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 lib/Kconfig.kcsan | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 47a693c45864..375575a5a0e3 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -125,7 +125,7 @@ config KCSAN_SKIP_WATCH
 	default 4000
 	help
 	  The number of per-CPU memory operations to skip, before another
-	  watchpoint is set up, i.e. one in KCSAN_WATCH_SKIP per-CPU
+	  watchpoint is set up, i.e. one in KCSAN_SKIP_WATCH per-CPU
 	  memory operations are used to set up a watchpoint. A smaller value
 	  results in more aggressive race detection, whereas a larger value
 	  improves system performance at the cost of missing some races.
@@ -135,8 +135,8 @@ config KCSAN_SKIP_WATCH_RANDOMIZE
 	default y
 	help
 	  If instruction skip count should be randomized, where the maximum is
-	  KCSAN_WATCH_SKIP. If false, the chosen value is always
-	  KCSAN_WATCH_SKIP.
+	  KCSAN_SKIP_WATCH. If false, the chosen value is always
+	  KCSAN_SKIP_WATCH.
 
 config KCSAN_INTERRUPT_WATCHER
 	bool "Interruptible watchers" if !KCSAN_STRICT
-- 
2.37.3

