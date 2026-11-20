Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201493;
	b=VtjxQzXzS28dlaVTDiXwsIcLVUHp9Ph0cIeHecgrzuw91THmEqdrMmxuYtHrFqX9frzS
	 msBL2HAr3WlxDLnao0yq7LxBDsNEwHmouAIVbQpv2UE/nNLX7BzqEmWpQJRGSgxWzleoC
	 G2+wLUd1HrAC9vRhsJ4IEz0/8FNu7bCfJcLwoMw06OajPAkYezNTUyzrAbQxVbgdrABdt
	 I3cT0kNmKCL8G0bSHP8dYsCEt0QcnL69BsQkjm0FL57ypXGTFDjE0yXfRlQcLHUwdXDHg
	 6WPxQQkG2E22wNrFf6Tc8gPm2nLwzQCpwYjHSjRSWAuE4dHmTDDoRPfRFsVZQQigKTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
	b=5e2DzKAMKsx55+yML9IVbj+H5uITelrHUm8AQUfq5a3pmqUp8Brk2kCec8mH/5JBD6dB
	 hVATbTmcTsIriJFnpbCevi9LHcJG6F0LkxE1jvJsQFKFDY03aID7BbzGajSFWZuJ0JvdW
	 oEy9+ioDXQ/H4x7iT/kXToWuQyXj4zH5loAmF2vRBVLtu2QMhnIe8mr1v3HQa61GvoPqp
	 +eOHN/gY+iSrtSJ+g5McDaB79NLyJ8VoiVvQijWfCx9xyN6Y32WpUWngTa87ouCubW4ws
	 /Mc37ZSOGDGk3l9vGOsIqln5a9gRxjusGOrk9picMGkBUDCH+vZ6gwV9MdccS/GLecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQ0qe9Ym;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB160A2639
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEB160A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQ0qe9Ym
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so1462196c88.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201488; x=1795806288; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
        b=XQ0qe9Ym7tKexHvTHw0LWTvLsLpf7JzlEPdmV5zT0h8IQNdX/sok6RXM31Helr2Y4Z
         agseRZC5ahJ8ArEt4rq3D5m3gqtlBC9+4Sfn6D91MvDsTH2wkQiwC0ANkqSXGaWhqpqT
         pZXRltlAE1Ny7y1/tRcoW3ZtO8WSg1Ub8SdptJeX9zv3CiDE5nWzdNHXh/MIP8V6il+X
         dmOT27PaSDb2AuZbdyXr5IcOdTMtNeLSwzezuiq0pKggTBcziw5rDAQ3axd0ZYJA4AJK
         /5QKlFd6b/dO/UH8ngFHora4Pp+xQ6eFBokyvrCEEhNz5QOr/xKqq3YbT/7aIv4u9ipL
         2Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201488; x=1795806288;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YJnl7El3slmkshOvr0+1chxjOsuXLroAPhlYunUcz0=;
        b=vXXXs1MMXUZub0PqtJG/wK+niqkMsImpCMzoGJ/cwn3vNTZbMEyPd7UTywlrmsVKsR
         kD8DdTD6pMa01Jw34Fbs1fv20bEm9GeLhaE8FXtFrNHWnzxjW9LKlhTs9JguIHcijhOo
         JROK5EuCQB/eMu6a7q34h8iQrAi8IUOz6IckwciSY1/ac5rxQ+taJdIJ70A3JRxcqe9t
         j6eubPbJcGFJNikvc7secJUTsAz4Vf4ZN4hRUjmk87dA/U09ZBwVbVx0aEgkHabuOFjU
         UdjeaE1UatxBhou98Xc1rsLnZLMpqsz5wO7JzQ5EdFK36tiG57l/W3eBvY0gMK1RWWod
         EgpA==
X-Forwarded-Encrypted: i=1; AL+hErEgltMkx9FSM21eKpO4GmO9IL0VwlafTMjl5JRAUNcfJaSVG2jzLCB8oEhSrhjjvn4QaxcJ@lists.linux.dev
X-Gm-Message-State: APuU4Z/CmqVKbAPuMutT/1IujdW9IoCpIcOV5PuSh6/oNL35jWgBfj5Y
	AnYlHCynWUIynY3ZYdaNaLnRxCKVf6EMIcXQ44Hp2hkuOivDIvjfBsEetJagkcL5jC4pcNZEWpl
	m/w==
X-Received: from dleb16-n2.prod.google.com ([2002:a05:701b:4250:20b0:1ac:2245:a27b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f18:b0:1b3:9b4d:85f3
 with SMTP id a92af1059eb24-1b5568a28a5mr4184379c88.19.1795201487874; Fri, 20
 Nov 2026 11:04:47 -0800 (PST)
Date: Fri, 20 Nov 2026 19:04:42 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120190442.2851983-1-elkin@google.com>
Subject: [PATCH] regmap: guard DEFINE_FREE(regmap_field) against ERR_PTR values
From: Elkin Cruz <elkin@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

regmap_field_alloc() returns ERR_PTR() on allocation failure, never NULL.
DEFINE_FREE(regmap_field, ...) currently checks only if (_T), which is
true for ERR_PTR() values and causes __free(regmap_field) variables on
error paths to pass an error pointer into regmap_field_free() -> kfree().

Guard the cleanup macro with !IS_ERR_OR_NULL(_T).

Fixes: 37983fad7f3e ("regmap: define cleanup helper for regmap_field")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 include/linux/regmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8f3034881f8a..572dd6f0083d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1484,7 +1484,7 @@ struct regmap_field *regmap_field_alloc(struct regmap *regmap,
 		struct reg_field reg_field);
 void regmap_field_free(struct regmap_field *field);
 
-DEFINE_FREE(regmap_field, struct regmap_field *, if (_T) regmap_field_free(_T))
+DEFINE_FREE(regmap_field, struct regmap_field *, if (!IS_ERR_OR_NULL(_T)) regmap_field_free(_T))
 
 struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
-- 
2.56.1.750.gf70dc682cf-goog

