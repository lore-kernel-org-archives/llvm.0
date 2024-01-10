Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A823D0
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 02:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bv6SKoW9"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2805637a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 18:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704855516; x=1705460316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxBQeKdAHh9/b2pTNvNh/xsRsY9JOpIvRay2GNv+L4o=;
        b=bv6SKoW9+BqwN6LtnSPTmycMS87cKluwj7PbkvSK2MkZ8raajF35SCygfYFEq+BKdF
         bXqeMEykU3mkm+NtZ4e6hWVuFtxaTmsjYFRM4lynMQb+Jvduk44tMP0i0IE3LZBx/wL2
         TUOurQQfbR74NGX7qBE7GvOK9QmnGnxucdROA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704855516; x=1705460316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxBQeKdAHh9/b2pTNvNh/xsRsY9JOpIvRay2GNv+L4o=;
        b=h2/4LvlA6wPYvoT7pfJS9/2LFJdKsO/TQLFVAFaQd8CDvfJecmz8spmXSsH7/+L0vd
         e22EneB7ql8XvRBmD7jNQXIFEsJ2+91xjMRUJffVgaleUvOokkiUQ7o7f+eSdy3XPNAh
         /Us/HTs8I57PSEKxb5YVwSbUZAyFRcdE1RUykafnLMBt8MKz5DS1CBxCoXipHD2iPW00
         ZBOLjAD9dfiLxW0iElMCZe0oImTkQkJw4prwS/kMGGh8EW4KyOcJ6J+ec29cGj6PjqFY
         fU8oIMfFV3kr3ayiAKm7s5usvucDlGoGMV6LTlShxRUhbiS3ETLM+ofeN1jWWqNr3OIX
         wUtA==
X-Gm-Message-State: AOJu0YwEmx/LVHmXcrZ7emGaHqE5NYx0QjHuyNCRsyN10zxghjFQ4ejt
	kJkdiwYYpkJiM3D8Lp56GsMxLsQ6WRZm
X-Google-Smtp-Source: AGHT+IGgLrTZv+Vz6OAgMNgIcAlYxMOtYF27/wKUefy1r1fVcKpJMhkKvD+nEBf1GzA22lGgta7K8Q==
X-Received: by 2002:a05:6a20:7b2f:b0:190:fca:72d8 with SMTP id s47-20020a056a207b2f00b001900fca72d8mr283513pzh.109.1704855516287;
        Tue, 09 Jan 2024 18:58:36 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:b1d0:e755:54c2:4518])
        by smtp.gmail.com with ESMTPSA id t185-20020a6281c2000000b006d97f80c4absm2467521pfd.41.2024.01.09.18.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 18:58:35 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 1/2] Compiler Attributes: counted_by: bump min gcc version
Date: Wed, 10 Jan 2024 11:58:17 +0900
Message-ID: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC is expected to implement this feature in version 15,
so bump the version.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/compiler_attributes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 28566624f008..215882a1341a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -95,7 +95,7 @@
 #endif
 
 /*
- * Optional: only supported since gcc >= 14
+ * Optional: only supported since gcc >= 15
  * Optional: only supported since clang >= 18
  *
  *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
-- 
2.43.0.472.g3155946c3a-goog

