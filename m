Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8E6538F
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 17:28:48 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id a12so4466402ilp.13
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SvZOe8XGimmd2B/XmPBDNVyQJG1w2f9kGtZbnw1y9g=;
        b=C1U+SHIxHxWhiekO9kh98IJYIjI+Eem12bW0ADxIbdWf49EAqp+dimTsU1zPU5IDkG
         s6gxB6v1qKEb46gzLsO7bx8dTVgENfF/3+xN0C+qYLf67qCJH5+uw0fRZnOHVhBKurc2
         qPIlBKPUs2yagQwPnTw9WBMtg74QF99/YpvxBBDQatX2HWjyGo+FX0kgsYi9fbp6jJ7i
         e9b98XA/GCV1/dbS2VM20HnqSODqepAbYIWi1T9TioewQh4znr502vsyMdKAAAch4k+G
         vp7l0Pwc6vl6KLjZJ6RND0LaVAV596Ma3KH1Jjzmvre5ZVWRzHwGgTagXO3n52aOnD5X
         QVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SvZOe8XGimmd2B/XmPBDNVyQJG1w2f9kGtZbnw1y9g=;
        b=AyvDOQy0KaS0yGlQj8pCcRAVpQbBH9gsdMlefBGPPXgA7DDWwXVPXuVWssQ5Td2v7G
         EDyryJHTzeWAOeOOXbbMoZH61c5FutccvH/7tw2lHPLrIMtNfqBCZZM0+5LaL8GWPTHH
         6bUxiTW6DhIQQyztT6OPX+OLEVqpe+63SFX4IuHr9gx5iwyb5G4hj/qZ5sB4dBxnKdH8
         LqE8UE9SzDB4FL79fFb4cU0m1J58saRZ/57/EnQjC2mQKe6k8ye0ZnJoV1qvywil8uiK
         Y3QcqYr8/1VpF6SGhuunOn2s26watVSlos3l6drmqcQJKVYp5NuAhy25OIkRW0yxWY+8
         f+jA==
X-Gm-Message-State: AJIora/vww7/Cl3UqtojPLV4k6KM3+HXIyzpBvkDI7KSM1VaceIuH/So
	XWZslhUqezyi6ODiFRXmRN4=
X-Google-Smtp-Source: AGRyM1v8eYaNRA6KEPBq56q/Zktf2USJ50ThRchPK9Gb1M/ToV8z7dPm2TpdpT0GBWG1Xe5dSEZ5vQ==
X-Received: by 2002:a05:6e02:158a:b0:2d5:12f0:4dce with SMTP id m10-20020a056e02158a00b002d512f04dcemr24622483ilu.159.1657128527235;
        Wed, 06 Jul 2022 10:28:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net. [71.218.105.222])
        by smtp.gmail.com with ESMTPSA id u2-20020a92d1c2000000b002dc0c1b8edbsm3099278ilg.83.2022.07.06.10.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:28:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
Date: Wed,  6 Jul 2022 11:28:13 -0600
Message-Id: <20220706172814.169274-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current bpf_helper_defs.h helpers are llvm specific and don't work
correctly with gcc.

GCC appears to required kernel helper funcs to have the following
attribute set: __attribute__((kernel_helper(NUM)))

Generate gcc compatible headers based on the format in bpf-helpers.h.

This adds conditional blocks for GCC while leaving clang codepaths
unchanged, for example:
	#if __GNUC__ && !__clang__
	void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));
	#else
	static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
	#endif

	#if __GNUC__ && !__clang__
	long bpf_map_update_elem(void *map, const void *key, const void *value, __u64 flags) __attribute__((kernel_helper(2)));
	#else
	static long (*bpf_map_update_elem)(void *map, const void *key, const void *value, __u64 flags) = (void *) 2;
	#endif

See:
https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27

This fixes the following build error:
error: indirect call in function, which are not supported by eBPF

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - more details in commit log
---
 scripts/bpf_doc.py | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/scripts/bpf_doc.py b/scripts/bpf_doc.py
index a0ec321469bd..36fb400a5731 100755
--- a/scripts/bpf_doc.py
+++ b/scripts/bpf_doc.py
@@ -739,6 +739,24 @@ class PrinterHelpers(Printer):
 
     seen_helpers = set()
 
+    def print_args(self, proto):
+        comma = ''
+        for i, a in enumerate(proto['args']):
+            t = a['type']
+            n = a['name']
+            if proto['name'] in self.overloaded_helpers and i == 0:
+                    t = 'void'
+                    n = 'ctx'
+            one_arg = '{}{}'.format(comma, self.map_type(t))
+            if n:
+                if a['star']:
+                    one_arg += ' {}'.format(a['star'])
+                else:
+                    one_arg += ' '
+                one_arg += '{}'.format(n)
+            comma = ', '
+            print(one_arg, end='')
+
     def print_one(self, helper):
         proto = helper.proto_break_down()
 
@@ -762,26 +780,17 @@ class PrinterHelpers(Printer):
                 print(' *{}{}'.format(' \t' if line else '', line))
 
         print(' */')
+        print('#if __GNUC__ && !__clang__')
+        print('%s %s%s(' % (self.map_type(proto['ret_type']),
+                                      proto['ret_star'], proto['name']), end='')
+        self.print_args(proto)
+        print(') __attribute__((kernel_helper(%d)));' % len(self.seen_helpers))
+        print('#else')
         print('static %s %s(*%s)(' % (self.map_type(proto['ret_type']),
                                       proto['ret_star'], proto['name']), end='')
-        comma = ''
-        for i, a in enumerate(proto['args']):
-            t = a['type']
-            n = a['name']
-            if proto['name'] in self.overloaded_helpers and i == 0:
-                    t = 'void'
-                    n = 'ctx'
-            one_arg = '{}{}'.format(comma, self.map_type(t))
-            if n:
-                if a['star']:
-                    one_arg += ' {}'.format(a['star'])
-                else:
-                    one_arg += ' '
-                one_arg += '{}'.format(n)
-            comma = ', '
-            print(one_arg, end='')
-
+        self.print_args(proto)
         print(') = (void *) %d;' % len(self.seen_helpers))
+        print('#endif')
         print('')
 
 ###############################################################################
-- 
2.34.1

