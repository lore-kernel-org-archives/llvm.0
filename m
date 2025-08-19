Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A02882CA
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574820; cv=none; b=F729sqtKs20e4XfvsJ1BpmTCLK1OAJdtMTs+sfpqV9bOjt4+aCHOahBxEW4y9JFXq8zU3TlPFg9EqY2z9TKSWS8jPnpVCshTeHctV/wESdLmFhtTxZ74cqJrCyOr/YRYSKIT0KHhfbGOKrSY1/K8trXMVmRnKhemI9hWnmQH1UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574820; c=relaxed/simple;
	bh=TGw2ul2ZAldEcVHaU0fnT+T9Zm5AaMY7QcEq1fLdVSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVPRMi1XLiNb5NXR2PIzpYnr27fNjSyVl0ljMBsJdFHLAZf/w6XBBFMtQHF6M+iq6RYdZ3LUQdr7JrQLQX3WWYryyJnTSPDtK97Jhw7BBcuYP8ytbOsMfsqKiJ1Lp/CyJHzc1jJEm3iDXR3pFMYkbeijVcVFz/JCEWeeAlK3VMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI70TwB2; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI70TwB2"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-76e2ea887f6so3598019b3a.2
        for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 20:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755574818; x=1756179618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGBbLIiLGqrmFvSwaYDbAojdCre78exL+6ZjHnBuXvE=;
        b=jI70TwB2kHtBETpDb/YBMABMLZOaZcEsZlOTbUnnxBiAL/nP69UxSrALJ9qw0Mtfp8
         Co79ARdyyG83ceOdoh+eTxoW8Jbt5eD5W6fc09MXmhy/PZHXE/Oo5wzJJwPV0IKlK2p3
         0BoMbsmqAnW+Ba0CWZnSCl+NskAcbGS6cnhqDeH+O326TGA8yAC8dNWDXL78MNPG7gsp
         IdNHgEkFB7Ne09APVvreSv/SPq5lZIRwC+9mi3fth7rCMu81H10vbbI7EzRPk8qwTNIf
         3asoXyoO5Z+fPUrkna2V3rV+oHtpl3+uW31pITGfmVsFgJRLg+PgwTnyeviobAdWQLsf
         dxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574818; x=1756179618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGBbLIiLGqrmFvSwaYDbAojdCre78exL+6ZjHnBuXvE=;
        b=J6Ec7qFfwMPzqB35WhJladWhyYQ9r1dlqQvlxBZhUN+SzlU1vs/elqRVSx5iOVmk0h
         9aPjRSWzFiGytajEHE+0703OJ+S4HUSFssW/nSUvOTCWAMPncS6KagyU0M+O5p6R31aT
         K/rNWHrinI3HNegNshjnPF/U4OquXWHU/OCxG9H2WShdQKJ4NcZShTRpgnZ4tR7TLS47
         v4V6+KDTSGzH8Awi0CDjYZKTdgxKaG5yRwx1G9I4rYcvTbT7PHNTON73VURJqwO9q3Mt
         1QNZjL6YUVx7dMRPbMJMp5mz/LdP4OBHgx9sAinsN20BkJO4InN1h46XjYBoJQqAjrIo
         AIEw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5drFlssj2tJ2NkPEaNp/wmbTumW/Ab3J9tpdXadia4hB7PuD9h+6T9IQo8pd6jPlsIhC@lists.linux.dev
X-Gm-Message-State: AOJu0YyiTA7xRqJYUo2CU3qOJSCIyCdyWmFOClUtdo6bfeKpcSitl0Aa
	is4Xwn5PVl1KxDBat02akUR8+zOlFl/LUv9bXbZyodB38wE9kdCccG6Q
X-Gm-Gg: ASbGnctBS/jdo0HCAtbg03IWkVY3b7S30SkNdzn8GTCC+D83Q77Z6JMMPcrJ8ZUii1E
	L6r2H6vm87wZv0kvbZyL03ejJAOt9rC8Jq0YTLJZqpPZa2uwYgkM0h0aEepTDGCULZByvwTqLCD
	tgmQfi8Z+SidX4WLZAxUfHypOE/GtXPU6gvPYkJtoY4Zr/IUx7w0N80MRo4B0pykCI/zn32NeIu
	btuoYRkcXJSBBp2yC1/uJemoViJGI8bYdQ7u7iLCxaTerCHjARq+ekCp0DKZy5OeCe0D6HePbCF
	CWWIWNn9nbNMrEW83NlyTPAkMbMonIkdX6JZi1sGJatNIRpvrQM8I03DIjWpbzKRYRWK73eU+gJ
	ofC9AtuYjhjidfn0WQ98=
X-Google-Smtp-Source: AGHT+IF4R9bdzNb3/9hrsjsrr0p8U2Js2+EVLDDxYI98NMhZmCYvt0+xwcxGQlfFKVcOuwBibBiaiA==
X-Received: by 2002:a05:6a20:1596:b0:218:96ad:720d with SMTP id adf61e73a8af0-2430d2c353dmr1422612637.1.1755574817578;
        Mon, 18 Aug 2025 20:40:17 -0700 (PDT)
Received: from 7940hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22b8sm1109804b3a.4.2025.08.18.20.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:40:16 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	mykolal@fb.com,
	shuah@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next 2/3] selftests/bpf: skip recursive functions for kprobe_multi
Date: Tue, 19 Aug 2025 11:39:55 +0800
Message-ID: <20250819033956.59164-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819033956.59164-1-dongml2@chinatelecom.cn>
References: <20250819033956.59164-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some functions is recursive for the kprobe_multi and impact the benchmark
results. So just skip them.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 tools/testing/selftests/bpf/trace_helpers.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index d24baf244d1f..9da9da51b132 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -559,6 +559,22 @@ static bool skip_entry(char *name)
 	if (!strncmp(name, "__ftrace_invalid_address__",
 		     sizeof("__ftrace_invalid_address__") - 1))
 		return true;
+
+	if (!strcmp(name, "migrate_disable"))
+		return true;
+	if (!strcmp(name, "migrate_enable"))
+		return true;
+	if (!strcmp(name, "rcu_read_unlock_strict"))
+		return true;
+	if (!strcmp(name, "preempt_count_add"))
+		return true;
+	if (!strcmp(name, "preempt_count_sub"))
+		return true;
+	if (!strcmp(name, "__rcu_read_lock"))
+		return true;
+	if (!strcmp(name, "__rcu_read_unlock"))
+		return true;
+
 	return false;
 }
 
-- 
2.50.1

