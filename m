Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4D5683
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="odoJx+UE"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9c2db82b0so1846053b3a.1
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 18:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704855523; x=1705460323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3neAR9V7SIBmjNce2CVYMk0Vegme33FSuElWc3JPGc=;
        b=odoJx+UE/uad3vCAICovZneLTyMMZa7lWafh4UCi+lau1A9mXOXbd1XPsxTHO256zT
         PtIccpugc8xSZWN7IusxEz5jW0IFUn4FZzFgDmgGHyrmxrorW1mBXscxYKwz/w/Kf6+u
         fp5edOdn8cGUaovrGDTRPrD4e3jnFwWcCxhtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704855523; x=1705460323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3neAR9V7SIBmjNce2CVYMk0Vegme33FSuElWc3JPGc=;
        b=V7nE2ySV2FhCDdbt31ltUxCTEkl4nBZIf9wNGql61Cy82JEmC8G7wYTe6LW0TSmYhC
         DC1L7n4DmWFQE2nTLPPcFNfdJZGAapCEc1kfk41jNvooYnHh5e6gwflpf4VchEpKL2ic
         jsvG2lrSe3KGXzTlIOyy6JuzY7kOVCFlutUamH1v1BZWoN9E80jzd33k8sTbzCHOjRJ2
         7J36AHM2Dvc5BDCeTRdEHuoxqjeYlxfmn/+nVAE6fcbUZOgW+sn4VWUWexb4mgTVwjmp
         xDhfu5LjSkn40eVPdIes3W87DZca5y74T3pzzXROlm4cFSU95ZUaOTgrEAIqclkAFvgr
         NdYA==
X-Gm-Message-State: AOJu0YyC9/Aq8u1FZrVRupf/KDOT51QMzRd9nJ+AyHtR/edSVxDF9co/
	P88OMHyc3KOTIHhkaSC38s77gkoJLB3M
X-Google-Smtp-Source: AGHT+IH8bbDJ5xLW2acZCKAyYc5JWcPVJDrlF6nPr34oNRP6dXZS4eXiLrf4slgEBNuPk4K9NyDWCQ==
X-Received: by 2002:a05:6a00:3014:b0:6d9:9f8d:ad2f with SMTP id ay20-20020a056a00301400b006d99f8dad2fmr433902pfb.41.1704855523372;
        Tue, 09 Jan 2024 18:58:43 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:b1d0:e755:54c2:4518])
        by smtp.gmail.com with ESMTPSA id t185-20020a6281c2000000b006d97f80c4absm2467521pfd.41.2024.01.09.18.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 18:58:43 -0800 (PST)
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
Subject: [PATCHv2 2/2] Compiler Attributes: counted_by: fixup clang URL
Date: Wed, 10 Jan 2024 11:58:18 +0900
Message-ID: <b7babeb9c5b14af9189f0d6225673e6e9a8f4ad3.1704855496.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
References: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The URL in question 404 now, fix it up (and switch to github).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/compiler_attributes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 215882a1341a..289810685fc5 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -99,7 +99,7 @@
  * Optional: only supported since clang >= 18
  *
  *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
- * clang: https://reviews.llvm.org/D148381
+ * clang: https://github.com/llvm/llvm-project/pull/76348
  */
 #if __has_attribute(__counted_by__)
 # define __counted_by(member)		__attribute__((__counted_by__(member)))
-- 
2.43.0.472.g3155946c3a-goog

