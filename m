Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1FB629
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 15:19:30 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so80542383a12.0
        for <llvm@lists.linux.dev>; Thu, 11 May 2023 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1683818369; x=1686410369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJpRi8U4anHxP91Og34clDJuvOhSvC/Ny6ZY6fVS6NA=;
        b=TmbsosqpHKsbyV71znStNqd9RFeitV2eXYJsFJpgGLAWKEAdwqfW53ks0v0R3avk2a
         OghVcmxL6fmRRmfoUA4i/6v/wgDgTX0cvj9AUrkOz/zF7mPs0BqHfcVS2hkuwk6XwS/l
         tgMfDkjGR3PYqyeIZy8t1VHU63NOqSI8LZ6E9Z0I7c7m6chu1sFS75o4OdKGtCdxWUy8
         oaGw6twk/jGvsUjdobAivroaAm9uEvUB5AgLXUEtT6Q+Mx6aT+2IUSp37uPhTN+O+//J
         sDyoZFGrkuM56fa5LetP7SulRGvgVJuU++QlN4eWnma9MIYk0XJiH3dWLRUMrxLfbRML
         2kdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683818369; x=1686410369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJpRi8U4anHxP91Og34clDJuvOhSvC/Ny6ZY6fVS6NA=;
        b=Wa74uYhg5PVCYU4xdHsPJZtORC0XUPxYBXP5CYkaMSfh/jmDtqAqu4ZZF7b3Vu3ytI
         0qLUIz+/KwFtqFfBzmbOyU5EZK6Ay8bEBJ1u0p5Ph932rdWdz+jRnbWWDuzKRA8mJphM
         mIqCClXNuHeLq4UK+ZsxC+ie7h89JKGYpqXHVjLsmfctqJRrf2oBP7shJSrGho0KA2h6
         IivUHw2vha7XH/8HTHXDQaeuNv6SCbwmJFudX9NocxXh2mXl/H3ssoeOtxndxgDVHPLJ
         WGcCOV7DgQgQOHJaVVpQSqwb6QHVqt8v6BdNs8UDDZPJw6/uJaFiHwOh1JG7lHIwI7v3
         O82A==
X-Gm-Message-State: AC+VfDy2Ac0wMEi6t4EK4Pp3Lt8lqQJX/BC6ufo9Akmmxcj8QmViLHqp
	FWYVHV2eKpfoSkovZmQnbz7JeIGSLQgxTwQ90sdDmw==
X-Google-Smtp-Source: ACHHUZ622cGWEkiUpT7RoLmMpy0Uatilmpa5SvU9Xkc1QW1rLBsLFS38+mmhk0wsxGczsQ251uXMbzXui36AgnhTh7U=
X-Received: by 2002:a17:907:8a08:b0:969:2df9:a0dd with SMTP id
 sc8-20020a1709078a0800b009692df9a0ddmr12191725ejc.25.1683818368935; Thu, 11
 May 2023 08:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000019af1d05fb5fdd99@google.com>
In-Reply-To: <00000000000019af1d05fb5fdd99@google.com>
From: Lorenz Bauer <lmb@isovalent.com>
Date: Thu, 11 May 2023 08:19:17 -0700
Message-ID: <CAN+4W8jFTcnS-EBppkoRXmfzUOgiGNwBku69==-b-Z_2fDHfUw@mail.gmail.com>
Subject: Re: [syzbot] [bpf?] KASAN: slab-out-of-bounds Write in copy_array (2)
To: syzbot <syzbot+d742fd7d34097f949179@syzkaller.appspotmail.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 5:14=E2=80=AFPM syzbot
<syzbot+d742fd7d34097f949179@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    950b879b7f02 riscv: Fixup race condition on PG_dcache_cle=
a..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux=
.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17eaa0c628000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Decebece1b90c0=
342
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd742fd7d34097f9=
49179
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, =
GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/5=
ab53d394dbf/non_bootable_disk-950b879b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/938475579d6c/vmlinu=
x-950b879b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/bcf263d8c574/I=
mage-950b879b.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+d742fd7d34097f949179@syzkaller.appspotmail.com

That tree doesn't have the fix yet:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/tree/kernel=
/bpf/verifier.c?h=3Dfixes&id=3D950b879b7f02#n1065

#syz fix: bpf: Always use maximal size for copy_array()
