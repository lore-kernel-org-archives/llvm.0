Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26591396
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 09:16:22 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id t15so17968815ybq.4
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJZw00JqIDxZsH6vnh8PN+9M8r5KlwJJ+NaoX/4aFqY=;
        b=DIk2ZbXAGqxIc98kTjzGTVFpdPsR+Vj+7STCldjr7kKAsQMHIDY6XZuyjF9Ycpq5n+
         cjIhUcyrpttqhYnUX250OHS59gBEMg+8/n021gZ0xYc2j1lK+frz2V8qycTk6QMDr38o
         mrMyDdPz6wExrKzN/V6B7S5+DXxaauBFz015mq2I8tk61GytE96CmJoVr4rfhu9g1Jt5
         X7i+iGPOV/EM3u8+4zRRYkQp3wr9SJI9h7E+8lTSErtrHkGgm/3Ju5T/L0K+3QsXj8Tl
         lYIaPDLjxw34ipX/x4xh9MpShxkSKemI2PIEMXbD5t2wJvLGWC7k35qCkFUY1kksUM+d
         reVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJZw00JqIDxZsH6vnh8PN+9M8r5KlwJJ+NaoX/4aFqY=;
        b=7tmFv9F/P4s9INxH8cg7T98DTYRoLALzbfP8Ttn2H/J2ucXxxuvPrSGcMRPzjv+iuu
         MTH7D+uffH2U3oI21bB+wDUBIBLTIc6xM9JqUeEcYA5dLt2JJnTn1VbmWtPg/7UU2tYl
         n0jejx3aZskZqbbVDxu83F3N2A7a3e2uQKPlkHQNQCv7E9GzsavGGh+0f/XAtPMsq55A
         yeyWYyy/VRiMt5zXmPk40ZJeCPzGnzzQ0lM5E8PH5kHQxm47Sn1z6fy0Z33ZWfY1t31F
         RIaup6x0YqhgDdP6Xj6VDotu6A+jxhdx5MCEA7+OD/tcVYy5Yfb6HooW5dcnXqWkS+rj
         tIbQ==
X-Gm-Message-State: AFqh2krsGNyNfZJT8AFGPeCpNJqCC+gOmMUlFn5GfO44aUZ4WbmOJpc3
	z2iu97jflMJ4rp0ngggNVqRGwrce4RMU2Kicmcnbvg==
X-Google-Smtp-Source: AMrXdXt2lVd6aozoCXeSt7NSXmiNzaXsWeeyaX9h6lphmB1XW0lYoL40g5Ni8QumcqWq083M2Et4gXna6qIiPWAonH0=
X-Received: by 2002:a05:6902:1c1:b0:7c9:71e:e241 with SMTP id
 u1-20020a05690201c100b007c9071ee241mr139273ybh.242.1673514981561; Thu, 12 Jan
 2023 01:16:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301020356.dFruA4I5-lkp@intel.com> <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
 <CAG_fn=XmHKvpev4Gxv=SFOf2Kz0AwiuudXPqPjVJJo2gN=yOcg@mail.gmail.com> <953dda90-5a73-01f0-e5b7-2607e67dec13@suse.cz>
In-Reply-To: <953dda90-5a73-01f0-e5b7-2607e67dec13@suse.cz>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 12 Jan 2023 10:15:45 +0100
Message-ID: <CAG_fn=Vz47zvCDoUENX5kH7Giena+w=yifWbMo28ayAUKU7kyQ@mail.gmail.com>
Subject: Re: mm/kmsan/instrumentation.c:41:26: warning: no previous prototype
 for function '__msan_metadata_ptr_for_load_n'
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Would it also make sense to exclude KMSAN with CONFIG_SLUB_TINY?
>
> If the root causes are fixed, then it's not necessary? AFAIK SLUB_TINY on=
ly
> indirectly caused KMSAN to be newly enabled in some configs, but there's =
no
> fundamental incompatibility that I know of.

So far I couldn't manage to boot KMSAN with SLUB_TINY, it just dies
somewhere very early with the following stacktrace:

#0  0xffffffff9044134a in native_halt () at ./arch/x86/include/asm/irqflags=
.h:57
#1  halt () at ./arch/x86/include/asm/irqflags.h:98
#2  early_fixup_exception (regs=3Dregs@entry=3D0xffffffff8fa03d08,
trapnr=3Dtrapnr@entry=3D14) at arch/x86/mm/extable.c:340
#3  0xffffffff903c23db in do_early_exception (regs=3D0xffffffff8fa03d08,
trapnr=3D14) at arch/x86/kernel/head64.c:424
#4  0xffffffff903c214f in early_idt_handler_common () at
arch/x86/kernel/head_64.S:483
#5  0x0000000000000000 in ?? ()

The same kernel boots (to some extent) without CONFIG_KMSAN, so my
guess is that we're instrumenting something that is not supposed to be
instrumented.
But SLUB_TINY doesn't add new source files, and it's also unlikely to
kick in before mm_init(), right?

--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
