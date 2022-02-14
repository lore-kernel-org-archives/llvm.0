Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62934A2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644861105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sRClfikrb2SAycFi2aWUxJvEEU6PW+e2USfmkK1Iaug=;
	b=XviSr68nOxrbdbennGxQQjQrypAOLEhW1qkIVujCa3be2lxAAZhSJtwybSZbnb9AGt6Qce
	VlVx+oz36hig08c9Kd9jfiePd1rYBSETCMn//ISFiL0Yu27IUqrAQnnS13e2W8zSYO71EZ
	pcnPaoPWi+MTHGOMHnZj99L3VOYy824=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-HtdiNVVpPOCOKnsq9MuBAA-1; Mon, 14 Feb 2022 12:51:44 -0500
X-MC-Unique: HtdiNVVpPOCOKnsq9MuBAA-1
Received: by mail-oo1-f71.google.com with SMTP id g8-20020a4aa708000000b002e8efc514a6so11010784oom.12
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 09:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sRClfikrb2SAycFi2aWUxJvEEU6PW+e2USfmkK1Iaug=;
        b=1HJO0uFzAThrkyMAPiuj8pcCZlaxUJSETal3BuDq+m5klGYXon/VbkjY/i2V3R52ZQ
         C2IC5/SPfYGinfnGbmRPGU+qUjESdSygqeRnf67DNLLWjUVLhJ1zg2SUdx3GNi/Sj+FZ
         +xSiU3qcCreyazXIhV5CMWB6CNCv9Fzz5BRhZD3+THVQ4Z03c2dKgPUBRzggqOIw2S9T
         Nv3vxdeCZXQCTs+YTOmeKrlU/jUFKqPASFhONIGEyYkiCM48v8VIrpJqYsVZk8nKXw9v
         fFPetcgffLxGdoYSsr/HX6OaJYFdx0oF6xWkwB158ZMg4Dh9TBG8Av5V6KoyvaSe8Pl1
         ykyw==
X-Gm-Message-State: AOAM532PedYFidM/eXz5PYTu0qVoaD5d9EK2Jyz615x4I0TpyekvzFBG
	6/KqX2gxZKNkI25aETLWQhn+bWT4R/v9wQNTodMqn6tJDkXTWGSVdPPuH5f3MltdQc170UAb/ux
	+HuOEC6rxuRPyBA==
X-Received: by 2002:a9d:6e84:: with SMTP id a4mr18934otr.43.1644861103174;
        Mon, 14 Feb 2022 09:51:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcnHxTDhHzI4mHvMfEWEZ41qbHYDvsaNz05h/swvvbijMzbRD2lKpXlDtrTUoDdBuBcdn0Yg==
X-Received: by 2002:a9d:6e84:: with SMTP id a4mr18930otr.43.1644861102975;
        Mon, 14 Feb 2022 09:51:42 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w20sm12910024ooe.3.2022.02.14.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 09:51:42 -0800 (PST)
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
Subject: [PATCH] mctp: fix use after free
Date: Mon, 14 Feb 2022 09:51:38 -0800
Message-Id: <20220214175138.2902947-1-trix@redhat.com>
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

Fixes: 4a992bbd3650 ("mctp: Implement message fragmentation & reassembly")
Signed-off-by: Tom Rix <trix@redhat.com>
---
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

