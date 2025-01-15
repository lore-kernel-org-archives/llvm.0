Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C301DED54
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981454; cv=none; b=eBcscQmlks3KtaaKoualVeu5hEgsxzlNjdZqM3YjmIzyzvkt7xKCV9zFG6+9DlDRkNaHC/4KI0K7j15tkdOcyph0cVIbsZDj0nbfB5YaFjIwEgaX/cfzauy6iVDwjpUIawzJOWK8X5cnHoaB5ZZGK5TEaqyGZMjGQqAt2RQItXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981454; c=relaxed/simple;
	bh=ZbF92lKn/a2BcO+/Rt9A3tjdZfwn64sAKLypVaGo9hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwBEzwy7vce4Nr9cldbCjX6SZ0Gi/PlO4ZbTpAyTsJ6JoEDUGqd7XT1cCMdFBoHBBsRo9iLez43I3g901aiq2xIheYMII0SuVKVpnXR0ndXqaLgy1EJr76vsU1TyWpY3aoEczzSa9CjNcQtqohhuhLDJ/2tNYUx2fWQfHBSoJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLck6gxXz9sSf;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dr5Ps3RQ53L0; Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLck5yY5z9sSd;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BCD238B77A;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id o-cH9_aqzb1D; Wed, 15 Jan 2025 23:43:18 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A04948B774;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 11/15] objtool: .rodata.cst{2/4/8/16} are not switch tables
Date: Wed, 15 Jan 2025 23:42:51 +0100
Message-ID: <c7449575c94672ec0ba5091e03007e0b052c15dc.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=775; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ZbF92lKn/a2BcO+/Rt9A3tjdZfwn64sAKLypVaGo9hw=; b=HVqgwXZ3/EXy0sYgLk6n8xkh8j2Gln6sKIw9R/abzTvIv6inqVrwnFsumz+MkEEFrqio6tXGN 941QxuIDnGhBaJaHHI9M6hFbpY2HnvgcT9nhxdDO96zQyP/U1c+Ixib
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Exclude sections named
  .rodata.cst2
  .rodata.cst4
  .rodata.cst8
  .rodata.cst16
as they won't contain switch tables.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 87b81d8e01c0..91436f4b3622 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2506,7 +2506,8 @@ static void mark_rodata(struct objtool_file *file)
 	 */
 	for_each_sec(file, sec) {
 		if (!strncmp(sec->name, ".rodata", 7) &&
-		    !strstr(sec->name, ".str1.")) {
+		    !strstr(sec->name, ".str1.") &&
+		    !strstr(sec->name, ".cst")) {
 			sec->rodata = true;
 			found = true;
 		}
-- 
2.47.0

