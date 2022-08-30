Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B016100
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 20:53:28 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k126-20020a253d84000000b0068bb342010dso621177yba.1
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=XFDa6KTgHv01kWZj/Seua+4bvIrhtY4bUBF4MqV18nA=;
        b=H/B4/YP2EStOk1wApV/pkDl/3ocH+jW86m+kMjqfupJWEDtKmPbguzigbJi+iehwck
         u9h5UmeiZ/Y+6U08FR95+SJ7+0ggp3YI2ohxn+VjcC942GXqmQ9+b423Jryg/I9Bw8DH
         Nmy/gDoVn6i983bEcz+TiD844qnzMB73YjVfbRWjysYPxBrCGezlLiaMb168Glsm6M3b
         9PdqLGnY46ud8nEh+o9MNo2n0kVJdg2rnI4dBoZ75Z7ugj1cQCeQ6SyPegmpqMElKe1M
         +rMINy5wZ5pu9cglimln6dYGIAYENa0SCx9A2BZPqNWLYjctHkCijB6mTLtH5V3pVUsE
         2rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=XFDa6KTgHv01kWZj/Seua+4bvIrhtY4bUBF4MqV18nA=;
        b=ltbX1hBPt8VXcfDEvYxEimSma9t5wFTKuZrvlZk2vA4RrS0MeTUMDIjMOy61D59upf
         qezbC+mCyvgWgWYj9ryMwQG1RuwU0A13Kco07Av6ar/9YKGg0ts/pv/pvK8oxdHhag3N
         YpEJ7hYMaV+JbSWVycUxp/eKMjMeYOdJaqBeM6dup+pRXRZaNEKGw0irHQJYh49bb3qK
         Pz/6oNQS2yDZV41gzQRaNC6/j5FG8vzkzCtk4xW1ZVhC81Cyv++gqqKn4UUqQG89NGCP
         MP0vGJouZ6DQxdbS1HNMUFBGsCl28xsbJfw3qIiHt63m2/53EBNDYQeR5qKYf5Lral9z
         /RRA==
X-Gm-Message-State: ACgBeo2Yr29orU7uG+XuPEpRXs5fXcuGg9+yryXmL0LwnayAHeTgVr5G
	yqe+OlwOBtrVUHxmzZtJLW2xFcyeLxvtqE86+kw=
X-Google-Smtp-Source: AA6agR5MMFcErFPh2qkaMkboWUbEABQ2QTTx3nnDWp3MZ+MbGpJqYtn/MroTOeI5lVbS/eEQRx5QJrTFkWBl2XP+U5s=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:422b:cadb:302a:7901])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a0c1:0:b0:33d:c846:7ba3 with SMTP
 id x184-20020a81a0c1000000b0033dc8467ba3mr14975364ywg.204.1661892807644; Tue,
 30 Aug 2022 13:53:27 -0700 (PDT)
Date: Tue, 30 Aug 2022 13:53:08 -0700
In-Reply-To: <20220830205309.312864-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830205309.312864-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661892789; l=1585;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=IpcxEkpuMMXQt20IrbYrIKIderc1sjTmTpdDaYMsgqY=;
 b=5UP9/drrcNhfbuFf03VKoWmjREqkPFx9i+kfQjvqhjtKvuKmzjRZk/w2179sfrlEIphxWP9p6wch
 l2mCKGd7B1MgkjXr9TDikSaAARw/UmnmsNn9QyWCNAJ05V7TTxe4
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830205309.312864-3-ndesaulniers@google.com>
Subject: [PATCH 2/3] fortify: cosmetic cleanups to __compiletime_strlen
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	linux-input@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two things I noticed in __compiletime_strlen:
1. A temporary, __p, is created+used to avoid repeated side effects from
   multiple evaluation of the macro parameter, but the macro parameter
   was being used accidentally in __builtin_object_size.
2. The temporary has a curious signedness and const-less qualification.
   Just use __auto_type.
3. (size_t)-1 is perhaps more readable as -1UL.
4. __p_size == -1UL when __builtin_object_size can't evaluate the
   object size at compile time. We could just reuse __ret and use one
   less variable here.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/fortify-string.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index c5adad596a3f..aaf73575050f 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -22,11 +22,10 @@ void __write_overflow_field(size_t avail, size_t wanted) __compiletime_warning("
 
 #define __compiletime_strlen(p)					\
 ({								\
-	unsigned char *__p = (unsigned char *)(p);		\
-	size_t __ret = (size_t)-1;				\
-	size_t __p_size = __object_size(p, 1);			\
-	if (__p_size != (size_t)-1) {				\
-		size_t __p_len = __p_size - 1;			\
+	__auto_type __p = (p);					\
+	size_t __ret = __object_size(__p, 1);			\
+	if (__ret != -1UL) {					\
+		size_t __p_len = __ret - 1;			\
 		if (__builtin_constant_p(__p[__p_len]) &&	\
 		    __p[__p_len] == '\0')			\
 			__ret = __builtin_strlen(__p);		\
-- 
2.37.2.672.g94769d06f0-goog

