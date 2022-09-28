Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E643A40
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664352869; x=1695888869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fusilmdSQD+FIBKYeUukiHJrxKRQ3B5pPSTTQeO8rTk=;
  b=i4bMPqxSVYWvxF/CBJUgven/fsnHPPsPLKxr5BE2gySp+S+byEQzoVf/
   K/5gaeBHMZqCrhRL8Pv/ORO1YmkMVl8p2IkRlbRpYg+PdWyKGGb4bFtop
   E4+m6h4b3q4lfPHJu9I686xHa0kDaScrA/mhn6QDKg7sQZU23PK2Q7PX2
   q1qeByuAxy1JCW1/2wOKlTpiLHJX6fasLJ5THx0XtYYKKXsWTkk8uj6Ve
   By7lR03yTBTnGsW58VpcL7jFAGEehPO6HXLL0p6IOLqLBS5pnInlGnagA
   DNEeew33yupcnG8N4+3G1XoISYgaI6d0dra2eUYKuVIr0VciFIVxxRnX4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="327904373"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="327904373"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 01:14:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621836391"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="621836391"
Received: from maciejos-mobl.ger.corp.intel.com (HELO paris.ger.corp.intel.com) ([10.249.147.47])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 01:14:19 -0700
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
Subject: [PATCH v13 7/9] drm/i915: Check if the size is too big while creating shmem file
Date: Wed, 28 Sep 2022 11:12:58 +0300
Message-Id: <20220928081300.101516-8-gwan-gyeong.mun@intel.com>
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

The __shmem_file_setup() function returns -EINVAL if size is greater than
MAX_LFS_FILESIZE. To handle the same error as other code that returns
-E2BIG when the size is too large, it add a code that returns -E2BIG when
the size is larger than the size that can be handled.

v4: If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false, so it
    checks only when BITS_PER_LONG is 64.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 339b0a9cf2d0..ca30060e34ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -541,6 +541,20 @@ static int __create_shmem(struct drm_i915_private *i915,
 
 	drm_gem_private_object_init(&i915->drm, obj, size);
 
+	/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
+	 * greater than MAX_LFS_FILESIZE.
+	 * To handle the same error as other code that returns -E2BIG when
+	 * the size is too large, we add a code that returns -E2BIG when the
+	 * size is larger than the size that can be handled.
+	 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
+	 * so we only needs to check when BITS_PER_LONG is 64.
+	 * If BITS_PER_LONG is 32, E2BIG checks are processed when
+	 * i915_gem_object_size_2big() is called before init_object() callback
+	 * is called.
+	 */
+	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
+		return -E2BIG;
+
 	if (i915->mm.gemfs)
 		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
 						 flags);
-- 
2.37.1

