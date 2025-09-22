Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD82773EF
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535962; cv=none; b=QLEbydlc8Mn86wmSpf0CMu3j9E/45EZKQSQ5W+l123c3nVpLR6ihllVSdanbqbhg6Oug41oY4dZg+tQ0H7leIKISks9oh3zR6y604oj/iSEBTeYOIYXKozs7HRnbo5EYtivkGQTTr2Rp0y+V0nvobFDf1kxjHR41OSSwbRo+MVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535962; c=relaxed/simple;
	bh=JBBg1DunHyrZHjDmHNv9hg+f/6PDnhOe5tFJ7tYvH5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OswHBVJfwhkcGq+3OEMc89MYjc+wG6cFi5Aay83kUIbretpomjtroGSLBGTuSWH8NGPmRAQcxzs1wIhecnwCHXnTvdrLFCoIEhxYFOFYFFFKNxinMAFVQOUu3F5VfjfK83e0KL4bcXkM/G3FGPpT1OP7IIB8qBIuT1g8K+rlvls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nz676LxK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nz676LxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758535960; x=1790071960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JBBg1DunHyrZHjDmHNv9hg+f/6PDnhOe5tFJ7tYvH5U=;
  b=nz676LxKNQnbQfq+ttApCD9K1dbQ0gTIwx88uMfqP2MToJQs5KBBHMSy
   6UkRujx/SUnNbeKkQa5fUMAcUiFoGQ6TlMfu9FwOQR+RKFjvVFVSylEEd
   JcrzIf3MSU6H8D/AUMdZrSeKHcRGFjmFUJIC6DFIn6EK9MPqG8Fsl2T8Z
   yWaMdhFWAE+LSkst6O0iDgzguCnwTalAq/we1Ll5smogl52BAiVP/CSaq
   oyq3mfICrRfu02qI+xQm4GHkY35xxDYtB52iDLDTo1Ly203aEdX8+W9gW
   yEzhbFr//DlA0u0nL+szBy3hal6ZK3l6uCKsVzEt5yAbIdXxE0LpcTo4j
   w==;
X-CSE-ConnectionGUID: aMhVny4yQ2yR+IGzyNNkPw==
X-CSE-MsgGUID: sk1bYBE1RCKOvPtPyKhBcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60956827"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="60956827"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:12:40 -0700
X-CSE-ConnectionGUID: zOxHLck8QqmPytqBSncFpQ==
X-CSE-MsgGUID: HRnc32ygT6i6hR9mBsmPlQ==
X-ExtLoop1: 1
Received: from egore-mobl1.ger.corp.intel.com (HELO mwajdecz-hp.clients.intel.com) ([10.245.116.1])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:12:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	llvm@lists.linux.dev
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	kernel test robot <lkp@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/xe/tests: Fix build break on clang 16.0.6
Date: Mon, 22 Sep 2025 12:12:07 +0200
Message-ID: <20250922101207.192028-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following error was reported when building with clang 16.0.6:

   In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
>> drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer \
   element is not a compile-time constant
           graphics_ip_xelp,
           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_pci.c:221:2: error: initializer \
   element is not a compile-time constant
           media_ip_xem,
           ^~~~~~~~~~~~
   2 errors generated.

Fix that by explicit re-definition of pre-GMDID IPs, as there are
not so many of them.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509192041.tQwdE4DS-lkp@intel.com/
Fixes: 5bb5258e357e ("drm/xe/tests: Add pre-GMDID IP descriptors to param generators")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index aa29ac759d5d..0f136bc85b76 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -211,15 +211,15 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
  * param generator can be used for both
  */
 static const struct xe_ip pre_gmdid_graphics_ips[] = {
-	graphics_ip_xelp,
-	graphics_ip_xelpp,
-	graphics_ip_xehpg,
-	graphics_ip_xehpc,
+	{ 1200, "Xe_LP", &graphics_xelp },
+	{ 1210, "Xe_LP+", &graphics_xelp },
+	{ 1255, "Xe_HPG", &graphics_xehpg },
+	{ 1260, "Xe_HPC", &graphics_xehpc },
 };
 
 static const struct xe_ip pre_gmdid_media_ips[] = {
-	media_ip_xem,
-	media_ip_xehpm,
+	{ 1200, "Xe_M", &media_xem },
+	{ 1255, "Xe_HPM", &media_xem },
 };
 
 KUNIT_ARRAY_PARAM(pre_gmdid_graphics_ip, pre_gmdid_graphics_ips, xe_ip_kunit_desc);
-- 
2.47.1

