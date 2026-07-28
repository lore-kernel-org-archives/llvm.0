Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331033ACA6E
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242590; cv=none; b=El0I2vcXkTpHmj20hV3S2QLvRs9v+FIq6ycJl1y4bxHuXtkmD9uAQx7aQW4WRkdpjcV8Hw5Qp73y4hTiw7FoHAQnSiCkNAwqrfmMx1Gs9K3FM7e/ah8FqGDTzQmulD2sptiVKSYv6waz8pg68UfLlcXU6CxYeW4tdltdHNnbFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242590; c=relaxed/simple;
	bh=RRAPtpAYKD4cfGwxNOC6QT4BUAvhWpgnDPyObJltgWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1parsY4Neb+UHZW8YTuKNcbG9BWhdsxjGEXlaDJm0sPzQDSaULpVn63pcYmR1YmBIjXaZEZ/HqRPD60NGA/bCF+rXkfT7ddOpgN37w8bNoVkv+xxK3kGk8iOOUliH56rUuTbONA8lyAfyzGolT3D51pRm/5tzOKPruSNpv5PX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DxkToCtV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DxkToCtV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fe400c14aso3970797a12.2
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242587; x=1785847387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/FdTYHBFIWgj2aIzUMsnbW+FrCu/VZ/kY6SILWA9Uc=;
        b=DxkToCtV+f0nFApOp9CSoC/qNZee/Q/NC2X8q4jIKrG/lhz2DS86tjHSpZKYCmYrfl
         4PT9abp/PU0RhruL+JT+QtrZZKKQRA9VmtczYgteyx6t2y+H1SGU4tzdITwvw7Dk5l2A
         OCLp2QjB66iiFNLLzGAchMcijmdxEspsSJeBucE+WPXgC7X73+2Ub56I5C/0gTuIGK4i
         nP/UTqz0rLzH1Z0VfMPxdg9NC+xSK1zbIqHl2KbrXuRybkKwQKmE7RAM8uBnFqJZuQ9O
         Q2A+OUI6voLYmVCveLHxAoEGrL1d2mAa2QHN9i46cYABUvJSaF/W2ZcHOjcZ0cXvMPuJ
         EqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242587; x=1785847387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/FdTYHBFIWgj2aIzUMsnbW+FrCu/VZ/kY6SILWA9Uc=;
        b=c17C86/F8gEogW8sTEVp8/QFd5qD5gb75xFTOf4NyE66h/cEPwnPwWNw2d5XDpefLQ
         hXoFszK3+06TL7jsTThxfKKnMOnLv2R6wZ2EvHwk43tJJ5CVsi/v3qrb0nX+U3Ku4Di4
         2f8zPBxud1b6fOfIV4OKt6XOoc74KO0wXU6igBb2Ki+YkYxxCaEIMC+E4Xu6sdr3sE/0
         BdtY6v5Tju0qCyu1r1m1UaPQtPpfCe2vn4oX3rrKZYLjocdKJyHx6eH+Z5lyzVE6bJUz
         LGK6TfzuSjikz/prCKjD+AQluOC9jb8BsEB5vrwL5YKg1IcIOK05Kd9rWfpcMxynOeSW
         6xBA==
X-Forwarded-Encrypted: i=1; AHgh+RpBBFsKt6Gq5ZezrxbrWW7iOhVb9TO1Fa1cMBr1I+zFVq0pfpH3d93RlOXEtV/Ef2GSyIm9@lists.linux.dev
X-Gm-Message-State: AOJu0YyEzmY5kuttfcj/+O5Xiah503WIysL98XYfsEZVz18KVdViCUgM
	+tbeSQGR2e4c5oWt8y+aTJuMZgAkWPXM1R8isV1Ihowg9OgPaJ+UoMlBEJYSeaxDihU=
X-Gm-Gg: AR+sD10o9lAUyDW6J58nWRqwqzAo2uq6jNt4PxErIl3ddlEiJIzSua2myms1dwnAm+P
	QjdtqzdTIrFUkzA11ktDZoJTwfDHVPttBTfN5uYO0RZ1wsmoFy0d1NqdVCyfqJfXcCjb/YLj99f
	78HOUktyOuhmJ1OFU3Y6Khhnzf0F3+niKkYGeM3Y2GX3C/MelMQNpejmfooE/POrAEf4pvQ04UB
	cgcI4vu5/cDxf1hW8FUznIleeldBVXqyw6nbRl/WQr3DdJrAC4Tl+HTnyUlCvN1nGPJkAyPK4mc
	4XzK1rh+qJ1KueJOxvK2b83agshJVHJYQobCAesS/A2irQkLQc4IxbNLvPrjdZWn9exjZICEUDU
	7TNKVwTLFHTBEk5B2Nt5Qlf8cedcYG6z4OhabvDIWuTvoW6Df68hYyHbUaNuPX1fb9ooRpaQknc
	TRZPtYNMb3G9EKdMQ5xV21w6QV8UMQR9gTLmFP7LVaKIgLr21xl1QOcun16y8+EO0vMg==
X-Received: by 2002:a17:907:3f82:b0:c1c:208c:c04c with SMTP id a640c23a62f3a-c1f71e468ebmr108420166b.27.1785242587150;
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 28 Jul 2026 13:42:39 +0100
Subject: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
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

Add symbol size for kallsyms symbols that can change size so that sizes
can be determined easily without having to manually calculate them
when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
.tmp_vmlinux?). Without, the assembler records the symbol size as 0.

This is primarily useful as a debugging aid in case of linker errors as
part of link-vmlinux.sh, and because symbol size doesn't have to align
with the offset to the next symbol due to padding/alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
I've opted to only add this for symbols that can change between runs
where relevant, in particular kallsyms_num_syms and
kallsyms_token_index have a static size. While kallsyms_seqs_of_names
depends on table_cnt, kallsyms_offsets does so as well, i.e. is covered
already.

If you think for consistency just to do this for all symbols, please
let me know.
---
 scripts/kallsyms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 37d5c095ad22..494852ade6d8 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -398,11 +398,13 @@ static void write_src(void)
 		strcpy((char *)table[i]->sym, buf);
 		printf("\t/* %s */\n", table[i]->sym);
 	}
+	printf(".size kallsyms_names, . - kallsyms_names\n");
 	printf("\n");
 
 	output_label("kallsyms_markers");
 	for (i = 0; i < markers_cnt; i++)
 		printf("\t.long\t%u\n", markers[i]);
+	printf(".size kallsyms_markers, . - kallsyms_markers\n");
 	printf("\n");
 
 	free(markers);
@@ -415,6 +417,7 @@ static void write_src(void)
 		printf("\t.asciz\t\"%s\"\n", buf);
 		off += strlen(buf) + 1;
 	}
+	printf(".size kallsyms_token_table, . - kallsyms_token_table\n");
 	printf("\n");
 
 	output_label("kallsyms_token_index");
@@ -441,6 +444,7 @@ static void write_src(void)
 			       (unsigned int)table[i]->addr, table[i]->sym);
 		}
 	}
+	printf(".size kallsyms_offsets, . - kallsyms_offsets\n");
 	printf("\n");
 
 	sort_symbols_by_name();

-- 
2.55.0.229.g6434b31f56-goog

