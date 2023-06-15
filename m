Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7A9BA3A
	for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 14:56:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b216so19112915e9.1
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 07:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686840988; x=1689432988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZejLKN5aLCLQqaxNI770STmW64dCVjdqgJRYwrLAEQY=;
        b=PLv0SOqjQIJKhHDvPhJa/ZXB9L6XDUaeP7ZKUz07rxGmbHpPzPDaIqnBTNJRKv73lf
         73zFaCphp11PzXmvWBy7SMjfUaaGsYMlOhN5KfuKgPgKWX7pmuIauxcdRvTtKWboDOaS
         6ZdWEqdqMTaq49d1a7W2ZfqKhadmkebP+Trm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840988; x=1689432988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZejLKN5aLCLQqaxNI770STmW64dCVjdqgJRYwrLAEQY=;
        b=mG219pzQUzsQWskp1tOT8fjkSYZvJO1k5qOixrmjtIJYL3KvbVhej1J2r/PMvpAFCz
         sflTtAIkWgOmdjY92JZ7ZSMIR+Y0LARExBcndpf/em/j9fVfm1qsaj8kvfNdIEDkgu5Q
         lnRArUlF3LvaxZPFe9rqHxrcjInhneltXPqujrtJsVrevyrl2JFJd8s842HbjzKHek3K
         1VjEm9Nc4a5/K6gOjb4yfvPNH0Piv/7KSsdm5mPgVeDgNLElczOpx1E3cvUfE/f0MFio
         jrx+PF4+7TgBOriK7VSrbMrqf6920kQKO2/LOXbILfxsi4dyGYohYpwCO0yDUxbVzKRw
         93VQ==
X-Gm-Message-State: AC+VfDwlYCJStbD0+vbStjCiygexZILXNdUJ2TA3sNHcqkV5d998Wd1X
	TRrrG088pCnUubCE6NYHqIYnLA==
X-Google-Smtp-Source: ACHHUZ5OpUwlJ/vrCXpmVoMFPIO8LTjjlYgRLY492Ohe4rUYc/w74e7rMy7X0TCztfIjKLgSpnSJyQ==
X-Received: by 2002:a05:600c:b54:b0:3f6:2ee:6993 with SMTP id k20-20020a05600c0b5400b003f602ee6993mr14415646wmr.4.1686840987856;
        Thu, 15 Jun 2023 07:56:27 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7ec7:7f97:45af:3056])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003f709a7e46bsm20617755wme.46.2023.06.15.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:56:27 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	song@kernel.org,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	Florent Revest <revest@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH bpf] bpf/btf: Accept function names that contain dots
Date: Thu, 15 Jun 2023 16:56:07 +0200
Message-ID: <20230615145607.3469985-1-revest@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building a kernel with LLVM=1, LLVM_IAS=0 and CONFIG_KASAN=y, LLVM
leaves DWARF tags for the "asan.module_ctor" & co symbols. In turn,
pahole creates BTF_KIND_FUNC entries for these and this makes the BTF
metadata validation fail because they contain a dot.

In a dramatic turn of event, this BTF verification failure can cause
the netfilter_bpf initialization to fail, causing netfilter_core to
free the netfilter_helper hashmap and netfilter_ftp to trigger a
use-after-free. The risk of u-a-f in netfilter will be addressed
separately but the existence of "asan.module_ctor" debug info under some
build conditions sounds like a good enough reason to accept functions
that contain dots in BTF.

Cc: stable@vger.kernel.org
Fixes: 1dc92851849c ("bpf: kernel side support for BTF Var and DataSec")
Signed-off-by: Florent Revest <revest@chromium.org>
---
 kernel/bpf/btf.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 6b682b8e4b50..72b32b7cd9cd 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -744,13 +744,12 @@ static bool btf_name_offset_valid(const struct btf *btf, u32 offset)
 	return offset < btf->hdr.str_len;
 }
 
-static bool __btf_name_char_ok(char c, bool first, bool dot_ok)
+static bool __btf_name_char_ok(char c, bool first)
 {
 	if ((first ? !isalpha(c) :
 		     !isalnum(c)) &&
 	    c != '_' &&
-	    ((c == '.' && !dot_ok) ||
-	      c != '.'))
+	    c != '.')
 		return false;
 	return true;
 }
@@ -767,20 +766,20 @@ static const char *btf_str_by_offset(const struct btf *btf, u32 offset)
 	return NULL;
 }
 
-static bool __btf_name_valid(const struct btf *btf, u32 offset, bool dot_ok)
+static bool __btf_name_valid(const struct btf *btf, u32 offset)
 {
 	/* offset must be valid */
 	const char *src = btf_str_by_offset(btf, offset);
 	const char *src_limit;
 
-	if (!__btf_name_char_ok(*src, true, dot_ok))
+	if (!__btf_name_char_ok(*src, true))
 		return false;
 
 	/* set a limit on identifier length */
 	src_limit = src + KSYM_NAME_LEN;
 	src++;
 	while (*src && src < src_limit) {
-		if (!__btf_name_char_ok(*src, false, dot_ok))
+		if (!__btf_name_char_ok(*src, false))
 			return false;
 		src++;
 	}
@@ -788,17 +787,14 @@ static bool __btf_name_valid(const struct btf *btf, u32 offset, bool dot_ok)
 	return !*src;
 }
 
-/* Only C-style identifier is permitted. This can be relaxed if
- * necessary.
- */
 static bool btf_name_valid_identifier(const struct btf *btf, u32 offset)
 {
-	return __btf_name_valid(btf, offset, false);
+	return __btf_name_valid(btf, offset);
 }
 
 static bool btf_name_valid_section(const struct btf *btf, u32 offset)
 {
-	return __btf_name_valid(btf, offset, true);
+	return __btf_name_valid(btf, offset);
 }
 
 static const char *__btf_name_by_offset(const struct btf *btf, u32 offset)
@@ -4422,7 +4418,7 @@ static s32 btf_var_check_meta(struct btf_verifier_env *env,
 	}
 
 	if (!t->name_off ||
-	    !__btf_name_valid(env->btf, t->name_off, true)) {
+	    !__btf_name_valid(env->btf, t->name_off)) {
 		btf_verifier_log_type(env, t, "Invalid name");
 		return -EINVAL;
 	}
-- 
2.41.0.162.gfafddb0af9-goog

