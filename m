Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41E3EA967
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588542; cv=none; b=mRahHglWeRsCDW5bbquGs9GIwu7KJ6ubgHjogKuJQLL36B2Llw0Qu4g1YTSRLt3CCWc13Njxx+r2kqu+dslQQBG79pUE7ciBqL3Sb/XTOeu3qtZKCFZbKW+9oWY/LnfJ9MbLZAz7kr7ANP/PvEI0YYW/fSPcRHncNdTnCBEH+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588542; c=relaxed/simple;
	bh=mLqMNkEfqZixT18rfTh2xaYltQQWNBAMspvKIAef3Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6li+NIh2Gppq0q61DKkuHr4XQe2jK6/r9wTC1S8np7+PAJerRCl/uzJ/RZpQ4wA2NisLBA+MU/K6n8E9f/n3QTT47p84H634CyZn+bBenf5Dy4GqxkQ/HPVSSjDrbKAYnxtMLvvgLgQBWM0Y0f5wXHluMxL+GR83oXdSpgvH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoTVZbH3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoTVZbH3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e618db81c0so1782835ad.2
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588541; x=1792193341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=LoTVZbH3Oq6sgJrDrwdAcSTutqjA7Qhy88kJkvdKmZmgsGMkIdPBf0FdvOiMvABrkr
         qocZ8/TOKpWTropvwbwCoOJNp7lSW27UAWhPUcVO77NQda49lzgUONDlaKcN0P9yFW30
         ceJuN5nXM6RgSQ7jYm3uSB/BoOI2Rg/429n33ZjykjhOeHkBL+7Ux9jHFKTpyhNp85rA
         q+FrqXHoK89abmv9kgTT/uU31FdkwYnpKoKh2VDEWFuluVR8kLdrfh/52W4MM1kkN6ht
         5AIAvHDAstcS1t52bv5tQAhIxvK1IAjVE7S883z51+uDLjOZCYkdrRM1toOmNsU9WMID
         Eftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588541; x=1792193341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=hlFz1zcTp6F807DIqpp6+Bttxo86U3RnT0XZ1xwr4HDhSpHrhXgJvyw2xpi0UkChYr
         y+X1qsv8CLkNXWkelO/T02XX9e+eiCQSwSaNao3a3ZAN4JZaC+Opp3kFzuApSK+b4FA6
         3q3pZuROqBDVZyMkPdoPsih47Wojoy+hi/dXQiUUtT+4Gx27/O+q7Mh0u4uRtzKv2KGM
         C1I3nTC6fEnTZju6lP1YhJDsVxIeZqEm/pf3I3HMNk9Fv5qZLpUQqslz5Z3O7vgYOOl3
         3wfHUHbzSFJ2of4vx2Y0GFAHjN6ygBQAJ4ZWRleBfWDB3//JpCOF6NlxIyIzMyFncH6I
         gnEw==
X-Forwarded-Encrypted: i=1; AKwUvBx1XZvgs9tpoTBl9dEXElUtPx34lVYreP8SpFDIjb9le7u3GJoluREeOOFkAh+zKeRTpASD@lists.linux.dev
X-Gm-Message-State: AFq9FYIgH9OLXAX5sWu0hhKHs6tdBU7El1rXOS3/Scf3U/WIyTm+cp40
	eat5q8GXmlzimW8KEa5TqkReTmgF6zNlUGTF5/kRyc6gjjIt6BbeKAz5
X-Gm-Gg: AYBFou0qKOF4kWA4xGfzN1wug+VeNKx80c6DAHGbxU7+DcOL9i/83GfqyH9UxAIHoX3
	DuQdcVaSYrJwEPuM7cV6H0CEiZja/Cc4zxDVWHts5GgS4Ak+ZRu8/ssJSNErQAAEwjlW/qaJ7WL
	nA8TplCSKMasc2jTH+DsUtwkLNji1k2O7p9U0bUZdVlapcQDYl08HTS0UFHLDS0lhFQXf7RsUY7
	mqZJlX53eeGCBptfCd6P4c6W9kYV/rVvekfXdnFqh1AJzAg9WI+j+uy6g9k/IqI5ElAz9py8y5/
	wbAbOnvj8WaHL4CC8ByC5iprLseLVGfpOaOMvDY1OYmkEz5o2mUL7qRYyTnjFGGJuV8NC16xgXs
	ZzTj8A7Lcv3vhowmpy9qwST4a3dz6tNP2Qa9AF45AfUKFeXjYXryzsyjJwWfWzB7Fot7YNPj9lF
	OdCcU3xtsDsbhRkTHjZEziY3HfFMj/B+1IXU6P7W+utHT59V/gHTrD1sgRIvKp0DyaknKOtTT5c
	/SSwFAspAAjy4VBAN653WVbuM19fuEbhh+aM7NuuSj3I3wv6Ce0xaFtEs3TQNVMsPmob6XUUIFU
	16wFnftGgvQ5gVd7ltjun+xv9Ru+1bhr7zpIqD/0cErt7hsGquHgZCrM+4g=
X-Received: by 2002:a17:90b:2645:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3ab3ace48edmr3043646a91.48.1791588540601;
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39533ee7sm3396362a91.4.2026.10.09.16.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: boot: compressed: place .rodata.* and discard .MIPS.abiflags
Date: Fri,  9 Oct 2026 16:28:57 -0700
Message-ID: <20261009232857.655265-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decompressor linker script only collects .rodata. Clang emits the
decompressor's strings in .rodata.str1.1 and also produces a
.MIPS.abiflags section. GNU ld places such orphans next to similar
sections, but ld.lld puts them after .bss:

  [ 5] .bss            NOBITS   809246c0 5346b8 402010
  [ 6] .MIPS.abiflags  ...      80d266d0 9366d0 000018
  [ 7] .rodata.str1.1  PROGBITS 80d266e8 9366e8 000164

This pulls the 4 MB of .bss (mostly the boot heap) into the file and
leaves the strings beyond _end. For BCM47XX vmlinuz grows from 5.4 MB
to 9.6 MB.

Collect .rodata.* with .rodata, and discard .MIPS.abiflags and
.gnu.attributes as arch/mips/kernel/vmlinux.lds.S does.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/compressed/ld.script | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 0ebb667274d6..c45be18c6f0d 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -17,7 +17,7 @@ SECTIONS
 	/* . = VMLINUZ_LOAD_ADDRESS; */
 	.text : {
 		*(.text)
-		*(.rodata)
+		*(.rodata .rodata.*)
 	}: text
 	/* End of text section */
 
@@ -50,7 +50,9 @@ SECTIONS
 
 	/* Sections to be discarded */
 	/DISCARD/ : {
+		*(.MIPS.abiflags)
 		*(.MIPS.options)
+		*(.gnu.attributes)
 		*(.options)
 		*(.pdr)
 		*(.reginfo)
-- 
2.56.0

