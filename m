Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B39A3C
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 08:18:37 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id s7so1470713ioa.0
        for <llvm@lists.linux.dev>; Fri, 05 Aug 2022 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZWk9ma5M79Z4Wqhxv3DfLZj3YkPOjUsw905Ysq/x12o=;
        b=NpmAHdMwOklNCLaKhx1KSd5S4DvLO87IMiPPfx2aofLGFcCCC/yvh8K0s+jsIwujgR
         GEozheo+M2woXmuPYoG4dwBvDF56DdEmgVSjDlD7Flkcds+BaA3YcaY+6175JGS3jvN7
         G0n7bjLPX9h6W4juZkcoS/eHoGiFARGM8EJu/TD59JezxpnZNbJ6Oy75Sdc4BnyerCLp
         0JvnPsgZm3j1ALRtZFtbukV0RnCrNn0C/eWmwvaTFWqqWACBcryiQN13qWwPWzKBqfF6
         r/kRRcnVAk4gJzQ7OaHkjzaSOsdM2G4Cj4NKUbNOTHq+8wizKc7YMMxRIb2avrCA+nRN
         kkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZWk9ma5M79Z4Wqhxv3DfLZj3YkPOjUsw905Ysq/x12o=;
        b=W9C5rIau4Z87IukhN14o+lEBfD703/olYZOb7MPvvciAWRfpkZYRgkrR5o1XQmI8nb
         dIYqVuij3vtHVIjnRpTnb+lHRkxpojmtY47A7tkPv6Ohf7I4keREkAe7itWzWUByiAqC
         lJBaRQFcbzIBAR+ldmwSTHVhw9BYua6qEUOrLNxD67Rk03CTcPZgD+XYlC88PP2+1qC/
         cr9Vtud/S3cc700gfQVGo0Tiv5N6Ofqrw8tNzXbXn+nBrglGQEMaUu6yUNZSxRsKOUm9
         UMJpHtsUhYiAxp8q6hmoO9mAYvFAkqQlrJT1GkBXrrNQKW4Fm1/UVZ0l25fzGKVEZHcN
         ni5w==
X-Gm-Message-State: ACgBeo1RIjYfasbu1zyQp9iyTMvz5AP1rM2zkwHpkTBL2oQhLDYO5KTH
	GsqknyCPXcZ8ngFKcqI56go=
X-Google-Smtp-Source: AA6agR5S+4JoqVlSPTsqskM4MLpfrRizxDDKs4Zg+OjJCYgF4ofsSCCJxb/qQPmy8/Qbc9+ci82TCg==
X-Received: by 2002:a05:6638:4705:b0:342:74bb:dfa3 with SMTP id cs5-20020a056638470500b0034274bbdfa3mr2570392jab.1.1659687516958;
        Fri, 05 Aug 2022 01:18:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net. [71.33.138.207])
        by smtp.gmail.com with ESMTPSA id h3-20020a92d843000000b002de42539fddsm1385624ilq.68.2022.08.05.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 01:18:36 -0700 (PDT)
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
Subject: [PATCH v4] bpf/scripts: Generate GCC compatible helper defs header
Date: Fri,  5 Aug 2022 02:17:12 -0600
Message-Id: <20220805081713.2182833-1-james.hilliard1@gmail.com>
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

GCC requires kernel helper funcs to have the following attribute set:
__attribute__((kernel_helper(NUM)))

Generate gcc compatible headers based on the format in bpf-helpers.h.

This leaves the bpf_helper_defs.h entirely unchanged and generates a
fully separate GCC compatible bpf_helper_defs_attr.h header file
which is conditionally included if the GCC kernel_helper attribute
is supported.

This adds GCC attribute style kernel helpers in bpf_helper_defs_attr.h:
	void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));

	long bpf_map_update_elem(void *map, const void *key, const void *value, __u64 flags) __attribute__((kernel_helper(2)));

See:
https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27

This fixes the following build error:
error: indirect call in function, which are not supported by eBPF

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - don't modify bpf_helper_defs.h
  - generate bpf_helper_defs_attr.h for GCC
  - check __has_attribute(kernel_helper) for selecting GCC defs
Changes v2 -> v3:
  - use a conditional helper macro
Changes v1 -> v2:
  - more details in commit log
---
 scripts/bpf_doc.py          | 58 ++++++++++++++++++++++---------------
 tools/lib/bpf/Makefile      |  7 ++++-
 tools/lib/bpf/bpf_helpers.h |  4 +++
 3 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/scripts/bpf_doc.py b/scripts/bpf_doc.py
