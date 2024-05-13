Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273E1D559
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 23:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643975; cv=none; b=JrwDUqjiZt0M5byrGv6VBn+w4R/SOVovv93gY+d8danruPTFl4WuHqRWrAEGwSAsXWXlgWZ0uSsujy89imGwISvvT9wWCxsI/ZDnIVHs4UI/DBYaPxjDzplhzjWE0dZi1rK0GdPX5e0ErCwLl9FU8yvy3jqhXMBA9hhurVEVO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643975; c=relaxed/simple;
	bh=AAdoFPqByr+rSZV5fnbb1g3bDcI5/e0JDBu1rdESPU8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mcOPHS3mlsclYaPWyyLGI70p6h7AKM4VFYC5VdU4woxP7nT1EA7aXrgcPMCeCE/R44Q5BqwJYN0ve/4dZk5zQlKVQ2g5OhlovQsC9m70b+M7rYDuXcbHklh1uyF1k67/MYJ6dQGlf114kQk7bBjZfVEXwrvlErhH6yV5VAhrhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3BiwsGbm; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3BiwsGbm"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso3801a12.1
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 16:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715643972; x=1716248772; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYyPp/GZh5UOQMAPDnHfvV0S7X7W7YFaMKKEzXMQZG4=;
        b=3BiwsGbmvihKSDQQ4WA1DtjgD9XXLDuczlHGDZO+KK5e75ogC2m4Ub47T6tD0SKfC0
         SNU2T6msboLue6np/KjsrDLGjUBnDbWcorcKoTfrzDGrf5kw2wM8AS2UaNZUs07H+fWh
         /QatbgIFSbN8gvVGlT9suMoe3sIpummQGbjW6BWlQjEH5blrj7uP1bk6sR8/IykdkXO8
         G/qbKE5l/bUZSo2b8VzgX/4xxhYNbzUzBQu90vTK1i0AZidrImu2vtGXmmfgFvAt9nUW
         qM0QoZTFIJPb8aa4crIp/Jqiyln5oKOV+AH+MqKvBMTvqeMAqqCymNkMQ/Z84Xs6HRh0
         W7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715643972; x=1716248772;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYyPp/GZh5UOQMAPDnHfvV0S7X7W7YFaMKKEzXMQZG4=;
        b=ZhlmlU0a69RyAFCvz2zcLAEPYbsKtBRNpx6j1YZTZ1m2Q69UTf6N+wqoXKV9SI0gjH
         KJbm8nQfid4/CO8qwiWrjH5mzeadb+kMX9s7UVro07/k7WQjIy66lkyj/Oi8Ea7YvUHy
         kROlCjjrgwz7AvCUoXyIdA+Nl3hljOVSrC6SF8cAm776hS8Mzo/c9YpCVQGcjiyd0AcU
         Iae7bhrF3oAhaXnE408YaxLZr+wlsWxyfAYaIZayvpXqdBIcPbV4NOihE4Ol8f0RHCmi
         Qrv1UiS5eiRv41uPe+CxOmahHiCHuVC7Zr4KHkvmlh/9bgPoVJq58NYOyTNMcx0bPJ0u
         BakQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0VJMst+hF5+nCC8B2/czcQ/RPe0rybbxMR3jtltpwm2to0uqsoJ89zzlgw3hSYK6X/iXhSmebbgKo2rXdb5FGnw3v3A==
X-Gm-Message-State: AOJu0Ywpxm4tP27561oXCIGm2id3f8VxUGNMFJiGoTQgBZeqQ6DkWCiB
	7myQb6Vr3DDW+MaUKad129IYWGp1jxHHThEnlH92l2dEY96b4cYD6LfgiVgbZfBhaNRk9qK5Cc2
	an1WR2a/smU28hdDuZpOYI5woJBxiksKSFTE=
X-Google-Smtp-Source: AGHT+IHC36aGzMD1bT5d5MO7nX9+nNZe1zJ0ciaXZgrLAtGQ6NmzdofJpU6zKL3UG1/jTyQ0JMKkLLAxFRHXH8B/dVc=
X-Received: by 2002:a05:6402:1e87:b0:572:25e4:26eb with SMTP id
 4fb4d7f45d1cf-574ae5d8176mr396424a12.7.1715643972027; Mon, 13 May 2024
 16:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Mon, 13 May 2024 16:45:54 -0700
Message-ID: <CAGG=3QW4b9mqh9oGQ16NmMGbo4HVHmdM00Be1Qk97StCpW4xTA@mail.gmail.com>
Subject: [PATCH] hpfs: Annotate struct hpfs_dirent with __counted_by
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Prepare for the coming implementation by GCC and Clang of the
__counted_by attribute. Flexible array members annotated with
__counted_by can have their accesses bounds-checked at run-time checking
via CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE
(for strcpy/memcpy-family functions).

Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Bill Wendling <morbo@google.com>
---
 fs/hpfs/hpfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hpfs/hpfs.h b/fs/hpfs/hpfs.h
index 281dec8f636b..ac137787f1f9 100644
--- a/fs/hpfs/hpfs.h
+++ b/fs/hpfs/hpfs.h
@@ -357,7 +357,7 @@ struct hpfs_dirent {
   u8 ix; /* code page index (of filename), see
     struct code_page_data */
   u8 namelen; /* file name length */
-  u8 name[]; /* file name */
+  u8 name[] __counted_by(namelen); /* file name */
   /* dnode_secno down;   btree down pointer, if present,
        follows name on next word boundary, or maybe it
    precedes next dirent, which is on a word boundary. */
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog
