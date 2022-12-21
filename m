Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B737E
	for <llvm@lists.linux.dev>; Wed, 21 Dec 2022 05:59:26 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id d14so7430361ilq.11
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 21:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NTAcqyZi4W+uNvx0HYCH7K/UWAkMHmtbGpytiWnrUo=;
        b=mcfDIPPmOH7rWQnM/v7aWKAHCv1U9AFPS5zUZ8YXKmag/b8GKqwNKNC/yy5NJhjL+z
         uzR4TewO2g8iUvMc3pfULNoMkr8qk6OYIBnK3AseWiqf2ob2vUm0bsGrnCHMfAhgHxOq
         qm6B48yUax7tBSEYK43LwIxlEc0LmcykT9MswAZC3H7Y0z0lOqWzDQLi5Fti4JZ8Vrp6
         IsNiN23KZ+8Cy5XuaI3vGzi+7NpvfnhSS/Xz/478DwfEBBUiTgDu5qzfiDDzinnTin6Z
         yiKfOMdGjMMORM+999yLlTPapp2KHTgg27WxAjBWhkcSTLoNtgATpVrONS3r+drdib1a
         gIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NTAcqyZi4W+uNvx0HYCH7K/UWAkMHmtbGpytiWnrUo=;
        b=ziNeAGr5nPirzdqvYNIH0XkZUibmsTN6oCbyCpH79Hz+YtiaXDstSTow8T9M0FjhhE
         w0CimhtKI1MV9WKFywyu9s8+szfflnr9mJMrnKI6xSx2vJ+/NHyHnjy3XLBiIXoogea4
         ENGnO9wuVSYUeQMqs/KRcsrLeGq1oy+0epJd0stnX35PJ6gTsruE+vrW4MWppNwzUMhB
         EcfqBYakP9uTv5vc5x5YpAUDQaIQF0DUbqhLEYseciEtZHOK/+dRifwvpVpKHDHdiuBa
         e2hSLnqljODTbFWMJN4TNIi8hzYgq/YPlxjdVSquwY+5011J8IAboBXzeWXpftayQexz
         5kvw==
X-Gm-Message-State: AFqh2kqKhldWSen4KlOqNkUP4Gljx6woEapZk2UtSoka1ZngRTytnMUx
	Pr/ELWsXrB5Xt09vTK5hPSo=
X-Google-Smtp-Source: AMrXdXtBCBTWGUjxKkQYB6+2tmxDLbf/zN22r8j0Rz9PtPcXywOIqLZzy2hPRCdemJ3ZZJZncyzOAw==
X-Received: by 2002:a92:ce07:0:b0:300:1cc8:7ec7 with SMTP id b7-20020a92ce07000000b003001cc87ec7mr577234ilo.12.1671602365053;
        Tue, 20 Dec 2022 21:59:25 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net. [71.33.132.231])
        by smtp.gmail.com with ESMTPSA id b3-20020a029583000000b003748d3552e1sm5282647jai.154.2022.12.20.21.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 21:59:24 -0800 (PST)
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
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next] selftests/bpf: move struct definitions out of function params
Date: Tue, 20 Dec 2022 22:58:48 -0700
Message-Id: <20221221055856.2786043-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Anonymous structs can't be declared inside function parameter
definitions in current c standards, however clang doesn't detect this
condition currently while GCC does.

Details: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108189

