Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8EB044CB3C
	for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 03:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 01182613F8930;
	Thu, 30 Nov 2023 11:40:33 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	akpm@linux-foundation.org,
	willy@infradead.org,
	fmdefrancesco@gmail.com,
	ira.weiny@intel.com,
	tony.luck@intel.com,
	jiaqiyan@google.com,
	pcc@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] highmem: fix a memory copy problem in memcpy_from_folio
Date: Thu, 30 Nov 2023 11:40:18 +0800
Message-Id: <20231130034017.1210429-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker complains that value stored to 'from' is never read.
And memcpy_from_folio() only copy the last chunk memory from folio to
destination.
Using 'to += chunk' to replace 'from += chunk' to fix this typo problem.

Fixes: b23d03ef7af5 ("highmem: add memcpy_to_folio() and memcpy_from_folio()")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 include/linux/highmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 4cacc0e43b51..be20cff4ba73 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -454,7 +454,7 @@ static inline void memcpy_from_folio(char *to, struct folio *folio,
 		memcpy(to, from, chunk);
 		kunmap_local(from);
 
-		from += chunk;
+		to += chunk;
 		offset += chunk;
 		len -= chunk;
 	} while (len > 0);
-- 
2.30.2

