Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108240;
	b=ZAjvs50GupNzSa8LpGeV7X3jdttGDyGVPSY56qgWnCeF3xKhBD8lyKXaX3PYjir8t2IP
	 q/jUOy83L2rBNYROdTfBkhio9z/prD+sZtp7yPLWmQXP+nNMMWkzjBk0zFoFrDZt2TzPw
	 TqCLLuEUCnpr1wV/K/c4MLl7MzWvFykAmCiVttLHuk7B7I2QVyFRrdFv+jX9cQNsChkbq
	 glrLYdg+vJObjy+/Xw0ofdCCBuaIAUR6Y1iyuiMOI0q5KUbbTvlqWNAGT4HQkhN6Uussy
	 vAxXqL70PedLkBRTamNrJWqqRZV3e2wPpOQgVZ2iIVG9TsnyXRHK22NMUMIvwzrfrtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
	b=UXJ90RKRkRAl3/6+bksqDVHhO4+YswEp+Z/xtEhqa4EhN8e/ZoCiChsre+x1E4qcQYza
	 GAa6jHqTSdGxC/Z1PSH5eXQ2/MD+cuxcOCss/P6D7zxyyAHfFsw2sifqNJ5H/N/1Zb9VC
	 79uKtNyQf3Y/l4dW2cDv1BY7DdJrYQLvXDy8BMAtw603opANun4jVkp/49hKwaDSV6uul
	 a2wcSKS4aWyAgWPdAJkOzuZPnx3u5Yjn7+uCmCIz/ciyZ5Kb2wCd7M0pMHM1f86MTNa0R
	 G6jdqkg/SpQl4X3zQQVIqWKiVQ8lgMZWdeX/NCyJ9nMpABKdm2tcXax4tBvsul75QHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KYa2/FWj";
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1771F606A600
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1771F606A600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KYa2/FWj
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so72703b6e.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108239; x=1795713039; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=KYa2/FWjQvfGmB8yKpdQxa/lM/DS7cg9bedSDSy5Gr3efutlF+eYgSfW1WLeU70lMO
         gBQYN9z9yvRkzaQ/+CyclkE/7pGlVlsJXQhYVukx4nY/QcU9QFnrWnZqKJw7OMorMR9x
         /XEoeJrZL+bMuvkyTf20oC9iiIM/rcsb+hcD4qlcMzX7QeWG/AlnBNVWRk7/YQ4L9j13
         2Klmc67CcEKPH15OzpY6XVSlL6jk2/0z88Yq/mftop2ZB+Yh6p3vDgKFHI74eDLP/UAs
         07XiK/3++yLsWRaWjsejDmrPoqUULqVCjuo4o/LK0byEc/vYmjW5URNDAy+SYvHkqUwN
         zEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108239; x=1795713039;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=mwJnKD+gocEEOxK4mOn+Mcc+V4POwKCEiYi/yZXOIb0XKG64rjV4dAwMsubz6AoqPL
         bJUXUJG4nFyXGwaWJGiDA8WLu0h6Uzmh7K1p2pdrESNxf+x56REpiC8GY/S7vdEbQqJa
         p2SWoGfjo+gpAbcMzfSM7cOBqzPw3bcIwhYtGfztMmG1fEAPwSgvASEjHFNDejUjt+79
         yXdp155deS/2qUz2syq6rUUHaEhSAKT0H5HxFPTaatmPaJRrYWVTto0Igr+ttY1Uq1QX
         RpD7OgBriksW6PcJn5YfIAEj7HDbMBtBRHBPxKhKENNT3tJonbHivoBF1yYAoYEI0ZqY
         CPzQ==
X-Forwarded-Encrypted: i=1; AL+hErFwlR2ncrsfvXgaT633w53TxIjKJSUsCdqDeekpJnsU8B2KrZTnzLXRkYZLcetmYB9GOJXY@lists.linux.dev
X-Gm-Message-State: APuU4Z+ky2PRiWqIe9l6zaGZZueLYZG7goTfLirBUW6HDrVH113jKFWN
	rQthEhNKA0hYd8zBCETujJf5P81EpmwXTD1ugDg7bKZCpKDi7/mWk5XJaGOs1wyIeIjOezButtu
	ALg2BW6dZPg==
X-Received: from oiju13.prod.google.com ([2002:a05:6808:116d:b0:4f5:740:2bcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e8c:b0:577:2255:61b5
 with SMTP id 5614622812f47-57a0b03bd9amr687021b6e.30.1795108238778; Thu, 19
 Nov 2026 09:10:38 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:33 -0800
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
Message-ID: <20261119171033.1535923-1-irogers@google.com>
Subject: [PATCH] platform/x86/intel/pmc: Fix mode check in pmc_core_lpm_latch_mode_write()
From: Ian Rogers <irogers@google.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In pmc_core_lpm_latch_mode_write(), when pmc->num_lpm_modes is 0 (all
S0ix substates disabled), pmc_for_each_mode(m, pmc) terminates without
assigning m. The subsequent 'if (mode != m || mode < 0)' check then
reads uninitialized stack memory for m; under zero stack
initialization (m == 0), writing "S0i2.0" (mode == 0) evaluates
'0 != 0' as false and latches a disabled substate.

Track whether mode matched an enabled substate with an explicit
boolean instead of comparing against m after the loop.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/platform/x86/intel/pmc/core.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized, and with a
standalone C reproducer under ASan/UBSan; not runtime-tested on Intel
PMC hardware with disabled LPM substates.

Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
Fixes: e35ee8ee498d ("platform/x86: intel/pmc: Remove unused param idx from pmc_for_each_mode()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 47759b2a8012..7e12990d45a2 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool clear = false, c10 = false;
+	bool matched = false;
 	unsigned char buf[8];
 	int mode;
 	u32 reg;
@@ -1165,13 +1166,17 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	 *	'clear'
 	 */
 	mode = sysfs_match_string(pmc_lpm_modes, buf);
+	if (mode >= 0) {
+		/* Check string matches enabled mode */
+		pmc_for_each_mode(m, pmc) {
+			if (mode == m) {
+				matched = true;
+				break;
+			}
+		}
+	}
 
-	/* Check string matches enabled mode */
-	pmc_for_each_mode(m, pmc)
-		if (mode == m)
-			break;
-
-	if (mode != m || mode < 0) {
+	if (!matched) {
 		if (sysfs_streq(buf, "clear"))
 			clear = true;
 		else if (sysfs_streq(buf, "c10"))
-- 
2.56.1.708.g77570a6a1d-goog

