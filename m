Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10443321E
	for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667237220; x=1698773220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=siXkABv8Hn+s95xOdhQdHSC+bKc3rcc2PtOfhvL/u44=;
  b=Hryn532Gmi1Vh+rcSpq9i67niTuoKZzV6adtK7Lu/oUWXefvoTO263Ch
   C8xEoitwrTSUJdKj3WmBLsFjWY2nTJCAAUHv9lafB3W7CyPyS74NsDn8W
   q0S4phX83uY+zTyjGGDFyqnQSH/xWwlWNn3uaVQiQvXFAx/Kc26nHgXQ9
   tuwWd8H640WGy+K77hS8/grpIxItjzx4afv+2eo1AFLSlPvmm/SvDg34b
   8glOiNEGWEAfVi2dkJbI9vo3frsX2VWoX9AZiIRQynmJMejbKBtmWhNDS
   xrbVl+P5keAdqTJJ2Uu5fVTYJkyUwkuLcIpLw4i2Et32SR1Cm5AGa59D2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="288670195"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="288670195"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 10:26:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="702595819"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="702595819"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 10:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	gwan-gyeong.mun@intel.com,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	llvm@lists.linux.dev,
	ndesaulniers@google.com
Subject: [PATCH] drm/i915/hwmon: Don't use FIELD_PREP
Date: Mon, 31 Oct 2022 10:26:55 -0700
Message-Id: <20221031172655.606165-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIELD_PREP and REG_FIELD_PREP have checks requiring a compile time constant
mask. When the mask comes in as the argument of a function these checks can
can fail depending on the compiler (gcc vs clang), optimization level,
etc. Use a simpler version of FIELD_PREP which skips these checks. The
checks are not needed because the mask is formed using REG_GENMASK (so is
actually a compile time constant).

v2: Split REG_FIELD_PREP into a macro with checks and one without and use
    the one without checks in i915_hwmon.c (Gwan-gyeong Mun)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7354
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c    |  2 +-
 drivers/gpu/drm/i915/i915_reg_defs.h | 17 +++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9e97814930254..ae435b035229a 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -112,7 +112,7 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
 
 	bits_to_clear = field_msk;
-	bits_to_set = FIELD_PREP(field_msk, nval);
+	bits_to_set = __REG_FIELD_PREP(field_msk, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
 					    bits_to_clear, bits_to_set);
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index f1859046a9c48..dddacc8d48928 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -67,12 +67,17 @@
  *
  * @return: @__val masked and shifted into the field defined by @__mask.
  */
-#define REG_FIELD_PREP(__mask, __val)						\
-	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
-	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
-	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
-	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
-	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
+#define __REG_FIELD_PREP_CHK(__mask, __val) \
+	(BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) + \
+	 BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) + \
+	 BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0)))
+
+#define __REG_FIELD_PREP(__mask, __val) \
+	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask))))
+
+#define REG_FIELD_PREP(__mask, __val) \
+	(__REG_FIELD_PREP(__mask, __val) + __REG_FIELD_PREP_CHK(__mask, __val))
 
 /**
  * REG_FIELD_GET() - Extract a u32 bitfield value
-- 
2.38.0

