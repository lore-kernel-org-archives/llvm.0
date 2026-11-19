Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108042;
	b=H2ZcLLhnVSS9LPshaA+Wa3Zk2doSt5xU4OyiuH/bE+d/LPIYrF13tHCiVgeM8Ss6l+rp
	 mavmqQ1Ng5CzoJKH/TRYUIf66p2Gwv8qKj86W9booF/0+kCip7kyBh3OzPyNyi42q0NZ0
	 +Qs+la9rj8yngu6pysva7CaCqQas/zofS7GFD4GurEzQ5PcKM406Go20AKRrF0NK8Mg+K
	 PpcbZ32KXo2gq20fWCUymRFYMFeWtzJtg+GJUHXk/E/StHB+yJNktUPMXvccAtzOys9y9
	 zBIAY9cgQcnSbnnaJDmwiX+B+YCO+qo3dXR9lQBx7UV7kH8/eA0qe6FFzu9MKfUuhUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
	b=hHLq9lTAbuavQrcd7++cXOmqvQRR9F+sAIJSvErudF77hErLZTQIvxuJy1SWZQOb8GUq
	 yCh7SLa0g5zb/ZLEJrKhhAmflZgkqubkc8av16k+dp7ev5zF4BFWVwKc2LFyqUxwnthmH
	 m/rw42ZZfGNStnLw0ZQPO6qQ+fYdFl4iAUuerYNb5mUkrR8Pkl64TtkkhCp0pCJgjhzpW
	 ALP8NZM0nhwK6n6dYP3lsdxmjPWHrxQqWyvIWh4Aq0EYX9jZTEHyDn44dgUen3UQBMX5f
	 t3Ndxh/2db9ZeufKQL3a/YZYwAi09o5QBuTPns+G575p+6raT1qrPFZ93viEsNK1Llw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nR4ZjLt6;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802EB60A2602
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802EB60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nR4ZjLt6
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2717102eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108041; x=1795712841; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
        b=nR4ZjLt6bU5xbc83yIe4TrM8debREfJG5/e17pavNcOmNwt8XAuDr/THj1LZqrtu/W
         dGKYAd6TGHyYRI1kqDcX/KWiyn6oAbZ+nmDii0pJPDMvMjfsWY8z3n3RETZpr0y9c4P7
         vRsqwuExZd9jyGQgQwAW29sG+r3tgwPcEeaXtzu2qj80tTgYqXZ72rWS6Q/ZhCs4wBMh
         5B32Le9B/VV1Yz2c1TqLAcqRWKn2yYAL56WVGCjkrKL5mCY6fSG6GNxCDgvFiMtzgxlY
         1gRkFJt3mlWGlSipgHDq7/kn0vK8O3WOnRXxVSxaK6dzmDR0wQ0BsUi4f8fWND2M1FXw
         Vg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108041; x=1795712841;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
        b=zjjoLDAQ+npeqS7AERu+OBSq1JX5OX7/kScK8zuT2eXAfyS7KiYOGA0NOoWHsPzwpk
         ZQkjOGx090nedkAqjkUCqXUM7rmK9oEOLvSs3KsS0CKVW1wwi7tJDs7bYVNzkQyx/FIu
         ci7A6bZcE2tdLnBPDH6SPe58Hmrt7AKjXTAt+zOoxPGh6WGsU3DhKNMkPs+cpoeGreGe
         BZV7kXMA82lt69OyZxq+O0cm6SeOPp/il8ZxN6hQJnA2YobC1l8G/mvSz2M9RN133otR
         x6gZE76SQpKzkkWELzsAZud2Ouzr1BmWadjhBq9iPxVhXgb04kQXVyKlFby3frwb6NLX
         1ycw==
X-Forwarded-Encrypted: i=1; AL+hErFWJzmLZ/6k73NqSY0sXDnodNrkHKW+XAietUeqE0a66OPUyMKErCSqfFrsAGkiK6+rK1cW@lists.linux.dev
X-Gm-Message-State: APuU4Z/nQc87CAIfV0mCOXcp/7hZojdadOOMOb2cFUwDhBsgPk0K3bds
	QXmv1syt7TFXuidE1VOWIFHmXRH/E6W6VX78r+vNGwVpfQzXRoKMZMw2KmXEsI3qGTBCVndVx+6
	W8MlkcHlYRQ==
X-Received: from dyaw1-n1.prod.google.com ([2002:a05:693c:4141:10b0:37a:8a0f:3aba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc05:b0:381:6ecf:5389
 with SMTP id 5a478bee46e88-38281cf6a20mr8681249eec.41.1795108040312; Thu, 19
 Nov 2026 09:07:20 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:16 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170716.1523667-1-irogers@google.com>
Subject: [PATCH] drm/xe/svm: Initialize xpagemap to NULL in xe_svm_get_pagemaps()
From: Ian Rogers <irogers@google.com>
To: Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On integrated Intel Xe GPUs (!IS_DGFX), xe->info.mem_region_mask has no
per-tile VRAM bits set, so every iteration of for_each_tile() in
xe_svm_get_pagemaps() hits 'continue' without assigning 'xpagemap'. The
post-loop IS_ERR(xpagemap) check then evaluates an uninitialized stack
pointer on every fault/SVM VM creation.

Initialize 'xpagemap' to NULL so IS_ERR(xpagemap) evaluates false when no
VRAM regions exist.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on Intel Xe hardware.

Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and shrinker")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bc6902b5bf57..22cc7ed19d8a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -2055,7 +2055,7 @@ xe_pagemap_find_or_create(struct xe_device *xe, struct drm_pagemap_cache *cache,
 static int xe_svm_get_pagemaps(struct xe_vm *vm)
 {
 	struct xe_device *xe = vm->xe;
-	struct xe_pagemap *xpagemap;
+	struct xe_pagemap *xpagemap = NULL;
 	struct xe_tile *tile;
 	int id;
 
-- 
2.56.1.708.g77570a6a1d-goog

