Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D587B
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650974760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRKiCK7YkDXuEi8UT1lBCyoBeoI9sdfI9zFpeIfYSjc=;
	b=AAFs+UsCaIl21TXypU0jen/kCzUbgfbIY4iY8HeEoTleoQ9vZYxoxTRRuUExqfrwy4ocKj
	xXCDf/x3sI/ZioiyvWVmWa1pg5CCloxD9uGsZfO3vpfWtxQ+vUVnl3UnkQVzDwiPHRqeyB
	6ttUW0v4l/HIN3hQkSXz/DK0zz8iH+s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-A8_xNrgdPGKLetseltNRtw-1; Tue, 26 Apr 2022 08:05:59 -0400
X-MC-Unique: A8_xNrgdPGKLetseltNRtw-1
Received: by mail-qt1-f197.google.com with SMTP id cj27-20020a05622a259b00b002f334b76068so9713816qtb.4
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 05:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dRKiCK7YkDXuEi8UT1lBCyoBeoI9sdfI9zFpeIfYSjc=;
        b=xQF+tAixVdtKhFW6kgf1V/yyXxc3IM91IJaQoxfD6T/LxHaAV1RIrBZ87Y4w2tznTh
         bzw/8L3z1AL2h1Jag1W9bPoQteFldXaeOPSNjpE93roSvMnbnRcztQcD0DNGPizsrslK
         NROQ8F5KRo5Xgp00VEfcf4H7y/zXeWnynA3YHhkaGSMH0/ys2c8eDkgIsgI8SR3wDg/l
         zx4ZO42OcctFlwO8PXEPHDDn5+ejWPnqAcHbx/mUlSrtm8qNcMh08FCGBCDz2pcK+DKA
         Q6YWBK3YphAqHPyApQk1d+rScp5+dqkul3yRSKapJeAFQYnk6mxxDXUfKLptpqw064ae
         F+YQ==
X-Gm-Message-State: AOAM532X1JviU+ybHEl1h/an7W+NBgWvb7nlbNvtpSKpPlr4kKZCLKfv
	J9UOWdY8921qvHhPqAPsBB9y6xn5SnD9V41Df471rwnSq3ZNaqeEXQ2bttGeW5/m0SFJR+UAtNu
	/k6/uILa3bbUraw==
X-Received: by 2002:ac8:4e86:0:b0:2f3:6a2f:ef75 with SMTP id 6-20020ac84e86000000b002f36a2fef75mr5637995qtp.588.1650974757573;
        Tue, 26 Apr 2022 05:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQG6Om7R3FEtSeKU6XTcpFbpghZNVbhF6P6lTL6zIz8c560p8Bgs4whB0ZkzC0XtJogWcGpw==
X-Received: by 2002:ac8:4e86:0:b0:2f3:6a2f:ef75 with SMTP id 6-20020ac84e86000000b002f36a2fef75mr5637972qtp.588.1650974757361;
        Tue, 26 Apr 2022 05:05:57 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b0069f805534d3sm454101qkn.89.2022.04.26.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:05:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] tty: n_gsm: return -EINVAL when adaption is not supported
Date: Tue, 26 Apr 2022 08:05:54 -0400
Message-Id: <20220426120554.1120585-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clang build fails with
n_gsm.c:940:13: error: variable 'size' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        } else if (dlci->adaption == 2) {
                   ^~~~~~~~~~~~~~~~~~~

The else should return an error, so return -EINVAL.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/tty/n_gsm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index b0762d2fa8d6..3b8c65f66d64 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -944,6 +944,7 @@ static int gsm_dlci_modem_output(struct gsm_mux *gsm, struct gsm_dlci *dlci,
 	} else {
 		pr_err("%s: unsupported adaption %d\n", __func__,
 		       dlci->adaption);
+		return -EINVAL;
 	}
 
 	msg = gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
-- 
2.27.0

