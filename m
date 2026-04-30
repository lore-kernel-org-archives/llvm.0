Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BBE39FCA8
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777588844; cv=none; b=RWp9p7tJqslhRq7wDxokdx7XfzMp1nvtPTnITcWgqpGJJrieKtB9tVUhF3bXewlJCL7BhK0QohAZot2fFF6QPofI6MPTQmPJloXTF/j23LisBNQyIh0rnqIdbcR+Yby+R6+2RCTadp0vUDrdYdrA3YBpuQLiNd5nesAgioMP6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777588844; c=relaxed/simple;
	bh=V406TqVoKHgAuicekRKpsJmx5/5UDrii8AdfdX/zISw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfhsmhS+CL3e7oQJyCR3GJhDstq0kR+Gl/nVTvaGKEhBVXT/PfmJsUp6KkYs/bPhJmyaS8yRP7iNkkI7XwFMWEnSK93Z8GXqFZ1JR+ThW7+uQEF24MFaGEuvwnE/PafLS+GHdH6KpV6oZD6b6zXlquqQ3VCHXlEOFC8rDNlARNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cis2bmaL; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cis2bmaL"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2279456eec.0
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 15:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777588843; x=1778193643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rIQVUIY7rOHf6FAYreUm24KryRFVFOuXAkyabTl3TY=;
        b=Cis2bmaLlibc+6Bc9BhJAXpmXV/uhTinwOqdIdiDPExjh8IgzGbhGTk2hms0X0OnUU
         MUapD3ApUjvHnY12/shnHlncsB4RVgvDjP9FO/ffbEmDQppjJPQBN8xb2vGp0o5gW5L9
         r80xPzmyONf1pqrvRRIbytUieoxyeDvCyijgHMaZRO2j1VQmpNWC4mzb5spd9NdTllTB
         BcNiySoiMV/AN8wf6QvupaZD/R9Vs8XjDjzowclNR7IYteJAxrBTTh6qcJs0LXozFc6O
         N2zDlH2XNTsfjfKE0cTGlozEip7FXbkbt8KDquGgMbndjRphCepyoz1Re/LiLf4mPE6/
         AH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588843; x=1778193643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rIQVUIY7rOHf6FAYreUm24KryRFVFOuXAkyabTl3TY=;
        b=kNPsaTHohYd5tLLLavKsGRD/h25aC2hisovzICpMW3wI2Xctw+w0QmLFbNsPHDQZDC
         nbqim7nPd8Ow8H23rUv+2p/tVpC1SakV9+UK4eb3ug0TfJUu8zzDEOMVx8nUhFQEclMl
         76Vb+ou2IesYyIZvlVBCjdx4B68iQL+4vQbmzLcs3PG72MQcjbeRCHstpdvEK6BQz+QN
         2vhY8UXFpgBgQVwyjNhnKHUUB/Z30SPvnOsxpQDAsrUdkzniMfMwK9FXT/WfA9S2Y+4o
         hO3yl5WsA+/+chlk3v3X7CFy6npAQujmcOiKSU11BCp0AnLcbi1AN0M3v+5p+dUCoLaQ
         ePAA==
X-Forwarded-Encrypted: i=1; AFNElJ/tpsv5a7renh6WpolvnqvNAvP/BxETqZtWGqSTQsTp0C7onI1AK1MSZucRu0uCsTjwc6kk@lists.linux.dev
X-Gm-Message-State: AOJu0YyXTqXua+0XevHxjmZRaFNzUpA8/axvFxd5fRuhNajalKu+IQ1a
	ZXkKNB3dqh/lhCz6Eyd5FCi4Wzf+B8zjHLi9SQDLPokrcxL/XawXqA+A
