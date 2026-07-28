Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBC3B5310
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242591; cv=none; b=tNuHFvrwulVQwNQLrXOnYn0bhKXZWcBmV3rzUAsF0vFGBuihA2286eubihpdNbes+vSw6HfjNnzitR8EToEt6lz86F53E/AUW4dZjYaw6NRR3BhW7IX4XS1te1Zww4YoR5eMHzBfSWaenTiKcWIAYEjzTYx4gLxch1go4X5lLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242591; c=relaxed/simple;
	bh=sISaQzaH+VTpRnyWAc2SlIPqhjf3NMP0c2WTav+LdKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0XbtqZInVc/P8Ma66EcVqV5YbLIoT49YGWFXuNEmyFNxYk6DXBTQHhxz8XeKygICZvPt8Go+nxo6OIXie4fpZx8XhV2htxoyn4YuLF/FuI3w5K3o4Vl/6e2SLB6qP77MPa9ZTA6O2Jt3zBYtvKboTrfYEhVpU9MLTAVA0QvwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oc/KubxB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oc/KubxB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c16794450aeso478624766b.2
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242588; x=1785847388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrFF5zeJa6i3dJjxCwt2P+w1tBuT5VdStKupxsyRdtc=;
        b=Oc/KubxBGnHvAIpyD2Rww9Ezend7W828mMTBuwXBSUTeo9678iZv2w7CxqvpJ+aMhG
         kRKPDBiRP167p5hbPrxK15Pix1mBy6pKNPUKJs6kXIjmA7b3AvOpYqLPDuo/p+NCexiL
         tWp5VQY/GvbWE5wJYTQ6rgrhwBYarO1nRpnzpn7786SSGuPTaXSMvejS0hMFseZ+qqcR
         6y81wrCa6z3/qFYKWrew7WrDdBdQOJY13OxY7dQXC+NvR2PhU3bbQSSu+eTmoHmgM1OP
         RmamXv5W+BObsSd6K41RE9Ne2X4p48xLU8yr4+5oqmLN59NaKuRIdtZp4af91HLsMptD
         Iklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242588; x=1785847388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrFF5zeJa6i3dJjxCwt2P+w1tBuT5VdStKupxsyRdtc=;
        b=T8tsQWmMqEH9Zm7bJrM31PlXxjpz+tBmBnuldTefCvUvEzX9/ye34LPhCL+3j9VA/Y
         IaozrQnrBjW6m2csBIe7zFzQhh/Tub22v7R0FVh7ay+TGUHZo8/Yab+NJNwe26AVWsRe
         8CXfzfEJB4mBYbwFKEqr7NO2Hd8/RCeFZa0GbLgPUpwD3RH/idI2jci6IYDagKIkbdDp
         X5HVbvrrEQuBTxSVh6TKuMk5dcI1JQOQRNfPMpcaxbLJUsQbBDiNDlWlju2kPyOXbsDP
         277KiTfgOk9lyqhaC72SvAt952ibxJXYRknFt526kYfHLHsIrOBb7X9ASCh5F5Y2EdvJ
         EqeA==
X-Forwarded-Encrypted: i=1; AHgh+RoKXM52fTfGUHbK9/QfkeRAYiEfzGgPT6/pB0Bn8yr82SaafDW9mzmTo3oWpJk2Y7yW+ILt@lists.linux.dev
X-Gm-Message-State: AOJu0YxM2Jpp8pviOqMwLWHdyaGp7UYj4BCR0RoVVbsSoylCQ7kqx9hB
	jo56LbrNtV9V5hSSUNSkDEmp+zygs5ysTjWSvLFShf3QLZTAVjntNqC8srsRVsuvZNc=
X-Gm-Gg: AR+sD134yktFgpq+vqbfesBYsehiPR6xRyNs668YRFByF1tK4dUEYo+jcOYqQvQAoXf
	uCdk+UTmJaMoy/mzzncNGSoqYvQI1HGvFFpsF6F8y9+8+2y5cYZC53qhAgglcyVucF6NOc8vz/t
	rDZWHxBGmA/CzFkq8gv/9YgrDzbaZP1h+cMX+HMBIQbmpJMtGncK+brDDDCk8VTcopYKk9Wesel
	V/6uh4FDsQFWPj7Uu1mq/MENu90PtaR3oBM2VqBKi3TyZWXKaUkzmpDfR96hj1wgX0ZQE2ZZmX4
	27pmPFuJL5eoRpvVvCNeR+JPWKAHLWJsw9gDPRlR+5UXaeJtdZaXi2qGh/WLBBjinG6/KyhhotX
	DcARt/phSIv3C2G8xHLIbZemm7xOBWOFbjekDCacB8ZfR4sEpS8+QEj/3Fyu5o7PC1VlnRWINOY
	vfcnPQik+J71/sTwQz7r5EedY86opZi7y2XnmPwgdrnS048bx7BpZPjSlnCj4b1Wq+YQ==
X-Received: by 2002:a17:907:8dcd:b0:c1f:6f31:2880 with SMTP id a640c23a62f3a-c1f721507c1mr116075766b.50.1785242587931;
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 28 Jul 2026 13:42:40 +0100
Subject: [PATCH 2/2] kbuild: link-vmlinux.sh: improve detection of third
 pass requirement
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-linux-kallsyms-fix-v1-2-1a665156c898@linaro.org>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
In-Reply-To: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

It can happen that symbol sizes within .tmp_vmlinux1.kallsyms.o and
.tmp_vmlinux2.kallsyms.o differ, without affecting file size on disk
because of section alignment and/or padding emitted by the assembler.

