Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE071C5791
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563296; cv=none; b=a/C3QknNYh+yfWXcQtN+XtCSAgwr064IfLkv7rnuw46aTUeClZNZK3aLZX0DcBs2+l7BhmtOPIOcRep6hPC50dRX86T3/FY+HJAso/GxkrZNuqPgXGPgMoVu7OHQc3UPys0ml1sRKSxi7nkZqrDrgtRcp6pqwMNrx6kUUeJ/V1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563296; c=relaxed/simple;
	bh=9CZ10MgdUs33tVMefWojRZ9mEtCTbVIyu5tPpcOoyo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jLWcCWyUnLDZqAcQ580RrT3BNUpuzvkLDa5e4fgG378ZJmJmToC8rwWapnRPydZFS5sKZ3j2dkU7fYj72/ynCvpm2OhQoX7jpO3Oivwe2ttDiq5aRu7A6kDP1dGQEx8s6vYx1PPggAXfiRQ9IMFqAETVyxo7y9wDApsqNGzG8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNKTc5XB; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNKTc5XB"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e29142c79d6so207645276.3
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728563293; x=1729168093; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xrd6A0+7MH5QHNBADjPQsyGPWVF0M+W3GXfNip5cqm4=;
        b=NNKTc5XBIMBkgMY9nakQdak/3hjo4LCvB1B/aeDxvZo5ct1PxQ2XlAUjywSj/mqFyA
         lxIDTBRVMyE8xmqccpF0NVI0vmEKvOoxqYJNmKso67gn4SRsoJX3DQ4QoOFDXKtIwai6
         t0j/USxPeLxoRRhVau34B1/9q4996HPW5nHU9bxJUe6M5xWfZ15AIazUDA7QLek9fFD/
         2EMK3e0yT1ImHc7We51eg5gl2VE+L0m+VKq/pQJ/AWW9i8Nkb9xY9+TuMSJ2uBoqgpAM
         pEd4C7GlFfxdVBdU9W2QLYHYMNKD1uqOFiEsKtdxLOaXc7bg6sI9eKruONpd25sa1BNT
         vLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563293; x=1729168093;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrd6A0+7MH5QHNBADjPQsyGPWVF0M+W3GXfNip5cqm4=;
        b=XEk0rXWvR2ZM7UxZC9jd4pNFX1DKy+lf2j5O9f8tjI8gq8RX4vXEi7NKtTdblmKqHf
         GkqxldLviAiwoHnCn5K1+DJK6wJ3QbSwrAE5Sakw3R0cb2bkB4a6Kmw0zpNwLBMeEUSC
         3/xqWpTeqNkDLoZB8zAE+haGgOt3HamAFIDIkbI4M9BXeCY8wxz2YpVWRDw2Q/JHyS5C
         Fs1JsN/JIFiPF6DfO1iPhlogVjf6q8rIGHkZJ72lMRdLF8FegiAt3T7VqiTGOnWTNsv0
         YWBvFKPx753FoPEXpdQSuAOyC826pCwixNXM6O0IIthz00zY5EteJjwJ5ef6vcnccPdB
         04xw==
X-Gm-Message-State: AOJu0YzVh4dzS12nb4Lf9r5/6KUYCR3YqRhylVA3OR4C1e8FR1ugOAJh
	eIjZT6wqzuKESjvdI84fctA3ZP+98l7blyAifRiyW2AW5FNPnfZZl+2bRNnx9aphE/qNQg==
X-Google-Smtp-Source: AGHT+IGQCZqQHYW7zF+uRL/q5WaQLuKiFxw1NPqQF005s3WsaDa4bCSOkjsRCv2M8bA3TMVImRIYhD7C
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:c2c1:0:b0:e22:5bdf:39c1 with SMTP id
 3f1490d57ef6-e28fe45b504mr3788276.10.1728563293508; Thu, 10 Oct 2024 05:28:13
 -0700 (PDT)
Date: Thu, 10 Oct 2024 14:28:02 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2776; i=ardb@kernel.org;
 h=from:subject; bh=pt3xJmvifUh1VzI8I+YsoMxUTjanH+VXWtq5UYuOa4s=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ39RFDLxT8JElr3ZoiZXJPxy/tf9e/KJ27Dlh1bVu00T
 Tnv376lo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExEZSMjwyo+Y3Z2IZUnCk23
 dnn82pM9+cVEawVlx/uXDf819NsH/mZkeCAmyeXpybmk4WF5a/KJ2z/4lmRarbtY6PbaL5D9z5t 2DgA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010122801.1321976-7-ardb+git@google.com>
Subject: [PATCH v2 0/5] Improve objtool jump table handling
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Jump table handling has faded into the background a little due to the
fact that jump tables are [currently] disabled when enabling retpoline
mitigations and/or IBT on x86.

However, this is likely to come back and bite us later, so it still
needs to be addressed. Given the difficulty in identifying jump tables
from .rodata references and indirect jump instructions that often have
no obvious correlation, it would be better to do this in the compiler.

This series implements [on the objtool side] the suggestion made at GNU
Cauldron this year to annotate the indirect jump with a R_X86_64_NONE
relocation that refers to the jump table, and ensure that it is covered
by a STT_OBJECT symbol whose size accurately reflects the size of the
jump table.

This can be wired up in objtool with minimal effort. The only
complication is that indirect jumps may be direct jumps in disguise, if
they target retpoline thunks. This will result in more than one
relocation attached to the same instruction, which needs careful
handling in objtool.

Other than that, changes are rather straight-forward.

Patches #4 and #5 update the CRC32C driver, which has a jump table
implemented in assembler, to a) use a relative jump table, for
compatibility with linking in PIE mode (#4) and b) make the jump table
more difficult to identify by objtool's existing heuristics, but provide
the annotation so it can found nonetheless.

This series is labeled as v2 because patch #1 was sent out before.

Changes since v1:
- tweak logic in patch #1 to ensure that all jump table entries are
  covered by the same type of relocation
- use the corrected addend when validating IBT targets
- add patches #2 - #5

Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>
Cc: Kees Cook <kees@kernel.org>

Ard Biesheuvel (5):
  objtool: Deal with relative jump tables correctly
  objtool: Allow arch code to discover jump table size
  objtool: Add support for annotated jump tables
  crypto: x86/crc32c - Use idiomatic relative jump table
  crypto: x86/crc32c - Tweak jump table to validate objtool logic

 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 40 +++++++-----
 tools/objtool/arch/loongarch/special.c    |  3 +-
 tools/objtool/arch/powerpc/special.c      |  3 +-
 tools/objtool/arch/x86/special.c          | 43 ++++++++-----
 tools/objtool/check.c                     | 65 +++++++++++++++-----
 tools/objtool/include/objtool/check.h     |  5 +-
 tools/objtool/include/objtool/elf.h       |  6 ++
 tools/objtool/include/objtool/special.h   |  3 +-
 8 files changed, 117 insertions(+), 51 deletions(-)

-- 
2.47.0.rc0.187.ge670bccf7e-goog

