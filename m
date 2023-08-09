Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F824512
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 21:25:44 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-569e7aec37bso4287067b3.2
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616344; x=1692221144;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9IA4VRf5s9KilAL2p48TkUCprDEkC/a1VvexeDrj98=;
        b=dOATPQ7iS0JO1AkunR0tNZolLIVjYX20xMbVpRiVQxbFjNbwKDpDUwmUHtnq1rRLIs
         rRbW5LuSwKJTXSY3xDE4OLA4ayGjaxlEhEuoRE3YlPGi11TT57pSZtPSHr8godYXp0kw
         BWXwerfHy7E1qgSv0FlTrmk7Kem16dJ5by84hFfYhgNuhblD0JRUa8g5aFywyUAP4jl+
         ZQSLz5U7Wi2slTxcm15/0rbtNUiCuryagC6MkITnPK9FwsVOkSRcOV49s34S6+sTspd3
         FcTALFpb6ZrZHorIUhL0kpB9RRzfRqu09Z0Hl/XZLsxu6y4Bd6aJasAzoITLI2Z6DOl0
         mNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616344; x=1692221144;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9IA4VRf5s9KilAL2p48TkUCprDEkC/a1VvexeDrj98=;
        b=OtuVY3nfCBlI94Yvr2YDWjRPcUeI7Wk0JFcaFDeemqi6KG6G3ebGZQlstn72VllLLG
         2hyfn+9bxkrKm6S8GlYNKnf1S77vH57xAzPJvkM/x4Mr8M3rZRENyoOJ3IUwFz8+PfCQ
         C2vlevp4PP6tC8R1ZIdPoQeuVxHyrb1YEKlsyqhgPZeIaNljFNu1b1/NmF3eXad9wrl/
         YllG7bbiEz9nzvTa6dJhRx/VC8aOYMixE/I7WJefD6OKtR/cNKp+BoNduyCKNnE/EvRZ
         T73wZh8sYWDjVlbCxE4Y1F8eAMh/HLqNB/peq5gUsK/1hlBwmHEukqfKfYAFLBgPbAhy
         J+PQ==
X-Gm-Message-State: AOJu0YzbfTfNgta6CxtYU3vT2qj77SIP0/DFYSKNv74r87v/1OGtc38Z
	ObuEs1+A8DPBeaTzqJYui3Wm0zzlv+KUZAN5Jg==
X-Google-Smtp-Source: AGHT+IHmWhQRw7zjLbA6uwLJAyfMzKym8d1VFdTg3xFVzdhsVwo+jvguNBI/0YxEPsma+8E69eIZjuvHAaG/iklJmw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ae5d:0:b0:555:cd45:bc3a with SMTP
 id g29-20020a81ae5d000000b00555cd45bc3amr7686ywk.9.1691616344006; Wed, 09 Aug
 2023 14:25:44 -0700 (PDT)
Date: Wed, 09 Aug 2023 21:25:34 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE4E1GQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwNL3eSkHF1DSwNj3URzA0NzA0sTUwtTYyWg8oKi1LTMCrBR0bG1tQC XJFjoWgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616342; l=752;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=FtW6hZH73XFuu5e5Bpu5qUCSAUpxVZ9gts49xFeXa4Y=; b=584daAHzX1kV9qkGHNMgA2HBkKPc5hKMsPR4KiLUys8HQpD5yUnwspzdsha0Gy6gZR7BdvZkB
 p8rXNK6PBvFCdqmnguTz/nBrsuZILkc2amvwPxEbIFpSco/Odd6npVK
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Subject: [PATCH 0/2] i2c: fix -Wvoid-pointer-to-enum-cast warnings
From: Justin Stitt <justinstitt@google.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

This patch series fixes two instances of -Wvoid-pointer-to-enum-cast
warnings present when building with W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1903
Link: https://github.com/ClangBuiltLinux/linux/issues/1904
Link: https://github.com/ClangBuiltLinux/linux/issues/1910

---
Justin Stitt (2):
      i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast warning
      i2c: i2c-rcar: fix -Wvoid-pointer-to-enum-cast warning

 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 drivers/i2c/busses/i2c-rcar.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
change-id: 20230809-cbl-1903-a70170945853

Best regards,
--
Justin Stitt <justinstitt@google.com>

