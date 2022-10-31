Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014B17CC0
	for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 05:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667193065; x=1698729065;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J/RX3CIISXh4uRtVCwaoTBXy012CI0jVtOzkItQhTjM=;
  b=h+IjXbKPJYAMtKelorHsIHIBMu+3+mijra5SCfqtMnbinQUj1zZAMGc1
   ZvqliyJ+mHC/FX3aALES7bmZ4XfYRLZqOQkgs0qTWpJkouM5JoIwMb0p/
   XyN6oLL1LMkh/08X0QC0exG2Y6GerQawrV19XB2ggJ0BOLJAvLNdyJzcN
   U18DqLpLNfHErOknLHIsibGRgqFgC10rQYWFAh/004xSscgi10LaXoe62
   xqwhZ/iZjQosPEe8C4+4X9vJU/l79FOuP+F/jQwDEJhNaCOi9uKVNDQex
   GY8o8tdKfKzJf1ooPRIc+WGQmBZ28+1Klo2c10SXet+ZmVQjHP2hL45pe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308816728"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="308816728"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 22:10:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="635922323"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="635922323"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 22:10:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	gwan-gyeong.mun@intel.com,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>,
	llvm@lists.linux.dev,
	ndesaulniers@google.com
Subject: [PATCH] drm/i915/hwmon: Don't use FIELD_PREP
Date: Sun, 30 Oct 2022 22:10:51 -0700
Message-Id: <20221031051051.553812-1-ashutosh.dixit@intel.com>
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
etc. Use a simpler local version of FIELD_PREP which skips these
checks. The checks are not needed because the mask is formed using
REG_GENMASK (so is actually a compile time constant).

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7354
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9e97814930254..a3ec9a73a4e49 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -62,6 +62,12 @@ struct i915_hwmon {
 	int scl_shift_time;
 };
 
+/* FIELD_PREP and REG_FIELD_PREP require a compile time constant mask */
+static u32 hwm_field_prep(u32 mask, u32 val)
+{
+	return (val << __bf_shf(mask)) & mask;
+}
+
 static void
 hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
 				    i915_reg_t reg, u32 clear, u32 set)
@@ -112,7 +118,7 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
 
 	bits_to_clear = field_msk;
-	bits_to_set = FIELD_PREP(field_msk, nval);
+	bits_to_set = hwm_field_prep(field_msk, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
 					    bits_to_clear, bits_to_set);
-- 
2.38.0

