Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A850966675
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:04:34 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690d2e13074so11703657b3a.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010674; x=1696615474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk2AIw2pt4hARdmfDz+pJbA65TQJu27TBdJQsR6YVso=;
        b=ijTdvsyN/6O8zMLBCn765rv96946w0Xl6/aKQxbVe3+xtt9RvEsfuXXqGpdrKdK4/C
         MWVecrrzOo8TnSH9eAiiAIfPtnTVcxePB3CUN8GmdGrFPeT3t+1uJITNSaGgcRdv6chp
         2FjQzii4cbXwQTxq9t5HWJ7cpFY32nLY6I7JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010674; x=1696615474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sk2AIw2pt4hARdmfDz+pJbA65TQJu27TBdJQsR6YVso=;
        b=W3sZhidvAmpQ4Zb2YvSXmeLX+3AhWnYKwyRShRYulnt4sJcS+i1NG5tqDIzLVcezAd
         2uL5rfIgjaRZ03UpBfOL44Ii3sHh20qH52gmO/NrxJ/qFZLVyJdQtKzGghO+siwErMH/
         nXMUsQ+01VoO2IVjvn+Ur9RErcfKRUT1maetHP+EEo4WPR28M41j2J/3Qz775YmaDc1H
         IjiQzT+5n2u1KgErfDwRlLs0nbVlvPRAkmkvCPQT4I6A4KddcZJ75gOlpNba0JHlfLdl
         d+zMMB4g7eSEbTiBkni7NhKTGJXdjevtche/7YyiHi3S5e2peh0Rxj6mwYl37KMB111X
         dvKQ==
X-Gm-Message-State: AOJu0YzC+85/msC7zCX6pTU0vUxFsHsEggZdbhcDbDUYyfgJlc/zJSqM
	z21CF8yFJhUxoRr7E9NLjkvZyg==
X-Google-Smtp-Source: AGHT+IF52bKA/fkpG//8ng6o8+pByKARjWnzC4wFfcw/5B8Vi+BbgRJtb1w+TaWQ21ul0/hLPN0rXA==
X-Received: by 2002:a05:6a00:1589:b0:693:4a43:1c7e with SMTP id u9-20020a056a00158900b006934a431c7emr5259056pfk.29.1696010673936;
        Fri, 29 Sep 2023 11:04:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s196-20020a6377cd000000b005789cbd2cacsm14718511pgc.20.2023.09.29.11.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:04:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Anand Khoje <anand.a.khoje@oracle.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Christian Benvenuti <benve@cisco.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Bart Van Assche <bvanassche@acm.org>,
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
Subject: [PATCH 4/7] RDMA/siw: Annotate struct siw_pbl with __counted_by
Date: Fri, 29 Sep 2023 11:04:27 -0700
Message-Id: <20230929180431.3005464-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180305.work.590-kees@kernel.org>
References: <20230929180305.work.590-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=keescook@chromium.org;
 h=from:subject; bh=8TFS+r6rwfEZHwFvOLksc3v8PZIOUrROKrYJlwQtijk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxGu773COsQ9qpU+8QNaYwhfW/LhcAaSb6gVg
 FWhje/hPFOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcRrgAKCRCJcvTf3G3A
 JoKwD/98GIMcp1DtQPrGoXgjgRKK4LtdowIapfABsa34RZm6dmv5HgM9bCb+SlhpMQ0LbdOmLDi
 QpNAWZz/IIMNujaAkdZNQoGNvE4WXfkmDvsyLByCirVuOambsysBvy7ZxEKX78YWT4Fgr/BIkt7
 YQTLgXeEGLUz3pXd5DV/UOkYEaiOocsWiEjNJgQezzsRjk080yecZE8Uuofk3lBnLmHXVVlezDE
 1F14N790wyRyXR+1F2EnBtHDBb3SzKoTUm5ZzPfi8o3eZmhR+/Qgk8yqXcJuVQ1lGxbIkGZE4HQ
 k4FQSCvpLBWvQKmC9iS9CWs5w4uPGbAUgX2De3P5wtipK4ahcpgWianBFJ2lfoVUTX4QVWBGpqr
 NZ9XSnhMyXywgMW4Vn8fI8po9Bnrty6JCNekXPpquacZOz0arMq/32cCWmetdys0Qi6EODNhALD
 /ABu3vViC1ZK5pViwpHiK1JtFlum9I/mp4gUrbpn9VU8skPh3dyUH9VWlq2rAV4BK83IlPVw02P
 4pmkldLl63CWi/d7mvhfPtgmc1Etz33xHDSk31DEEBvqh4AQ3kmn1G6+2RtoBsV9QPV3qkjhH9H
 V3wP50SqbitWnN107wLHRygD085ais4LIDR4xdFyC4K6FmyxVY1CJKjlPyiLCPKJVA8KV1TGqqz pSuxYgQ0Gj82THw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct siw_pbl.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Bernard Metzler <bmt@zurich.ibm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/sw/siw/siw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/siw/siw.h b/drivers/infiniband/sw/siw/siw.h
index 1c78c1ca7d7a..cec5cccd2e75 100644
--- a/drivers/infiniband/sw/siw/siw.h
+++ b/drivers/infiniband/sw/siw/siw.h
@@ -137,7 +137,7 @@ struct siw_pble {
 struct siw_pbl {
 	unsigned int num_buf;
 	unsigned int max_buf;
-	struct siw_pble pbe[];
+	struct siw_pble pbe[] __counted_by(max_buf);
 };
 
 /*
-- 
2.34.1

