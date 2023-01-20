Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77C33C8
	for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 17:41:17 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a37so6322234ljq.0
        for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYq5tcuon8t75nn0BoioPzi3615uH3zFBisghBVqchM=;
        b=Y+Mif95YqnT02S9xc1EkcnetpAHTX0a3OaDI0PyzkIIB5EnOxgATzcjYyggr1+GBSN
         jiURrN9ozfTknWjW3SrAFxtuF+gataJeOO3jZULO6d3uw0CRgPHzdeZpnbIyuEF6WBSk
         dmPSBVaYqHy+OMywn07xtv9fYFw5EtrDoFx8N5iwJkyvbecfAy/zx7s8pGstXwCSNBv1
         s7JI9TWhGCoy2Nh242Fb2hft+pTtqkSACGG3b53P+XiS1Vv/dGGlm9z/rrwriK40HBOi
         PV7BSSk/1ZTpwBL1uC4kIUb+9nJLfFjQY8Giau2bUQrc7ChUUyUebAgxNjnIGl69HsiP
         eoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYq5tcuon8t75nn0BoioPzi3615uH3zFBisghBVqchM=;
        b=psPrE2itK9ObGTAflqIz1eFBAWX4MJu1hVTh67wnHkDXiUTK0spBqyke/7kwvWKl05
         tQ/cHRgcMddmklCBRFMURLXruF3iisKv/XlMYjHZ9XaW5+hNjcajxUY4+9g88ItxKPDi
         lkeLd0IIPFWP1sZamRPM4cMupiMW3jId0D89qt2ev9nDk7pghD739MjmTFPobLeDC88D
         QEbCHOGLqTiLumtc/D4DcRy+4f8QsV5ONUrqUuNuLcRNQgF4nzsFfYuMjgPFF0GocryA
         aUGntmNEeyWDqcRcdE7mO1EFxvTYdYTrA+KGD9kxMPoudjvSbzkKwRRIQHaJXysW+6gn
         U48g==
X-Gm-Message-State: AFqh2kpEycXgMOEMu3X/2W0hltliLgKf+H4JD1dV/jTJHdFt7OTUd6QS
	2dHkpJOTqlwGZxlp1Nj4uQG1pTFdfwMV/G0itPA=
X-Google-Smtp-Source: AMrXdXsBzRYEsY7MuEchNmWixdnNSVm0OVxFONUInsggBWlcNnhnRDViKbyMWNeklFbvxTuHBSK5Ar52bj2td+8bdeQ=
X-Received: by 2002:a2e:9e0d:0:b0:28b:88da:35b with SMTP id
 e13-20020a2e9e0d000000b0028b88da035bmr1392641ljk.364.1674236475611; Fri, 20
 Jan 2023 09:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 20 Jan 2023 18:40:38 +0100
Message-ID: <CA+icZUVbv2T7SExVULn6Bh1mB=VpmYGbH-4U63PKrHPyi6uULQ@mail.gmail.com>
Subject: pahole: New version 1.25 release?
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000663d2e05f2b58eb5"

--000000000000663d2e05f2b58eb5
Content-Type: text/plain; charset="UTF-8"

Hi Arnaldo,

I use CONFIG_DEBUG_INFO_BTF=y with LLVM-15.

Darkly, I remember I needed some post-v1.24 fixes.

Currently, I use:

$ git describe
v1.24-26-gb72f5188856d

commit b72f5188856d
"dwarves: Zero-initialize struct cu in cu__new() to prevent incorrect BTF types"

Any plans to release a pahole version 1.25?

Thanks.

Best regards,
-Sedat-

P.S.: I still carry this diff around (attached as diff as Gmail might
truncate the following lines):

$ cd /path/to/pahole.git

$ git diff dwarf_loader.c
diff --git a/dwarf_loader.c b/dwarf_loader.c
index 5a74035c5708..96ce5db4f5bc 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -2808,8 +2808,8 @@ static int __cus__load_debug_types(struct
conf_load *conf, Dwfl_Module *mod, Dwa
       return 0;
}

-/* Match the define in linux:include/linux/elfnote.h */
-#define LINUX_ELFNOTE_BUILD_LTO                0x101
+/* Match the define in linux:include/linux/elfnote-lto.h */
+#define LINUX_ELFNOTE_LTO_INFO         0x101

