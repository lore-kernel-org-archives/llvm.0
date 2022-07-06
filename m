Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924104C82
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 14:07:04 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id k1so4674405ilu.1
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HKcelWJsUXG+18Nwfg8eobymoMxt5y7xTMcV4rJ4jIM=;
        b=K14oQmdverp2DzpSpOp8APkZITqbUnfMthYycoeQdvUqVvI/bcgfwOelE2yS5C4Le5
         /XnH0L1tHXo/jcrD7mi+2jQzXHbBwN1pK3c3xMYg1toLwQrDDoW1JNbzISpvuVdNP+7y
         SNuTPobiRWsw66eGtxZzgmbSjpPd1FzwcSXb5qurfhCTyNYzN+iFvAYUlVS7TILU+idv
         WELv3ji7pTZGxOCNEhHYeNOAg87od0Mdj8A6dvkjFApQRnOoNkq+OUcj+/AzGMuQTMix
         FQbEebbmq9xZecUXbleGzSS/OrtSwD/2/EjEKYPXANsr96w3qYZJcCLUpyDorY2Q7IZ2
         aHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HKcelWJsUXG+18Nwfg8eobymoMxt5y7xTMcV4rJ4jIM=;
        b=PlmcFtXNpDK75jPD96VbNtDC7ByRuH+00xvEnPV2Qtybakd0JUts/29BNOo/gdbsjv
         6bnka3bjhpQ1S089dNUTzCCyeidNXW//pxV1orUNOr/MJtPQCieCpjwE034Y5dnfj8qx
         KJiqdfW/oMQz0AOvAOoyZVRJctXLSthqNNJj58l8MNdA0kaRxyuASSzHgjaCITdDKa6D
         jAA4i3aapH5WvaVjM2ox8/c7m0wxOrdIPufMqBFkHrLZdW6R8uzBibUGkv9lfL2Eniz4
         P9HDn4MsEBWfUmYKpMx9DwkJp360I7wf7HtEIouq3sIL4VPmSoqdxwSDWSqtlVgG+mpI
         RBSQ==
X-Gm-Message-State: AJIora8uweF9lS+W+rY8dtLx6wSys+z1fGboXMUSyU4676xuE3yZESHv
	6+nLVgYOmBZAULUDAw4QYYw=
X-Google-Smtp-Source: AGRyM1tR72Fw7RUjiJaTyk+us/gqsZAWL/OtbmF8MaVczaEhDTDIcshgMbsvUxoACdjtb1nTNSeubA==
X-Received: by 2002:a92:c242:0:b0:2dc:2df2:a3d1 with SMTP id k2-20020a92c242000000b002dc2df2a3d1mr3788217ilo.111.1657116423548;
        Wed, 06 Jul 2022 07:07:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net. [71.218.105.222])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d8848000000b0067276ff71b4sm16756034ios.44.2022.07.06.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:07:02 -0700 (PDT)
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
Subject: [PATCH] bpf/scripts: Generate GCC compatible helpers
Date: Wed,  6 Jul 2022 08:06:23 -0600
Message-Id: <20220706140623.2917858-1-james.hilliard1@gmail.com>
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

Generate gcc compatible headers based on the format in bpf-helpers.h.

See:
https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

