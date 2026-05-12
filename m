Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAB2FD1C2
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 04:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778559830; cv=none; b=oxuiFT57Z39dZjdH7zj03ldZxVVrO7l2seWW1rOhntM43U6fYgQDU9sTdjypTbLatBUiqN+MgeLLOcnt5zl+YzDLhPx+bM9XrrILuw06rOS0wgSfmjvvCRbxprNZYaM9MjlaaMx0+iMZNvhgPtmB6TOe5H9YJQWI/YlPwMancdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778559830; c=relaxed/simple;
	bh=G7ncsH/WY7d03+/5ipUlNNGfStAI/zSQoQNHBS29pO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wz07hIpzvDJMSxuGaQBWWWsdrK+413IApIdVFgVaRUaoEg8oQRQJ5HyBmjJjnMs0qm17HtH/mmKR/JQ1a8ALC7N2dM6oUOuGrQCgbPpw4Stgtk6falmdHquLAKmBZZJBuwJiwpb59a3gBsFX8wyA/PWaI6czOeFcl6pR/6Gn5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXGm2puz; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXGm2puz"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8d67a483d3eso563919785a.1
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778559828; x=1779164628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP/+2G+KQKp0jcs9Wp+FgRomWiwgmnqO7eeiRjAeLco=;
        b=dXGm2puzfbSir0cSiZW3XmAk3Xs3Ye/RPS0U7rjM8D/Rj7OugMiQlAMuFgmU9gnZd3
         p2BHDOxG6JbTEURiRC6g5eUytf/bVy7zQEqibzBUSRVGOhCfgVDwUs4H8Wyuori6HAZa
         JShYEKKRPS4vwPGcP3WkyBDcGkE2BovOU8R2jL86RJssNW+KYkSF+Fe7tOQ9cQHPsquL
         jl6PeRvFXP0hHN1nWD9cUiUDRP5ejgvfusf1Yf4T2UdN/IsuhQJpdrYa/9x/JMrDavqz
         sRxLDztg9krvI3+5M03Z5QdZG9OE5iKXEA8ftLVBIQeLPC7LID/49KxkFX5OZJ05Ig4e
         IYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778559828; x=1779164628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP/+2G+KQKp0jcs9Wp+FgRomWiwgmnqO7eeiRjAeLco=;
        b=WNpuiGy2hCZp/30z3H4QKYcldgmWFU5emWXuoX2SLaek7X9ZpbynHF9zQczj1BICw9
         7piof71YEFRPkZqjjb+Rh8u2Bwy+N81h29utxWt5Q4dUPWoEGAFb010uscL3ywgW67pV
         I/LiITk+sTQODW4ZwZEwO0CuQchLmBRDp68Zzl4MXIRBat81kw/OeELDNgdZdh8rLJXb
         ty/wfBpvSdQbOMNFm097vt0IDjE+X4UoRqDg70rLOnDMCKPU528iw6QgN6kewWgCrkxI
         xasgdC/SsHUF7e38cFGzfjCe6zG68qdOvB/7waOWDgelC0IS0H2LvQJqXGe86sHmIuLz
         idrg==
X-Forwarded-Encrypted: i=1; AFNElJ9pLye7HLkybHEpcUqRmg7uerHEb99j8AAdve+VN2328+7cfaHFR6H7DD8T2fLSgd4AAzHR@lists.linux.dev
X-Gm-Message-State: AOJu0YxxNpM5z/vO6Rjqi343gGbxMzJwdPfoKtxMtfYs5/nBU4eKQvmA
	RugOe2GQHcfTSNdwA7C16+QlykkDTgNDWX7eNmHwUSj0NqFM+q1QDIUy
X-Gm-Gg: Acq92OGTtjqIjKJG4ZOlNcdoczHrxV+6OzRzyfPHtNcTT1MuLc3qhGfsZvBb6w3Pyfq
	KlE8GK+LBak1zhT65i1lhcpbx3xjqjVL61t/fk5gwa6J4sBs/kTJYr0tg2UZdnuMOBD5aq4MPQ2
	w9fFXj3QNXUfNVJ8Z6eEfFF5nGv/rkfdL9Oiw+96xZsLpOuzcehj8YOyBIOsp6i1GmqKi0vA6HH
	rU8Ip6zamP7Vki3sjneqcLK05ZyByxUeTYO5irZFe3BwlsG9PcaaAuhrkPH1sG/DH1hfWyJIsu4
	b7ZkyWkOE6KiNkMX7LxPlLa+oLF/lRJP7zueMDB8TjZpZItTQDwDD4hGKMyMho/aOVi/oxVmi1F
	oWGW9bbHT0y2tACmVoe4XYoNiXtOZy/jcPeWl6A3fagNVHnbk7QKq6F9qQ/Wt/6p+nwOQCsfOAm
	3GN53pc4nH8RtpPr2yDH3pdcouYnQ/CMWAy2LdkFJ+5+0H/y45R66wLoyo7Tj+/9K5eYy2XYZsK
	3MmThz+y/TuFuhB72E569CE7fGyseO7jQVFHCCGsJ1Of1w=
X-Received: by 2002:a05:620a:4888:b0:8cf:d717:c22e with SMTP id af79cd13be357-907badfbfebmr2504182785a.28.1778559827743;
        Mon, 11 May 2026 21:23:47 -0700 (PDT)
Received: from mighty.tail79ce1c.ts.net (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm330162176d6.36.2026.05.11.21.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:23:47 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Date: Tue, 12 May 2026 00:23:41 -0400
Message-ID: <20260512042341.1452-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Add a small C wrapper with the exact callback prototype and use it for
finish_suspend.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
index f18ef45e2..1c51b2f97 100644
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -111,6 +111,11 @@ static struct cpu_pm_ops omap_pm_ops = {
 	.hotplug_restart	= dummy_cpu_resume,
 };
 
+static int omap4_finish_suspend_wrapper(unsigned long cpu_state)
+{
+	return omap4_finish_suspend(cpu_state);
+}
+
 /*
  * Program the wakeup routine address for the CPU0 and CPU1
  * used for OFF or DORMANT wakeup.
@@ -437,7 +442,7 @@ int __init omap4_mpuss_init(void)
 	}
 
 	if (cpu_is_omap44xx()) {
-		omap_pm_ops.finish_suspend = omap4_finish_suspend;
+		omap_pm_ops.finish_suspend = omap4_finish_suspend_wrapper;
 		omap_pm_ops.resume = omap4_cpu_resume;
 		omap_pm_ops.scu_prepare = scu_pwrst_prepare;
 		omap_pm_ops.hotplug_restart = omap4_secondary_startup;
-- 
2.43.0

