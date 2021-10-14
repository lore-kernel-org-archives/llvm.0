Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E76168
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 15:06:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CA5E600CC;
	Thu, 14 Oct 2021 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634223995;
	bh=hFiS/lWJR0rZJ3gTMLH+dhCLmu92hT1dPGV0B7uQJEE=;
	h=Date:From:To:Cc:Subject:From;
	b=QohxdhlQ4ZT2T0L/gSclIrvg6iUC5/miBAEFlmX7RJLkYZoTGrmpJaPkJ3noEG2FO
	 B8E2I/fZPLUs8g72eBpsdL/9cIDnEeD62vurF7WQRDnlQTvu2ikLMGtLSA9KTL9f3t
	 DPnmX3/ORj+zGHtqnSN+SFqjkNHy5E1cJgmc2XHs9XxRv5qp7LttElyxJ0ej37ATGA
	 NrR1/i6VQ7u9Q/TwTvhKFpVUAh3GNZ5E4yldFqnWW/4FnfLgdvqfy5MoowFVby5SwR
	 tmGZ0MjdvdHleV1eFmreuyjadwgqVv/fRC3ZFXHm/vVzWQYRDFKHRL2X7oanO2N3I4
	 M6i7Eqvu+nXSA==
Date: Thu, 14 Oct 2021 17:06:10 +0200
From: Miguel Ojeda <ojeda@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] Compiler Attributes: remove GCC 5.1 mention
Message-ID: <20211014150610.GA22151@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: elm/2

GCC 5.1 is now the minimum version.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 include/linux/compiler_attributes.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index e6ec63403965..87d1e773400c 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -104,7 +104,6 @@
 #define __deprecated
 
 /*
- * Optional: only supported since gcc >= 5.1
  * Optional: not supported by clang
  * Optional: not supported by icc
  *
-- 
2.33.1

