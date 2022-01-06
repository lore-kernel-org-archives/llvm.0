Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545EF2C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 02:37:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id q14so1509965plx.4
        for <llvm@lists.linux.dev>; Wed, 05 Jan 2022 18:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UkAZUrjfzO4AUWpPfb+4/H/UxI1o2rcJZ/LQS4Gka4=;
        b=U3odGgTYfDp8i9eXDQWhKt2tSA+vlyRD5/v8HS1uSEpeEcYjziNJC+8w47+i7aHbzC
         tXsUDE3+YCPvLYpbar45hAiRkqyhZ2Ikse0HHKoX57tggnNCFUYj58naRAon65yfH8fY
         16m/TZosMBIWkBk6VTOqXE8DZqTIultBDFCJM0phAzB92zUe+B46NdFVih/l/dJ4QVfw
         khyEwkEmMUZKBIkzqmXOem5qfbS/uFlbtnnxrKUdM3mws7FchEKHzsDYcuB5BC+uS1YR
         B4nmQrkeXw5c1JRNWwrhbc61rgxW6aE1dW3D3ePZpXi+AQggwA1Yv4sBgS80C0dJeluu
         je9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UkAZUrjfzO4AUWpPfb+4/H/UxI1o2rcJZ/LQS4Gka4=;
        b=GQldvXgJcrlOyTkv2QMAQx/op+5B/elZQSvAcJdEZU+fFpi2CRXrzu68WpiK/KwVID
         7aR70gbyLJmrfZM3h+k4nlNL0jGJ5yAEV1boxn9Qnsrk3mw1EhVYUZFAwF5NijRoFTP7
         f1JYNty5yMtjPNzEt+7IWuabPQigN3h9L6reH6y03AI2sOcbUrzX0qrXqAJbP1LEoF0l
         TY0DQf1yU6GoxmGi7PnZ4qOcxKrJA4MZAQZaTr6TZoIs64yOSslAV3SeeQUo/5f6gwcn
         TwrHk5q7W3QM4aLH60hXiAYaC5J501egA+MeTKbZL9RGANRS/tpWW5QShAwBJrgt6tvT
         OlkQ==
X-Gm-Message-State: AOAM533LR9XIwfc/03r/6RDF+cjr1npHN9dWdj1tgL7wuAnZvM6DwGi8
	SCylZplGt/As87L7NqtjgUo=
X-Google-Smtp-Source: ABdhPJwNXV+7RyU1tNgvQKaEQk7hh+bAM1Hixv28+JceWHH2ePKxy0GkTgZb5QpiUNYef9nBwSj9rA==
X-Received: by 2002:a17:902:be15:b0:149:a608:7098 with SMTP id r21-20020a170902be1500b00149a6087098mr28357291pls.63.1641436646767;
        Wed, 05 Jan 2022 18:37:26 -0800 (PST)
Received: from szeter.. ([2001:8004:44e0:acae:b2b7:5ce1:129d:48de])
        by smtp.gmail.com with ESMTPSA id ot7sm4575514pjb.12.2022.01.05.18.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 18:37:26 -0800 (PST)
From: Samuel Zeter <samuelzeter@gmail.com>
To: 
Cc: samuelzeter@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] *** Fix reformat_objdump.awk ***
Date: Thu,  6 Jan 2022 13:36:03 +1100
Message-Id: <20220106023606.283953-1-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are two small patches which originally dealt with
the problem found at:

https://github.com/ClangBuiltLinux/linux/issues/1364

The original steps to reproduce were:
$ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 defconfig
$ scripts/config -e X86_DECODER_SELFTEST
$ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 olddefconfig bzImage

Which resulted in the error:
arch/x86/tools/insn_decoder_test: warning: objdump says 0 bytes, but
insn_get_length() says 2

Upon inspection it turned out llvm-objdump was formatting its
output differently, which caused objdump_reformat.awk to incorrectly
output its values.

After fixing that bug, a second one was seen where the instruction
"wait" was incorrectly matched with "fwait", which again caused
insn_decoder_test to fail.

Samuel Zeter (2):
  arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
  arch/x86/tools/objdump_reformat.awk: Allow for spaces

 arch/x86/tools/objdump_reformat.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.32.0

