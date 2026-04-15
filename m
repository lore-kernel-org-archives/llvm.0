Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019038F65C
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286814; cv=none; b=V/gr8bcY59Cn9lqieon3/ALqiqKUyarhSd+vhlkBCTAjlP+fjptU6VwoFOwZ9eDKDozpAskAv5ylVl0F06gz5kzB3WNbh8GVAS+kryC1gzyGIwltVshRZeYbuBD7YkLivBfFTOy0gOk7vrBIlHgGIaDTYUPJC02znH80hadeDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286814; c=relaxed/simple;
	bh=kCNYcmfNgjCtuuNJpdXVk9xztupOqrlgLYIOM5DXg/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBG+jnuMWpaxkyCdJEGwSjPWDDGfZ0UfZxP4RwNPteaoFPlyKRoNBtVrPjATNlTyEYO24zV6KAR1pClMcny9amyrmY83egU4VFsJc1z2lnsD4DEKZdkaaOxO6C3P92j61pyD5ZqgFKRhz1Rj8BKxvMiwI01JRxZkcMrqlAMlQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fGqNYc4A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fGqNYc4A"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so70889325e9.1
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286811; x=1776891611; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QarwDcfAAe06CKb3JY8/kgN2OyTVrb9EUoTBmrcnojU=;
        b=fGqNYc4A3J962e8mc4g2vxIw7EEId7MAk4YQ0htqULLfHXKH2BVByHDBuaXrxE1Wmt
         KOXSUwoSO+Eo/4Ou3nGuAJZPAuV30RHE0dvsu4UBShQsOCm6OVZMi3Xswizsm1jMWWvQ
         USxoqGXqt3zYz0ubCR48glw8xpeI7RcaRPX5uiU9l6bYILe+BL8/4cWdYxK4Vhpp6k/u
         6XSQZ9LGirpPf39NIOfqy6I7kX9B567GgMnwYmfxDjLLkpMm4W/c0Ux72sKueDWOXyny
         mn/CdbNjMRwVhuqXwymXnuxIvgX44jmtotULsNd5RfYbFTqTzXVoXillbXFj83lbZdHh
         dyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286811; x=1776891611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QarwDcfAAe06CKb3JY8/kgN2OyTVrb9EUoTBmrcnojU=;
        b=aAwPvTFQUBXIQ+2Rnl3boC8SgVxS7wMutDsQd9t/XB8zdtXVCnKIIG8VmkMZS+DFSA
         mg5ApbhA+rf9gKqLAJqu53IK15zyL1CGzSsE+MT8V1mc51/yJ4kwy0wlUcTwN3KwQk6B
         NSiHKeutsE008PKNkDYenJ5Vlz7zk08RzTiyJa9loTvQk5qEWtbbRwV4z/NTMrQthraW
         xPS4DCfU/7tSpNGf6M1gCpwIJG1/6NJ46ErE0fv/BIO2IVHDPUaPkUkHDxiLxfH6QGM8
         BQYGYJcPBSJTRN0uG96RCJh3Bxp1P5zojknfpE5O9O7eiOciMKTjRQTbxVp57pYgju8n
         /vLw==
X-Forwarded-Encrypted: i=1; AFNElJ+vHCbA5e7dmETGkcgs7o+Jwx/eNbs+4E72UAVqFy+p8Lo5MuvPmfKW6WXGJy8IY4onB6kL@lists.linux.dev
X-Gm-Message-State: AOJu0YwwgWEeiDufue56sI7seZHNrY2bXA55y7E9JxJXAY/qhlfRpnon
	hDfEvb4GKV7I6Z0b4tZsQtTJQ3Dlbf9zczK5p66Wojijv4k1IBlC1MAbkpd9B6kOw/I=
X-Gm-Gg: AeBDiesfQQfvTnPo7r8+JzOPSCv0WeqNBmp0qXrRsvlWbhcbkJXxFUdnanW/fAdlwOE
	INokXQDZ8TYYe8We1oNsKQDQukbj79XLEeIaPXi+hgpdyhGFEc7DjaSWIDk7UwT89WxFayBq96B
	zeMRl2x+rqrQQiaEKurmLXL/VEPsXg66FqC0K9bzfn5imis40O7ULQ7d9u9IwS5E5mRk+qc2YT2
	SR9zQ0JHf+xRcd0d0wt+jcmbv5nLDKwk/vOtmC4fnOOPKBNjjZhHUa1R4Y8VUS1wBJ2KTLVMBOM
	bWnelkCUpz2J8Oli1rafk46Bu5pZh+558gEqbNNENpZnSz4uFzkLPnmTHfOgsGOtJAGZBtu3wkH
	W3Yyv9ztMQfbp9MqTeXE/vVECwr5/TaljUUTgDSyX+F4uW1jCITI61CSk/X7rONE0vUbrCUsh0L
	KHC3dwqUCwuXg=
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr297880475e9.11.1776286811412;
        Wed, 15 Apr 2026 14:00:11 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61cd32sm3511675c88.3.2026.04.15.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:00:10 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:29 -0300
Subject: [PATCH bpf-next v5 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-11-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=kCNYcmfNgjCtuuNJpdXVk9xztupOqrlgLYIOM5DXg/U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO52q6ndPD+Zuqj9KzWJiSAHcc5GMQVf/6C90MqwRBbzhXDP7EeLoTE9HyFcc5JRBU9VIP7yPpd
 2CYO84FdEcwc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 163552458327..1f4a8e1f7932 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -969,11 +969,22 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef

-- 
2.53.0

