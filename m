Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B32CA7
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 23:26:12 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id u20so9379963iob.8
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3YvOgvXOXgKJ9W7BKp/jkotIdUHeW5Mi6XOrIgvd1o=;
        b=kJSM4FUJOFEyyoUlphbsiJKDF2fNs2Q+gA9Fkw7292mE0XgsScrHFuFpU6ZaG4FHoR
         8jim+pM87JzYkIEcjbuYVe+HBhJyJVyRChTMGYD+s1rhfzt6Vs/gYwByIJSz5sKu9pXM
         zB2z8LCeDF6vGQvLA2uw2+SC+Ga1W5AOEQ8hfWuCtu++Q3rEHbrcGXCFpNp2ctU6bkBv
         ut0nnOg+/qJ3rMOoDwp/z6BntO0mnu0kbMy+W23h+qgP+uelv4SzTrRaAdwH8Dx1jVPL
         HHJoeJeEA9qaZNwHxV+uKU9sAnU9H0CTrhfBW8LK2TZ1oSOf4aapoR4OJPGX5PEpbM21
         dZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3YvOgvXOXgKJ9W7BKp/jkotIdUHeW5Mi6XOrIgvd1o=;
        b=dFqhzw86cqT5zSUd0vyf39SpObegfvBpp1W63nBqQfBxwGCPt3iRsuc6QtECtWN+VK
         iOHXQ4GRO8osmkdFuNTofdOCYVC85vKTtrf/pwnyUVcDZvzvKbduQRvpdFyay+OHaE/o
         SQoTVwjyzYUDh3MX7q0v+K/tNRJCrQ9oaDnXCxhUM/DzGpFHx91tCNk+MRAT5ltPzwMs
         C0D129BYbzrmYTo7dIwtBrLmtZiAdzHiMUwl+/6oC5cxt6pvCErS3P1jq9UPjQL3TEq5
         rQ9A3Bw/SZy5SKizK4Zkfh28Sz3ikoJiVQOXXS+5opjz2ivaz2FEKWr4uqD8TGFvaHem
         gK5A==
X-Gm-Message-State: AJIora8rZ6uCZf8pRy7g7rDjjXYUu1MjJUG4uJETH9jpXhc9O1AetaFc
	BLA3OOP6pkF8CghljMHpjxM=
X-Google-Smtp-Source: AGRyM1saynzQkwGM+ob0Kfg8t62NJax3I9qIPugPBKcuk0nur2+1d9I6KibU7dK0bZ0KsICgPJcMuQ==
X-Received: by 2002:a05:6638:134a:b0:33f:20b6:398b with SMTP id u10-20020a056638134a00b0033f20b6398bmr334606jad.301.1657668371297;
        Tue, 12 Jul 2022 16:26:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net. [71.218.105.222])
        by smtp.gmail.com with ESMTPSA id o17-20020a92d4d1000000b002dbee570531sm4194605ilm.18.2022.07.12.16.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 16:26:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3] bpf/scripts: Generate GCC compatible helpers
Date: Tue, 12 Jul 2022 17:25:56 -0600
Message-Id: <20220712232556.248863-1-james.hilliard1@gmail.com>
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

This generates GCC/Clang compatible helpers, for example:
	/* Helper macro for GCC/Clang compatibility */
	#define NOARG
	#if __GNUC__ && !__clang__
	#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \
	ret_type ret_star name(__VA_ARGS__) __attribute__((kernel_helper(num)));
	#else
	#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \
	static ret_type ret_star(*name)(__VA_ARGS__) = (void *) num;
	#endif

	BPF_HELPER_DEF(1, *, void, bpf_map_lookup_elem, void *map, const void *key)

	BPF_HELPER_DEF(2, NOARG, long, bpf_map_update_elem, void *map, const void *key, const void *value, __u64 flags)

See:
https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27

This fixes the following build error:
error: indirect call in function, which are not supported by eBPF

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - use a conditional helper macro
Changes v1 -> v2:
  - more details in commit log
---
 scripts/bpf_doc.py | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/bpf_doc.py b/scripts/bpf_doc.py
index a0ec321469bd..45f51ff1318c 100755
--- a/scripts/bpf_doc.py
+++ b/scripts/bpf_doc.py
@@ -717,6 +717,16 @@ class PrinterHelpers(Printer):
         header = '''\
 /* This is auto-generated file. See bpf_doc.py for details. */
 
+/* Helper macro for GCC/Clang compatibility */
+#define NOARG
+#if __GNUC__ && !__clang__
+#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \\
+ret_type ret_star name(__VA_ARGS__) __attribute__((kernel_helper(num)));
+#else
+#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \\
+static ret_type ret_star(*name)(__VA_ARGS__) = (void *) num;
+#endif
+
 /* Forward declarations of BPF structs */'''
 
         print(header)
@@ -746,6 +756,11 @@ class PrinterHelpers(Printer):
             return
         self.seen_helpers.add(proto['name'])
 
+        if proto['ret_star']:
+            ret_star = proto['ret_star']
+        else:
+            ret_star = 'NOARG'
+
         print('/*')
         print(" * %s" % proto['name'])
         print(" *")
@@ -762,8 +777,8 @@ class PrinterHelpers(Printer):
                 print(' *{}{}'.format(' \t' if line else '', line))
 
         print(' */')
-        print('static %s %s(*%s)(' % (self.map_type(proto['ret_type']),
-                                      proto['ret_star'], proto['name']), end='')
+        print('BPF_HELPER_DEF(%d, %s, %s, %s, ' % (len(self.seen_helpers),
+            ret_star, self.map_type(proto['ret_type']), proto['name']), end='')
         comma = ''
         for i, a in enumerate(proto['args']):
             t = a['type']
@@ -781,7 +796,7 @@ class PrinterHelpers(Printer):
             comma = ', '
             print(one_arg, end='')
 
-        print(') = (void *) %d;' % len(self.seen_helpers))
+        print(')')
         print('')
 
 ###############################################################################
-- 
2.34.1

