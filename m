Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4506667C
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:04:35 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so12758778b3a.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010675; x=1696615475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQWutlCB4bHLvq/a2I2458S6BRe72rUYx34sxiTinJw=;
        b=jz3p2nyyXKNOcRxuYwPcztGNCty2gfcR71W0ThKI+reHzYhi9+9WOzJTcpuA3usygm
         p4700JDqbXlZz/sEIYwPDN1wz67CHDorKo/B1izh62vlsoHeT26mqqllhzXwuKH+DaOj
         umqxcGyGZiEvghKpC5B26KIyaV/iIBRsbjSYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010675; x=1696615475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQWutlCB4bHLvq/a2I2458S6BRe72rUYx34sxiTinJw=;
        b=e1VxrmlGMAuOYHeMNO6Weu9k0g1KN7ytusbXRdPA2xieCHEPH3fCOkOBFXqPpL1c/u
         Ym/nhrc3ouDyTX3lfedGNcdhpKc+c0mmjvzbFp2uHyvpnXhljZJGr2aOSPJsn6Sr2T7V
         tMmOzVl0Jvf1hJLMROQKTe5W1pWiriKJru9ZYYqpN1f1BWfjiizvb/kFSK35ECjDRe65
         i+QFOFHtyInxjavMON3euGW0gTwbyJdZCX4v25y0zzutieJFyx2zaTdEldIrVqCyCD5t
         0qP6/PRyLKLaQZICpz8TLGX3/lJuKjjc101h/XpyhZjrdz4XKpMImqGjTBWISNt4vCN5
         yvbA==
X-Gm-Message-State: AOJu0YxpMEVOwC2liR+Xhpm4ZNkyVGyVGVAW/JUO4le/2rA5OgnYBU3B
	6uCLgob/J+togXUAxNK8DLWKtw==
X-Google-Smtp-Source: AGHT+IEavR5/wZq99qXsCEoXnSicEQATy8IvkCqg4JpNcBj3w9YLOUXqOXUW6iCClkidWBr7Q/KDng==
X-Received: by 2002:a05:6a20:8e12:b0:161:28dd:c09d with SMTP id y18-20020a056a208e1200b0016128ddc09dmr5598820pzj.15.1696010675201;
        Fri, 29 Sep 2023 11:04:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c16-20020aa78e10000000b0068c61848785sm15228538pfr.208.2023.09.29.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:04:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Anand Khoje <anand.a.khoje@oracle.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Christian Benvenuti <benve@cisco.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Patrisious Haddad <phaddad@nvidia.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	wangjianli <wangjianli@cdjrlc.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/7] IB/srp: Annotate struct srp_fr_pool with __counted_by
Date: Fri, 29 Sep 2023 11:04:28 -0700
Message-Id: <20230929180431.3005464-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180305.work.590-kees@kernel.org>
References: <20230929180305.work.590-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=keescook@chromium.org;
 h=from:subject; bh=f7YIXZ1Qz/PkvmeFE/JHjleuWcRLUOMOaQc0DRTvzX0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxGu9/IB5ROJ/iD1IoxO8XdZ0HuofI5lXB9aL
 4bAV2SnX/yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcRrgAKCRCJcvTf3G3A
 JoxWD/0ZjY+XrVB7gRnT53mKtziWVn+VsfedclKqQTgWGlk9obHRRC5h+bABdwKSf2M/x0wCQFH
 mVEbvAQDpHgR+Dff6jNIv+1QcHHO5DEpLiYDrFKCu1/+V+cLcW3uIl03j4j6xaJezo6eOsw7zsV
 qHzukxETpc8mlb33IZR04S4xPeQwpdejzndnDFde/ViDV8t7iidPzE4mWvdYon1+2aPCgI7eBj7
 bDR2OEb2yciSxCKdenFa3rByvJjqQPe6KHlxylQVLI29zQl5R+r/Sj4Z8gKsqvOBTRFFL8iQkdf
 TGtYluwh/Ok9tXHWmhOgxLEGkSuf3GZXYI+1zMXmpbcd1EOuD6WN0sZs5M2+FWQS/ZkTn7pzuR3
 Qqc3lS05bvXdyE+BCBVWVGygCQvfDP5e2QbVTnBFC5yP9AzrhU9jErH+oUyQu+gLRyZGKGudIo6
 ZhmGK2XtDlfZi0gaOKPQBdxkczkTLGAZ5NOKJQ+3k3WAfZ/7Xgg7NYu7Jdp2BudK2CvN5uRrond
 /rlpeDTxx2K62/qlY2LI7OmJWB7Px2i5bSW5g77AzDdVNvqzIRyg4mgIKNvjaYTCoeRWVCGCb9X
 cfBJppmtpmPQhtwSnT8SALM8cw5PP2q7Rci6HUL9dTUXHDHKCIQW1muP+rHVMhXbvap6GSo1vMt 1AjoxAt0tusmfDA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct srp_fr_pool.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/ulp/srp/ib_srp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.h b/drivers/infiniband/ulp/srp/ib_srp.h
index 5d94db453df3..349576ff3845 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.h
+++ b/drivers/infiniband/ulp/srp/ib_srp.h
@@ -306,7 +306,7 @@ struct srp_fr_pool {
 	int			max_page_list_len;
 	spinlock_t		lock;
 	struct list_head	free_list;
-	struct srp_fr_desc	desc[];
+	struct srp_fr_desc	desc[] __counted_by(size);
 };
 
 /**
-- 
2.34.1

