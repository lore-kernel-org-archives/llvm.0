Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9DD4431
	for <llvm@lists.linux.dev>; Wed, 15 Mar 2023 12:53:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso1134353wms.4
        for <llvm@lists.linux.dev>; Wed, 15 Mar 2023 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678884782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=;
        b=IKjEROzVMXRIH2jmXhG0/7c8b2IOHgUL6F+2j+hWDlKOJt/JE1CMxqsmVUaTSZ/ZII
         dKxHynYor0Co5ohMyb3jBPd3zTrvQxj0esnBH5bKxoki7lGTb2Pkw+/vx901t66bJvUM
         loxVftu+i7vhzZJi4xrspTeYOoe1S1Fms95gRioUAdgmxAhGxEFQQ3t2kw3Lox6vAFSR
         NL9aWBYFpdcq5c/DpZbhv6wECLhIiyxvF0A1juR88OjXaQAM2DEcGIudZwH3c1pLWPCj
         pTpj9gmfbneGj4wRu8aPNV6Kr5SIcTiI87VPALaqWD3/U818FxvX8qsZnfVBC/hs2hAE
         AeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678884782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=;
        b=n7ovzNBYxGp6pihClzeREYpBX7QkgKQbJ3Z9H4b10QN7SxbIrApdg5F/3h2SCqyHgI
         MseLltlBfI3Ml3MQ4Co+/GyY2q72wbUZNhSxte2bJtIxwKxbvoMb3YXd6kgNjig4otsm
         /T41W+MhAzxrpZdmPmOPyamYReTpUxNUrcGnI9lFpR5XIkTs2NPeZzNgSJG5q51pfjXo
         RFUoV7HjEabZb3G2QZ2zdnz6J2+hMG6eQG/JVmQ/18HUKcwsyaxFpxHWvEV3gfc3Qdbn
         wT+AwXZbB69cNViLmfWEhaS/gfbK/cs5bAe5zZoiXQB1Po2xubo5KiTv7BlASAEtAoZA
         DGng==
X-Gm-Message-State: AO0yUKWiC0Nl429xKVtBRPb9ssk2kP0mVQ+rYsT3uT+MAgCav51aQ+0E
	ZoQTCWOGO6nOeTYwGdpGjck=
X-Google-Smtp-Source: AK7set99tKxZBFxqdMlw/6z3DNaJbvpo8WlRdBy5s/IULVxadkVRlZINUgSsb6joz/S+1AnBv0uW2g==
X-Received: by 2002:a05:600c:198f:b0:3ea:f6c4:5f26 with SMTP id t15-20020a05600c198f00b003eaf6c45f26mr17240294wmq.17.1678884782269;
        Wed, 15 Mar 2023 05:53:02 -0700 (PDT)
Received: from localhost.localdomain (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id k26-20020a7bc31a000000b003eb596cbc54sm1936761wmj.0.2023.03.15.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:53:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Chris Down <chris@chrisdown.name>,
	Nick Terrell <terrelln@fb.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	live-patching@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH] module/decompress: Never use kunmap() for local un-mappings
Date: Wed, 15 Mar 2023 13:52:56 +0100
Message-Id: <20230315125256.22772-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kunmap_local() to unmap pages locally mapped with kmap_local_page().

kunmap_local() must be called on the kernel virtual address returned by
kmap_local_page(), differently from how we use kunmap() which instead
expects the mapped page as its argument.

In module_zstd_decompress() we currently map with kmap_local_page() and
unmap with kunmap(). This breaks the code and so it should be fixed.

Cc: Piotr Gorski <piotrgorski@cachyos.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 kernel/module/decompress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
index bb79ac1a6d8f..7ddc87bee274 100644
--- a/kernel/module/decompress.c
+++ b/kernel/module/decompress.c
@@ -267,7 +267,7 @@ static ssize_t module_zstd_decompress(struct load_info *info,
 		zstd_dec.size = PAGE_SIZE;
 
 		ret = zstd_decompress_stream(dstream, &zstd_dec, &zstd_buf);
-		kunmap(page);
+		kunmap_local(zstd_dec.dst);
 		retval = zstd_get_error_code(ret);
 		if (retval)
 			break;
-- 
2.39.2

