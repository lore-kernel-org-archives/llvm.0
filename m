Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273266683
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:11:53 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c1ff5b741cso130318675ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696011113; x=1696615913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDRQEh16G/ipKRezI+KzovNtgIHUYl51I1aN5U61Mmg=;
        b=UOoQ5gpp46jSKqn4IX7mkcx7l+Y/j7DVKVFljQ/O0pFIKYDVjussR7r2e9NucWBIiD
         TD82sFBklOakhY7yOVHi0ljIBjEOxxmVSlvPERz7RvpNFPy7C7IsU7ArpYWIq8qrZ2KC
         FiKBD7nKrFC+qzc4fs4orK2/ttngE9b1eWyZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696011113; x=1696615913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDRQEh16G/ipKRezI+KzovNtgIHUYl51I1aN5U61Mmg=;
        b=Nk1UrwnMsN2jGGWg7Z9c5HU0EvSU4rW2Q1raAl2FbEHYO0j+Lsr1JcgIGs+4sByYmE
         uAkluDAiWUJ5dtwVQPVGBLvjWSH/iOcgIH2weMC6DnnsBn97ACZ1hOdQB6n4kdpW6Wrg
         wUC/6zyOG119mzW8pU3MRTbnXi+KyrVi4UmNC11l1XdiiEZ4UkaJ7lB4Ftox76DT5vk8
         88u5Al0+P96ZMGTSmidzwv4W49hZaooAZNFXuU9ZPje+5i9t9EYeTzwie5AFZAU38rgd
         AA0MLEj0wRIwe5myKoXTByw/0HbsxyPS0onaKfumGIl6fpfC8S5y2q+UX9hHy0e0OLa2
         lVkQ==
X-Gm-Message-State: AOJu0YzGnL/uyuD4w3I7cMp2XKjUAkaDH425xxqGgvLR5BP8wjWeV4Jv
	F6Dnvi6j2VmZibJjM/7SN5F8gw==
X-Google-Smtp-Source: AGHT+IGFwlJWyVkm3A0mUQlX8g9/99iOnnwZlUWPyYk2xMspY3q7K0JlfsqBEcTTaZjRplBDOBuiwg==
X-Received: by 2002:a17:902:bc4b:b0:1c5:b1a6:8118 with SMTP id t11-20020a170902bc4b00b001c5b1a68118mr4839960plz.42.1696011112843;
        Fri, 29 Sep 2023 11:11:52 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c15500b001c5fc291ef9sm13312784plj.209.2023.09.29.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:11:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Raju Rangoju <rajur@chelsio.com>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] cxgb4: Annotate struct sched_table with __counted_by
Date: Fri, 29 Sep 2023 11:11:48 -0700
Message-Id: <20230929181149.3006432-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929181042.work.990-kees@kernel.org>
References: <20230929181042.work.990-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=keescook@chromium.org;
 h=from:subject; bh=kcIodOTCVIvY76AS2Uf+/xwdtFjYx7zCzGpQXcox5NQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxNkxHK+/1uBSnROiVBnNQXzF7bg+qpdlTfz8
 ywFHOxF76eJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcTZAAKCRCJcvTf3G3A
 JvRwD/4vZRzCzyJ7qZ5e0LaFPcNTQJBX3MNd8d1CbPHzcNnsTiUzvwr2QTMa+SJNHbJz1OW0YkF
 F8oDEfY8iB86DNWrxXtU8Mh3SxWPpOWhGm5D1NYhVVOxsc3lD9nY+CMXj/H1ll8yIc9ZOPDTlXl
 sbpzhQSqKnzMh0pruH9XXBjZdMOcPY541+f1VcAWUR15XNGVYztINFkCllOwGK7/TfFUkGa67xK
 /OFPRD/X5XA40emcOai1thpLYunfLuJT65xmN9IiPI/43TO8t9O+990Gk2tsSLFSxh54Jym8nXj
 WjDX6F4t5K5a80F8HuSOL7xkxbslxqmV1QoPUCLSWpTOhyX6ysRsd3YDRxNomMJAjaz0QIWUuM2
 BEwG12H7dp8Uq/JgicSWz3qgEi+NnCp0T8n7PsDod43AaAQOg0hY5f+PjAS+kcj2N5EL6f2YXxG
 rQVl/O12pw7A5Uz5FQkUklt7d2uYQ3ZUQuhx+S7bfzC6tGPBK+c5tGq1gN19O03rnPjOmcpoTG9
 Yn6B340GmCnWDHH2xaAZn5Vi1qAY9krgGCjtRMTM0T4JJRDT43jON6staRXoccxa1ReFpqv0TW+
 qpSBF1Xzr7UAXSbT56sXO7mAN64CubXJtY8Y28rYrWzq68zey/FU4c2JFbmLKUGO47FVhZ6kXoC k6U28UbshZcl60g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct sched_table.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Raju Rangoju <rajur@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/chelsio/cxgb4/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sched.h b/drivers/net/ethernet/chelsio/cxgb4/sched.h
index 5f8b871d79af..6b3c778815f0 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sched.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/sched.h
@@ -82,7 +82,7 @@ struct sched_class {
 
 struct sched_table {      /* per port scheduling table */
 	u8 sched_size;
-	struct sched_class tab[];
+	struct sched_class tab[] __counted_by(sched_size);
 };
 
 static inline bool can_sched(struct net_device *dev)
-- 
2.34.1

