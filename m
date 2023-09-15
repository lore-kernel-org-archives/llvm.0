Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F21B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:14:16 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c43b4b02c1so7454285ad.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808856; x=1695413656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9t4c7iG7BwJixU6psOPlOQYO3J4oZ/NM5PDqz6Jeo04=;
        b=YgRd6n/fKL/oPE7NqctKiD2yg7mZqXCK2Biabn2I1WhRcYZVetIGS57dTpUR9A0CZN
         kgU67ak9wk8letx/8AycRFNf7FT2nQOKyNEnIVaKjWhV3iEqors0NQa6xBv7VYFdYptR
         jj1C73ow1A+r3EqKqaPLDPuEyZpH9oPCR6kEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808856; x=1695413656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t4c7iG7BwJixU6psOPlOQYO3J4oZ/NM5PDqz6Jeo04=;
        b=kw0j8LDpArTBN958vQPxdyW7jx3rH4KLRyjvaI81XQd5/1QW/KLA6vxRuvc6oXQZX0
         F1Ii1VQuJL8GfeipaXli9EiBny4TFQQbIVGRPA1zF8ytCeNWKKgt2OzoQXeIaczWaeEZ
         pU4otNAEr5qDsjRgjEJxPA8P6Bz9vTcSAmKIYY1whbGUzJMRliug9Flcwwdd5NTHe7VJ
         kUhlybvzS9ehNMJI5xppLZeVVKG47HTF2jCkLoNm2y3ABM6GEZXP93sLqbwiIkutWuK3
         Kgjt0rIGuC/7OVONUsWAD2tif7zjIz1ScqpvDwFWKtcvJm1WZrsZtcFvJOWerK7oL6nh
         ZtEw==
X-Gm-Message-State: AOJu0YwErUij0IMbM8v3/2E4MelE5e3pN44eMsd2F89aT7zqLEtg5wrt
	QTkUWN/r/ktaCndAH/a/6zMyXg==
X-Google-Smtp-Source: AGHT+IGgXyGAghZv7pszt8rqPpCweXXdiMo6SZzmmUtM+9AUGmv0Zkuf+i1pa/kjEbWVyhBGaegRbw==
X-Received: by 2002:a17:902:8691:b0:1c4:a16:f88f with SMTP id g17-20020a170902869100b001c40a16f88fmr2591006plo.36.1694808855939;
        Fri, 15 Sep 2023 13:14:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id kg14-20020a170903060e00b001c41e1e9ca7sm3059479plb.215.2023.09.15.13.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:14:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Kees Cook <keescook@chromium.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] aio: Annotate struct kioctx_table with __counted_by
Date: Fri, 15 Sep 2023 13:14:14 -0700
Message-Id: <20230915201413.never.881-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=keescook@chromium.org;
 h=from:subject:message-id; bh=1qAoiZuMRAuvDZRUcSDPW5lLo0Ae9xZ4UiTXDEh1mTE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLsWaTUS2aPe9DYGUrDZPo05lmzAICnFfTNt4
 TuHABaIVB+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS7FgAKCRCJcvTf3G3A
 JoNvD/wI9Ez/xecwMst1xwqWO5PzTIz1ZADRxzr2MoMrg+bF+zVBEO3uiWXoI4pY9farlKnMZOW
 F5S+SAgyURn2G3c6PN1WVEuc3Y9424hN2if8MTSVs0Nbk2EYZYm06r4Douy2vRy0YkSAWpssZ4v
 kymW916TdLMSRQ/VlhTwIqb/EogyHshGE7Zu0yDtUhDbfNo/bgJHm1Eb6BVnfWOYPkexC2wepRA
 /2J8yT+u4nZPjAW/UCwuRiP1zLd+xRXCtOQ9gm8mzijyKmqsRVlbzYa5UgI1Qr2byEv0P+KjR+K
 y6G/DhhriaqRy0FKJe0VObtQR56fWtLn/iUbIXW1qHAqKOVt3+/Xx/Qy+k6d9q+FucGZchog81Y
 2br884EAL0MMUhCaLcwaFg4xWRh29AeG8bLDSSNwC9EIOIo6FlJdiPX8HsYfDRb2OkHYBrsCpUi
 suZXovmTwkZpy/XU8KHgnb7LmtJc2yZDea0oHJJbmJudfvmiUROsu2gT6uXwwCfFTZxacyfSznc
 ASqN8epE+clvMgEB/6HAUJXqXXb33j045MB2iUYymLfTnXHdblZnb/8GXLjn8Vs2KlOKemgOj3C
 lfmwn7j/b71qoQYPbLyXrt6loyYO6Zx7zzMnblLcq56S/LCrSIUYj5v7p70QXU/45+14jBKbzhy
 hj/G1EM dIHavvSg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct kioctx_table.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Benjamin LaHaise <bcrl@kvack.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-aio@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index a4c2a6bac72c..f8589caef9c1 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -80,7 +80,7 @@ struct aio_ring {
 struct kioctx_table {
 	struct rcu_head		rcu;
 	unsigned		nr;
-	struct kioctx __rcu	*table[];
+	struct kioctx __rcu	*table[] __counted_by(nr);
 };
 
 struct kioctx_cpu {
-- 
2.34.1

