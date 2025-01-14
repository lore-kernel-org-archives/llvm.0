Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AE20F091;
	Tue, 14 Jan 2025 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891888; cv=none; b=lLlBiwCDWCjxTpYV6HPeywPgqoVGzd/Ftqz06vhYJhoo+QvwKFzFpa1k28vrLzsD5DrGnrKCNZWHLhnSFtLk8AhjCN7GyK9RXIl3Sh+FenRfOBNFLCdlY2maWIWAWW/dqncb1s7JhGRcRAaoijo3AucC29i45/VEn8zBsOith0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891888; c=relaxed/simple;
	bh=7K1GWy0qyUvyfFok6bxfHipNUh3Cwi3NkcOXS2UWcME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rr5t3nrXREHOUyvsS4M505okf61gC6iWZiapSs1Td3knwpxWwuuBoeAkVrPA1zhixZxSxw5xFZbJ1XC7vvxvjqA2c6KsianSRLLbOkWtv2yF0gcbmvyakOPI9YalD9gzlZbmzh+NnlN4RcyUF6KJVO/so6UrdzX48CN/fscVunI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIx+HWXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIx+HWXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA3BC4CEDD;
	Tue, 14 Jan 2025 21:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736891886;
	bh=7K1GWy0qyUvyfFok6bxfHipNUh3Cwi3NkcOXS2UWcME=;
	h=From:To:Cc:Subject:Date:From;
	b=kIx+HWXy8pxVqO/J85IgEU/uKVis1OEiKh9zHEgXIs0vg0Ghb9mBxsgerjKqxMoGq
	 uvYdJZhrKztFytxMm0ASSPQTaVB5XnVkXuO4lDDn8WK5eEKIDlIaq8Ev96Y8brNK8Q
	 mO7RWJ0aIPMFvrZ1hY0HHAyY+Lb4OtPe9z74zDu+P2292Mz4yZrlVx0vrhSgVzKLUr
	 xtciQ3u36JJFTgAN8KTJiO2P+lFwIuXB7XDruEDxNKXo8xvhvgO74Brq0trVnNd/r/
	 JaM52lIUc1MEtkbaOYaH0/Pop7lHijy2QlDDGeTRG0oBSRHWuuMUK6+LugwHMck+w3
	 YYapHfLUxcSCg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Klaus Kusche <klaus.kusche@computerix.info>
Subject: [PATCH] objtool: Ignore dangling jump table entries
Date: Tue, 14 Jan 2025 13:57:58 -0800
Message-ID: <ee25c0b7e80113e950bd1d4c208b671d35774ff4.1736891751.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang sometimes leaves dangling unused jump table entries which point to
the end of the function.  Ignore them.

Reported-by: Klaus Kusche <klaus.kusche@computerix.info>
Closes: https://lore.kernel.org/20250113235835.vqgvb7cdspksy5dn@jpoimboe
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 76060da755b5..4a0c5bb7e457 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2099,6 +2099,14 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		    reloc_addend(reloc) == pfunc->offset)
 			break;
 
+		/*
+		 * Clang sometimes leaves dangling unused jump table entries
+		 * which point to the end of the function.  Ignore them.
+		 */
+		if (reloc->sym->sec == pfunc->sec &&
+		    reloc_addend(reloc) == pfunc->offset + pfunc->len)
+			goto next;
+
 		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
 		if (!dest_insn)
 			break;
@@ -2116,6 +2124,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		alt->insn = dest_insn;
 		alt->next = insn->alts;
 		insn->alts = alt;
+next:
 		prev_offset = reloc_offset(reloc);
 	}
 
-- 
2.47.1

