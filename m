Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A01DF267
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 05:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749188292; cv=none; b=ugyZKxTpMuGinxKNygHi9kHw59A5tj9L1pvyW1Ve39gonWFRC5QSWr1PhpNEE1NUX12lqZDmcwj7X7TGKy7uXvBfMw6nR4YJ7cnXc3aHK1yef2v7jzLVHMRVKXYuI4hlkQFlU4BgzPTC/QspkuXZtPhhFkza/tguuKvu46Y11mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749188292; c=relaxed/simple;
	bh=D1qVR2rPayReMgS7NuJBE2UqOfY1+vud49wAOQyN/PM=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=BJMlL4XD8ia/YuGI7wIu84BijryEwD1yH6ugMGIYDXuopaUoUfWSEjPoAh3w9aWLGREFOOJqQoW0tvlU700s93nAAVBgPKsgay0b2OA43oWUhgW1ve+VHgPnfxY1dcaTGtE0oX2NPJHNiEu640K1KdPvA4ARqujshXNF+0sW/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqI7ooiE; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqI7ooiE"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-70e5e6ab756so26038517b3.2
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 22:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749188289; x=1749793089; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6e8z1Y0PM6ePVKE7akB6cAIu/1nUvlhiiiW5g/fTl7g=;
        b=UqI7ooiEYJnMcsy74xMk8x2PlWqinuXpZbM4OSmsjAGjddusBGJVJgnXXnJNLqpepr
         30FJSecSo++hEHS5lzhv/Tc9fT2d5uCuk74FTpGv8Uqi7DyhG11pPwPD5AaitPqzn3aK
         AX0gMvVoKY+qLcWkgKzT2iMiLP2KJ3dpr+b8JhMumukS649w66igeBucrG/vVP3OZr61
         6jd8P5zQjdNzQAG0QFw61HA4i4Ifjd9dVvXSIQOpbDR4AB8dFyEZ8PUKSbpZLI4o4dzE
         EQD1wi+fOlexTMkblERz8SiejLJ2D3k/sen29IFqR9TbYAMwGOpJeSb03ToJ0F7ucHtS
         uPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749188289; x=1749793089;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e8z1Y0PM6ePVKE7akB6cAIu/1nUvlhiiiW5g/fTl7g=;
        b=EgTvtjS6MLnyrxkwIuBEMjdIafNFg2rFUw86Ppi4Q87D+kwA2ffWoO75pAJ0zbyCmZ
         rCHvlThHNYzbd9sRJ/bPt3U2uelouZg/QlRg1DRxez2mkkxR96hkFOCsm6cXJkuTtZmb
         wpUWPaalzdJl/osBteDJdWAiJaSZBk1WCBbvDvZ5R1UybzGtYrl92UF708+8AM3yUI56
         hGYB4MbhnvYPozYxEn6jaE2dzzwTdBJqI3Ck2uS6zKNSF3Z+XSSF7tApAtU5kpUt3Bk3
         FUMbqz1ujrlkD5oPu5W9rrpRbPKO+ipESBmj2BgC0Kbqt1IM1OdAYXmy5lmWXe2Dtrho
         sAtA==
X-Forwarded-Encrypted: i=1; AJvYcCXspN4B+rog7dLShp10j0g/CtTvsvtEQa6ejqQxnAD3SHxPV+nM3/A63IQSsbrP4co6LwnU@lists.linux.dev
X-Gm-Message-State: AOJu0YySKcDigw5+wuweMjkejFZ7Nsbf5bTXTh3dPGVMqw9VYiXOOHOa
	NzS6PnAcGSBHjy/dSHFElHmmqb/6brhYjoI1CHAFaXXuoM8ORUs2siFUFZShh+hLNLVKUPW+Kj/
	EwhfnRz78qneGUw==
X-Google-Smtp-Source: AGHT+IFS+GD65k0hSub3v9ULn9x30VGz/G+3YfG6wahC/QEoNt85ySmK2qp8MyMrEf3ggnp2Rl7EW06pkn5awA==
X-Received: from suleiman1.tok.corp.google.com ([2401:fa00:8f:203:b09c:3d84:6735:a65])
 (user=suleiman job=sendgmr) by 2002:a25:a44:0:b0:e7d:c44b:a4a6 with SMTP id
 3f1490d57ef6-e81a25deabbmr3028276.8.1749188289448; Thu, 05 Jun 2025 22:38:09
 -0700 (PDT)
Date: Fri,  6 Jun 2025 14:36:50 +0900
In-Reply-To: <20250606052301.810338-1-suleiman@google.com>
Message-Id: <20250606053650.863215-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250606052301.810338-1-suleiman@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Subject: [RESEND][PATCH] tools/resolve_btfids: Fix build when cross compiling
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
CLANG_CROSS_FLAGS when preparing the step libraries for
resolve_btfids.

Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
when building tools in parallel"), MAKEFLAGS would have been set to a
value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
fact that we weren't properly overriding it.

Cc: stable@vger.kernel.org
Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as host program")
Signed-off-by: Suleiman Souhlal <suleiman@google.com>
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

