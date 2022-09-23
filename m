Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF32F4439
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 20:28:30 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id rt12so1084256pjb.1
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=k0IswvXpcAvdiLZPIXN3c5DjnsYKqakODd7BbfXTQEI=;
        b=QrmiCQX9GiyAvK9+mKup1boveHjE9itEI0YZkgCTiluR2mt+7uynIg0wgHzS0fo3Kt
         s8lgk0G0b7iFD6G/bf8SXd7GtoYB2il63LkywVZCSQDCieP6Y6mrV2z2ASYtCsyN6DKS
         xeEqLxywxC671K6eBmRXgIzL8IhhLMZaUYHMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=k0IswvXpcAvdiLZPIXN3c5DjnsYKqakODd7BbfXTQEI=;
        b=LVZ2DOoX7SV+fHkibUMmkgYRG9w0NreRjJeacPD+n7FRMYxQT1r+R5AxH+RGzstY4g
         vh/LbMDoQGbmbwfMS80tcvdwlyF9lfs62X8P4RYOG4/q9l3nL8k3rmxFv/wHv/lhWYVQ
         FDxfE15cs5mPa7w3Y9jr7O2S7zYwq0hPqOcevhgc8sQYjaAQCAJremA+OAZ+1a6AQ9ch
         LgEPh8rrMTApHs0Z1epPezd0UwJtjQBGRnlPnABP8zfZieI4H3bp4fHV3pId3ySvVPJP
         4yszvVf4+pVUi9o5DYbb1dOO5EHapZRawacnmJ3Iqe82reJXnw++aZURvYw/ARKBcUqF
         LeZg==
X-Gm-Message-State: ACrzQf3VdQUv88pYrwr1PbAaLcneAQB+w11FXMGzClESwX7S2xdDCzTo
	tH+Sc2XQizIT1k2gPRkxm4+A0w==
X-Google-Smtp-Source: AMsMyM5hUgD6utpVMAl6ShfvZOmvi4K16Slmi0TDE2X8XGDljCU6xLMJTIptVSCg6vqu21Nf0Aqn/w==
X-Received: by 2002:a17:90b:1c09:b0:203:af4d:ed6 with SMTP id oc9-20020a17090b1c0900b00203af4d0ed6mr22702155pjb.243.1663964910372;
        Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090ad58b00b001fd77933fb3sm2032999pju.17.2022.09.23.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Alex Elder <elder@linaro.org>,
	"Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alex Elder <elder@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Daniel Micay <danielmicay@gmail.com>,
	Yonghong Song <yhs@fb.com>,
	Marco Elver <elver@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-fsdevel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	dev@openvswitch.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 05/16] net: ipa: Proactively round up to kmalloc bucket size
Date: Fri, 23 Sep 2022 13:28:11 -0700
Message-Id: <20220923202822.2667581-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; h=from:subject; bh=IY1ALzn2CwEEDJeKMCN2d2RSu1qSDYHH3sl/8qGPuY0=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbk0/S4oiPoPLUr2gK0zbu5nD58CBtVyli7/b9z b2gIR0qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJg5DD/ 49Q+Vbxd75ylphO0zAoxF1E8P7/YQRC083ZhpstciRAvjCqnpLi5zdF920rTUU+1hjspMRJaMkLZZ5 bK5uDN9URaJ1VBwYD+6+cHrxZwypqnLzdn14wwH8UG1QuBQhNDvUuCFwvkUBf9/Bp+0g8k8JGKzhTu 6eWxuatrO7c1lHLgNshKa4CHOwSIXGl1Q8U+crVj889yJ+3vaBJUKAFLpG7i9/BXIbxLtC96UzXJeG NpqcAteIRbx3lZMeVrME7GvP1FKrpZi+5WLpqgRlT3zHEnEjOfHgoh+/WIeqHjr5vo7twX5652tP2N Mx8LmRcy1QGFOC7cJrUAt1lxtEm2xDE0DDTWbtrLD/urw/SDcZInXg9OaQJScBgPEF5EimBTanoAdX npz666oA+SsIyft7lopXirXDXC9dc2tpNbbWXNbUbi/8SOXb4M64nUSj261gX1dFmmdiMTVkMJi6k9 jkjF4KkszF50l/ZyuXITZfH/g97qx+FCiVCme/NzouQsbRqcFRQc4aqwS5nAJR5semKAPwFBzi4o8K IAGeXk3wxbSLA2xKLlfWqmWPjgqVVs0+TV5yEo1uzFYRf9/vtUmqFEKouB6fcB43xqHMU/prp6VRKO cZ5pTG4vUmHBldHcHEO1sFYR/POcX3tBkkrlcVrJzjuOaTUmZSZ3vpMsCr9Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Reviewed-by: Alex Elder <elder@linaro.org>
Link: https://lore.kernel.org/lkml/4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ipa/gsi_trans.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 18e7e8c405be..eeec149b5d89 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -88,6 +88,7 @@ struct gsi_tre {
 int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 			u32 max_alloc)
 {
+	size_t alloc_size;
 	void *virt;
 
 	if (!size)
@@ -104,13 +105,15 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 	 * If there aren't enough entries starting at the free index,
 	 * we just allocate free entries from the beginning of the pool.
 	 */
-	virt = kcalloc(count + max_alloc - 1, size, GFP_KERNEL);
+	alloc_size = size_mul(count + max_alloc - 1, size);
+	alloc_size = kmalloc_size_roundup(alloc_size);
+	virt = kzalloc(alloc_size, GFP_KERNEL);
 	if (!virt)
 		return -ENOMEM;
 
 	pool->base = virt;
 	/* If the allocator gave us any extra memory, use it */
-	pool->count = ksize(pool->base) / size;
+	pool->count = alloc_size / size;
 	pool->free = 0;
 	pool->max_alloc = max_alloc;
 	pool->size = size;
-- 
2.34.1

