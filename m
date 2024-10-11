Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48420194C75
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666546; cv=none; b=lj4pae0csXhJ9B2XGCeU7p5iz6aLXiXyUmjATZjUxL4AGXbQTFROyHD5QMpyCQgJWnX1eK9aooIJ1HcJ8UfunOrBknY6JL/ZPf/4BEIGTGie/xV7S2U4MmDL5rDABJB3NbAe97JK9rdOu1dfffEoJkhe54zJXrYzBdrLk/1mHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666546; c=relaxed/simple;
	bh=WdW0H/xkNo4OXqWwtiG+9yuctWMezfpXNh+DbKjHzYk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WwpbXSFGEkR2OzBIPLuVhQDNOmg7+8Gu1BHRLC1cW9SDEI61RIKYHQ9bImBWwHKuGrFBn5v/VQV0CXVrU19U189/lmAwIOWf3iNkzkAAAiC4Xk2sdZmiIYMp0K522LkpPNqhTXIKTxfqX+UgE/tfbEYwHu2z0UDxyU9Mk475UCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oj5TFRLw; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oj5TFRLw"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e24b43799e9so2187398276.2
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666544; x=1729271344; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s9z1hvvdUAobVv4WjCQwWo86syz2IIrtsIUrBscrDwg=;
        b=Oj5TFRLwa0FmZN2hxBTZfxH93HS/fEAjTknaIzBp8QuOIs4AQLrRpE2XddDcpHEP2i
         WhwUAtqDYIcZ9qfJ8osTnZb/lM++45eb3R4/qx5sSuAe0sva0DOt1RHMTuWJK6SgB55n
         WUNfusUD/x7oB1aZcPkr2LfqLV96VMCUrV6nnohQZp6QYJ8NW0D847m4daF9+0KV5lmm
         HsIH3jBAjjQBuPQl98DYwN8wT8PUHSC7VLREdsvjXxpiPhO4OOqwoU7Fn6taNCd9IOR7
         HzNwOQ+u13Y639ZGm8R4dgHPVaTKndwxqiPN0ZOpy7KnIj1xt409in2hBA2g9qIo7FwC
         GuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666544; x=1729271344;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9z1hvvdUAobVv4WjCQwWo86syz2IIrtsIUrBscrDwg=;
        b=mWoy7kYkDI07ts99Hy/x8GJTpTGLOuBSgis6iMQvKLuEw5QVYM2rcRI5L8584kDanE
         VQ1PmuXi79eLNuDvuGwvHgZWYrI4tyBxC7QoIn/W0JdP42HEx4t+KJxGioReeBGze48l
         rcEDN/wbRnGvBmE8M9SosBzos3HSvMzvtcATmcRikP/bI/dqKFZOkZUdt9Xy2wgMD1DR
         Uv78J1D2XsmZcSfMU/rvIdrc8BQR1/D36nus46Vn8UTfIGY5kATdlqpdkhm1lDrNEit/
         sZOCG0HpiOKnsg38v0Yp3HslcAB8v4tVOvZRJrZrwTe54gZz+d47WBfVnsWJQM7CnC9f
         0mmQ==
X-Gm-Message-State: AOJu0YyLtzLZO5kA4gUTvYVIkZT1b28prhw9t3i0XzMADzvyFjh/OO1+
	Po22aT538Xglt+sMLinpv05+PfEyATp9X01JzfDKEj0AVMKEAcElirykHVSd2nJ8ih0vjQ==
X-Google-Smtp-Source: AGHT+IFRxjOg1Z+Hw1i2OFyn/oUo9aBkCHaC4sUwZS7ofzyFJFGJOUCJFP6N9yslnShqPpJu2azrQL+8
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:504:b0:e16:4d66:982e with SMTP id
 3f1490d57ef6-e2919de7e0bmr14137276.5.1728666544035; Fri, 11 Oct 2024 10:09:04
 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:48 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=ardb@kernel.org;
 h=from:subject; bh=Q9oH1OOrEVEgRLR+ckXrU6IQwTgLEXl5029WwVYvjXI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zesGD9yrxjKphR73ZkjYwXTZ78ETvgFWk47Ln0qeNZ
 muwL3jcUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayYAkjw+MuO70vp3bOdZk0
 wfHeqmOJlaW2uxh6d9h6i7M/zTkW/Irhf3ip4a0pQUZzmfZ18P178nyzyaMIy587Tium/U6ObxD 8zgAA
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-10-ardb+git@google.com>
Subject: [PATCH v3 0/8] Improve objtool jump table handling
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

Patches #6 - #8 update the CRC32C driver, which has a jump table
implemented in assembler, to
a) use a relative jump table, for compatibility with linking in PIE mode
b) add the jump table annotation
c) make the jump table more difficult to identify by objtool's existing
   heuristics, so that it will fail to identify it without the
   annotation.

Changes since v2:
- drastic refactoring of the annotation handling so that generic users
  (non-x86) get it as well, with the x86 heuristics moved to a x86
  specific source file
- use generic reloc type identifiers where appropriate
- update insn->no_reloc where appropriate

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

Ard Biesheuvel (8):
  objtool: Deal with relative jump tables correctly
  objtool: Allow arch code to discover jump table size
  objtool: Make some helper functions globally accessible
  objtool: Move jump table heuristics to a x86 specific source file
  objtool: Add generic support for jump table annotations
  crypto: x86/crc32c - Use idiomatic relative jump table
  crypto: x86/crc32c - Add jump table annotation
  crypto: x86/crc32c-intel - Tweaks to make objtool's life harder

 arch/x86/crypto/crc32c-pcl-intel-asm_64.S |  50 +++--
 tools/objtool/arch/loongarch/special.c    |   6 -
 tools/objtool/arch/powerpc/special.c      |   6 -
 tools/objtool/arch/x86/special.c          | 160 ++++++++++++----
 tools/objtool/check.c                     | 199 ++++++++++----------
 tools/objtool/include/objtool/check.h     |  25 ++-
 tools/objtool/include/objtool/elf.h       |   6 +
 tools/objtool/include/objtool/special.h   |   8 +-
 8 files changed, 287 insertions(+), 173 deletions(-)

-- 
2.47.0.rc1.288.g06298d1525-goog

