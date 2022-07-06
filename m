Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912B6670
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 23:57:00 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id i21-20020aa79095000000b00528bd947f66so1294244pfa.18
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=k9hDQgqSg1c2GNzkRo9fr1J72XmUY4xT6POWi8tSVkY=;
        b=b+veUf+iMso1W0ftcosbsD8+NgfUr189mS3pBVAnhKIcsdjKd5MsOnAeYW2GWJktDA
         G8ia/rJSdXr7xfLbaGbUbUdfCLJ0ntBVijcDrT3CQbF5tkoUMYs6+B2A/JhKMH+d0XTq
         ORmyIyn2MtusUg/rSGYPZmRPd7Pk1z2iVveXM6yq0ItEU4IDD9wqrflC9jXoHkBVRvzM
         flgOFk0xah1QthCRP4KCx+DXAhj8hdueOKG6jffabcZwDAfsk08IhZVNpm1LouULdMN5
         b/XVTfXHm3+LJS4tgIfp1FxM0m1t3zW/LIJhBvUi3ew3e7k/9dRl6380lkdDEBMq4bwm
         BKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=k9hDQgqSg1c2GNzkRo9fr1J72XmUY4xT6POWi8tSVkY=;
        b=nLwiL2FVkooB4AHvoc7Yi1OCNoShEf+00TyLBz3/qOg+fwfDIHRV0zpzTU4BK0I8Jg
         VzRVF01qTHx5WyWy5ix8wRlRzevPytxT3halnvC8+hhnkQjdYTbnixgGscMiGqBEBIlx
         1OeFTxbPofucq7tPgvfjb/uLG8Dq1K4X3sst6KUDF4ZOGonONep/UBB15HieLerXQ3fE
         K/CPriiCQSJ9WYjIbmTDVnVcPHVGhwqoUnBVXyQ4uO8Zjc1VgqQ5+waYRfEMDqdOy7HI
         LORuHJgQvFw2U2dKca5mh+ibmUI3NB1Oj9hE7A15DWbfqCGptZfeKqNGm8w0W0DYe/f8
         YyWg==
X-Gm-Message-State: AJIora/A+Gdeg2pEv0Ktzw7R/w6YW+0hHtgZgtELfNz9BtjMKq4XmOnI
	qikodGS8MzA5jp9FO1CL7sNZ2JE52iOYqOpXdA==
X-Google-Smtp-Source: AGRyM1vIo1TA1ajKwpu+A4H7vkncJ06KptHjEuCXN0h6KsKXFUR1Mnw+ULsk3fWD1HDKgEsrB91/09YqM3y/Wxf+Tw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:aab2:e000:4b5a:a767])
 (user=justinstitt job=sendgmr) by 2002:a17:902:d544:b0:16b:d981:5c2e with
 SMTP id z4-20020a170902d54400b0016bd9815c2emr23605823plf.22.1657151819813;
 Wed, 06 Jul 2022 16:56:59 -0700 (PDT)
Date: Wed,  6 Jul 2022 16:56:48 -0700
Message-Id: <20220706235648.594609-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] net: rxrpc: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-afs@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter this warning:
| net/rxrpc/rxkad.c:434:33: error: format specifies type 'unsigned short'
| but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
| _leave(" = %d [set %hx]", ret, y);

y is a u32 but the format specifier is `%hx`. Going from unsigned int to
short int results in a loss of data. This is surely not intended
behavior. If it is intended, the warning should be suppressed through
other means.

This patch should get us closer to the goal of enabling the -Wformat
flag for Clang builds.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 net/rxrpc/rxkad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 08aab5c01437..aa180464ec37 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -431,7 +431,7 @@ static int rxkad_secure_packet(struct rxrpc_call *call,
 		break;
 	}
 
-	_leave(" = %d [set %hx]", ret, y);
+	_leave(" = %d [set %u]", ret, y);
 	return ret;
 }
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

