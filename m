Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D8355F4E
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562024; cv=none; b=q9dSHLoAGqHNcpYqDTMclySY46neDJ7qn3r0gOmrcgySK/mpmmaaEbgYAinsL0P0wyhuzTFc0iz9+mSN2wqdVj6T2g+zVaLdOR3TtY1u3cs2xyTYl9NkdCIE7oj3rcGOvQPiV2zWM5Ex/p+av9m+thIdIX2YMTVeXj+Yd2U/6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562024; c=relaxed/simple;
	bh=KrhiVausKjt5TBkDgvvvPd795uJwDDGoWiE2DqgTcLU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FrYS16LSJDWZEFseJaIO5Fe+2mzDa3PAFvJMXecAoDNYeRmE7+XwGX6JNtVs1Af/nl/ZDv34xjjXaCAUaUwapViyVanzXUBawEk9AxhmsI6g5G8xsU9bB9xxYxwLtPv14zjYbNF3+UkK0nVfKpospp3sNCJ4+bcYMo6j7YJjwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mdaZ6tmu; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mdaZ6tmu"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1383723dfddso4751063c88.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781562022; x=1782166822; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+ABCIJwM6jXaXHGqQ5K2krBBX3YNbsJMKFYiJWY3mU=;
        b=mdaZ6tmuPxNOOfMiQ5n/YO6NpWKr8ypUyaNTdc0lEDLhPYatpqido/U1/b0g1wD23N
         W8W6wVcYiHW2TtJWBIPRzvqoxtxXI8zuTxvDovYCHqQeIkycwCh20NpZFFW69PKfjRgE
         stTZQl6wiBY7Yb2n0/qbkJcyx7WPUbi3MNuRA5AA5Xub6Ogw1HoRussQOrQ58SXXKRR6
         5L+0+qH5aqcS8rTKNq0DNMYvDQurthqQMndr2qQl4cerLtNHqrTwAE35BhYV7vE+A9d9
         kGflvlj4pW4KjZOSp+RnoNeRPJKZuJKfnFYgnZAdf87/+Avbt5GqbTc6BX1XqDhlbOTa
         xXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562022; x=1782166822;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+ABCIJwM6jXaXHGqQ5K2krBBX3YNbsJMKFYiJWY3mU=;
        b=KnqQY1nahBUTTxEVAWIQZgTrhKZ1Rleaheh8duvufkEBvXgLRoK8KEgwG+pOuiwVdP
         ju/Wwr0MovlPqSXWe/9kQDlBnz7940gOW21WqScFGvoOxLERTJMeatYDHIi7gNrKZC7U
         BVa8zTmN2gJrH/iZzwOgpqQVnnwYHe0/nzzpgCtapkRRc5+bGhK7Zz1lqmh0QvbOnhul
         7k6Rfe+L6IQX6nN7CiPXK6tFk0T8Wy0kPqIRGY4Cxg1usUMb/t1OFEH/OpQibQv+WIls
         yyKvWnCl3eWDsve0fyzK6N22FUV3U/vPqTLYrKYNvnPTD/cFnEqkOkAcPIB2/6XrRswf
         zLgg==
X-Forwarded-Encrypted: i=1; AFNElJ/LVv/7eLvTKohORpHMVzPYwtqybmo459X/KeHbGZPtyyXqJyrkmLcuP+hrntcJiWPt3X53@lists.linux.dev
X-Gm-Message-State: AOJu0YwZVIzUFxghxksj0FLKaR4btuPxMxGdXHM1fH0g38xSNS7HIJka
	4wjQonRS/FCQ2p8GrANH4yC7g7LHhr85DBz2mVqbQouX6hgp81x83UcHr1IMDtpbxH6Dcg==
X-Received: from dlak8.prod.google.com ([2002:a05:701b:2908:b0:139:f78:7af6])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b82:b0:12d:d972:b969
 with SMTP id a92af1059eb24-13985f20551mr538083c88.24.1781562021761; Mon, 15
 Jun 2026 15:20:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:20:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260615222019.4116687-1-xur@google.com>
Subject: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
From: xur@google.com
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	"=?UTF-8?q?Ren=C3=A9=20Rebe?=" <rene@exactco.de>, Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

When building the kernel with Clang ThinLTO enabled, the compiler
can mangle static variable names by appending suffixes such as
".llvm.<hash>" to prevent naming collisions across translation units.

This name mangling breaks the section mismatch whitelisting in modpost.
modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
safe references between permanent data and initialization code. Because
the LTO suffix modifies the end of the symbol name, legitimately
whitelisted structures fail the match, resulting in false positive
warnings.

For example, a static pernet_operations struct triggers the following:

  WARNING: modpost: vmlinux: section mismatch in reference: \
  ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
  ping_v4_proc_init_net (section: .init.text)

Fix this by stripping ".llvm." suffixes from the symbol name in match().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/mod/modpost.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..1f5a64eeb048 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
 static bool match(const char *string, const char *const patterns[])
 {
 	const char *pattern;
+	char string_stripped[512];
+	const char *ext = strstr(string, ".llvm.");
+
+	/*
+	 * Clang LTO can append .llvm.<hash> to a variable. Safely strip
+	 * the suffix so glob whitelists (like *_ops) work.
+	 */
+	if (ext && (ext - string) < sizeof(string_stripped)) {
+		strncpy(string_stripped, string, ext - string);
+		string_stripped[ext - string] = '\0';
+		string = string_stripped;
+	}
 
 	while ((pattern = *patterns++)) {
 		if (!fnmatch(pattern, string, 0))

base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
-- 
2.54.0.1136.gdb2ca164c4-goog

