Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AEA53
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 16:15:29 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KvwHp5CkxzMq1PF;
	Fri,  6 May 2022 17:59:50 +0200 (CEST)
Received: from localhost (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4KvwHp3bnkzlhRVC;
	Fri,  6 May 2022 17:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1651852790;
	bh=j/8aWn8tTFQfA/Ue5gMZNKj2lC2vuu0MsM0qc9wfkbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dljz4wUKy8xQPodXY/eNaxu6/fW8zPU4pn51QyEPzUjT7L6ZEpfjs5CdWN/mX8amZ
	 JDNjN/JUm0Hdjmt4CoOUiJ1RKmKAE6gbgVIpB/cF0ze7uX0onk7phJO7uidyPoCJFu
	 U/MQVcC53nYlBDcSBHJLYTzI4Nqe6jB/64+gzI7o=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Whitcroft <apw@canonical.com>,
	Brian Norris <briannorris@chromium.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Joe Perches <joe@perches.com>,
	Kees Cook <keescook@chromium.org>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paul Moore <paul@paul-moore.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 4/5] clang-format: Fix empty curly braces
Date: Fri,  6 May 2022 18:01:05 +0200
Message-Id: <20220506160106.522341-5-mic@digikod.net>
In-Reply-To: <20220506160106.522341-1-mic@digikod.net>
References: <20220506160106.522341-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SplitEmptyFunction [1] should be false to not add a new line in an empty
function body.  This follows the current kernel coding style.

Link: https://clang.llvm.org/docs/ClangFormatStyleOptions.html [1]
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Tom Rix <trix@redhat.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20220506160106.522341-5-mic@digikod.net
---
 .clang-format | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.clang-format b/.clang-format
index 30f68219c09e..235f7bb8f84a 100644
--- a/.clang-format
+++ b/.clang-format
@@ -41,7 +41,7 @@ BraceWrapping:
   BeforeCatch: false
   BeforeElse: false
   IndentBraces: false
-  SplitEmptyFunction: true
+  SplitEmptyFunction: false
   SplitEmptyRecord: true
   SplitEmptyNamespace: true
 BreakBeforeBinaryOperators: None
-- 
2.35.1

