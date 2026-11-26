Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712273;
	b=xnQ1pMVVBslN4NrvxgVNX6/FiBLvzWAu+Vv7yLKJR8xGM9E+xN6i+UIkFG11EIesUCm4
	 KPtIOQfSNUEtk2qLE9icWG9q2pfjiCcjAHmOwp4CO/lJhUrID7YMWf62Sr2dIoXM6RHYA
	 q8hC3Koy308XnwEdVWw4o0cv5J0qm7A7wYbfF7MbWGFQBIvFbeb0QC+JBLV4r3MHYa6Dh
	 lRx9uaJqMjbrihcPLIRoV8qR7vB3NK6WJhKqTp5TS9BuCCilWf6zmFUmXN5QLZxZ3ZfRy
	 281R5/IDwf+5IHAxGk/nyNuzVIVFbYPCUtPzFkt/jWz9koAYHgQrrfa5mPACucuE05w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
	b=rD9S3v/78ZGrQ65Gokosp6Z8eh+7vDk7FUuMHCDEI1qfEJ9P0Cas5BKdZxXrGg5t5wXh
	 78MEMD/m5R7XwqgyCw4fkxbIwHyqf8qxPjn6fikkbqBE13fCGy2Gv671Qnbf1JCUTspys
	 EuFBS20vnreGV737rthvlAwX8qP4Vnbm3x/+f5TibVqICq+tXdzbXw5qP0sYp7skINlUs
	 xdIYTNTwHmQ0aPdJB5LtohFRlBHHOaE2tHA9roErArOx1Zb2SbC2vpGbHpJSm4PG5UhJ0
	 f5qjAlVO6lian1vlD/G1T3ja2c2WvNDgOInaSTErDG9ccf4oZvP/nlNqKjzqEW4Im8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GB+ISudW;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259C8606A31C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GB+ISudW
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b879462421so642038a12.1
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795712271; x=1796317071; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
        b=GB+ISudWF0Xp+meVoMJXYvCiskEEEaAm85p7iGPNXIiyQ3duCaa7oLkOwHCmHX1aDR
         3rOqMKsm5J7ucLHl8UJBO/kPTs8INlAgTMAQMXtP9rEBVa5o/ydlMbfCdYoCJkpH9Q/b
         SBj5+ahZVlsQYWnL4RiCaeqDGwKFRBHdTzvSncbELc5Wt1Uhsje9f/366Nx8dP3sKFg9
         wvdBJVSmnL7KtEhHy5x2lIlUyNJcBBTqDiW+GMm2++vD7APaggTiB229+sOcf5Bv2pm0
         ir/k4C04Se6J9cavwcybby1GMcn3+YO0AvyuBBaT3gOdGjtxtQZpW51Yy8UHCTBya2/O
         9rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712271; x=1796317071;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
        b=0XO5RA9OUYv2PSlEX8yf4aZUsWdHJa+g/yx/RBN6OjkH1b7Y2TOK11b1XunCiiQlY8
         839KOGuB9OEm7LuNhm0OBOHzqPyEdcExVQ07dywhSWpY2MvknjGh18WRS/9oG/YoFnRS
         IxLsz1KLzv59hAyMF2pYHMp8iCb0N1rrHYozq6VsSgXmj8odO7T6dHnzYvz758EbK0VP
         DTazUSWFTKaU2A+cSlPa2sZSJYHjeEPGAJ+/hZ8jIBL7SEDPqYIpZP0pu9h2j7qHkrIT
         BJ5fpzPaFFd1TsVeF2rBMogX/PWGw5BgMX6aAPGF0oZCq3JYzj0pv2Ai45+rnQClMyMY
         XGMg==
X-Gm-Message-State: APuU4Z8CLbQkX/DknRV7jB9SzgJHVPyhI9Maa3q76pZgzR83Hoq2CFjl
	Dfbhc040Qj2WWB6+G9fM4kzcPvDZhd8skmYYURwDs+H5ilOLwcuc989yq/4zNTSmj+KxyI5YPO6
	XoLftoLpxKVMa7m424aKuY40MhrjmO7qWNkeur1eg9UERtjT838wrrMYXd8Uzvtgv1qmFn5lvB6
	xuM8JlT9iR1NcxM6UPVEXhLFY=
X-Received: from edwf26.prod.google.com ([2002:a05:6402:151a:b0:6bb:6fe7:16f8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1c08:b0:6ba:a614:2fa1
 with SMTP id 4fb4d7f45d1cf-6baa6145b66mr8005803a12.20.1795712271121; Thu, 26
 Nov 2026 08:57:51 -0800 (PST)
Date: Thu, 26 Nov 2026 17:57:40 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078; i=ardb@kernel.org;
 h=from:subject; bh=X6vteHyIC3rKBXp7WqfXPsq2tsAfRKOq0QrILcJganE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsjlYVXgEdc6lFQ6GaplpkZXRdydVifTj6V1NvolL04/
 n1/zcqOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJH6owy/mLTE59sm7VS/ELF6
 hk4fc9KqgIlGs09GLtCW80h4+y/9GCPDSbdC5eijVdLpExl+Pg98mO4e5z+r1OTRv+eafBstSjq 4AA==
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126165739.2453269-2-ardb+git@google.com>
Subject: [PATCH] kallsyms: Omit unnamed local symbols from System.map and kallsyms
From: Ard Biesheuvel <ardb+git@google.com>
To: llvm@lists.linux.dev
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Since LLVM PR #223686 [1] ("[LLD][ELF] AArch64 Errata patch use
STT_NOTYPE for symbols"), ld.lld --fix-cortex-a53-843419 (enabled on
arm64 by CONFIG_ARM64_ERRATUM_843419, which defaults to y) synthesizes
an unnamed (st_name == 0, "") STT_NOTYPE local symbol for every
executable InputSection that lacks an STT_SECTION symbol in its input
object, such as empty .text sections in data-only or .init.text
translation units, or per-function sections under -ffunction-sections.

elf_symbol_type() classifies these unnamed STT_NOTYPE local symbols in
executable sections as 't' (matching GNU nm and llvm-nm), and
sysmap_omits() does not filter empty names. As a result, nameless 't'
entries are emitted into System.map and compressed into the kernel's
kallsyms tables.

Beyond bloating the kallsyms tables with useless nameless entries, this
causes CONFIG_KALLSYMS_SELFTEST to fail at boot ("Test for Nth symbol
failed: ()"), because kallsyms_lookup_name("") explicitly rejects empty
strings and returns 0.

Omit symbols with an empty name in sysmap_omits() so they are excluded
from both System.map and kallsyms.

[1] https://github.com/llvm/llvm-project/commit/5da7779afdf3

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/kallsyms-sysmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kallsyms-sysmap.c b/scripts/kallsyms-sysmap.c
index a482968eba51..1cb3b1775157 100644
--- a/scripts/kallsyms-sysmap.c
+++ b/scripts/kallsyms-sysmap.c
@@ -96,6 +96,10 @@ static bool sysmap_omits(const char *name, char type)
 {
 	size_t i;
 
+	/* Unnamed symbols (st_name == 0). */
+	if (!*name)
+		return true;
+
 	/* Absolute, undefined and debugging symbols. */
 	if (type == 'a' || type == 'N' || type == 'U' || type == 'w')
 		return true;
-- 
2.56.1.839.g22a8290db9-goog

