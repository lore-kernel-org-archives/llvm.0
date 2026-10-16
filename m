Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D958B6C7
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171893; cv=none; b=SUY2U4K3czw4UgoLP/WB9EYQEgnAnhNa8P7f7YRGLgSGPuM3zft+F9/JU7VqMu05lk4C5cEeW1kC725TONlB+vQ/0eu4o562CVsKdXmkKcBD0ieF0AnHDkjOqS0zzgYR90oHDEjmDhnQFa3wqE6d3w9fpitzrYNuvHJtIdTwFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171893; c=relaxed/simple;
	bh=XntgmLX4cYU/6Nf79NgEzitDFOVw7AFEttdr1X6z+5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jUWWbp5jQn13K51myusnUkNrt7BqvZmVquZyz/xvQIoFk7TQ6hG9BqL8wAXHmkAo9mlkWl9sm909eanqsfszuT/RyzB6Z57HgT12jkDb0LaCtl4mgZctTVR6b/xLbcGEzC9ct7I00PAqPjfUUVQnrwxSurRJpEq1f/m1TNb2uCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/AkF5Hk; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/AkF5Hk"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso265518eec.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171891; x=1792776691; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=t/AkF5HkGY7BcUbcXrpFbOhyzamqN8SED87hiUFoyFrvMbDOjwu8YJvHdovxAotDju
         1gv632OnnqnFOKN1WvjruHvLYGt8QMqFDW7pMrXmyn+sDr8HdyvsEroHWqSGL/Zu9s8D
         mz/A5EJnOeyftauMaSLFUa5y1rfG74CieR1lF1lLjG/Ypj2DcLwbNc7vqYEqnUiMVi86
         bVwMXTHkf+47ZD8Y/ScxIgOL1cF+j6xSa1bPsPjdIIN6qnfYSPiTFaQcE4QVdJicNfG+
         euiUrPgGXDkQRQwg0u5BLA30V5xGVDbo0GQrbd/Wp4ppVO+SAWgFl2N30oZIzTajM4g3
         GfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171891; x=1792776691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=cNp7eDuUA4Mnk8+Yfm0Ul/YC3rkfzA8HJSIZdkAhCMumQ4YMqUKHcvBfBu0/1ewiUh
         T8yY7QOVoInbWcw0BCzELoz/76IOHyLhp75TO3CHvjArA/witbV/UDxtHB1KoxZtv02L
         4r6JwXB4G7d8xhiICG6JccnEFFqNYDlnoAUUq9kZQHF9XmiE6UduDTOWhcP0Z1Rs5e81
         hUqOdk7amxkqpUZJQ2gsWqqCtrnyFEhh9a2FlFYYmNuiBvR0kGNKvt9euQ8yC4M33mdn
         6RI+FiOHeR7YATe7mPjcXrAsgqxFy0JoUaU1N8uUxvpdzPjH0Ko0vFKoPNXpkJ4VTq/v
         DEmg==
X-Forwarded-Encrypted: i=1; AKwUvByNRuqbQp5JJenahh1r9xw0sssQvnUuXOEfpU3QWWuQ5YTdY6LKab6KalyFtviMZI6hxdGP@lists.linux.dev
X-Gm-Message-State: AFq9FYLi1T7Y2kZjQSRBtXmp4E5Bh5G+omdCRNcAzPncaKih2koVnQoG
	XvdoN84br5R+eqrhoa7BpKqdqd00exvZGAAEFs6pROoRY77TEYXutKhh5olsJxPqN34H7bVrGl/
	nVxnC2BeMvw==
X-Received: from dycmg18.prod.google.com ([2002:a05:693c:2512:b0:35f:390d:248a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2a18:b0:35c:8242:9e59
 with SMTP id 5a478bee46e88-361a1860b5amr556342eec.14.1792171889636; Fri, 16
 Oct 2026 10:31:29 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:54 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-6-irogers@google.com>
Subject: [PATCH v3 05/17] perf build: Enable additional Clang thread-safety flags
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

