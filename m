Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAB23B5
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 15:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB981C340EE;
	Tue, 15 Mar 2022 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647358254;
	bh=TPRJJdUhhjCc3jozDzBZPKh4p23Ybi3V/ACgWbqzz3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hrooWIBu7/7bNVMI3oLBk9eoylUHJSo1wQMf/qzUiRvPTUEGinH9c1VuvgY6HiLcJ
	 G6ZOvPVeTNQAJzRSEPGmc8RJUmDxD4FFnajxbMB5bXp3JUKRtGj+TLZBsZvllZeSsO
	 7cYX+NRngJP6UP0O8DDsgcWlsJLY6NFhW+ct1g8ImZB+MiaCCVWHsNSrOtDC02xJCh
	 oQ9/VxMZktNlsWnElRTP2jpE76pt8eEzwAqGKzNvOqMkErfvPm5XMlB3PmYLi2Rgod
	 jRJzWgx9qxJhhjQQHh2MVHM00j2a/LlVlPW4HhH/UzBGGp7ijgzFCOXgl7hOmUbMYH
	 Xi85m1wSMSG4A==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 1/2] linux/types.h: Remove unnecessary __bitwise__
Date: Tue, 15 Mar 2022 10:30:47 -0500
Message-Id: <20220315153048.621328-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315153048.621328-1-helgaas@kernel.org>
References: <20220315153048.621328-1-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

There are no users of "__bitwise__" except the definition of "__bitwise".
Remove __bitwise__ and define __bitwise directly.

This is a follow-up to 05de97003c77 ("linux/types.h: enable endian checks
for all sparse builds").

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
 include/uapi/linux/types.h  | 5 ++---
 tools/include/linux/types.h | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index f6d2f83cbe29..71696f424ac8 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -20,11 +20,10 @@
  */
 
 #ifdef __CHECKER__
-#define __bitwise__ __attribute__((bitwise))
+#define __bitwise	__attribute__((bitwise))
 #else
-#define __bitwise__
+#define __bitwise
 #endif
-#define __bitwise __bitwise__
 
 typedef __u16 __bitwise __le16;
 typedef __u16 __bitwise __be16;
diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
index 6e14a533ab4e..6c18c54e7d7f 100644
--- a/tools/include/linux/types.h
+++ b/tools/include/linux/types.h
@@ -43,11 +43,10 @@ typedef __u8  u8;
 typedef __s8  s8;
 
 #ifdef __CHECKER__
-#define __bitwise__ __attribute__((bitwise))
+#define __bitwise	__attribute__((bitwise))
 #else
-#define __bitwise__
+#define __bitwise
 #endif
-#define __bitwise __bitwise__
 
 #define __force
 #define __user
-- 
2.25.1

