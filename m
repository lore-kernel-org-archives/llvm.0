Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD563FE671
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786192664; cv=none; b=OAJVfUI9RD+z7DVQtQcHcOYqOdRJ4N+WzxjzlDcCB7DP8lmF+9zJreQuR0e8c/8aj+PUQJULf0qURwwgt3VB08EncWpz2xecQ8BF8stiQxP21TmZiJu0NhesaJRSJqKQWuNox+bquWpN/3sPP6iCO2xJw992Iop2CUC8nMOuwRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786192664; c=relaxed/simple;
	bh=RqRHYXtn8FisZ01HMrvTbRfRn3mNCwRVEkgXUAePc10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KAcL3Fi45ReteHxlLb69l0zHXTrnAwVV3e9Qtl7kUneChWUlwHfmuv7XtgReP/V5XoCqyGIjc2E7ibMnLsZmaGetk4j2LZRgL31Sq6cNIRe7GSeUm3PFpWyBTKuWUQQAAJZQirGg6ysY0ZMf90pAk59lII6IZwlilu2LVKj002U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGxObPU2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGxObPU2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-496b7622a83so3096175e9.2
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786192655; x=1786797455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIZDIewqCLitlr4qDMX+fEccbng/+DjCUrRt/C3FKec=;
        b=EGxObPU22rlUnBbPDg9Xg5DDrjGORa0yIPS70y6G4qBvmcT+aBer9P+/SIUlgDAeco
         eLrusK3WcyqlIWvfBNMoacRUoWe5wZenwWc+e6ZsaGvVDANfg1pENGvwx7MQbEQQyaI0
         QsGn0T3v8TY0tv8OFgyV8TZsZ4Wb2fuxadWfFp2SGV8ExJiLMGyPcKPaKjPgiLIoM3QO
         6S/B6kUSrrlxtPWmRq4+0FipEsL5MiPvqauJ4rCqZU/EURlJHfesBhCLEeVewTtBpWEa
         Deztp8Szlfkog4Usz2ux3YBMGbjuKbzyn+cuI+AOmEQudDg9THXKfZ+KY6m9/geYR40Z
         X+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786192655; x=1786797455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIZDIewqCLitlr4qDMX+fEccbng/+DjCUrRt/C3FKec=;
        b=BW4mwocOapvUEXWZItn6g8MTbVNf1lZOrCrC6O+x2fkbiaHuuYOH5/42+FbWad0zUP
         DuemT98QeeNKdRgT3hF+HayKjWkMjiKJtkWPFpd2mfBA+HjiRFwL98jn8PdykSMYnf41
         bJ7UeDONop5ILj4QNDrdsjn7a9VN2GDuuE0+Dl98Gn7a9Xbepz33Tl+pteyF4bP3LhF1
         6kSguA1qnQldJ3R3VUSMJiLxODlX7PfKZB695b6aMLYQMkIrOURDAAFT4H6wo0IRTBK6
         BS1MlozM8e0bxegpVLuvD5byx5uaE0fVEprK7C2xjtqq6CmSfyU7B3hv+gyxEaBeJHEa
         lPrw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3qjUnNzGRuOJFCKoSdpnuHLEMSrSYtWrCp9cCHV/iXAb4MDNjnQ+qsbdPftWUBy5n3LTG@lists.linux.dev
X-Gm-Message-State: AOJu0YwFFg09I+WSX8bEBkre3faSQmOY689hnRan5IX9Od/cA+CO8wb4
	DFILf7rEoUEBHTGDSVQQc5rNB4yVvBVFhkaF7l7XBVfYK0G3Nmi+0ZkI
X-Gm-Gg: AR+sD11NS18JvSQjJGQnNiiFkt5n7aWiroLrBpELGlB6RDVAbzy/KtBHTzCHX4G+PYk
	+PiXzuZMOneGxxL9mftMNhbQ4yPfyDqeLfrC4A83Eg1EiUKta1kNWK566e/PWBaDmGpnGMJ7MTG
	PM4gUOIwN81Za/8h+x98IPZnr7f+mCoTeSw6GaB3d1pvQPasnC00tydrOdANLrkzrzFRYWizISm
	UNLrP22yxE2U3nRuJ2R9BoOVilGcVRsFnKX9+thRiyX8LUcCQUMhOzdlyeXuvI7+zf2sFKFiU5c
	6STAkcJX4myug/Jthakie+texVYIgu3czTMQtBR0PPZ4mo81foeF19Hsonspt7uEdQYLIBEl9kR
	iDPXMIcX75+tHv0Jv/ZOeMeTyhFliwxgXmacYNtBT1KGbNBfmUOjozMF5jHO6zVfHhl2iL4tiEa
	DmBcXjrmZI0cuBRWI2950tPfCTZXzdukIBa//pjJwcB64Ur2OfERHgWMyUJ4fF2jy7/TOpJOY9u
	2+p39EI4L8olKg9eu/+3TJvLK3OJS84vzJCSO9pl65EHCnjN2MfjHRr3xotWTTaYdGSxFj3TG8W
	qw0SJOd/qb5MCDImKb4u
X-Received: by 2002:a05:600c:83cf:b0:499:621a:b934 with SMTP id 5b1f17b1804b1-499621ab9f0mr79508745e9.17.1786192655175;
        Sat, 08 Aug 2026 05:37:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f0230sm118673445e9.6.2026.08.08.05.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 05:37:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] lib/interval_tree: fix allocation warning messages
Date: Sat,  8 Aug 2026 14:36:08 +0200
Message-Id: <20260808123608.73613-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WARN_ON_ONCE() takes a condition, not a message. The string literals
are always true, so the warnings still trigger but the messages are
never printed.

Use WARN_ONCE(1, ...) instead to print the messages and keep the
once-only behavior.

Found with a Coccinelle script. Clang's -Wstring-conversion also flags
such calls but is not enabled in kernel builds.

Fixes: 82114e45131f ("lib/interval_tree: add test case for interval_tree_iter_xxx() helpers")
Assisted-by: Claude:claude-fable-5 coccinelle
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/interval_tree_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index eba2d3e28980..b0b07270ce7c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -140,13 +140,13 @@ static int intersection_range_check(void)
 
 	intxn1 = bitmap_alloc(nnodes, GFP_KERNEL);
 	if (!intxn1) {
-		WARN_ON_ONCE("Failed to allocate intxn1\n");
+		WARN_ONCE(1, "Failed to allocate intxn1\n");
 		return -ENOMEM;
 	}
 
 	intxn2 = bitmap_alloc(nnodes, GFP_KERNEL);
 	if (!intxn2) {
-		WARN_ON_ONCE("Failed to allocate intxn2\n");
+		WARN_ONCE(1, "Failed to allocate intxn2\n");
 		bitmap_free(intxn1);
 		return -ENOMEM;
 	}
-- 
2.39.5 (Apple Git-154)

