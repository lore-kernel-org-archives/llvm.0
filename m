Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F212609C5
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033342; cv=none; b=KY+Zu0Wruq36w4IFvTcqcTL4J/tbeT8UuSRk6FKTTcFmEom6Rfph8WSsk2Q2XNYhrjXU6S13mvyom0d7CAHELh1YydmtL82BC5OZbzEyBX5yNhimJpLSH047NZWLdNY2wOYMSeE1b5DSMqUg9HGlbTrAfAgVgww1M85tc1FBYmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033342; c=relaxed/simple;
	bh=a1OE5bfqiQpD3wUqlPPLecFwn0/TgL4JwzH7YA5a96I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=qpohYBKouPdde3OqcFEyePCHvsT81LUtxUaJ8+U0qR9UlX8nVOiPdBh0fzTfveYKLCnyzjd8Az1JdvY9pPQc/s/pcnNKBDbncdsErHbGZawb1VwHlua/YYQrkHUh4TLIoVeXqmMpCzwG3RN7QCuEy52p2Lzmg2LMjUela0XCQ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PeIMc1Z9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PeIMc1Z9"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso77244b3a.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033340; x=1746638140; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2l6EpSn49twaG/1RM3U2XqpvkRe6FWEsiPTfIGBFJKk=;
        b=PeIMc1Z9Hby46btrrqz5JqKald6Wl2znySmxsSnVKdk/2rEEyw5h5ByEbk+fnCeSaL
         hXNfGTAyVVn0F2bjOLNZkuLH5JfOWfamUJNR54bd3+y42D4kGbEpV/7RJwDyRRBfTym4
         LdUwTX78lRrvtSEwkY9PaWfhPyBlevojR4HfGZxK3yyRfMvLNr7S54DfVgpRY1Cxvedw
         4ePq+3ySk76sJm9fYbT+DDchIwKpL+HkTcT98olNt33WI4s+NfzjymqEBCWZDLMm65+I
         Tu0zH+QoXP9cBZoZt8K/dZok9S+LLx5QslJj+o+5nOvP82T6p7/mnTl3FGq+37HfWTPT
         Xrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033340; x=1746638140;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2l6EpSn49twaG/1RM3U2XqpvkRe6FWEsiPTfIGBFJKk=;
        b=srzzvswusuhRisyeaW49LvG1xI/3clvqG7cU+CnUbG6pcHhta8aBw/Rk3qomMKEgbt
         4DIMGACPL2grScebARQ936eA+hgKVzHFdCMqye9XMgsg//8RNGnZqrn3YdF2al98gqbH
         bnDLUSQZPCXzZK5jHxsw1/hVMwiRWHZqKGUUq+WJYcZ2iXC5LPfix+L7G8xIldwEFCFf
         G5QO0w2Fm6ItzBZV8etynmvWv9Qc7Pben9K4p6zYwpyLKDjD0TgLFQxEHeqL2xZY0cYW
         HhwfyjgGxA/VFSY8CtQOXr7LtgYrmRMlhuCheislMxTlV4/Gtzn8vv5+rRJnVN3Aa6Ch
         mTNg==
X-Forwarded-Encrypted: i=1; AJvYcCW/LQ2GSCnjqYddi16PEuqQoKX1aWuIGOjgBvncouvdKy29yEblDr2EMdPisReZr1EhAFru@lists.linux.dev
X-Gm-Message-State: AOJu0YwRxIdW+624tkW4mUXSyS3MuioLw/5CPqmRvxB7nADZhZxLnula
	zfKtymI8aZdpShnIRHmZyM5p40S6lLlQ7AtBl2LWadnZr44WfypBQtIq7dLUy+IyjNyEyrCE3vf
	IeWFNqA==
X-Google-Smtp-Source: AGHT+IHwG7pdNLiBaAM24HThjkOi7tLfoBL4L6u/i7asjEelEVXiAdsmMsTUPy8p7bw7xwkQu9IheoDEPmPe
X-Received: from pgbfq21.prod.google.com ([2002:a05:6a02:2995:b0:af2:3b16:9767])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d8c:b0:1f1:432:f4a3
 with SMTP id adf61e73a8af0-20aa2fcc884mr4171936637.23.1746033340179; Wed, 30
 Apr 2025 10:15:40 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:29 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-1-irogers@google.com>
Subject: [PATCH v2 0/5] Silence some clang -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

Clang's shorten-64-to-32 can be useful to spot certain kinds of bugs
that can be more prevalent in C code due to implicit 64 to 32-bit
casting. Add some explicit casts to header files so as to avoid the
warning when these headers are used.

This patch started out as a single patch in a series for the perf tool
where a bug could have been identified were -Wshorten-64-to-32
enabled:
https://lore.kernel.org/lkml/20250401182347.3422199-3-irogers@google.com/

v2: Rebase and try to address Arnd Bergmann's comments wrt the commit
    message. Arnd also mentioned doing larger refactors, changing
    return types and adding helper functions. I've held off doing this
    given concerns over breaking printf flags.

Ian Rogers (5):
  bitfield: Silence a clang -Wshorten-64-to-32 warning
  bitmap: Silence a clang -Wshorten-64-to-32 warning
  bitops: Silence a clang -Wshorten-64-to-32 warning
  math64: Silence a clang -Wshorten-64-to-32 warning
  hash.h: Silence a clang -Wshorten-64-to-32 warning

 include/asm-generic/bitops/fls64.h | 2 +-
 include/linux/bitfield.h           | 2 +-
 include/linux/bitmap.h             | 2 +-
 include/linux/hash.h               | 2 +-
 include/linux/math64.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.49.0.906.g1f30a19c02-goog

