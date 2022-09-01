Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD08A4D
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 06:59:20 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id jm11so16231132plb.13
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=SVF6PLCQYqQfDJ1mbN1yYxWEY7a8snySanblxKa0G2g=;
        b=EQ/HtONlIP3lRAqKj+jLTa8iFP06eGdSTaZLe5lHLgIDfq9K7upKcsMHo7HNyzsSkF
         0ZLJjdRLAFIchTJ6/V08SQ7BFOgs+yr6wqZgVTTZbPc60qYf6bUBktAdTV0xCmLO8+rb
         TYtDclkULIsMF+oVCmKnFv6cIQg8YhK8pUZys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=SVF6PLCQYqQfDJ1mbN1yYxWEY7a8snySanblxKa0G2g=;
        b=UudfPWwLqcl7cJS32FfFLjcW/06TYUA6JKvcAUhHqVO9G3jXvUp6vscIMG/D70o3r9
         Cm4NBfB3b2kdOrLlf1R1VTBjXqGVSbMeidlZx9xaqoaG4usDw1X8ttnDcRWHiJRGFXlW
         gszxO2Vux424MhPX9ZeWfFpp20pv7TWCWWE43uwYN5DvCFe5HnX0SnETqD4fFbYQ3HLk
         zMSS2U4Clfe32EIIvmeksTZOd7YX8rT1DUoaiBAJ/lOV849jhHVI04cdIA9O7NMw7vAk
         pO+CRlBch1ATekyuUtPPbHabS9fqW6uxtc1eczIftgDrymCfXpiahpQPEzu9LvMmshKl
         s+7Q==
X-Gm-Message-State: ACgBeo3gwaTHBeGS8fHK8OB/R2v3Pvg/Dq5kiCeeQkHfG0jz53zmHVD3
	RqLEKjHzOngjOPra9/Vqn/fH1w==
X-Google-Smtp-Source: AA6agR5ZHgeSnW5XK+mgnShl1BdOSPwjqbKb94qG4dgHKo3KiQskBMRdrJtDtsttOZ30SOZ9HrF0LA==
X-Received: by 2002:a17:90b:1b0d:b0:1fe:3993:2a82 with SMTP id nu13-20020a17090b1b0d00b001fe39932a82mr5096208pjb.155.1662015559648;
        Wed, 31 Aug 2022 23:59:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d65-20020a623644000000b0052d40c4c06esm12497770pfa.39.2022.08.31.23.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 23:59:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] fortify: Add run-time WARN for cross-field memcpy()
Date: Wed, 31 Aug 2022 23:59:12 -0700
Message-Id: <20220901065914.1417829-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=713; h=from:subject; bh=LeTil4IEruxaVe7mWfrPpEi0Vfjy7lWn1LjQi8mvjkw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjEFhCZb05sz6D+GQp3RqFe9s96Vb19uXf8nu3+B/3 K+EZyvaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYxBYQgAKCRCJcvTf3G3AJi02D/ 9A5CVWpB/R+rtBo9Hz69xc6KVgu9rGAbBRmVMjtYWVn4jtOxiPSLL8QvW0t+F8vkIgPS+RUnSfjZ/0 hAU1oLluzNcqNPSj+L+o3ZE3lT5Xiyqcr8goXd36TwOHZWUaEmUTsNqpOyacfC2URgDVGGv3f81HXC m5U4bxfDPCb5BT8oEEhXs+EnMqs5M71OKC4aVhtwv9NPX9Ah4fm2tSgVrp56GMEu+7maQGY0qwBxhB dW7MjQ4glVMJHiL+cIr1k4cv8G6rbH5Gim5R1TBsLDoalZws0NMeanliOh2uEJVju/0SPCvE/48Opw t/00snJqhXKOz5vO1+BvO58eGBDmkPVMKt9wNfagz81UM8FIZ00SJJdt4bHPvKyFFBJF4MbBUOLZTI cjc9glqVRIUaXO3FKCtPshmj8y8mIyieEWgi6QjZfK71EmSGyLVJK98BR5QnRZL08xI+iVEy0oqVSV HwoOnj8kFFns7arwq/q0lqlZhNBcVyS0WEI/gJ89LxMimKXuzoPesmuYtiHxx2HhJH+k2TRQpQpLE3 LbkkMEsGVvNwFnbEAFH/vrV+nAv7gFgoI/ncQT3bBwBjeZRSG12fXhXZrpT+j66OTFoxqr5kh09A1F 4ckTG6O2Wm6QL3oG/QSk+zkNQMRReyyLNpOsiB4/UEAF9Bmss0e2PtJ6+GBQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

I'm hoping to at least get this into -next to see how noisy it ends up
being. I've tracked down several false positives that are getting fixed,
but I'd like to see this get wider testing. For details, see patch 1,
but this is the run-time half of the recent FORTIFY_SOURCE memcpy()
bounds checking work.

-Kees

Kees Cook (2):
  fortify: Add run-time WARN for cross-field memcpy()
  lkdtm: Update tests for memcpy() run-time warnings

 drivers/misc/lkdtm/fortify.c            | 96 +++++++++++++++++++++----
 include/linux/fortify-string.h          | 70 +++++++++++++++++-
 tools/testing/selftests/lkdtm/tests.txt |  8 ++-
 3 files changed, 155 insertions(+), 19 deletions(-)

-- 
2.34.1

