Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C5F36A009
	for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 07:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176169; cv=none; b=Yo8dDC0b+J4ShjnofRc9JnX9r0zIfI98u4fUy6JXIAH2y700v6JPBMY7ssOEEaFnudYXyd92pcgobrQkK1cDXvQprFASUs+JfqmQ4c3rb0+P6w+8hmViOYBNEssv9Zx7cKM6la+BiKa60YnjU3ebaiel1gGEfnuUpfX79kQjh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176169; c=relaxed/simple;
	bh=Qd0rnZBE1xws3W96Pw5Blesuqote85Z9+msEuuIV0jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKm+1A9xiEiJbEMJzzgL1fPa8fx0XQEa2Z6MND/NBd9QmLRL/4lIysMrMMSG1lcL1hsEwYSzyBQf1QLWxeapGO2IelqjwslLCFbzxfVGB8OAFIIq/ez+mbnoMiXPSC7QBd40uzkU5pFFEYDmfoguwBgrwIFyQc9sEsKARCnmbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg+oRMnz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg+oRMnz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adec255754so11464545ad.3
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 23:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176168; x=1772780968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2OLS1A4Uw6yTtRylm2HkzI1Tav6toxZGMwlbuYQ/RI=;
        b=Cg+oRMnz7565sNyVr+7eMsDLm5HmnrpMtbGm++GFjOKWy6jsI4gwBxRtIom1ojpK9+
         DOmq3HMBl6tpu/5Qn/ptObLqQoDtzE8oz5gRL37ZJJsjM2MyKLmJV0JDSIch4FkZ3h8V
         NXIQ9nu/D/IspnPJhqLNNcGz3viasG3jnIbKG0uBc7/3gbe/L5GpdPfO7ftyGaTkCUVD
         +Q/bWtU6nqvZJrlb6d+iBnWAk+gDwl6LEEDsaE0ToaqosO1TvGUkwKrjmGRB6EITOByD
         purgY8+vNhR4wsJFfL3RhjKD6d8JPIe1GuqJx8/73d7PWTO2/ivG3csCsb1dQvMw2bOj
         WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176168; x=1772780968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D2OLS1A4Uw6yTtRylm2HkzI1Tav6toxZGMwlbuYQ/RI=;
        b=EHb6926D+kgVd2E5Q8jCi/WebVz06jg0d6uV0P0tQQBXTpVDKDYM+EFTuvP8fDEG42
         zNsvL1FBu8drW5YKSBFQ8tywQsMBupm4O2VOG9n/OKhsdQLa/suX2rOiTK1tokQ3df4B
         7wHss1uKxvT1z3HrEvkSFJh5zSDSMcOe5HyzI6Qv/OM0CjSZmuIiXN1R2Xz4XWIXTXWt
         bBAFA34yI5S4NMipL1N8T8g95aRjegTshl2HyEGam27haLKJSidWyM0bWNCpWFE67oeT
         +JLG1P9kiolzpR/bj9bIn1tewkMGDaV5n7MNfr7NqyNX1RxvxaVS3pgUV4MJR5NSGA9V
         lsTw==
X-Forwarded-Encrypted: i=1; AJvYcCXVb22axgaroC1D0n44KMD+dGlljm+p1u67yxtNY9V2ForncNViHJ1eARs3cSmqA2vM6T4T@lists.linux.dev
X-Gm-Message-State: AOJu0YxljngceSvehamRnc4glDGxBSXAgoHrDf+XCrU1+aPHDcxkyQda
	NX8kbaiZLrObMdnNfMPvGz4w6l5o7Zio0pjINytTRw7R49j0LvswfuHQ
X-Gm-Gg: ATEYQzwcvm5CKYaj3VZy5wSMaqSTtk01Mh2R30js5g2Q5WuT1VX4v/bXW2PHTjlBrT/
	6FoGc/O4cQKcCBX/O5uHk1/ijKTV//n/GlMPphZGiwMCYuvYBdSi+KRS42yeRB73z7Zlhf2Sjg2
	00HIzqN5ZyhndvoAqhKNx/jC7MsVOQ7ISdqQJnizcv9BnufzgTQ2YpKAkV4ge/hcQivMTTLDujV
	0pQLM0ltZoo3zlJb1z0eUdonPAqH2WSLH93m6LMBfKAV/gXrtl6YXYQfTbe4nAQERxzQj8s8Ghh
	xvx2OsvYukRuthfAY7iEmxyQeuzuJAtEuQG+MNxN47bfAa3V79/7gLvby+G4nEa041HyJ9xQiCf
	Wn90EDWo1yRDVM6iZc/P/FCxHxpgjMitLu/hijdMtWW2RrdNg1mbXX+K5NMRqe3NzpAy+0+P1nm
	T6zWyBAfFMtNcjW/E28v/T/UmpyZL10AAv1fYxQBTp0vDn
X-Received: by 2002:a17:902:f689:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae2e480d5cmr19907925ad.37.1772176167724;
        Thu, 26 Feb 2026 23:09:27 -0800 (PST)
Received: from Modern-15.. ([2401:4900:854b:40d:f564:fa7d:49b1:5b44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1976sm46390785ad.22.2026.02.26.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:09:27 -0800 (PST)
From: Mathura_Kumar <academic1mathura@gmail.com>
To: lkp@intel.com
Cc: academic1mathura@gmail.com,
	brauner@kernel.org,
	linux-ipc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 2/2] [PATCH-V2] mqueue: introduce new do_mq_timedreceive2() [ mq_peek syscall] for non-destructive       receive and inspection
Date: Fri, 27 Feb 2026 12:38:37 +0530
Message-ID: <20260227070838.201032-2-academic1mathura@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227070838.201032-1-academic1mathura@gmail.com>
References: <202602270443.k6N6t2u4-lkp@intel.com>
 <20260227070838.201032-1-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following Two warning issue by build and test on V1:

1) include/linux/syscalls.h:750:42: warning: declaration of 'struct mq_timedreceive2_args'
   will not be visible outside of this function [-Wvisibility]
fix-included the missing header for global visibility

2)  warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]

fix- This seem false postive warning, script not able to correctly map syscall table
 with handler
in file - ~/linux/arch/x86/entry/syscalls/syscall_32.tbl
473 causing warning due to now explicit handler for name "mq_timedrecive2_time64",because
it also handle by same normal SYS_DEFINE for  64 bit arch  because logically both are
same if 32bit machine call 64 bit, if we add named defined then it create unnessary
 redudancy and duplicacy, so even at this time i am not changing this, if required kindlly
once test in runtime and guide me.

472	i386	mq_timedreceive2	sys_mq_timedreceive2_time32
473	i386	mq_timedreceive2_time64	sys_mq_timedreceive2

Reported-by: kernel test robot <lkp@intel.com>
 Closes: https://lore.kernel.org/oe-kbuild-all/202602270443.k6N6t2u4-lkp@intel.com

Signed-off-by: Mathura_Kumar <academic1mathura@gmail.com>
---
 include/linux/syscalls.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 4db405159a8b..307cfd6f154c 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -93,6 +93,7 @@ struct file_attr;
 #include <linux/key.h>
 #include <linux/personality.h>
 #include <trace/syscall.h>
+#include <linux/mqueue.h>
 
 #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
 /*
-- 
2.43.0

