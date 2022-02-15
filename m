Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068131164
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644890750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rcVCDBo5DVaghZVQQl2zbGTyQ7E+laKLLxGgEjqHxnk=;
	b=cMP1hLngHF5dBY6Kiv615qCEwj0aHnyQ9HUNmpOPLeBR9lZUczKsbZ/FZxkVpqldvKfGZf
	p/cggVPq/Kz0lVmrfB6BOXLNi5ZxaBLTVcRItKXphAelV04cIk8uXip91RglFD/A8byr+A
	rYB+NJbRWNe6DRK+0f4RwoSAeWffvRM=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-wIhril9VNpmReuh9hwkF1Q-1; Mon, 14 Feb 2022 21:05:47 -0500
X-MC-Unique: wIhril9VNpmReuh9hwkF1Q-1
Received: by mail-oo1-f69.google.com with SMTP id bb33-20020a056820162100b0031619149c44so11676665oob.5
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rcVCDBo5DVaghZVQQl2zbGTyQ7E+laKLLxGgEjqHxnk=;
        b=U/yQ1ECVy+By6HTp5LlUvxMS5wSOlaVXkIG0hazsiKGiuzlPJ6bUAGHbkVl6KfEQFv
         bLZ/EwyFHidq0LThb+hPwikZxVWa2IsNMka8ydm7C4X4sV08sPqjU65M8B09l7eJEO6h
         JHaJ79DrJUVJRuFYhypjJpA242fj9vKzG77+o7b/mwASOt1vu4BNtLzobep/WU7m4qhG
         UNlAxGIVKRTmyHzVezuJ2QM43W9lEepw2Mo6p1hUAgHnOXxJG4WIYkcaNNWZtCAm8PBK
         pj7KwN2KzPRmpcRXQwVBAInupWrtFiEact+5DiD7HiG1AmykKd40y8NTOfnvuuvAPbST
         7J+w==
X-Gm-Message-State: AOAM531FmFiQb+UAnrZMSolRxzoK056ALkFmojj2cn6yxjY2wJ3ogtFu
	oW5BE4eucwTrV40Lmv5MjFUzmetK8rxgKRGyHjeiNcb3EG8WzOVyIjWAdbSE/7OLFPrkAK3HqyI
	PZH06lv9PeKwXmw==
X-Received: by 2002:a05:6830:4113:: with SMTP id w19mr688311ott.120.1644890746756;
        Mon, 14 Feb 2022 18:05:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEs/cQG7EnoAYBz/PX072UhjyPsRpX8PJZ5Lr3Q9WSLBCh3TgTI0hgly/YAlr42AGrYmPADg==
X-Received: by 2002:a05:6830:4113:: with SMTP id w19mr688302ott.120.1644890746552;
        Mon, 14 Feb 2022 18:05:46 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r41sm14527325oap.2.2022.02.14.18.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 18:05:46 -0800 (PST)
From: trix@redhat.com
To: jk@codeconstruct.com.au,
	matt@codeconstruct.com.au,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] mctp: fix use after free
Date: Mon, 14 Feb 2022 18:05:41 -0800
Message-Id: <20220215020541.2944949-1-trix@redhat.com>
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

Clang static analysis reports this problem
route.c:425:4: warning: Use of memory after it is freed
  trace_mctp_key_acquire(key);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
When mctp_key_add() fails, key is freed but then is later
used in trace_mctp_key_acquire().  Add an else statement
to use the key only when mctp_key_add() is successful.

Fixes: 4f9e1ba6de45 ("mctp: Add tracepoints for tag/key handling")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: change the Fixes: line

 net/mctp/route.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index 17e3482aa770..0c4c56e1bd6e 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -419,13 +419,14 @@ static int mctp_route_input(struct mctp_route *route, struct sk_buff *skb)
 			 * this function.
 			 */
 			rc = mctp_key_add(key, msk);
-			if (rc)
+			if (rc) {
 				kfree(key);
+			} else {
+				trace_mctp_key_acquire(key);
 
-			trace_mctp_key_acquire(key);
-
-			/* we don't need to release key->lock on exit */
-			mctp_key_unref(key);
+				/* we don't need to release key->lock on exit */
+				mctp_key_unref(key);
+			}
 			key = NULL;
 
 		} else {
-- 
2.26.3

