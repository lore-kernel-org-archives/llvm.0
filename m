Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C82C80
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 17:33:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a8so2806104pfa.6
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7h+kMvQchz+AoPV2FM/vL8Y/TYyKtPcf9ypfobGVKnY=;
        b=PHy4GgqKpjDxG02rHl/MQY3sUK0g6wb+yt12jn0BJL3wTgec8qbxCcOLpeY8npY3tJ
         f5bUpglH+1Lcih7Owe7h6mc+V2wgnaPXoxNzDSpJkjjPC8MpArsbk3zKcS5po8sZ/mqZ
         rhisk/Go7s/ywjgh9ORXvF2xjK2YnW6ewPR+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7h+kMvQchz+AoPV2FM/vL8Y/TYyKtPcf9ypfobGVKnY=;
        b=Vmago2jandd5kHpPflpZLLVSg0gABmdnVIg8EfcG3YcT2DQVgIDyNHPWDZWnGeK64f
         qloe5nL5E4zVYDLYGCZeyajD/CJ3jxzrd+P2NrL1e3YLc6f1IFHoarXRecLQup68ZFIo
         ikv9k+bPNeLeSe08d4S26Otll12/UYgPbRi7TDkSsa6i+B4fRx5wj2Eud9rV0a+RAdyR
         dDqPENODhN171RMaCbHE7pI5+djzwulzV8xIs5175UnldAkMFihoGr7r/1K7dQPw+Gk7
         1GBzwd2oRs4ci5AFwGhCsSWX2t0Dv8nlisFZAekLgFuBkv+HC916j45VEmfVHLTSsGoa
         i9/A==
X-Gm-Message-State: AOAM532EaYPA0qTG11Tz6MWM9iyH+teTVTAz1bsFPQsTlHCipGdv5GFo
	aepVZtbhvPia2aOcniM8fVcxTQ==
X-Google-Smtp-Source: ABdhPJwNmj59YXqdNUHNYF4RM/G9wDOf8BdoHn/6oXxpaxjIRG7bKOmSHWfVPScDu5yKFlstKRswQQ==
X-Received: by 2002:a05:6a00:a92:: with SMTP id b18mr34480193pfl.3.1643909589411;
        Thu, 03 Feb 2022 09:33:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 16sm10408471pje.34.2022.02.03.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:33:08 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v6 0/4] fortify: Add Clang support
Date: Thu,  3 Feb 2022 09:33:03 -0800
Message-Id: <20220203173307.1033257-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; h=from:subject; bh=6kU6WanqjoBPUumm/P0DvF5FKzthc4ynpCb/btOBAdk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh/BHRWQf7TUvbj1C/Ib0Gdow2yvtEVBucC0+3VRD2 B0yc7OqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfwR0QAKCRCJcvTf3G3AJpdyD/ 4jg/g7Yj98s2up2vl0ZR7m+fFMN8uft6bejiXjvARJHiq1H2nxrebunUyFzS8StdQW1ArE2bFvmY0T 4UXLOHeE+/6H8khSaH6zVAfRUBdNMYv7RB3CMpEVwtXFMdP/TJ89AdjTSTbW4SGNVzr4ST7Az1KFs2 NNWYxlIbiiojEN5I8cXiGcQxeSgZbYnESgc98CwSMyB6p4eOEeB762wtdyLGlvJtSnBIzFj0MB8B1A u8feBDXEtB2OW+Ju/QJlGxPrCN0Fi8yxsDimOW9mlsN+VNBwMmeXHXfuHugOh2+Ra10HkwNEYbQgu1 sXq0h630uFPu88FyD+ZRTgW006NKoDKTXZcH7lYfgbVtdHaTck+PLoho/dbonKjAqtv2lX9A00oZb4 5oglVB8K9smuN6vOFDpthWwS2zYBr2276G9qYRGMTbceg7I7pBT9xGemd3Gza2tXJ55J9wnAI/dxxe t8wH+1VG7C5B2NmyjYsmkOmlNXy+46XDMj+JNICXVvdZIGxRi1Lpo0BXO6np9toxkt1wJxNzsaOIxa lmZ93r4GnD4jOsHW4HToMQbvhsxCP4QADD/TFsm98fOYEZu3bb31UgnUz8YRhOFD8iVD6qguoBa6sm GGLQn8DVHVt9VELW67gV7oNGwfsuCs9SAJHjVOEzjx9FXgYAJohdp43/ISEA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This has been updated from feedback on the v5 series. Builds correctly with Clang 12.0.1
too now. :)

Thanks!

v1: https://lore.kernel.org/linux-hardening/20210727205855.411487-61-keescook@chromium.org/
v2: https://lore.kernel.org/linux-hardening/20210818060533.3569517-64-keescook@chromium.org/
v3: https://lore.kernel.org/linux-hardening/20211213223331.135412-18-keescook@chromium.org/
v4: https://lore.kernel.org/linux-hardening/20220130182204.420775-1-keescook@chromium.org/
v5: https://lore.kernel.org/linux-hardening/20220202003033.704951-1-keescook@chromium.org/
v6:
 - clean up comments in attributes (ojeda)
 - moved const into pass_object_size macro
 - adjusted Clang version to 12.0.1 (ndesaulniers)
 - cleaned up Clang comments (ndesaulniers)

Kees Cook (4):
  Compiler Attributes: Add __pass_object_size for Clang
  Compiler Attributes: Add __overloadable for Clang
  Compiler Attributes: Add __diagnose_as for Clang
  fortify: Add Clang support

 include/linux/compiler_attributes.h | 39 +++++++++++++++++++
 include/linux/fortify-string.h      | 58 +++++++++++++++++++++--------
 security/Kconfig                    |  3 +-
 3 files changed, 83 insertions(+), 17 deletions(-)

-- 
2.30.2