link-vmlinux.sh doesn't detect this case currently and keeps using
.tmp_vmlinux2.kallsyms.o to link the final vmlinux. Due to the
different symbol sizes, other symbols are shifted within the final
image compared to .tmp_vmlinux2, and the final comparison of System.map
against "${kallsyms_sysmap}" fails with the message:

    Inconsistent kallsyms data
    Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

This can happen in particular if the linker emits additional symbols
that might have different names between our (re-)linking steps, e.g.
because those names depend on the virtual address of the symbol. Linker
stubs for ARM errata work-arounds are one such case.

These changed symbol names can cause the output of the token
compression of kallsyms.c to change due to the changed symbol substring
count, which in turn can change the size of the kallsyms_names symbol
itself, causing the potential shift of subsequent symbol addresses in
.tmp_vmlinux2.kallsyms.o and therefore the final image.

Update link-vmlinux.sh to not rely on file size of
.tmp_vmlinux?.kallsyms.o alone but to also consider symbol offsets
within to resolve this, and do a third pass if required.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
The issue was hitting:

In a build with CONFIG_ARM64_ERRATUM_843419=y, the linker adds numerous
instances of __CortexA53843419_<stub target virtual address> stubs
(LLVM in my case). As the second part of the symbol name depends on the
virtual address of the stub target, it changes between .tmp_vmlinux1
and .tmp_vmlinux2.

This change made kallsyms_names bigger by one byte:

-       .byte 0x1c, 0x74, 0xff, 0x43, 0xb9, 0xc3, 0x78, 0x41, 0x35, 0x33, 0x38, 0x34, 0x33, 0x34, 0x31, 0x39, 0x5f, 0x1a, 0x1a, 0x1a, 0x43, 0x30, 0x38, 0x33, 0x41, 0x1a, 0x30, 0x30, 0x34      /* t__CortexA53843419_FFFFFFC083AFF004 */
+       .byte 0x1d, 0x74, 0xff, 0x43, 0xb9, 0xc3, 0x78, 0x41, 0x35, 0x33, 0x38, 0x34, 0x33, 0x34, 0x31, 0x39, 0x5f, 0x1a, 0x1a, 0x1a, 0x43, 0x30, 0x38, 0x34, 0x38, 0x38, 0x46, 0x30, 0x30, 0x34        /* t__CortexA53843419_FFFFFFC08488F004 */

and grew the total size of kallsyms_names from 3879944 to 3879945
bytes. Since this moved it past the four byte alignment, all subsequent
symbols were shifted by 4 bytes, causing the final sanity check to
fail.

$ stat -c'%s' .tmp_vmlinux1.kallsyms.o .tmp_vmlinux2.kallsyms.o
18458168
18458168

$ diff -u <(nm -n .tmp_vmlinux1.kallsyms.o) <(nm -n .tmp_vmlinux2.kallsyms.o)
--- /dev/fd/63	2026-07-28 12:17:55.542466443 +0100
+++ /dev/fd/62	2026-07-28 12:17:55.542466443 +0100
@@ -4,8 +4,8 @@
 0000000000000000 N $d
 0000000000000000 R kallsyms_num_syms
 0000000000000004 R kallsyms_names
-00000000003b340c R kallsyms_markers
-00000000003b50bc R kallsyms_token_table
-00000000003b563c R kallsyms_token_index
-00000000003b583c R kallsyms_offsets
-00000000005806c8 R kallsyms_seqs_of_names
+00000000003b3410 R kallsyms_markers
+00000000003b50c0 R kallsyms_token_table
+00000000003b5640 R kallsyms_token_index
+00000000003b5840 R kallsyms_offsets
+00000000005806cc R kallsyms_seqs_of_names

$ size -A .tmp_vmlinux1.kallsyms.o .tmp_vmlinux2.kallsyms.o
.tmp_vmlinux1.kallsyms.o  :
section              size   addr
.text                   0      0
.rodata           7178673      0
.debug_line            49      0
.debug_line_str        72      0
Total             7178794

.tmp_vmlinux2.kallsyms.o  :
section              size   addr
.text                   0      0
.rodata           7178677      0
.debug_line            49      0
.debug_line_str        72      0
Total             7178798
---
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c8f27e4175f9..ab0b8125c8cb 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -106,6 +106,18 @@ vmlinux_link()
 		${kallsymso} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
 }
 
+# Check if kallsymso_prev and kallsymso differ
+# If symbol sizes within ${kallsymso} change, any symbols within vmlinux are
+# likely to shift, invalidating ${kallsymso}.
+# Since file size can remain unchanged even if symbol sizes change, compare the
+# actual symbols instead of relying on file size only.
+kallsymso_changed()
+{
+	${NM} -n "${kallsymso_prev}" > "${kallsymso_prev}.sym"
+	${NM} -n "${kallsymso}" > "${kallsymso}.sym"
+	! cmp -s "${kallsymso_prev}.sym" "${kallsymso}.sym"
+}
+
 # Create ${2}.o file with all symbols from the ${1} object file
 kallsyms()
 {
@@ -126,6 +138,7 @@ kallsyms()
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
 
+	kallsymso_prev="${kallsymso:-}"
 	kallsymso=${2}.o
 }
 
@@ -255,7 +268,12 @@ if is_enabled CONFIG_KALLSYMS; then
 	sysmap_and_kallsyms .tmp_vmlinux2
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	# Due to alignment, file size of the kallsymso object file might remain
+	# unchanged even if individual symbols within change size. Changed
+	# symbol sizes can still shift other symbols, though. Therefore, don't
+	# rely on file size alone.
+	if [ $size1 -ne $size2 ] || kallsymso_changed || \
+			[ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		vmlinux_link .tmp_vmlinux3
 		sysmap_and_kallsyms .tmp_vmlinux3
 	fi

-- 
2.55.0.229.g6434b31f56-goog

