Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514223;
	b=zhkPyew1IIMB5dfc1vk/wx2NSukkCVkWZ0rFlFC3kJUk3QGjK7rlJwZPqDG+CFEsHwur
	 coVcO4ilwGFGAZDNAe/F7hjh308ozoABMef/e6W62f37g7Z1yWrsxAE3AGE7NX9lxZuM1
	 cRqsFBhU/104n7y6Wo2IdfmsBmTv2+a2b/GFyTZ9PyUplGcHX9RxFCqy7WOcniqoU28WK
	 rFKSaUOGPtiCNHucZTYL2WYZ8pSZSBya/txR3+SsR//MdQCRprYz6rsrwrbXTaGolKxO4
	 NwhBAEKzjapQQIs7n5uyc/+Z03RVsQan/TjS+YspC5kDKy5Yphr9l+ExxXQogmWkaOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
	b=QJOvFDC0782MYn8rYjpOIzHsMpbnp7kAZXbfPYebcgAxYaWvfCyig3HFmSX3ANx4Ul8p
	 GTinygTLIX52y2CQaYKHVUPOMW+SwoDI7M6CtkwBwEkPZu1rjMC0DON/0sjG0Y/6PzCGb
	 j4fvWhsjr5Jh8wybWgTDHo8uJFoHf3CG4f+Jxml7+wh8ygNJSNAPwUIcqpYTgx5V2bX3q
	 dN5eUlretdt0DLdAuj0EVKa2qFXey7nnBAp8MzK4+nR2rQtK/9NRrK5CyUQn8PR/QVzmO
	 rKHe2tUSp8GO3HUJCCVkMP6poa/LIDITwDsko6m7BUajh1yx+fSHYNXbCpjQ7TVV5bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dBLftF5L;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9460A2613
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD9460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dBLftF5L
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-17dc865c94cso1288734c88.1
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514222; x=1793119022; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=dBLftF5L3cViF+w46dm1B5Dm7IoZXjUwHUvvXEb6mNCGqu/s+fGiYp6Cx4vUqjWk58
         GnY/5vGI0jfNreDzBNsL5D49m+5cnG9WdotG0qy8yUAzOXKOtTPxU+gw/eHnJxgQrr8W
         cQVlEghPhytTp//JukfqXbOtFcz3JKqG0py6bP0XHL2NpDtXDRYfB7STcagjHT0qqmu6
         wo13pcTR756SgyvLs3gF8oRx2dRz1kSksDrb3fN1doyYr4eiOqDMqwjSpXoihoXDtPr5
         bK1GU0ocJI2iTj7U0XXOI49qWIi2/0EnvXecEwUm01pFtJkhmcbmHkrp6mDWQimfcjCi
         VWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514222; x=1793119022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=pH8pB8BliznXBGZPvPW+OVxMVRUbiY+ahB/0JSjTFXkxK49ZMViEKh1D4eDSj6b3dl
         kbJAvdlGwqLpBu+P1awjIcV7iO+SEFHGqrMQwJE2J2syGM0kpBnXRPhaQaVy3utnIs7K
         28SuWu7UgQeS6pglGgRl1LL5pv0hnN2+fv9k+82UovBrgnT90AMkWZvd4b0MuiVA+yP1
         zTqDQS42NKjtVOIELLgjtW77V0c5GShKsu77ygeWIes+tGOGSO0h4X6JtkEK6FS4ysOC
         nWgeq8uiZ9PuHHDnhLP7dDHmQr5YoxO53eOF7Ws3bEJQpnGIHe8WQHOxJYFdGT+SN6ND
         ONFw==
X-Forwarded-Encrypted: i=1; AKwUvBzR7CyUX4RtFSWVkAnU0IxVJJ/uF8nyzQnLqa7Zz7UUgP0Zt1e+SwpvDNaV9JZKN7501Fnm@lists.linux.dev
X-Gm-Message-State: AFq9FYIpSMw2NdS3h/PX41pkVVyQBDTpifckcumBM0gS4b+01WGsFXE2
	g4CN6WC1CJxOCgrZEO9rrwgTLwVP/zjV7U9tKz50GwcZS5ADuHQQK8dmL8jgf5NTtCXSOVeGn8Z
	y1I/TpRV5Yg==
X-Received: from dlec18-n1.prod.google.com ([2002:a05:701b:4292:10b0:15d:9efd:93a5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2207:b0:136:c443:80e5
 with SMTP id a92af1059eb24-1876658f6c4mr12120611c88.6.1792514221602; Tue, 20
 Oct 2026 09:37:01 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:28 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-6-irogers@google.com>
Subject: [PATCH v5 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..ce746b12f901 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.212.g129ede20d9-goog

