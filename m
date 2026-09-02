Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A83B5305
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382921; cv=none; b=slK5IyhWVkFTT4n4sBaxqctCssOQMs8GvhDH36JJ3f1ktZSy0RgSdGnFsXrjxCYTTUjWkwq9IM85j0eQMtzXsjjE2K6kTxr0LEDyJY7NkakVxsi5vKD9c0YM38rNvdy2VG8gpvsj5QkPlnHOYmHAXllboYaeqcZ4roMeq5Y032Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382921; c=relaxed/simple;
	bh=gq4kjcf/C/dd4dpRmzn9Mq+VpkBb4cxOn+4FIo7f0E8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FUY8n3EDoLfQIR3VEUclDoy1BDwqJ7REUJpRx7pJ+8NM9jBlio2T9c0AZUZGkCfV/1/6pfeD0up2yVeQrqKVjAfAj5tPDMe9WNSO10p0GvKidLEPbfJ99jkDpK2WTp2eXz9WybfN6o5k8Arc4d5/2Gf61j1XQ1A0co9xFoxq1k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AwaqJOSj; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwaqJOSj"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2463139a91.0
        for <llvm@lists.linux.dev>; Wed, 02 Sep 2026 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788382916; x=1788987716; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8LP+AgpfQU95pkQ4A0U0JkV/VZeB+yKww2C95uXxms=;
        b=AwaqJOSjBPYFnX/FTFxzLUUseNCu7AjvbADuw1dlxKhGuYAuCpLMrR4eClsIWKbIf7
         FUQxy7bCyH5Y6h5YNViqyNI7kq4Fnh+2ENrDkLptgk95PYKHxD1xL6birazsfm3Mr9S7
         QUmH26sV1b6lJlBb2/GL5f9ZkdNFef8IaDdKcfvAgEArsRW7X0hq1qt9MFaiblaIkdW0
         PzBfkH3IFF+9dc+igvEkU3nCOrPf6ORJ6XeLQ2f0gAsWJMcCEsHnOYh3gq/Oqm8Jh/NC
         xKXOKHeUhetbVPL7bJ1KS/U3/phimHzYgiy5l+rlM26gAhXDetoBihQkybjUhoc0pTYN
         +xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382916; x=1788987716;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8LP+AgpfQU95pkQ4A0U0JkV/VZeB+yKww2C95uXxms=;
        b=FKKrfdN+cME4y9HJqrJGStBDwHafIDOO78pFaZcY0p9HxVYmXmcWzH7SAJK8yLbR9m
         54TplaDUlzVVTn+2+Kis00H/y1i7ymZwoHfuDTmpVMn1n6PJQfxVaDV88L3NViNhepGD
         JeMy0oK06yGtTSNBQogTIYnI4fnAB97vucfLl3VTomyrfZe+UjsYQJPsfbqGzTxdLpAV
         n9kfHn9VNFW6dkjuVUtLvuH0f3UaCcmJf+A6vXwDR0+c+RZasXMMvDWV+M++DEm5wRFv
         n63H7bSB8Xjs57Mhoro9+TZ3BjFQvc11YSwB5WvBzUrOxT1TVyLq1Nvh8o9KIBi+a0Pz
         6eXA==
X-Forwarded-Encrypted: i=1; AKwUvBzACNbyGcZ9aqUfQI3Y8Zn4O3mBU+YapHziJM+o6HX+N4+kTGOpWNXYBzIWx8sTg3CGEbld@lists.linux.dev
X-Gm-Message-State: AFuF++nFE6nltICiMvE8JXdzr/37uqrAKoTMrENUQTAhxknz1UVM+ge4
	ExgxKq7gdIwrxWJhQRj3Y424iKcTD3bbfbQep+wuChQsD0dXVMpCegfpHeZLm6rPdAIxHhZKjf9
	lLiwhdu201t6DwuPVliqW/JtS9nrPgw==
X-Received: from dlg33.prod.google.com ([2002:a05:7022:7a1:b0:13b:8289:9a55])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a8e:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39aedf73060mr10160241a91.8.1788382916176;
 Wed, 02 Sep 2026 14:01:56 -0700 (PDT)
Date: Wed, 02 Sep 2026 14:01:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMCOmGoC/x3MTQ5AMBBA4avIrDWposRVRKTawfhtWkQi7q6x/
 BbvPeDREXqoogccXuRp3wKSOAI9qm1ARiYYBBeSl0IyPaKe/aH03C7LtbZ7N5lztSzjMk8xMYW SBkJtHfZ0/+e6ed8PJSl6GmkAAAA=
X-Change-Id: 20260826-checkstack_llvm_objdump-40653e1d7a6d
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=O0COsmvrvggwIeEq7bAuRbULbXScoJmbNMYaRi6RFIw=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788382914; l=1872;
 i=ndesaulniers@google.com; s=20260611; h=from:subject:message-id;
 bh=gq4kjcf/C/dd4dpRmzn9Mq+VpkBb4cxOn+4FIo7f0E8=; b=EJh/KS2VLyFue0lj8LwiVxwj/XEC0g8ttHV+j4VKiPE2AWW1oeq3VQ3mETSpw0OAgRgjfZHZs
 jZp5vWI0QPzAa+MnNVYC8CPcWGQbP5tiyluG2VQF1RdSy9sN8O1JfTc
X-Mailer: b4 0.14.3
Message-ID: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com>
Subject: [PATCH] scripts/checkstack.pl: support llvm-objdump disassembly for x86
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

When running `make LLVM=1 checkstack`, OBJDUMP is set to llvm-objdump.
llvm-objdump outputs disassembly with instruction size suffixes (such as
subq/addq/subl/addl), tabs/whitespace differences, spaces after commas,
and trailing comments (e.g. `# imm = 0x...`).

Because scripts/checkstack.pl used rigid regular expressions specifically
tuned to GNU objdump format (e.g. requiring exactly four spaces, no
suffix, and no space after comma), checkstack.pl failed to match any
stack adjustment instructions and yielded no output when using
llvm-objdump on x86.

Update the regular expressions for x86 to match optional suffixes,
variable whitespace, and trailing comments.

Assisted-by: LLM Gemini
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/checkstack.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 14ce31f732ee..f8011e789a9b 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -66,8 +66,10 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
 		#c0105234:       81 ec ac 05 00 00       sub    $0x5ac,%esp
 		# or
 		#    2f60:    48 81 ec e8 05 00 00       sub    $0x5e8,%rsp
-		$re = qr/^.*[as][du][db]    \$(0x$x{1,8}),\%(e|r)sp$/o;
-		$dre = qr/^.*[as][du][db]    (%.*),\%(e|r)sp$/o;
+		# or
+		#       0: 48 81 ec e8 05 00 00          subq   $0x5e8, %rsp
+		$re = qr/^.*[as][du][db][ql]?\s+\$(0x$x{1,8}),\s*\%(e|r)sp/o;
+		$dre = qr/^.*[as][du][db][ql]?\s+(%.*),\s*\%(e|r)sp/o;
 	} elsif ($arch eq 'm68k') {
 		#    2b6c:       4e56 fb70       linkw %fp,#-1168
 		#  1df770:       defc ffe4       addaw #-28,%sp

---
base-commit: 502d45774af09f1c681c754c4b7cdfb5d7f72fd9
change-id: 20260826-checkstack_llvm_objdump-40653e1d7a6d

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

