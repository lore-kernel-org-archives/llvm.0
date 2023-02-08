Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427B160
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 23:25:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f6so900409pln.12
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 15:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0M2E7/02dlvJiZTVnIWyTeiMgvIxEtCuzBBJQtnX/JM=;
        b=Kd9X91L6aWl2C3IzFAJHT8vpU0II3tABmPdCDH04pU/uxfCFwSa5tkFhGGB5PhDCDp
         +k/qHRN10g97J7gf+YNa+8elgTJi5pXXGs8Mu4qnhlM5t5IkP6iwW10whdguunezqGri
         DevJn+KBLyJ4SSCRG+EOWDHZk57IPnjTS4lvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M2E7/02dlvJiZTVnIWyTeiMgvIxEtCuzBBJQtnX/JM=;
        b=KO1P8bPze+X5lKCj9EhB5npm3hNLG5q8xLfuP3vJIWJEeHIS37YlJHnfguHwpSq0Dt
         3QS+oNudCW2xrTHdd6Lg0kCyKIjVlHQ6I4HrW7URt6IkSTy/b2WRTVFS5ISampSIY4eO
         gL2IMZarr0xvjrHcNg0lmBsm6W9Qfu6AbOrDToI6A1XJEeGixGa6hTZRZG/Jv5wgicDm
         uUWBs3BloHAokjzXa1yery7YHRNtnSnOG0Ib6CahQlISpZAmQvQidBr4FLg6DtTOZ3bu
         3fIa8Wx1OCbiN/TuwUP4MUAmn/AfUmrBrvA07mJCsSNhNzqK6id3mVUn4iMR8875TJKi
         o03w==
X-Gm-Message-State: AO0yUKXzMZb0Ne9p66Szj2LoDfiFYIX4HjtfbewZ2j7fSOJNHzjg1kjw
	FQYcvU2ZaGi0NFih4y55+kw+Cg==
X-Google-Smtp-Source: AK7set8SetsuX6rbiBZxlHxYNn9FBxyZwIzOoKbjerCb50EmBWaeirDi/oDkDvepCt8g5slk5CyDfQ==
X-Received: by 2002:a17:902:e807:b0:196:8d48:8760 with SMTP id u7-20020a170902e80700b001968d488760mr9818064plg.31.1675898755570;
        Wed, 08 Feb 2023 15:25:55 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b0019937ea86c1sm3530plb.143.2023.02.08.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:25:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Zhang <markzhang@nvidia.com>,
	Patrisious Haddad <phaddad@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] RDMA/cma: Distinguish between sockaddr_in and sockaddr_in6 by size
Date: Wed,  8 Feb 2023 15:25:53 -0800
Message-Id: <20230208232549.never.139-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113; h=from:subject:message-id; bh=S5Y2WqgnxK+dD2vZwFfFa98eG26CHb9Bq4BbhYiNp8M=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj5C+AQcHckxweuEWNyvark/PYjLKlD6QPhLzpFhW2 //P+xfOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY+QvgAAKCRCJcvTf3G3AJkaXD/ 0Q8vmWdNfRbhG7QjCOcU5RLk01tCzr6qK2z1IjOYKHSQah3XfBTRyJZZ6vdhRyO33/vPn+wg8g1ixe v8iVPQSpq9MtHlf16dKbjUBL8LAJT2JmJw4I9Mwzu8m0/Pt7PmmtqhydIHOrwNjXy099XMFTWVhNNl OcylAZWnoHIgfY7yGkCSlu59hc3DltyZIwJywxmAMV1CtrciasjEmk3yYduudNO6/m50OvgL439gF+ ckhKNrLD60fhgVLXIa20QbjsOPOIVoVDYirEbTR7Ju3j4gh2YfLfinNlDVKkN1Afshh0iRqBtQUP1k XI313gn/kog5bX+i8KYpn5GPPCy5psYt3CGa9HS0lrWemsFl1jAW64WCTFviA5jYPIjwqdvADQPigk ugy1yvXLa9EZfqFur8+9xZ2fOQXUNcvRaAiInxTOih5NJCVcS+d6qBP0kq01iGxbmytAYmRwM0Xr7i QQvv8UpTELf+EjmUo44tM7LmG6/otUaqBAw9xbLfM7zt11cDzcegecfShJmC9BQuzmjTnljOM1f814 hv6ldPRxbT4KWgwtFuhE8G/bzGWqTZvRXXUTKQG/EM0rJR3tq1HziF1hvD8FY0Q7huXzjGZgCGjoQq kthAUN+/dyo141RIa3xqY9ZyXr79CLSYcjl89NEWOwbnCBCC6wWnaz3hY1oA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang can do some aggressive inlining, which provides it with greater
visibility into the sizes of various objects that are passed into
helpers. Specifically, compare_netdev_and_ip() can see through the type
given to the "sa" argument, which means it can generate code for "struct
sockaddr_in" that would have been passed to ipv6_addr_cmp() (that expects
to operate on the larger "struct sockaddr_in6"), which would result in a
compile-time buffer overflow condition detected by memcmp(). Logically,
this state isn't reachable due to the sa_family assignment two callers
above and the check in compare_netdev_and_ip(). Instead, provide a
compile-time check on sizes so the size-mismatched code will be elided
when inlining. Avoids the following warning from Clang:

../include/linux/fortify-string.h:652:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
                        __read_overflow();
                        ^
note: In function 'cma_netevent_callback'
note:   which inlined function 'node_from_ndev_ip'
1 error generated.

When the underlying object size is not known (e.g. with GCC and older
Clang), the result of __builtin_object_size() is SIZE_MAX, which
will also compile away, leaving the code as it was originally.

Link: https://github.com/ClangBuiltLinux/linux/issues/1687
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Mark Zhang <markzhang@nvidia.com>
Cc: Patrisious Haddad <phaddad@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-rdma@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/core/cma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 1d2bff91d78b..308155937713 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -479,13 +479,20 @@ static int compare_netdev_and_ip(int ifindex_a, struct sockaddr *sa,
 	if (sa->sa_family != sb->sa_family)
 		return sa->sa_family - sb->sa_family;
 
-	if (sa->sa_family == AF_INET)
-		return memcmp((char *)&((struct sockaddr_in *)sa)->sin_addr,
-			      (char *)&((struct sockaddr_in *)sb)->sin_addr,
+	if (sa->sa_family == AF_INET &&
+	    __builtin_object_size(sa, 0) >= sizeof(struct sockaddr_in)) {
+		return memcmp(&((struct sockaddr_in *)sa)->sin_addr,
+			      &((struct sockaddr_in *)sb)->sin_addr,
 			      sizeof(((struct sockaddr_in *)sa)->sin_addr));
+	}
+
+	if (sa->sa_family == AF_INET6 &&
+	    __builtin_object_size(sa, 0) >= sizeof(struct sockaddr_in6)) {
+		return ipv6_addr_cmp(&((struct sockaddr_in6 *)sa)->sin6_addr,
+				     &((struct sockaddr_in6 *)sb)->sin6_addr);
+	}
 
-	return ipv6_addr_cmp(&((struct sockaddr_in6 *)sa)->sin6_addr,
-			     &((struct sockaddr_in6 *)sb)->sin6_addr);
+	return -1;
 }
 
 static int cma_add_id_to_tree(struct rdma_id_private *node_id_priv)
-- 
2.34.1

