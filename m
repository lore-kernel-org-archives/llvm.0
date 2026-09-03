Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9E3A4F26
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467864; cv=none; b=fQI2bXz549yfXF/lZaES7MGIyPjstFU2d9ZraeOipFK9OJmEc/UXMpaGPHc2NfrE5R8oqqp/4DGN0lkPGA3BG5mu0BbxoGIY56kCY6VamYUKdXE2tDOmF7L5EnppUzx5Hv/Pp7J0Wnqqyokz+SMTVK3h9Ncy48pRW7qsafgsapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467864; c=relaxed/simple;
	bh=O/xPPZ+sVVTaOOmEwsa+8rqbwM5fmRoimhLyr+2P6bA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VOwx3EWVcw/sWFEfbZXLJ+zVSZ19Meqom2GCJV/8pgd4W/jtzkRjRqRo+MEDwmNiSrHNVGGOQXudBxfT3L0YywfYbzOSKRo4zq2WSK58O+mbgN5OxYJtPN2xr9AP4Xul+EH1pKtDzr8ss3V7SQNZJwZXfRMi8iaSffIdvZk4qqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+JGDu+r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+JGDu+r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so2265285e9.2
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467853; x=1789072653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=U+JGDu+rK3FZLvvW59FY6BONO14S92B3G8jR06DfoZmXsCOmJeiCI4s3e1gnA/BjYs
         +uDkZ+/+9XuvL6luvwN/dQUvR53VGmYUfzNRLfU1ZvrcqBEMIpQPoXElazC7E2xBQTh9
         eqlIiY06utCMC25ejVgq1x0a9mb0Xd5UBjUoGK2Yy3g6nT3TskT5roQo0DkG4dlebMAq
         oksodiZU/5yV7cC2Cw04u+ZDVfW4XEfR4nPJJQFS5xCsINBdIRQFSjW1K1NXXFYLVzde
         SRsy2QYjYWzr7F0CwTnhMIUvOnlWYjfQheAJIzQatS3vt+l6Fu2L2Poq5fjJkVJLEv7E
         ga0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467853; x=1789072653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=k4js27qfLbmcjH1xySQ2UJ7Q6Kkbcz0GDbZ66VdORCTdK/TgizxjqZ1qVKl/q77Crt
         4KLzS851l3vXw3mHac4indNObA+9F32t8mz+DultsXae8GCCfp8AddHbXSOj7N8b77DX
         Q7We4rnSlrzzQ0yTESO0mMLHOkypGjCXZnohSwAEaOH/eQy3zU5KqL6NsrgT8B/ZbcAv
         gUF+nolQQ8nD7wujJPrAXbrqFSOp09AO0GDvmnzcdR5Bc/T0LKr1fjdjc3x47Nfhgifg
         1ZzupgINyo981QPirLgXGa6j+Eq66YGESdEXzpfE85wToi+dSff9zJxPJzbbu5yjitb7
         tWlg==
X-Forwarded-Encrypted: i=1; AKwUvBwWfaTm2H9BDtBoWkyf1yOxi/fkUZZJ8NSocGuP04tzKDWwtPaoRphUeSbg0G3q3/TPCO9b@lists.linux.dev
X-Gm-Message-State: AFuF++kdo58j5g/MRUrE9iyP+b6brQ1bsnzJc2I541lFcag6vFFavxOd
	4w3aS2PDgK0Q3MU+pYpTgI8TrGaXSCFZFrQSfhhZ1YBiU6OTuLWGe76s
X-Gm-Gg: AYBFou1tVJIEwofMYOEJo0+1m2jFCsrs2jVlYW3Ye8CwpKqrXtp3d8Weg/DlEPCDESh
	jlwbPaoKsxifW2y1OjL7O3DTMjz5Qj2S2wOxa1tOxniy6DY11he7e1Qys66zCLeiQdlBKn+WUfr
	aQ0d6tHIRL5oKw1d93rnpg9sFHciHqUJssLQhoLaT+5wOLDV53IWUXm+Gl82/wlVrLQQILx4ikI
	V5BXHHhp5p6OGwLzT5iC4oEIkX/oSL5AOnlX8OWKw9XFnBZAoM9ik87vmY/6I/XDR56DN/x94wU
	3vM1RvR6YCl5eofwQy1t79ext5l5dMN+VGb9J7VYFtfoQNAyIVQbzJiXx/Z1gRS/Ql21I685cVc
	Z2ysbNVMuIedIv/BO/A1lNbHOeMmICoDvQR5qQyviyUm7YX3vjz13q8CvLgesTJzY9IyX0piWTx
	varshelFBFNnpOvrefRtedI7a5FleMBWnR7XT1QcJYBJ4z05j8uWeLe/ixUXfDRkDCFkRCyIkP8
	ygPSILyf3vLofish0RONiNSgBfjXbCbJc89AqPr89F6z8P5f0Y0AX1fjpUDh6W7x8nxgvvcBg4a
	+YsqIS5qx2v84mvyVGLv740fWg9I+TL7hIeGqK1+YGqQuzHcu/f2xOFID/GFZwQW6Mf58Hkxtqj
	3VnqWWWrZD93tZ+Sv
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr8535635e9.3.1788467852848;
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened usercopy
Date: Thu,  3 Sep 2026 22:37:18 +0200
Message-Id: <20260903203720.63689-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing an ERR_PTR to kfree() currently reaches virt_to_page() and may
fault. Warn and return instead, leaving the bad caller visible without
using the pointer as allocator metadata.

Also reject ERR_PTR values in hardened usercopy. Keep both checks
separate from ZERO_OR_NULL_PTR(), whose exact matching is required by
krealloc().

Link: https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com
Link: https://lore.kernel.org/r/202608111716.0FA9DB17@keescook
Link: https://github.com/KSPP/linux/issues/93
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/slub.c     | 3 +++
 mm/usercopy.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..027b44dd7f07 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6780,6 +6780,9 @@ void kfree(const void *object)
 	if (unlikely(ZERO_OR_NULL_PTR(object)))
 		return;
 
+	if (WARN_ON(IS_ERR(object)))
+		return;
+
 	page = virt_to_page(object);
 	slab = page_slab(page);
 	if (!slab) {
diff --git a/mm/usercopy.c b/mm/usercopy.c
index 5de7a518b1b1..c8d8703544c6 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -157,6 +157,9 @@ static inline void check_bogus_address(const unsigned long ptr, unsigned long n,
 	/* Reject if NULL or ZERO-allocation. */
 	if (ZERO_OR_NULL_PTR(ptr))
 		usercopy_abort("null address", NULL, to_user, ptr, n);
+
+	if (IS_ERR_VALUE(ptr))
+		usercopy_abort("ERR_PTR", NULL, to_user, ptr, n);
 }
 
 static inline void check_heap_object(const void *ptr, unsigned long n,
-- 
2.53.0

