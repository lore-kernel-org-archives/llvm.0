Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F858469
	for <llvm@lists.linux.dev>; Fri,  4 Nov 2022 16:26:41 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e129so4788010pgc.9
        for <llvm@lists.linux.dev>; Fri, 04 Nov 2022 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl/MFnMZWToBmu5A4jVqt8zL5+NKQFzCISCwYnVAW2Y=;
        b=PQdq7E71ycg0gOwLD2lncqKFIIQ9DNU4sK+LFxXU88WpDYN733tfqEj0iR4vZAKh+g
         2GtEi07IMbGTx89JVyqW4en1DSpSnQMnEIa+QpF0SrRorfxokN3/mjlenOYRMuvs7gt2
         jK8rhBVoUDPH1SMbGkSvEpbV6Q3+FPC4k7nEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vl/MFnMZWToBmu5A4jVqt8zL5+NKQFzCISCwYnVAW2Y=;
        b=DnuHFaJnbq5prghSt/ndoH5aJH599PGq0A+cyDY5Jix6bJzx8yxoH86qjimz6Jbwl+
         8ajqC94+5QezLG9HGi6azGd2oNU4SCP9CrzlCNSmhxi/HS/CpjpgnHXBl+QEHRRIPKVZ
         1kKfqR+qE8DsdmdbbHdHZJkHwTy0mtTgyWDT9Fvun+zEH1ZAHSLuW8qG0mQnZW2wWFJS
         CV3wH6PElbQuRM9GgEwcabLabf7ynYFW3e2OsPdVhHsHUpTyK2mjYz0px1DA125/amDe
         YcCdyJj1MHyINNx/5YtIsFZlNzsJRSuw/ALrHQZUgfzEMj5l2wIaJQpbaKDQboqBfuJl
         6R6w==
X-Gm-Message-State: ACrzQf1wmFibaNtTAN9pHKPP8Rq40wZsMcYGqy6F9OdJ1JntNy5Abh1j
	j47e/xyJw7RgaG24VVZ5Qu41eyhB2hSXIg==
X-Google-Smtp-Source: AMsMyM4cVgTe4Ak7y9MLEhk5QYQz3506Yk94FQT+AjVk3TLswCnDvtG5MCqa67zwxU1riSTtyNk/6g==
X-Received: by 2002:a05:6a00:993:b0:56c:80f6:db5 with SMTP id u19-20020a056a00099300b0056c80f60db5mr36279550pfg.45.1667579200953;
        Fri, 04 Nov 2022 09:26:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c16-20020a170902d49000b0017854cee6ebsm2921403plg.72.2022.11.04.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 09:26:40 -0700 (PDT)
Date: Fri, 4 Nov 2022 09:26:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [GIT PULL] hardening fix for v6.1-rc4
Message-ID: <202211040926.0E7BBDB1@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this tiny kernel hardening fix for v6.1-rc4.

Thanks!

-Kees

The following changes since commit 72c3ebea375c39413d02113758319b74ecd790bd:

  overflow: Refactor test skips for Clang-specific issues (2022-10-25 14:57:42 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc4

for you to fetch changes up to 6f7630b1b5bc672b54c1285ee6aba752b446672c:

  fortify: Capture __bos() results in const temp vars (2022-10-28 16:07:01 -0700)

----------------------------------------------------------------
kernel hardening fix for v6.1-rc4

- Correctly report struct member size on memcpy overflow (Kees Cook)

----------------------------------------------------------------
Kees Cook (1):
      fortify: Capture __bos() results in const temp vars

 include/linux/fortify-string.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
Kees Cook
