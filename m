Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95A7C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:17:17 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2d11b6259adso214148807b3.19
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ig5mQ0gyC0oce1d/Zy8bEsqqFhtDY79w4cUoB0YUJhk=;
        b=V05U+x4LNh+To0zL8TXuNjeoTipGUWzS4C+mJRGY7QgduElSX56iUMHvUvLMhzjI09
         E+x7NCxoYFqVyFXI1TlmbTkoG0K6EXcMKlrYySH1QuvGlP37jlNn3/LNPCdiYeEd0GEX
         LIv1t4Su+H6fvGFvlkkmP2vDMIKlG+WobBu9nm/V5Y5/3H69sLKj+5cEln+2znKR6SCR
         fC2/3m/sX6SBfZ7eQ1UCfi6CIHJU4yas6UeLgZ+2cIhzSthWxwnpXo5pPTasAbA9B0Xs
         rfxKIB3w7yzCPfuUTDB83U0KP/M39tuXj5LkDncm21ZIAnPkSh3VMh/A84ECTFd7kj87
         IbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ig5mQ0gyC0oce1d/Zy8bEsqqFhtDY79w4cUoB0YUJhk=;
        b=2PZsBc515+KhrqbG/9yXEcSatx0cOUConL8jbX65b/FGFw0dRrD9JOaq/QCifuJPJW
         zWqNhf2HKu7EI4STcXQR6cNwjMSCiSYlZnM5LmW7Ug/iL87pIQUe1XlNTns8f5/6ryAB
         wRWCsFokuvqEQsyjsY4QQJgRSHguT4WJoVtrVGZOgE5OI8OeabKrSY40YyfBKPEN/XoY
         QGjt8xUKHYtnOxlU9vAO0DB4I0CNuRTzgIIfWkUoNg3SxEVRpSJj4QYMVrsZPAUJbxo6
         IH84d4ZLOXpxjJcPNCgJ86BWLndEm1BtJqS5wlb2VEUqV6GbiDdJqr21k1WC5qPqVd2c
         occA==
X-Gm-Message-State: AOAM53187qMNgOHI5mxpPe338UUMiF3IM+51B89S9WvHWM/ayn99ZUND
	5xFzAghxCaOnxtFbyW+o6X+r2tee
X-Google-Smtp-Source: ABdhPJzwx5X0ZE/nM+u+DgO5va7z203Jwou06sjKdU0c0pt2CnSBxfb1v768IuoKgsISspKmOdai1Wxx4w==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a25:2985:0:b0:663:ec6a:4ff2 with SMTP id
 p127-20020a252985000000b00663ec6a4ff2mr14049602ybp.166.1654813036265; Thu, 09
 Jun 2022 15:17:16 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:19 +0000
Message-Id: <20220609221702.347522-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 00/12] Clang -Wformat warning fixes
From: Bill Wendling <morbo@google.com>
To: isanbard@gmail.com
Cc: Bill Wendling <morbo@google.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Phillip Potter <phil@philpotter.co.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jan Kara <jack@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ross Philipson <ross.philipson@oracle.com>, Daniel Kiper <daniel.kiper@oracle.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, alsa-devel@alsa-project.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This patch set fixes some clang warnings when -Wformat is enabled.

Bill Wendling (12):
  x86/mce: use correct format characters
  x86/CPU/AMD: use correct format characters
  x86/e820: use correct format characters
  blk-cgroup: use correct format characters
  fs: quota: use correct format characters
  PNP: use correct format characters
  driver/char: use correct format characters
  cdrom: use correct format characters
  ALSA: seq: use correct format characters
  ALSA: seq: use correct format characters
  ALSA: control: use correct format characters
  netfilter: conntrack: use correct format characters

 arch/x86/kernel/cpu/mce/amd.c       | 9 +++++----
 arch/x86/kernel/cpu/mce/core.c      | 2 +-
 arch/x86/kernel/e820.c              | 4 ++--
 drivers/cdrom/cdrom.c               | 2 +-
 drivers/char/mem.c                  | 2 +-
 drivers/pnp/interface.c             | 2 +-
 fs/quota/dquot.c                    | 2 +-
 mm/backing-dev.c                    | 2 +-
 net/netfilter/nf_conntrack_helper.c | 2 +-
 scripts/Makefile.extrawarn          | 4 ++--
 sound/core/control.c                | 2 +-
 sound/core/seq/seq_clientmgr.c      | 2 +-
 sound/core/sound.c                  | 2 +-
 13 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