Fixes errors like:
progs/btf_dump_test_case_bitfields.c:85:7: error: anonymous struct declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   85 | int f(struct {
      |       ^~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bpf/progs/btf_dump_test_case_bitfields.c  |  9 ++++--
 .../progs/btf_dump_test_case_namespacing.c    | 10 ++++---
 .../bpf/progs/btf_dump_test_case_packing.c    | 10 ++++---
 .../bpf/progs/btf_dump_test_case_padding.c    | 10 ++++---
 .../bpf/progs/btf_dump_test_case_syntax.c     | 30 +++++++++++++------
 5 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
index e01690618e1e..c75f6bd06a49 100644
--- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
+++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
@@ -82,11 +82,16 @@ struct bitfield_flushed {
 	long b: 16;
 };
 
-int f(struct {
+/* ----- START-EXPECTED-OUTPUT ----- */
+struct root_struct {
 	struct bitfields_only_mixed_types _1;
 	struct bitfield_mixed_with_others _2;
 	struct bitfield_flushed _3;
-} *_)
+};
+
+/* ------ END-EXPECTED-OUTPUT ------ */
+
+int f(struct root_struct *_)
 {
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
index 92a4ad428710..d7cf2a8487c9 100644
--- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
+++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
@@ -49,9 +49,7 @@ typedef int Y;
 
 typedef int Z;
 
-/*------ END-EXPECTED-OUTPUT ------ */
-
-int f(struct {
+struct root_struct {
 	struct S _1;
 	S _2;
 	union U _3;
@@ -67,7 +65,11 @@ int f(struct {
 	X xx;
 	Y yy;
 	Z zz;
-} *_)
+};
+
+/*------ END-EXPECTED-OUTPUT ------ */
+
+int f(struct root_struct *_)
 {
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
index 7998f27df7dd..e039ceb50c43 100644
--- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
+++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
@@ -132,9 +132,7 @@ struct outer_packed_struct {
 	struct nested_packed_struct b;
 } __attribute__((packed));
 
-/* ------ END-EXPECTED-OUTPUT ------ */
-
-int f(struct {
+struct root_struct {
 	struct packed_trailing_space _1;
 	struct non_packed_trailing_space _2;
 	struct packed_fields _3;
@@ -147,7 +145,11 @@ int f(struct {
 	struct usb_host_endpoint _10;
 	struct outer_nonpacked_struct _11;
 	struct outer_packed_struct _12;
-} *_)
+};
+
+/* ------ END-EXPECTED-OUTPUT ------ */
+
+int f(struct root_struct *_)
 {
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
index 79276fbe454a..2ca46ad8d66a 100644
--- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
+++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
@@ -220,9 +220,7 @@ struct outer_mixed_but_unpacked {
 	struct nested_packed b2;
 };
 
-/* ------ END-EXPECTED-OUTPUT ------ */
-
-int f(struct {
+struct root_struct {
 	struct padded_implicitly _1;
 	struct padded_explicitly _2;
 	struct padded_a_lot _3;
@@ -243,7 +241,11 @@ int f(struct {
 	struct ib_wc _201;
 	struct acpi_object_method _202;
 	struct outer_mixed_but_unpacked _203;
-} *_)
+} __attribute__((packed));
+
+/* ------ END-EXPECTED-OUTPUT ------ */
+
+int f(struct root_struct *_)
 {
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
index 26fffb02ed10..3e31df7cecc6 100644
--- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
+++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
@@ -104,24 +104,24 @@ typedef void (*printf_fn_t)(const char *, ...);
  *   typedef const fn_output_inner_t fn_ptr_arr2_t[5];
  */
 /* ----- START-EXPECTED-OUTPUT ----- */
-typedef char * const * (*fn_ptr2_t)(struct {
-	int a;
-}, int (*)(int));
+struct struct_a;
+
+typedef char * const * (*fn_ptr2_t)(struct struct_a, int (*)(int));
+
+struct struct_c;
+
+struct struct_h;
 
 typedef struct {
 	int a;
-	void (*b)(int, struct {
-		int c;
-	}, union {
+	void (*b)(int, struct struct_c, union {
 		char d;
 		int e[5];
 	});
 } (*fn_complex_t)(union {
 	void *f;
 	char g[16];
-}, struct {
-	int h;
-});
+}, struct struct_h);
 
 typedef void (* (*signal_t)(int, void (*)(int)))(int);
 
@@ -272,6 +272,18 @@ struct root_struct {
 	struct float_struct _15;
 };
 
+struct struct_a {
+	int a;
+};
+
+struct struct_h {
+	int h;
+};
+
+struct struct_c {
+	int c;
+};
+
 /* ------ END-EXPECTED-OUTPUT ------ */
 
 int f(struct root_struct *s)
-- 
2.34.1

