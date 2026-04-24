Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77302344D81
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009701; cv=none; b=nvU9VI40ZSuYSs1G0WmIEJbf9lunzqmDlt9eV46Xg0bN6c35E1jnBraYVQctfGE6Dj9D9lSBkRs7DXfSeLOe5dy0YtR0lVVNW4MnIs9YwBDFW9ZQKSGisvxWyv5nEOveBGYfkaNGXAFJs57tPbxqst4CTt4/TuMxUBG7AlyRGts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009701; c=relaxed/simple;
	bh=5AskzqVicAC9flZ1LjZUxvbxlBf3jPZH4cwWbVOrA3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR5bbBKXiF6IwhhDClLloWY02o5GnT5HTTmtSNAAZl1AWrf+ATIhUU7Lkux5jr2ZIHmj4XmHYe+tIvwRX5XCWzG8gK/USzMEtzOTV62gL6m+b9yxEuZX+zCF/oh4CvN/M6dZST9ps0iTUyya5DSN3yRyOnmmI9E6StKXHP58WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdsB3wfh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdsB3wfh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad21f437eeso48824855ad.0
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009700; x=1777614500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=HdsB3wfhHkEut2yk1wymj/SfodpTxrwShKqR7rNOoRScPI3hWnecrr3iavIk8PVxLk
         tmjtMhIcE1oLfnTnDJK3/zjd2Y3vMN1zjj5F6bsvjnb3oZedVVTnRXbFUWl/uryP0QH2
         n/la+xQdqVHSkFfYHI4KcjdYbFeSnuAxmPlii3iiiy3WDD1LRroPcVqv0o8pmR1Lwryf
         DGRobt/+/amj0BgWLZDdl2n0rQRdTEE+t75vN87KwxLAg+5zac/vLrIkqz//dwX+Me/1
         130m+27DjSuRerITNb3c5DT5vvoHSUabNKBG7metPlUYH4tKMe8/Xh6eOl22Q/b4uiWg
         6iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009700; x=1777614500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=EEI/a8rOACNf/1L5uB+EUm4t6JXQYvHd8Cepo7FqRTWKbcF79xqqgwNfA6aE40rXGI
         gorYkqb/P9c/3uLD94o+x1YVwTQUHn/+yap5hHcvLqCd4ifJew4q4/dJBvG+pJSr/zWd
         CkTmBa6Bj/RM8y4X6MG+R4ZXdb0oVmXeQ5POWfKAJZsXoBjdQVV/l8mfOZOnCMoA6Z7G
         V2jDzHP+vYd8xvsNedkFIoBuH52urELExs0OYJpmA5hu3I+kxxdfq+3o47LSge3JbOxY
         c0buRZoVhXiBuUoVHTq7Xe3GJkok0PNbwKOzKa257gf1bClSdMEgwgLMsDwvj5DV3Zy+
         UNIw==
X-Forwarded-Encrypted: i=1; AFNElJ8vixmS4I+31p7ufXvRxIMcgfUI8lBVq6cpp5MpUe3jT1M7rQS+VZQRx+WVzzwLwr5WtMah@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0jSuTHGp0eyenKPYvlHBg2ZhLZWY8G7Uspo+zlzzFlJwcPqZA
	+0bK0qA0U+gE2ou/vd09oWbOYfChbtsTPzNSNAZJKT0jLWwE9MNjWm6Y
X-Gm-Gg: AeBDiet+YCHm9xHfbAI5viGOG2hSXHwhW0GLGaGwERSRr19qZA0+30ltrSMuT8W0oQi
	UqDNhzvnyMZgnQuFQOSe786lTtRE3hdOFUoDw+rj0F29CrT6jjJ4Lx9f6MXC9XMRC03NXpUZLVR
	L4Ied1M2wrx7tPMiHQa7oon+peVksrZopWQWe2xONPzvsAtUx0cVqZ+wqA0SJw+Aj7UYtrya2uo
	+CzOxthhs9Jz0TOxIswt8YyrsEqZTvB6QY0m7cPhWI6rQmbwq4V8VChVeS912s/Qi1hBCw0hQ6v
	w9CWXQIbwIplS2QRlYYKDnOxpvcX6ZhwXd4SyxrwkmUnBWtXY6p/YdqjNb44t4OAwk0NvQy7wc6
	CYzrmykKfVw14Rr5BVA5FdvXmQJsVua6+41WagEQM4MpQlvkwvss0l7hLvgoPO2NNMYUOJ0JuuT
	/8zPecqtDcz3w1/6pTveEyyw4kSGRAVZvajNufnB7pRoNwS7HITwUkPVjjxNHI+xQhvl0kKoDLp
	e+tDuLhoWN/ho4=
X-Received: by 2002:a17:902:d591:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b5f9e18812mr226513645ad.13.1777009699637;
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Fri, 24 Apr 2026 11:17:37 +0530
Message-ID: <20260424054742.45832-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with LLVM=1 for architectures like powerpc where
CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:

  ld.lld: error: undefined symbol: dma_resv_reset_max_fences
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)

The issue occurs because:
1. CONFIG_DEBUG_MUTEXES=y is enabled
2. CONFIG_DMA_SHARED_BUFFER is not enabled
3. dma_resv_reset_max_fences() is declared in the header when
   CONFIG_DEBUG_MUTEXES is set
4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
   which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
5. Rust helpers call dma_resv_unlock() which calls
   dma_resv_reset_max_fences(), causing an undefined symbol

Fix this by making the function declaration conditional on both
CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
disabled, use a static inline stub instead.

Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 include/linux/dma-resv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..23c8db0b5214 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-#ifdef CONFIG_DEBUG_MUTEXES
+#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
 void dma_resv_reset_max_fences(struct dma_resv *obj);
 #else
 static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
-- 
2.53.0

