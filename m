Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670712C83
	for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 00:31:53 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r138so2288204pgr.13
        for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 16:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxGWmTZwHsm0RN01kjRmL3HzDw86SFLpP/0ZpXpaZRc=;
        b=mqLPe+mzN9Dl/E2s2wRLW9ghNZxzkxV9cQ7rzDcRi9/vEWM/1M/T9ZtHoNE4KsrZ5j
         0dUrpsPnoEXXwUde09T2wZxbStgM88DZvGgmc0978ncxOd0TJDgINT5vSKtNkNjbTJUo
         9aK6twgJ7kHLOHU+XH7Ad1bYAiBkodz9okdE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxGWmTZwHsm0RN01kjRmL3HzDw86SFLpP/0ZpXpaZRc=;
        b=Mb1f4aUJtuTcIU3dHoDCmrOYweZRSR01qOXKA6XBxOlvuMn+yoKMEkySAI3eJWi+3g
         dTTe5F2AJkiJUFnWJsQX6487y7QqqRY+jM9AwRG/viTAkj+AyoikLVJOOSkp8Xfn/syg
         LX2V2yLXppOInh/NM+jA/U1oNxQ0Cq9OhnmPKArwOBqUxfOW9fSIwZD6obDp0eTdanZO
         7x/srFRPbUTXu4HER3yT7qlRL3p8U+6F9dLoAPzlE0X1GElU6nSw8abD2NofFzxIvugX
         KWYZWCfvyFalQDqZHhIxf1wcsXOtK6NlZy/OXX0Se2fnnB7mhlbWiXfJ5GAgM/LJXNLW
         GxJA==
X-Gm-Message-State: AOAM532yty0FAN3/f7dWuilISD0IEi9ZTKLPVoLSiEFEosZFmf7DEKFi
	iFgezkLOkYXchDg1wHZbvpPOzg==
X-Google-Smtp-Source: ABdhPJx48K+tBtBfbJQf3sSRXIucI8Y6zCrUy5h3//aCrSN9nw8UbzVlU9gBgDoTvSGJtDP7M2mUdg==
X-Received: by 2002:a05:6a00:2351:b0:47b:d092:d2e4 with SMTP id j17-20020a056a00235100b0047bd092d2e4mr73088775pfj.76.1637454712802;
        Sat, 20 Nov 2021 16:31:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j127sm3932775pfg.14.2021.11.20.16.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 16:31:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Alexander Lobakin <alobakin@pm.me>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Marco Elver <elver@google.com>,
	Willem de Bruijn <willemb@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Cong Wang <cong.wang@bytedance.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Talal Ahmad <talalahmad@google.com>,
	Kevin Hao <haokexin@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Vasily Averin <vvs@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 net-next 0/2] skbuff: Switch structure bounds to struct_group()
Date: Sat, 20 Nov 2021 16:31:47 -0800
Message-Id: <20211121003149.28397-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; h=from:subject; bh=JyIoux+3mSqRrP5c5yAm1k2PCuE3ujZ9X+hh+TTSdkw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhmZN06M3ei451eaMBJ4tlO/hieAlz+BhYFDkIdlX1 eX61FpWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYZmTdAAKCRCJcvTf3G3AJtbrD/ 9eR2KNvgCn/YPwypnUGU/RNNqA4O4bYEFLj4ElzB1qqQlG2RgJdcz+rq2yQisqqs16klI6tC11SBhN W7udXMhGJ+Py7w1vVEBAjVNZmGKGlJXE5U8WAHjfZcQac0sOe4DaoyxEKDhZ4dVEtfM9n+INWySh7M uDr1c3vaP+cgXlX5lMFiVoFtjG416sLde9ZZ8i/AAoEtj13SqOYM69cCvB3ZV5sD6z171ju8LuL8V0 0/gPsQggl4r2PI9mSi0ATgA4nL9uxPXZ+WimwvtpoW3euJOXl3R5qx7YEJpMVEhQb+h7bsHU8+554G Mr/5XtAumV32/xkgbaaZzuXsqDpE7wlAaVucANa3AQEj21s9tjkelAJu7HA0AlFNxD1vdytn7CWZlk pZMaqvAW5drzcrEzYLOo+fXRjVbz/qGY1eHIl8O1AdM1Yl5bxOyoHeJ6+Bh5Bgajfi3DtMZFSy3y9b OpoS11g+KF4T5o4t9R3wBjQCyP+hGBmGNCpm6N3kBHTnOLW1hoF9P7WSGHblOL5gn/lWS1rXatOn5H Vacu7NXyluL8MFDh6ynTM7+DGECqimJOIry6vmwHNkpv8jjqqF+jTWDoJGkFAn2/aA49Zpg/XonIcy 94jGLJObRNcJnXtDPIWtQUQA7/UNnVofu/gJMtbIHUh4j4L/74FL/AmwVMfg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This is a pair of patches to add struct_group() to struct sk_buff. The
first is needed to work around sparse-specific complaints, and is new
for v2. The second patch is the same as originally sent as v1.

-Kees

Kees Cook (2):
  skbuff: Move conditional preprocessor directives out of struct sk_buff
  skbuff: Switch structure bounds to struct_group()

 drivers/net/wireguard/queueing.h |  4 +--
 include/linux/skbuff.h           | 46 +++++++++++++++-----------------
 net/core/filter.c                | 10 +++----
 net/core/skbuff.c                | 14 ++++------
 4 files changed, 33 insertions(+), 41 deletions(-)

-- 
2.30.2

