Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87031C68BE
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666556; cv=none; b=kFZ2kSUnLbI2L/d8FmsEYTvLjqxRlGdfq9vUlKmPB98l5hK2Rlmy7Vr1XOdCIDNYtVisRZSymFgM4Nnd+tKzv1wXUC77CC6AOp6w5W+m/a45fTGpqVUvpJgwBEVP390oO9sE0kC4VK4a6u16ddPct0MFJNKoBMcARGF5Qno3uYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666556; c=relaxed/simple;
	bh=0an784L5kpDmdK8mN18dKa6e13LcwOa+SLNxCEIV8x4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NdRF92BkybUQAkQke4HSEfs0laZaNa65ECyUcjhnp5nlTivyr5x6TZvhE+woi7NmNrfMedoywt5rmDMpRU6jWs0OEsXrsAVLnrNjijdMTCUv6lRN4go4KbcQMYK85kXidJIXFLFDF34i3/7odj221mss8vlhpLG9alyKD07QcgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=On2FWQF3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="On2FWQF3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43117570814so10870895e9.1
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666551; x=1729271351; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WkO7vfvBh/UE7nLoKyOKLo43oPVJ4Pq/WcQaO1W6Bnw=;
        b=On2FWQF37w9nry6M1TNswujPxToVlp/5XhGG29A+nP809ftcIggXZbLgXMaPAcHymV
         Xc9FJVQywYK751Hw8ExFCtUbI6PiYvd1OhRP99xdc0VZnGqzqd9Z2Q8i3DJvkmZfMO9V
         OjGuEjLG/8yJJWDOw9sjVe7PijIkkE/dlj8MxxPzXn0Lx6Uke+kv9l8HiX8XJrdWgZ19
         V/FVfEHe/k/9mfZW/hqPFz2phqE6weUa7gmpVphEioxq52aOwBr7M/yF7GosJgpOlzHL
         ZyRnTKdr4Bu9G2Hyqj0AEP1K+FrzGbIyi6w9fgJUIlx1FBOPqptPPgllRKcAhYqn6NMh
         XTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666551; x=1729271351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkO7vfvBh/UE7nLoKyOKLo43oPVJ4Pq/WcQaO1W6Bnw=;
        b=hOn0Sa2r4+qUj9L2H9MPRIBVBMumm2yWPfW9jqyrKL68ML4mlzcdFYvJmD29ckd2Nu
         PHkO/cisaeqYdj7C1EfxAF9ayb1RRqryy2klJLXh64AETzfKeQW9QubmqV/dX2natPSq
         k0bxghxze71o2/aMzDDgtGxCJcSPdtQ1jjFwEgqu5P+dk3kyCD4Z/8zPftHO0XOuhQYq
         iQQOVC7IetqiDNaVLiS0Utsi0491t4yRCG4R6XEYtNwMAitu36CSSR/HekBgB3Wk3kxT
         ZrZmlUfpk5EYk2ly5c8mejZBn8D9DnGSU/ckEVY39Kgkla6W0seOY/2aJxmBw2XnF0Gc
         QsxQ==
X-Gm-Message-State: AOJu0Yy8Ukl+1cwo/WeLatBwM7qqil7CDTfLV8eqT+LBLQAatLIKxFze
	WZ54bYY+KI2BanU8VytYZAPnKFfJhZprV0EEzLIBZqFzN91njk5yZe5V+yTEcI8oINIYTA==
X-Google-Smtp-Source: AGHT+IFed+Jkm09W0qDIY/JP8fTr1qhYOY3doVvTKyQfexNDvmU8Qio0ZZDRztBB0SAbldwZsy30PHAh
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:1c96:b0:42c:a8b5:c1b with SMTP id
 5b1f17b1804b1-4311de86414mr276615e9.2.1728666551095; Fri, 11 Oct 2024
 10:09:11 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:51 +0200