X-Gm-Gg: AeBDieteNighqFoF/1AtdTFNZ3bdtyS80mY1APxxbZthY3evrByoFgLKXpllqb+S9EX
	gbVzKRmDtwOauO87BjxtA/s5CyQX3zBhj4VP2RJNi97rIfFF15nq9fhRxXGviSRu306D8F7QRU8
	bEkCQb4WFpatk5auWmOZ8Cg3ZfnnIJ6mzADkULHb6MP1vmFCSt16KYuL4fldDs4XcU5ftHYCXc8
	niMywvoGQ8PKWANYdOlTVxslI+OYw5uVTaNACob4g/U2gf9TbvRvz3VWoPHbRwxvMbCrQuwk+h2
	preOjjxHLEIsn+N/l4FkqsMhnw7E9cfU9n7ckZWhrFXb4J49Lx5QNr1im2tpg41jsiSBjmogT7Y
	U1nnRDeuUC94GGBJWGYSXRRGkV/EKwUjvWGZoGvaaGyJiTXsb5w+f+X4WDeYmi4nWSU+H9E2rix
	QiMhu0t2Yq/BC3wkBcB6FAfjpu2CAzwWO1dp54
X-Received: by 2002:a05:7300:5341:b0:2d9:77e1:57d4 with SMTP id 5a478bee46e88-2ed3e489086mr2332993eec.29.1777588842546;
        Thu, 30 Apr 2026 15:40:42 -0700 (PDT)
Received: from sergio-82n7 ([169.150.198.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b11fsm1906281eec.19.2026.04.30.15.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:40:41 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: lkp@intel.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	sergiomelas@gmail.com
Subject: [PATCH] hwmon: (yogafan) fix non-kernel-doc header warning
Date: Fri,  1 May 2026 06:40:22 +0800
Message-ID: <20260430224022.34424-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202604301429.UUK5MS9i-lkp@intel.com>
References: <202604301429.UUK5MS9i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring.

This driver provides fan speed monitoring for Lenovo Yoga, Legion, and
IdeaPad laptops by interfacing with the Embedded Controller (EC) via ACPI.

The current header comment starts with '/**', which is reserved for
kernel-doc, this triggers a warning so we update it starting to '/*'
to avoid the compile warning.

Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604301429.UUK5MS9i-lkp@intel.com/
Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v11.1:
  - Fix comment header to resolve 0-day robot warning.
v11:
  - Mapped ACPI paths directly via DMI quirks.
  - Fixed Documentation formatting (0-day robot warnings).
  - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
  - Removed redundant platform_set_drvdata() in probe.
  - Explicitly defined platform device ID as -1 for cleaner sysfs naming.
v9/10:
  - Implement ACPI handle resolution during probe for better performance (O(1) read).
  - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
  - Refine RLLag filter documentation and suspend/resume logic.
  - Include comprehensive EC architecture research database (8-bit vs 16-bit).
  - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf top' 
    confirms negligible CPU overhead (<0.01%) during active polling.
v8:
  - Replaced heuristic multiplier with deterministic DMI Quirk Table.
  - Added 'depends on DMI' to Kconfig.
  - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
  - Increased filter precision to 12-bit fixed-point.
v7:
  - Fixed Kconfig: Removed non-existent 'select MATH64'.
  - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
    immediate 0-RPM bypass in the filter.
  - Clarification: Previous "unified structure" comment meant that all
    6 files (driver, docs, metadata) are now in this single atomic patch.
v6:
  - Unified patch structure (6 files changed).
  - Verified FOPTD (First-Order Plus Time Delay) model against hardware
      traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
  - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation
    to ensure convergence even at high polling frequencies.
  - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
  - Documentation: Updated to clarify 100-RPM hardware step resolution.
  - 32-bit safety: Implemented div64_s64 for coefficient precision.
v5:
  - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
  - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
  - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
  - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
  - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
v4:
  - Rebased on groeck/hwmon-next branch for clean application.
  - Corrected alphabetical sorting in Kconfig and Makefile.
  - Technical Validation & FOPTD Verification:
    - Implemented RLLag (Rate-Limited Lag) first-order modeling.
    - Used 10-bit fixed-point math for alpha calculation to avoid
      floating point overhead in the kernel.
    - Added 5000ms filter reset for resume/long-polling sanitation.
v3:
  - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
  - Fixed integer overflow in filter math.
  - Added support for secondary fan paths (FA2S) for Legion laptops.
v2:
  - Migrated from background worker to passive multirate filtering.
  - Implemented dt-based scaling to maximize CPU sleep states.
  - Restricted driver to Lenovo hardware via DMI matching.
v1:
  - Initial submission with basic ACPI fan path support.
---
 drivers/hwmon/yogafan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 605cc928f..314ee6195 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
  *
  * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
-- 
2.53.0

