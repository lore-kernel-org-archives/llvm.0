Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC23DA7E9
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070707; cv=none; b=KxTnSdJ3q33J4sacUUVHhfvYPuV8u6rvq76w8tZytTOexchPEtqJLa0o5SoYmNVXnfFECkhhbnreDjNi6mAxvC7a8bw+PM6G0WUWIglkKKY4TMJtd+jXvE6rSLo/wblp4Eo2fOLxG6B3iw1MEvLfNp6dpIN2zL/AeQLbyB1p2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070707; c=relaxed/simple;
	bh=HCadxe/Rwbd87AFTR5D290CpMYjGk6Bt++YuJeUe6KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/29RZNBoBVd0EVoU+PSylN/OTx5gh5mC9OIAEGuSmEqmXse0pPuXOk/6HyR3cVmaTURPo96SyB828avEf4u6KAYhecrPZoqVu9H3fnwSxaU504wmpLbS25Ns9QtIbPzaWsWL74xdrDBHAgisXRvV0xaCHvZGldb/VlXKaYH0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIlqhP7N; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIlqhP7N"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82987437624so2194922b3a.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773070706; x=1773675506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X57U0V4sSgYCWSfpV3skueJqwmOEXkvkQbQCoj2ilaY=;
        b=bIlqhP7Nhi9T/TMpegrgPhPL/Ujj+caMYugelQ+1BAGwk6ihv8oobENmuhor+XfH1f
         S+U6cOGkmvTW5yIBF2UDqQoI3QUsGJK5hQlM0SXjp9TsYHiDq1L30XnNZhyijDHsBO9p
         hJhWGrHkbF0Y0bG1V4jSDgrH8bPAVAzQJf5G6YTISr7pozERKLKQ9NDcXQ6M+DyZtoCy
         zHdljgRpDRnF2syLDd0QJV9mwm+Hq1tOysbkpsc56ZQlxisKWKqmr/CPAiJCS21dEiVZ
         3UtcJRwRzDeYdMtOoDHBLfjXJpqlWdn8twz4y86C/Bo+cRtmhyiCTzu9dezZ0KjoZU0M
         frPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070706; x=1773675506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X57U0V4sSgYCWSfpV3skueJqwmOEXkvkQbQCoj2ilaY=;
        b=VvkAei2UmPhJeQ844IlGE4O87eJh/9rREEBp/fX4E0Bu+UyuDhbTF/JdfxcRzRy4Is
         iAQqxMjXAdFMwVSZTlP4Njyqa+jD/9scF0quaayCuR21m6pzO3n7MH8vEj809Nq6IGGA
         blvkojrdGbtinbadVVKOM2NRcXQCCLM22L38RObxE42TQlo6HbbL6xe2mZXnuIABnZBC
         RSEx++AcpIMMDQrYPqLHdlycV226v6BBxcjufq1Hno57BMFYAPuvwSwuOoERb5lDO6Lq
         ptRC6a70TkQivcSlQx+JBDbOEl9y7/WSUbYCtHSQ7RHsph/tQaVXiXtizZbqJjeSUcR3
         K3qw==
X-Forwarded-Encrypted: i=1; AJvYcCXkynA4el2VqkCn8kE4oJqmuWVu5+Hp3oDxWHeG3AaVTHhjO8l0LCWfO66p9c2enapzjLyP@lists.linux.dev
X-Gm-Message-State: AOJu0YxBI80ZOM41Z19wxqwM+ldDtmZX/XxzH6ifvAEcfgQNdlS8Sjfa
	cI8RUHFIsgYdelj7v2Y5S5jzyt5hsPZ6YwE12003E/GagAzG/LxMFs2b
X-Gm-Gg: ATEYQzyPsuYooZzSrNxbI9eG2f3wWbDs1uZhYYENxLJMmAiozY1j9ShndkMHxi0k97Y
	64v7DG4xcujZKq6Ol0HrrFFvE4f456/KhKmX0OSZxhwjpOIQUE/tWr52fF0hgw49lqvUTINnLNU
	0ltr9BWTc0Hy7ve3/VfLX4AF3X+znGU4Ta9o3aL72Sf5VcicukFf0nkpKTVZY7rJc+OdqnDXbm/
	7Hj6sNKlvWgGYTeSea0xGcJ6cWJPL0ESr4mfZi3q2NaV6uDTtf5GmVk0gMFUNdbfh4bF4+kPU7c
	w1W4iDHgJwtXIypwLjRXEpZ72IrYJKNd9z/9AuvPuiGrsimJk1g2+BUUeAOjRFEtE6iQP7ucH+V
	1AWkLsiU5f8uHDso2xvRnvN4F90TOSdAC66pnTj11JR36c7RuBFWbMG4bdPsprPs4k2KnA66qXM
	hgj03WKEN4bax36sNSORShmmRUsSfzFZMXIblwj+WNGx4=
X-Received: by 2002:a05:6a00:b92:b0:829:751b:4b06 with SMTP id d2e1a72fcca58-829e4045bc1mr13470b3a.21.1773070705549;
        Mon, 09 Mar 2026 08:38:25 -0700 (PDT)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a54cesm10516486b3a.48.2026.03.09.08.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:38:25 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: rppt@kernel.org,
	david.laight.linux@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Date: Mon,  9 Mar 2026 23:38:11 +0800
Message-ID: <20260309153811.40958-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As shown in the commit message of commit 242b872239f6a7deacbc
("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
the code "unlikely(a && b)" may generate poor assembly code if it is
actually "unlikely(a) && unlikely(b)" or "unlikely(a) && b".

WARN_ON_ONCE_GFP() may be used in the hot path code:
1. The argument cond shoud be unlikely.
2. When "1." is true, !(gfp & __GFP_NOWARN) is unlikely, otherwise, a
   WARN may be triggered, which is a very unlikely case.
3. When "1. && 2." is true, just like the implementation of WARN_ONCE(),
   !__warned can be unlikely.

Reorder __ret_warn_once judgement to first and split out the unlikely()
in WARN_ON_ONCE_GFP() to optimize performance.

Cc: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 mm/internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 6e1162e13289..49d2b7a270d3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -93,7 +93,8 @@ struct pagetable_move_control {
 	static bool __section(".data..once") __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
-	if (unlikely(!(gfp & __GFP_NOWARN) && __ret_warn_once && !__warned)) { \
+	if (unlikely(__ret_warn_once) &&				\
+	    unlikely(!(gfp & __GFP_NOWARN)) && unlikely(!__warned)) {	\
 		__warned = true;					\
 		WARN_ON(1);						\
 	}								\
-- 
2.53.0

