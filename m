Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A864D
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 06:12:21 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso7070304otv.1
        for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xRBPID2afPJAp96OqaGvBdjqx78UAxNzgaJTyGjabr8=;
        b=fAsoPJBfZm1Q3Pe+7+Kgk49YdcBBzb5wbtHRNl3NBQ8lbJi6wNFGOyGP+hoP0LKlyB
         VYzze1ue1TiTDDgBtSEp6kziMzbSiH5Fii+zpt7cBoV90iAQvRLmQHESUpqo3Y2Wp0tT
         txhLSz77VhTqtxhPw3vHrTEWUE1Rg3dXr9mmw80FeRscTk39kroT1YD6ySvLqCPXYB/M
         jKGtS5Jkl9M0Xr8BvbyheUI4MSQ3LYilhkgfoy9UPRCTcOE8FZLGdRPd5ma1WAVAWUHJ
         rX8xGUAGM5/iqMLz3tWKZo8+A29cJCX4/zNpzemWmun70fPvCnhrk/oSR+OdcQSW3niU
         7edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xRBPID2afPJAp96OqaGvBdjqx78UAxNzgaJTyGjabr8=;
        b=1L2byRdqjXhMy7SDCh6v4F/XikEDkz644aNKakfQX4OvpdCDL1DXmhwKyWQ0ojna06
         LpTE8DUg/n/vQaSjEyvFOfKAYHtVmMCHyjz7OGg3j0mnC9TzQ2tMo7U1Ym0yguqPrxGS
         31gw8zU6FiYDDrfF+XDZrviR7pGe+BcMchSrHUBC+KmT0axLcFYEh8x1MPXgkSCgtFIO
         UMausQYGFK6mjxs3s+buc+RjCyWB9VVN97Y6CqIaCzkK4ghmidlAC2XooMOv4St+/COP
         chfxARmUQzkDopUSualLgYxR7rqQouQPcvHApeqdMeMiDInPLhaTMGh+PNNRDYrZnn7l
         hkIg==
X-Gm-Message-State: ACgBeo3VhonNFPkVoBY+FXG5VnDar9hM+OzptOvQV1NyfM2bgq5K8b4C
	7SfvmI4JdmrVyZYT+Trbmq04eOD1WNCXj5Qqvgc=
X-Google-Smtp-Source: AA6agR5/3lpDfPcI8hjqmqqJiTVbPVyi0UuVROvgrbHtJM/EtFwkEW7IgrfmM3wwNBrbhTG/o1jOsrLr57VaSHZoKMc=
X-Received: by 2002:a05:6830:2a8e:b0:638:c41c:d5a1 with SMTP id
 s14-20020a0568302a8e00b00638c41cd5a1mr7455068otu.367.1661148740694; Sun, 21
 Aug 2022 23:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAADnVQJFc9AnH_9CW+bSRotkKvOmkO9jq-RF6dmyPYOpq691Yg@mail.gmail.com>
 <20220819190640.2763586-1-ndesaulniers@google.com> <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
In-Reply-To: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 22 Aug 2022 08:11:44 +0200
Message-ID: <CA+icZUUX1gPvnExa=zyVqB8xYOTai+nfHp6E7+qRE2mXXa2M=A@mail.gmail.com>
Subject: Re: [PATCH v2] asm goto: eradicate CC_HAS_ASM_GOTO
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Borislav Petkov <bp@suse.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 21, 2022 at 7:13 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Applied directly, just because I love seeing old nasty stuff like this go away.
>
>              Linus

Hi,

Small nitpick:

--- a/arch/x86/include/asm/rmwcc.h
+++ b/arch/x86/include/asm/rmwcc.h
...
-#if !defined(__GCC_ASM_FLAG_OUTPUTS__) && defined(CONFIG_CC_HAS_ASM_GOTO)
+#ifndef __GCC_ASM_FLAG_OUTPUTS__
...
-#else /* defined(__GCC_ASM_FLAG_OUTPUTS__) ||
!defined(CONFIG_CC_HAS_ASM_GOTO) */
+#else /* defined(__GCC_ASM_FLAG_OUTPUTS__) */
...
-#endif /* defined(__GCC_ASM_FLAG_OUTPUTS__) ||
!defined(CONFIG_CC_HAS_ASM_GOTO) */
+#endif /* defined(__GCC_ASM_FLAG_OUTPUTS__) */

Shouldn't that be...

#if !defined(__GCC_ASM_FLAG_OUTPUTS__)

...to fit the 2 comments?

Best regards,
-Sedat-
