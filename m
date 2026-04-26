Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32EA26ED45
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193888; cv=none; b=cKLjkluX/6F6t7R69zmSoBf9ey9y2d53kkOa5vhCHh8iOC78f98/9PN0DvEmBif9mdgUYFzaJC/YPsMcQFcu06Z7AKtHrP97uHvfoYgU7Nk/ui9pXERD3HgiCZ8o4VOEk7klbQFzbKHB+uIPiWnLiLWmbo+Dc9Bk0CsgnVkPerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193888; c=relaxed/simple;
	bh=btkQtdgQ0/faA3G8fQ7vJ2dLzybospS9rvLC2N23AHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBKsOUWfB05ZLC325dylLIwbzq6X1rAdMiZkU2ts7kc1tcAJd81bh5y1C8ju/+xi4Eh6+dQJmx1ZmDQNPjkyC+chfPLz8o6cUkIVcmyWcbb3NfbSfjDcOkgNIE4G10dDmiJdIIWh0rX4sasTnqEt9dOmnemxqMWibTgFvgdWpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFlzcoyD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFlzcoyD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fbca04006so4604483a91.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193887; x=1777798687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=gFlzcoyDE2lPCJWZVPMHeulww6ZMPJ5MT8xzmMvQ6b27TjT67s/1vdA0jku81txO9i
         Kclj5z4iZGAfEBVSbWe4Rfd/xWaWZTBFu9jczzhbhwsjFNPz7cCpKxl0jJRW2VMPlILE
         qYKK42nIM02K4/9TNZ9/TPQEMpzqQvCKq6I9S2qygSZytbeBYhfXqs6zZZ7FebFyYxdu
         131Cz5pIPECUSk9dvwPk8saa3q/oT82e1rzk0LrZNgAMineXI2MAO+3PSakYcnrDirQl
         coXiERM3nIyKb20mxlCLE7Bhud6pgS8k8rgq22k5f/tYSPLLSfFqB+h/Gec26oAEyCjA
         Yiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193887; x=1777798687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=tU91JU3VZIM2EEjqvbv3S7IAO/ba5PxrsyG3SiioiXXiaI05bHqah5ueTYOj6Lv8X7
         VThWNZanrFC7fh/as05WaP12GWrVsA1O1kQy1MJawmW5186YAOhwAmSGmQYh+NFZIUGI
         mgX2jCoRfCNr2jGV12GME3U6Jon/RkTPlt48UJCkIXzdG813lPAPQ17WINa/M8w8VgE+
         ZvdXpt+lYH4R3zRvhyBrAWm3tv7ub9SRBlvx5xK3nbR7Ev6DCjdsxkCoYNxsVFqSuiYn
         v1clTXE0sTc4tCVNi2jAVPsYlM45+aEoJZDa4IyGOs3GZpJnb25YQF9tiVpSGjLRydIP
         MBXw==
X-Forwarded-Encrypted: i=1; AFNElJ8qW+EIkhOcDyMFoiTQftuzX/otADEc/7Gkv1+SQ5mdl7tpB/3PVlDi+KLL+ZHnCCpnCYkm@lists.linux.dev
X-Gm-Message-State: AOJu0YwkF+lce48AwLeUyOv7R5G4qwUoMz95z8HAyot42Wvz9b/nfUyh
	evTK4raSQ025anhV2JtZinc0vc1RDZ8G98OhifSI+Dss7dvEDi2sZhOa
X-Gm-Gg: AeBDieve37WZkU600ZjH+WWcWoNlnzqrJiNdFgw2HGRtTdk85IktXTRlEJHGChY3rtB
	AtCrG3GU0w9dy0crcZ4w24D13oM2EF4jKQvcqHzd5Puqy6bV0pbMs3rGFyQDjulrP4BfM9oxI0+
	A2DeOLhFy7oTnGTqvlKs0W9gcjvC1eft49TUG8zEvF3DqE1lINGjegmDnVvJEpwyhIxTJPXjzfx
	1YtFXo0SXjy8RlTrWwsk024j7Vz+55Z6ekac0vbT2Y96sJYpsJX7Q0zebkTiVVE2cbSxfrrQJJu
	XK9trW1yz3Q1RxrOP8sVv0bfdZU8HBn+6DXu2kHcrvGhJQ5yEXSkhwNB/k8K4VpkckO1zwuvXoF
	5Pvt9O2Puf/Ai9LOyy/HIbS96eeYgzoSDNr39oAQXF7+ECyo9oncI+QRkY8b0QXkc8T6Eb+2Tke
	4BD4ffNpGb4Hfax0ZWLxGrPqfLbGYnZl8m8LzHVkJeiEBGH9H+A0z66//MiMjA8vGN9m+9X2NS8
	U2eP9J2Cw3cLfA=
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr38654992a91.0.1777193887102;
        Sun, 26 Apr 2026 01:58:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:06 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V14 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Sun, 26 Apr 2026 14:27:20 +0530
Message-ID: <20260426085725.2090827-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFER
is enabled.

Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_lock")
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/helpers/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
-- 
2.53.0

