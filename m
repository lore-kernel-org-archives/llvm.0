Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23E2C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 02:22:32 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id s1so7268756pga.5
        for <llvm@lists.linux.dev>; Fri, 07 Jan 2022 18:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=kGrdecSC3sPdHtWn9polPOvxxPNBR4DlkW3QJLsVlic=;
        b=KPgC6CipYjBN1/pAogCBoywf5xWdGJ/B9J1tE0Hjb5fDeS78+bRTKYKFp+dRTA50iR
         jO8NboZ1pDij5ZzWF1Bd/xLD8gjq3VCnc3rgCrlYet288M2HgQnc+N3crLRiaMjABrJ9
         GkBSXOqYM8tqEIG0zIOr5Mc6CBrdse+Mp8jQ10jmIqqKBrO/CDmWYjPAIfIRciBdMAMs
         j44VKzPle4WaUYSt/LQcPDR5GZF6ZVyzVFs5U/gvy1macxEh/jf0mRblD/Nr0dSMtBa2
         GkIKnNiSwbsZ/5wmDRnVM/hew30R1R9C/M7XRdzFVpFqBIS15pX4Uatv61K+MF2WHRqz
         h+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kGrdecSC3sPdHtWn9polPOvxxPNBR4DlkW3QJLsVlic=;
        b=Z8b75D8e/AJxrq2omNpEPhG359GufQPGCx37BtY18DpVryqvxdVL/ct00N9FDRPNs5
         fVQKkYLkyyWI2LAolKEEFGMZlcUBm9BdgP0j5k0hzERILMBt0xr25fH3YWGX2lqS81dU
         ZnKm+P8ylt3jFvOusw/2R3pze+NBensvsmPHjbjhMMxosX24QBANZL7waMTI4KyNGib6
         +jyfahJbMMGmaTteVPzMafAK9OZMhrBvA0UM3zKEPisiI0XD4gTZQOJoVHTIN9Y5WikG
         PUBymWOKRR7plDLJH/RTXDaIIq8lkwH9dJyAq38HLu7sDnwMzXag/cij8AicNbs3GVO6
         PY4A==
X-Gm-Message-State: AOAM533+h8H+e4+jqbRryKgmdUhBhjzSxJGacc9bSfmX4ZBQ7F8TX7eM
	E6aEmC8SK3TvVmOivImEYiKVuQ==
X-Google-Smtp-Source: ABdhPJxCSy6VDT37VYN49wFdKlTjPScq9HkyQDn/tBoXW63qDWHpTqEY0bRELQJ9YMLrm9tBHwPbEw==
X-Received: by 2002:a63:af1c:: with SMTP id w28mr54159096pge.372.1641608552345;
        Fri, 07 Jan 2022 18:22:32 -0800 (PST)
Received: from localhost.localdomain (c-98-35-249-89.hsd1.ca.comcast.net. [98.35.249.89])
        by smtp.gmail.com with ESMTPSA id w2sm169050pgt.93.2022.01.07.18.22.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 18:22:31 -0800 (PST)
From: "Yichun Zhang (agentzh)" <yichun@openresty.com>
To: yichun@openresty.com
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] bpf: btf: Fix a var size check in validator
Date: Fri,  7 Jan 2022 18:22:12 -0800
Message-Id: <20220108022212.962-1-yichun@openresty.com>
X-Mailer: git-send-email 2.17.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The btf validator should croak when the variable size is larger than
its type size, not less. The LLVM optimizer may use smaller sizes for
the C type.

We ran into this issue with real-world BPF programs emitted by the
latest version of Clang/LLVM.

Fixes: 1dc92851849cc ("bpf: kernel side support for BTF Var and DataSec")
Signed-off-by: Yichun Zhang (agentzh) <yichun@openresty.com>
---
 kernel/bpf/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 9bdb03767db5..2a6967b13ce1 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -3696,7 +3696,7 @@ static int btf_datasec_resolve(struct btf_verifier_env *env,
 			return -EINVAL;
 		}
 
-		if (vsi->size < type_size) {
+		if (vsi->size > type_size) {
 			btf_verifier_log_vsi(env, v->t, vsi, "Invalid size");
 			return -EINVAL;
 		}
-- 
2.17.2

