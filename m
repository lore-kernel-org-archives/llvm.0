Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2E1804A;
	Tue,  4 Feb 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658963; cv=none; b=nlxpvORXJn2hcNjQYpe60vaFbKvIKUWaBLEO3MOxVETmcQfunsvOmo3aRzcMYz/wAu5+LAdZvAQKO2Vqoijaaw8k1gfz+gD8VrIFfwIkQBENqy9iKMCgTCIUn/UrncLb7GH5lQCV+UBzasa1NZnOEENsWrnCHqaB61egS+Gl2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658963; c=relaxed/simple;
	bh=/2Z0Ccq96RyiP1i60nZEJ4F3rVMPpBJlekBUHSkKUFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=byBoPyntsrF3DEKHbATU8MBHQ3gYGmdB5z++xniIAJxsU/sTy/6eSfxNhnvvhvxitARJraH7J9/EIgwienA5+8dVWqrGiHxEqkR7TuRyDJU0BG9WhmOCZdMuAYA+2L+O52YnbLW4kJxkhC8BTM+HLG0bBpSXpmffcxQdhv1VI3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUQ9mbJV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUQ9mbJV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso916887a91.1;
        Tue, 04 Feb 2025 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738658961; x=1739263761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JVUAnaJCRmxWPMUWz8HASzTEc6XBUmX+oAPA4nCdXQ=;
        b=gUQ9mbJV4geTpXSdukzXEd1zxoZO5WEZaQzYs0VVVyFFNtapytkPuYqtQqx5wGe1+F
         JZOnDqZ9eN7nvSez7pIPZCN/wAzb75IhrEUx/fSCKSfsFPT1KGoUe/4f1dV9xvKiAjeZ
         ptHJiXPiWGdIW73zNWLj8YdxTOF/9ItpTuCBa8P+y8Hd7fI0odDFgJpzZTAyVn+9pjLt
         OeGBdYMHB1YgQof0J5/+QjUfw5jFKMKMB6DwpNLhK4RrGWoX9H4kyAAKiyD7UCEsF8eM
         xKhA6zrW8YhbFonQf62Nc+ISPGfTvvVid1oppFRXJg3WNPZMJY4OQZyd/+B0buYGByBR
         JmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658961; x=1739263761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JVUAnaJCRmxWPMUWz8HASzTEc6XBUmX+oAPA4nCdXQ=;
        b=t5Ovb2+WsYthIo+Y46Tac/NVfkjSXz+ZWe3Xs7CFtYO1uw98JmaOgsQ0bYI9/kMIvV
         bsjCHV42I0kfyKfp1AYhqvgn+egWp85DnN32aQzu4+CobwzfSdnM7x1w4jBRqVFl+d8w
         W9pj/8rOiMXha10sT3+5VnGj/CpCn247zOc/8oSOx92B5QgULEvd9DU2VtDheQRFbCoa
         A2wXpuz3j0oI5kgWeVgftRRX9lMGxDdNE8dyStbuEp/qr+tKjmyxvmqIofxa2L9gBOHO
         KuP2MYE9jLsNjhgH6kRahGPjwKjll7BHIHpdg+VPM3lrrwNAxe4SLyF/rxVXFsq3h+S4
         eFFg==
X-Forwarded-Encrypted: i=1; AJvYcCVNTq71chDIQssQjfZYJLLJgZavkb6s0Uf+d38enxErVdgpjtdJiZvQkLWWskY63Ynozo+CylTo9jCdliyQ2g==@lists.linux.dev, AJvYcCVdAyYCbn1ppnBAAImeBKLVBEDqLLH2ow5zgkvrn8166WdysnoisxqSLMfcqBR2y3Xzcimc@lists.linux.dev
X-Gm-Message-State: AOJu0Yx01ODp8NnSnZRJRwBnM2CU+PgThlDxQ06WOX0M/jquDhQjkcVO
	yR8Nge+bdswhqfHJeEQn9VwAlRxQ+DqPFNnocXJRlP8+tkXTuLow
X-Gm-Gg: ASbGncucMxCrz+rcMpOfRvDZv+McXj+NxBQla3k805JSR6cj94dPTnpL1LM1F0/xkm5
	jExlywLQclY5x2e9CHLgDLdAac115TJAxRf3X1hql7PxO+ttiCx3/ibJR+Ur/d2d7LT6RkFjc4Z
	vsJLXCKhPFYBH7vRQnh/W27HQ221PJByjjnFbze0ON+PGxQ8WrLuURVQbHzHocz00XOUM+c3jGe
	xNjoU51QS2xHXuOrKoCyZbJGRVTVklgSUW/Oc6ZrHqSdQwL7wisVcvEVHmchp91b5joM4fxsQB+
	wxCxUvgqUlm8QXcfFHieTB5OFSMBO1De
X-Google-Smtp-Source: AGHT+IF1YDDAzfPtr/fsI49ks8wcEX7FsdGmSMaf9+Py2J8w9MsZw2dVBL+ZVG00h3a15FeXIHk4uA==
X-Received: by 2002:a17:90b:2f0d:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2f83aa7cfcdmr45333320a91.0.1738658961046;
        Tue, 04 Feb 2025 00:49:21 -0800 (PST)
Received: from 192.168.124.12 ([115.196.171.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93e97sm14112603a91.31.2025.02.04.00.49.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 00:49:20 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@intel.com
Cc: laoar.shao@gmail.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Subject: [PATCH] sched: Fix static declaration of 'sched_clock_irqtime' follows non-static declaration
Date: Tue,  4 Feb 2025 16:49:15 +0800
Message-Id: <20250204084915.4887-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <202502012207.b8iyB4Fh-lkp@intel.com>
References: <202502012207.b8iyB4Fh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel test robot reported the following error:

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:59:
>> kernel/sched/cputime.c:25:12: error: static declaration of 'sched_clock_irqtime' follows non-static declaration
      25 | static int sched_clock_irqtime;
         |            ^
   kernel/sched/sched.h:3262:12: note: previous declaration is here
    3262 | extern int sched_clock_irqtime;
         |            ^
   1 error generated.

vim +/sched_clock_irqtime +25 kernel/sched/cputime.c

    24
  > 25	static int sched_clock_irqtime;
    26

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502012207.b8iyB4Fh-lkp@intel.com/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/sched/cputime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index c7904ce2345a..6dab4854c6c0 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -22,7 +22,7 @@
  */
 DEFINE_PER_CPU(struct irqtime, cpu_irqtime);
 
-static int sched_clock_irqtime;
+int sched_clock_irqtime;
 
 void enable_sched_clock_irqtime(void)
 {
-- 
2.37.1 (Apple Git-137.1)

