Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021CA40
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664352879; x=1695888879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sje3TAP90mMjJ4940AZvP8k1syPAFp/h9HzOk/O8E9U=;
  b=lbijIdcjmDpujLLlN1ocOKdeHfzv5e+MJw7xz2GTFV+Pq7+YW8YrEqoz
   iSFiMFqELD1wyzkcXR8tqmh5gp6ExjCzO+FOVsEZEOMIHNCtLI4mPXP9K
   hr4q70cKOI5HP59tnu95VSQYOKdUp63DyUwzXM05ugjeBYsu3t6ChRcEi
   HXN/NPANsjH81sP64qksOl0JDWWOQPG8UliZsFmRrVgJ4OdiksGY0FjlA
   00wn9vUmHjt09O5+XNH9A1TA87A2F0KZIPoZYv9ny4jAbicvapwcSXzB7
   IVZ/Mu9+4x9TwsoNX9sQRd+FjD7Bc4sWgDQDFPjVceS00Kq3avlnuVTy7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284671891"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="284671891"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 01:14:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621836436"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="621836436"
Received: from maciejos-mobl.ger.corp.intel.com (HELO paris.ger.corp.intel.com) ([10.249.147.47])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 01:14:28 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	mchehab@kernel.org,
	chris@chris-wilson.co.uk,
	matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com,
	jani.nikula@intel.com,
	nirmoy.das@intel.com,
	airlied@redhat.com,
	daniel@ffwll.ch,
	andi.shyti@linux.intel.com,
	andrzej.hajda@intel.com,
	keescook@chromium.org,
	mauro.chehab@linux.intel.com,
	linux@rasmusvillemoes.dk,
	vitor@massaru.org,
	dlatypov@google.com,
	ndesaulniers@google.com,
	trix@redhat.com,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-sparse@vger.kernel.org,
	nathan@kernel.org,
	gustavoars@kernel.org,
	luc.vanoostenryck@gmail.com
Subject: [PATCH v13 8/9] drm/i915: Use error code as -E2BIG when the size of gem ttm object is too large
Date: Wed, 28 Sep 2022 11:12:59 +0300
Message-Id: <20220928081300.101516-9-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ttm_bo_init_reserved() functions returns -ENOSPC if the size is too big
to add vma. The direct function that returns -ENOSPC is drm_mm_insert_node_in_range().
To handle the same error as other code returning -E2BIG when the size is
too large, it converts return value to -E2BIG.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index d33f06b95c48..a2557f1ecbce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1243,6 +1243,17 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
 				   &i915_sys_placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
+
+	/*
+	 * XXX: The ttm_bo_init_reserved() functions returns -ENOSPC if the size
+	 * is too big to add vma. The direct function that returns -ENOSPC is
+	 * drm_mm_insert_node_in_range(). To handle the same error as other code
+	 * that returns -E2BIG when the size is too large, it converts -ENOSPC to
+	 * -E2BIG.
+	 */
+	if (size >> PAGE_SHIFT > INT_MAX && ret == -ENOSPC)
+		ret = -E2BIG;
+
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
 
-- 
2.37.1

