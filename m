Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B805F9D1
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 20:37:28 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6bb31d6276cso1675789a34.3
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 13:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690231048; x=1690835848;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ7trwGgOy74ZMmx1WSYkhxwukYNWfMR8FKYB/XHJWk=;
        b=UxI8FoA0MP8P8mxbNF+5uhKh7teNPXsbOjZ/7ntRKSZydj/68i2SwO1HzrrZmsjsy8
         UEUiAf2xpacdhiLExPCsjq4NRvSoAh9SfeAk6Ues1jxYWkaDJidI0uZ3Jr82DzEtc3qh
         W+zk4NlZ4YpzewfuWymDQsTRLPtZrvzycp7r0A9+5WI+t/sLwB5bjUuvpeyOzUqXNcdi
         VYDMKWBvCuxNOcvzGfCu677kWacFkfQ++dviziGD3PyB2c0+dCAu+SeoEDZBo3NBI29l
         sZOkGpkmys4zcTbTVODcw39ygJGkpEal1fTpep6SjSwHFmoBU1ogBk9whu8GwuY1GBQK
         6XLg==
X-Gm-Message-State: ABy/qLay6QRjoTyGOia8r7RY4tJpHAU7OERTHomrRqnhSWPkTyZD4CHA
	YZBl7Vt/Cs/4zX0Sdx1nHjWOvQ3D6SJoWTJFeOYhnbP2AeQ7
X-Google-Smtp-Source: APBJJlFWQnGftlrdER0j6SIMnKqOAkXNGK//D4qIZMkaaSZT9cyUVxOEEr75aCJTNAtgB0vgDsd0BSkGhTjvPdwIAwtEiZ9CyWSu
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a9d:68cc:0:b0:6b4:5ee1:a988 with SMTP id
 i12-20020a9d68cc000000b006b45ee1a988mr11110645oto.5.1690231048090; Mon, 24
 Jul 2023 13:37:28 -0700 (PDT)
Date: Mon, 24 Jul 2023 13:37:28 -0700
In-Reply-To: <ZL7fhuAHmlcEHj73@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000035b866060141957e@google.com>
Subject: Re: [syzbot] [modules?] WARNING in init_module_from_file
From: syzbot <syzbot+9c2bdc9d24e4a7abe741@syzkaller.appspotmail.com>
To: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, mcgrof@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/gpu/drm/bridge/samsung-dsim.c:730: undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'


Tested on:

commit:         910e230d samples/hw_breakpoint: Fix kernel BUG 'invali..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
dashboard link: https://syzkaller.appspot.com/bug?extid=9c2bdc9d24e4a7abe741
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Note: no patches were applied.
