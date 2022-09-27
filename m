Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1E46B4
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 17:04:03 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so10626684pjh.3
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QmJLfS9I7/XuHeCFFZi2uIbypQ74PjFxFiPtGwFHQJ8=;
        b=BxjMcXoLXoNYNUPdzcbi/78Oibd6uaYGwAlT8y0Nl0Hyq3vNOU9bMt4uF9NcUiv9Xg
         Lo2IUTtZg9tGzwyhsReuYpMV0kcB+8smOYpUn+VTYvnertSyaknGZxR/2u4aHVc8T752
         sGdNueCTpO5Fw0Zkvv3aVb0IesMI+RGjx09QW5+YqY0iaQueORggUv5/R7GmR+kmFfzW
         9wUwEJwK2HJNIS7wEEjf+EWxRjlWGDdSc+BdqjzyQRDiIBPDZ3E8a1V3z199kRTBZdWp
         xm5SC0ITCZYd0EKOZKej5BzisjHpu0ECjWRPBR4fXKFex6Ypwlux617XNqq1x1055oxM
         MkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QmJLfS9I7/XuHeCFFZi2uIbypQ74PjFxFiPtGwFHQJ8=;
        b=gWEJNReVWpNxz43WC+QgQIcBi6r63vMskvKap5n5f/3W8v+5I2nNtOuA0lDvVsw0lS
         Cd4J38h9Fc9fhShJk4SLo/ATXyxOWS9h+Ay3f4CWEVw0yTcdYa9vRV2rfK2ovN+C8Iwy
         wHadX/7N6UtHam5SzJsStr/rpqSCvP6tukf9Kxw69CdALAH7Tt4P/tiLvJTVkElo+Coe
         wB8WSDNvIuv5jIvhchRx/g3qEDwPdrGhf+NX24r0iJ3pomrAmH3ruJPgUwrjVJpbAvXV
         z/bc/wUqmVcutjLxD5aDeSxVHAOUfXF5GifkI3oGi+7znG7Ogzx9nT17U5UudQ8o429g
         8PMA==
X-Gm-Message-State: ACrzQf37FbrBx/a9+9laj55hS/WKsMa/UMD9VcUXlsPnxpPHQaIxAxka
	5n/xNwrRfLoUTOrkSimN6KneLjX7RhRcPsovH2sfPA==
X-Google-Smtp-Source: AMsMyM6kYnpRlYHqWr7mBolKj7FIiU8kpVyQAGsF9gNj5/CQn5NeSQV/ko0g0gQ0HfgDCJcO4YZNzhyC/icWPmYVRyo=
X-Received: by 2002:a17:90a:74c4:b0:203:336d:dd36 with SMTP id
 p4-20020a17090a74c400b00203336ddd36mr5470661pjl.107.1664298243152; Tue, 27
 Sep 2022 10:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220923170218.1188423-1-ndesaulniers@google.com>
 <CAHk-=wiAwEA5KekL4+t+v6qAdKLSOQvBkGbumvk+Rxhaay8aFg@mail.gmail.com>
 <CAKwvOd=r+9X6JkikpuTvjdTn7DXusevoJBFjXtGQ1SZYCZ6f6g@mail.gmail.com> <CAHk-=whknQuJCqbzjtBrkjGOPrZPX6fjv8HSms2p0kw-NTdMZA@mail.gmail.com>
In-Reply-To: <CAHk-=whknQuJCqbzjtBrkjGOPrZPX6fjv8HSms2p0kw-NTdMZA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 27 Sep 2022 10:03:51 -0700
Message-ID: <CAKwvOd=a+0VNP-d=mHnbM4ujdtPrujru4dxHtfDo+EEM+b6deg@mail.gmail.com>
Subject: Re: [PATCH] x86, mem: move memmove to out of line assembler
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Oh, yeah my patch essentially _is_
commit 9599ec0471de ("x86-64, mem: Convert memmove() to assembly file
and fix return value bug")
but for 32b (and no return value bug).  I should probably amend a
reference to that in the commit message for this patch.

Also, I'm missing an EXPORT_SYMBOL in my v1, so modules that reference
memmove will fail to build during modpost. v2 is required.

On Fri, Sep 23, 2022 at 11:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But I'm looking at that x86-64 memcpy_orig, and I think it looks
> fairly good as a template for doing the same on x86-32. And we could
> get rid of the duplication on the x86-64 side.

Is the suggestion that 64b memcpy_orig could be replaced with __memmove?

Sorry, I'm not sure I follow either suggestions for code reuse opportunities.

Also, any ideas which machines for QEMU don't have ERMS for testing
these non-ERMS implementations?

>
> That said, your patch looks fine too, as a "minimal changes" thing.
>
>                 Linus

--
Thanks,
~Nick Desaulniers
