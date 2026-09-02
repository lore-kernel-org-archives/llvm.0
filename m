Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610744A8FDE
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363271; cv=none; b=PlVS2pA8Bs93sk50CEW5mdzI5rSk3HldaWMA+vas6HbkplL2ixzwkR02xkUmuHmHHseNAG0gVSPScTsounY63X49kdGH4taA8DQiNEEGKRSuScBjbLcxTVVgt2ChvUHSWiP8imSChRqK45jzHe5lCWbepf7aeYoOS+khvAIGQbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363271; c=relaxed/simple;
	bh=aMcZUshoBOiQaH1i02oZJ7ZYpAJh6r6fqQnmy6TPvdY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T36ZdBGT533KSv/4xFdbOuPImJfG5DEZNlaqmzQZu6ovMEtxfcB7+OhwexJOIKZzLxU8E4rayNh3rl0GoCp9ZrL0aN6ynz+tR3PQyBbHN4IZjCp5oJbLzK2qhucXyFhBeq+Y0aVcXKWSe4EONXso4MKlsGEtE3TsedJhKfdEq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hST/0ZFY; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hST/0ZFY"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so23144135ad.2
        for <llvm@lists.linux.dev>; Wed, 02 Sep 2026 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788363266; x=1788968066; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFDJw81pmZp3bkGxaweILlNzJoQ/yJsuk6x1thpaJ5k=;
        b=hST/0ZFYPa2/Q6+5YvgUqMfjeDtWGFuYRiuEOP9mleh2V6Pebgv6MDDO4VZot0c4cm
         NMxHgXnPin/LjCFlLHAV7Ul/g+tS7WZkKli9cFf4w1rY5mvcdUEJOGZU+fzI4emomyzE
         59nm6nEhb1d27L61fVQyrmhequQE8B/7kWugb2guYos4/IAna5+6kwZoMJ8udQJSd3Ip
         rHsNXYg4UuJ0VryVY14nKfX/LjqAewrHC6O2b5xJJvU4fYllx/wXidDfqOUQ4xA7CYuw
         ktdA6Rms7vxzUYDIoqrBvi7I5Vw3Ofj7axDPHB/EE+9WzdPgV4T+gDs0pdMW03o4VycW
         fHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363266; x=1788968066;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFDJw81pmZp3bkGxaweILlNzJoQ/yJsuk6x1thpaJ5k=;
        b=IoTVyqyUV/wViqeJduJkMzmDk+KbHrxJzwrFK7FfeNLZt6GuqmKs4myAARfrGYHrrn
         KwzkG1IGPWudDo/W5TpPOsxT0LPDINlpNrAMQd3kJRmRgG2Pxrk1iC+ELAKY6dzdfXq2
         pntKbwkidiaOxkYEg3i2+lI3ULSTSZ7cyO7U1Ta1NDDhGBXB093W4cJTbZrA/m2oMc1z
         FDTFZCjzeHMOjXk/F5QWfM7rRuNNyA8OQRDngs325c8V9OGZ2BSAqsc+nomSZ1Ga47Lj
         oKoKiExVaebFcjgkTl16P48xsePPRDNPzVbVKBQyJ3jT0g5KrKIoSeRY1JEEvjN++nl8
         UWSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6Z+/nrUE/LvOMfVauL5jCr+J1OwhFEnqp9Vzf/em+0x7lsLWjQQn+k33yiIdehCTXHka5@lists.linux.dev
X-Gm-Message-State: AFuF++nrr7jDWlvHxtas04OQsTgKGBkOUyXs5p/6K8cChQtOzXCd59Sj
	IpDHP0UP1z51w2vL6+5RPCx7l6JWZbK/D56kU5PU7iFrEVPhXAl9FD8J1pYM7NXIMP3SkIxr93s
	Le/yWsRiTiQ==
X-Received: from dybdd18.prod.google.com ([2002:a05:7300:ae92:b0:328:6c15:25c1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:524c:b0:390:8361:a532
 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr8789716a91.7.1788363264826; Wed, 02
 Sep 2026 08:34:24 -0700 (PDT)
Date: Wed,  2 Sep 2026 08:34:20 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902153420.2069344-1-irogers@google.com>
Subject: [PATCH v1] perf tool: Align structs in arrays in .clang-format
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Configure clang-format to ensure structs within arrays maintain left
alignment inside tools/perf/.clang-format. This prevents standard
formatting runs from arbitrarily squashing tabbed initialization pillars.

Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/.clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/.clang-format b/tools/perf/.clang-format
index e4cff363a603..7cc11f84da88 100644
--- a/tools/perf/.clang-format
+++ b/tools/perf/.clang-format
@@ -21,3 +21,4 @@ IncludeCategories:
   # Your Project's Other Headers
   - Regex:           '^".*"'
     Priority:        4
+AlignArrayOfStructures: Left
-- 
2.55.0.966.g6673acef38-goog