static bool cus__merging_cu(Dwarf *dw, Elf *elf)
{
@@ -2827,7 +2827,7 @@ static bool cus__merging_cu(Dwarf *dw, Elf *elf)
                       size_t name_off, desc_off, offset = 0;
                       GElf_Nhdr hdr;
                       while ((offset = gelf_getnote(data, offset,
&hdr, &name_off, &desc_off)) != 0) {
-                               if (hdr.n_type != LINUX_ELFNOTE_BUILD_LTO)
+                               if (hdr.n_type != LINUX_ELFNOTE_LTO_INFO)
                                       continue;

                               /* owner is Linux */

$ cd /path/to/linux.git

$ git describe
v6.2-rc4-77-gd368967cb103

$ git grep LINUX_ELFNOTE_LTO_INFO include/linux/elfnote-lto.h
include/linux/elfnote-lto.h:#define LINUX_ELFNOTE_LTO_INFO      0x101
include/linux/elfnote-lto.h:#define BUILD_LTO_INFO
ELFNOTE32("Linux", LINUX_ELFNOTE_LTO_INFO, 1)
include/linux/elfnote-lto.h:#define BUILD_LTO_INFO
ELFNOTE32("Linux", LINUX_ELFNOTE_LTO_INFO, 0)
dileks@iniza:~/src/linux/git$ git describe
v6.2-rc4-195-gf609936e078d

-EOT-

--000000000000663d2e05f2b58eb5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="dwarf_loader-LINUX_ELFNOTE_LTO_INFO.diff"
Content-Disposition: attachment; 
	filename="dwarf_loader-LINUX_ELFNOTE_LTO_INFO.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ld4t4bx20>
X-Attachment-Id: f_ld4t4bx20

ZGlmZiAtLWdpdCBhL2R3YXJmX2xvYWRlci5jIGIvZHdhcmZfbG9hZGVyLmMKaW5kZXggNWE3NDAz
NWM1NzA4Li45NmNlNWRiNGY1YmMgMTAwNjQ0Ci0tLSBhL2R3YXJmX2xvYWRlci5jCisrKyBiL2R3
YXJmX2xvYWRlci5jCkBAIC0yODA4LDggKzI4MDgsOCBAQCBzdGF0aWMgaW50IF9fY3VzX19sb2Fk
X2RlYnVnX3R5cGVzKHN0cnVjdCBjb25mX2xvYWQgKmNvbmYsIER3ZmxfTW9kdWxlICptb2QsIER3
YQogCXJldHVybiAwOwogfQogCi0vKiBNYXRjaCB0aGUgZGVmaW5lIGluIGxpbnV4OmluY2x1ZGUv
bGludXgvZWxmbm90ZS5oICovCi0jZGVmaW5lIExJTlVYX0VMRk5PVEVfQlVJTERfTFRPCQkweDEw
MQorLyogTWF0Y2ggdGhlIGRlZmluZSBpbiBsaW51eDppbmNsdWRlL2xpbnV4L2VsZm5vdGUtbHRv
LmggKi8KKyNkZWZpbmUgTElOVVhfRUxGTk9URV9MVE9fSU5GTwkJMHgxMDEKIAogc3RhdGljIGJv
b2wgY3VzX19tZXJnaW5nX2N1KER3YXJmICpkdywgRWxmICplbGYpCiB7CkBAIC0yODI3LDcgKzI4
MjcsNyBAQCBzdGF0aWMgYm9vbCBjdXNfX21lcmdpbmdfY3UoRHdhcmYgKmR3LCBFbGYgKmVsZikK
IAkJCXNpemVfdCBuYW1lX29mZiwgZGVzY19vZmYsIG9mZnNldCA9IDA7CiAJCQlHRWxmX05oZHIg
aGRyOwogCQkJd2hpbGUgKChvZmZzZXQgPSBnZWxmX2dldG5vdGUoZGF0YSwgb2Zmc2V0LCAmaGRy
LCAmbmFtZV9vZmYsICZkZXNjX29mZikpICE9IDApIHsKLQkJCQlpZiAoaGRyLm5fdHlwZSAhPSBM
SU5VWF9FTEZOT1RFX0JVSUxEX0xUTykKKwkJCQlpZiAoaGRyLm5fdHlwZSAhPSBMSU5VWF9FTEZO
T1RFX0xUT19JTkZPKQogCQkJCQljb250aW51ZTsKIAogCQkJCS8qIG93bmVyIGlzIExpbnV4ICov
Cg==
--000000000000663d2e05f2b58eb5--
