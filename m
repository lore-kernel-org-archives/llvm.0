Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153572563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 18:22:18 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j2-20020a2597c2000000b0064b3e54191aso14334962ybo.20
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=R1WcdFk/TWy+sEGVd4Eg6xNGBTF47VVsySZzXRRJmuQ=;
        b=p0IZo4quADAm9LtBXYER13jRilXxoEbNNtWctNbyaz94erFfW+/Ae4hr4rVCQ6taf0
         RmvqWwPSaYaZpN4RAUiJKaeUTKAWY6RA2Ge7MirqMcudrm05hCquBdlmHuCtPCgW16Xz
         8dFkgNLraPLJDys+pHz0L/ELmkfeGXC+ojce8v36eAWvM8/4fimra2bPU+YQzvuk8kTO
         cMj85XWyMp3nRUmvJfof1bHn8YbcbePJGEB8tVkbFN0MosoJiWlKlcUiwIOFvOlp719z
         KZr2S/fCabh/SdU+11LuCoGVEAFPO1dgHcFjbmOlMSMcFuvAaXi2snaZ6PZpE7Vsmds3
         /0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=R1WcdFk/TWy+sEGVd4Eg6xNGBTF47VVsySZzXRRJmuQ=;
        b=W+EcDMUV4cdGVJ6xScMFr66LDDkrO5D8JMc84wAQPEPXnljAOjAsU/VcbyVJqPgfDy
         ByGwsdwSKqv5Mljdrruj3Tnn/vn++fo5v7AT71G0sRl6GZLKnd0dMcSfV+P4kqJXdN5f
         z1Nrsf9f8o2heJoluesf2btYkeNa9H3q1s9ELkPi7tgI2JG5BV6JWLSi4nKAttDxL1LH
         7hbh5bW89LZDzmsd03dYwtMihVpSq6Jp1/v5nPPejPrFsVtdBIlCchsLvXkbmJGLnwap
         tYHkoiMF+TWJCpzm6huUaqNxDe11kwgry3TGBCJpEK9twxtqCRi8I9ArWT8uGMgOgU3S
         zL/w==
X-Gm-Message-State: AJIora//KBC8jPlJf2A3Dy5bt60/TSaEZAKLVGmpXQ0Ur4PCatA/8Pfn
	O7oyaLHELn3X/eFo2L/2hjO1npGDpExm8UEAlA==
X-Google-Smtp-Source: AGRyM1tmNx0T2KWxtxST94klObq1uh9KpQnah6fe41ByOMvHcjrVTSMEGMhluBFJBCjdo2HJ7Z4GUvoKoyA7AFMMDw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4640:519a:f833:9a5])
 (user=justinstitt job=sendgmr) by 2002:a25:9345:0:b0:66e:3100:c83d with SMTP
 id g5-20020a259345000000b0066e3100c83dmr29236559ybo.185.1657218138053; Thu,
 07 Jul 2022 11:22:18 -0700 (PDT)
Date: Thu,  7 Jul 2022 11:20:52 -0700
In-Reply-To: <20220706235648.594609-1-justinstitt@google.com>
Message-Id: <20220707182052.769989-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220706235648.594609-1-justinstitt@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2] net: rxrpc: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: justinstitt@google.com
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	kuba@kernel.org, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, marc.dionne@auristor.com, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	trix@redhat.com
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
diff from v1 -> v2: 
* Change format specifier from %u to %x to properly represent hexadecimal.

 net/rxrpc/rxkad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 08aab5c01437..258917a714c8 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -431,7 +431,7 @@ static int rxkad_secure_packet(struct rxrpc_call *call,
 		break;
 	}
 
-	_leave(" = %d [set %hx]", ret, y);
+	_leave(" = %d [set %x]", ret, y);
 	return ret;
 }
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