In-Reply-To: <20241011170847.334429-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011170847.334429-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782; i=ardb@kernel.org;
 h=from:subject; bh=A2/RO6uk5klpid4u/+fW8dDiGa2vurlmiGxn2abwXOw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zesm2OynG/CefvNqzuP2B3f2Z556oucZEiLe5TWrVM
 c4UbnjcUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYy8Rwjw9964dRnPnNTMjNf
 xZ67JjnNas4TGxb2uVeiciP75zndvMvwz/bi+aiTD+/42b7psc+aa3V49Z5j2h/UKj5/OSr6N9j kBD8A
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-13-ardb+git@google.com>
Subject: [PATCH v3 3/8] objtool: Make some helper functions globally accessible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move some helpers around so they can be used from arch specific jump
table code that is getting refactored in the next patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/check.c                 | 22 ++++----------------
 tools/objtool/include/objtool/check.h | 16 ++++++++++++++
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b73e43b9b9e3..fbb05e973acc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -61,8 +61,8 @@ struct instruction *next_insn_same_sec(struct objtool_file *file,
 	return insn;
 }
 
-static struct instruction *next_insn_same_func(struct objtool_file *file,
-					       struct instruction *insn)
+struct instruction *next_insn_same_func(struct objtool_file *file,
+				        struct instruction *insn)
 {
 	struct instruction *next = next_insn_same_sec(file, insn);
 	struct symbol *func = insn_func(insn);
@@ -93,8 +93,8 @@ static struct instruction *prev_insn_same_sec(struct objtool_file *file,
 	return insn - 1;
 }
 
-static struct instruction *prev_insn_same_sym(struct objtool_file *file,
-					      struct instruction *insn)
+struct instruction *prev_insn_same_sym(struct objtool_file *file,
+				       struct instruction *insn)
 {
 	struct instruction *prev = prev_insn_same_sec(file, insn);
 
@@ -110,11 +110,6 @@ static struct instruction *prev_insn_same_sym(struct objtool_file *file,
 		for_each_sec(file, __sec)				\
 			sec_for_each_insn(file, __sec, insn)
 
-#define func_for_each_insn(file, func, insn)				\
-	for (insn = find_insn(file, func->sec, func->offset);		\
-	     insn;							\
-	     insn = next_insn_same_func(file, insn))
-
 #define sym_for_each_insn(file, sym, insn)				\
 	for (insn = find_insn(file, sym->sec, sym->offset);		\
 	     insn && insn->offset < sym->offset + sym->len;		\
@@ -141,15 +136,6 @@ static inline struct symbol *insn_call_dest(struct instruction *insn)
 	return insn->_call_dest;
 }
 
-static inline struct reloc *insn_jump_table(struct instruction *insn)
-{
-	if (insn->type == INSN_JUMP_DYNAMIC ||
-	    insn->type == INSN_CALL_DYNAMIC)
-		return insn->_jump_table;
-
-	return NULL;
-}
-
 static inline unsigned long insn_jump_table_size(struct instruction *insn)
 {
 	if (insn->type == INSN_JUMP_DYNAMIC ||
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index e1cd13cd28a3..e2f755484c4a 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -114,14 +114,30 @@ static inline bool is_jump(struct instruction *insn)
 	return is_static_jump(insn) || is_dynamic_jump(insn);
 }
 
+static inline struct reloc *insn_jump_table(struct instruction *insn)
+{
+	if (insn->type == INSN_JUMP_DYNAMIC ||
+	    insn->type == INSN_CALL_DYNAMIC)
+		return insn->_jump_table;
+
+	return NULL;
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
+struct instruction *prev_insn_same_sym(struct objtool_file *file, struct instruction *insn);
 struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruction *insn);
+struct instruction *next_insn_same_func(struct objtool_file *file, struct instruction *insn);
 
 #define sec_for_each_insn(file, _sec, insn)				\
 	for (insn = find_insn(file, _sec, 0);				\
 	     insn && insn->sec == _sec;					\
 	     insn = next_insn_same_sec(file, insn))
 
+#define func_for_each_insn(file, func, insn)				\
+	for (insn = find_insn(file, func->sec, func->offset);		\
+	     insn;							\
+	     insn = next_insn_same_func(file, insn))
+
 #endif /* _CHECK_H */
-- 
2.47.0.rc1.288.g06298d1525-goog

