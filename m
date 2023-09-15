Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B61B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:14:51 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68fc9e0e22eso2124978b3a.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808891; x=1695413691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xGkWgfRY1FFenR3ao2iGiE7ihw6UgGIpPkGx6sQMQo=;
        b=dARLyA2dETT2dDESG5Mr2Q60G+dRr7nmXBBku3FMmaoWsbYvkA9/l9QBiqS5552b3Q
         aZUhWghAREL8uWnsHX5C5kBVQM3zlhf/xe1tY58opUSsATf3z1pzIxJIaUGUn4Lv+Zgg
         BXhuClLDW47TuE/39RCrdB0jenNMLN9jaUrHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808891; x=1695413691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xGkWgfRY1FFenR3ao2iGiE7ihw6UgGIpPkGx6sQMQo=;
        b=dRY+3Ygi53H1eJPf4mSAH334LBquVu8TjlVOUAsfaonOfu9SkrK+7NmUHqJ8NJv4S3
         ysw1TYbF0zgcE7zMDotemp2bXY/26srHh6bFQRKcfZGyjDynCH7I7HZI2pEnK5uYS3OO
         YQe2y85BjqNwd5hPMwSJQxUKikZ9uhbf4n4Z4IbsEGb3FiKxs6CpkFb2zCxclvgiPUbI
         9g6vRPztVKyHD/Kzcu1ukkjmu8DnXrPE8vhj9fD4TawPjxkKNUnojjc6mIVmYrRIJsUB
         8laU16JoyeId2BDUNk568cc0lNaiINwSsblepP0Rt3qIr30YXjCFQ2OJOs9XuFWp4qan
         7Pjg==
X-Gm-Message-State: AOJu0YwacCm3wMx/byXIY0k/+L6Pcse/sZM1Kqk2t74vgoFRZvnrqC07
	r9nVnohg2jldN1TxwawGJm6GYg==
X-Google-Smtp-Source: AGHT+IFActFxqjNHL2Z2ACBNmaLGRxovnNhDBzSm4cH+4lZA8OB0mKUJRqzlNq0CY0idCNVsG33h8w==
X-Received: by 2002:a05:6a00:2283:b0:68e:2d2d:56c1 with SMTP id f3-20020a056a00228300b0068e2d2d56c1mr2998461pfe.9.1694808891307;
        Fri, 15 Sep 2023 13:14:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f21-20020a633815000000b0056c24c2e23dsm3093252pga.25.2023.09.15.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:14:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] afs: Annotate struct afs_addr_list with __counted_by
Date: Fri, 15 Sep 2023 13:14:49 -0700
Message-Id: <20230915201449.never.649-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=keescook@chromium.org;
 h=from:subject:message-id; bh=nx9DBuOnb63mlStsb3tbldEXi6Y6SJspSK6UFXdI6Sk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLs5PIeqUuA4Rx4q3V8agIZDkHEwkyC0zaJOp
 Ra86jrJLxGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS7OQAKCRCJcvTf3G3A
 JiPID/oDSfiAd3Q3sGUrqDk53kbTWkVQVfsSh/b+0xP/N4i79R/PwYTmJA6QuNp7508t97ZFRzc
 hCZ1OFY+nPpWZgXbdW/wXDZqURZY35x7vvjdsS9pf+48qjtmnpwpFcSjWtv22r3AGVnuSp1zlQ7
 R2Q4iyXi4dBpYtGvqizxexU0zb+6QLyqoxr0nqBvW4p+LVGJTnmQB3wehEYz8szS++1+g58eHPt
 B9hT3wYjWe2OlkpPddcU7EymwlLQ0md8aZ+BH3fPs1po0pU9YJKwmKNEmpVR4ko/9uDmopjcN1X
 tY+o6/gOJBSh8yWLMQskxrH1tM8e3i246Y0IERv1siFkzN03ZogEMjV4Du1jMoCsv438ZojD7bA
 u2DPp8rVewnmEHkI6OwtfvOqMpjYF0eDmqr1hHe0qM/sUZRNLF5RvaSrMhR7Wo/y4zUOosLdpqX
 Ba6bfcZhDFTAUBsIw0LI1ePqNBMgbxPZv2xzEoTEAVbzHf+cZU4YrNScilylpqBBrTRQds9RusO
 cV6Z1XJ3QeR863KVWVpyE1rpLdiAWIXgUO8j9L02tikqomEu+dKM9J59wdRSY9Gn5qTxOJPYJo6
 HmtSTkt4DX607SF5mCwl8+CzoYpPAO0xPTE/t8JQw5E1zLJXcFSx8OmwbNVHm8d6u1sEO6KDmmy
 DvY8NFb aaz9mW+Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct afs_addr_list.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/afs/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index da73b97e19a9..07433a5349ca 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -87,7 +87,7 @@ struct afs_addr_list {
 	enum dns_lookup_status	status:8;
 	unsigned long		failed;		/* Mask of addrs that failed locally/ICMP */
 	unsigned long		responded;	/* Mask of addrs that responded */
-	struct sockaddr_rxrpc	addrs[];
+	struct sockaddr_rxrpc	addrs[] __counted_by(max_addrs);
 #define AFS_MAX_ADDRESSES ((unsigned int)(sizeof(unsigned long) * 8))
 };
 
-- 
2.34.1

