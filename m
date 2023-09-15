Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1942E30D06
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 19:58:52 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf7423ef3eso21516135ad.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807932; x=1695412732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mvaVHg0XEhOTsWroaSMJTNrbWXg2FfhIFu4j+H929s=;
        b=Stiax1JgTDOgXDDhiJZmcKA1EWdRM6tao3m8Q3Nno8sFDJhTBdEKlZaNzEIb0Gk594
         Nxu2WrgLGZVkzX5K9LdnY6CBdbiWWoNwzm3RvE8adaRMmIjaKZqnEJg6SMimW4UFjmAL
         romGxa5Yt8IJxi/zpAbYWBDMSwFnAXR9ctAuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807932; x=1695412732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mvaVHg0XEhOTsWroaSMJTNrbWXg2FfhIFu4j+H929s=;
        b=mYVARqCBbOFPotJCGqc0JxPU/CGzg/bFkZ3Gc1AlWmU1z8AUFGPmr2IFByDD+2juw9
         aVMYkosQPamdakmr2fTre7MwkJ2lB4LjVBRk6g4afHME5XrGWAaQn4+v4JJeNi3Hun2m
         S6SelrsBIX7NjRVlVwfOiqPiNaY8hrRxkoe0TcuFqdQign4L8UwMURhLaIONseF7XDqJ
         32okwqGjd9VdqifgrKRsDFo71y3SESY/AOKLBiGkieTyCdMLvCb/Qkpoh+Xudbwq0gtt
         /0PGEBeIj3IcaOIofJPUhHrpAbvCbigENRg6yN4Hdw4IcUZN0fYwbzse/dFKKKmurrvY
         AsHA==
X-Gm-Message-State: AOJu0YxEbsrj8NXr+BA4oDuA53Rh9YBgjjiTbyg1YMLN/lqjQnsP1sOy
	DKbHZU7KXu9WypOsYW6PRspheg==
X-Google-Smtp-Source: AGHT+IF2fjZ/d33YdQNZ9Gnglfod4PZB1quLAoKZUVOZBf+nOkF+bnd0n+ISyIgWlIgPt6WDxryOvw==
X-Received: by 2002:a17:90b:118e:b0:273:4c57:a7a8 with SMTP id gk14-20020a17090b118e00b002734c57a7a8mr2448516pjb.16.1694807932473;
        Fri, 15 Sep 2023 12:58:52 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iq15-20020a17090afb4f00b002636e5c224asm3359563pjb.56.2023.09.15.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:58:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	John Keeping <john@keeping.me.uk>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Jeff Layton <jlayton@kernel.org>,
	Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>,
	Yuta Hayama <hayama@lineo.co.jp>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: Annotate struct ffs_buffer with __counted_by
Date: Fri, 15 Sep 2023 12:58:49 -0700
Message-Id: <20230915195849.never.275-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=keescook@chromium.org;
 h=from:subject:message-id; bh=eL0i+HiP/slkBuDdJazClpDx64qWyMAqWkmawhHng5g=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLd56MZVta8tY42c7tMTyLS7qSe+Nf0e7Zm7F
 jrnBGfx5vSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS3eQAKCRCJcvTf3G3A
 JhSpD/4t0mJx7TYSiK5olhOCEucRjN/ZNuGdpy6IFT4GH/acg9kkJAPfX0JpIje/rvn3j+DhuUO
 fH3CWGN0o10V3xd2ciL59u04ho6iF0mG1MOSp+OnsE9xfVBCAQfNruRlDVyRENhS+/z4Io+1SvP
 l0TP8hpU+5TUl7Zy0oGfiNJL0Z415u5Lqu+7FOgJiua6S49DwtklzXaFwComGg0e1bH9wEYoB1s
 +D6tRCDcPTRz0dkDuplAjTdXsCsQJRvaCDJ+qqxYqRO+VwF8SLOujWl0bcoIhT4GWwGEtZzpNqT
 OiUmymTkI0NpNmkS7xjdt4Wn3lK2fPoItkkaPz5oxOCct/iq2bHeN9+B+RSw5eyAYKWawvfI1iB
 mIDM12iCWpXLeMvUPGYaWClXNr5lxPjTb673viG2rg+Tsgo9AsGJh6pO5RKnDRT/vBAFflO8ckx
 AYLYWXK4wF+w7D4nArHPe+HaIeJT8sCO+GM18mbUx/fTmZl50UNKGE4W+UskJOI4KrpC8TYYQF/
 3v2LCC1qbkZbU0liGXGzC0DIDXNrwAcQPOxVRCMl1SEAslksgXA3pg/68lhepMyisRqewRUMYYJ
 UrajslA5m5q33PN0H5nC/LgV5zSGrqxYSXzv2Zr6QHzW66SKBVUhKJbXaOqDfH97IlGaI8ghjG2
 TTC4EPR H5+sovXA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ffs_buffer.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Keeping <john@keeping.me.uk>
Cc: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6e9ef35a43a7..af400d083777 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -202,7 +202,7 @@ struct ffs_epfile {
 struct ffs_buffer {
 	size_t length;
 	char *data;
-	char storage[];
+	char storage[] __counted_by(length);
 };
 
 /*  ffs_io_data structure ***************************************************/
-- 
2.34.1

