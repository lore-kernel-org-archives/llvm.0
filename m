Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15015C8F
	for <llvm@lists.linux.dev>; Sat, 29 Oct 2022 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667021722; x=1698557722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=APZf4orwR0bmaXXk1zd0xukTX05Ic5bjW94jeQ9JrPw=;
  b=SkMe0APjAKEp9q2ejAyAy94PvyqKrlH10AFty/ZV9bGZTOBc+kT2pJv/
   9GGUbK6Nj85vf5qVq4Ewo0x0LyVVWnM+tGoSh1PHM9xQkS30q+SU6h+3h
   k8szIZaDzWQGQQOKXpdJKKRfj9isNsdAJ36WIJloKOrKEnOj58CLxxvw1
   LWJEtJiHnZRQ5UROSwWiome9z21at1tmfrnfSm2IZY9WdXM+HTsYO31ae
   SsTXpoD7IpTnrVmpCXTVj/E/M7tAVvAMKXsAvLgDFfvOKfocm35SFXDe1
   3UJi38AdBglHa97ixEU/Ryjb30LDDgrTFeSBdYcet5Fw4C0IjeqHsPVVi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="307367021"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="307367021"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 22:35:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="758319635"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="758319635"
Received: from tgajewsk-mobl.ger.corp.intel.com (HELO paris.ger.corp.intel.com) ([10.249.140.235])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 22:35:19 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: ndesaulniers@google.com
Cc: peterz@infradead.org,
	llvm@lists.linux.dev,
	ashutosh.dixit@intel.com,
	andi.shyti@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bitfield: Use argument type for size comparison on Bitfield access macros
Date: Sat, 29 Oct 2022 08:34:29 +0300
Message-Id: <20221029053429.38381-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the size comparison code that implicitly assumes that the mask argument
of bitfield access macros is an unsigned long long type.
If unsigned int type is used for mask, the first argument of Bitfield
access macros, and clang is used to compile, this [1] option causes a build
error.[2]

[1] [-Werror,-Wtautological-constant-out-of-range-compare]
[2] https://lore.kernel.org/intel-gfx/c1c548f8-71a8-0d4d-d591-58a0cd5dac20@intel.com

Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/bitfield.h | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index c9be1657f03d..4382bd62b14f 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -9,6 +9,7 @@
 
 #include <linux/build_bug.h>
 #include <asm/byteorder.h>
+#include <linux/overflow.h>
 
 /*
  * Bitfield access macros
@@ -69,7 +70,8 @@
 				 ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
 				 _pfx "value too large for the field"); \
 		BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >	\
-				 __bf_cast_unsigned(_reg, ~0ull),	\
+				 __bf_cast_unsigned(_reg,		\
+						    type_max(__unsigned_scalar_typeof(_reg))), \
 				 _pfx "type of reg too small for mask"); \
 		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
 					      (1ULL << __bf_shf(_mask))); \
@@ -84,7 +86,10 @@
  */
 #define FIELD_MAX(_mask)						\
 	({								\
-		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
+		__BF_FIELD_CHECK(_mask,					\
+				 type_min(__unsigned_scalar_typeof(_mask)), \
+				 type_min(__unsigned_scalar_typeof(_mask)), \
+				 "FIELD_MAX: ");			\
 		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
 	})
 
@@ -97,7 +102,10 @@
  */
 #define FIELD_FIT(_mask, _val)						\
 	({								\
-		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_FIT: ");	\
+		__BF_FIELD_CHECK(_mask,					\
+				 type_min(__unsigned_scalar_typeof(_mask)), \
+				 type_min(__unsigned_scalar_typeof(_val)), \
+				 "FIELD_FIT: ");			\
 		!((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
 	})
 
@@ -111,7 +119,9 @@
  */
 #define FIELD_PREP(_mask, _val)						\
 	({								\
-		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\
+		__BF_FIELD_CHECK(_mask,					\
+				 type_min(__unsigned_scalar_typeof(_mask)), \
+				 _val, "FIELD_PREP: ");			\
 		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
 	})
 
@@ -125,7 +135,9 @@
  */
 #define FIELD_GET(_mask, _reg)						\
 	({								\
-		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
+		__BF_FIELD_CHECK(_mask, _reg,				\
+				 type_min(__unsigned_scalar_typeof(_reg)), \
+				 "FIELD_GET: ");			\
 		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
 	})
 
-- 
2.37.1

