Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A702253947
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 07:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749195978; cv=none; b=qBBMKpTYxZS2n1lKwYX7/kmKzMXMFd2Q8UOLqm+0vhQGblAMoYSVWmt4na6v2QL+25RJ1NlvninQnD/aK7eDdjcUwJ9ArU7YzeSbeU3vHkY8sb4712YhN3ScUnxlObt79FXNOkxleeVNQKy9/1smO8x1XxV3pgmaiDUSaiJKf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749195978; c=relaxed/simple;
	bh=zxhhXvbdZbCu1z2+3cxlSWIjevJNtlZONrlQxRT5V/Y=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=Vlpz9isVhK3crYh54NpIJ7dX7PTbS9dKE34ryPGgoRXIXzj7t2XUC5nGgvv0QlbMtglVxj1lRh8MK0fg1F0WIMjrWDeS3y7tpGi2wDX4iWDQp8DZBj0q7du01P5U8Mr1TKytL5TMwZBNZq4Ji2hA0UXmYUbPSAnRPnSe55eb1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNdka6Vh; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNdka6Vh"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-70a4fd518b7so26032647b3.0
        for <llvm@lists.linux.dev>; Fri, 06 Jun 2025 00:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749195976; x=1749800776; darn=lists.linux.dev;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fDb86QQFDZ67qGN2jzBUfiGS3FTrxct7KMqQKbUOmZo=;
        b=iNdka6VhFUKsD/+Vzrbd/9z03cFOHZGOIISTYeXdB9RacmuuheGrKKzTHA7Ilt137q
         mpD5Y2UXvr/RXCTnPxJtdNlsST93M+XJSQgo/ee980dSlDJIFyUbOEje57pKF6ca72PO
         CagW1SMMyuE4jTyBRQOAJMeNyqqoUXnE5xnPECWrPbt7ECKt5rQyv+LTkJKzWkE3duBR
         +6ZHDstlApEczUPlDFTVJlOIiC9uhHGqYn58kKOif6lh2QsdLacXkJOYnyzGHh9lEo7j
         I30vGT+z5zvPhH1W71FK1DSvmKL2DyRAAtNtGhcjXZx5ZLrzpm7aftvj/UJV7W4ZfznV
         73/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749195976; x=1749800776;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDb86QQFDZ67qGN2jzBUfiGS3FTrxct7KMqQKbUOmZo=;
        b=cERNal4pb/6XUaeOjzn+hGSzI9PE5gOLhAS566nHMkBuybVV/V392pZoor3fdu6dIi
         v+WNg+1ricClUlxzxMEvrxjrEam4in61VSzo8ugG1NNqF9sjbbY3J7M7WtueoJUdqfAT
         Wbhs0PC8l5aLZabxPDhRfKmHAkI42xyW8CTty99WqTo1ilexqPpS/ShRpG/x5j5UrJGy
         B0jTjgqVzdDL+49C4LZkPLxZDSa4tJMf2TLA88HRN12+W3jTX7fvWK3J0BEec2azBxbS
         Wfv8I8B6w6V0yMEJlEh1xLNi91ADG6l9gROsriMdDdML4MfYQ851Rm8XIE4yVUkZuuA0
         ka3A==
X-Forwarded-Encrypted: i=1; AJvYcCUe9urx4OhCuA1wdeyTYJccsnT63EsAritP4BFIEv0ZnJyC/FNvdz/3jFyQEHpQEdgVylbl@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8v5Wl3tAu0iMkhM3zigJ0lxR3Cesx9OgwfiG1E/0VdeQ4gn1I
	8usGHLVB+wbSVDNuFgYwnhqITE/Otl2YoxGAQAoA7rdk18qSUdPfaVyzAKlHtbWyonlQLG2cuOU
	ozz7WobYx1HVZog==
X-Google-Smtp-Source: AGHT+IH+HJN97uPX2uu694TyMCiKt4EYYDjBk3XYUFywUveQC2PD8RJ0D052YFob2qvP84EDcApZAKpKIrwBUg==
X-Received: from suleiman1.tok.corp.google.com ([2401:fa00:8f:203:b09c:3d84:6735:a65])
 (user=suleiman job=sendgmr) by 2002:a25:ddc7:0:b0:e7d:c11f:897e with SMTP id
 3f1490d57ef6-e81a1f908demr1440276.0.1749195976189; Fri, 06 Jun 2025 00:46:16
 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:45:38 +0900
Message-Id: <20250606074538.1608546-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Subject: [PATCH v2] tools/resolve_btfids: Fix build when cross compiling
 kernel with clang.
From: Suleiman Souhlal <suleiman@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cross compiling the kernel with clang, we need to override
CLANG_CROSS_FLAGS when preparing the step libraries.

Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
when building tools in parallel"), MAKEFLAGS would have been set to a
value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
fact that we weren't properly overriding it.

Cc: stable@vger.kernel.org
Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as host program")
Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
v2:
- "Signed-off-by:" instead of "Signed-of-by".

v1: https://lore.kernel.org/lkml/20250606052301.810338-1-suleiman@google.com/
---
 tools/bpf/resolve_btfids/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index afbddea3a39c..ce1b556dfa90 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -17,7 +17,7 @@ endif
 
 # Overrides for the prepare step libraries.
 HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)" \
-		  CROSS_COMPILE="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
+		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
 HOSTCC  ?= gcc
-- 
2.50.0.rc0.642.g800a2b2222-goog