index dfb260de17a8..c4e8fa3619d8 100755
--- a/scripts/bpf_doc.py
+++ b/scripts/bpf_doc.py
@@ -570,9 +570,10 @@ class PrinterHelpers(Printer):
     be included from BPF program.
     @parser: A HeaderParser with Helper objects to print to standard output
     """
-    def __init__(self, parser):
+    def __init__(self, parser, attr_header):
         self.elements = parser.helpers
         self.elem_number_check(parser.desc_unique_helpers, parser.define_unique_helpers, 'helper', '__BPF_FUNC_MAPPER')
+        self.attr_header = attr_header
 
     type_fwds = [
             'struct bpf_fib_lookup',
@@ -719,6 +720,24 @@ class PrinterHelpers(Printer):
 
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
 
@@ -742,26 +761,16 @@ class PrinterHelpers(Printer):
                 print(' *{}{}'.format(' \t' if line else '', line))
 
         print(' */')
-        print('static %s %s(*%s)(' % (self.map_type(proto['ret_type']),
-                                      proto['ret_star'], proto['name']), end='')
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
-        print(') = (void *) %d;' % len(self.seen_helpers))
+        if self.attr_header:
+            print('%s %s%s(' % (self.map_type(proto['ret_type']),
+                                          proto['ret_star'], proto['name']), end='')
+            self.print_args(proto)
+            print(') __attribute__((kernel_helper(%d)));' % len(self.seen_helpers))
+        else:
+            print('static %s %s(*%s)(' % (self.map_type(proto['ret_type']),
+                                          proto['ret_star'], proto['name']), end='')
+            self.print_args(proto)
+            print(') = (void *) %d;' % len(self.seen_helpers))
         print('')
 
 ###############################################################################
@@ -785,6 +794,8 @@ rst2man utility.
 """)
 argParser.add_argument('--header', action='store_true',
                        help='generate C header file')
+argParser.add_argument('--attr-header', action='store_true',
+                       help='generate GCC attr style C header file')
 if (os.path.isfile(bpfh)):
     argParser.add_argument('--filename', help='path to include/uapi/linux/bpf.h',
                            default=bpfh)
@@ -799,10 +810,11 @@ headerParser = HeaderParser(args.filename)
 headerParser.run()
 
 # Print formatted output to standard output.
-if args.header:
+if args.header or args.attr_header:
     if args.target != 'helpers':
         raise NotImplementedError('Only helpers header generation is supported')
-    printer = PrinterHelpers(headerParser)
+    attr_header = True if args.attr_header else False
+    printer = PrinterHelpers(headerParser, attr_header)
 else:
     printer = printers[args.target](headerParser)
 printer.print_all()
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 4c904ef0b47e..cf9efe764030 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -116,7 +116,8 @@ STATIC_OBJDIR	:= $(OUTPUT)staticobjs/
 BPF_IN_SHARED	:= $(SHARED_OBJDIR)libbpf-in.o
 BPF_IN_STATIC	:= $(STATIC_OBJDIR)libbpf-in.o
 BPF_HELPER_DEFS	:= $(OUTPUT)bpf_helper_defs.h
-BPF_GENERATED	:= $(BPF_HELPER_DEFS)
+BPF_HELPER_DEFS_ATTR	:= $(OUTPUT)bpf_helper_defs_attr.h
+BPF_GENERATED	:= $(BPF_HELPER_DEFS) $(BPF_HELPER_DEFS_ATTR)
 
 LIB_TARGET	:= $(addprefix $(OUTPUT),$(LIB_TARGET))
 LIB_FILE	:= $(addprefix $(OUTPUT),$(LIB_FILE))
@@ -160,6 +161,10 @@ $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
 	$(QUIET_GEN)$(srctree)/scripts/bpf_doc.py --header \
 		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
 
+$(BPF_HELPER_DEFS_ATTR): $(srctree)/tools/include/uapi/linux/bpf.h
+	$(QUIET_GEN)$(srctree)/scripts/bpf_doc.py --attr-header \
+		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS_ATTR)
+
 $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
 
 $(OUTPUT)libbpf.so.$(LIBBPF_VERSION): $(BPF_IN_SHARED) $(VERSION_SCRIPT)
diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 7349b16b8e2f..b7573e7d3feb 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -8,7 +8,11 @@
  * in advance since bpf_helper_defs.h uses such types
  * as __u64.
  */
+#if __has_attribute(kernel_helper)
+#include "bpf_helper_defs_attr.h"
+#else
 #include "bpf_helper_defs.h"
+#endif
 
 #define __uint(name, val) int (*name)[val]
 #define __type(name, val) typeof(val) *name
-- 
2.34.1

