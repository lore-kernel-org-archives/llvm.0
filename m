Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602684;
	b=1Mp0IgZABahDyhutBuK9OkC6eWAzNNwz9pf36WLbiF/kaJr9QkOD+ymCgQQg7LMnfrQy
	 pg35yl6Fe3DelyOz7lHt0PrSYmmmIwfgieoJtVoFDYbI7XdMDSxXRTHKeVn7AQMUPJEQT
	 /0Jd2fhONZitM2X7SbcsZV75ehj9ksxj4ETKcwR1SOoiyluDVkTPtIqoX/7ldjVarkjG2
	 owgOBRlsrhhBbhDjPaWph52SbJPcVkvhfHzfnW3QW7aR/pAlatugkeDfAwVN0S8XoRs2R
	 /Z++UpiEk9oZCK7ebQ/ulRX1JoRUi3W/nGl9Bw1nOIkQ+kZ33N0MapXOhUZO68KY9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
	b=Sq/Gmnkp9WW9moe6WyYCH9cMPKHPxkDbFi3/Gv4d15VzUnfNom9tJ4n6d20QfkN9gRyZ
	 Iu0cXA6YQoQFlWvh9qfGY4UbMkrO6v3AU6TtWRbMeiM14pQsDYMIC+0PCL3Lc/td39ZE3
	 cRNa8lcSG4j1srgwvuy0SnozHf2riKuDYJr8buH+RLEFMmHjxvpUnFXATvZgsoCdC4St9
	 JkOez6pimlF4XmTLh2y3QztIcSsCk5FLMyRLqYm1d04zVfoIM7pvZc1mMKDQLGoAgEO+/
	 /tgJqjkFY2uJZtU+z0JqQbvE66q/VijLhJlTHVUfmXfHeeuXouX8ligA9e7UEAk7pQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sX0Nk0Uh;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C93606A334
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C93606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sX0Nk0Uh
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so826186c88.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602683; x=1793207483; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=sX0Nk0Uhuj65E56r8/lqgFMUAriLxFPFCC0wqOqxKuBn0jRovUZ0JLcAlUnr/vFny/
         vcqmt21Fxp1H0PGNUK/xMPznronu+nCxt1taqdvdq2hhGd2Ld8VI4IzAJ145Mtkk6Z72
         HF529gzQ68614zxGPiNA/OGEENFtsAtIKGsNp02JiOjUB15WcPaDQLEsZuwl3qYYnbQd
         7KjvqDwp1kqLVX67wAAHLRAO/l1ImUgrW8UfItEzNaQRfSAvl6sf4rAVo0SNhfy0/fu7
         6iM99phK37UkJJ1pzUehGmpSRMd+TpHkXxNv8Yt8frF6dpaRP576lwCqscDcXMTnxX58
         /gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602683; x=1793207483;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=us37jwkEKtyrnJNottU8e62vx7byXLrU2KJISEjYDNrBi2TU61L07G3sJPTHnj/2KM
         28zI6WH42Artq+zSONhAiXkyZFscDTBmXEh23KnsQEA3oMXXw7SUFu//JRa1omluuVkA
         2w3krncyIJf3wvaPb4ONTOUvBlqTccU4ZqQzW+66W97YOGRpmr5pTzuXNJMm/wUv+2zl
         fzUDhkHdZ9+jSylKrBdgVxtWhKy4S72ac7rKoRalgTFENajqdW7Pp+C4CediPJ3qHYng
         eLnEjQyS1NrpkQAmTyFIBKdHxxkOUsAh/Ud/zqhBVRz/A4XN/BXhDGKJcwv+V0PSIaCI
         hAIg==
X-Forwarded-Encrypted: i=1; AKwUvBxfz0v6hq3lxHtXuFxZZwe3kmPpSLZVP5zoIijPBsuucPOnaIHBDKu4K9yfA+4E7yWgqFra@lists.linux.dev
X-Gm-Message-State: AFq9FYLgYk3ernVMAnJub37IjN78Ihzyn3MOITX5eYZpnmw6odKf9GU/
	2pLA4D3s19QzSBIPwEV/8WtjXmED6ujCuJO4FylQXhjUEQoshAL/bMrphCR/OMserlhAU8amit3
	X2l76I1MClw==
X-Received: from dldz1-n2.prod.google.com ([2002:a05:701b:4181:20b0:191:2838:ebe4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:906:b0:14a:8cff:fbb8
 with SMTP id a92af1059eb24-190a6adabb9mr3548333c88.28.1792602681890; Wed, 21
 Oct 2026 10:11:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:31 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-6-irogers@google.com>
Subject: [PATCH v6 05/17] perf build: Enable additional Clang thread-safety flags
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
index 3eb8d095cda0..b50702bac53c 100644
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
2.56.0.218.g1ec904b173-goog

