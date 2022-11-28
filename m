Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBBAD27
	for <llvm@lists.linux.dev>; Mon, 28 Nov 2022 22:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8968BC433D6;
	Mon, 28 Nov 2022 22:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669676051;
	bh=XhlmGklPZqArTs4x9XA0KNH23q7DJe1TUOnTCjlG9Dc=;
	h=From:To:Cc:Subject:Date:From;
	b=VddVwsPye9fI+3oGQDiZIpYJb2/n+NNk8st3Ic9v4gvyrPEKYwzpLPby6R8gDVv2o
	 laQGx5XyHcgryMY5b/MNWjb8qO+BJCNYkQzNycBoAfDnepiHwx+kP2Zgtomn3k3F0R
	 QA6DYn0klAzjBHQGg6EL/nr/UtvbfQ1tSJu173wbBZNF6XtXmMHpEiJloszUc/O9DC
	 RtyCy3hn3SYqX5FsoMezIxH5TOB6IcZJ3LY77yJPj+uY665YFsUpgyMG8eZW2sSlGj
	 YJGKPrRAwAl7fpVNUXsEi9FRcaHpo25waLdfTgiLAL8B3V1rNyyTfdKTfW6+rIDHWN
	 gUJf5BTYt60IQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Hugh Dickins <hughd@google.com>,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.4 and earlier only] mm: Fix '.data.once' orphan section warning
Date: Mon, 28 Nov 2022 15:53:46 -0700
Message-Id: <20221128225345.9383-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Portions of upstream commit a4055888629b ("mm/memcg: warning on !memcg
after readahead page charged") were backported as commit cfe575954ddd
("mm: add VM_WARN_ON_ONCE_PAGE() macro"). Unfortunately, the backport
did not account for the lack of commit 33def8498fdd ("treewide: Convert
macro and uses of __section(foo) to __section("foo")") in kernels prior
to 5.10, resulting in the following orphan section warnings on PowerPC
clang builds with CONFIG_DEBUG_VM=y:

  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'

This is a difference between how clang and gcc handle macro
stringification, which was resolved for the kernel by not stringifying
the argument to the __section() macro. Since that change was deemed not
suitable for the stable kernels by commit 59f89518f510 ("once: fix
section mismatch on clang builds"), do that same thing as that change
and remove the quotes from the argument to __section().

Fixes: cfe575954ddd ("mm: add VM_WARN_ON_ONCE_PAGE() macro")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

As far as I can tell, this should be applied to 5.4 and earlier. It
should apply cleanly but let me know if not.

 include/linux/mmdebug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
index 5d0767cb424a..4ed52879ce55 100644
--- a/include/linux/mmdebug.h
+++ b/include/linux/mmdebug.h
@@ -38,7 +38,7 @@ void dump_mm(const struct mm_struct *mm);
 		}							\
 	} while (0)
 #define VM_WARN_ON_ONCE_PAGE(cond, page)	({			\
-	static bool __section(".data.once") __warned;			\
+	static bool __section(.data.once) __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
 	if (unlikely(__ret_warn_once && !__warned)) {			\

base-commit: 4d2a309b5c28a2edc0900542d22fec3a5a22243b
-- 
2.38.1

