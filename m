Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDE1CF7AA
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666563; cv=none; b=m2V/upEprY5HntmUjTwsI9apaiez4ByDzgTTJFygRhIt6BQvJSadlKn2McXUSCN810Q2oYIwoU6S9PZvvlZd4HmNg+9Q7qquHboTjzFk8cpmwJXGyHJaFQrvMiQuvq1/P6426uHCO1dh2b+dMhM0Qf1qGafPPrTgPSwt47U18yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666563; c=relaxed/simple;
	bh=2PjQVk510tcbfgZib7AgPxWnnYDh0QAwPChoXMnvxLk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rz/OY2c79yAFBFWIkQm70/I+pHUscuvJzSLQH6ioqYJqSv1s8TSd9WCLe43sUnyOeUcREB8WNfTbtkB98OH6E3RwWbaY9Gy3CrlSsNu9QhqcwqiUv1cU1Kw9QfVt9poq1FP31O2IkivF6OMOgImbZOLo8lyRjRyhwFK5QFm3nQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fb88vrrG; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fb88vrrG"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so3660705276.0
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666561; x=1729271361; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EqKDRpMnKUFDCBzPjda6uGGHQMDnCKHOVUyUzH1aSkY=;
        b=fb88vrrG1BkgZjebbOvj47mlDSktjEC2jpfRSvOHYgsgbiQIUhOhOP2O9GNRCm7p9b
         zAhnwLR11fsXGljuOSKM80lOV8CzdcQDU5yeAAKaMX3itERKSCDVCT7y7iQPANLkhaR7
         XZ/qQ+o50Vq5uHF2fGTLdV65nOjGkT67x9U+35b7E3Y8iaADs5FI7dicWscwn5YrUjsd
         rZPz1gdWIb+iQpcW4k4hTEb/ywQKSiyKkwnzGEX950udtz23T5zq3bwxl/WVZhZdIj4r
         F5UWp3Nrbt+2hs4BqgXGwjf0af59gqIbkaO6Bnd4uArA8ESbYGFz0BKBjLmIEmeqxp2W
         /Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666561; x=1729271361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqKDRpMnKUFDCBzPjda6uGGHQMDnCKHOVUyUzH1aSkY=;
        b=RgzpBfVd++ul2Z+TW2fOU4DZZw7iNYTZHg/Zdpn9XwIe267qHCX2+t2Oz9TTT229aW
         EPoBSpyutAkMDE81lKVVwPNhQqmMEuwBn7Ko4SS67NHfdCFtDH1rTHCMt9EZyA72j/RD
         Zd9GmnKHUOFXJdg95msB66YYYIrFPHGbrAu3WcemfXj2znqKd46Gp68FKIgWMj+H5xOS
         2uZnaVE5pD+vWx0zCGRoZb/UAMvImwdArwqpLRnAUkVNzq9tqvANZI7fRc3QR+Npl0ZI
         9e7/VkiYafI3r06Nfnw9goP9i7DqMAu5lZGxEMlLrcFmNiDTmSp3vZmldn6NxqN3z9wl
         8oug==
X-Gm-Message-State: AOJu0YwdKjrLZUSjURfeqXuZ6Y7MO4r5iTcg+/u5l89yHNl2x5D4y4bC
	b1Rt/h5yLrPGWGmSs/wis7MbE6XhCML+EhCpVdYiPTGx7T6WDDwevGc8tUaaenqpkVykiA==
X-Google-Smtp-Source: AGHT+IGig0d5gAOPvWubCGMNO+HS6pD/uIfah+XgCdryUbEN/NLF/DgvzT5KU18B+Vqf6kzsVXzoL8F5
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:ef0c:0:b0:e1c:ed3d:7bb7 with SMTP id
 3f1490d57ef6-e2919c5a54bmr1972276.1.1728666560536; Fri, 11 Oct 2024 10:09:20
 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:55 +0200
In-Reply-To: <20241011170847.334429-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011170847.334429-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=ardb@kernel.org;
 h=from:subject; bh=O1XJt0IMD45pv2Yzif9KcFzsw4OlwGa7+DE3CnbJzlw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zehXXKTcG3hKH5ilqN7VPNj45fmOiRemqqZWcpXs++
 IUkec3qKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNhM2JkeLw7Ybp/inLsketP
 lx1a+fIA5+GjMSmi/rejKnVb7vCfPMXwPyxi5YQ3XxViDx1bJ8Bs1tXxo+r6YkO91rWPWL/sCUt N4wEA
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-17-ardb+git@google.com>
Subject: [PATCH v3 7/8] crypto: x86/crc32c - Add jump table annotation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Annotate the indirect jump with a relocation that correlates it with the
jump table emitted into .rodata. This helps objtool identify the jump
table, allowing it to infer the places in the code that are reachable
from the jump.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index 45b005935194..7292090e76dd 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -171,6 +171,7 @@ SYM_FUNC_START(crc_pcl)
 	leaq	jump_table(%rip), %bufp
 	movslq	(%bufp,%rax,4), len
 	addq	len, %bufp
+	.reloc	., R_X86_64_NONE, jump_table
 	JMP_NOSPEC bufp
 
 	################################################################
@@ -327,6 +328,8 @@ JMPTBL_ENTRY %i
 	i=i+1
 .endr
 
+.size	jump_table, . - jump_table
+.type	jump_table, @object
 
 	################################################################
 	## PCLMULQDQ tables
-- 
2.47.0.rc1.288.g06298d1525-goog

