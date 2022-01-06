Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561D2C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 02:37:39 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 200so1338964pgg.3
        for <llvm@lists.linux.dev>; Wed, 05 Jan 2022 18:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egvZCbNF81D4jXVxm61f4vyRV9IHo60P+3/hLtcUbE4=;
        b=jOc/KL0zSz2kdl12cGK0gMcDlrrOQ3pW4BEWkFXJJ8h5dbq9xq7S/yRaJAns2ZvNtS
         V6UKU48JGzRv783SUVXZVXVWqA8biMoY3GZ6UiQbooSJLdvfnRFHctKHdi3J2vGSh5FA
         yKAcQkB68czEXjG9XcY1IjuaBaDMXXRgwPsyv4vAUAVlv4vhnFzonMM9Tt4uW4C2PBXe
         tnq2jogG/v3QawLXtCPcpVWYtFXjDOUfIJq+q50zPQknQbOjDuuWwLaqSxMEcS+sHokU
         b5+WUwMsz7rtmZpJ5z8VndBoSOn+y7v7aoz72p+nGPIcvrvJGgoheNJaBYPJIgLP8Xae
         GK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egvZCbNF81D4jXVxm61f4vyRV9IHo60P+3/hLtcUbE4=;
        b=nx+Dc1CGiFqoQpz9gDK+tu6pV5941enA1m11shb0jN9a+ZCw1LjZx+gEj6z/hk2cnJ
         6UsV/r2uz3qa8DwFUj4Ql2mmBtDzGDVDKdydgMYfajkDoJ7jfHyakhIrNMlX/+euHHzx
         L+1L8AEgqgqgbOmdQq0hERGjgsfU2LXvjIfg3E40tBq5xyKvygrntP7pvplRDEic2vff
         Fa3xZDIhNRV4fQb/SjpbBQy8mCRf7c42fp/k7UOeg0pOvGdwmsJFgUJaoUbr6ejYQG33
         hKQiYpGbSE29EUJImsmx1fN/2n5JoJVTIKtVof1gAFC7RXM0UKbuosVlF6j6q9ibxKGy
         1puw==
X-Gm-Message-State: AOAM530qa/TkQ9H8s7oy64XEwuiUjaZl6mqkdN6jXjKxuu5VUsbylngp
	LdnIwTubRvgVIOCp5QFDfbc=
X-Google-Smtp-Source: ABdhPJybA7gaMPPtTcoI6DXlaCSAnzfyMyQyG31rcVoEbqT+9kFMO0T9OlJNspNUZiQin0ZZ17Ux2w==
X-Received: by 2002:a63:4f22:: with SMTP id d34mr50255121pgb.12.1641436658856;
        Wed, 05 Jan 2022 18:37:38 -0800 (PST)
Received: from szeter.. ([2001:8004:44e0:acae:b2b7:5ce1:129d:48de])
        by smtp.gmail.com with ESMTPSA id ot7sm4575514pjb.12.2022.01.05.18.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 18:37:38 -0800 (PST)
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
Subject: [PATCH 2/2] arch/x86/tools/objdump_reformat.awk: Allow for spaces
Date: Thu,  6 Jan 2022 13:36:05 +1100
Message-Id: <20220106023606.283953-3-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220106023606.283953-1-samuelzeter@gmail.com>
References: <20220106023606.283953-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

objdump and llvm-objdump have differing output formats. Specifically,
objump will format its output as: address:<tab>hex, whereas
llvm-objdump displays its output as address:<space>hex.

objdump_reformat.awk incorrectly handles this discrepancy due to
the unexpected space and as a result insn_decoder_test fails, as
 its input is garbled.

This patch ensures that the instruction line being tokenized can
support either a space and colon, or tab delimiter.

Signed-off-by: Samuel Zeter <samuelzeter@gmail.com>
---
 arch/x86/tools/objdump_reformat.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/objdump_reformat.awk b/arch/x86/tools/objdump_reformat.awk
index 276e572a6f60..a4120d907277 100644
--- a/arch/x86/tools/objdump_reformat.awk
+++ b/arch/x86/tools/objdump_reformat.awk
@@ -22,7 +22,7 @@ BEGIN {
 }
 
 /^ *[0-9a-f]+:/ {
-	if (split($0, field, "\t") < 3) {
+	if (split($0, field, /: |\t/) < 3) {
 		# This is a continuation of the same insn.
 		prev_hex = prev_hex field[2]
 	} else {
-- 
2.32.0

